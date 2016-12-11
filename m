From: Tal Shorer <tal.shorer@gmail.com>
Date: Sun, 11 Dec 2016 20:31:36 +0200
Subject: [Buildroot] [PATCH] usbip: add a new package
In-Reply-To: <20161211174528.GD3599@free.fr>
References: <1481272671-6491-1-git-send-email-tal.shorer@gmail.com>
 <20161211135617.GB3599@free.fr>
 <CAFDyS3ON-Wc-wzKZ4Le81Ak7z0wOpxYbH0hURobu38S87gXUcg@mail.gmail.com>
 <20161211174528.GD3599@free.fr>
Message-ID: <CAFDyS3OkzvjXUkcOVd1FWy4Q4tWy+gOe=1DA5aJZk=0oCex+fQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Dec 11, 2016 at 7:45 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
[--SNIP--]
>> I tried getting this hook to run, but since the site method is "local",
>> the package just gets rsynced. However, trying to add this to
>> USBIP_PRE_RSYNC_HOOKS doesn't help either because the rsync rule checks
>> for the source directory before calling the PRE_RSYNC_HOOKS.
>
> Damn it...
>
> I think this is a shortcoming in the rsync method: the hooks should be
> called even before we try to run-or-test anything. I.e. the hooks should
> be called before we do the test.
>
> Care to send a patch for that?
>
> Regards,
> Yann E. MORIN.
>
done. Should I wait for that patch to get noticed or should I just
send what I have with PRE_RSYNC_HOOKS and expect that the error will
"fix itself" when the other patch gets in?
