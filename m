From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 9 Aug 2018 10:55:02 +0200
Subject: [Buildroot] [PATCH] package/proftpd: add
 BR2_PACKAGE_PROFTPD_MOD_SFTP
In-Reply-To: <1533648866-61581-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1533648866-61581-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20180809105502.288b5086@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  7 Aug 2018 08:34:26 -0500, Matt Weber wrote:

> +#Make ":" separated final modules list
> +PROFTPD_MODULES_LIST = \
> +	$(shell for l in $(PROFTPD_MODULES); do \
> +	modlist=$$modlist$$l:; done \
> +	&& echo $${modlist%?})

Meh. Please use this instead:

  --with-modules=$(subst $(space),:,$(PROFTPD_MODULES))

It's a bit more make-ish :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
