From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 17 Jun 2012 12:20:03 +0200
Subject: [Buildroot] [PATCH] libfreefare: add missing openssl dependency
In-Reply-To: <1339924060-4250-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Sun, 17 Jun 2012 10:07:40 +0100")
References: <1339924060-4250-1-git-send-email-spdawson@gmail.com>
Message-ID: <87wr36fdf0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 spdawson> From: Simon Dawson <spdawson@gmail.com>
 spdawson> If openssl is not selected, configuration fails for the libfreefare package
 spdawson> as follows.

 spdawson>   configure: error: Cannot find libcrypto.

 spdawson> This patch adds the missing dependency on openssl.

 spdawson> Signed-off-by: Simon Dawson <spdawson@gmail.com>
 spdawson> ---
 spdawson>  package/libfreefare/Config.in      |    4 ++++
 spdawson>  package/libfreefare/libfreefare.mk |    2 +-
 spdawson>  2 files changed, 5 insertions(+), 1 deletion(-)

 spdawson> diff --git a/package/libfreefare/Config.in b/package/libfreefare/Config.in
 spdawson> index 2e11f7e..438bcbf 100644
 spdawson> --- a/package/libfreefare/Config.in
 spdawson> +++ b/package/libfreefare/Config.in
 spdawson> @@ -1,7 +1,11 @@
 spdawson>  config BR2_PACKAGE_LIBFREEFARE
 spdawson>  	bool "libfreefare"
 spdawson> +	depends on BR2_PACKAGE_OPENSSL

We normally use 'depends on' for library dependencies (like libnfc), so
I've changed that and committed, thanks.

-- 
Bye, Peter Korsgaard
