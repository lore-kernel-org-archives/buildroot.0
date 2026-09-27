Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A09DFC9830E
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 670B840A6E;
	Sun, 27 Sep 2026 10:52:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0JgxqfrLDLin; Sun, 27 Sep 2026 10:52:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 98F6040A56
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790506332;
	b=PUTMFNVOHe4yCWFCW9BKoUgdu9ruwWfORt2oRHjZ3V8F16gz7ZPSFs/QZUVC/Byc72WG
	 UbYrw4JxJAoD0REsZjGFxAWlTJvw+iPzH7TZXP/eDdZJr9QoTTNlKFz80jGmpocVCvDkY
	 YLzfWJAi+1bHZcQLhBB2l1d5vwAzQpi7XzK4Fp/+VUIYQGF8JIdzQUlmtVXfkrEYmJ+49
	 OCJmgmSW7esxQ17z0zC5nsg7p0LccSMhZHZqRPb821YgEbz9zfFH1YqOWI9s+9xHectFT
	 piOlqlNmb4DIcUe5qEOKG70LwyaYxY27TBoeAu4DTPumlJS6ETYfwxman7gUr1ijExw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790506332;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Is8nPHj13DQ1jXlyMdbNSlt1T+TEevUXhKzsxeNTfr4=;
	b=Exlscy06ngetPMOeClVbVLvqW8qDZ8QY9wJ4V2P4KxxbmdqtLU+Tfmzpb1clYxeezhNQ
	 jOJlB6VPbjrrYgVDFfYEwlyfve5uDJr0jPEsNvrgZ32BJiUWDF+lirzLRwewy9gSSeqdE
	 RRcsWLFDvUuJ09EASjemRDJX7n3uQhoZgRJRDYQiuc+A3mC+yOI7Tb1v4RfdTw4gcV9IS
	 XgSv02qSOAUqT4SvgJH4vlBQ7X/oReaFbBzmNsgzQnLLb7bTpo4yAGoYw1QnaPkTu5kxP
	 SUfT/MRCqUAGcFasb8yvsCH3Hzh45vT5YVpZWl6TTGMiVJ93IONROcywBiVDtyQc/PA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790506332;
	bh=Is8nPHj13DQ1jXlyMdbNSlt1T+TEevUXhKzsxeNTfr4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Egq9tvXg9gFuEfHfPSivxb32taah19XGDCvyeS52djqko4RgJ4kEpwe7GBuTCWRll
	 8OVigrRuXc/qGCUtizDB084/4L7Urut2ZEkUGEzzhyucfl/i9EGxsFQRdZUA5oXAaL
	 PP9tR56llCXCyzzupIQWS3swQkvTgHBVGC/ZSTC1iyy5qTfzeR3CsDvzvxgPmAfL2Q
	 ssnucWCOr2V/34L1DhSh3iJUCLtUgovxAlWUhmqukIkKNivqgJoijSPIyax/1I9JFG
	 RD5xgRnftY5BiD+m13Gkp3opQycVLSg6T7Y2AHHAVzljClHnASHNTWCW7x6wytpbiq
	 5xUL+inmzKSuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98F6040A56;
	Sun, 27 Sep 2026 10:52:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F247D1
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:52:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6494F810C7
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:52:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oeyLZ1arJYzM for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:52:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A86D5810C6
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790506329;
 b=ksS7B0Nm1/5/tTkkPfNdz8bmOk3lUWsMeMQ/h/PAb6fdAiBGGhm0osoNEB99BCE/aKPq
 pnk9TNP9bRMiw0vIQeRoBWGqjpxO6lAzaEIC2/TDA/HCFi/ifhLvOEb7MvOW1LlCkqZyw
 0IftKtDRWO7aY5+do7rcs2nZw9IVrpBwREP79geTpgiqMueGN4CJW613VdB9bEHYjxh1x
 ow97IhgU9+IJZdaC+jJPyq9rjtu5YS6QaKyHxmNJoCcD/6TUPqnNJNp6oVFCMb9JC6+kq
 OfBP5mJiN7ISp9uGJpqZGoAAYXnX4XdXYzRpkVu12DGrCEGX1QEKSCh030oZWx8OQ1Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790506329;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=czQuI6o/bUY02JemzpJfHeMSxTwlaF+WSiXaaEMbdmY=;
 b=ntnCocqjEtcExm/akmxrIbn57dsn9IsuODpy/ccYLMMZmolYO4/vcA5n8kSWlYI7HI5A
 Zvezh5ItA/Y1BBVFhGVNHX7JlcM1bZHX78eusxG0sTnu0ONeEWMTPM4e3vepJXOJ+06dA
 r4SuP1PCvpLVMstFhANRvPm7AhDssDZbZJGPBQ3q+z4QpDJOhXJsCenqA0849mNzG4Wbm
 LdrRRq92sXCkA6W+qWSonKR1k90PwJTHl3oRKtv5F1LWAloKgLwEO5yb6+zzVf5mzk/tO
 7BvMWHTG8Zc16qcj+2XA68hmlWFknfFJ7yAGVBgTYsVM32x7EUt8ccWq4IQNemooXmw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=HmiVPLnZ; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=HmiVPLnZ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A86D5810C6
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505850;
 bh=czQuI6o/bUY02JemzpJfHeMSxTwlaF+WSiXaaEMbdmY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=HmiVPLnZ5wG3QNnF/3NBn86SKB85LY2nSKLfqukLalyNL6aTX/NVB40MQORs/2msS
 iybQC7Mh2BLREiib8djCDzTmeWNJcG3XwfWL5tD6pLpheDoxBY6BpvL7D7/cHou0cH
 SsGGHX6H5g/9IvAmpNLYdDmQLqFZ2W3qQicA7Og3PC0BpJMdQa9KANmD90x6joscQ6
 I53r8+1oPF9Jaj8PVD/uBvK1Y1mnSVQJgRgSJRv3BKFdLW3S4qfr03CYQK8UQUFt0V
 eTsPkvTocQ+93KzfRUrP+1g0COiNpw77OiExkRaNUlxdG/BFpLVbwZDGFMw4hLOaSO
 MXNi9j7iRqoog==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 F8hTUgVGo1ofUnzY8iiRCHL/m28YWLwnhHRdGgaiMOa1llJZDNmx5fA+l1GEJ5KKhy1iNjWLKcG
 f/sYBSmuFgM/y2LIdzhdpkax+4mp1RFslp0E6Jbfo0oUidavUZIyG1haAVFSdP8gKuYP0/DUhdn
 3jqcTOPZyi4CdRLwxyz7VxF8fSAefFYbw1dSkemHsUbbUm/BFEmQ3qasDwH3E95T5rqC/LYzJLb
 R1Z/mSyr7TDBz/SGO80fTaal6jl2DT5H0REWOnGmn+zM9iU+XxVPLmdc1V2sSEw2SzEkr7wn0/U
 0uQCO7KkZzcJttYZtN+fWiw/mirYt3ZL7vRg5TUUBI1jLYCardgPLXeFUOY7fUAT+Pz/e0MRIo1
 uHcq/cxcWs/S7NXNWmAycfT52XpoVgaaTEKP+slqiRitgUOxN+yrfqxPcGvCE+RB5Wrul1nlgpX
 uoHi4+ITJ1SUe2MotUJrRShV6JfzfL6AKDKmD32EEyJ8Np3N/SCnlWjwnBAkZkMN4IFCbXPP3fu
 3m4OkeKM1gu3bzH5NmXJpHgHz7Km3SMh0Ye69SXGDSCHZONGzo9kJXbWvNrFlr6xHISMUJV4xCl
 F5DhyipRsTfRXQdqE+9/JJ4Url/apYaL1tL6gIIdbgME9FX637uSeuMIhJqE7FCc0qYyuYLaxw=
 =
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 550AFA4C4F70;
 Sun, 27 Sep 2026 12:44:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLY-0000000007a-2FCf;
 Sun, 27 Sep 2026 10:43:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:41:54 +0200
Message-ID: <20260927104301.1801638-17-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH v6 16/82] package/boost: test needs exception
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
Cc: Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Sen Hastings <sen@hastings.org>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Michael Nosthoff <buildroot@heine.tech>

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/boost/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 5ab351d8e4..0f52bbd475 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -373,6 +373,7 @@ config BR2_PACKAGE_BOOST_SYSTEM
 config BR2_PACKAGE_BOOST_TEST
 	bool "boost-test"
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_BOOST_EXCEPTION
 	help
 	  Support for simple program testing, full unit testing, and for
 	  program execution monitoring.
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
