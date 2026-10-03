Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE94CCA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:56:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87F82816D3;
	Sat,  3 Oct 2026 15:56:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l8BJDnWN_mFo; Sat,  3 Oct 2026 15:56:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A654A815DE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042976;
	b=AB4ACK5uBJlU37UnWFKEYR8hz6Vcy2f+mDVZXjiZJW64cH9B6oIPOTmNbtFmPnLGXKPb
	 s6LdEJhyD7XiqVPZSFEXcwSeX3fz9VZ6LecWC6kTWpKkmZxqi1muwpUWCzauZhkv8jMIZ
	 hnaCpOK/uhP5ueE7RphqfpVlFRK9MN81WcliXxYj1l2s5fEUDRDxTcXbRlrsuqypYd3Lv
	 NpFxnQodpltNU96GHn2GevNUNuBaVevO+fUWjZWNLeu9QoI67zk6ZQX1CynEycAHY9zAx
	 j6ddflabxVeRILDEFsLLvkd6E3fUPMguCIvR/k2AOJ1KVA7am//283/X71gxRdDRKZQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042976;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=T0eOjh8SMhnEX27FJ7NV1LI5AdJvd6rVHYbgEU1br+M=;
	b=YY8pkHZMnvkL+8x8rGr4j8h4l3xTInYFFnPEO4hOEDH3Wm5+6EPsNt8QA75IMvc9IMql
	 sPJXuYHk85jL6hOuXIHTup70C6t4/yJsccpDqOvBVxZXXkrDarqEASHPVOm0N3SuawDfP
	 6lPLsoB3tclWEtbzwNVYd0kcf0w3f+vF1ursY1n8pxzk4yBDTlINSEK6jClwStQR57rfF
	 pQjzax57AapTMNfDKYzd61UDyaisVZizKkKFnIk17itwD+maJZNMJm2+wZ3H+1om+rrls
	 VT0EPfjHdxY9RQl6uifFus29EaylqWjzj5BIZvcH+5gZVD3Yjr7joPEPmiD5rX+anZA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042976;
	bh=T0eOjh8SMhnEX27FJ7NV1LI5AdJvd6rVHYbgEU1br+M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ohMCyYQOP2tCIzqWRD8vV0vXmJTa9G0qdL+m5haicanpD8/OCxvrTuy1jFE6zy+/n
	 5jy/Bk77Nbf3MFPDOaxrUNzeHNo6S0T3Pq5HrcXy/TLrn11apT9eXsPnyeK6EwDe/0
	 jJ+NATVR/8Yd9sF15P2+3EDq9lo8Qn1HqPZVtgvp6lVk5FoAf/j3NbN4wr9cNs9OTe
	 +31ibTU3fV9TdYp26XlK+lvFp8195aENdATS89BSs3HMP4QIeKxkCkYCtCxG5Lg81W
	 9VozfAfkrbKxO42191fT+rcfUrtl0O42bOxVXtFmdRePqH3cyqppYsoX08oet4Y7yw
	 la1Fo7yUyBQXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A654A815DE;
	Sat,  3 Oct 2026 15:56:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 76CDF1D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 689DF40024
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y6QqSTtQOlGw for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org A6D7A40049
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042848;
 b=rCCvQxNQR2bpyD+ph8ByS4wgwKNUHkDEMt+a+bCCaFl1pIagJk2vGI0YIPha/3HQRonR
 2iGSCVlCoZ/ISzPS0zuMZV2lBmV9Rm24PYlMPYjMt8y/WPtM6fEF1wzvJtj4DJX6pcbV3
 CJ11mczZPGhfdVKq6Vx25Oyk3YZVRq95U53CsVGT8rppJLO54+2bSmH8UyxOd/E+vtGV/
 /mm3Pu3je50KEUuXVpp7u5MRmNces9yp7CAJA7T4XlTBM+YyP8kjU1LNnIfh1k5huAFb7
 yexEKzOnOx5rMapYJFM7+BE5UtuTUA+4ovPMAc4B0OUk+q+9FXc8SVWKReOa7dw4yxg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042848;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ZUFeNh7gY81apkX5/CtESvX3lVLmZwNkcFXW/xovfV4=;
 b=cFBGKYbH7XR8hpNjL7cn5NfxijarvUIQ4iI7VNoEdygpDXmhiKG9uovtS1YrR22+4kdn
 JWiQJKd0GfrV99f97C8dkTUK4FQWxqI6Pz6Y/DDQpSWcYxLep6mJjDDVZouJMqnrygOp6
 4kRJEzlHlyGmyaFh5sPuoP04QsPJp/ncgnfMybAOz7sZ3MCdkl9ypHLf3Ws/7jU7NNOXs
 28tLZmKGM/ktw/r/sEbbFiuI7lH9qh50e5T0tXlJKn5bcN63lKo+O0z+IjQksze7rkvJV
 dWPTGNzBVcgyjAbWtvgMOKuSCbfj+LArp/UCsBPjG2M5FtH0wkO5+e+7cYe1e/EIW7w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A6D7A40049
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E82438A5EA; Sat,  3 Oct 2026 15:52:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:44:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3f40980e3897869d1089fa73f15c323e6c596345
X-Git-Newrev: d53be7278bf4b35f67be1bcab9f08fb1ab284169
X-Patchwork-Hint: ignore
Message-Id: <20261003155253.E82438A5EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-mutagen: bump version to
 1.48.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d53be7278bf4b35f67be1bcab9f08fb1ab284169
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-mutagen/python-mutagen.hash | 4 ++--
 package/python-mutagen/python-mutagen.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-mutagen/python-mutagen.hash b/package/python-mutagen/python-mutagen.hash
index b2d846e7b1..241c84d6b9 100644
--- a/package/python-mutagen/python-mutagen.hash
+++ b/package/python-mutagen/python-mutagen.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mutagen/json
-md5  aa2d0d73e71c5daa1a730f7b94272357  mutagen-1.47.0.tar.gz
-sha256  719fadef0a978c31b4cf3c956261b3c58b6948b32023078a2117b1de09f0fc99  mutagen-1.47.0.tar.gz
+md5  90d74b6da76fdf31933766e0e0d83cc5  mutagen-1.48.1.tar.gz
+sha256  8f95637ab9f6f305cec6bd1294e197debe207998e3e068596563c74f86b0a173  mutagen-1.48.1.tar.gz
 # Locally computed sha256 checksums
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/python-mutagen/python-mutagen.mk b/package/python-mutagen/python-mutagen.mk
index d42ed27e49..e8d04e8eb5 100644
--- a/package/python-mutagen/python-mutagen.mk
+++ b/package/python-mutagen/python-mutagen.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MUTAGEN_VERSION = 1.47.0
+PYTHON_MUTAGEN_VERSION = 1.48.1
 PYTHON_MUTAGEN_SOURCE = mutagen-$(PYTHON_MUTAGEN_VERSION).tar.gz
-PYTHON_MUTAGEN_SITE = https://files.pythonhosted.org/packages/81/e6/64bc71b74eef4b68e61eb921dcf72dabd9e4ec4af1e11891bbd312ccbb77
+PYTHON_MUTAGEN_SITE = https://files.pythonhosted.org/packages/df/70/1675da133ea92227da41bf5b24e1c66be597ff736a1533ade41da986852f
 PYTHON_MUTAGEN_LICENSE = GPL-2.0
 PYTHON_MUTAGEN_LICENSE_FILES = COPYING
 PYTHON_MUTAGEN_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
