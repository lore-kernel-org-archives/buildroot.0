Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC662606A321
	for <buildroot@archiver.kernel.org>; Thu, 12 Nov 2026 08:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=DFY7xUda;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=OAJS5oxM
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B482A81696;
	Thu, 12 Nov 2026 08:02:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YbJ6zMcFZVmT; Thu, 12 Nov 2026 08:02:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C398A8169A
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794470569;
	b=aEdke73Wfi7Kuv2DYjmVOIm8cLeVohxSSSkWwhmqN2W/W80ZWW2QBuZ4ewxFuYY42p8x
	 mTR+zDWbxNXsgz4IfDv13sqF5KmvgDGWljdRgFFuLumUHWIlCR+h3hnJRWXRbDlNmSTtI
	 EvTQs1lEmA6+YRwwYLEphKxdNik61MxbcWJ6h0srjNaxJPgarJ9u6oT4ztYtkSOnQKHCG
	 LzUG39aVd11znel8sB4HBZS9VmddeGokM2gOQQRfCgh5wOsTAbtSkz+cmw3zACl005G+2
	 uF+KU6LN0zHxt9NoXM06VtATZRV5IMbqozOzp0SGHyWpfwgvy93IN1qG/YIimZqj5Bg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794470569;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=FL5MBSq19LrJfCuW98qxeI6iZ1QY+zW5mG0jS46zQo8=;
	b=SgT0VaUSUkCL4wKMwX9IJ5k3qXDR7WnqEoUMnknfHTQVmmYhNnVMy0aDQkn8dJDdZsds
	 JJFH4GrHCneYngxBb03My9uLBCdu6r2GQcIBLe/GPCY/x//hqEJ3arsdxc2/LxI8XQVHt
	 VOz2egtXs2sf+hs9MGz0Pt0kuQ08rlQqsrgqW1p3+7ktsbLLkKL60dlTlhDnsjg7sqNOW
	 Wz4gYDndsaUCSRiTbLwZgTU2TFPCrbhTEYbH2F3n17ELtCAIgVvFgWiIsVfUA9jnSwsBu
	 FbzNn3oMACuqiT7G15u7gevVr9NXMGj8LeVBpn56EIF9SJkRcwQ0Qa6Ci6vhftFswmg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794470569;
	bh=FL5MBSq19LrJfCuW98qxeI6iZ1QY+zW5mG0jS46zQo8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=DFY7xUdaaaaCHTxc8AOCo3ibPAk604IiVDYLRtBqpkN+MQ5ROxVhmQsiztwvGl0Mo
	 SeX2G2MLk9T9k6sx6+5xBq+zI8xBbMhH2WPhGgw4FWE7lshJ9L+yq3DJqCO0FYB4nG
	 ZJ1lrIz03/E5WoJHh4whOfmr8iAS3539A4MEqh4TS0sQmexjHUoDIYxHJoVk4gN+bz
	 dAWSDcbJwIuBNuYy+Agu+oba5njzAyOOAj8+JI5fJjaq4Km5Xj98Ebysi15qvCZkA3
	 rAIqSgheNM7a+/Og1UYn9C8RrTVbwuYbVeCSIaAObtH7v+jzkyjV0EcOgHstqs5moH
	 gDoujRsW2zvyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C398A8169A;
	Thu, 12 Nov 2026 08:02:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C56728C
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 08:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E1F440A51
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 08:02:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D34xAAz1AkIf for <buildroot@buildroot.org>;
 Thu, 12 Nov 2026 08:02:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2C04140A30
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::630"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20260707 header.b=OAJS5oxM
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2C04140A30
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 08:02:47 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-c4d21051042so611570566b.0
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 00:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20260707; t=1794470565; x=1795075365; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Ka9/PHuLyHjeg+WD1KG/80eslLoTDigzc2nlRLnyVlc=;
 b=OAJS5oxM0rZNOaTE74WEULS8C/W8CfCeeMI9DMP+rJ3pLTsojio7li78Eesm29k5Kk
 B0EN8GXAcWxg0E1QJM7VWCmw6cqDdkKz0IVc4mJmjdvozmv7fHk/53VsiQZPhSvXSzEZ
 Kp0AHZEekM4Zt+hBm6aL8myxhYsxESMQUH6ZYcG13/oxSLpe9wbmUKkdDu5wZL9HoLFn
 APf1pIq7V0v4HSj7D4lnBzOqcUe5LsN6FKsMEYRzHIbn6V0wshsiY48Gwxz0H7KwSG0k
 /XYJKVXgxEG4OIdqR3x8xDZaUQgFKTAPiFZNDB2g7bdduvKeNzie1mnDUSwSUIGpQqBo
 F+6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794470565; x=1795075365;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Ka9/PHuLyHjeg+WD1KG/80eslLoTDigzc2nlRLnyVlc=;
 b=coiwS5u6GodNV3ZHYFhkoCcB6CyofsA8qDvibJyyu9MfiKBgX3I4aiP3rV8qougda2
 Ls57zkqtt7c3eJc0r8dgC95E4phNn9fqNmzxJ1afMlvmbEYDgKt2pHSRKtcvk7QN9j2d
 zrvdrwEsPxBvxMx92YQRRXC55j8Y/Pk00iGf6UMolsr+KoTzenGdiIrUzK9fSl3APeht
 8vN1e7TwPhA9LiFHIyPLmAJBD7BffesaGnTBJZU/RKNnIr7R3oK46wRpjuu4I2VGc8H2
 cYRqtnwwGnLH4TcNcv4O/E8DycFqnwpzawFZ3cGvrZnxx3epe6+N2eOTGol69BzdZHdU
 s7pQ==
X-Gm-Message-State: APuU4Z8Jx5SBA4/BeFd9evOAci51zyICoy2fXN/iWdLF49BDWVJ+qNcW
 DUM70jpYKKW0B08FBqgZxyzFilCobkF6Yr/xnCxiVQ5sE6321FnsFWfjwNVskQ==
X-Gm-Gg: AYBFou0JFdlNAcFXHz55oSY8cc+/laRm/uqR6wvu3Sr9ew/8AE5fjwV7/GjK35jJloY
 dXg6xPzd0zy3u0IPmocuZBF02DglN8IeWzOW1KskCOYjKxkkBjuYqNbx9tvrazdXmbN9reSSF/4
 BOhVii2Zl+EyzVhy6/ESrWc4JKfuZARD0kUfE3TJw/h/gSyiIKKb6YtSjjcG86jKeTw59AYuPEs
 OLTZLy7ZnLWz3CX4TtzdprgtgqKSkmfvpjWO81kWZncbwPffKsDDpABlqZEnw1EHprHjBAwJIpR
 wQNOd9liUy3JDhZd7fqVjNnrxxCcShXxW6nfkDhkXnnU2wMZ1O9QMklFOoPv+GZRrlakwG7piOv
 oL7hvnPitQQmjfWBs4Atq3qkulEptWTlu1kcErWH8vmk+ONgev5GTzbl7818t18w+ahgxJWeZmL
 rcIsYhJwodfgLfG4jMndGv8wSJhiWxclSQzzJaw0iuHFpD5FdCBDsIMtWXmZWwh77aiOskGjGWI
 bsYIf+mD94GBil4vnx9j/SnAazlSSX1bD95IiZsaxddfRRFYnW5fYpHixfSTAW5TqpXKxyYf5ay
 iTpRn8o9f454NZ5AgYoKtqBXxMcbQiQbF5ZKlcXooh/0lIQ+rCnMJq3lZmdaSiJChzKTmjJ7jYx
 IOKBjjw9Y
X-Received: by 2002:a17:907:d407:b0:c46:ca2b:84bd with SMTP id
 a640c23a62f3a-c5066b88b11mr417622366b.30.1794470565292; 
 Thu, 12 Nov 2026 00:02:45 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c504a663f3bsm313508466b.72.2026.11.12.00.02.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2026 00:02:44 -0800 (PST)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: buildroot@buildroot.org
Date: Thu, 12 Nov 2026 09:02:44 +0100
Message-Id: <20261112080244.2936949-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libxmlrpc: bump to version 3354
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: "Alvaro G . M" <alvaro.gamez@hazent.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This revision corresponds to release 1.68.01 and fixes
CVE-2026-15928: the Abyss web server put user-supplied characters,
such as the not-found URI of a 404 response, unescaped into the HTML
documents it generates for error responses and directory listings.

https://xmlrpc-c.sourceforge.io/change.html

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libxmlrpc/libxmlrpc.hash | 2 +-
 package/libxmlrpc/libxmlrpc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libxmlrpc/libxmlrpc.hash b/package/libxmlrpc/libxmlrpc.hash
index d7555c3be8..7487057fe0 100644
--- a/package/libxmlrpc/libxmlrpc.hash
+++ b/package/libxmlrpc/libxmlrpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b7fbe0fe9f6393c59c31f85c0ca7d050db83bb630fceef75ca7cabfd2fc3fc3a  libxmlrpc-r3341-svn5.tar.gz
+sha256  19db8cf52ee9dbb45be4bb4f1002baeafd1a949857f2f7ab15e0fe9169312acb  libxmlrpc-r3354-svn5.tar.gz
 sha256  db7a6d3f187b218c3534010a83424c6bcdef88e6a0b6b1aa3a8762238bd642e6  doc/COPYING
diff --git a/package/libxmlrpc/libxmlrpc.mk b/package/libxmlrpc/libxmlrpc.mk
index c2ccfe80ab..ed489dd835 100644
--- a/package/libxmlrpc/libxmlrpc.mk
+++ b/package/libxmlrpc/libxmlrpc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # 1.67.00 (code/advanced@r3335)
-LIBXMLRPC_VERSION = r3341
+LIBXMLRPC_VERSION = r3354
 LIBXMLRPC_SITE = https://svn.code.sf.net/p/xmlrpc-c/code/advanced
 LIBXMLRPC_SITE_METHOD = svn
 LIBXMLRPC_LICENSE = BSD-3-Clause (xml-rpc main code and abyss web server), BSD like (lib/expat), Python 1.5.2 license (parts of xmlrpc_base64.c)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
