From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 15 Jun 2015 00:07:55 +0200
Subject: [Buildroot] [PATCH] directfb: add an option for debugging
	support
In-Reply-To: <1434315067-19958-1-git-send-email-cedric.marie@openmailbox.org>
References: <1434315067-19958-1-git-send-email-cedric.marie@openmailbox.org>
Message-ID: <557DFB3B.6060701@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/14/15 22:51, C?dric Marie wrote:
> DirectFB provides two options for debug:
> * --enable-debug-support (default is yes)
> * --enable-debug (default is no)
> The first one provides the functions to print debug information. These
> functions can be called inside DirectFB, or by an external DirectFB
> driver in another package.
> The second one enables verbose mode in DirectFB, using these functions.
> 
> Buildroot currently provides an option for the second one only. The
> first one - which is necessary for the second one - is always enabled,
> because this is the default value.
> 
> The new option (BR2_PACKAGE_DIRECTFB_DEBUG_SUPPORT) makes it possible
> to disable debugging support (--disable-debug-support) in order to
> build the library with no debug feature at all.
> 
> When debugging support is disabled, the target installation path of
> drivers (/usr/lib/directfb-<version>) is suffixed with -pure. The
> public library (/usr/lib/libdirectfb.so) remains unchanged.
> 
> Some external DirectFB drivers will install into
> /usr/lib/directfb-<version>-pure in release mode. For that reason, it
> is important that DirectFB can be configured to use this directory.
> 
> Signed-off-by: C?dric Marie <cedric.marie@openmailbox.org>
[snip]
> +ifeq ($(BR2_PACKAGE_DIRECTFB_DEBUG_SUPPORT),y)
>  ifeq ($(BR2_PACKAGE_DIRECTFB_DEBUG),y)
>  DIRECTFB_CONF_OPTS += --enable-debug
>  endif

 There should be a --enable-debug-support somewhere around here,

 Regards,
 Arnout


> +else
> +DIRECTFB_CONF_OPTS += --disable-debug-support
> +endif
>  
>  ifeq ($(BR2_PACKAGE_DIRECTFB_TRACE),y)
>  DIRECTFB_CONF_OPTS += --enable-trace
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
