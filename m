From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 10 Apr 2015 22:40:30 +0200
Subject: [Buildroot] [PATCH 2/2] infra/pkg-kconfig: require an non-empty
 KCONFIG_FILE
In-Reply-To: <55282C0F.90501@mind.be>
References: <cover.1428512591.git.yann.morin.1998@free.fr>
 <c5c81694cabca70c5651fe42a7de99247275659c.1428512591.git.yann.morin.1998@free.fr>
 <55258DE8.9020207@mind.be> <20150408204917.GC4197@free.fr>
 <55282C0F.90501@mind.be>
Message-ID: <20150410204030.GE4313@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-04-10 22:01 +0200, Arnout Vandecappelle spake thusly:
> On 08/04/15 22:49, Yann E. MORIN wrote:
> [snip]
> > So, because neither "use defconfig" nor "use custom config" is set,
> > KERNEL_SOURCE_CONFIG is not set, so LINUX_KCONFIG_FILE ends up empty.
> 
> 
> BR2_LINUX_KERNEL_USE_DEFCONFIG and BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG are the
> only two possibilities in the "Kernel configuration" choice, so one of them will
> always be set.

No, neither would be set if you don't enable building a kernel. In that
case, LINUX_KCONFIG_FILE is empty, but the $(eval $(kconfig-package)) is
still called, and thus the test should fail. But it does not.

> > However, our ifndef did not trigger so far.
> 
>  The kernel isn't built in the autobuilders, so where would it trigger?

Well, obviously, locally. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
