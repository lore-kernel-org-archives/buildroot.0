From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 26 Aug 2014 23:47:22 +0300
Subject: [Buildroot] [PATCH 2/2] phidgetwebservice: new package
In-Reply-To: <1409084887-30450-2-git-send-email-yba@tkos.co.il>
References: <1409084887-30450-1-git-send-email-yba@tkos.co.il>
 <1409084887-30450-2-git-send-email-yba@tkos.co.il>
Message-ID: <20140826204722.GC29733@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yonatan,

On Tue, Aug 26, 2014 at 11:28:07PM +0300, Jonathan Ben-Avraham wrote:
> 
> Signed-off-by: Jonathan Ben-Avraham <yba@tkos.co.il>
> ---

[snip]

> diff --git a/package/phidgetwebservice/Config.in b/package/phidgetwebservice/Config.in
> new file mode 100644
> index 0000000..01e7b11
> --- /dev/null
> +++ b/package/phidgetwebservice/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_PHIDGETWEBSERVICE
> +	bool "phidgetwebservice"
> +	depends on BR2_PACKAGE_LIBPHIDGET

For non obvious dependencies the general rule is that you 'select' that 
dependency. See http://buildroot.net/downloads/manual/manual.html under 
"Choosing depends on or select". Note that you must also copy here the 
dependencies of selected packages, in this case threads support.

> +	help
> +          phidgetwebservice (the Phidget WebService) provides an HTTP

This line should be indented like the rest, tab + two spaces.

> +	  front-end to the libphidget device control API. This provides
> +	  an alternative to the libphidget C linkage interface for
> +	  controlling locally attached Phidgets USB devices and it also
> +	  allows you to control Phidget USB devices remotely when the host
> +	  running the phidgetwebservice has an exposed network interface.
> + 
> +	  The phidgetwebservice client program uses the libphidget HTTP
> +	  functions to send commands to the phidgetwebservice.
> +
> +	  http://phidgets.com/

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
