From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 20 Jan 2013 22:17:50 +0100
Subject: [Buildroot] [PATCH] vsftpd: install sample config file to /etc
In-Reply-To: <1358328248-15016-1-git-send-email-sho@relinux.de> (Stephan
 Hoffmann's message of "Wed, 16 Jan 2013 10:24:08 +0100")
References: <1358328248-15016-1-git-send-email-sho@relinux.de>
Message-ID: <87sj5vblkx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stephan" == Stephan Hoffmann <sho@relinux.de> writes:

 Stephan> vsftpd comes with a sample config file that can serve as a starting
 Stephan> point for customization and enables a basic functionality. Since
 Stephan> this config refers to a directory "/usr/share/empty" this is also
 Stephan> created.

 Stephan> Signed-off-by: Stephan Hoffmann <sho@relinux.de>
 Stephan> ---
 Stephan>  package/vsftpd/vsftpd.mk |    4 ++++
 Stephan>  1 files changed, 4 insertions(+), 0 deletions(-)

 Stephan> diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
 Stephan> index ca711bb..f694b87 100644
 Stephan> --- a/package/vsftpd/vsftpd.mk
 Stephan> +++ b/package/vsftpd/vsftpd.mk
 Stephan> @@ -37,6 +37,10 @@ define VSFTPD_INSTALL_TARGET_CMDS
 Stephan>  	test -f $(TARGET_DIR)/etc/init.d/S70vsftpd || \
 Stephan>  		$(INSTALL) -D -m 755 package/vsftpd/vsftpd-init \
 Stephan>  			$(TARGET_DIR)/etc/init.d/S70vsftpd
 Stephan> +	test -f $(TARGET_DIR)/etc/vsftpd.conf || \
 Stephan> +		$(INSTALL) -D -m 644 $(@D)/vsftpd.conf \
 Stephan> +			$(TARGET_DIR)/etc/vsftpd.conf
 Stephan> +	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/share/empty

Committed minus the /usr/share/empty creation, thanks.

-- 
Bye, Peter Korsgaard
