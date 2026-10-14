Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87657CC6B24
	for <buildroot@archiver.kernel.org>; Wed, 14 Oct 2026 06:58:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 251FE80D49;
	Wed, 14 Oct 2026 06:58:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BJATGtMWL6B5; Wed, 14 Oct 2026 06:58:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1090880D60
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791961117;
	b=XZN5Mdf2LaWUTj6yGywyjxUQSmIigqc2N0OP2p2LGXzzVI2b2AXvRC8sFU4Ms4VEmYkS
	 WmFVZ/+FhYnFOz5GJU8d9iuA/TYatgKl4fmpsIsRdeLXM3zsEhhdCBuJFCxlYsKLd86ik
	 4TpP8YiiydvysX4eF3q6g1hqGT0wyRzvD59YUxWqMV3rimj1ZnNIP+I9KGbzJVFvwMI0T
	 UeqZ5jn/Cm4Fu+sFFqlRNSn0W+Jidl1PoGmw/46FjLzMUNZgk3qvxlNw/bDSKYhLB4/OW
	 nC9jLN4gp3I7zajXuyPyXGGVxLVd4tSLQ/au87NVVcOFElbcfbAlmvrHbga0vPlrpkA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791961117;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=XQ+BL6hiDgAx74fl2wM2H5TEWARB+Hy+iv8goJSL5Iw=;
	b=GJFMu9XhNFs9zNNFCNOwoXt+IbYA0q4/81F/eEj5HAQGqJS5t1rbRhtKG2diw6+2tpCm
	 DWj32UhoA46opLrG4zkDET8hDlcS/2JZH0R6dhhsAr3RsJJelpzAXuTGEuFn/iUAjznWg
	 3Lgf/itFr2QLrxD53G7TCGrayZPqWisEcSI26XbhSNdBVWubb7XVae8RGo2Y5IUdrCHno
	 t97mJD94+9f0EoGf+1t2irf82b8rvft6nvK6PcHfD708zPj5BIOX4/FRsy7REJCSQTBoY
	 fhiXkfJTwxcr3DpxCEnmh8cOc1YIiVPl/8M3kcQj1bQBr0NsLBteU4t+8jOwMBEA1eg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791961117;
	bh=XQ+BL6hiDgAx74fl2wM2H5TEWARB+Hy+iv8goJSL5Iw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fu9qYwawYLiZr8Phuz2tA/BKLbOhRMX68bV7r6Ub4EdhEuFOKsPendnM4iBWX8M2t
	 hj9oK9bVtC/xbpZ++12XGEov5LCDqN+hKJ8HnhOABsOY2Waq+V1++9LR92kmN1ThBv
	 SRxbm8kueVjjPgCU9xRbzAt9jyMlvrD8RwbhTdQUlDuYcnpNhT2JsgjGSpyOpk5E02
	 HMyuxH/gTZ7PM5BWcz7D9vO3fGvmTTyVYiLNQBT5pyYVAryixKnFRncmMr5QoPgxDO
	 oC+TSqpztlGVUfU9R5M32J0WeSUG4m3ee17RguJUB5xyHkU+qWN1uiML3frS4hA4sh
	 Gh1lGB/XtqeKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1090880D60;
	Wed, 14 Oct 2026 06:58:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 80D371518
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 06:58:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 660F5406C9
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 06:58:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jLNwJtMA9bh3 for <buildroot@buildroot.org>;
 Wed, 14 Oct 2026 06:58:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C7C1E406C6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791961114;
 b=ahaqwXVPBP1p6kx0IEpmQdxONXFLx7fPvPIJtDDWD6qQb4Hy6G8+Igc9XRj3w65I/m8u
 ux5nyu28eYeQssjsfEInntJbNzZyWhA9h9/6M9TdQVZhzxghqhMBlnYdl+aw7ZR90rTYK
 Y4JEM32fxXU0A7B2uwrKOUiM93yn67iD3X+yfJP3OCh9aKyTG99jgRa28uaZ5CDO627MJ
 4aPTnZ2yHzWtrGTZGG3Y0LMz+GjkzhwHQcRTt1LrNqyYLmwmhAME3WtX2EQlwUcohX1KA
 nnYGga6USshxah0trqEZocBraUcWRflI4o51n4CUZc64Uk0+jpHg5Z0yAto870iMoug==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791961114;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=PdxJ/WUbyV+YNMwlI27N8e1z2DA76AkNZYTgS0YuJ0I=;
 b=N0dHflbBuC+h8FS34C7LAykBzNzAlGH7g2GP8AjxRTlGVfaXXm+WDPh8zWE+X45aqE+x
 6ivLeZvn7pvpRlgCBf6S2XN78gXBB7Wj0bvLQSgnNyO44Ecs+RJVM57ckiaybd3fgaO02
 GF53fxPuWbG8tnyw2fa6kMDees26H21xmfHrzJ2f1pI0qRLAYGABAcbg/qbDb28I5Zc/r
 tpyXvyoB8Eybic/4GzAgL1iWQmkqhgX5ADCNwVQlCFN0h8BdeWyk8i/Yq0+BUxDeBwlq8
 Ei8B75fjDAiS7Ic2NWEuARikVvhDuSHbSmqupNF5Z3fE8RRv+o4ix4870/T2N/0bbUg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=F0gV1qv9; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C7C1E406C6
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 06:58:32 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4a0286c981dso5007275e9.2
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 23:58:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791961111; x=1792565911;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=PdxJ/WUbyV+YNMwlI27N8e1z2DA76AkNZYTgS0YuJ0I=;
 b=gXEjOPzzFKqxfwNC471vDX34CVUW1PpnAxqRPcwN56yrrcWUMydD8EqNOp5yE89R6X
 ygpArt9s/1wdVIwFW3576Kdc2ECOO99AphOW5yPVL0Dx5TNkH3FW+zMi0lyYmYzEWY08
 Wm24I7d2Ged6zLQ3JZUHYa+Hc4Jq0eGzyvE/drjBg0r7hEKFBYPVe5hHzhOPJ02a6IRC
 Xpk4jKrx8xfyhjqsxB+hJk3XbmmCvWO6QOA4L3Na6yP9swVRnm+PRp42jUCKHm3DCqrR
 ut9qMa+9Y1X0+gAMEcqiLKNsGutu5twtvC1ji5ser2sDyItckvNDOq2I8xSs6Ck7dO25
 EgiQ==
X-Gm-Message-State: AFq9FYLQMPPgIWEYkmf2GH/KPN71LxKluFKM4qLlPX2UXKsi2Nuflpf5
 zI8YcgLFHTtk4U0VCN0uVSfN0IFZrYTNRBWrqgA8Q4jReMZ1V69v4lb/X8MZ4cbdMnDSLxA1rXK
 BVNQW
X-Gm-Gg: AYBFou2MOz4xeA/uKOJi+kn6hHXYQW2ScCSD824wYIxqu+XtlPNftVt+QDsC/MjjJjg
 QeqlVijR+mafyAVkjZRdhTUFlbCbTBFGObTSLOmuTSUTSGSusg491kzJiYgTIwx5uzxZlL1F94c
 sx8kkGJfcg9+dwgE6AzBQb7+sTjIuZ3aYHzrjTd+xqolYQP7Ex+KjrzHoPI5BTBrB4AfrXCFs5m
 NWeprJvljZRadfR5kI/W8xVnb3dNUxyk+hxMycgzIW9rKD9rgogRjKHOZh6/Wpb7aI5fmomczLR
 8fKLValbwN82j3l/izidCJhrKBZlie1+QH4I3azJlznFZkCNpUiUeRP0OWb7AxTfCojDelQNxPN
 dQYtMgpPcgS43wAU9BDB6CHmfYYmVsoRTuu4mmob9IBnnDbJBWdKsmaeSikAqnMAytYa0ITevR6
 G7YtSqn11mD08mOHxnWRBUCv/cMyGMqF1hPfCIB/UnUpLzQlrYR3T0UhPzi7Uv2FM=
X-Received: by 2002:a05:600c:3b98:b0:499:79b9:e220 with SMTP id
 5b1f17b1804b1-4a18e49886amr331958885e9.10.1791961110487; 
 Tue, 13 Oct 2026 23:58:30 -0700 (PDT)
Received: from arch ([79.132.229.115]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0ac35dfsm10030306f8f.33.2026.10.13.23.58.29
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 23:58:29 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 14 Oct 2026 08:58:29 +0200
Message-ID: <20261014065829.22477-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libzlib: upstream patch for
 CVE-2026-85091
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes the following vulnerability:

- CVE-2026-85091:
    zlib versions 1.3.1.2 through 1.3.2 contain a heap buffer overflow
    vulnerability in the gz_vacate() function when processing non-blocking
    gzwrite() operations with stale external buffer pointers. Attackers
    can trigger the overflow by calling gzprintf() or gzvprintf() after a
    write stall, causing an unchecked memmove() to write beyond the
    internal input buffer boundary.

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-85091
 - https://security-tracker.debian.org/tracker/CVE-2026-85091
 - https://github.com/madler/zlib/commit/df84af25dc1942490e1d1c899a07619152a46148.patch

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...overflow-bug-in-non-blocking-gzwrite.patch | 31 +++++++++++++++++++
 package/libzlib/libzlib.mk                    |  2 ++
 2 files changed, 33 insertions(+)
 create mode 100644 package/libzlib/0001-fix-buffer-overflow-bug-in-non-blocking-gzwrite.patch

diff --git a/package/libzlib/0001-fix-buffer-overflow-bug-in-non-blocking-gzwrite.patch b/package/libzlib/0001-fix-buffer-overflow-bug-in-non-blocking-gzwrite.patch
new file mode 100644
index 0000000000..32aaabcc76
--- /dev/null
+++ b/package/libzlib/0001-fix-buffer-overflow-bug-in-non-blocking-gzwrite.patch
@@ -0,0 +1,31 @@
+From df84af25dc1942490e1d1c899a07619152a46148 Mon Sep 17 00:00:00 2001
+From: Mark Adler <git@madler.net>
+Date: Wed, 16 Sep 2026 16:26:14 -0700
+Subject: [PATCH] Fix buffer overflow bug in non-blocking gzwrite.
+
+This addresses CVE-2026-85091.
+
+Upstream: https://github.com/madler/zlib/commit/df84af25dc1942490e1d1c899a07619152a46148.patch
+CVE: CVE-2026-85091
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ gzwrite.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/gzwrite.c b/gzwrite.c
+index b217b85ce..512329244 100644
+--- a/gzwrite.c
++++ b/gzwrite.c
+@@ -242,8 +242,11 @@ local z_size_t gz_write(gz_statep state, voidpc buf, z_size_t len) {
+             n -= state->strm.avail_in;
+             state->x.pos += n;
+             len -= n;
+-            if (ret == -1)
++            if (ret == -1) {
++                state->strm.avail_in = 0;
++                state->strm.next_in = state->in;
+                 return state->again ? put - len : 0;
++            }
+         } while (len);
+     }
+ 
diff --git a/package/libzlib/libzlib.mk b/package/libzlib/libzlib.mk
index d71d5d5233..9ce08d7093 100644
--- a/package/libzlib/libzlib.mk
+++ b/package/libzlib/libzlib.mk
@@ -15,6 +15,8 @@ LIBZLIB_PROVIDES = zlib
 LIBZLIB_CPE_ID_VENDOR = zlib
 LIBZLIB_CPE_ID_PRODUCT = zlib
 
+LIBZLIB_IGNORE_CVES += CVE-2026-85091
+
 # It is not possible to build only a shared version of zlib, so we build both
 # shared and static, unless we only want the static libs, and we eventually
 # selectively remove what we do not want
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
