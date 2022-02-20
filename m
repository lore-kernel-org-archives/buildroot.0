Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F12C433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 17:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 958D160BD5;
	Sun, 20 Feb 2022 17:05:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q_ciWSDIMy5s; Sun, 20 Feb 2022 17:05:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD0A560BCC;
	Sun, 20 Feb 2022 17:05:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 981AB1BF20F
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 17:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 948E2405A6
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 17:05:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ozz3Ey1-YxnH for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 17:05:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B5514405AA
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 17:05:20 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id ay3so2250288plb.1
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 09:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=vpErS37TIoqnjuDqW9bslvkiZNSyHE015HjmVRNhLz4=;
 b=FMLXaG/WZwIrlVp9phwa5WbkkuSGO4aXlNKiu2a2X/BiyXAjD09/Ujer+1dssK0Q1O
 ZjCR9pb6+k8Aa0JRsvUf4eb4EJvhkWOEYvEf1ZSK/mutGZ4Kt6MAnRTN0fe/jzjbecuD
 8OcKQ3NETuckMzumpnHhs98g7pMm4MXHPu+oA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=vpErS37TIoqnjuDqW9bslvkiZNSyHE015HjmVRNhLz4=;
 b=1fnG2fr5Z/4RSEjVkV17PPjvN1VWTYsJ+z84A7rCJs/zZWl2r6XEkQgZwIcQYqHjKn
 NBTWoxsZ5veRld8ykolDxx1x/ABupJ44oOmn7n2Xt5+kc+UzT4f9R8e3s5E9oeU++KbD
 whPFP1ocYRcPOX5Lz9yEZlw7QhnU1wodqC7lWJdzf1EAcx5BmIP6ZoEvaPRni89gzqA2
 0u891TOwietw3MISI46GE70lM7TN7EufOw+gwDnNfnfCQNU03/TARVEsGAPl7vuwmGUv
 FRaWKs/hUxasDTGVcAMpofclWx5SE+q/95FPxab6X6uR6hTiI/9+pjlxjidNlzFoyDCB
 D7gA==
X-Gm-Message-State: AOAM532BJs19g9coqXYFIhNCjrvboNJwShvEfiajKootouqd9TOaQbxC
 ipgWZBXQNwML+nObcZe7lc1Zlq28Vu2CcwOCJlvIPvASrNTBFA==
X-Google-Smtp-Source: ABdhPJz+cIWubymhPkd7W2l4uGm4iz4H4JQZRAacfx6JnWEq1JVcqjjR0dqFaTgHnpspehAEzb3Jll24ZG2964WB6+4=
X-Received: by 2002:a17:90b:2516:b0:1bb:f8e6:f568 with SMTP id
 ns22-20020a17090b251600b001bbf8e6f568mr7380864pjb.118.1645376718886; Sun, 20
 Feb 2022 09:05:18 -0800 (PST)
MIME-Version: 1.0
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Sun, 20 Feb 2022 18:05:07 +0100
Message-ID: <CAOf5uw=9FxAfegsPf7F2TG3ZPBvyhTb9aCOCJwZLogZvVRJWJw@mail.gmail.com>
To: Buildroot Mailing List <buildroot@buildroot.org>,
 Arnout Vandecappelle <arnout@mind.be>
Subject: [Buildroot] imx8 common script problem
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

HI all

I found that in order to generate a correct flash.bin image, the
script at the moment are broken at least for imx8mn. It works only
with this change

  ${HOST_DIR}/bin/mkimage_imx8 -fit -loader
${BINARIES_DIR}/u-boot-spl-ddr.bin 0x7E1000 -second_loader ${BIN
ARIES_DIR}/u-boot.itb 0x40200000 0x60000 -out ${BINARIES_DIR}/imx8-boot-sd.bin
        elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN=y$"
${BR2_CONFIG}; then
-               cat ${BINARIES_DIR}/u-boot-spl.bin
${BINARIES_DIR}/ddr_fw.bin > ${BINARIES_DIR}/u-boot-spl-ddr.bin
+               dd if=${BINARIES_DIR}/u-boot-spl.bin
of=${BINARIES_DIR}/u-boot-spl-pad.bin bs=4 conv=sync
+               cat ${BINARIES_DIR}/u-boot-spl-pad.bin
${BINARIES_DIR}/ddr_fw.bin > ${BINARIES_DIR}/u-boot-spl-ddr.bin
                BL31=${BINARIES_DIR}/bl31.bin
BL33=${BINARIES_DIR}/u-boot-nodtb.bin ATF_LOAD_ADDR=0x00960000
${HOST_DIR}/bin/mkimage_fit_atf.sh ${UBOOT_DTB} >
${BINARIES_DIR}/u-boot.its
                ${HOST_DIR}/bin/mkimage -E -p 0x3000 -f
${BINARIES_DIR}/u-boot.its ${BINARIES_DIR}/u-boot.itb
-               rm -f ${BINARIES_DIR}/u-boot.its
+               #rm -f ${BINARIES_DIR}/u-boot.its


The padding seems correct even in the origina soc.mk of imx tools. Can
anyone comment?

Michael


-- 
Michael Nazzareno Trimarchi
Co-Founder & Chief Executive Officer
M. +39 347 913 2170
michael@amarulasolutions.com
__________________________________

Amarula Solutions BV
Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
T. +31 (0)85 111 9172
info@amarulasolutions.com
www.amarulasolutions.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
