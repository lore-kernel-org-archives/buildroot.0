From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 03 Oct 2012 11:35:40 +0200
Subject: [Buildroot] [PATCH] Added build configuration for Network UPS
 Tools (nut) package. Signed-off-by: Dallas Clement
 <dallas.a.clement@gmail.com>
In-Reply-To: <CAE9DZUTZPXWobHm=FYzE2Ph-CkLmtQ5CF4uHC54mqY2eiyJ8oA@mail.gmail.com>
References: <CAE9DZUTZPXWobHm=FYzE2Ph-CkLmtQ5CF4uHC54mqY2eiyJ8oA@mail.gmail.com>
Message-ID: <506C06EC.8030607@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/09/12 17:41, Dallas Clement wrote:
> package/Config.in     |    1 +
>   package/nut/Config.in |    6 ++++++
>   package/nut/nut.mk    |   10 ++++++++++
>   3 files changed, 17 insertions(+), 0 deletions(-)
>   create mode 100644 package/nut/Config.in
>   create mode 100644 package/nut/nut.mk

  I don't know which mailer you're using, but your patches don't come
through correctly.  You should have:

Subject: [PATH] nut: new package

Body:

Signed-off-by: Dallas Clement <...>
---
<diffstat>
diff --git ...

  And if you want additional comments (e.g. patch changelog) it should
go below your SOB, separated by a line containing three dashes.


[snip]
> diff --git a/package/nut/nut.mk b/package/nut/nut.mk
> new file mode 100644
> index 0000000..7a0b7c6
> --- /dev/null
> +++ b/package/nut/nut.mk
> @@ -0,0 +1,10 @@
> +#############################################################
> +#
> +# nut
> +#
> +#############################################################
> +NUT_VERSION = 2.4.3
> +NUT_SOURCE = nut-$(NUT_VERSION).tar.gz
> +NUT_SITE = http://www.networkupstools.org/source/2.4/
> +
> +$(eval $(autotools-package))

  On uClibc toolchain, it misses -lm so you should add:

NUT_CONF_ENV = LDFLAGS="$(TARGET_LDFLAGS) -lm"


  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
