From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Dec 2015 23:37:18 +0100
Subject: [Buildroot] [PATCH v4 2/3] doom-wad: bump to version 1.9
In-Reply-To: <1446839279-9021-2-git-send-email-rprebello@gmail.com>
References: <1446839279-9021-1-git-send-email-rprebello@gmail.com>
 <1446839279-9021-2-git-send-email-rprebello@gmail.com>
Message-ID: <20151223233718.2703675c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Rodrigo Rebello,

On Fri,  6 Nov 2015 17:47:58 -0200, Rodrigo Rebello wrote:

> diff --git a/package/doom-wad/doom-wad.hash b/package/doom-wad/doom-wad.hash
> new file mode 100644
> index 0000000..fa069c1
> --- /dev/null
> +++ b/package/doom-wad/doom-wad.hash
> @@ -0,0 +1,2 @@
> +# Locally computed
> +sha256	cacf0142b31ca1af00796b4a0339e07992ac5f21bc3f81e7532fe1b5e1b486e6	doom19s.zip
> diff --git a/package/doom-wad/doom-wad.mk b/package/doom-wad/doom-wad.mk
> index 6f4f9da..6c870d0 100644
> --- a/package/doom-wad/doom-wad.mk
> +++ b/package/doom-wad/doom-wad.mk
> @@ -4,16 +4,18 @@
>  #
>  ################################################################################
>  
> -DOOM_WAD_VERSION = 1.8
> -DOOM_WAD_SOURCE = doom-$(DOOM_WAD_VERSION).wad.gz
> +DOOM_WAD_VERSION = 1.9
> +DOOM_WAD_SOURCE = doom19s.zip

So shouldn't the version be "19" and not "1.9" ? It is a bit weird to
have a version not used in the _SOURCE variable. Or if you really want
to have 1.9 as the version, then:

	DOOM_WAD_SOURCE = doom$(subst .,,$(DOOM_WAD_VERSION))s.zip

>  DOOM_WAD_SITE = ftp://ftp.idsoftware.com/idstuff/doom

However, the main reason I didn't apply is because this server seems to
be unavailable at the moment. So I can't test the package, and it would
cause build failures in the autobuilders.

Are you also experiencing the same issue?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
