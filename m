From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 2 Jul 2017 18:04:53 +0200
Subject: [Buildroot] [PATCH 1/3 v3] package/ifupdown-scripts: new package
In-Reply-To: <a9d13cba3762cec2139259304cb4a809c6147375.1499006091.git.yann.morin.1998@free.fr>
References: <cover.1499006091.git.yann.morin.1998@free.fr>
 <a9d13cba3762cec2139259304cb4a809c6147375.1499006091.git.yann.morin.1998@free.fr>
Message-ID: <d4b620ef-ee7f-3c93-794e-a44abcaddae9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02-07-17 16:35, Yann E. MORIN wrote:
[snip]
> +# ifupdown-scripts can not be selected when systemd-networkd is
> +# enabled, so if we are enabled with systemd, we must install our
> +# own service file.

 Leftover from a previous iteration? Now it actually can (and will be) selected
for SYSTEMD_NETWORKD. So you need the condition here (and drop the comment).

 Regards,
 Arnout

> +define IFUPDOWN_SCRIPTS_INSTALL_INIT_SYSTEMD
> +	$(INSTALL) -D -m 644 $(IFUPDOWN_SCRIPTS_PKGDIR)/network.service \
> +		$(TARGET_DIR)/etc/systemd/system/network.service
> +	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> +	ln -fs ../network.service \
> +		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/network.service
> +endef
> +
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
