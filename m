From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Oct 2014 19:34:30 +0200
Subject: [Buildroot] [PATCH buildroot-test 1/8] autobuild-run:
 check-requirements does not need to know the login details
In-Reply-To: <CAGduivxXvJcnD-x9MBfVApkL3V0yFwiM-Ei3oHqnPsGAoFq=mg@mail.gmail.com>
References: <1413486964-5183-1-git-send-email-patrickdepinguin@gmail.com>
 <20141017222009.GQ3971@free.fr> <54426D4A.8050802@mind.be>
 <CAGduivxXvJcnD-x9MBfVApkL3V0yFwiM-Ei3oHqnPsGAoFq=mg@mail.gmail.com>
Message-ID: <20141018173430.GD31723@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2014-10-18 15:52 +0200, Maxime Hadjinlian spake thusly:
> On Sat, Oct 18, 2014 at 3:38 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> > On 18/10/14 00:20, Yann E. MORIN wrote:
> >> Thomas, All,
> >>
> >> On 2014-10-16 21:15 +0200, Thomas De Schampheleire spake thusly:
> > [snip]
> >>> @@ -553,8 +553,9 @@ if __name__ == '__main__':
> >>>      check_version()
> >>>      sysinfo = SystemInfo()
> >>>      (ninstances, njobs, http_login, http_password, submitter) = config_get()
> >>> -    check_requirements(http_login, http_password)
> >>> -    if http_login is None or http_password is None:
> >>> +    do_send_results = http_login and http_password
> >>
> >> I was told that we should no treat 'None' as 'False', or a non-empty
> >> string as 'True'. This should be something like:
> >>
> >>     do_send_results = (not http_login is None) and (not http_password is None)
> Just for the sake of it:
> do_send_results = (http_login is not None) and (http_password is not None)

Yup, I forgot that '... is not ...' is preferred over 'not ... is ...'

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
