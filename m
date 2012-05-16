From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 16 May 2012 13:37:42 +0200
Subject: [Buildroot] [PATCH] midori: bump version to 0.4.6
In-Reply-To: <1337165713-9950-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Wed, 16 May 2012 11:55:13 +0100")
References: <1337165713-9950-1-git-send-email-spdawson@gmail.com>
Message-ID: <87vcjwpda1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 spdawson> From: Simon Dawson <spdawson@gmail.com>
 spdawson> Signed-off-by: Simon Dawson <spdawson@gmail.com>
 spdawson> ---
 spdawson>  package/midori/Config.in                         |    6 ++++--
 spdawson>  package/midori/midori.mk                         |    8 ++++----
 spdawson>  package/vala/vala-fix-dirty-version-suffix.patch |   15 +++++++++++++++

Please put the vala patch in a seperate commit.

 spdawson>  3 files changed, 23 insertions(+), 6 deletions(-)
 spdawson>  create mode 100644 package/vala/vala-fix-dirty-version-suffix.patch

 spdawson> diff --git a/package/midori/Config.in b/package/midori/Config.in
 spdawson> index 95a0afb..a9315fe 100644
 spdawson> --- a/package/midori/Config.in
 spdawson> +++ b/package/midori/Config.in
 spdawson> @@ -3,6 +3,8 @@ config BR2_PACKAGE_MIDORI
 spdawson>  	select BR2_PACKAGE_WEBKIT
 spdawson>  	select BR2_PACKAGE_LIBSEXY
 spdawson>  	depends on BR2_PACKAGE_LIBGTK2
 spdawson> +	depends on BR2_PACKAGE_LIBINTL
 spdawson> +	depends on BR2_PACKAGE_LIBICONV

Are you sure libintl/iconv is always needed? For most packages it
depends on if the toolchain has locale support or not.

-- 
Bye, Peter Korsgaard
