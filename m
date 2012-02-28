From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 28 Feb 2012 23:33:58 +0100
Subject: [Buildroot] ltrace hangings
In-Reply-To: <4F4D052C.3030608@free-electrons.com>
References: <4F4D052C.3030608@free-electrons.com>
Message-ID: <201202282333.58717.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On Tuesday 28 February 2012 17:47:40 Maxime Ripard wrote:
> I'm having a hard time here using ltrace with buildroot or crosstool-ng.
> 
> Basically, with a crosstool-NG 1.13.4, with the sample
> arm-unknown-linux-gnueabi (so uclibc 0.9.30.2), I get :
> __uClibc_main(52956, 2, 0xbec42db4, 47280, 521292
> and it hangs.
> 
> Same thing with a toolchain built by buildroot and with uclibc 0.9.32.
> 
> Finally, I tried still with buildroot, but using the latest codebench
> glibc toolchain, I get:
> 
> # ltrace cat /proc/self/cmdline
> __libc_start_main(53812, 2, 0xbefeedb4, 518624, 518824
> 
> Is it a wild guess to think that ltrace 0.5.3 is buggy, or am I doing
> something wrong ?

0.5.3 is now a bit old (2 years), and there has been a new release
about four months ago:
  http://anonscm.debian.org/gitweb/?p=collab-maint/ltrace.git;a=summary

Maybe it's time we upgrade crosstool-NG to this new version...

Also, there seems to be a revamp in the process:
  http://lists.alioth.debian.org/pipermail/ltrace-devel/2012-January/000540.html

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
