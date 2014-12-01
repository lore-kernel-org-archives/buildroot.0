From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 02 Dec 2014 00:40:12 +0100
Subject: [Buildroot] [PATCHv3 71/74] php: install configuration file
	unconditionally
In-Reply-To: <1417357142-14307-72-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 30 Nov 2014 15:18:59 +0100")
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-72-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <8761dv3pnn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > As discussed, users should use a rootfs overlay or a post-build script
 > instead of a custom skeleton to override files installed by Buildroot,
 > so there is no point in having conditions when installing init scripts
 > or configuration files.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 >  package/php/php.mk | 6 ++----
 >  1 file changed, 2 insertions(+), 4 deletions(-)

 > diff --git a/package/php/php.mk b/package/php/php.mk
 > index 9456f1c..caaf548 100644
 > --- a/package/php/php.mk
 > +++ b/package/php/php.mk
 > @@ -238,10 +238,8 @@ PHP_POST_INSTALL_TARGET_HOOKS += PHP_EXTENSIONS_FIXUP
 >  define PHP_INSTALL_FIXUP
 >  	rm -rf $(TARGET_DIR)/usr/lib/php
 >  	rm -f $(TARGET_DIR)/usr/bin/phpize
 > -	if [ ! -f $(TARGET_DIR)/etc/php.ini ]; then \
 > -		$(INSTALL) -m 0755  $(PHP_DIR)/php.ini-production \
 > -			$(TARGET_DIR)/etc/php.ini; \
 > -	fi
 > +	$(INSTALL) -m 0755  $(PHP_DIR)/php.ini-production \
 > +		$(TARGET_DIR)/etc/php.ini

Committed with -D option added / extra space after 0755 removed, thanks.

-- 
Bye, Peter Korsgaard
