From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 06 May 2013 13:37:31 +0200
Subject: [Buildroot] [PATCH v2 2/2] wvdial: new package
In-Reply-To: <1366920422-21956-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Thu, 25 Apr 2013 21:07:02 +0100")
References: <1366920422-21956-1-git-send-email-spdawson@gmail.com>
Message-ID: <87bo8ojq4k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 spdawson> From: Simon Dawson <spdawson@gmail.com>
 spdawson> Signed-off-by: Simon Dawson <spdawson@gmail.com>

 spdawson> ---
 spdawson>  v2: Improve in response to suggestions from Thomas Petazzoni

 spdawson>  package/Config.in                               |    1 +
 spdawson>  package/wvdial/Config.in                        |    9 +++++
 spdawson>  package/wvdial/wvdial-0001-uClibc-scandir.patch |   23 +++++++++++++
 spdawson>  package/wvdial/wvdial.mk                        |   42 +++++++++++++++++++++++
 spdawson>  4 files changed, 75 insertions(+)
 spdawson>  create mode 100644 package/wvdial/Config.in
 spdawson>  create mode 100644 package/wvdial/wvdial-0001-uClibc-scandir.patch
 spdawson>  create mode 100644 package/wvdial/wvdial.mk

 spdawson> diff --git a/package/Config.in b/package/Config.in
 spdawson> index 33d75a9..84a92e1 100644
 spdawson> --- a/package/Config.in
 spdawson> +++ b/package/Config.in
 spdawson> @@ -777,6 +777,7 @@ source "package/wireless-regdb/Config.in"
 spdawson>  source "package/wireless_tools/Config.in"
 spdawson>  source "package/wireshark/Config.in"
 spdawson>  source "package/wpa_supplicant/Config.in"
 spdawson> +source "package/wvdial/Config.in"
 spdawson>  source "package/xinetd/Config.in"
 spdawson>  source "package/xl2tp/Config.in"
 
 spdawson> diff --git a/package/wvdial/Config.in b/package/wvdial/Config.in
 spdawson> new file mode 100644
 spdawson> index 0000000..2dc93ab
 spdawson> --- /dev/null
 spdawson> +++ b/package/wvdial/Config.in
 spdawson> @@ -0,0 +1,9 @@
 spdawson> +config BR2_PACKAGE_WVDIAL
 spdawson> +	bool "wvdial"
 spdawson> +	depends on BR2_INSTALL_LIBSTDCPP
 spdawson> +	depends on BR2_USE_MMU # wvstreams
 spdawson> +	select BR2_PACKAGE_WVSTREAMS
 spdawson> +	help
 spdawson> +	  wvdial with support for software flow control and asyncmaps.

That description is not very helpful if people don't know wvdial. I've
replaced it with the Debian description:

"wvdial is an intelligent Point-to-Point Protocol dialer"

and committed, thanks.

-- 
Bye, Peter Korsgaard
