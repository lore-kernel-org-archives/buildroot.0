Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D9D606A31D
	for <buildroot@archiver.kernel.org>; Sun, 15 Nov 2026 08:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ZyfS1xv0;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=ObRKVMUp
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83DD7810B3;
	Sun, 15 Nov 2026 08:17:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DzoigR2USixC; Sun, 15 Nov 2026 08:17:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6F415810AD
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794730651;
	b=o5s/3EC8+HHJmLM5ChxisbYIbRocGl1WsxKBINLLOtfBVJaEnMBgWQFSW1El3RyscQcb
	 mVug6sTNIwzKis++FxihFAhdA0/JPKAnceWJSh/Wc+yfXiNbTu8XMsAhiUkd3LRnkWRk4
	 of0jXaudn6bNb+4FPEVFj9oQ9+DuWLEMh5jpVZBfH9ndex70FFsxFU7b2DvBbV2GsDak1
	 I+qJ6fs21vYYPzOVj7b3jiYUxDuB9QbfA5+zjoq4oJ+xiohbIhJxzQp+I/mRNE+j98gA5
	 +G9NpdwbNWEtCY8nXA9gSBGCh6yuLBVmXO3qP1tWod6Pfu9Kq1d5075uI+3mTrYA3XA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794730651;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=hggqulr9Z/TG7pinFmqlL+0oUzPqybSnxvySYEXp6AI=;
	b=nmfYjW8kN6bUohn1yLLehRI4HG+CJw+3cSzfxY8cA/KGvcPZCHo1/JZ9Lt3BrPW5jsnq
	 gZCtEOl2BKnZDLZfo2+l0HoH5PoxPuKPGXOxX9QgUstnxglJHNChT8b5sDmH4iPWIBgXO
	 bg694d5K6wHk23V1jb2oVZqmBJZjs07NZtwNAmwR7ND5KTde7r3/px1AyPG8/nRtXwX3p
	 N6PdA8PsSaymfDR3wfvTV4Ij3udm8f25m7HLgxV4f3xNDu9PzdRRzlw71wvbHaueJrvpf
	 kjbnzcSMQpi18y50hoQ3YF6Kp48MLRk+HGU8Hd+vgGqvcxtLQEmzyViFKqBroQ9b/7w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=ObRKVMUp;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794730651;
	bh=hggqulr9Z/TG7pinFmqlL+0oUzPqybSnxvySYEXp6AI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZyfS1xv0AGnKte3CXrTfyt/HKD+JZYxp1pnZgYV31yWLIkX058/wLMNw6TG/DOzgQ
	 7fjnWP3UuQmilksBFu79Q1xRgz3wIBal0UC8WtIAMQKRPiFaSCgp7eP5A7PJOsDlet
	 Y0gF1pQ+lRSHQElCp/S9t1V72c3TEw1qrvBVYC5yEJn/diXcvfcOhJbaDv1HIQMG7B
	 ukomJUC4dc3+o1GCRFZ2bCyJy/TXNs80rGTRhwuTqCFI3lHKT4C+d+dw7sCiuz1gw5
	 6jdGasgtQKMbDC0vp1vFVaqO7kqoBRgEshwEDhxI9BFUvHvTA1Rn0cP3KVMizyKNGw
	 ugbTKTc5WrKrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F415810AD;
	Sun, 15 Nov 2026 08:17:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 15B772E5
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 08:17:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E4673810AC
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 08:17:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 496WWlo7Yj1x for <buildroot@buildroot.org>;
 Sun, 15 Nov 2026 08:17:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D6F09810AD
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ObRKVMUp
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D6F09810AD
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 08:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1794730643;
 bh=NdYBN9CaNKCrRloRzy8za0AG2M9JD9xKiX+yFU79+Fw=;
 h=From:To:Cc:Subject:Date:From;
 b=ObRKVMUp8TBZdcgZdVTnnW9LjvJbi4hNsCZcERhmOslZVwNKJqAymAH97YXyzP0or
 vzVe8SwRWAl4bWNLEI+XViGEJytFRqdtFEAX/CfimvLQ5EF1PE4tItF+QY1WXJ7U1Q
 gmbpZb07mtZdpBeqqKCkqL+dI4K9spqwN4ueKJtcm7OkdttWHOlsmKH2zVRqOaWrhS
 ZQdRrCRlAE6WtOVTBZgpkHbiCMR1djAPi0o64yGbCLUqLeZ87YmawStWVR+53JIxRV
 QacVxqvHnwLaoaXI1gS/1oK5ojH9UYiPWe3SKVPOgQepZkwpiYURiSbff0parZf3rW
 UyL/zbgm44Y1w==
X-KAS-Sym: v3:f51bdf72230551df:HkQyKNzaFhy2OF6q4EdEPIwIse7Ff40dC+6yGu5vbE0Be
 nTzqvVEac6/BMcdYml2Rlq6j10wsjM87vTScU2ZjG6GeHWxSQTlVExr5qkDSXZKlk9JyPEibVV/
 0j5uZRZXUDWjA7m71008bimz5PHE/ZApbKah2OwdcV4oXTI10UJoAdgX4xxZU3mj/7lIJlUEscU
 OVIQEbZkUcHK0RkqpX1Dfyr/CsHK4+7VleURxIVT8Pq3mLTc1kLMV3sDz7hf/wPr65+Fk7QuPTW
 3CWsafe3fO/alHcrMhl9QvuJat+2QZ19o9sWuE49kqYyfPr5Q3SF6DO3jTrYQXM9Hn0yIzwQ==:
 BEwVwdpq9ZopBBW60ckcCH2S+YpBcms0aoA156i/i0a3glSH/eiXKEgK0XzyZpwRGnSZv/v9/sG
 HPpDk/qUyTLQWO1tRCYVw0aq4iehU6OijKRz/U0tqod9Yd03kVeGTYwJg49yLuyIzFbuJgrO9BI
 N7sGhROQ0QL+NXJ8omhabwhnTZxwUPdWPb02366TMi1VUyjmCHoLTErkKgTABMH1+rim57/dTzW
 M+aHek6ZoDk5UGcBuffVlypoJbWBur5PX0jtFh/SyObRqvRncpy+hEDJMOfIIQNq8uJBlH6CQg7
 us3OymD5nENh2sXMe9v6M72f1qxeZKupeT5XtE+0UGsPbi+bdJRJ/wurJhBHT6YNlvDKXH9d0YE
 NADPjofVBlHByUHDAvZlGiiK8vytEvDCqrMsMz4uz0XFnfFklJH9598yxbac2JJZ0BSTT2rO6/0
 rtxi1gPW6VO3dACJa2CDyMM1GSgeYLfIYYAljclgzXRzUE+fmxgs9kou0e0D4MSFOnxMb26cA/G
 qnv514H1I8WNaBanU8Icys0RJNBBC2djrkXTJG6bwmJowt9XmcYHKfCiKUW6EtE4Z3MoGog14vP
 eio/IuiM3ayx/roEiK1p6Snpd3T5MUc8OrbO6PM7Ti/izir8boXyulfRaQ==
Received: from fli4l.lan.fli4l (p54a1b069.dip0.t-ipconnect.de [84.161.176.105])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D33B4A4C4130;
 Sun, 15 Nov 2026 09:17:22 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49014)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xSVQQ-000000002g5-14mb;
 Sun, 15 Nov 2026 08:17:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
Date: Sun, 15 Nov 2026 09:17:22 +0100
Message-ID: <20261115081722.31558-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 1/1] support/testing: test_glxinfo: add
 BR2_i386=y
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Buildroot commit 86240fa45d11e3388968520b4a35f0a40954c132 switched the
default target architecture to AArch64 causing errors with this test
seen by the Gitlab autobuilders:

WARN: defconfig can't be used
      Missing: BR2_x86_core2=y

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 support/testing/tests/package/test_glxinfo.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/testing/tests/package/test_glxinfo.py b/support/testing/tests/package/test_glxinfo.py
index 2c3181d9fb..bedb8443b8 100644
--- a/support/testing/tests/package/test_glxinfo.py
+++ b/support/testing/tests/package/test_glxinfo.py
@@ -9,6 +9,7 @@ GLXINFO_TIMEOUT = 120
 class TestGlxinfo(infra.basetest.BRTest):
     config = \
         """
+        BR2_i386=y
         BR2_x86_core2=y
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
