From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 04 Apr 2011 22:46:08 +0200
Subject: [Buildroot] [PATCH] add inetutils to package
In-Reply-To: <1298881761-1294-1-git-send-email-lliubbo@gmail.com> (Bob Liu's
	message of "Mon, 28 Feb 2011 16:29:20 +0800")
References: <1298881761-1294-1-git-send-email-lliubbo@gmail.com>
Message-ID: <87bp0lycbz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bob" == Bob Liu <lliubbo@gmail.com> writes:

 Bob> Signed-off-by: Bob Liu <lliubbo@gmail.com>

Thanks. Is there any specific reason to use this rather than the busybox
applets?

 Bob> ---
 Bob>  package/Config.in              |    2 +-
 Bob>  package/inetutils/Config.in    |    6 ++++++
 Bob>  package/inetutils/inetutils.mk |   14 ++++++++++++++
 Bob>  3 files changed, 21 insertions(+), 1 deletions(-)
 Bob>  create mode 100644 package/inetutils/Config.in
 Bob>  create mode 100644 package/inetutils/inetutils.mk

 Bob> diff --git a/package/Config.in b/package/Config.in
 Bob> index 7f1d9ff..5123aec 100644
 Bob> --- a/package/Config.in
 Bob> +++ b/package/Config.in
 Bob> @@ -366,7 +366,6 @@ menu "Networking applications"
 Bob>  source "package/argus/Config.in"
 Bob>  source "package/avahi/Config.in"
 Bob>  source "package/axel/Config.in"
 Bob> -source "package/bluez_utils/Config.in"

That line shouldn't have been part of the patch.
 Bob> +INETUTILS_VERSION = 1.8
 Bob> +INETUTILS_SOURCE = inetutils-$(INETUTILS_VERSION).tar.gz
 Bob> +INETUTILS_SITE = http://ftp.gnu.org/gnu/inetutils/
 Bob> +INETUTILS_INSTALL_STAGING = YES
 Bob> +INETUTILS_INSTALL_TARGET_OPT = SUIDMODE="-m 4775" DESTDIR=$(TARGET_DIR) install

That suidmode thing looks odd. Does any of these binaries need to be
suid root? If so, we'll need to add them to device_table.txt

-- 
Bye, Peter Korsgaard
