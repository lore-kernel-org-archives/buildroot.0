Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C83C4829E
	for <buildroot@archiver.kernel.org>; Thu, 15 Feb 2024 14:24:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4455160FE4;
	Thu, 15 Feb 2024 14:24:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y0J55sRNVDVV; Thu, 15 Feb 2024 14:24:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A25AC60FDB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A25AC60FDB;
	Thu, 15 Feb 2024 14:24:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A7F911BF844
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 14:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9EEA4605E0
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 14:24:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BL8MOzAaDZUw for <buildroot@lists.busybox.net>;
 Thu, 15 Feb 2024 14:24:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1129; helo=mail-yw1-x1129.google.com;
 envelope-from=gilles.talis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EC5BD60F9B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC5BD60F9B
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EC5BD60F9B
 for <buildroot@buildroot.org>; Thu, 15 Feb 2024 14:24:36 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-607ec539525so1341647b3.0
 for <buildroot@buildroot.org>; Thu, 15 Feb 2024 06:24:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708007075; x=1708611875;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jVRRclweIQUjakxlqXZOr/LPyhbFE9KUk9O78jTTAxs=;
 b=KpdyuzwopO39jv/wt9nMXWV95GhRFgghepQlEtYLks2PNg6Z8QEdgWxn1xlwMHaBCX
 kT9ElCbzgaBJWrgfVaaxMqzXeKUfW+D8oY4wUnRI6rCocdCac/D0SGsZCtjwaTYfRQ0s
 ms0EVo7l0Qbb1EH+8nSlK7QWV82IQZJ7vX0xaZ4vXiDLixS19GacQftmFLWCRlgLbL/7
 Y9FsfWUBxMxmCKy0K4qopQceflDrcZG8hifQdhTyW2kmDonjiGjMk9iZAbbdE/XqNuyd
 LW7Itt9Pnupl666TRtJF12+wrKqEtBOU/bHQ9wNjqEicRgTT/6NvkyiRLLQpkYl1ugh8
 EO5Q==
X-Gm-Message-State: AOJu0YxMTthHKZYZ1JmRYzUUPoTZLllVcBKfGR1Tmpk1BrNf/A4d1HTO
 ehachlEng3zh6Fketo6PTpRQSM/uxkbssM3tPhlwcMxdOoyxVduISKG2m8ZZogk=
X-Google-Smtp-Source: AGHT+IFufGgAQb9YF2LtZ4FPIT+FMwrUe5a6VFyWIKwoiZ2ze9Ip5t57o4x+PmZs8InAll/y/1z81w==
X-Received: by 2002:a81:7904:0:b0:607:82e5:3d67 with SMTP id
 u4-20020a817904000000b0060782e53d67mr1797305ywc.3.1708007075334; 
 Thu, 15 Feb 2024 06:24:35 -0800 (PST)
Received: from gilles-Precision-3571.lan
 ([2605:59c8:6662:b310:7f4:4b02:4a36:4d21])
 by smtp.gmail.com with ESMTPSA id
 i197-20020a0ddfce000000b0060437133f85sm260967ywe.7.2024.02.15.06.24.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 06:24:34 -0800 (PST)
From: Gilles Talis <gilles.talis@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 15 Feb 2024 10:24:10 -0400
Message-Id: <20240215142413.451505-5-gilles.talis@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240215142413.451505-1-gilles.talis@gmail.com>
References: <20240215142413.451505-1-gilles.talis@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708007075; x=1708611875; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jVRRclweIQUjakxlqXZOr/LPyhbFE9KUk9O78jTTAxs=;
 b=d9UfQhpd7TlFybbFEcccoXLlvJdQzY2qwW5Q3pCDenDy9G0XOGa+sAU33uFSka0kWx
 DWzVoEDrbOBUBehRp1QC9Tbx/PcMkxuUlN5+3xpTT6yLBtDSjuktnlNL+2G2Q6hhl6K2
 XNcg7W/ESRxdOpHwRObASp8v0tPymoLgxJXkqFZIpclKk5a0f+i6iakXK5a58cj2vnjq
 iXeilu5qkCQ2e1ea0D5z7cann/mHuZzX9MWJcHvv6h8oFxKuZXcxl7rMIceP+6CQuqHZ
 vC+zoE9C993KliDhjxsk6Oqv6ail4cbxZQ0lb0I8687/5p0+eCmV4iHCXITtZkbOZppL
 OBjQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=d9UfQhpd
Subject: [Buildroot] [PATCH] package/ocrad: bump to version 0.29
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
Cc: Gilles Talis <gilles.talis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/ocrad/ocrad.hash | 2 +-
 package/ocrad/ocrad.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ocrad/ocrad.hash b/package/ocrad/ocrad.hash
index cd5b0039ea..736dd6ad4c 100644
--- a/package/ocrad/ocrad.hash
+++ b/package/ocrad/ocrad.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  34ccea576dbdadaa5979e6202344c3ff68737d829ca7b66f71c8497d36bbbf2e  ocrad-0.28.tar.lz
+sha256  11200cc6b0b7ba16884a72dccb58ef694f7aa26cd2b2041e555580f064d2d9e9  ocrad-0.29.tar.lz
 sha256  3d77c1a58fbde5ddba612d1fe09965e20a3804953eca12e8c1892298bb8a5eef  COPYING
diff --git a/package/ocrad/ocrad.mk b/package/ocrad/ocrad.mk
index d62b7af351..2452070bcf 100644
--- a/package/ocrad/ocrad.mk
+++ b/package/ocrad/ocrad.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OCRAD_VERSION = 0.28
+OCRAD_VERSION = 0.29
 OCRAD_SOURCE = ocrad-$(OCRAD_VERSION).tar.lz
 OCRAD_SITE = $(BR2_GNU_MIRROR)/ocrad
 OCRAD_LICENSE = GPL-2.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
