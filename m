Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D3B606A31C
	for <buildroot@archiver.kernel.org>; Tue, 10 Nov 2026 17:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=XBMMB+6g;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=fbrxlXmb
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E3DF4089B;
	Tue, 10 Nov 2026 17:14:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IOMGGlaljvVf; Tue, 10 Nov 2026 17:14:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 822984088D
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794330853;
	b=C7UEsKCB6XFKy58QU9nP02e5mKYxWR18VfCRflgQJpRmvirBsmSRGVoftLHzN7C+obkD
	 D6f2QYjxmsS7s737BX/EDF45ZXeA6mLFU4NICKD2rO1rGgJDLdKAG+9XuPlMdMbai7RoX
	 DMKxELepsRKdFVrF31WlTWF6sTW615Mmr1G+zQDs7x96KMtPKmt/V9B0YEN0EM7qbGnqG
	 Sc3FhIHuJE2wC5xYOZo+ub55+dTEPszRn64T0AXg3jXLKbITW6+KkjJcdPGmY1l6NUG9v
	 3CzWljV8rggilk9nRcJrozJ5Knq4jw3TCTCk+a31gIumJL/l1hDxl9eiEp/E7U/XrAQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794330853;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=/x46QMUCMtmGJ93zkSCUJd1Va2vBkWSyf2HJFGAD78o=;
	b=WxYjrhOnm/RgTswwNUmMoY1IDBkUlY109uhIrP0rIKt9aCMp1bb7WYXPMc+PGNb8f5nF
	 9J03B3VI3Z6BKXE8QSuIk0J96tSO8sZH06OC2q0/+HafiImD3fKSUEG57d7IobCeQuQ8g
	 ULyAtIbJ9Kg8RViLkZhlf+djCH4eXmwuu36PV6tyz0Ls6RUQJvTaFcCufjhirrfXe6tLT
	 R4pTCQ+CKW8KSN+UWYiFL2Niubt8sU4SooDA7qF523eYE5ETtbKKzKM3XPPdOmuZ4zZmi
	 WP51y0l6sNF7sYXkQFcXtn0pu07RFn8k+oK3XM/9t+Z/pB4NU5cFQU7EBYq20SKAgYg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	dmarc=pass header.from=benettiengineering.com;
	dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=fbrxlXmb;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794330853;
	bh=/x46QMUCMtmGJ93zkSCUJd1Va2vBkWSyf2HJFGAD78o=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XBMMB+6giYa9Z4OCwV4m2o8jLsiKaR2Opbx8u1mgNN2ou9G0upTo2rdltWjtUcFwz
	 8Vn04tBU9be23n3fmfxtXZPfSrenh5qKEFnyY7vQ93rWvdbJvK5rb66VWRPMiJ5lSr
	 zAvJjsV6qLV6iEJd3Zcn7XArPvjzF4KwbmoHoAP45CVgbBGYoMLoT7T2ZmTTJ7QIEt
	 Y2FN7tPRF97AmtVLIvHaCY8uQjH0BB+hj+1Vmn7wS8guKHV09z2X9d3bhqoG/9znIN
	 qRtW1p63gc1timemnPlagartoZRVBk6JJQrX5HtYlLrh9suT4qmCOo0O2T81zu/g7e
	 zVWnJ2wNN2zRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 822984088D;
	Tue, 10 Nov 2026 17:14:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B7B2388
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 17:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6132F4088D
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 17:14:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bwGuxfWZ4pM1 for <buildroot@buildroot.org>;
 Tue, 10 Nov 2026 17:14:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DB83A40878
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=62.149.158.131
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.131;
 helo=smtpcmd04131.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=fbrxlXmb
Received: from smtpcmd04131.aruba.it (smtpcmd04131.aruba.it [62.149.158.131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DB83A40878
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 17:14:08 +0000 (UTC)
Received: from localhost.localdomain ([79.7.167.199])
 by Aruba SMTP with ESMTPSA
 id QpQ4xdgbKtleFQpQ5xtAAs; Tue, 10 Nov 2026 18:14:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1794330845; bh=CX/KdvYDbUtHFSjPqYK1wjk0lXvGWXFRe6XOS7Q25mk=;
 h=From:To:Subject:Date:MIME-Version;
 b=fbrxlXmbruaT+mh9nIkzZsL97D6IrvbHjVJOFMWch4+23JtwA3qRrMoSAfaW/JbNq
 j4mFZoT2QGGjYIyWk8oJPPHCKGYZuk9YxMFUDhmmkSHGCJTdAN2/8cSYvH+1GD3XYw
 l6b2bsW0//11MJ2wc6ltIqTNrI26eI3dP8lBlJ/ArtSlHbY+meBXmHpIZXeTx4wRN4
 otiqSOjyCL4iOjpnoYulrKd0tTc7ZDcaPKsoOIfepQCBZdk9E0a2Nge0Z1YK47q5Id
 grLUZCZx2bMsw5jVxgN8KsjuF1IIJB/ZUIEOvg9HFst4leMmja2GP5K4QPY85jeuzK
 VcO9wvO2vgCVg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 "Claude Opus 5.5" <noreply@anthropic.com>
Date: Tue, 10 Nov 2026 18:14:03 +0100
Message-ID: <20261110171404.869236-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfL4JmFJFO9IWycXpORR3Nl/qQpwgqaOCffrrbelawzVvg4YJydpGcEuzd2/BWtFW/OL5kEnoCQVP9sXAkC9NyRT9stVqVZh23rQKHp3VOM89efCn/JYL
 LWvoNZNqty2BJEtWo/WVtb1voty7L4u2UYZtUXPB2XfRxgksMiS5us+4cQtcb9bmS+fALqW6g5f+MqPyB4cSJCA0ZmsFTADFYoGQrE/uMp75tBUldbREUGC0
 1Dwg3dlNMkkO/Ql9uN8a25wv9C7AqZ29GkZW2QFiBtWP5L2+Wakc+rAPthZLKIntEps3e8JI8MPxWO0mW37mB57HBEabSU2jikS3384wvrQu8DZJuLXxMHIQ
 0B0BBkY8
Subject: [Buildroot] [PATCH] package/libnss: bump to version 3.133
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

Release notes:
https://hg-edge.mozilla.org/projects/nss/file/NSS_3_133_RTM/doc/src/releases/nss_3_133.md

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 37922f094c..31a7a98802 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_132_RTM/src/SHA256SUMS
-sha256  ee9cf4837ba801141a804321c4462ad8f452ff4314275c6d5108a6b05af227ff  nss-3.132.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_133_RTM/src/SHA256SUMS
+sha256  4d752526b9846a1d962588cfbd09b7cc2a4f6a4effbd9157d58a30e8a2573065  nss-3.133.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 209730f6b5..1a98caf6df 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.132
+LIBNSS_VERSION = 3.133
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
