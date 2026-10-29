Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492EC606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cRM00d9j
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24E7F40C6C;
	Fri, 30 Oct 2026 14:18:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TIa1NPEwtL9D; Fri, 30 Oct 2026 14:18:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 43C5540C40
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369896;
	b=KlKIVol174fvXKGe6V9jZ7DvDiUJKlgV+jem2ri/zvMSTEA7PNatf3Dw+eWI/RSLuCSM
	 x53mrCEBSqLVH/prKm0Sp/H/hJQ0DS2m0dvykgS+ZmatAjvpcBPsYUxMJ58vrqF+zSmtj
	 Yrs20eN/Sojbx8aXkVvOT3na9XNldUkJc+fBGEHA1pumosJqvAA/4x1zPi/ef3WNLLStK
	 YIo5HTchR0SPcqGIs706yvVMbMpGgMg6P8dTkQMtiWoDTqt11T0/VCQAlX6tr/wFwsMom
	 4xOOshBYfvgwRVKGK15h19Rp6XZ4f2yQGMuLhk8zxUtZYXnd72HfL4FCUGFKZCmHspQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369896;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=UHLZdZKWmMzauiPNxWoujGy69sIHP+32r49SDszfuts=;
	b=cBgqvwmsPzpUXcfsxy92T/EolinWFsONwFyoYfka04BnTuuRt5p87LdldT6CoACwAC4e
	 ws3Wbi3LM0lkHlEBxawqwuPaqphdDH7xKJR7ATrU1m2JP5i1ijtf4wvzIFrvikJTntpOX
	 /06Gpm38FsVJw3kQYoaDCr50TLjkMljfYk1sOig4qD8zNNp5dEZXi5EZYe4BTQxQEDEp0
	 COvuu9B+EiHgbg7IBXxFGCYGgH1Ze/ijovdLdCptaYo3jD8oqtwz9YrJvLSoBh8HKsnmy
	 TwELu9beDUvSqJEsmUAYvkcJM/81slFFNkuNIarMWfAxLJZkHhr6n9nRCHk5PgogwzA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369896;
	bh=UHLZdZKWmMzauiPNxWoujGy69sIHP+32r49SDszfuts=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cRM00d9jnQjVssuGXPRkfhdJok9Cq+1dlm8rpHp8Chnq+NQPpnp2kFLdonVKNsB0m
	 ZsKhjc2GkgJX2zf4qm+PbH0bg0neG3oj4oTFMtCI4RVxG7Bz864wL5ZIL1Q0BXuZOQ
	 MPY7m8c2bTQ/40u2ocK4mU1LN1eRDlN37G2XgFokWd2YixQ7w00a9F/GqmCcXfsJ8x
	 wPIAyZlqsjEAfLQvPoYZs9uaMl1VtVSFSnxwvqrJimHdjfzc54DJP4Va9Nr9Xj4Yx1
	 5jWLsKDpGNtRYgg7UK0YW/X/+XhcVnvsTdFgS9KBW4IzmDCg/wZi7OHhh+ur6O+tEC
	 BiMmmvhrPQn2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43C5540C40;
	Fri, 30 Oct 2026 14:18:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A26A7D44
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84B4440BD0
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qtqb8mKwuxcF for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C00A240BCC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369883;
 b=Oi8nykAeaZ7Hto8Uz/8PUv7Z1jDldRgJtaHggy31WMaV5UQlLp4l3J4T/B7/b/9ACm0j
 MZ2M6uwlcyc1PTeqyt1pGJnbr4Qdj+ZXakoHeGUwGEiiMk2uiLOc8aWHrCSvpg8Gw0i0P
 XRe/Qfo3PCClgluzEGZUPlY9/LRIn4fPXo9uuJhX0FOVksQHPUoHLJIoepuJtoYAzCY4u
 p6p+8gQQ8twUxad51/KhjMvWAMDBNNj2sprJUddOVbWLXfSpvDyGI5dg2/iQGoe89lPsK
 ab+p7GWjdSDynouPS9jlXAEn8gy6wHFpnxc6OE8efs8Bo+zbO7ezcW/9jra3MHz/0zA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369883;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=NGdnIzZJ9cxQcqigtyuLZcj5lvP4Pv7T8qVuwNNTEUk=;
 b=dMULNT/Yti+MP12Yorsm+F+KS0DwGfVDisqdH7MqvrKi5Gdz7ORKZp3wuGtUMqXz/DhT
 Z+W8c3ORoQmwIW8UA/VX4op69gA7uhlHcO2VgEtO3V2QL9v4vAQWnltLkgckPM2WkJdSR
 7e0nLiVXEQ2RF4LJdBieyRh9Ps+XM0YQyr82Uqd+i2Q3T/+7OVxjaPTpps0vGyyzDLZ/T
 +86TnBDvoaNL7kjqhW0CXCf9+hEo/UvB9ngwS+xNN8n7yKMLAxhq6QnkuqCLypLFd5iYs
 C6d9pvqRQizL++uEAw8XAsH1fwzYeZ+jJQQ/cDcMgKYUJpGhngw7AlfBTu6unJRIA8g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C00A240BCC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BD79F9D38A; Fri, 30 Oct 2026 14:16:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:03 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 326c23b25759c5c52ff52c9446d73116e831a226
X-Git-Newrev: bad8be6c65ce4c0d225b295b150a257c05881501
X-Patchwork-Hint: ignore
Message-Id: <20261030141635.BD79F9D38A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/uboot-tools: fix
 build without FIT support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5730917247484054823=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5730917247484054823==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bad8be6c65ce4c0d225b295b150a257c05881501
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Commit d7ccf54d7f8cfcb1ab40b227c080aee36f5a6aa1 ("package/uboot-tools:
fix target FIT signature support") changed how options for FIT support
are written to include/generated/autoconf.h, removing the
unconditional "echo" call (possibly with empty arguments) that existed
before. Because of this, include/generated/autoconf.h was not created
when U-Boot was built without FIT support, making the build fail
because of the missing header. Add a "touch" to ensure the file is
always created.

Fixes: d7ccf54d7f8cfcb1ab40b227c080aee36f5a6aa1 ("package/uboot-tools: fix target FIT signature support")

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2d3102a8b313302d7a451ddde4a35dc914e1397b)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/uboot-tools/uboot-tools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 32fe9f1d7b..87b708ac5c 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -31,6 +31,7 @@ define UBOOT_TOOLS_CONFIGURE_CMDS
 	echo "#include <linux/kconfig.h>" > $(@D)/include/config.h
 	touch $(@D)/include/config/auto.conf
 	mkdir -p $(@D)/include/generated
+	touch $(@D)/include/generated/autoconf.h
 	$(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT),$(UBOOT_TOOLS_ENABLE_HASH_ALGOS))
 	$(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT),echo '#define CONFIG_TOOLS_FIT_PRINT 1' >> $(@D)/include/generated/autoconf.h)
 	$(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),echo '#define CONFIG_TOOLS_IMAGE_PRE_LOAD 1' >> $(@D)/include/generated/autoconf.h)

--===============5730917247484054823==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5730917247484054823==--
