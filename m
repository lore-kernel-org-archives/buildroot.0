Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4220DC6FD20
	for <buildroot@archiver.kernel.org>; Fri, 24 Mar 2023 10:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C862260B4C;
	Fri, 24 Mar 2023 10:27:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C862260B4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h-y1r2Wd7yTm; Fri, 24 Mar 2023 10:27:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0385615C5;
	Fri, 24 Mar 2023 10:27:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0385615C5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3C0A81BF314
 for <buildroot@lists.busybox.net>; Fri, 24 Mar 2023 10:27:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1571C405A0
 for <buildroot@lists.busybox.net>; Fri, 24 Mar 2023 10:27:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1571C405A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r0vLoMzLP-kf for <buildroot@lists.busybox.net>;
 Fri, 24 Mar 2023 10:27:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB6A040558
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.70.34])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DB6A040558
 for <buildroot@buildroot.org>; Fri, 24 Mar 2023 10:27:06 +0000 (UTC)
Received: from opfednr00.francetelecom.fr (unknown [xx.xx.xx.64])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfednr20.francetelecom.fr (ESMTP service) with ESMTPS id 4PjdgF0Ttvz20dF; 
 Fri, 24 Mar 2023 11:27:05 +0100 (CET)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Fri, 24 Mar 2023 11:27:02 +0100
Date: Fri, 24 Mar 2023 11:27:02 +0100
From: <yann.morin@orange.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Message-ID: <6581_1679653624_641D7AF8_6581_190_1_20230324102702.GA27815@tl-lnx-nyma7486>
References: <20230324093307.1255640-1-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230324093307.1255640-1-luca.ceresoli@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX204.corporate.adroot.infra.ftgroup (10.115.26.9)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1679653625;
 bh=Z389rHPlviNUAXLN9pVAPTxgjHd5VmLCu7/aOw3Qz2A=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
 b=ULAb0ALaUtNYu7oiAPNN+7oPT1k6r12Ebxyhw6+IIOFKjhw6GXdr/JpWfdxfxDHZg
 NgNr6rJtEcKa1KGT2rZbegPz4cB5svWwL1PnQWq7ZLtl83YdUCaad0bBpWMNvjGDIy
 L/4l+lhL6lyNzycb2UXeS1TN6TxTxXs7dzEagsmll1434ORmLSzVpCKmD3PmHfiEjL
 4q2lGtHSnzAoASi2apozn65jyyNMbv9AkNocPsdiAOuBDayYDTcX68x7DZTi6lDmA9
 LmUCvnp2CJkDOKzAEJ6/lC/bMYGAO9CkelfzsXWjCf0cPx6u81jY8+VVu+jELCPQk8
 LValTYl5PiDOw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=ORANGE001 header.b=ULAb0ALa
Subject: Re: [Buildroot] [PATCH] package/linux-tools: add USB tools (testusb
 and ffs-test)
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Luca, All,

On 2023-03-24 10:33 +0100, Luca Ceresoli via buildroot spake thusly:
> Extend the linux-tools package to also build the userspace USB tools, which
> currently include testusb and ffs-test.
> 
> These tools are in the kernel tree since a long time, but a Makefile was
> added only in 5.9 to allow building in the same way as other tools provided
> with the kernel. Here we use the Makefile and thus version >= 5.9 is
> required. Support for older kernels may be added later if needed.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
[--SNIP--]
> diff --git a/package/linux-tools/linux-tool-usbtools.mk.in b/package/linux-tools/linux-tool-usbtools.mk.in
> new file mode 100644
> index 000000000000..28b3aff25cc2
> --- /dev/null
> +++ b/package/linux-tools/linux-tool-usbtools.mk.in
> @@ -0,0 +1,42 @@
> +################################################################################
> +#
> +# usbtools
> +#
> +################################################################################
> +
> +LINUX_TOOLS += usbtools
> +
> +USBTOOLS_MAKE_OPTS = $(LINUX_MAKE_FLAGS) LDFLAGS="$(TARGET_LDFLAGS)"
> +
> +define USBTOOLS_BUILD_CMDS
> +	$(Q)if ! grep install $(LINUX_DIR)/tools/usb/Makefile >/dev/null 2>&1 ; then \
> +		echo "Your kernel version is too old to build the USB tools." ; \
> +		echo "At least kernel 5.9 must be used." ; \
> +		exit 1 ; \
> +	fi
> +
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/usb \
> +		$(USBTOOLS_MAKE_OPTS) \
> +		all
> +endef
> +
> +ifeq ($(BR2_PACKAGE_LINUX_TOOLS_USBTOOLS_TESTUSB),)
> +define USBTOOLS_INSTALL_REMOVE_TESTUSB
> +	$(RM) -rf $(TARGET_DIR)/usr/bin/testusb
> +endef
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LINUX_TOOLS_USBTOOLS_FFSTEST),)
> +define USBTOOLS_INSTALL_REMOVE_FFSTEST
> +	$(RM) -rf $(TARGET_DIR)/usr/bin/ffs-test
> +endef
> +endif
> +
> +define USBTOOLS_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/usb \
> +		$(USBTOOLS_MAKE_OPTS) \
> +		DESTDIR=$(TARGET_DIR) \
> +		install
> +	$(USBTOOLS_INSTALL_REMOVE_TESTUSB)
> +	$(USBTOOLS_INSTALL_REMOVE_FFSTEST)
> +endef

Rather than installing everything (two files) and removing the one that
is not needed, h=why not just install the one(s) that is(are) needed?

    LINUX_TOOLS_USBTOOLS_LIST = \
        $(if $(BR2_PACKAGE_LINUX_TOOLS_USBTOOLS_TESTUSB),$(LINUX_DIR)/tools/usb/testusb) \
        $(if $(BR2_PACKAGE_LINUX_TOOLS_USBTOOLS_FFSTEST),$(LINUX_DIR)/tools/usb/ffs-test)

    define USBTOOLS_INSTALL_TARGET_CMDS
        $(foreach f,$(LINUX_TOOLS_USBTOOLS_LIST),$(INSTALL) -D -m 0755 $(t) $(TARGET_DIR)/usr/bin/$(notdir $(t)))
    endef

Regards,
Yann E. MORIN.

> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
|                 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
| yann.morin (at) orange.com           |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
