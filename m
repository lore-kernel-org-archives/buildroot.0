From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 2 Feb 2016 14:06:03 +0100
Subject: [Buildroot] [PATCH 3/6] package/libsigrok: fix musl build
In-Reply-To: <1454248738-12371-4-git-send-email-bernd.kuhls@t-online.de>
References: <1454248738-12371-1-git-send-email-bernd.kuhls@t-online.de>
 <1454248738-12371-4-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <56B0A9BB.5060509@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 31-01-16 14:58, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/afc/afcea2068d5b0ba707aa90339401550602103ca7/
> http://autobuild.buildroot.net/results/a4d/a4dab61fb39dd642f85fad20972a0a4572af9a73/
> and others
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> ---
>  ...01-beaglelogic.h-fix-build-with-musl-libc.patch | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/libsigrok/0001-beaglelogic.h-fix-build-with-musl-libc.patch
> 
> diff --git a/package/libsigrok/0001-beaglelogic.h-fix-build-with-musl-libc.patch b/package/libsigrok/0001-beaglelogic.h-fix-build-with-musl-libc.patch
> new file mode 100644
> index 0000000..e9ecf85
> --- /dev/null
> +++ b/package/libsigrok/0001-beaglelogic.h-fix-build-with-musl-libc.patch
> @@ -0,0 +1,38 @@
> +From 1b9ca481b2447154d12a7a94fe90c5b968ddf41c Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd.kuhls@t-online.de>
> +Date: Sat, 30 Jan 2016 20:01:05 +0100
> +Subject: [PATCH 1/1] beaglelogic.h: fix build with musl libc
> +
> +This patch fixes a build error seen on the buildroot project:
> +http://autobuild.buildroot.net/results/afc/afcea2068d5b0ba707aa90339401550602103ca7/
> +
> +Patch taken from
> +https://github.com/dx9/ceph/commit/4f7bcabca7737c3f48f07ca2b4b1296c29e3358b
> +which solved a similar problem.
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +---
> +Patch sent upstream:
> +http://article.gmane.org/gmane.comp.debugging.sigrok.devel/1948
> +
> + src/hardware/beaglelogic/beaglelogic.h | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/src/hardware/beaglelogic/beaglelogic.h b/src/hardware/beaglelogic/beaglelogic.h
> +index 9015c61..165b386 100644
> +--- a/src/hardware/beaglelogic/beaglelogic.h
> ++++ b/src/hardware/beaglelogic/beaglelogic.h
> +@@ -28,6 +28,10 @@
> + #include <stdlib.h>
> + #include <unistd.h>
> + 
> ++#ifndef __STRING
> ++# define __STRING(x) #x
> ++#endif
> ++
> + /* BeagleLogic device node name */
> + #define BEAGLELOGIC_DEV_NODE        "/dev/beaglelogic"
> + #define BEAGLELOGIC_SYSFS_ATTR(a)   "/sys/devices/virtual/misc/beaglelogic/"\
> +-- 
> +2.7.0.rc3
> +
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
