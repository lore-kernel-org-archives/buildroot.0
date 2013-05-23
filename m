From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 23 May 2013 23:20:22 +0200
Subject: [Buildroot] [PATCH] jamvm: Restrict MIPS BE and MIPS64 cores
In-Reply-To: <1369142945-15964-1-git-send-email-markos.chandras@gmail.com>
 (Markos Chandras's message of "Tue, 21 May 2013 14:29:05 +0100")
References: <1369142945-15964-1-git-send-email-markos.chandras@gmail.com>
Message-ID: <87d2shieax.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markos" == Markos Chandras <markos.chandras@gmail.com> writes:

 Markos> From: Markos Chandras <markos.chandras@imgtec.com>
 Markos> The configure.ac script is only looking for mipsel-*-linux so restrict
 Markos> unsupported MIPS cores.

 Markos> Fixes the following problem:

 Markos> configure: error: mips-buildroot-linux-uclibc not supported

A quick look at configure.ac seems to show that it only supports:

arm, armeb, i386, mipsel, powerpc and x86-64.

Care to send a patch making it depend on those archs instead?


 Markos> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
 Markos> ---
 Markos>  package/jamvm/Config.in | 2 +-
 Markos>  1 file changed, 1 insertion(+), 1 deletion(-)
 Markos>  mode change 100644 => 100755 package/jamvm/Config.in

 Markos> diff --git a/package/jamvm/Config.in b/package/jamvm/Config.in
 Markos> old mode 100644
 Markos> new mode 100755
 Markos> index 0287f80..955dcf6
 Markos> --- a/package/jamvm/Config.in
 Markos> +++ b/package/jamvm/Config.in
 Markos> @@ -1,6 +1,6 @@
 Markos>  config BR2_PACKAGE_JAMVM
 Markos>  	bool "jamvm"
 Markos> -	depends on BR2_INET_IPV6
 Markos> +	depends on BR2_INET_IPV6 && !BR2_mips && !BR2_mips64 && !BR2_mips64el
 Markos>  	select BR2_PACKAGE_ZLIB
 Markos>  	select BR2_PACKAGE_CLASSPATH
 Markos>  	help
 Markos> -- 
 Markos> 1.8.2.1


 Markos> _______________________________________________
 Markos> buildroot mailing list
 Markos> buildroot at busybox.net
 Markos> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
