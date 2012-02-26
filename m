From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 26 Feb 2012 22:28:59 +0100
Subject: [Buildroot] [PATCH 2/3] qt: Install QtDeclarative imports
In-Reply-To: <1330258388-28391-2-git-send-email-ismael.luceno@gmail.com>
 (Ismael Luceno's message of "Sun, 26 Feb 2012 10:13:07 -0200")
References: <1330258388-28391-1-git-send-email-ismael.luceno@gmail.com>
 <1330258388-28391-2-git-send-email-ismael.luceno@gmail.com>
Message-ID: <874nudi8ro.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ismael" == Ismael Luceno <ismael.luceno@gmail.com> writes:

Please sign off on your patches! (git format-patch -s).

 Ismael> ---
 Ismael>  package/qt/qt.mk |    7 +++++--
 Ismael>  1 files changed, 5 insertions(+), 2 deletions(-)

 Ismael> diff --git a/package/qt/qt.mk b/package/qt/qt.mk
 Ismael> index 68f9348..4871538 100644
 Ismael> --- a/package/qt/qt.mk
 Ismael> +++ b/package/qt/qt.mk
 Ismael> @@ -594,9 +594,12 @@ endif
 
 Ismael>  # Plugin installation
 Ismael>  define QT_INSTALL_TARGET_PLUGINS
 Ismael> +	mkdir -p $(TARGET_DIR)/usr/lib/qt
 Ismael>  	if [ -d $(STAGING_DIR)/usr/lib/qt/plugins/ ] ; then \
 Ismael> -		mkdir -p $(TARGET_DIR)/usr/lib/qt/plugins ; \
 Ismael> -		cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/* $(TARGET_DIR)/usr/lib/qt/plugins ; \
 Ismael> +		cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins $(TARGET_DIR)/usr/lib/qt ; \
 Ismael> +	fi
 Ismael> +	if [ -d $(@D)/imports ] ; then \
 Ismael> +		cp -dpfr $(@D)/imports $(TARGET_DIR)/usr/lib/qt ; \

It would make more sense to add the mkdir -p inside this
conditional. Is there any reason why you are copying from the source
directory and not staging like above?

Care to fix that and resend with your signed-off-by?

-- 
Bye, Peter Korsgaard
