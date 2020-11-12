From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu, 12 Nov 2020 22:01:03 +0100
Subject: [Buildroot] [PATCH v2 2/2] package/linux-backports: bump
 version to 5.8
In-Reply-To: <20201112120155.333290-2-ju.o@free.fr>
References: <20201111162208.362275-1-ju.o@free.fr>
 <20201112120155.333290-1-ju.o@free.fr>
 <20201112120155.333290-2-ju.o@free.fr>
Message-ID: <20201112210103.GB60815@pevik>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Julien,

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

> Attempting to compile this package with newer Kernel version (e.g. v5.4)
> fails with message:

>    Generating local configuration database from kernel ...Kernel version parse failed!

> Upgrading the package to 5.8 fixes this issue. Anyways, v4.4 is now
> rather old and beat the very purpose of having newer drivers in older
> kernels.

> Note that since backports tag v4.14-rc4-1, the requirement on minimal
> kernel version changed from 3.0 to 3.10. See commit [1].
Good catch!

In that case, can please person who merges this update
package/linux-backports/Config.in?


Kind regards,
Petr

> [1] https://git.kernel.org/pub/scm/linux/kernel/git/backports/backports.git/commit/?id=a0d05f9f9ca50ea8b1d60726fac6b54167257e76

Update also package/linux-backports/Config.in:

diff --git package/linux-backports/Config.in package/linux-backports/Config.in
index 362e6e4bc7..251d202fd2 100644
--- package/linux-backports/Config.in
+++ package/linux-backports/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_LINUX_BACKPORTS
 	  recent kernels, backported to older ones.
 
 	  This version of linux-backports supports kernels starting
-	  from 3.0.
+	  from 3.10.
 
 	  https://backports.wiki.kernel.org
 
