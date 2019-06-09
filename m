From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Jun 2019 00:29:47 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/gpsd: fix isync build without nmea
In-Reply-To: <20190609215241.29114-1-fontaine.fabrice@gmail.com>
References: <20190609215241.29114-1-fontaine.fabrice@gmail.com>
Message-ID: <66141301-03bf-fae1-eb19-7e4c464731cc@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 I hadn't applied v1 yet since I knew this one was coming :-)

On 09/06/2019 23:52, Fabrice Fontaine wrote:
> Fixes:
>  - http://autobuild.buildroot.org/results/7757ff82623eb5db8cbd9cdf69baf308fd0b0666
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
> Changes v1 -> v2:
>  - Always define NMEA_DOLLAR following upstream feedback
> 
>  ...tates.h-fix-isync-build-without-NMEA.patch | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 package/gpsd/0004-packet_states.h-fix-isync-build-without-NMEA.patch
> 
> diff --git a/package/gpsd/0004-packet_states.h-fix-isync-build-without-NMEA.patch b/package/gpsd/0004-packet_states.h-fix-isync-build-without-NMEA.patch
> new file mode 100644
> index 0000000000..1a36bc8429
> --- /dev/null
> +++ b/package/gpsd/0004-packet_states.h-fix-isync-build-without-NMEA.patch
> @@ -0,0 +1,37 @@
> +From a6561fbf2a53972e552b1619c8711092c72c2199 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sun, 9 Jun 2019 11:52:55 +0200
> +Subject: [PATCH] packet_states.h: fix isync build without NMEA
> +
> +Build fails if isync is enabled without nmea because NMEA_DOLLAR is not
> +defined.
> +
> +Fix this build failure by always defining NMEA_DOLLAR
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/7757ff82623eb5db8cbd9cdf69baf308fd0b0666
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://gitlab.com/gpsd/gpsd/merge_requests/11]
> +---
> + packet_states.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/packet_states.h b/packet_states.h
> +index 4c3a3208..0adbeb1d 100644
> +--- a/packet_states.h
> ++++ b/packet_states.h
> +@@ -3,9 +3,9 @@
> + 
> +    COMMENT_BODY,	/* pound comment for a test load */
> +    COMMENT_RECOGNIZED,	/* comment recognized */
> ++   NMEA_DOLLAR,		/* we've seen first character of NMEA leader */
> + 
> + #ifdef NMEA0183_ENABLE
> +-   NMEA_DOLLAR,		/* we've seen first character of NMEA leader */
> +    NMEA_BANG,		/* we've seen first character of an AIS message '!' */
> +    NMEA_PUB_LEAD,	/* seen second character of NMEA G leader */
> +    NMEA_VENDOR_LEAD,	/* seen second character of NMEA P leader */
> +-- 
> +2.20.1
> +
> 
