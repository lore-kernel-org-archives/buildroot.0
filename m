From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Dec 2017 23:51:10 +0100
Subject: [Buildroot] [PATCH v2 1/2] gstreamer1: add config option for
 building unit test libraries
In-Reply-To: <20171027171622.16050-1-ps.report@gmx.net>
References: <20171027171622.16050-1-ps.report@gmx.net>
Message-ID: <20171203235110.5415337f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 27 Oct 2017 19:16:21 +0200, Peter Seiderer wrote:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

I've applied, with some small changes. See below.

> diff --git a/package/gstreamer1/gstreamer1/Config.in b/package/gstreamer1/gstreamer1/Config.in
> index 274171b639..c5839f546d 100644
> --- a/package/gstreamer1/gstreamer1/Config.in
> +++ b/package/gstreamer1/gstreamer1/Config.in
> @@ -16,6 +16,12 @@ config BR2_PACKAGE_GSTREAMER1
>  
>  if BR2_PACKAGE_GSTREAMER1
>  
> +config BR2_PACKAGE_GSTREAMER1_CHECK
> +	bool "enable building unit test libraries"

"building" is not very useful, and is not used in the other options in
that package, so I've removed this word.

> +	default n

Being disabled is the default, so "default n" is not needed. I dropped
it.

> +	$(if $(BR2_PACKAGE_GSTREAMER1_CHECK),,--disable-check) \
>  	$(if $(BR2_PACKAGE_GSTREAMER1_TRACE),,--disable-trace) \
>  	$(if $(BR2_PACKAGE_GSTREAMER1_PARSE),,--disable-parse) \

Side note: I'm wondering why we're not explicitly doing --enable-<foo>
for all those options. We're doing this for all other packages in
Buildroot. But since what you've done is consistent with other options
from the gstreamer1 package, I've applied as-is for now. Changing that
is topic for a separate patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
