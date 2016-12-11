From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 11 Dec 2016 20:24:56 +0100
Subject: [Buildroot] [PATCH] usbip: add a new package
In-Reply-To: <CAFDyS3OkzvjXUkcOVd1FWy4Q4tWy+gOe=1DA5aJZk=0oCex+fQ@mail.gmail.com>
References: <1481272671-6491-1-git-send-email-tal.shorer@gmail.com>
 <20161211135617.GB3599@free.fr>
 <CAFDyS3ON-Wc-wzKZ4Le81Ak7z0wOpxYbH0hURobu38S87gXUcg@mail.gmail.com>
 <20161211174528.GD3599@free.fr>
 <CAFDyS3OkzvjXUkcOVd1FWy4Q4tWy+gOe=1DA5aJZk=0oCex+fQ@mail.gmail.com>
Message-ID: <20161211192456.GF3599@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tal, All,

On 2016-12-11 20:31 +0200, Tal Shorer spake thusly:
> On Sun, Dec 11, 2016 at 7:45 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> [--SNIP--]
> >> I tried getting this hook to run, but since the site method is "local",
> >> the package just gets rsynced. However, trying to add this to
> >> USBIP_PRE_RSYNC_HOOKS doesn't help either because the rsync rule checks
> >> for the source directory before calling the PRE_RSYNC_HOOKS.
> >
> > Damn it...
> >
> > I think this is a shortcoming in the rsync method: the hooks should be
> > called even before we try to run-or-test anything. I.e. the hooks should
> > be called before we do the test.
> >
> > Care to send a patch for that?
> >
> > Regards,
> > Yann E. MORIN.
> >
> done.

Thanks! :-)

> Should I wait for that patch to get noticed or should I just
> send what I have with PRE_RSYNC_HOOKS and expect that the error will
> "fix itself" when the other patch gets in?

You can just send the patch now, and add in a post-commit log that the
other patch is required first, i.e. in your commit log, add a three-dash
line and the message after it, like so:

    package/usbip: new package

    usbip is part of the linus tree, so it should be part of the
    linux-tools infra. However, it uses autotools, which are rather
    difficult to use in the linux-tools infra.

    So we make it a proper, separate autotools package. We only rely omn
    the kernel to be extracted and use that as the source.

    Signed-off-by: You

    ---
    Note: this requires that the patch to fix the hook order in the
    rsync command (https://patchwork.ozlabs.org/patch/704859/) goes
    in first.

And cherry-on-the-cake, make it a reply to that patch, with --in-reply-to
when sending the patch.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
