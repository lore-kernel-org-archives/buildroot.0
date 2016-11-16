From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 17 Nov 2016 00:13:12 +0100
Subject: [Buildroot] 2016.11-rc2 with really old versions of bash (RHEL5)
In-Reply-To: <582ce22d87e4_b6b11ecfac31990@ultri3.mail>
References: <20161113210740.3a8cedb2@free-electrons.com>
 <582ce22d87e4_b6b11ecfac31990@ultri3.mail>
Message-ID: <20161116231312.GA27675@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, All,

On 2016-11-16 20:48 -0200, Ricardo Martincoski spake thusly:
> Do you see the issue described below? Maybe I am doing something wrong.
> What bash version do you have in your RHEL5 servers?
> 
> All,
> 
> Ancient versions of bash don't support 'Associative arrays', leading to build
> error using 2016.11-rc2 in a plain vanilla RHEL5.

Asociative arrays were introduced in bash-4.0, indeed.

Doing without associative arrays is not very easy. Rather, it would be
very difficult.

Unless the script is re-written in an other language...

> Please notice EOL of RHEL5 is 31 Mar 2017 [1].

Well, it's not even 6 months in the future. Time to upgrade, maybe? ;-)

> Currently the manual does not specify a minimum version of bash [2].

I think the best short-term solution is that we advertise that bash 4.0
is required, now.

Let's see what others think...

Regards,
Yann E. MORIN.


> This is NOT my use case!
> I was just testing some unrelated stuff in a VM and came across it.
> I didn't tested the obvious workaround (installing a newer bash) but it should
> work.
> 
> See below the logs for RHEL5 (error) and RHEL6 (ok).
> 
> [ricardo at centos5 buildroot-2016.11-rc2]$ grep release /etc/issue        
> CentOS release 5.11 (Final)
> [ricardo at centos5 buildroot-2016.11-rc2]$ bash --version | grep bash
> GNU bash, version 3.2.25(1)-release (x86_64-redhat-linux-gnu)
> [ricardo at centos5 buildroot-2016.11-rc2]$ make -s defconfig
> support/scripts/br2-external: line 6: declare: -A: invalid option
> declare: usage: declare [-afFirtx] [-p] [name[=value] ...]
> Makefile:188: /home/ricardo/buildroot-2016.11-rc2/output/.br-external.mk: No such file or directory
> make[1]: Failed to remake makefile `/home/ricardo/buildroot-2016.11-rc2/output/.br-external.mk'.
> support/scripts/br2-external: line 6: declare: -A: invalid option
> declare: usage: declare [-afFirtx] [-p] [name[=value] ...]
> make[1]: *** [/home/ricardo/buildroot-2016.11-rc2/output/build/.br2-external.in] Error 2
> make: *** [_all] Error 2
> 
> [ricardo at centos6 buildroot-2016.11-rc2]$ grep release /etc/issue        
> CentOS release 6.8 (Final)
> [ricardo at centos6 buildroot-2016.11-rc2]$ bash --version | grep bash
> GNU bash, version 4.1.2(1)-release (x86_64-redhat-linux-gnu)
> [ricardo at centos6 buildroot-2016.11-rc2]$ make -s defconfig
> #
> # configuration written to /home/ricardo/buildroot-2016.11-rc2/.config
> #
> 
> [1] https://wiki.centos.org/Download
> [2] http://nightly.buildroot.org/manual.html#requirement-mandatory
> 
> Regards,
> Ricardo


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
