Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED61D606A32C
	for <buildroot@archiver.kernel.org>; Thu, 26 Nov 2026 11:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LTzFqPt1;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k+JdAjDL
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C26BA408F8;
	Thu, 26 Nov 2026 11:31:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bNo3TM6EyWXz; Thu, 26 Nov 2026 11:31:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D5E1E408E4
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795692693;
	b=gb8/HRnRu/lic3oFGePiWEY6hLI+FGH2x0qrr1hDIG40rmdmyX/8aYmAtZUYlVdkGzCh
	 798OlRASgCVjQzc94ICBDTvIl+Bt2QwktlmX26uWSlQNwRYDQ5y1bXAkOgAxJp9qj3hOb
	 x/tDF5nbtkfUrUE8WHzkDPwhGDDtcpnIC7cCCCtzpPXc+ZHFVikKTbjTqCpuZhgcqNZle
	 J/qJ40G2NKTpTc9Z+GrJhETCNqPG8eS/xXNSkVsf3eGvEmHfRb8vV+08KplULhjv7019F
	 TNl4Z0/wyJNHEUcYMAQ64ebr+rZXk3Q5ccCax15JYGsryOtShBfFPTTKUOovX19baEQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795692693;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=bKnjVfpkE7SW2dzxXf4cY6DJzOEVU73JvEVFv0S7r8c=;
	b=h8IZgE9cY8s6yUieeAcXRoeOf9sO1ig3B7jMPkZpcMIT3orIFPzYDaGeJmFvV80Ml1o/
	 6V0bx+ec7AT8mxq2i2+INbFWcFANRa5EXPABPG8M9o2GGsDnsqjT1HDd9QJCRVGJePCgE
	 DaDOwMvMM+vQCWrDIIuAqCk8iLB6cKBPVJ7V+kPATSz655FWxDalMTTRDEWjzTFYfeRiP
	 yOQjb+P142oXEizOFhO1FuZCn2QDzcBQaULNpQYfCr8TMvYXF07e8LN2sBnskIHbnUL/s
	 yzeo8ByG0a1pKTKoduPbQ15Llyy+DMDIv6W9UIJHBKzwGHlCj5nht1G3ghOlPn0splQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k+JdAjDL;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795692692;
	bh=bKnjVfpkE7SW2dzxXf4cY6DJzOEVU73JvEVFv0S7r8c=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LTzFqPt1zPSqIbM5tiSd+3tqmWZVL+4NOUSJnxvADogNmSh+rVAvXtamZFlI00fO4
	 fwxnFFwcwWOEiD42EhslKBeCYIfrmIRAkRAkULa6AMnfXQhQQ5yQuVkxq1WyU7BEl9
	 OQ8CjQ6Yr/c2O+rWfiynDcVYNMf0LZ8N7OFH5056W/YdZyS5WD62tkTHHCBIr9gifl
	 5WBEB+ujVmnZHWR7VQ1dRACYuSLNEuN5TOiXBV64PKJ8fbtbomWuAuE2qq7raEWil8
	 xakRyuDup9MTSXbSTUM/GXKo6uevTfbRwlAd7bPdGV+dKFr804ecSw8IoS6Lt5OI3d
	 5EG/uNpV5Gzxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5E1E408E4;
	Thu, 26 Nov 2026 11:31:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D30E260
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 11:31:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4DB34408E4
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 11:31:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3fTYehsmB1Dq for <buildroot@buildroot.org>;
 Thu, 26 Nov 2026 11:31:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 757EA4085C
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::132a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::132a; helo=mail-dy1-x132a.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=k+JdAjDL
Received: from mail-dy1-x132a.google.com (mail-dy1-x132a.google.com
 [IPv6:2607:f8b0:4864:20::132a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 757EA4085C
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 11:31:30 +0000 (UTC)
Received: by mail-dy1-x132a.google.com with SMTP id
 5a478bee46e88-38644aedba1so10340975eec.0
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 03:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795692689; x=1796297489; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=tPuxEBeJPgZ3Vq9whaVypJM0huKVcEnipJdOCm/TQzo=;
 b=k+JdAjDLrfacN0wohEoGbQjL4bTVMtoTdvs552g7MbfDer29e1zEErVMV4wy9E4dv5
 y7/NzWHP4W5vYB2YJEkgCMR0RvDxD1qC+Fk27aDPObYw+jGffY1fe4d1enlhXfY028DF
 Hr1LynkZFEQyquVigwqORqjyBAufGnFQpB9O/4QWcZd/y/2nANNYMgwX7J7FP+SdMV48
 4ZGpoXdRTBai8Fhk8n5l+r0ezE6rvm5FcpwuBguZCaITp43yHtll2N+FD+QWJyiKBTDd
 ehzT2hHhxPnzwLlsWuJsy4gYhCL3FJUViG/LUZ75dfNdwU2qoxbm/CPKq6nlRiPgnUQv
 WIsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795692689; x=1796297489;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=tPuxEBeJPgZ3Vq9whaVypJM0huKVcEnipJdOCm/TQzo=;
 b=HXXKCyGEPFh2ZCvV8VofVwfrdrh9ZIgqC8VzlhhEg0gkhGDcNZM+A4O2V1Ql4EhT8K
 QbnRtSax43ScKoE34AWG4Pfk22EbSIoJYM3pXtac+s6kGUbSwsENh0FmC/zxChJBmsvp
 JF1UVhrCnekeo4CQ6h3ApM6dMfQ9e+pVPUlj0FioaM6ruV53fpwUp2CzUbDlTrAdpLRF
 aCLZStC5BOTZPaFUGN6k9Nxq4DxE4TioOipnOOBfUXScVpy5De8hJbOJ1OlFjpukgWcr
 HTTPdvwS75UgEFjUe0/Pwz1dADao+fjINtx07SHv+R95nOWAYf6/Hpka5y0LBVsq++t0
 eEHQ==
X-Gm-Message-State: APuU4Z+BhFdpxts97tdcSNlUPu2vlYZKr5Gnan1Yb3y7dA5p3071MLcx
 7eoOh62zyy1/YB4oD4xVOuwcHaACzrzE9X34Y9YUXxElArTwevYl2pi9j7S91Q==
X-Gm-Gg: AZFdTZdGwESdwNznuFsCALUW3Gp9zJjDW/XiKg3lsH/s9cGgF9fYBlO0nDoex3DuT4+
 Y7lJOObsg8bup/FwftIPaK6l8yfgHGa5FPGXtukymwQi0E7Grn7k5zOXC9Y0BjppwvOFE+Wizlz
 Px9ox7mqSl7RwgeK2kfIRhyKs/7Jo7nJIMiK4DbmTclrsk3vNxMwN/h5GB3FqBY+WdGgER16nsu
 Qob5/syKuMiFT2+geuMXhv64d0Pux9l8mVgI+3Ict81W6LUuZ52fN+S9uf7P6xzQxQkGanZz+v8
 DOq4s8owZhP28sBEzCwOGeL3rqkukZzTDF6WVRy85QSMowqyX7vjq6wJSo3zsrd1WtvxndUzOTy
 945ybjePAPQ+76sOVq7Z9DEC4zOy75z5N7aPyArrSqOQEW1Zow2YwTlg73ZoK1Pm4lXbFUWz1/r
 RFHLCvUlBA+jBg4YqbtS8NTbLCjHHdt1bKBX3fNK6J6uX/DT/dY+SpMQ6x5CLO2g3VAC+CfvPcQ
 ZsNGhwEd3cFQnETjObU+TwJklPJKaxAHiNDs2ozihSFASY8DSPxN8BHzWuDp+duIp5kRiwfgXiR
 B1D3EJGGiDRdkXEi3789Hx9pTIWl/zZSRnY89lI8Hyj2nhtP659xGZHjdJtDunPi
X-Received: by 2002:a05:7301:1505:b0:384:df31:6a07 with SMTP id
 5a478bee46e88-386a87efea0mr13441752eec.30.1795692689168; 
 Thu, 26 Nov 2026 03:31:29 -0800 (PST)
Received: from fedora.taildae27b.ts.net
 ([2409:40e4:2045:e80e:4a6e:5538:6cfb:9bf5])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-38566cd40c5sm75396853eec.10.2026.11.26.03.31.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2026 03:31:28 -0800 (PST)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Thu, 26 Nov 2026 17:00:55 +0530
Message-ID: <20261126113056.603096-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/font-awesome: bump to version 7.3.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

For change log, see:
https://fontawesome.com/docs/changelog/

Tested using:
 utils/test-pkg -p font-awesome
 (Result: 6 builds, 0 skipped, 0 build failed)

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 package/font-awesome/font-awesome.hash | 2 +-
 package/font-awesome/font-awesome.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/font-awesome/font-awesome.hash b/package/font-awesome/font-awesome.hash
index 29c64cd40f..53aa02143f 100644
--- a/package/font-awesome/font-awesome.hash
+++ b/package/font-awesome/font-awesome.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8f433b74d3d4bbba2a6374a0a0ddf53be8e127809341e4c2578719229b43903a  font-awesome-7.2.0.tar.gz
+sha256  d5a20554faa1ad30148b05f090a556e23495c446435c8dfc1624d3c0e3c2640b  font-awesome-7.3.1.tar.gz
 sha256  20c6f40715a567c97b80f6944beb8bb325835cab47ea7dcab89ee3b8e077eced  LICENSE.txt
diff --git a/package/font-awesome/font-awesome.mk b/package/font-awesome/font-awesome.mk
index 2b1de910ce..21248313a8 100644
--- a/package/font-awesome/font-awesome.mk
+++ b/package/font-awesome/font-awesome.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FONT_AWESOME_VERSION = 7.2.0
+FONT_AWESOME_VERSION = 7.3.1
 FONT_AWESOME_SITE = $(call github,FortAwesome,Font-Awesome,$(FONT_AWESOME_VERSION))
 FONT_AWESOME_LICENSE = OFL-1.1 (fonts), MIT (code), CC-BY-4.0 (icons)
 FONT_AWESOME_LICENSE_FILES = LICENSE.txt
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
