Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0485E606A332
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 17:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=h9rGefeL;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PUsIBQlm
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE86260756;
	Mon, 19 Oct 2026 17:19:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EXmLLr05APLy; Mon, 19 Oct 2026 17:19:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CFC4660741
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792430353;
	b=YFjwezGKy/Lftc5b65gh5ZhveK4/dBkyY5hbCQSl8gsbod2nv7KI8ch1oyaNOKutF9nm
	 8UDMHOh3QxW+5hw+SNEswC5AC+Qx1gHFdzwDYnxoecEUf6sM5olXoaw3rswNVaRAY1y+j
	 Kz26i1xjAoK3FkW0nEPQmpj2tL36JYYh+WpTZPyaWtaLjrNPNDjwuryU+QqwhxPOVY7kr
	 saX3lXszMDzLpNSjz0thej35ki6NJwUvDk6xMUK/pH0YbLC5O7A0SIGf/H2NnZEvUyG7T
	 yQRIWtgSnNUs5LeI5PYh4rFaV2/lQ8Gg3NNzBkoDMLJrnbT1oQrr2uXgDFghfwKPujw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792430353;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=akU1enX+gceiYbSfR8ET+jYvzbd/k5IgcS8J/VducAU=;
	b=kBgNPEWOknm/WGYujsIs+YyuDa99S/h2rUwN+mcPrGhQx7pRNoz5ox3LmlzujB2u7x5c
	 Mcdy3DCp7SMPILSL6XgpCofh1N4M8WIEvlJhorM6sVoafzGMtY574R4WKdAt8vfk1imV2
	 Vw7/7QsHJ5EE7c2Wz3C5YW+yOXyHBBUmXfJw24YqSrA66t0BM+a6ImwPeiAaqVK7bTsOr
	 sHowRkF6F5LZIOzzY+6iyJXpQ6WDWsfIEpiSduhLN4yJM2DbLA09J55IwC2DnUBcIygWi
	 qDk8z4Mrcbh4rU+M6NE5HAG26euPRAQDm3t1Lx2gi1czFBAvOeY9DlJJE2T5syvnDoA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792430352;
	bh=akU1enX+gceiYbSfR8ET+jYvzbd/k5IgcS8J/VducAU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=h9rGefeLVfw80r0uM8XnUOmUbvT0RPYJmriIXSvkUunyFmXAIpXB6zgFkUn24Qj6a
	 OF8glsRN9OyMmaHoKc+T+VZR8S+fopM6Tp8LC2jFj+nd3iiXSalnj07kJoy1gkm2X+
	 4dpoGg00ZmAdJyxhre0eJ+BdB1PVS0GoLez33mU45KIOWlIbEX9/7bKwMQyypBC945
	 56bWtPkW01EZQ9AD22mucJD+llyciYYHFn3K+4uSeqW2lWEbI7WGGuuHq8zyaD8/gp
	 jyvpB77vJ4zg1tc9TMUCMIZxnzCM1WiZ6yV5+q4ksMNoEEL+kfmQfX67Olj9pst+Wo
	 GvwwACG9O+pPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFC4660741;
	Mon, 19 Oct 2026 17:19:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CAEB31E9
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:19:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1AEF80D89
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:19:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sW7Z9IOiVa8T for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 17:19:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CBFC980CA4
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::22d"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792430351;
 b=e5nK/5JvF6+5Y3QA3Xq/Y/x0/hFp9qfecitOJL3r80LL6YGeBByKIKSTEA8w7DLbSsOA
 zLmOzFswgdhkPW3MTvolU/SER+HvjT5rI/I2CJKLoIZo+6lWJd3AKzXMRzHv3gBl5GQBN
 p8M9VoaMbxwicrT4w4ARUpH2RfL9Slht7WwMI0G0CEJnKklbAjEeIBV1wiVh4BpfB6fNt
 hG5b8Vw8vdWIEE3qM3kNEE4hXg826bEh0notL7pogfhDZmjwC/jPxkmgAzBBbsVdz2Dak
 YBeQ6vFUMiRC6TiyQAvIG/5zZ/gWEhIyjJH4F6AzazHr733YQqSCKm9GeTTFEcuIztQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792430351;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=OWTC6xaixu7gZcCWCA31h1RTpFTRi1MnXSJ+OiyooCA=;
 b=FnwmJShWZmQN0mdbxs2Nej9fPe+LmfNCY9/3rx4EmABi7bgm5CMkClTTTSVTvycL98Pm
 swHSzKbtQJET73wvW8+stbPVVcfFsQUCFvX2QAW1Ls6jTb2aLUUPghiP+Iyg/Ge3aSH7P
 WRamxjMktNKiXJtj/xG9X8xOzYeBd7D6B8251zyDmIBbqy9LfCt9xC8eAjzD41xQUWK9n
 /+emIuE9DroMxToJmcU3rILa9XbwII1/cDlyORlw4yQUnQznNCpCyQvurvnUM9pRMyzOB
 rrno5Pfjpst4TX37Mcvq4G3v27AAx5lpLnqJA6ByLaJXCOqgOy/wzMWweE1L1qh7pKA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=PUsIBQlm; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::22d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22d; helo=mail-oi1-x22d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=PUsIBQlm
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CBFC980CA4
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:19:10 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-4ed6d69bdfaso1262755b6e.3
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 10:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792430349; x=1793035149; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=OWTC6xaixu7gZcCWCA31h1RTpFTRi1MnXSJ+OiyooCA=;
 b=PUsIBQlm6KILT38N+UhuKvgJDHEacOAfySyr7/pIfE6uG+xoOfqNlxeK1LwtJhaBVD
 9AqyTikOsZdcDRdfEwon2T5EtHBV/q02f/JmVcFDFwY8Sn8EZBCt3JNZpvvRVw2MijuH
 mJY9apOXQnSW3HL4+ZNAAYi21o6aD1EmqknfaUovqTjq1qT1xZ+WJitxKzM3BkTCLxw3
 p0pCPaS7Mx8qSFpW1uHpikiGTxACzWKQyben7WCo84y0OeVB75TVu80YlRzDg1Ve8FJJ
 p76RoD6t+nbML4Za0lGnCmXDSxwypR/YijV40sAOy8xQkxk9idzac+btqLPfWvo7sonW
 TM/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792430349; x=1793035149;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=OWTC6xaixu7gZcCWCA31h1RTpFTRi1MnXSJ+OiyooCA=;
 b=15qh7B0ygjiRXWTdcCOnIVBhiQFKhy7QgQAMPiHx48yvT6hj44QOcDtpQ7JleZc/XO
 RW+4f0o0TRFzSEnuOROFnlEc2o6FOw8rutAFaYufCGTixx0yjLAvImBZPlKnnfq2orUW
 VtCDRznhAvZd5eNhAWUlo86pzJyOfb+EDBbVrW8d4A7npXfdnqxRXJWjZag/ooZUYXtv
 6vnc0Wa4lO6GFNAnfzfndIgiZiHT/7hZNwbmVj2YpuZQvAyH75yXDjb9l4w7qP2TPoph
 YSeOhZaHfO4UzZ8jPt8LKRsEVaGBHSavrVCAKz0bqjFXxolPl+Hkh70oTlCsutEhtfnR
 PNGQ==
X-Gm-Message-State: AFq9FYK6AaYGhe4fLi3EEeyqvlwh21tzHgQAyq7kA2szdWUqS/loTdL4
 5GjywmfRr2Fk7GywkkUoBp823VtJNh8EM6kErQNyW/0p3Z+MZcOtOOlKXo9fXg==
X-Gm-Gg: AYBFou3oaSfn1EyN4wdvBnortT3Yr6iMBYRbwMHbu9Bd3tYDM6Imd2Est1TckTquw0A
 VqgRjwUkX0vLjrRMleb+i4SwsIcd8ggLCxjTGBQyKt7QqmJiTHZgSQXxTPovQOFPGZfR4va3bYx
 IW2bAusLYb/NuBhCnikRNF8l6LW8rGGBbeYtRUGxEsYaRCOf+xuTcMmcP6RPYCzOCmj8y7Kdx/n
 oCeWTowBt2UQmbzWAufety130kAaIC/54qXYo1sRoNgQfQVG7StP4wZuUXNTdS3+daMOnTy9EIW
 eB7jMU0SYQIcY7TczCiSDDlua8nRtw9jhLlponW4TTdyDuAZIqilAlAtz8AS7adWXyllQcjj+W4
 Oh+TIYLB+tW8Hnso1n9/D7kgOtvnFrkLieNOSuYFOjZwM3ATmDKM1JXrB6DMPf6t6/mtBW+qAHg
 6GywICCS6YNzbus+sn4/1ZgGDBc0hVdoPkym04Stv5DHHIxroP4nx0oMHhaGw+SyZ5pV0Mi+f+b
 bnowyIbP6xGLELNdlxR7ttTa7Xup511nUnE/eCS4hdNAZzKzobfAqYZDUKf+cvijzHGB3GtmgP2
 7NdF/Sy1NtmIaRWOyH5pR5Yjbp26tXG8/E3i6VeJQgWrMiVOB6TuRe6Dx854d+aD8ziPxXcty1h
 Z7vQZE3HlOregbISlWx2TBUIr3x+87q/fmI6giwQKJGud9QnPUpMn
X-Received: by 2002:a05:6808:300f:b0:4fb:90ae:2b0c with SMTP id
 5614622812f47-53cda0505b3mr7109183b6e.68.1792430349296; 
 Mon, 19 Oct 2026 10:19:09 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-5397b4ac6c6sm7335142b6e.14.2026.10.19.10.19.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 10:19:08 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 11:18:47 -0600
Message-ID: <20261019171854.734871-7-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-platformdirs: bump to version
 4.13.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-platformdirs/python-platformdirs.hash | 4 ++--
 package/python-platformdirs/python-platformdirs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-platformdirs/python-platformdirs.hash b/package/python-platformdirs/python-platformdirs.hash
index 4948b75cd2..641b1e62f9 100644
--- a/package/python-platformdirs/python-platformdirs.hash
+++ b/package/python-platformdirs/python-platformdirs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/platformdirs/json
-md5  528f5df1ebe17cd5fc2ba3ff1d11fb97  platformdirs-4.13.4.tar.gz
-sha256  dd96496961684a7f42041923f842ec7494e09f5e87aded99117e1109cd40570e  platformdirs-4.13.4.tar.gz
+md5  9df73f0389c5b7093ea0c73af181eb95  platformdirs-4.13.5.tar.gz
+sha256  05831adf87d392760f4b5c3a0a95579ab5a10b18b9b9bd43680dcb47544788a0  platformdirs-4.13.5.tar.gz
 # Locally computed sha256 checksums
 sha256  29e0fd62e929850e86eb28c3fdccf0cefdf4fa94879011cffb3d0d4bed6d4db6  LICENSE
diff --git a/package/python-platformdirs/python-platformdirs.mk b/package/python-platformdirs/python-platformdirs.mk
index 2e543d68f7..55aae1e1af 100644
--- a/package/python-platformdirs/python-platformdirs.mk
+++ b/package/python-platformdirs/python-platformdirs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PLATFORMDIRS_VERSION = 4.13.4
+PYTHON_PLATFORMDIRS_VERSION = 4.13.5
 PYTHON_PLATFORMDIRS_SOURCE = platformdirs-$(PYTHON_PLATFORMDIRS_VERSION).tar.gz
-PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/b7/89/dfd269de936e76319cf27787d9eaaca513491f635d49b0fbe7cdb6d3bf6f
+PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/58/e6/d0abbb256b44e6a05748c6942511ff67db8dbb068de0c35b24bf1b395b09
 PYTHON_PLATFORMDIRS_SETUP_TYPE = hatch
 PYTHON_PLATFORMDIRS_LICENSE = MIT
 PYTHON_PLATFORMDIRS_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
