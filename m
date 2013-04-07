From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 07 Apr 2013 10:37:48 -0300
Subject: [Buildroot] [PATCH v4] wireless-regdb: new package
In-Reply-To: <1364165118-6984-1-git-send-email-dimitris@siganos.org>
References: <1364165118-6984-1-git-send-email-dimitris@siganos.org>
Message-ID: <516176AC.5040604@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/24/2013 07:45 PM, Dimitrios Siganos wrote:

> +define WIRELESS_REGDB_INSTALL_TARGET_CMDS
> +    install -m 644 -D -T $(@D)/regulatory.bin $(TARGET_DIR)/usr/lib/crda/regulatory.bin
> +    install -m 644 -D -T $(@D)/linville.key.pub.pem $(TARGET_DIR)/usr/lib/crda/pubkeys/linville.key.pub.pem
> +endef

Hi.
Doesn't crda expect the pubkeys in /etc/wireless-regdb/pubkeys path?
At least that's the default and you didn't seem to change that in your
crda v2 package.
Regards.
