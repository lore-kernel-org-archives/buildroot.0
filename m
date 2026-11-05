Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2497B607159B
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=TXv6CEpI
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3F0781583;
	Fri,  6 Nov 2026 16:09:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id x5a-oeX0bhQr; Fri,  6 Nov 2026 16:09:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B469481688
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981346;
	b=HKIcTQXATWBLMirYbfp4NSDB1cN09ONOiVBCHKyuvMtTm1RLkrMwH+5bySQ64EnGr32F
	 RYR1FEjLkmdW8lfrsGW6mh6TqNFG/P27jBNwGi6kiktFhF7u09Mc1vjLaBBSjRKEycnZW
	 6Ec3T+lfqmFJUT+sxezGOBqGMy0RjUAJB9h3fX7p6mgBd8y7/C7Mk5UqWp1kFSkRkZuFC
	 e2lw89kwaF+f4uLeS/RHxpjTn+XxNtp2KylXRY9QtIkXGzvZutdTf+D1m2QvTMnpdA0RR
	 xUpYJh2hZ23asyLfksNYZWiNX5c/MpxFtEdUIclEMJ6edmN8aHPzM8Ovgx+PDQQve8w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981346;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=ZZtvm5XBIw5a52dhQ3/1WZ+4mD2KEffwEsMkeygrMRQ=;
	b=mPsI6/H6MXleYC+cCFUMQXXt6luASNQLPJJs0aXEHa1KZG37f+wd4f1Dmjs/BZKDMkpO
	 4eZFAjOMXfpdPzykSXa4EUXrzDl8/9CE0++/8znug+QnOSV71mgFGpk2v0BKMbAy6FZDl
	 bsuIU5/2DqFpF1dzuRayoLEPCmj2uLRwFLCAZ6JvqklH/Q/i4FRuuQXlb5nRxB7TIfCio
	 99n/XLSd7Qy6Oe2MD9fpR2oQvBpqROrkgS8IzoxLzd7ywMQs6pN1Il/V0NNG8dPHy46aH
	 v3aZKMrW5/9cIf+/Y65HR14fjjm4vFwL5ncK0eABk9tmoe6bKwCxfFInyzW2aH50DRg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981345;
	bh=ZZtvm5XBIw5a52dhQ3/1WZ+4mD2KEffwEsMkeygrMRQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TXv6CEpIjxPjzNYQnpRfGEDE5Yvm5lyikEnpYx2G2l0EYwPa3Bhjso2tMlukfRmPx
	 Ca6/OklLiyRn8G75jnXG0yQ5npBpEe9ZaYgccaAA4l5ocdbuDfiqj8swBUB4hgGqlu
	 87kHGWr9P+uKziSbIxVxMIXO4piTbJugkm2Ohr4aQPz//34ypVcWgEMg8gW5FmJMN/
	 XS071x/xEo/+HLzo2gJ7X0RFMBKkfm9t3uvm6TGJJrSjd/IFvxx3OXDGICHI/kdfrZ
	 tifXgVp9aDeKmUqWk5Jlajr7a8PtEzp6HKFswIOLPJbJvefbWyQ2JhnfAaRcy2z9vC
	 EQmmsdN9+eg7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B469481688;
	Fri,  6 Nov 2026 16:09:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5ED264B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 50EF081421
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SVwtxeXhM9Dk for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:08:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7D5B88144C
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D5B88144C
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B35319E09B; Fri,  6 Nov 2026 16:07:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 15:30:58 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 5063aed28c50993f49c91647327046f6eba4136d
X-Git-Newrev: 6d6d6e9e5665ff9ee0ff89ec22ef228450b8ede2
X-Patchwork-Hint: ignore
Message-Id: <20261106160702.B35319E09B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x]
 package/python-platformdirs: bump to version 4.13.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5462322977394719568=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE,TVD_SPACE_RATIO autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5462322977394719568==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6d6d6e9e5665ff9ee0ff89ec22ef228450b8ede2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 73b26ce87e19b24e73ba87e5e912faf3440bde75)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/python-platformdirs/python-platformdirs.hash | 4 ++--
 package/python-platformdirs/python-platformdirs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-platformdirs/python-platformdirs.hash b/package/python-platformdirs/python-platformdirs.hash
index 7f7590a6c8..b9051298de 100644
--- a/package/python-platformdirs/python-platformdirs.hash
+++ b/package/python-platformdirs/python-platformdirs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/platformdirs/json
-md5  7aed05d0c6d803af78de34d929e51bac  platformdirs-4.12.3.tar.gz
-sha256  427fc0bb321ae0c5b037fa03238ca74820437be162e78b4848c4d4055b9b766c  platformdirs-4.12.3.tar.gz
+md5  5872f9a2772efb2608f4444b5339f833  platformdirs-4.13.0.tar.gz
+sha256  1aa0b0d3f224c1f07c295121e312a5a24a180d6ae5a8425ea1784b3e3863e9c0  platformdirs-4.13.0.tar.gz
 # Locally computed sha256 checksums
 sha256  29e0fd62e929850e86eb28c3fdccf0cefdf4fa94879011cffb3d0d4bed6d4db6  LICENSE
diff --git a/package/python-platformdirs/python-platformdirs.mk b/package/python-platformdirs/python-platformdirs.mk
index 9610dccc64..dba59abfdd 100644
--- a/package/python-platformdirs/python-platformdirs.mk
+++ b/package/python-platformdirs/python-platformdirs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PLATFORMDIRS_VERSION = 4.12.3
+PYTHON_PLATFORMDIRS_VERSION = 4.13.0
 PYTHON_PLATFORMDIRS_SOURCE = platformdirs-$(PYTHON_PLATFORMDIRS_VERSION).tar.gz
-PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/42/23/4a86fc741c38c5b69792a4ef954b281afa69bea9f083f881de1b0d23bc07
+PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/80/a8/66d45abadff219e36e2a824181b8f6a67e7ed4572934d6252c71c29d5731
 PYTHON_PLATFORMDIRS_SETUP_TYPE = hatch
 PYTHON_PLATFORMDIRS_LICENSE = MIT
 PYTHON_PLATFORMDIRS_LICENSE_FILES = LICENSE

--===============5462322977394719568==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5462322977394719568==--
