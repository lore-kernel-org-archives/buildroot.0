From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 10 Feb 2013 11:02:35 +0100
Subject: [Buildroot] [PATCH 1/1] libtirpc: requires toolchain with
	threads support
In-Reply-To: <1360448834-21507-1-git-send-email-gilles.talis@gmail.com>
 (Gilles Talis's message of "Sat, 9 Feb 2013 14:27:14 -0800")
References: <1360448834-21507-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <87wqugebb8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gilles" == Gilles Talis <gilles.talis@gmail.com> writes:

 Gilles> Fixes:
 Gilles> http://autobuild.buildroot.org/results/8ba720f47f74df94b8c70ac4befd47c47ce65f2f

 Gilles> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
 Gilles> ---
 Gilles>  package/libtirpc/Config.in |    4 ++++
 Gilles>  1 file changed, 4 insertions(+)

 Gilles> diff --git a/package/libtirpc/Config.in b/package/libtirpc/Config.in
 Gilles> index 7e891b4..f2a6f83 100644
 Gilles> --- a/package/libtirpc/Config.in
 Gilles> +++ b/package/libtirpc/Config.in
 Gilles> @@ -1,7 +1,11 @@
 Gilles>  config BR2_PACKAGE_LIBTIRPC
 Gilles>  	bool "libtirpc"
 Gilles> +	depends on BR2_TOOLCHAIN_HAS_THREADS

Thanks, but you also need to propagate this dependency to libtirpc's
reverse dependencies:

git grep -l 'select BR2_PACKAGE_LIBTIRPC'
package/conntrack-tools/Config.in
package/lmbench/Config.in
package/nfs-utils/Config.in
package/quota/Config.in
package/rpcbind/Config.in

Care to fix that up and resend?

-- 
Bye, Peter Korsgaard
