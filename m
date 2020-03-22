From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Mar 2020 18:34:19 +0100
Subject: [Buildroot] [PATCH v6 0/2] package/busybox: fix build with
 glibc 2.31 and musl-1.2.0
In-Reply-To: <20200322171301.15753-1-unixmania@gmail.com>
References: <20200322171301.15753-1-unixmania@gmail.com>
Message-ID: <20200322173419.GB22325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, All,

On 2020-03-22 14:12 -0300, unixmania at gmail.com spake thusly:
> From: Carlos Santos <unixmania@gmail.com>
> 
> Current release of busybox 1_31_1 is failing to build with glibc-2.31
> due to removal of stime() from glibc. It also fails to build with musl
> 1.2.0 due to the direct use of __NR_clock_gettime.
> 
> Add five patches applied upstream to fix these problems.
> 
> Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> Cc: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Yann E. MORIN. <yann.morin.1998@free.fr>

Series applied to master, thanks.

Regards,
Yann E. MORIN.

> Carlos Santos (2):
>   package/busybox: fix build with musl 1.2.0
>   package/busybox: fix build with glibc 2.31
> 
>  ...-Use-64-prefix-syscall-if-we-have-to.patch |  61 ++++++++
>  ...-Use-64-prefix-syscall-if-we-have-to.patch |  50 +++++++
>  ...-Use-64-prefix-syscall-if-we-have-to.patch |  50 +++++++
>  ...rappers-around-clock_gettime-closes-.patch | 134 ++++++++++++++++++
>  .../0007-Remove-stime-function-calls.patch    |  97 +++++++++++++
>  5 files changed, 392 insertions(+)
>  create mode 100644 package/busybox/0003-date-Use-64-prefix-syscall-if-we-have-to.patch
>  create mode 100644 package/busybox/0004-time-Use-64-prefix-syscall-if-we-have-to.patch
>  create mode 100644 package/busybox/0005-runsv-Use-64-prefix-syscall-if-we-have-to.patch
>  create mode 100644 package/busybox/0006-Remove-syscall-wrappers-around-clock_gettime-closes-.patch
>  create mode 100644 package/busybox/0007-Remove-stime-function-calls.patch
> 
> -- 
> 2.18.2
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
