From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 14 Aug 2014 18:42:22 +0100
Subject: [Buildroot] [PATCH] ltrace: disable on mips/mipsel
In-Reply-To: <1408038104-9440-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1408038104-9440-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <53ECF4FE.3060308@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/14/2014 06:41 PM, Thomas Petazzoni wrote:
> ltrace currently doesn't build on mips/mipsel, and it's an upstream
> issue that has been reported. Until it get fixed, let's disable ltrace
> for mips/mipsel.
>
> Fixes:
>
>    http://autobuild.buildroot.org/results/43a/43a8fc7075f52eab74ebfee4c9f25dd2b886e75e/
>
> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>   package/ltrace/Config.in | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/package/ltrace/Config.in b/package/ltrace/Config.in
> index 4d1acfa..8cabfa2 100644
> --- a/package/ltrace/Config.in
> +++ b/package/ltrace/Config.in
> @@ -1,6 +1,10 @@
>   config BR2_PACKAGE_LTRACE
>   	bool "ltrace"
> -	depends on (BR2_i386 || BR2_arm || BR2_mips || BR2_mipsel \
> +	# ltrace normally has mips/mipsel support, but it's currently
> +	# broken (error: 'struct ltelf' has no member named
> +	# 'relplt_count'). Issue reported upstream at
> +	# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=756764.
> +	depends on (BR2_i386 || BR2_arm \
>   		|| BR2_powerpc || BR2_sparc || BR2_x86_64)
>   	select BR2_PACKAGE_LIBELF
>   	select BR2_PACKAGE_ELFUTILS
>

Thanks Thomas.

-- 
Vincent
