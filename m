From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Fri, 28 Mar 2014 17:24:48 +0100
Subject: [Buildroot] [PATCH 1/1] systemd: disable build for unsupported
 architectures.
In-Reply-To: <20140328121156.6d49c688@skate>
References: <1396001767-4910-1-git-send-email-eric.le.bihan.dev@free.fr>
 <20140328121156.6d49c688@skate>
Message-ID: <20140328162447.GA7725@pc-eric>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!
On Fri, Mar 28, 2014 at 12:11:56PM +0100, Thomas Petazzoni wrote:
> Dear Eric Le Bihan,
>
> On Fri, 28 Mar 2014 11:16:07 +0100, Eric Le Bihan wrote:
> > Systemd only supports the architectures defined in
> > src/shared/architecture.h. This list does not contain ARC, Blackfin,
> > Xtensa, Microblaze and Nios2, so this package is disabled for these
> > architectures.
[...]
>
> Maybe it's better to use positive logic here, and only explicitly allow
> systemd on the architectures that it supports. This way if tomorrow we
> add support for a new architecture, we won't get weird failures.
>
> In package/systemd/Config.in:
>
> config BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
> 	bool
> 	default y if BR2_arm || BR2_powerpc || BR2_...
>
> and then use "depends on BR2_PACKAGE_SYSTEM_ARCH_SUPPORTS" where needed.
Thanks for the advice! I noticed BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT in
package/qt/Config.in follows the same logic.

Best regards,
ELB
