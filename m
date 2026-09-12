Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 231E8C88E56
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 19:31:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A59B240699;
	Sat, 12 Sep 2026 19:31:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bv0X9fGTOEbo; Sat, 12 Sep 2026 19:31:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B89AA40677
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789241489;
	b=mR2zZKLccNKNRz7JimFjIYG+Ieb8T+efeyqpi96SOLcnrF8vAIuyklsVBt7aHIluo7ji
	 BRsRtY4HvUgCaZII2PaTaMj6jJf7AV7R2ZR/xkRqPm82413+QigeBE9hOP3+Hjlt7Ru8+
	 SvsTowtuSXq40QAawR6RNvwgYJ/PWgwNNRa0YaEB+7knXcKn6qGGQnBJ3YkVu1PtMskRY
	 pvZitMEvRRgNKCt2k7BYXJJUFqvli16rgbglHBUcdJSrlQf4GdEKWb/stp/Atmjw45rkH
	 XptgRLWRCW7Ap1xOmNUoKTC6SMSLaYmoTQTwCmftfKRH7OuNFwpGmB6ggkluiYK6OIA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789241489;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=Tz+apw3gRteGQH3T+YyqEQAfjXP0tIz6O6G9SIDwiJw=;
	b=Np27Fv1c9pqTCm+iLIpRMbUiu8zVqf66WBVu1R/kA0N7RoBVZyI4dWmiHpDUngPxXIYb
	 8yx+f6bWVBGUkWDGG4jzr5N06nxDMrogGW1Lj8ctfQIEEUdTtWc7LxdROEVtBNAyatwPM
	 z0maVb9c57V331gCMEI+TWWnriRZ7CW6fLLQaL3lXgkejIorXlzoFQIHnGrYxQ35As8Fb
	 62zxu//xr3zYxBkEJLq4wbjnkt/E35UiErtx9xCk8np1OC2NwLLA/p4ehL8KwFMaFnxE3
	 1C71X9FX2gbFIA9K9kMXpjeQ/s71d73j6fO0YIRXAFhx2fqqgq0jLC7DfU6kxQyKytg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789241489;
	bh=Tz+apw3gRteGQH3T+YyqEQAfjXP0tIz6O6G9SIDwiJw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cofDiBYa/WFUKzsZGL3JeG7uGU9LbUEiXraPYipsuQL5eY4sx5cIBbjQqCMlZMYwo
	 0xLSmeh0w9vn0nN/pL+ersSyHK3IRKsnGSQ0xsHBE5g3Qo4tJxwsSgTM4abKmBBB9m
	 2LpLIyG+8oILRiBGh2t/mU9yQ1RhvDUpWbMoVWq0y8P5U709eD8hEkYbCkNGcZgPSb
	 UeDUdAh5WrPPVW/s+rLHYGvxau0QkaGv/C9oLzyak7vIH86jiZKzfGPph2sotMbNk7
	 YAXWxn90BZb9RppZdDZJue+sIiNN5Ho5oWtPUuA2HH/kftFN2eq+BYFoJeJXgLyao7
	 3G5gFvzUr8MtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B89AA40677;
	Sat, 12 Sep 2026 19:31:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A2702D0
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 19:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 616E780E76
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 19:31:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zISkk8hjrQSV for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 19:31:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 05CBD80E56
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789241487;
 b=PyK+thzb4jx1cP7pPVIdSlqhzoWCbqzmfewb5DWhFbzaTbqpKBUShb7M+sW3wjm1kbRk
 Oy6q2qJ6kcz7mwr5mUrTDxCIlTwAr2zo2ROVfO3KV9a7gEgF34Uf6PLhD3EGuC7rvDCxa
 /7ZRBZ63RN12E19tMryu5xK6DnqzW4p2i1UqY9A4km4/NH3ym7kxj6Z/eAzFlNQShP6aU
 KHzNQo0iaYHZoP/Un3UmkYwRV1lgSWwy/2qkHaihORfrBxLIp91MgUFjOWQhwcoJiRAh4
 Y3QVYjp076JMyWCe0JvrM1HNrIhe3B0PgTG9p23E2Wfz4hEAg0DYscejTvUr0cLQdlw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789241487;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=K9iaTdi+haCe3coUTzUFtJJafu1wnAVtNzJHZMFzGz4=;
 b=LPx8+PLoiiGxC8KwVOKLKQsv1IrvXA6Wijsk1d8KVyAJBl/uxZBQ/lOqE6HRnd6F1G7D
 6kjSCGNuDOfekglWY9YC0Xzywxcb6w2u8tYOF2rVzdXp3ejrb/7Vc5gt6IzcWDYNNNRBU
 3827ffniSy9gHotw7cO+5VRWcuyTbvsJx7i9T2iP9ILxiTwzaasxqxmoym5Qcb+mFkven
 OPz622tB7cC1C5tyYckeUqX6i3An/CoIrD3NfKMtCSlHKtONKcDlYHaWELL8wtappKFIQ
 MipbPCvaQdYiee5YCjxvVAmHWNYXprF0qfMwsjeTJ6nawe4FwBmEMGCj+av2UJWMQSg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=cjOzK1ZQ; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=cjOzK1ZQ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 05CBD80E56
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 19:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789241482;
 bh=K9iaTdi+haCe3coUTzUFtJJafu1wnAVtNzJHZMFzGz4=;
 h=From:To:Cc:Subject:Date:From;
 b=cjOzK1ZQEpfgKw+hkdtpbY9kys0xTCiBXmXJBfrNdOClWUTVch+nkjunHlx7BdJeW
 IkmoawF6ZdS/hq7nM90invPcz5BAgsoJ4KQqFKtJ+zEjOQ+HhTwhYYlJ0MI61O45nz
 J7wrgTOqkmKxfh5aJdSe9Z63SVko+8qSS8BEKIdRoHZgJ4GwG5QyRbcSWvdaSfZ2Qc
 9Pw8KzRcn+e3zOCWNqStwNrTcIzIOgO3LdeWVPmBJxgVD6m1TJUdQGmqeYzz1r2Ess
 fMR8wfXhnnlLnmFBqbrWxSAy/O2J3f06dYn+KvrHtYpQpQTQhe4W55ie+w4wgpyuNZ
 qFiL0edsmaopA==
Received: from fli4l.lan.fli4l (p5b3a0da7.dip0.t-ipconnect.de [91.58.13.167])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 06436A4C3B42;
 Sat, 12 Sep 2026 21:31:22 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60602)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x5TRZ-000000000U2-2Mpn;
 Sat, 12 Sep 2026 19:31:21 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 Sep 2026 21:31:21 +0200
Message-ID: <20260912193121.1645531-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/monit: bump version to 6.0.0
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

https://mmonit.com/monit/changes/
https://bitbucket.org/tildeslash/monit/commits/tag/release-6-0-0

Rebased patch 0002.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/28f55493f4bb58f8ee54a57ccfc74b3cca3bd640

 .../0002-configure.ac-fixes-missing-config-macro-dir.patch    | 4 ++--
 package/monit/monit.hash                                      | 4 ++--
 package/monit/monit.mk                                        | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/monit/0002-configure.ac-fixes-missing-config-macro-dir.patch b/package/monit/0002-configure.ac-fixes-missing-config-macro-dir.patch
index 6fa370dbea..67d907a096 100644
--- a/package/monit/0002-configure.ac-fixes-missing-config-macro-dir.patch
+++ b/package/monit/0002-configure.ac-fixes-missing-config-macro-dir.patch
@@ -10,7 +10,7 @@ Upstream: N/A (specific to buildroot)
 Signed-off-by: Jens Maus <mail@jens-maus.de>
 [Dario: make the patch to be applied with fuzz factor 0]
 Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-[Bernd: rebased against 5.34.2]
+[Bernd: rebased against 6.0.0]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 [Daniel: rebased against 5.35.2]
 Signed-off-by: Daniel Crowe <daniel.crowe@maxmine.com.au>
@@ -25,7 +25,7 @@ index 3a6cf4e6..477cdbaa 100644
 +++ b/configure.ac
 @@ -8,7 +8,7 @@ AC_PREREQ([2.53])
  # Example: 5.0_beta2
- AC_INIT([monit], [5.35.2], [monit-general@nongnu.org])
+ AC_INIT([monit], [6.0.0], [monit-general@nongnu.org])
  AC_CONFIG_AUX_DIR(config)
 -AC_CONFIG_MACRO_DIR([m4])
 +AC_CONFIG_MACRO_DIRS([m4 config])
diff --git a/package/monit/monit.hash b/package/monit/monit.hash
index 0f54aa08dd..9b053d56e7 100644
--- a/package/monit/monit.hash
+++ b/package/monit/monit.hash
@@ -1,4 +1,4 @@
-# From https://mmonit.com/monit/dist/monit-5.35.2.tar.gz.sha256
-sha256  4dfef54329e63d9772a9e1c36ac99bc41173b79963dc0d8235f2c32f4b9e078f  monit-5.35.2.tar.gz
+# From https://mmonit.com/monit/dist/monit-6.0.0.tar.gz.sha256
+sha256  ddacd2a8120aeb2351e4486ee04a17782b5004aee99f2041d829bc4dcf2a5b3b  monit-6.0.0.tar.gz
 # Locally computed
 sha256  772cd55fbcb4e52a99f9440cb483cd348db05b7d0712c28023e36d9d5caf0b0f  COPYING
diff --git a/package/monit/monit.mk b/package/monit/monit.mk
index bb38d8245b..11da2809b8 100644
--- a/package/monit/monit.mk
+++ b/package/monit/monit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONIT_VERSION = 5.35.2
+MONIT_VERSION = 6.0.0
 MONIT_SITE = https://mmonit.com/monit/dist
 MONIT_LICENSE = AGPL-3.0 with OpenSSL exception
 MONIT_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
