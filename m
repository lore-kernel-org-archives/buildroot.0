From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Jan 2016 13:50:18 +0100
Subject: [Buildroot] [PATCH 1/1] iputils: resolve musl compatibility
In-Reply-To: <1453089044-10391-1-git-send-email-matt@thewebers.ws>
References: <1453089044-10391-1-git-send-email-matt@thewebers.ws>
Message-ID: <20160118135018.5a4804fa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matt Weber,

On Mon, 18 Jan 2016 03:50:44 +0000, Matt Weber wrote:
> The new upstream and version bump resolves a series of musl build failures
> noted in the autobuilder log.
> 
> http://autobuild.buildroot.net/results/12cb73f3def95efe706bcd957bc2c091e7931d5a/
> 
> Signed-off-by: Matt Weber <matt@thewebers.ws>
> ---
> v1
>   - Updated to github upstream, selected merge from Nov 3 2015
>     which provided musl fixes (last release was to old, 20150815)
>   - Added missing dependencies for kernel capabilies lib
>   - Accounted for new consolidated ping (ipv4/6)

Why aren't those comments part of the commit log? They detail the patch
itself, not changes between versions of the patch.

> Tested against a buildroot arm musl/glibc toolchains, as well as
> autobuilder defconfig.

Ditto.

> diff --git a/package/iputils/Config.in b/package/iputils/Config.in
> index 5324639..61681e4 100644
> --- a/package/iputils/Config.in
> +++ b/package/iputils/Config.in
> @@ -1,9 +1,10 @@
>  config BR2_PACKAGE_IPUTILS
>  	bool "iputils"
>  	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_LIBCAP

So you need to duplicate the dependencies of libcap in iputils
Config.in file.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
