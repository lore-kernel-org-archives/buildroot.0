Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7BF6EF36F2
	for <buildroot@archiver.kernel.org>; Mon,  9 Mar 2026 07:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A482060758;
	Mon,  9 Mar 2026 07:08:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oioe8OMDG0JO; Mon,  9 Mar 2026 07:08:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D91FE60756
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773040104;
	bh=ht25e4g//753sUc64GF8nCYt58VyO1FdR5A0KHo957g=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=akh1QreDlcGgN6Udw3JLhzRuq3luLXWYbIVcpgXTuSisa+6XOirMDEGY6R2xyFU3C
	 wv3UbdR6NykMGuIkwuY0CXG5CLI7Uh+DwsjwBO+Go8rIv0yUFpLMLHlhudyMCSiSEj
	 AJg5oXHhnSLkwN7IgNyUicIkSyjgvhzLTM37gAW//Q6Pi/q6tUiE8GpZkdwTR7KdjG
	 UPWewimvSMySD+JrRdBeOtMVgDf/V6EG427gHJUZj1TXlbwxdY5RRqtX0ZC6h7cYRL
	 GB19hXauqQEhZHWGaQYQgRPOvKs0qwYZtEVvNmV5w2HazxAyEHi54cfd6ogCdfiUzl
	 s5vV2QeyEG5gA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D91FE60756;
	Mon,  9 Mar 2026 07:08:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E2A1119
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 07:08:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8FAC081973
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 07:08:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id itZQdOCwcjyS for <buildroot@buildroot.org>;
 Mon,  9 Mar 2026 07:08:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 010A1818AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 010A1818AC
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 010A1818AC
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 07:08:22 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-82995242934so1302205b3a.0
 for <buildroot@buildroot.org>; Mon, 09 Mar 2026 00:08:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773040102; x=1773644902;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7lvS0a4dGdhIS5x5iJWmch0MxhDIjNUIJzsSVPZWaZE=;
 b=CPUv6HrZJN8ebuyXyUVGBlgoBVfNI+iyJmfdzrAkXWUDfjMuLKamw2v6s0kQiBWvID
 3+qxP6RF9evjgli9Zo04LeWDJPLa5aKWagj3NLf2tmWD1S09oAmho59q99+0vQwha2Ud
 wVSduo62vCgPMv2h8xyC0KYKmLHNaf8/qR1e/UNBZ+/4udSjb9B3QQW/kPekBDfDBjZv
 qpkw+xLnUKQvk+VuADS+U2t+wm9w5D9XvJmLzuLrMYYfi8sszIDMVDnPF04DFb4X2geC
 E65RsFx8DebGEPhMYpZCCUpCfF1mtKav4CJdv94IR2foBp9kPTS5oSwXiEFoDgWwKfzG
 YU1g==
X-Gm-Message-State: AOJu0YzQwStO1yEDfJP1gnq4eNvRePNRE3ZVgZ8k99zqdHQWkfJPjNKK
 pYYYQxoSOTe8Oaq6aFjV0JJaPJerNKTtfI6irYuhBqqPEM1NW6SCBXwCpCFcXoKu
X-Gm-Gg: ATEYQzyFARKW+94VELNERwIRH+9ereRM0FnSMYW8pSwnnEc7Bp0Z1UXPb0jBzBtML+d
 cboOb6VgTBenz2aciehRYyaTxc0e8wJPNvRQeli2biwStoefrsDYeyCNWHoRwcMSnn5alm9R+Kc
 wl+H3Zi3SCnIyif5YgXoUtReHmFSNxlvTRDf8s6V7wD4j42ecIbkam1Iww/Zuu4KK8i0n//CO4M
 AYw+opq3cGx1sQB0L7YTJ4TOzUwuq57qRKokjMFyXRjxGcw5/UXvF8ZLmc8DpuEzDW7yeKWPcfj
 VrSwV+UnIqwcEbF1kaq43myBJhnmQxL2ZUAH4SIaM/fEVLC9eo0DTvyLh0etqNZhKw19fGnH7Rm
 RBX3l4CsKvzw+kiHVQyFohPD7SSnGUMRb/BEEH1MU/qMy5l8YQy6CGAnQn4NJAlBqikEinevOn1
 gZev0BuBJ6R47UEBEgoJrYyIf+zkmxy6k0+bIQ
X-Received: by 2002:a05:6a00:ae10:b0:824:a466:7470 with SMTP id
 d2e1a72fcca58-8298583d0b9mr10238589b3a.17.1773040101912; 
 Mon, 09 Mar 2026 00:08:21 -0700 (PDT)
Received: from fedora ([2409:4064:2dc8:f3fe:2a16:d3b5:be55:778d])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-829a48a24b2sm8900756b3a.47.2026.03.09.00.08.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2026 00:08:21 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Mon,  9 Mar 2026 12:37:41 +0530
Message-ID: <20260309070741.34152-2-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309070741.34152-1-chakrabortyshubham66@gmail.com>
References: <20260309070741.34152-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773040102; x=1773644902; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7lvS0a4dGdhIS5x5iJWmch0MxhDIjNUIJzsSVPZWaZE=;
 b=E6C7TvKlLsSdNyyithZX3YeloLA46yDh6VQL03v+ZYAFu4AVRlJvT8J83CGs1iL3mj
 wdwr/wBvYLystSFTLGX9CHgdtLfpc7bhYNJmjajGq6nmMdiYYwxaidhO3Z9hLufT82m+
 ZvjEYEjh6p9GMSRpM++LTKeRuPQ/5XmuqRxDvsus6YiOepiGben1Wl7PQyuL/D7s4L0b
 MPqjdXoXI/y8ob4lSg2osMsNMJoirNnD1Ado7825jRxfFpc0E/8VbqKL09nYsWWb1WZh
 6fTwZQPDjvnYC8tZJRQhWtDUbXAxqUS/YOEeLaSJTLqSqg1rKVF+ePZd6umuQub5Z7sn
 9a5g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=E6C7TvKl
Subject: [Buildroot] [PATCH v2 2/2] DEVELOPERS: add Shubham Chakraborty as
 maintainer of package/which
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

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
Changes in v2:
- Fix indentation to use tabs instead of spaces
- Add trailing slash to package/which/
---
 DEVELOPERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 835be1f6a3..51d9f8a4be 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3058,6 +3058,9 @@ F:	package/tunctl/
 F:	package/ubus/
 F:	package/wolfssl/
 
+N:	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+F:	package/which/
+
 N:	Simon Dawson <spdawson@gmail.com>
 F:	boot/at91bootstrap3/
 F:	package/cppzmq/
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
