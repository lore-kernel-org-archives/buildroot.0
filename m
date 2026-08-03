Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F80C55184
	for <buildroot@archiver.kernel.org>; Mon,  3 Aug 2026 06:59:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9009680D0F;
	Mon,  3 Aug 2026 06:59:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 58Vqq6rcOMNo; Mon,  3 Aug 2026 06:59:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C50D480C9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785740396;
	bh=w2Fw1uEwJbk10QN3iDXi4cvdSTvLrWVXZhDsj0r3gSc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=opwVmfM6mvk6OvWwmZ3/x0CuB8GWazpvbjkCLj/JCfaVeOQRZ/i2yxBNVQaX4fmxO
	 ffBhETlAsdSSEv92cDk42kquTZpGD/oCX7MbNoR2r7T7tm3VVFEf7azBsPCmN9NADN
	 c7LUKHCwZAoW1zCCaERdzGa0vnvo7UX2ijMvG4PitpbF9cDMJn7JnKXuUomN5nCVUL
	 AXkeeASzy10N0yYR0+SxsU14X0cr8DVEHEkdVD6s9TLg2sGULxZB7Uo35pPIQgo/Yf
	 6RREa/UGZu05YQ4537GJ1qUpvf0ulmxVoBacXTyv6Dd0esdr+LSpC76eg1FOHvYE1W
	 vAID6nE56AB2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C50D480C9D;
	Mon,  3 Aug 2026 06:59:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 471DA26C
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 06:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 388F780C9A
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 06:59:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fH96mfmrM_NV for <buildroot@buildroot.org>;
 Mon,  3 Aug 2026 06:59:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0978380C87
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0978380C87
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0978380C87
 for <buildroot@busybox.net>; Mon,  3 Aug 2026 06:59:52 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4954a32cf1eso7129405e9.3
 for <buildroot@busybox.net>; Sun, 02 Aug 2026 23:59:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785740391; x=1786345191;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ll0JNvE7Ra6aEMlcRR8haH6+bR+IcjwTez291DW2gqw=;
 b=WL/mPEHQ4zIu+IUSBny0K46u0Nq7pIUIMTPswd1n3zk+itS2HodGUfEwgRkgA+K2zj
 idIO0F4mnKpKTE/t0cac7F1+F0YrQCqz5Bwqpe/pwEpVKZIvnDsiovofyeCASsOBwroi
 uMXuU083sIx+9aNitOPSw7h0qK5EhESYrnp8u/HThzQb+e59x5Y4Fpz85hIXY+LMg5e0
 P0T3tVFngKo45GcQ0cMiqQHPGRsY/w8bJWC63mHYCqKqjhPXrayFhJnD/YKGbyDluDIW
 a/PmUYeO1fVQJfGV107V89p88zwBI0Olaeq1ZT10YE6j3+2DpU2OUo0RkCVYPmpRazbq
 0QNQ==
X-Gm-Message-State: AOJu0Yzwcr1Y0Cmm1FwODYEDdcsiBw52LdSBRug6Mle2FYy0OS8Z0HNY
 ml9SODtwUvF7/xmvvBMOHh6/zx58ZeTPAI8GZweYaCELyY6rSAcnaOuLIT4uNA==
X-Gm-Gg: AR+sD122lw9C7SsG/pjwBdwNmirFGSmrABYZLUQddwdIgN1VflIcn2IP4jyBZqGuHPf
 jV7eeHhV3IeWFNdlDKNTcVvzNLnqas307L+KFYUsb+Zf+cmBo78v3vnv+mV5nSAyYTrJ3FUQpWJ
 r+hsnCIXYxqRBbz06gQXVLSpDY+rrKdqzs/Jp1Y1vgxk0dZF9px29m/V8xYmpV29NuzNzZM+fRL
 I3FAomm3LkoY4/TKRK47MxMJGADibIRZPycXQmo7UE1HmLwU52fSJGilX3UwlnTEDu9Cf83hSYR
 PLJahy463ugsRVc9KExvY713is4ato2Png0e861gJHjdXy62+FtDAOEU9aCa2Ig/UPmnUhls5sb
 Y6kaNDGT8dhNHoahAqir7ZcnxPL6CUWenTT2bBv/LSd96O3oAh9qLS7BDjhn62Fe766GjIh00CM
 DQXwEZSVoe9tn8sycnGymDldNn597CPil6JD1Ko9goRfXiZRaNuvifo+91GRs4AHT0KcerCvT1q
 9HTXIq0yLtgM0VG6euE9g==
X-Received: by 2002:a05:600c:a4d:b0:493:e46e:157d with SMTP id
 5b1f17b1804b1-4980c693eaemr192863625e9.19.1785740390841; 
 Sun, 02 Aug 2026 23:59:50 -0700 (PDT)
Received: from vm-2404.. (132.187.66.37.rev.sfr.net. [37.66.187.132])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49807b5b4a2sm234639805e9.1.2026.08.02.23.59.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2026 23:59:50 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Mon,  3 Aug 2026 08:59:33 +0200
Message-ID: <20260803065940.224429-3-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803065940.224429-1-francois.perrad.86@gmail.com>
References: <20260803065940.224429-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785740391; x=1786345191; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ll0JNvE7Ra6aEMlcRR8haH6+bR+IcjwTez291DW2gqw=;
 b=bQr4V/NFWr95yeJeGMzWg9ZuU7Eg4cAgHWCTy7oMAx/GGheRUpqRyyMe2lRSz6ooFf
 xeTaoDQiS83IHtOdEwAjeHANo6Bv7WjECipskatSjAO8dpFl0nCTLeKAHR+XFrDMW14g
 SLEq/7XHuMwG7KATjXDcnBC6MrPdmlB8o+oIZO1ztxaE2BPBXIhEuI9K2bOGM+P7KhP6
 bzMlmhariIpyIa36Nkq0E3tX129ZxvZxIWhN/SQu9nXyhs6965RHP8flgbqGBjrbj4bV
 c4givc1RVUfRfL0BezKcez9T1MpQRh+RPHDUdN15o5zo+dCh9goeF2SHovt1PkLLzSf9
 Mb4g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=bQr4V/NF
Subject: [Buildroot] [PATCH v4 2/8] package/scdoc: new host package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

dependency for host-hare

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 DEVELOPERS               |  1 +
 package/scdoc/scdoc.hash |  3 +++
 package/scdoc/scdoc.mk   | 22 ++++++++++++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 package/scdoc/scdoc.hash
 create mode 100644 package/scdoc/scdoc.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 23c95db6f..442fe4e6a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1197,6 +1197,7 @@ F:	package/pkg-perl.mk
 F:	package/pkg-luarocks.mk
 F:	package/quickjs/
 F:	package/rings/
+F:	package/scdoc/
 F:	package/wsapi/
 F:	package/wsapi-fcgi/
 F:	package/wsapi-xavante/
diff --git a/package/scdoc/scdoc.hash b/package/scdoc/scdoc.hash
new file mode 100644
index 000000000..8917b4038
--- /dev/null
+++ b/package/scdoc/scdoc.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  e1a9c2000f855123a1a50c8f897073e0ee95fc41787431efe3864c2f1c2e7092  1.11.4.tar.gz
+sha256  ad227c56bf22c9fa35be3d383789d065698904b61161f6a8339b91bde5a3e48b  COPYING
diff --git a/package/scdoc/scdoc.mk b/package/scdoc/scdoc.mk
new file mode 100644
index 000000000..ab6e1b454
--- /dev/null
+++ b/package/scdoc/scdoc.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# scdoc
+#
+################################################################################
+
+SCDOC_VERSION = 1.11.4
+SCDOC_SITE = https://git.sr.ht/~sircmpwn/scdoc/archive
+SCDOC_SOURCE = $(SCDOC_VERSION).tar.gz
+SCDOC_LICENSE = MIT
+SCDOC_LICENSE_FILES = COPYING
+
+define HOST_SCDOC_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) all
+endef
+
+define HOST_SCDOC_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
+		PREFIX="$(HOST_DIR)" install
+endef
+
+$(eval $(host-generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
