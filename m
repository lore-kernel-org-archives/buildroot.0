Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A3FCCD184
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 14:32:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CDFE83E90;
	Thu,  9 Oct 2025 14:32:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RQdhC6baoIZW; Thu,  9 Oct 2025 14:32:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7200683E8A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7200683E8A;
	Thu,  9 Oct 2025 14:32:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F88C226
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:32:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C85041056
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:32:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qwvnOEcNA1ze for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 14:32:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4505A41052
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4505A41052
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4505A41052
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:32:37 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.1.172]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MnJhU-1uNezP3QYO-00gfot; Thu, 09
 Oct 2025 16:32:35 +0200
To: buildroot@buildroot.org
Date: Thu,  9 Oct 2025 16:32:13 +0200
Message-ID: <20251009143216.2282077-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009143216.2282077-1-fiona.klute@gmx.de>
References: <20251009143216.2282077-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:raw6WCwFMmHiBLIFXbFeGdEuTpA2IVbqOLv+nm8CXHbyjkunhiv
 FgCUbD2J7UTYv3mRIY/DRI2t6E8Qrlb+HoM6Ge4wQATkvkJDc3oVf+/MFsYG6bvnel92wvV
 8hjvGjJQaPdmxTlFKrqVQZ2fJEmubaBHOjm5KinYVNt8AS8OvKynGuAXZUfVpbtFLcwACaq
 PDge+wWOBWxoSSaeMNHiQ==
UI-OutboundReport: notjunk:1;M01:P0:K/bK+xP3MVs=;Cf0Rp7yR6yKSM7K+rOJC2CMciij
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1760020356; x=1760625156; i=fiona.klute@gmx.de;
 bh=t6L3hQa/dqWj6C4K//lTvfDLqv4gIVp5EUoQPplZkUE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=V5iCc5aHfk4JVXGxQH3C1C9ng7yky82EKmNM9IJFdaw0HOlX6BfgSFRBrwAUV57n
 sT/nQQryrKQum8Bzh6T45PS0exROuJIXvnAXesNSZEY6NM/9T1P0O1Ad9bBN6yL22
 FUoIi2zCggl+dEV7/QQvmnp4dqg8b4QYAgzkSjFq8gqHREpiVz3y5OaaKq2JauhpW
 MgyqiedWRZfYP1y252RMFK/Gn4cqt3m6w3Ky1CodAh2kF/FobBZRENbEEbZTH34B0
 snVPAyRpJu9CjL+eMCKiMfrKyOs7E9j4vvZvpHblKckc/h6e0KCis6gl5n5UmzBli
 gRKzVghrHeo7KMCRlw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=V5iCc5aH
Subject: [Buildroot] [PATCH 1/4] package/selinux-python: install modules to
 site-packages dir
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Antoine Tenart <atenart@kernel.org>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

/usr/lib/python$(PYTHON3_VERSION_MAJOR) is for the standard library,
additional modules like this should go to site-packages.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/selinux-python/selinux-python.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/selinux-python/selinux-python.mk b/package/selinux-python/selinux-python.mk
index 635d5945a4..27ff12ad06 100644
--- a/package/selinux-python/selinux-python.mk
+++ b/package/selinux-python/selinux-python.mk
@@ -14,7 +14,7 @@ SELINUX_PYTHON_MAKE_OPTS += \
 	$(TARGET_CONFIGURE_OPTS) \
 	ARCH="$(BR2_ARCH)" \
 	LIBDIR="$(STAGING_DIR)/usr/lib" \
-	PYTHONLIBDIR="usr/lib/python$(PYTHON3_VERSION_MAJOR)"
+	PYTHONLIBDIR="usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages"
 
 ifeq ($(BR2_PACKAGE_SELINUX_PYTHON_AUDIT2ALLOW),y)
 SELINUX_PYTHON_DEPENDENCIES += checkpolicy
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
