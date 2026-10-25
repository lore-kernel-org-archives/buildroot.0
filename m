Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17357606A31D
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 18:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=XwmXEYgZ
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E50A1405A9;
	Sun, 25 Oct 2026 18:00:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xq7OoC1hqnyc; Sun, 25 Oct 2026 18:00:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 339A1405A5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792951203;
	b=KLVnHL9UA9CE1i2KkbEjAhHWescRAsG0MdDlx4q73kO1y/55IrfdkamqL8KTnJDBw/Uc
	 6B392zdGXL3V58Nc2lhhweI7PDTJyIKinzZqIwZBCiiLZgcba38/hSdxYVkYEOkxMeTQ8
	 ofDoA5Kz++IGzg7uOawyxv3KWSOcfoupUONO6vRMVBHpjEADTqo4NJy/7rFDVFtIb7GPK
	 DabCyp2S2sr3YSXIXmnvuP8PeT6S3kHCew0rJOaTqmaDmVgCjnRb5Mtjk1aNCQMwAs8mg
	 K93PBpA4z+DizC6fSPMZFAUGlKh8gvhXBJSX9yYb4nPmCqo/4d5m+AJFdwrQIAKC+CQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792951203;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=D2OZn054isH7wRUDlVq6XlthxSoQkL5jbMB/2cgESAc=;
	b=hf4vcymHAmxrKRskMwu10GebKgZljvfomZ85rnwXlLjJ2c1ic9KNPoSIkrL/LChcqfjY
	 WHDARM10uBm2jGHUcOXixmglke4fA5TONsM39bMy1EoZ0Y4nku8ODLQ5qju8PRy/6eUzX
	 v/4oQInH2VqW170SxG9bd7KVLKhB3hLzAMkp5mErQ7q6Yt0DwoglU33Gc9BgA2CEx3TKT
	 EsMRaYzChFMtcKDW2teqtM7eSoD933FLwLXerT3XH0GJ4uQgoRHHBuQJegZI943PkjcAR
	 b+f5xXDG/OXX+qT9/uJjnrj8ntL2EjX/KfLSRwgUKLcd3Qu++8VkHHZ09ZPRZt4HqWA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792951203;
	bh=D2OZn054isH7wRUDlVq6XlthxSoQkL5jbMB/2cgESAc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XwmXEYgZYoJLspdzuhfQgrcXHNFeKDsxypY16l+wi/Oq3a7xKWM+Uyjts0L22y207
	 5LJH5p2CIxxIZdKv/RLqKarapW9800TStkWrZZLcHVpSsPBSrrZB4kIdpjvtJYV7PF
	 ZUdDs9URwNHoCTk57xXiLtiy0W218M3qEX6xm+OrPRYdGuxYY1IGUCHxXpYaIR33j6
	 mG9NmR13AThiKdgaCRG0YrRcP5640P9na1YU7bvVpEsEJDgP964mOTehX2bQgj7ZZH
	 80EPgwitbPPTTpjcKJjteebfW9EtTui4XHjCpggSlFNOg9x7gmUPUJla2PAZhqeQJP
	 g2VdiJDbpenOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 339A1405A5;
	Sun, 25 Oct 2026 18:00:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 514C94D1
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 18:00:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42BF2405A6
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 18:00:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BJX1SJCs3bK0 for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 18:00:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org AF294405A5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792951201;
 b=R+44riTNWL4sO0Xr9TC7KCrFSLIRCXH+inFcUMEnIAXfM53jHkaFVrKGmrJU7Q5EGAB6
 Wo3eV2gWXjadIlJW3wI5fF+DpIssryiHAZ+/F4Rv9zINE/pS041Rsj/InMBdKlhXbg3uc
 Zp2qjdVPblNpFH0ZxUMtlOVEIxjB/Q6UMNrVTCXpqs4oPcFcxnfbWyktduFBdu/73UUYq
 vGKXz6hPzmIxrKTRJdQCEOITFHIo7XasLmhS7bWwv50548+83k8jdCOTFWfDZIaF/46lW
 Kaign4LO565CTHampr6rpjh0dTVunRJp6DNoAZEnlbr1pZuwM0e/Zm0Z6MXobB+HBMA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792951201;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=2Uw6ozLvKhHU5pncjWAvFrAhLYxI7CykHshUlVw2mFQ=;
 b=S4K6UIpO5J1+84wiMsmVohm3v9GcVYP6Gu971QhBEIKu+/WlN9IQdH0GKZDGw23ckjk0
 RTMLkpO6bPc0orK/IC3jN/gdl8yK6UgXvcG0+GR6J55j4On9qgLBcvbabVhS0C/zZGyqA
 qAMX6obyGhBgsUUumQ74nIXqYf+s3sD+Kh6Tt/3QH556twrDAmHZbn/sPYNndN4asguHQ
 cuN02aLql/0qdmHsY7DvnOvzOP9b9XqqFA3c60e6VLE2PSV1HxNAtpkwvJyW+XBNPB6XH
 b4V716wnWPAHsGy0wHRN3n0QAAwB3GTtfVIp7w1V53aTPK9Fn2JBbV5rHWWdEo/0GCA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF294405A5
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 18:00:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 205A799E98; Sun, 25 Oct 2026 17:58:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 18:58:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 805712402c095789dbcd37fcabae1435940c3427
X-Git-Newrev: 3ec2d5b49b36036dc8cd9007f3a3d05104e51e25
X-Patchwork-Hint: ignore
Message-Id: <20261025175836.205A799E98@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpd: implement
 BR2_ENABLE_RUNTIME_DEBUG
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3ec2d5b49b36036dc8cd9007f3a3d05104e51e25
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

MPD started during version 0.19 (2015) to insert runtime debug
statements into the codebase. These are enclosed in preprocessor
instructions:

  #ifndef NDEBUG
  #endif

Fix the MPD build to observe the BR2_ENABLE_RUNTIME_DEBUG option.

Signed-off-by: Andreas Ziegler <br025@umbiko.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mpd/mpd.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 4db0aee7cb..84a0f389e2 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -27,6 +27,10 @@ MPD_CONF_OPTS = \
 	-Dsidplay=disabled \
 	-Dsnapcast=false
 
+ifeq ($(BR2_ENABLE_RUNTIME_DEBUG),)
+MPD_CXXFLAGS = $(TARGET_CXXFLAGS) -DNDEBUG
+endif
+
 ifeq ($(BR2_PACKAGE_EXPAT),y)
 MPD_DEPENDENCIES += expat
 MPD_CONF_OPTS += -Dexpat=enabled
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
