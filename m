From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 03 May 2012 23:54:45 +0200
Subject: [Buildroot] [PATCH v4] Add new package apr-util
In-Reply-To: <1336047756-1893-1-git-send-email-bachmann@tofwerk.com> (Rico
 Bachmann's message of "Thu, 3 May 2012 14:22:36 +0200")
References: <201204272309.51623.arnout@mind.be>
 <1336047756-1893-1-git-send-email-bachmann@tofwerk.com>
Message-ID: <87wr4tylp6.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Rico" == Rico Bachmann <bachmann@tofwerk.com> writes:

 Rico> Add new package apr-util
 Rico> Signed-off-by: Rico Bachmann <bachmann@tofwerk.com>
 Rico> ---
 Rico> v1: Add package apr-util
 Rico>     Add patch to remove check for apr
 Rico>     because check for apr search for ./apr and not for defined folder
 Rico> v2: Change spaces to tab in *.mk
 Rico> v3: Add Signed-off-by and comments to package-patch
 Rico> v4: remove prefix, is added by buildroot
 Rico> ---
 Rico>  package/Config.in                                  |    1 +
 Rico>  package/apr-util/Config.in                         |   11 ++++++++++
 Rico>  .../apr-util/apr-util-1.4.1-remove-checkapr.patch  |   21 ++++++++++++++++++++
 Rico>  package/apr-util/apr-util.mk                       |   13 ++++++++++++
 Rico>  4 files changed, 46 insertions(+), 0 deletions(-)
 Rico>  create mode 100644 package/apr-util/Config.in
 Rico>  create mode 100644 package/apr-util/apr-util-1.4.1-remove-checkapr.patch
 Rico>  create mode 100644 package/apr-util/apr-util.mk

 Rico> diff --git a/package/Config.in b/package/Config.in
 Rico> index ed66c05..caa618b 100644
 Rico> --- a/package/Config.in
 Rico> +++ b/package/Config.in
 Rico> @@ -379,6 +379,7 @@ endmenu
 
 Rico>  menu "Other"
 Rico>  source "package/apr/Config.in"
 Rico> +source "package/apr-util/Config.in"
 Rico>  source "package/fftw/Config.in"
 Rico>  source "package/libargtable2/Config.in"
 Rico>  source "package/argp-standalone/Config.in"
 Rico> diff --git a/package/apr-util/Config.in b/package/apr-util/Config.in
 Rico> new file mode 100644
 Rico> index 0000000..45973b2
 Rico> --- /dev/null
 Rico> +++ b/package/apr-util/Config.in
 Rico> @@ -0,0 +1,11 @@
 Rico> +config BR2_PACKAGE_APR_UTIL
 Rico> +	bool "apr-util"
 Rico> +	select BR2_PACKAGE_APR
 Rico> +	select BR2_PACKAGE_SQLITE
 Rico> +	select BR2_PACKAGE_LIBNEON

It is BR2_PACKAGE_NEON, not LIBNEON.

Other than that it looks good, committed - Thanks.

-- 
Bye, Peter Korsgaard
