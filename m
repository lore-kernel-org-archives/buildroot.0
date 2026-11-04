Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8470660820A3
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 21:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cRpWZ0Q4
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 493EA607D5;
	Wed,  4 Nov 2026 21:51:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4e-49iIEPPRM; Wed,  4 Nov 2026 21:51:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 738386078E
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793829089;
	b=GuIezCWH9Dw6kq/kbfjmwKuJsl6I7fuUI1lvxd3Ek3lcGD/z1mRdXISwIfrUG+hxLNs7
	 HhNc1qjJw/MrnS8NDpAR9VjCPuK+IfhIttF/5NNPTmzK1+q7Lw4xxpMFUEXYerbe/RD4N
	 e6nucaWOIeidy3bYbYObnJvfcva2mV3ymA2vlFI6bnv9UJIGLWC8Qcaw/RjXUxGTRgwtZ
	 wIhmx6BOLEZOlJ7FCatvr4GjoBS5JEA8kzT1/HE7E97KipCPuKssIFjFRxJ32IGiV+1NY
	 Lzlrf1LOigsrAlUP9vsbHPbSU5yIRxgYpBw7YlMnmp4zw+Q5lmDJmP85uIdVJhEItNg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793829089;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=eg94cSwmafc2hDmScUqKxHSkByYKCpzF+XyUuHtCGAo=;
	b=ZIMNh+Sf2XVHq1eHFqFcc2cWWW8XewVUk7eDsU2UOSwH9zoJDQEM4XlRp+m9bChYo1dz
	 jlH77rTQciWpJyQHLYwsCJpiKnru85dko4BFg8LaoIPJTEAMFGKpnn/60i+jFBU70W6fb
	 wF486Fnw6AiFusIMh47lSCAXTUkAjrLeJCM/dhmcL/+jgMkSya/NRkMfjLpbcy8V2RDCY
	 tcE5yTlAiCuc/FQvHWUZhcwkV5Lp7InGkX8bgJOqmj8LOAtnm84TQYVQsKg+Zu2qFq4G0
	 XZ7QI+ozAMqhWI5SJvgz0ijr4mODszASqmRJBIrjdvXALcn6jYhi4M/VCFownzSqypA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793829089;
	bh=eg94cSwmafc2hDmScUqKxHSkByYKCpzF+XyUuHtCGAo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cRpWZ0Q4uV+siN70lluLrxVPKdZquz28A2ZaRhtR8aRx0gxkKX5CgA9AJe3mqeWUz
	 IpkqXA1WXeSy3/pkOU2Hoq0U2cse/PrVFMtISOypxm0KcLA43iww0uVwF91575J6ka
	 VLFKIiFY2QUpfoYcc74uJUDVq9VwZXsSuRpGdAfwc/mA+6D3gNS3x2avmJEdi+jvdV
	 SGoZ2g9M9pLB6RAXpLpT45vcPSC+RIGRFFFxknLmCC2oN66YP9yYoiUGzoDU7aN5zt
	 96OTQNFAH3gyhGFif7wFoK46MXBEmZQ0pkK+vtmpscMN0PhdKbq8t2j+oRLOpvWjs2
	 bkYoi1lnXFmcQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 738386078E;
	Wed,  4 Nov 2026 21:51:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4BF4EB6C
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D3F86078E
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:51:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WoAzzdP_b00z for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 21:51:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 870C7606F7
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 870C7606F7
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:51:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 950879DE9E; Wed,  4 Nov 2026 21:49:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 22:27:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ffe8a5ff4dc7c0e77bc4c25cfe167755b993f9ea
X-Git-Newrev: 588f711cc897997f750554eca2d91ab67d9e93b0
X-Patchwork-Hint: ignore
Message-Id: <20261104214956.950879DE9E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8189es: bump version to fix
 build up to Linux 7.3.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/588f711cc897997f750554eca2d91ab67d9e93b0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes:
https://autobuild.buildroot.org/results/63c3a272019d0a84b89933ae174c85a2db46c454

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rtl8189es/rtl8189es.hash | 2 +-
 package/rtl8189es/rtl8189es.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8189es/rtl8189es.hash b/package/rtl8189es/rtl8189es.hash
index 2eaa881d00..218feac40c 100644
--- a/package/rtl8189es/rtl8189es.hash
+++ b/package/rtl8189es/rtl8189es.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  e8beac10341e70779a7699cb806504d84107d59aee2b6c0919b1ffe5f8236bc4  rtl8189es-0a5d04114fac3c9f48a343cb905fbb6a3f9f5df5.tar.gz
+sha256  c65493802f1030756cd6978598819937b0a78f09d1210622c50847c040113848  rtl8189es-f4712611578312fcd67795a0d43d78eb70378238.tar.gz
diff --git a/package/rtl8189es/rtl8189es.mk b/package/rtl8189es/rtl8189es.mk
index 55536a5b59..26d8aee690 100644
--- a/package/rtl8189es/rtl8189es.mk
+++ b/package/rtl8189es/rtl8189es.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8189ES_VERSION = 0a5d04114fac3c9f48a343cb905fbb6a3f9f5df5
+RTL8189ES_VERSION = f4712611578312fcd67795a0d43d78eb70378238
 RTL8189ES_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189ES_VERSION))
 RTL8189ES_LICENSE = GPL-2.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
