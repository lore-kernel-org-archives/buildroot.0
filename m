Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6BB606A31A
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 21:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Kh35MC5a
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A874409F1;
	Wed, 28 Oct 2026 21:39:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QH6Gbg31sCXN; Wed, 28 Oct 2026 21:39:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3E9A340A2C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793223580;
	b=OTSuxHghDn39BXAQca/eFTJ9gdnyTZJOt2Rvmdw2Dq9hF/A5RH6eDIS7MV4GvxOOiiig
	 IxXeWgCyUJadVWi9tEEDySH8MV2wrkAXUgYNMcE8FMJXlCqP2AgwH8gbGTNHLcHIkOLZc
	 xkjXijJucN1A6oY5AnzS4MVjiIVVofiqrfG9oPO0E9X1ZSZrgAqUAWoaHKDrEmebf6GA7
	 dTm9mYfV6VMPa+qP57b/pCSjjJ2eqfQ7W3IO9txNEI0VIfewtX9cEd+SfdjX6xGvOMRUG
	 P2l7dAMnjFD197slCkEpUA4yYRLE7Ribv67DWOwAqzQ2H9Owk1csBh8Er0qc/u3mUxA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793223580;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Relaying-Domain:X-CFilter-Loop:Received:X-Received:
	 X-Received:Received:To:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-DetectorID-Processed:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=jHPfN6vY2Njp2Qqy4oCVd1ALRY8zT87uQDyQexm7rks=;
	b=BBu3Fgmt8pQdZhl6xAoJDr8PidWWVA0vOkoeO9iFlUoDx2Qv22kzFjqwV42gBo3aRUDE
	 Qr1tuVU/WLQcGn8a1ToVII3cNqJges/8mblF4z+aI1jLNwGTgyBZph1TomtrBP0v7aG5G
	 g3xoALb3tbA5hyy4XA7/HIAPND+wxPN36IEr6D7vIEBGeZprQa9iUxJDmPMHtKkdV+8ZE
	 IDqxCUUGu5+OF8zyKQ+bS8Dyhq20GCVqMsm5ds9XxuBGFRfF6YXU7FSduALB0JW1GdbYS
	 /Bwg1fs+ihoTyeP8RsFeqA5qYkb9eHW1Z6D0ZCRlfTtrcciNvFO1to1EHQghPzyWQ4Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793223580;
	bh=jHPfN6vY2Njp2Qqy4oCVd1ALRY8zT87uQDyQexm7rks=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=Kh35MC5aZ1u6sAmtuwIacLYHXnLs4uOM2h1AsSiSDT+w1x1RHKNlEVh0Lj1+1sHMv
	 BohXDQXQsspufUYKXF/pUGJDFzZfgIhrcnA+v2GB70g28ru+QB1ryDh+snjOtwnjLM
	 0TC8BzLPXcAjt2eVzZXOfKaaki5C/MbZki/Qcu+x6qP8Xo/2kfA1+k6E8TjPqxansL
	 Z83TzTdOVLuLYWPX1YdONxKltsBIZwjyufKHWS7mS2C75lHZ91uiQulQC0f8xrxOiV
	 zVPfTf2Aps1/M7L/GhYrB1I271SB5Q2+Dl6dvy06fYKVBSn8UDiFnFDIjOjw1ZRfqn
	 utGKVACfX0R3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E9A340A2C;
	Wed, 28 Oct 2026 21:39:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 25029120
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16B408176B
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:39:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QZRlY6_4TQva for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 21:39:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2DB588176D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793223577;
 b=H9TReucG1IdBKyYU3PC1sxL4UH1J1RWyShYHgTLRtKnyTAIBVuvLrxcS31/o23VJcjnO
 gl3xuzDjE0QgFYtUg3PTCvAYpPbPB0ShiNxcLO3xhl012yYqViKTUi8uTMkvEf57xM1Ix
 Oico2bTDJ18GVVXxLkT0IKIuHvo+9eoLk/LWhMyIf8Lu+qPX7ExwhIINn4nVNnbx+z4LC
 3NLd25MdcqvjWektIXTvNlqj0rPlK+mwNUZCKQ68VBkTZRIYvk8tC6lXjN5ga0Jtvk23v
 AlMKJy4Slteex3QfSbcTDc79xoNCIusDjSKNXN3iMIqPGpBHWj0iO3gkO4ihQccoa0Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793223577;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-DetectorID-Processed;
 bh=RAr1wLzdeHQ2NKSPyLMhmW8psOQ8qYi6MxT58s3FTyA=;
 b=J9kDn8VbjtYIMK2SbHJEAiDj3LqmuB5C/QDFBOk5W6CDRwVAuSuxgv/eQ4+uPIMJVRqE
 HxFg6YGm76wcCJ1MRXMJZFPr1ZR+0V4rA7AK9Rvs+Pc5WqF8gSe+Z6D7UhHgL0kKsyBoF
 i7qIHn3lW8VND6Z/H6+sqD75gyY9y8NqtZzS/QhLGuqcev29jasuGnz4qhmouZlUxwBJ9
 +5db4EFGKdnJMn3fkzSu7Bd4i6wEwxliEn+WONtWhRIY2o36oWSw3ziQE32YLBfscnlUo
 BJU08/+aM1PBrumKDR33rFVDsF6RbShecL09xVT9/t+VvOX76H9t23rNAPIBjUSsNPw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=ByzC8jjX; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::564"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::564; helo=mail-pg1-x564.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-pg1-x564.google.com (mail-pg1-x564.google.com
 [IPv6:2607:f8b0:4864:20::564])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2DB588176D
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:39:36 +0000 (UTC)
Received: by mail-pg1-x564.google.com with SMTP id
 41be03b00d2f7-cc4c02ddd62so1056085a12.0
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 14:39:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793223576; x=1793828376;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=RAr1wLzdeHQ2NKSPyLMhmW8psOQ8qYi6MxT58s3FTyA=;
 b=qpTJkHKxduEfXQyE/MQq0bBTvTf3yc5lvk3hJwbAZ+j6nbPyXsWM144vnPOT1tyVTW
 BOZUw3tl4TMMaUE283jZS98DxQTWeFtPRB7/z+1idMyorUB52GowAbKyR9mURiZXUyRb
 Eslad9lHJE9jVTg0B6JodTyFv+cRvc50UbUDk5uBBLWr0Lc9f0wgLOyQ+enFCKYzsBoK
 Gt0mMj4yfy/RWWekDm6gRiCwlvZ/g0qfFcdRSmlfwlMzZxvNeG4a9PDaq7PsiVsPi3qE
 RoSQSpQS21vxnmt0Qpl/n7IaTQSoVyA4K8kB8Nkq3YXqp7iuq317mCH2bebgPl9/Xacz
 tGUQ==
X-Gm-Message-State: AFq9FYItLUFoG7fTWqLl3aGs/VbWqzn44MAqkSd8iJgI7DmfPxYfyUf1
 ziDZ3zNtTGNFXZQWr7vwrnWcAIvI0HP1yGKWCR0oB38V57JvF33w5w/5TnhHdDLJVIElFjxZfcw
 PZ8ZK6TU7nxW3GKPwvUe2w2ktLFdeY5CpoI4HAl2arkixMuWaxLb6mv9NIFD+D4g49ysvlz40xb
 5RQ3G654Q4MUPPjmf88Qs+awBPfeeiA8s9uuvixSQ+ovgymqPD5g8zkHB6wYdxziA4g9x9NvlUm
 wW9CwBeVMjtWjjFaw==
X-Gm-Gg: AYBFou1GLSI0Li44BjxkQ/Bt5xH7lazaKSMYrr9L78tkah2/58BjVjB6g3M7qm2spSg
 ghxADxUjD3JMFOa92SeYyQ6iwfK9P6WQyCR7sEQnojgyVgJx7hmzt/S7RuUw/e4eplqhQAtQD/D
 asyWNDKpEfAWU5pK6eA7Qu+63iyBQhC50MFl6S+dwKOXuLZO4XjrIGQXjmk2OayCMYrUb82FhbL
 wCbfPQZGftRiEaU8XQTVeCQXTUA1ps+DEH09Tmfy14k5fGD6YAHnjqp5+6zXooTLXYa6+IOZ2WP
 ELqu+2tQcvx3VkK+rPla3xNk6b7CVhquBRBCZN2zw3zqfLkQOt4DgKs/aDUkkvPlou8GNPCg1DI
 yE16u2gGZWl/LPBZRmx3ESaUSEmqtEGl+RzIFModJa8vXGhDIRBkP64tlIVDfOE0EbSqSqTE0XP
 a08rtbrVqVaDctQnJbQGY9IzApG1cUh/Dr4kz7WCWVEKk=
X-Received: by 2002:a17:90b:54cd:b0:3a4:6f38:f2a2 with SMTP id
 98e67ed59e1d1-3ae580f1940mr2697284a91.25.1793223576058; 
 Wed, 28 Oct 2026 14:39:36 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-3ae6e803953sm542044a91.4.2026.10.28.14.39.35
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Oct 2026 14:39:36 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-91c84af45c8so18502336d6.3
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 14:39:35 -0700 (PDT)
X-Received: by 2002:a05:6214:1bcd:b0:91b:8025:6827 with SMTP id
 6a1803df08f44-91c7cf9f368mr56990026d6.21.1793223574705; 
 Wed, 28 Oct 2026 14:39:34 -0700 (PDT)
X-Received: by 2002:a05:6214:1bcd:b0:91b:8025:6827 with SMTP id
 6a1803df08f44-91c7cf9f368mr56989456d6.21.1793223574059; 
 Wed, 28 Oct 2026 14:39:34 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91c6ed36451sm62806156d6.34.2026.10.28.14.39.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 14:39:33 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 14:37:34 -0700
Message-Id: <20261028213744.511429-14-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028213744.511429-1-florian.fainelli@broadcom.com>
References: <20261028213744.511429-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: [Buildroot] [PATCH v2 13/23] infra: host packages inherit the
 target extra downloads
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Florian Fainelli via buildroot <buildroot@buildroot.org>
Reply-To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Gary Bisson <bisson.gary@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Bernd Kuhls <bernd@kuhls.net>, Thomas Perale <thomas.perale@mind.be>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Arnout Vandecappelle <arnout@rnout.be>, Petr Vorel <petr.vorel@gmail.com>,
 Spenser Gilliland <spenser@gillilanding.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pascal de Bruijn <p.debruijn@unilogic.nl>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Some packages need extra downloads, which are then extracted in their
source trees. Up until now, this was only used by target packages.

For example, perl will need perl-cross.

But with the upcoming merge of the host and target soruce trees, we
will also need those extra downloads for the host variants.

Update the three packages that already duplicated the host extra
downloads from the target ones.

There are three packages left that define host extra downloads, but
those packages  do not have a target variant, so we can leave them
as-is.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 01540f0ee0cf07f77ef0dbf99d3d74f95b17f121)
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 package/android-tools/android-tools.mk | 1 -
 package/binutils/binutils.mk           | 1 -
 package/gdb/gdb.mk                     | 1 -
 package/pkg-generic.mk                 | 6 ++++++
 4 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/android-tools/android-tools.mk b/package/android-tools/android-tools.mk
index 20e26839f977..e30fce8ab7e3 100644
--- a/package/android-tools/android-tools.mk
+++ b/package/android-tools/android-tools.mk
@@ -8,7 +8,6 @@ ANDROID_TOOLS_SITE = https://launchpad.net/ubuntu/+archive/primary/+files
 ANDROID_TOOLS_VERSION = 4.2.2+git20130218
 ANDROID_TOOLS_SOURCE = android-tools_$(ANDROID_TOOLS_VERSION).orig.tar.xz
 ANDROID_TOOLS_EXTRA_DOWNLOADS = android-tools_$(ANDROID_TOOLS_VERSION)-3ubuntu41.debian.tar.gz
-HOST_ANDROID_TOOLS_EXTRA_DOWNLOADS = $(ANDROID_TOOLS_EXTRA_DOWNLOADS)
 ANDROID_TOOLS_LICENSE = Apache-2.0
 ANDROID_TOOLS_LICENSE_FILES = debian/copyright
 ANDROID_TOOLS_DEPENDENCIES = host-pkgconf
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index c6a6380be99e..4b376f393bbd 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -137,7 +137,6 @@ endef
 BINUTILS_POST_EXTRACT_HOOKS += BINUTILS_XTENSA_OVERLAY_EXTRACT
 BINUTILS_EXTRA_DOWNLOADS += $(ARCH_XTENSA_OVERLAY_URL)
 HOST_BINUTILS_POST_EXTRACT_HOOKS += BINUTILS_XTENSA_OVERLAY_EXTRACT
-HOST_BINUTILS_EXTRA_DOWNLOADS += $(ARCH_XTENSA_OVERLAY_URL)
 endif
 
 # Hardlinks between binaries in different directories cause a problem
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index cfec0585da9d..f33cc2ed7c57 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -39,7 +39,6 @@ endef
 GDB_POST_EXTRACT_HOOKS += GDB_XTENSA_OVERLAY_EXTRACT
 GDB_EXTRA_DOWNLOADS += $(ARCH_XTENSA_OVERLAY_URL)
 HOST_GDB_POST_EXTRACT_HOOKS += GDB_XTENSA_OVERLAY_EXTRACT
-HOST_GDB_EXTRA_DOWNLOADS += $(ARCH_XTENSA_OVERLAY_URL)
 endif
 
 ifeq ($(GDB_FROM_GIT),y)
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 0f4bf73fa064..b9808bb624f7 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -608,6 +608,12 @@ ifndef $(2)_PATCH
  endif
 endif
 
+ifndef $(2)_EXTRA_DOWNLOADS
+ ifdef $(3)_EXTRA_DOWNLOADS
+  $(2)_EXTRA_DOWNLOADS = $$($(3)_EXTRA_DOWNLOADS)
+ endif
+endif
+
 $(2)_MAIN_DOWNLOAD = \
 	$$(if $$($(2)_SOURCE),$$($(2)_SITE_METHOD)+$$($(2)_SITE)/$$($(2)_SOURCE))
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
