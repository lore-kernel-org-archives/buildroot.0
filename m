Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6AA606EE80
	for <buildroot@archiver.kernel.org>; Mon,  9 Nov 2026 15:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MsqkkyWU
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEDDC8101B;
	Mon,  9 Nov 2026 15:55:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tcZ-Mrqq5Yqd; Mon,  9 Nov 2026 15:55:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E03208100A
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794239715;
	b=JpPeDmnfmZcClf0mxxHyi+v548t5PXrL8pdBx1x/PnPBIutVepXouxTZqep+Bt4fi4Ek
	 Ijp9dS5IGSqRU8N3W8S9HeYBE9SJ2Nf5JkQdzALM52CukUvQ7rk/hNrnnQ9sdkPcmJX7E
	 fuW0QZJhP9hWXV40RIu/fhppDdHlxWmlUK3jUcwqMaS16AJCULIvSRmT1vMxUpC5ACilr
	 DSgImS5S3x0y4V9DuFvNXuZAyBYP3ZEbF96QMHV5HfxV8I897YS+2p2WGu0sg+yam9Jq8
	 1jYu9PkKf9xQcigoPyFvFt7YiEBBBIFB9gzStx6bX+NoJ9uTgFF3UfKl1RCIREkccGA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794239715;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Ki+jXZrOxBGQKbxnxN/5CvP9ifftJcKMnH6ldMovo0U=;
	b=iFyQMonfkvZUpT9B6jg7zblJx+t1kh/gzn3VVZ71hb945dn0Xo5jnfW+62g/G7dTprjP
	 FnQLeBwjbbvSmhcNHK8yM7RvuTva1BVkCnxaYVLDk2J21KFXdafMM8uO0EzI5X7Kw9wzt
	 DDPHC4gMLxLxbdwwN5vnbleTXdjrNATNrH0bckd7M4D6l2eDrQehPvr2ePrCkBox2AO0A
	 0MSf1rT2bsOJzttB6AyZAXFVAEQD2L/X9VumXbo2Pi3S2SHWslaDmpibb5KV9cOVjakJg
	 ItAWTKeRxBdNXnoEAEo5hF4NtaDHN7E+I19lYoTnnv6Y7SF6R96VwH6VPdBfrGLetuA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794239715;
	bh=Ki+jXZrOxBGQKbxnxN/5CvP9ifftJcKMnH6ldMovo0U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=MsqkkyWUqzHi/Oe18MfYYZPhszyt1VC1Uplg+oGdAw4WaKBTusAeU0x9rx/g+vxYl
	 ynwILcVrA5SwmfTpIL+sD5M9O5JDcP68duRGC5ud+4y0k8SzVOIvKR/U117hVb67tF
	 iEvjktq6jt0yZlJi8tZeB941vhz0kNiDp/oop+/4s5ZGiEPTouVWtsOXVikLgpY8OR
	 V+4NW3pBMcA7ptPbkDQtuQxLFCCzJDsamKjCa8RqlBOzv6Qy7lOPw5CRIf6t8JN4XI
	 dDF7fbKHIDebjVLTA4uRVt/ZuwRBz5Gv0HbK9HjdrWwFicI/UqSByCgV+b+VjhYBVQ
	 CXxqwnVahlZDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E03208100A;
	Mon,  9 Nov 2026 15:55:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B9173362
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 15:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AAAF24010C
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 15:55:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id owRkjT-1qz73 for <buildroot@buildroot.org>;
 Mon,  9 Nov 2026 15:55:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D91C540087
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D91C540087
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 15:55:11 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4a549cd7fd2so10080365e9.0
 for <buildroot@buildroot.org>; Mon, 09 Nov 2026 07:55:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794239709; x=1794844509;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=PAUPbk850myfcARAnDQRMAGLbJJyYJB5FwgSzzKh3sI=;
 b=d+LfWRQf5W8xyfBDm28kaNCJRtaepo97Ra7DmVpWvYJXtmg4pkn+BC8A7RpPCuWj3T
 8petUDeCmhcX5evNYyB8agru3Am1OJewDOIR509bUzunBNmhylhKMp6geH14ufG42cIN
 D+dgRGOnZ4HSXveczB8rbTGFIcSCOImrAOCFJEYPGPrN1Rd1eZeF77Ga/azR+wgngGjE
 ZubqeVhShOThRX2b0KOnRzJkMKTdvEKvkF8CFxyR383FN0t55Go632QiOosayvqZObXb
 osHEuKqW5l4ta6LfPYCeAIdy/ECtyz3Z7puXM/zi+EPGOz0/VaVAHCB8KeQW9JL0zCsm
 dbSg==
X-Gm-Message-State: APuU4Z8SOLVgVyNFUjkJRD2qBTuhU4gyZ/lZRrBcC8hvcdMgMVEcqmqb
 VLo/7SbQmtNzqMMvfXXxuaacmZshSef/+TDJFVVwGiKfMRJRRV0dcK23fBUx6MGacKpwxJPvK9E
 AJ78A
X-Gm-Gg: AYBFou26Tou8wR2PSjbMlQeGHmNHjTpstj7XzScrn5oYNaq9QR6rUGoWJmdgbZcJ8HL
 A7oVT8+LnYaRyGS7HUQzDFr8H/ZFqUz9L3DRGIznUsCTvUQH9788Qb0FtCqsi6Ge+XtW9tjOLPV
 lMbXS/djzndxh2lzzM4nW8yIy5ZJ5mYkk6TFw2MhgX1jy+l4U2ZJysLJLBDm/Wy3iE3WY/6aH/F
 eQtVMfThBMp0ZlopIDwl6PKM1QxKGr6XX/xqZTMyhNCnhlvn+npT9bqsguzNqits3Nf8haazl81
 rt1qlfIXx3iM2UHRuJuoY/9RbGFpao4ESaSHpbeUx4Utt0xRertFsUs3K5e1exxwk0u7fmFj28f
 iCEvuqTDoCKYey7EzlFrE+xwO8rYh2HFhtCfH02aMws80BPy1AR5XGOIcY6wnF6TrqV0AupdnNZ
 LIPji2j+pZxk2k8v3WBV8uCGeyB0XOQ2aa3qvSkjHPrcrj+pwoNbKHcOpLgWUnyLrHvHe7blslr
 QUI9lwW+P+OiODaDm93DT2BaLyjwjkR8BX0Rkte/1w1Vg+UqiCp+heL2HOriIkAyDPh2S2yOAmA
 BqZiCzm03vOOEYvjLYLc5Q==
X-Received: by 2002:a05:600c:198c:b0:49f:c5aa:9ef4 with SMTP id
 5b1f17b1804b1-4b9633ce4a4mr89503605e9.8.1794239709166; 
 Mon, 09 Nov 2026 07:55:09 -0800 (PST)
Received: from arch ([79.132.229.115]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b90f10c681sm137299725e9.10.2026.11.09.07.55.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2026 07:55:08 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon,  9 Nov 2026 16:55:08 +0100
Message-ID: <20261109155508.583886-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2025.02.x] package/python-dnspython: backport
 fix for GHSA-vvf4-9x63-8xvv
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fixes the following vulnerability:

- GHSA-vvf4-9x63-8xvv

A maliciously crafted zone file could use a WKS record to consume
excessive memory and CPU, possibly causing the process to exit due to
memory exhaustion.

For more information, see:
 - https://github.com/rthalley/dnspython/security/advisories/GHSA-vvf4-9x63-8xvv
 - https://github.com/rthalley/dnspython/commit/388db14ee9923288f6e73f86e482c77706e59d73

Assisted-by: LLM
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0002-Constrain-WKS-bitmap-size.patch      | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 package/python-dnspython/0002-Constrain-WKS-bitmap-size.patch

diff --git a/package/python-dnspython/0002-Constrain-WKS-bitmap-size.patch b/package/python-dnspython/0002-Constrain-WKS-bitmap-size.patch
new file mode 100644
index 0000000000..369a99d85e
--- /dev/null
+++ b/package/python-dnspython/0002-Constrain-WKS-bitmap-size.patch
@@ -0,0 +1,48 @@
+From 388db14ee9923288f6e73f86e482c77706e59d73 Mon Sep 17 00:00:00 2001
+From: Bob Halley <halley@dnspython.org>
+Date: Tue, 3 Nov 2026 12:01:13 -0800
+Subject: [PATCH] Constrain WKS bitmap size.
+
+(cherry picked from commit a62e1be066da0ed71b5b59f37435bb17cfa0070f)
+
+CVE: GHSA-vvf4-9x63-8xvv
+Upstream: https://github.com/rthalley/dnspython/commit/388db14ee9923288f6e73f86e482c77706e59d73
+[thomas: backport
+  - stripped tests and changelog
+  - adjust context to 2.7.0, this version does not have the to_styled_text() method
+]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ dns/rdtypes/IN/WKS.py | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/dns/rdtypes/IN/WKS.py b/dns/rdtypes/IN/WKS.py
+index 881a7849..365dee61 100644
+--- a/dns/rdtypes/IN/WKS.py
++++ b/dns/rdtypes/IN/WKS.py
+@@ -44,6 +44,10 @@ class WKS(dns.rdata.Rdata):
+         self.address = self._as_ipv4_address(address)
+         self.protocol = self._as_uint8(protocol)
+         self.bitmap = self._as_bytes(bitmap)
++        if len(self.bitmap) > 8192:
++            raise ValueError(
++                "service bitmap must be between 0 and 8192 bytes inclusive"
++            )
+ 
+     def to_text(self, origin=None, relativize=True, **kw):
+         bits = []
+@@ -77,11 +81,12 @@ class WKS(dns.rdata.Rdata):
+                 else:
+                     protocol_text = "tcp"
+                 serv = socket.getservbyname(value, protocol_text)
++            if serv < 0 or serv > 65535:
++                raise ValueError("service must be between 0 and 65535 inclusive")
+             i = serv // 8
+             l = len(bitmap)
+             if l < i + 1:
+-                for _ in range(l, i + 1):
+-                    bitmap.append(0)
++                bitmap.extend(bytes(i + 1 - l))
+             bitmap[i] = bitmap[i] | (0x80 >> (serv % 8))
+         bitmap = dns.rdata._truncate_bitmap(bitmap)
+         return cls(rdclass, rdtype, address, protocol, bitmap)
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
