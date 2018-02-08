From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Feb 2018 23:11:16 +0100
Subject: [Buildroot] [PATCH] package/openssh: also install ssh-copy-id
 script
In-Reply-To: <1518028559-22988-1-git-send-email-julien.boibessot@free.fr>
References: <1518028559-22988-1-git-send-email-julien.boibessot@free.fr>
Message-ID: <20180208231116.2727da52@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  7 Feb 2018 19:35:59 +0100, julien.boibessot at free.fr wrote:

> +define OPENSSH_INSTALL_SSH_COPY_ID
> +	$(INSTALL) -D -m 755 $(@D)/contrib/ssh-copy-id $(TARGET_DIR)/usr/bin

$(INSTALL) -D requires a full destination path, i.e
$(TARGET_DIR)/usr/bin/ssh-copy-id, to be guaranteed to work
correctly when $(TARGET_DIR)/usr/bin doesn't exist. So I've fixed that
and applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
