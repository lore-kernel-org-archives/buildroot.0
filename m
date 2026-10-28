Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422AC606A323
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 11:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=T0+ywggv;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=dAUtmHER
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E529780F50;
	Wed, 28 Oct 2026 11:33:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GBzt-cT6KLDA; Wed, 28 Oct 2026 11:33:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DA63180F71
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793187220;
	b=bGP88PSwuEoevEVAoxuQaVA/ziRPbSwuC8+O7k5qHmi7BGw8vCtFjW85Ng9NVysWwqAq
	 tzslzeVwVpib6uUOxHmm03q/0RI6ctK/L/FvbO+CG3nk7TU2SaNURrz4r8Y0Bnxqwx3gr
	 4z2FnSp4/r0P1MLPy/3gWmsQFJ+u/ckdhuWUOBeknO+U/YOqjUe9/70o8u2KaKF2DPZFf
	 sy9TJ4pHhphFxS80kO2/anhIrGECL8UoHj01J4BvhshMM63wwKnu1okMk055H2rvf5OJw
	 F7xdTQpQXBMOwAZfTc/PiPZiXmI0ofrZidA2lCSNoDbk6HBCdcqyrnOx3iXQoFJUHDA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793187220;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=nW9VMdKTZx4j7nozLrAe2tIk92aD7u15nDRgJHzJRII=;
	b=Gb3cE0YmRCojxsWMH1YNUMNl15W8ShZOFIp0yFlAxfqVR4rr75UJSvwtlntpOo99OC5I
	 v6aDJnmzY5WGEmX0EYP4pPk660nP3LUT7K00gQc2fgjEIMqn0t96XsXcugJOIcJ5UlAU1
	 odnrDN+ufnAilsNSv63/v62gipW5PjBU4cwoZQfeH0X/J9HHVpbdo4FDFwh39HHSJQnq1
	 LppZxcgDUhWlc+beixYg3zpK3cIhlTrvxJq90j6j0+T6+De1Ja6URhdN5uuAox21WgLqM
	 Qy8dkDzAsTgaWAgPAasA2PGHhuM1kBaRcZJRR/dxNHN1To2oDVX1PqkkwPw7jkhvigw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793187219;
	bh=nW9VMdKTZx4j7nozLrAe2tIk92aD7u15nDRgJHzJRII=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=T0+ywggv3Il3SBcdICmI71Uehw6nSYCvjIRE5fmnW5ZHdPowmy+zqWgDPPpNCCJd/
	 5T7tdCPYBHw2kwixVMePaLfHw1mQKiy09bLwjSsN/f5DntP0cXSWCQRmr/IF9xC4IR
	 gUNL3I6CtcngGnQ/GvXInpsGFXdDKScdFbSMrYAjC00JuHcO6J5oVUEEDuQNhPzxxB
	 KxVmv65R66K6nWPmE434lhN/5H8ZqJ/GaMs0ib53LRchF36CIx1o2+cIo788soYhJr
	 +R44ZyYYSc4FA3GW4BL9iHL6enoqgkmMWALiYYEJSa1/Lo9qy7vjyabQ7Klf4JnMQv
	 MfBZZ39qAzHAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA63180F71;
	Wed, 28 Oct 2026 11:33:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C541972
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 11:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 11F13605DF
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 11:33:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cz8_t5F8ntA9 for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 11:33:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B3898605D4
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::631"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793187217;
 b=YF1bRA7lCtjaXED9RKcy/KfrL10JsiYq9+d3NUtKqWjsad9OoJSIusPKghmEeV67Gx2H
 XPJ5PPH3pgvZFmj9bX2VHOt5XUJi9rUWKPnQsSw5KOTn86xhz3CmErI4P9tRIiV+iR6mc
 XX1R0esbWL+eAJyHL0M/h4VQP45qwtqELYD7Qu3RMTkYx62j8bEVYr1UGiC6A3XYpAu75
 EcVhz2v6R+Ed/9vLGGmRjo6DTGWp+b0mBfaOHnjAaFTBDY//5frfVd/tCZuL+8+F7AvZw
 kz05o+SLqyPrKXqNduTbawmjxRAvMHpVqGTlneu+fixomu9ZA5g+Ufp5kFp6HrRb7Ug==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793187217;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=hJ7E0Ze3Zq2O3SIlPaKHS7DGOB6suoJ+UvRPu9KYgCY=;
 b=I9UGq+bF5JnDmeK9XkxOjGjftqHw7i03fBnNHLXHCMAR5y7HZAHf54ZnbN4lQgmNkiC9
 7ftQIK69BVVDlBBIe4cGaaVQ8A5095dYBIe1ENrwT9QoVaKvPV8f+eYHKP5CmRWd8pxK+
 I72NOnpzDqqlY5KALw8/uz3N9ayQSS68K1zR5KlDH0QkNPPhs5loSxnpUGEJkzK/m94dI
 RwZ3qxLd0h9cQK4COArA5R77gzy1IupA0KQ8U+glIuHe72BOA7GuYj7IvOCqVFSLz9XKV
 YAyNzMozCnOgyGiQuABIfb1QJDeLkssgmJlEYtEpxpWxd0UCZbxLnM5o4rOc8cVbkGw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=amarulasolutions.com;
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=dAUtmHER; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::631"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=dAUtmHER
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B3898605D4
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 11:33:36 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-c499b5be0f1so9127766b.0
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 04:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1793187214; x=1793792014;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=hJ7E0Ze3Zq2O3SIlPaKHS7DGOB6suoJ+UvRPu9KYgCY=;
 b=dAUtmHERpSrG6nPNqcy59xaVULPtHE7uwbz/07/1bm/LQcxTqGu8jPDQz+IIt3T5Cg
 cOIiWIaOhkUQNFyil+tM8qwaMI/WFS50ZEum4SyyNmEGUuIhxJXLRQyKBXOzrQw7aaPq
 8YUtBUiq7PPfpApTkfVy1K8qaMqtijXOShyMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793187214; x=1793792014;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hJ7E0Ze3Zq2O3SIlPaKHS7DGOB6suoJ+UvRPu9KYgCY=;
 b=uTinP95dpr9nPDU8MxXjoH70rfGARtoVnieiwl9yXqiMmplousdOL/nTrBgiBvbKdB
 QAYXFiafHoOAkasl5ajKMgmo9C+Wvmx9xmbtM8Cf6U5YV/j4zoKdkHBdpJEZ820vTu8X
 LWH3apvbIzJiYL3oFkciRnWJvw9J0iLRhSzaCOrvZbfWMO1Sd55HC4bksgbvydpvJf8U
 j5Hq9KwQo3YFXT9JQn0SnRGkqoeXM14xWNpo4n0ufYIwDBsiVIPkp3bQNv3NXes2+EFB
 xcuC3oJoBZB7/dBf0MG2J6KWLQAk90lOaxI6AS1UKy1o6L/X63HTTa+wP9SSBtHc8IQK
 JJpA==
X-Gm-Message-State: AFq9FYJ31lQxxLAAGEvVY+ZQy2s2GENi5hzCKGjTciACpRlNm6a2q/ie
 CxNk57bZ59VtbFxGGQ3fFr4NAAo+BqH79EQMkDOn1eJLNV7ro2OGu8XetbfVmqi9LbhVrVO3+n7
 345qfAU0=
X-Gm-Gg: AYBFou3v/QY5Hdeosh9BV3zeOg5z6dcmnY4F2v8cpgo4lXp9J4d8GqAGMbhOc/d01bh
 y65ppev/jLxXiG7WD3ZJA6RZIVN3bhO6W9LNWEN8Sug/3eZVzeWRB6/BNpng8CimVc0C3+trrBc
 qzbRT1/pZoAqLMC0mAtjI3Cjr9OGH3t2QgSdGPGUzqS4mVEnONcXtPM9+zgBTtyMZOoFk9kpxvH
 QxCEfZA1pn4F9If6xgHP48MWs2gpn/btyD/0eeiDvORV3wslHboR5ujYpfzVxt5JFFc0CycTml7
 kLULE1AQxle0Yh8A8CI5AY6r8J4Ig0miQsSGuK2Vm7OwT+IcZ/RFPSgHukXuKmjA/it45lerrKV
 nwQhNvsizdWhqTixKy6Y+SrlpZyV+/3jmctxNi7SZsfXoBX0IJZMIVZb10jLQKVinwbRNjLDir7
 iQn3HpVbhOwj8TkH+xTgEHJBwuIuDrDs22sYEkGdNmosa3jKcl8v5cisjO3Gsm3gaq27/BDXuza
 +ehFxEldslgHJX48oEgbkPsGcViuYt+RCodsqvOs67QV+g7GiLJJ3aj2oE0Q2s1uDZ5d022kUIz
 FSjKmJRsCUMRcuEB2JkeKSHDOzaZjgAx6KP98crdq5bfY5YRQxlBHIQeu/X10RihEBIvLnfG+hZ
 RAype0fuD3U2s9u0pENu0tvH+mx0opEpK7lr7mkLjNKcTeMQe7sCM7yLad4+N+kO77YrrBEQGsv
 GXGpF6QmTA2w372442ljHKhck/zDDJaQOxIL/lJA==
X-Received: by 2002:a17:907:9543:b0:c2e:8801:9139 with SMTP id
 a640c23a62f3a-c49bdd5a5a5mr165007866b.1.1793187214122; 
 Wed, 28 Oct 2026 04:33:34 -0700 (PDT)
Received: from adam-linux.amarulasolutions.com
 (2001-1c00-8181-e800-030c-182b-b2a8-e89d.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8181:e800:30c:182b:b2a8:e89d])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd66c6f7sm592468866b.63.2026.10.28.04.33.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 04:33:33 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 12:33:26 +0100
Message-ID: <20261028113331.2960539-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 1/6] package/mender-update-modules: add
 banner module
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v2 -> v3: Fixed github link [Thomas]

 package/mender-update-modules/Config.in              | 12 ++++++++++++
 .../mender-update-modules/mender-update-modules.mk   |  4 ++++
 2 files changed, 16 insertions(+)

diff --git a/package/mender-update-modules/Config.in b/package/mender-update-modules/Config.in
index 0c00ce2933..01439b30a4 100644
--- a/package/mender-update-modules/Config.in
+++ b/package/mender-update-modules/Config.in
@@ -16,6 +16,18 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES
 
 if BR2_PACKAGE_MENDER_UPDATE_MODULES
 
+config BR2_PACKAGE_MENDER_UPDATE_MODULES_BANNER
+	bool "banner"
+	help
+	  The Banner Update Module manages the system's message of
+	  the day (MOTD) displayed when users log in via SSH or
+	  console. It uses metadata-driven updates to change the
+	  banner text without requiring any file payload, supports
+	  rollback functionality, and operates without requiring
+	  system reboots.
+
+	  https://github.com/mendersoftware/mender-update-modules/tree/master/banner
+
 config BR2_PACKAGE_MENDER_UPDATE_MODULES_DFU
 	bool "DFU"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
diff --git a/package/mender-update-modules/mender-update-modules.mk b/package/mender-update-modules/mender-update-modules.mk
index c0b69de7e6..f3ea0e15cd 100644
--- a/package/mender-update-modules/mender-update-modules.mk
+++ b/package/mender-update-modules/mender-update-modules.mk
@@ -12,6 +12,10 @@ MENDER_UPDATE_MODULES_DEPENDENCIES = host-mender-artifact mender
 
 MENDER_UPDATE_MODULES_MODULES = script
 
+ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_BANNER),y)
+MENDER_UPDATE_MODULES_MODULES += banner
+endif
+
 ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_DFU),y)
 MENDER_UPDATE_MODULES_MODULES += dfu
 endif
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
