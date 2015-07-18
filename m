From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jul 2015 17:38:21 +0200
Subject: [Buildroot] [PATCH v9 10/15] openssh: selinux and pam support
In-Reply-To: <1436905227-26937-11-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1436905227-26937-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1436905227-26937-11-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <20150718173821.6ea31258@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Clayton Shotwell,

On Tue, 14 Jul 2015 15:20:22 -0500, Clayton Shotwell wrote:

>  ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
> +define OPENSSH_INSTALL_PAM_CONF
> +	$(INSTALL) -D -m 644 $(@D)/contrib/sshd.pam.generic $(TARGET_DIR)/etc/pam.d/sshd
> +	$(SED) '/password   required     \/lib\/security\/pam_cracklib.so/d' $(TARGET_DIR)/etc/pam.d/sshd

I've replaced this line with:

	$(SED) '\%password   required     /lib/security/pam_cracklib.so%d' $(TARGET_DIR)/etc/pam.d/sshd

which does exactly the same but thanks to using the % delimiter, is a
bit more readable.

Applied this this changed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
