From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 27 Feb 2018 22:45:55 +0100
Subject: [Buildroot] [NEXT 04/26] cpe-info: only report target pkgs
In-Reply-To: <1519697441-54194-5-git-send-email-matthew.weber@rockwellcollins.com>
References: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1519697441-54194-5-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20180227224555.2d44721c@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 26 Feb 2018 20:10:19 -0600, Matt Weber wrote:

> +ifneq ($$($(2)_TYPE),host)

Why not:

ifeq ($$($(2)_TYPE),target)

>  $(1)-cpe-info: PKG=$(2)
>  $(1)-cpe-info:
>  ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
> @@ -852,6 +853,7 @@ else
>  	$(Q)$$(foreach id,$$($(2)_CPE_ID),$$(call cpe-manifest,$$($(2)_CPE_PREFIX):$$(id):$(CPE_SUFFIX),$$($(2)_CVE_PATCHED),$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_ACTUAL_SOURCE_SITE))$$(sep))
>  endif # ifeq ($$(call qstrip,$$($(2)_CPE_ID)),)
>  endif # ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
> +endif # ifeq ($$($(2)_TYPE),target)

... just like your endif comment shows ? :-)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
