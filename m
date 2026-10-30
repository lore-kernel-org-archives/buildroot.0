Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78389606A31D
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 20:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=c3Q+3kDT
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30C948115C;
	Fri, 30 Oct 2026 20:50:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KHSPnrCap3Nt; Fri, 30 Oct 2026 20:50:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E33768115D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793393452;
	b=QURs/BEWL0yrfQ2hM5LhJdNzP0Ep4zXJPoryv158/wke1Cz87TuTup4CjF0fFB0jRDXK
	 NF6Pc93ncc8+ATZork8M+IYTAlM4vJy/v8q01iCTtFS4hi09P2bAfapXiMcBLWo9LJP9b
	 3FKfVU46PKRtpLIPcXw/HosEy+Nz3XPi3LMw8tMyjmwS/RSAGtUIlbdMC/p9StTg7Ej2y
	 PqyUiotVjXaTO/XGxzPBC7x0ABDKcH51IUFcM6p/88gY/HrYuA9YuFgvY0PjqQRwm2ssj
	 NeYBWOreOb7dmmNynFVRsimsxLQgieZNmtCq4cWZrHQNKV8f/jUN1A/KwcT1Wpd2k4g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793393452;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=RH3H9FQpv9m/49fATm3y+JNAjNBHyKqGDuIaKJau6MM=;
	b=AcgwITm/DRVSXUjAaIp82q1OUVqCgJefiY7zvT7zL9eSvlY6DJp1KaQvclzPmiLRnsTz
	 pfPOGT83JTXhlan9wQNI7gPk0gwkwgYlPPcL4gnDy7LOBdWCl6NupoTZHJAzeBF/x6Y/d
	 RceBY6xMd6Q6mxmD7xsLgfvcogYDKjB0HCRqLfgXDERLRhcHItRtZrjrrWPTENw7bw0cy
	 5b4lYiX8Zb+yOyuWHvirISTARj49qi1OqxmoOPpplbh3AgtDgGatSxUEOEhJx6zJNTp0+
	 Qn7Gxz4PH7rE0Zhzw23RIVUV8OKm/Y6/CBbp632dldENC7e46KPlhnCRHqvvoiKI2VQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793393452;
	bh=RH3H9FQpv9m/49fATm3y+JNAjNBHyKqGDuIaKJau6MM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=c3Q+3kDTYCdA5yR9i5GsoidIioROSbI8iN2vxghxmgd4EQXIF4jJcmfnbiNe9ORw3
	 YBzANO3MpE4FLvzWd04vcxsFqAWZfYBaYxjmA/AAxjLbuvdCdm3jiWMDGgE9BTlnWk
	 iCxq2lo8Wk01o/1KsmVgRO+3EJJo9tyHAjyWCYjWMfDtwK0sV6hLR7pCBqWTTIQ8qQ
	 XGkGHwystxfe1tsUVOpFe6XYH64+l529ldXwFE4+V6+jRCDEpEFRKPBM23MMdLw3JY
	 hx04/hUTav9LVyYmSYyAd5NMH37i5IYdt2fVbQ/UUjAnKgBEp7xhwvly/LVkjmLaV6
	 gnjS0mI0sln6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E33768115D;
	Fri, 30 Oct 2026 20:50:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 95E174BC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 20:50:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9350240541
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 20:50:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id byW5d4bknQ0Y for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 20:50:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A29FE4052D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793393449;
 b=tBKSUievU68bXNXXZVwxsqnw8YPZ4Hd8yIptBvY/TvdmhtMYvPZt3YJniHynSYOlTlL9
 zcsDaM3d6U+J3bpBby3TZ56jbp8nAJylpV4w1BCudr8RLBoaDb1lBVpobC/EVVyuM2NzQ
 aCQDCO3V7us50Qhu3ZmT8KzUb8fq0o7BEOZ7AkyQVNQnwwVX67yVpiAjKLGajPUrV9dQr
 GSlUut+GTM35BMCwl9qctPf31bocOqjHPWzHEg3M+72q1E1y1MsBkeszuQyagGwArZXKV
 JLjE1g9BChCFtll2FCtE05Ba6hBQ7BqAL5qHh4Fe6y3V8Uo+1GqZnr6zq/97Simek3g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793393449;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=75uoqL7gmQ9dByPvQnAmfokBuEU2bLRaAW2igTZsNn4=;
 b=b/RH0bfZic6kfJNcbQFVhWmHcresGRx2/x+LM+fE0pCoFgXvMjfgch1zv8aCggE01HvB
 vwbVCdIRRsVAomP9ab5K+WpW1GRaBqr1Q0bp7qC1pmKkpuJBiE4SL8HJOC+HHXolp/XuH
 hg1yB3e0Gk691jP+b+wutZes/cBoVDKdEie0Sw1yANkz/GfTBXFevp+ysyjZVY6U5PHqn
 4DCNye+8Qd5BhOT8T6sVZw77dOPsSMbu97k2MUd3dg7lrbzoSMy5Ye+mYlZUUZvu7dcFA
 iXrZbqcbv6QjULjdylyj6bvr10lex5B0jdy75RKxcxz1TKEbe9IQm7cdJiqngDKY5GQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=kIU2nQZ3; 
 arc=none smtp.remote-ip=212.227.17.22
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A29FE4052D
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 20:50:47 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mlf4c-1wfcNb1Ick-00c8DK; Fri, 30
 Oct 2026 21:50:45 +0100
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Fri, 30 Oct 2026 21:50:33 +0100
Message-ID: <20261030205033.839644-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261030205033.839644-1-fiona.klute@gmx.de>
References: <20261030205033.839644-1-fiona.klute@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:4aYpRXHcEJVkysWKu6TXqZxVW7cpjCL3M6lyVMpjizy93yZepuV
 L0Rd3AwELggucRn08amWdGjh5QpmLZWS2ajRJnUSfdUvwPyfD0gxv2ROE/qayyQlSXlNYs5
 QFFBno2IaFwxHGfklu6QGbGGIK5LLd75vUaAyMr7xAk/uGUa+miIWcvuvsQuSHJpZUxx17C
 TKoKyZS7q6OPvsziYLl/Q==
UI-OutboundReport: notjunk:1;M01:P0:Ff2oaXckhQ0=;MbzqsWQ+QLIgr9jQGnnngW6c2Zx
 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
 Lh5shTKmVVl3aD9/gNg==
Subject: [Buildroot] [PATCH v3 3/3] package/lvm2: enable udev
 synchronization if libudev is available
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

Udev synchronization avoids warnings such as

> dm-3: Failed to create/update device symlink '/dev/mapper/data', ignoring: File exists

and duplicate device nodes, in this example:

brw-rw----    1 root     disk      253,   3 Oct 30 20:38 /dev/dm-3
brw-------    1 root     root      253,   3 Oct 30 20:38 /dev/mapper/data

With udev synchronization enabled /dev/mapper/<volume> is created as a
symlink as expected (different dm-* numbering after reboot):

brw-rw----    1 root     disk      253,   2 Oct 30 20:46 /dev/dm-2
lrwxrwxrwx    1 root     root             7 Oct 30 20:45 /dev/mapper/data -> ../dm-2

When udev synchronization is enabled, libdevicemapper.so is linked
against libudev.so.

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
* New patch. I had seen the warning before and been surprised at the
  duplicated device nodes, but didn't make the connection until
  reworking this series (and the systemd updates).

 package/lvm2/lvm2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 2656d81716..504cbaff0a 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -40,6 +40,7 @@ LVM2_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR)
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 LVM2_CONF_OPTS += --enable-udev_rules
 ifeq ($(BR2_PACKAGE_HAS_LIBUDEV),y)
+LVM2_CONF_OPTS += --enable-udev_sync
 LVM2_DEPENDENCIES += libudev
 endif
 endif
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
