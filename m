Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59BDCC4829B
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 00:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C584884107;
	Mon, 12 Feb 2024 00:41:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JO8boRRN8Z0w; Mon, 12 Feb 2024 00:41:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D927D84103
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D927D84103;
	Mon, 12 Feb 2024 00:41:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 917AA1BF868
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 00:41:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85A6F84102
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 00:41:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yDAHp3BNIi8S for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 00:41:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 29B5E84101
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29B5E84101
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 29B5E84101
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 00:41:07 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-7ba9f1cfe94so119484639f.1
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 16:41:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707698465; x=1708303265;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wrc8cFaOxhCCbWGfRVx5NuUe5c8AwJMizcQ+GPz1nvI=;
 b=BV8B0qnjGeA1CqIIqbUOPMUhZHjI3FP2RqobtR0ehQ+5eV5gyKX8OYkk5uh44/dJSK
 qI91Fw5TN6mdRY9AUWsJolvqriarohXgIWOoKsAEej2Tc/bpjapGAcDaX71xbDrFdLWd
 HKgPowcXlFvOiSL4TwLAE+R6EnHJt44Ysb1uXTZKqbGHh+I03ep6XMrzN+fWBdBYByZN
 A/2Gp5fN0Tebtnu7M6z6be6kSl4sVrGIpybw4VsRNZlCp2k3CHGQ6K0zUgvTcvSA8Jnh
 okoh3pb0C8Aeuaft9Dpgg+TN9NtDogQas4bXDFcvuuR/v9zK4YpGtPv2HnuhH/meCcGJ
 /eJg==
X-Gm-Message-State: AOJu0Yxief/f2DcEwbo88EAzjaCqUOMPWjNI19+WBlijsnehGRQ4Jd+p
 SDRhfmx63OHZNVre8G3Z9BU1eAwyKo4adXQNHfKsIkYG612jvAccmnxLeD1NLjk=
X-Google-Smtp-Source: AGHT+IHr6Dazot9BewvYfrzV9K1O9OepIUFaJ3XtywkSNRrRRrSDt46AD7AWNEFWean+Q8E7skTlBw==
X-Received: by 2002:a05:6e02:1d89:b0:363:b1d6:f44a with SMTP id
 h9-20020a056e021d8900b00363b1d6f44amr6119696ila.4.1707698465459; 
 Sun, 11 Feb 2024 16:41:05 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUWAHqMT3HgKvjCwaQBpw9rDcwEyz0aESTlpo6DSwKf2mImt8tkAddNZky113VXGVVuvIfNj8yFKSlP+y95yjKiC20V7gkTfN8759GmivPd20X8TN8dCbX/TdjcV6B2ai9bY+an8WYCIr2rWOH5t++dvcR4n9OoD32Ver8slh4WPL9zQjZln50mgRGLhUlyBUoqTEx5KA0h7dweUzwgsTFfdd6oD41ZZ7SouLblSkpVCaeA3jo5n0mN5FpS+yiekhPcAGmbV7z4KEqtFPfe9Ik5dKpHJPI+loMEaR3eo5BFLw3cWnhk0HlJIl9YVhk9DYab8wyfa8jo6CuGFN6ZBJoe+fs=
Received: from james-x399.localdomain (71-218-247-10.hlrn.qwest.net.
 [71.218.247.10]) by smtp.gmail.com with ESMTPSA id
 cs23-20020a056638471700b004715747ede4sm1141084jab.55.2024.02.11.16.41.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Feb 2024 16:41:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 17:40:58 -0700
Message-Id: <20240212004101.614670-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240212004101.614670-1-james.hilliard1@gmail.com>
References: <20240212004101.614670-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707698465; x=1708303265; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wrc8cFaOxhCCbWGfRVx5NuUe5c8AwJMizcQ+GPz1nvI=;
 b=aLoHxQsgvtVAxJesV09EZjsbGiNdSU/KiI0H/ZxQPxnQUhjAVrHOSd/MNLmfdQOQZz
 +9sRNUkEYGAr2r4fKrDaaBoUKhLKuRzMRmkMhFWcshF3Vb8viGKaYwx6e6tBJEWkteYv
 Im3ViGhvpp1apDCUMPU342hJ+gm5XVbrTlEXdIq6SlMgvwSr0ThSKGEk1582B+YTVx8r
 xKZVW+jrskAUWWKeNDNlG4J/jyARLfF3i2xbqYvOfEWiR6PUIlGnaBaY+RIIKvA5jbto
 MhpIUpNz1eryEKdKyCtBlFFRZCFh/wyCmcLEwfr8RK00VA/OCvl9JXlSzPrixbNUzzRF
 OxhQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=aLoHxQsg
Subject: [Buildroot] [PATCH v3 2/5] package/python-pyyaml: disable cython
 build
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
Cc: Geoffrey Ragot <geoffreyragot@gmail.com>,
 Joseph Kogut <joseph.kogut@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently pyyaml does not support cython 3, as this is only an
optional build dependency lets just disable cython for now as
it will otherwise prevent us from updating cython.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyyaml/python-pyyaml.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-pyyaml/python-pyyaml.mk b/package/python-pyyaml/python-pyyaml.mk
index 846c57df4f..2e4696a504 100644
--- a/package/python-pyyaml/python-pyyaml.mk
+++ b/package/python-pyyaml/python-pyyaml.mk
@@ -12,8 +12,7 @@ PYTHON_PYYAML_LICENSE = MIT
 PYTHON_PYYAML_LICENSE_FILES = LICENSE
 PYTHON_PYYAML_CPE_ID_VENDOR = pyyaml
 PYTHON_PYYAML_CPE_ID_PRODUCT = pyyaml
-PYTHON_PYYAML_DEPENDENCIES = host-python-cython libyaml
-PYTHON_PYYAML_ENV = PYYAML_FORCE_CYTHON=1
+PYTHON_PYYAML_DEPENDENCIES = libyaml
 HOST_PYTHON_PYYAML_DEPENDENCIES = host-libyaml
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
