From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 18 May 2021 20:21:14 +0200
Subject: [Buildroot] [PATCH] package/ebtables: fix runtime in case of
 BR2_KERNEL_64_USERLAND_32
In-Reply-To: <20210518074628.24811-1-patrickdepinguin@gmail.com>
References: <20210518074628.24811-1-patrickdepinguin@gmail.com>
Message-ID: <CAAXf6LWCDwvEmPPmwVyR=PkAg0RsHQ-vO8Q3vmYgbOaXA3-KTw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

El mar, 18 may 2021 a las 9:46, Thomas De Schampheleire
(<patrickdepinguin@gmail.com>) escribi?:
>
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
>
> ebtables 2.0.11 no longer works correctly when userland is 32-bit and the
> kernel is 64-bit. This used to work correctly in version 2.0.10-4.
>
> Problem is twofold:
> - ebtables itself was broken and needs to be patched
> - buildroot needs to pass the correct flag again to indicate when we are in
>   this situation
>
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  ...estore-KERNEL_64_USERSPACE_32-checks.patch | 104 ++++++++++++++++++
>  ...-option-enable-kernel-64-userland-32.patch |  50 +++++++++
>  package/ebtables/ebtables.mk                  |   6 +
>  3 files changed, 160 insertions(+)
>  create mode 100644 package/ebtables/0002-ebtables.h-restore-KERNEL_64_USERSPACE_32-checks.patch
>  create mode 100644 package/ebtables/0003-configure.ac-add-option-enable-kernel-64-userland-32.patch

Both patches have been submitted upstream:

https://marc.info/?l=netfilter-devel&m=162136187029914&w=2
https://marc.info/?l=netfilter-devel&m=162136187029916&w=2

Best regards,
Thomas
