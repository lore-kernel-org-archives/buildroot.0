From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Aug 2018 22:22:30 +0200
Subject: [Buildroot] [PATCH/Next v2] package/proftpd: add
 BR2_PACKAGE_PROFTPD_MOD_SFTP
In-Reply-To: <1534270525-48448-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1534270525-48448-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20180814222230.1c53a863@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Aug 2018 13:15:25 -0500, Matt Weber wrote:

> +#Append all required modules in PROFTPD_MODULES variable
> +#Use 'space' seperator for more than one module
> +#e.g. PROFTPD_MODULES += mod_readme mod_ifsession

This comment really wasn't necessary, that's how we do things
everywhere in Buildroot, for all variables.

>  ifeq ($(BR2_PACKAGE_PROFTPD_MOD_REWRITE),y)
> -PROFTPD_CONF_OPTS += --with-modules=mod_rewrite
> +PROFTPD_MODULES = mod_rewrite

I changed the "=" here to a "+=" to avoid potential mistakes in the
future.

Applied to next with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
