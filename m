Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC02606A31A
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 21:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jkIF0K6F;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=Igo+Sb/w
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3E8460A7F;
	Thu, 29 Oct 2026 21:11:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a33XkYyKxYqc; Thu, 29 Oct 2026 21:11:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D7B6860A79
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793308306;
	b=PCFMdujGGfEmRPPQ/TQ+2v99r4DmsPW551JASP2yJOYpD/YIsE0TWYJl6PActLh2p778
	 SxpbqgSkCeqq9J25TD4WYVTzB45GHiQf/ly8dJBe1uRvU+7LgP2PPtF5Zp5qFk52kb+/s
	 PAEPL5+i/N7JT2wM1ox0Bmr04Tg0aDbRWSxJTNa0BA5nTTipNLXNE6rQf4p4/oLIs2fAz
	 WO2xIKasvfzYp31Sv0Xwv7sJK31lHj+bHnzvVMnYHpJIRbdLlApTR7jJ6izXaDwM3xrCi
	 CuA6vYlO3O4+mpHSdI6UcByzxyabKAxkQFHtatYnJ4sXoaINDsNjySF4HgRQeDLaLNg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793308306;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=i7TrjvQyao4f0YFw7FWQlpktQ6ggtnYRCiVk/3nn6uo=;
	b=JLXOR7QysbrRYDWjRzEoq/Azuw0qS5te8D2RLACBbNMrXqiI+5XjtjNznAWar6oAGGjv
	 mr9bcI34pNi23zsUsBlHCL+Tt04LWAAyF1Q8zfD2VIHo/aT0lflN2aeR6ZP/sucVkn+P4
	 84J/2MugBzxgUJRPT5lbgxan8Q91mt0bQv9hiHF8Ap4/VS7XOtpLuSlMXEd1qOfr3A3By
	 j5oLO9lKH9o82TRH/qnBk1NbhvEyahPnz7OcKjKRD+yXYFtR5PS9aQkcp/eZeijZyAMab
	 qdDNroTq08dQ5xI0ZQTfpQRXGHVZOqdoqBuHYcdulXSPIMdmRRCkH8t0/2iJLh95JBA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793308306;
	bh=i7TrjvQyao4f0YFw7FWQlpktQ6ggtnYRCiVk/3nn6uo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jkIF0K6FlYKxZmB0e/+PMV90szj2V5gIUMYZn+nz01uv2gB6ffY1SfaWRb7O5PdZT
	 ZQkxg+hDkN6cDhhRF/jgo5kN8PgGzCFDtC9MTCMbyeSRMaAI5hRmYItPLEqZeL1IuJ
	 EYOTm/EVnrbiO97LKvemt5JV+GH5APmUFKLaPCuorreRprnaBfpTdDqU7XmbYXuH8m
	 Bsf086jS6e+oPUekYGLzBOBRLkVfPAV31N0V35FKLIiz/+12Y6fROMm207x1xCsZWc
	 c4ciB2gLmZfVyIzR5/LYkY/OjG/kjogNdN4jIuMMEHlZQtcrQUsk3tYsfU7FXRfLPZ
	 x9onOV0qu94Sw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7B6860A79;
	Thu, 29 Oct 2026 21:11:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 38D011DE
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:11:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A35E40A6B
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:11:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JsP8c9QBwl1Z for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 21:11:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 17C5A407B3
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793308303;
 b=s7s8Ndy7N5AK1JEGu36Kbq9lEsjQhmsafhHA93iAzpjh6dT8RMWJ58twGC43DiJ1NikR
 PWvAR7ht045NB4cQIfSnW/AS9ooO2aBIPf2GLai2ikzZnEifLyzfRfXy7oEp6jxg7/Bb8
 lT404H/yMOs3tUaysHW91QobhftA9Om/Re0YlhgM+u8ZWd0N1OhIo82OoL2XELwnLDZdo
 VpwaIcan2GhyZ1kYg8tU96O8XLIxMsiFMzjx6mzp/iqoUp6gVXvrVvA9rTWvBkFkKFWKy
 LJij7y4yaZVKhFKDKzNATUNBYHA2ngQJ90qX4KxMKO91OMcC3vb5uPWkHukBkUxysTw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793308303;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=FHZuRIRHUy5olr30PECnCvTs8yOS+sevzwlnVK8vgfg=;
 b=mJBhzmHv+uyt199BtdlpndF6shVKHjtdW5AZucTM9nOx9uLYSOvnSyKVOqQyC0Oy4OIt
 KDwMc5vimvhF+xsz9wIIEsTpnG+ROSv436+hvgmWy24zGf/UCq6c09D1bmrQSz+kgiL+Q
 PzJZzkkU2Q6kZm17hCFj69/kLdibxHfjfegX0/+KTBuWa4KPjMTL0P8QO/YKnvGTCzp3A
 IWmW996/rHYcP3mS4xz4OvI7/dTNRSIhtiyGI2vvMUcxRFD1djVbAKjnCVIL9z4o+uWSD
 IqiUP2nn0k95JOkIIof+Mz/NAANNmB0TIHimQXFVoMXeqLmZDj3LakMtTWmjscdne/Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="Igo+Sb/w"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Igo+Sb/w
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 17C5A407B3
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793308300;
 bh=FHZuRIRHUy5olr30PECnCvTs8yOS+sevzwlnVK8vgfg=;
 h=From:To:Cc:Subject:Date:From;
 b=Igo+Sb/wNA2BGVL8IIIP5Yk7vVlgMmfsczMYqMLY0AWtRqZiq3+VQ07XNNUZH5GBB
 FbOet6zsyhmkqv4KE6XWiCA7x/Dg4Iwgs/6Q/N0SP4nBlWi+tBB+2TN+rQLNlaWe5P
 YI+givM83vje1lcX9lIWUz8VMoCQrq15sNsBaKfulYVBXSvOuHo+irB3lYe5DsLvJx
 JBW7pxwkyUIa/Ku3o0TWOMYNszED0m5xLYfHbh47Aey8P/ety3G0cKEZF9JiULdWE1
 IltId5UP+TGDmcP7MoqnCnUBQVBhThkVxwffbxa72ZUs0Uj5aAJvey2qxH60qWODu/
 /UeH07HNfH9fQ==
X-KAS-Sym: v3:f51bdf72230551df:WRQHxWQLr8HR1mmY6XH8DJG3RChrL6LKV0qi9OkJkI0nZ
 UfPAhCd/y2JMfAxmAu5Xx8lSg6bBAsKRwSNIwVwsP7mAxTEgnz3AR72MFQMMh9Ls6Jr1STYUZyA
 Rl2FKn+070X0048mJxiPD6Y8/tb2lI3fZJYWi5FSObMeHo+BKPfgJSd3gzoVM7//Pb3pGqpY+VB
 Yam04R4oF0tCqCfzC8/HBRas5xq2ArhQ5KKpLysXsJNO2Q1TNeBmBfJoowR7U2VN2KVvgvHTnC4
 7tKWPwivWtwhPwJUclh7VMipAvWELAD4u8Ew6Zwq38RouyEm8OSZbk1A60nMAKxENzLOzvQA==:
 C9GwrfFN7UqeidIFz8xvEHeOiyodnyZTVU9+IOAYsKLEuMm3SYeJn3lLQ9P+6FnQKx79ZMXmjS+
 XgEZzYVi9HYK6E/2hEsrTxLo8IDiDT5f3asz0wzGOobSvRHAfgn1eaESCjyO/LLrejHVIWs0jK0
 1oj5fKdmpWTNJOrHb/DPQWN5ynFO8eT0ktgH2U6cBu50gCmat6goMPHNH4bzWz3bOelyZBvQseQ
 fFYSHg2t2nUf7Zt8IRE5D0Tn/jtN7hdAvNsBMt5/dk+eyYdH7pd5B/AwXeuIu87pkTMdD9EAiZP
 varKBRZCdJ0IiDNIQzUgJ0yirnjNXJZHyDPhiFx7y61vTvHL5mA/OHpJhafEmIkdEErcaEqvkvl
 wMBHHA16PJEXqyUKa/AlU5/tgjzF8+ldnuwmhvl+MPYxRKOJOHGU/UncnqotMu9tUeQL64dnQc+
 jT4uG/XraBqntLwDY2cAiZm18HLuZz+f603n1Qr/PwlXRz6hNcvms3qNv0XmQuoNcB0LW7Gzs+S
 8D61AAG+K8PFvRZpAvlpYQTFT7v3pzVZTNdN1OuGYaZrWJ4BOC/gwpJV2gMH8kk/QEBHXhKCSL4
 rgVk
Received: from fli4l.lan.fli4l (p5b3a01b5.dip0.t-ipconnect.de [91.58.1.181])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 80E41A4C6CE1;
 Thu, 29 Oct 2026 22:11:40 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53612)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xMXPQ-000000002EX-05ce;
 Thu, 29 Oct 2026 21:11:40 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Thu, 29 Oct 2026 22:11:40 +0100
Message-ID: <20261029211140.1455177-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/tor: security bump version to
 0.4.9.15
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.15/ReleaseNotes?ref_type=tags

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index 37dd1e6000..dc7d35fa67 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.9.14.tar.gz.sha256sum
-sha256  182449ac1c8ff43278da27b69b02040e11d03d0327db6d9126e4190ec6235e4a  tor-0.4.9.14.tar.gz
+# From https://dist.torproject.org/tor-0.4.9.15.tar.gz.sha256sum
+sha256  1911f5b216a6814ed143a08bbcff1c6dc96d2ca3b505df9a21876080a92963f3  tor-0.4.9.15.tar.gz
 # Locally computed
 sha256  5dc29ea302cc75db6db4a7c88d7b5d4638b4e0f5f1d2e6d21ce71f707470b766  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 49b9524c26..3f07cc356c 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.9.14
+TOR_VERSION = 0.4.9.15
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
