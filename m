From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Aug 2015 19:45:34 +0200
Subject: [Buildroot] [RFC PATCH] pkg-generic: detect incorrectly used
 package
In-Reply-To: <55E06A5C.4020409@imgtec.com>
References: <1440768358-31040-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <55E06603.2090100@imgtec.com> <55E06A5C.4020409@imgtec.com>
Message-ID: <20150828194534.578b69c5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Fri, 28 Aug 2015 15:04:12 +0100, Vicente Olivert Riera wrote:

> since there are certain packages which don't start by BR2_PACKAGE_ (i.e.
> BR2_TOOLCHAIN_EXTERNAL), I would suggest you to make this change:
> 
> On 08/28/2015 02:45 PM, Vicente Olivert Riera wrote:
> >> +	$(Q)if test "$(TYPE)" = "target" -a -z "$(BR2_PACKAGE_$(PKG))" ; then \
> 
> to:
> 
> +       $(Q)if test "$(TYPE)" = "target" -a -z "$(BR2_PACKAGE_$(PKG))" \
> +                                        -a -z "$(BR2_$(PKG))" ; then \

This only fixes the toolchain case, but not the Linux kernel case, or
the bootloader case. I've sent a v2 of the patch that re-uses some
existing mechanism of the package infrastructure to known the Config.in
option associated to the package being built. I believe it's nicer.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
