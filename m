From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 5 May 2018 17:58:53 +0200
Subject: [Buildroot] [PATCH] package/busybox: disable setfattr when attr
 package is enabled
In-Reply-To: <87tvrmuxvw.fsf@dell.be.48ers.dk>
References: <20180504203726.19657-1-yann.morin.1998@free.fr>
 <87tvrmuxvw.fsf@dell.be.48ers.dk>
Message-ID: <20180505155853.GD14524@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2018-05-05 13:48 +0200, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > The install procedure of attr is kinda borked: it does not unlink any
>  > existing destination file during installation, but directly wites into
>  > it. So, when busybox is instaleld before attr and installs its applets
>  > as hardlinks, attr will overwrite the setfattr file, thus borking the
>  > busybox binary and all its applets.
> 
>  > So, when the attr package is enabled, we disable the setfattr applet.
> 
>  > Fixes: #10986.
> 
>  > Reported-by: mzweerspenko+bugzilla at gmail.com
>  > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  > Cc: mzweerspenko+bugzilla at gmail.com
> 
> It would be nicer to instead fix the attr build system. I took a quick
> look, and the problem seems to be that installation is done with their
> own install-sh script which uses cp (and no --remove-destination).
> 
> I *THINK* a fix would just be to change the 'INSTALL =' line in
> include/buildmacros to use normal install instead of this install-sh
> script.
> 
> Could you give that a try?

I'm first going to bump to the latest version, 2.4.48 (from 2.4.47),
because 2.4.48 has had a complete overhaul of its buildsystem.

If that gets too comples, then I'll try to fix the current attr code.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
