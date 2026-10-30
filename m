Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9694606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 20:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=fn2JZtAz
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 801C78118F;
	Fri, 30 Oct 2026 20:50:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cZKuNxk2lM-j; Fri, 30 Oct 2026 20:50:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 84CF581163
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793393458;
	b=NUvpBPJFddZtGBXd0ww5baGc0lgQxHvcdkXAhsAxTFWpVbzCEBHssyCHZ2O+TSi5E3RK
	 LxbgzkRjoBHrJoz0Gvsd9of73zczIuvNKF2BWheUc5tVUvi7PWljoCIjJt0S4AEH6A3X9
	 027XCiGMA43XoHkRisgaEZxN4zFjC1b4KKH7fmnBKiTCGRrgJ+JOfOgBu8r5hsYuUbvux
	 BezIEZViFC1F9Oar3LMGgJu/SqWr/SUQdP5O1lpBWZHmOSsgjfH8fma1UocZU0/fQK7v3
	 tyzBYoA9dYa6A1HLAV1tAEyYnIRZZnNv2i8dlSucuY371CNwzl+8y5VCnILNF5DzfiA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793393458;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=9r75MuZxurS4ShwmGyTck+TcMYAQ2NQKSsHxpBv3oYk=;
	b=fQy5xo/Q6rH8nvjGulgDjoKkpT1s36EeswaqCAQ3Ry3y+BcPEtNHTgVH5HqaMNVsoPF/
	 pF9vOGmsspcRHJPvCCDSDxfFxMV2w4SVJ0Mt03jZWutllSKSmtThs/OOywgpzBw59kHZj
	 bITtcR4cl8f4d23Op/tVJfwtThzn93FdMOb6MC1yGCcBxVDYfFvTFnp1ATH9r7tLt5N1b
	 K0poNIXKKyKEHW0o6B8uzpR87qBGjdMtMrwrmMdg6oWJJn9z27yT3yNwUfjMQBKQh8gV+
	 oC5616ZoTGdPYHWNaAiDoeXC5RF33sM5J4Z1sCuLP8ikX2K5vcORbtwkmvuwaPu3tKQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793393458;
	bh=9r75MuZxurS4ShwmGyTck+TcMYAQ2NQKSsHxpBv3oYk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fn2JZtAzPDbXNy+J9mXDvX9jCOwiO9qy3FQwOG5YfPiOzMJhHLDOJtxNJCghhvAs9
	 yg1tPFwTlWmlcfMO7AaJA4PqwDsg6ALoOwbdSBVmZEovq7ToEElwHtsNbaUDpLRCrj
	 UcnWfqeEYxee6NjUNoZJKcdbnx8iiaKIHXx9zrFwkQACZam08v4hushxdnL1Ur0NFp
	 yo38kdxEIKHgqg1HNnD8uKVkPDbTCfK2BToQWE0i1FiPo3D1bkqF+7fHyBdRcdTZzG
	 jzH5EXvU/SesFPUB0xuwWLy6jJ5HGi2sKLegkIjkBQR1Ur70jH82hspzXw2jAgF5Yk
	 YriZKlDt0iTcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84CF581163;
	Fri, 30 Oct 2026 20:50:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A9DFE362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 20:50:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 98CD281188
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 20:50:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BaEWg7DHvB0k for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 20:50:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BB84781160
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793393456;
 b=ZzzQPX2z3vXWVYR6mtDzzo7We5upmILbJNOtHNG93QRx/L/vPaX6jJnognZ7erIuNljf
 C/NbeMiNIONUG8YJWDCulPDgMGYFWfAfki4XyBYdHg/mQzTXnh/lbWKAWHveWZe6FxrbH
 xyp84HpYw85LfRpRvRYjkpbATUAjDPapZ5FBZEub7iqptwr2vDvrEVMu/mFDVKSVJWwBV
 sMc+mTchoVBpVEcoe2ZGieikPYQnmEXjiYxYQr+O+BqY32fMgUlO7h0t4xNttvrgY2EsY
 Q8NwXzMX1QXJAIzOafyHhmq5u468U1ijTisXlWTqslppkWTUSurKiIOHWbPL8hpPrGQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793393456;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=VN+OFZqdb0p89DH2YqB6YinpSLv7T+4B0qLBJIKO09c=;
 b=ZsqFZNEeh6djXu+VvI/dCDjGz8PbLgouOP0j6oi3JXEXaPeXS7+P+QuMNXXA14IXXJPe
 tk3UnAVif506GPYshuklbEs8maS9ihe0EljrT+xZt9vG5vic8NIuV22LryvJpGDjrOYyB
 TRLrt+FnbfTyADPJoJKXJEjEh6GBuvXndN0pcXTgPC2bM9eNmmvZ5bTgSxnV9ux7/mXc5
 lBwQ1o9GA5JPnMjYE9UVfKqCYhddr0Lk4yBO5iFaLoXB6cc8hmKob6uKLhbOp7r1jdGQA
 ACTyVO/hR1aGwgHVCnaK4XTWm+nmsNDzs/yUsjLexStgkWZkvQsAki/QVAqofiX7esA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=fF2aZmgB; 
 arc=none smtp.remote-ip=212.227.17.20
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB84781160
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 20:50:55 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N4hvb-1wMiU02a5n-00vAfX; Fri, 30
 Oct 2026 21:50:43 +0100
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Fri, 30 Oct 2026 21:50:32 +0100
Message-ID: <20261030205033.839644-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261030205033.839644-1-fiona.klute@gmx.de>
References: <20261030205033.839644-1-fiona.klute@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:YYFQepZ+s8VdvObaJ4f+Z3z9QNBkbWOhOXJa+fSaNA5gnYkm96S
 QUzH4CRG0eKvOTTZ7llA75mTcDpdkzungcPM9BIQ+jPvCNDvGsuhHGkzNnigO6iyiHmcIqc
 9dGOKDXHSJFraynjxtoA9iqBkOAZksID/ctzUo5PxKdbRWr69CsxkRMc6zwUj7T2sFVd2Y0
 1HWL4J3BB70/j6UcTtq2Q==
UI-OutboundReport: notjunk:1;M01:P0:jiSPykAwWzo=;k0TAUdPpLU+JQNYZF8iv6N7B9ze
 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
 6ICYv
Subject: [Buildroot] [PATCH v3 2/3] package/lvm2: depend on libudev if
 enabled
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

If a sufficiently new libudev (>= 176, so actually pretty old) is
found, the udev rules installed by lvm2 request the built-in blkid
implementation of udev, instead of calling "blkid -o udev", which
Busybox's blkid does not provide. A practical effect of that command
failing is that systemd never considers device-mapper block devices as
ready (seen with dm-crypt and dm-verity) when Busybox blkid is
used. So depend on libudev if it is part of the build.

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
Changes v2 -> v3:
* clarify commit message

 package/lvm2/lvm2.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 21fd5134c1..2656d81716 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -39,6 +39,9 @@ LVM2_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR)
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 LVM2_CONF_OPTS += --enable-udev_rules
+ifeq ($(BR2_PACKAGE_HAS_LIBUDEV),y)
+LVM2_DEPENDENCIES += libudev
+endif
 endif
 
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
