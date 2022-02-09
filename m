Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C2FC4332F
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 20:21:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1E53819CC;
	Wed,  9 Feb 2022 20:21:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B5JDmIZD6Wcv; Wed,  9 Feb 2022 20:21:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D9AA81991;
	Wed,  9 Feb 2022 20:21:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E8AFD1BF42C
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 20:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D625C40178
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 20:20:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kSiRxsoE7LWr for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 20:20:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B7E7140150
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 20:20:57 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id i19so761357wmq.5
 for <buildroot@buildroot.org>; Wed, 09 Feb 2022 12:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zZC8prBXE9UIdcJYwWJwXWkHTzjM2GId6VKklS8P2qM=;
 b=d67Tx63wEkjusFSg19sfN3O0hQ1H0/aTr0IvwzNdd+C5e8IGkCiQDjZJAx7H+U9Zjz
 wrbAdR4Rqgm4uDaYO4lV89URIXo1WFN/JnHwl1h60qrOfVx5Hi+3YNoD2FKcleq2wOkk
 IuqmhgTM2KOzKtkr/Q4meSHFGYOZkaA9G3xZHvT3uBO7r5FT14W3P45fDENqIIjX0XBv
 Pngpf8Ctd3v0s1x0c+f3IsA7Xat/8PKu+cC8JKNhQglCOVdcoC9nc/W8BVY9AZ4J96CG
 9vdElroxFWofwA4/sJRNTUAHys6Tdchwk9uByub7wc9LC6GafZP0s/Xe3n/ACQku7c7u
 lX9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zZC8prBXE9UIdcJYwWJwXWkHTzjM2GId6VKklS8P2qM=;
 b=nGrAaZTOmbiaK1JuSh55n8DtifjnaRSTK3SWhfHfjTgBbCtKoViIvbFsgqBgLRj2TZ
 SvcgCl8PhdM7oTwNrHsrAFrlq1eQSXRcHWvkMcikg+5pVRT5nJahQIb0IqfY+RAdUpTm
 yzH9udi6dU7QANqXegt8suwU53oAHehv6Mrj6zQ8+ajb3WEGoruBdsJeX6CUSTpr8Xp1
 6RdU/0AsZimUpPib7zyaRJPRLC44MWpS9Xros/v5TDGdsM9ueK9Tzkyt6K7g3KlbXWgj
 M0282NpK3YINWsDqWEwT3Fk0WrCovr/DonY82mqFQvk/+NX0xdhfhLQWQJuUPE2lYI5G
 y9LA==
X-Gm-Message-State: AOAM532580rhWtlHYl6gY/dvRuNu17voeOHSG6msT8B6mW4DFP3sEqEf
 6u1CP/+U0FnsdjAcJM82i9wEYK68yH0=
X-Google-Smtp-Source: ABdhPJxufZD750k5LfLh0nnCH+1dT+gKSgbbceD1Lm1DVzwUfN3ZUlYU1GPOT/XEv+376MwndG7ikg==
X-Received: by 2002:a05:600c:17c7:: with SMTP id
 y7mr129127wmo.40.1644438055702; 
 Wed, 09 Feb 2022 12:20:55 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id b18sm9496070wrx.92.2022.02.09.12.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 12:20:55 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 21:21:23 +0100
Message-Id: <20220209202123.354897-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/jo: bump to version 1.6
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/jpmens/jo/blob/1.6/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/jo/jo.hash | 2 +-
 package/jo/jo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/jo/jo.hash b/package/jo/jo.hash
index 8f1cc8fcd9..efad8228a7 100644
--- a/package/jo/jo.hash
+++ b/package/jo/jo.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  24c64d2eb863900947f58f32b502c95fec8f086105fd31151b91f54b7b5256a2  jo-1.4.tar.gz
+sha256  eb15592f1ba6d5a77468a1438a20e3d21c3d63bb7d045fb3544f223340fcd1a1  jo-1.6.tar.gz
 sha256  41d8b23dc6e76731f4920b9ce42d0d4a248d243a510319e2441d174a115f35cf  COPYING
diff --git a/package/jo/jo.mk b/package/jo/jo.mk
index 24b499f345..dd5dd03ddb 100644
--- a/package/jo/jo.mk
+++ b/package/jo/jo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JO_VERSION = 1.4
+JO_VERSION = 1.6
 JO_SITE = https://github.com/jpmens/jo/releases/download/$(JO_VERSION)
 JO_LICENSE = MIT (json.[ch]), GPL-2.0+ (rest)
 JO_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
