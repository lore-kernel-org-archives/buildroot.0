Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E3F6CA5FED
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:54:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEB1B8144C;
	Sat,  3 Oct 2026 15:54:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p8IqMuZnIfg7; Sat,  3 Oct 2026 15:54:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D26F4813B6
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042870;
	b=NTkxenj9Thoy+hAEIIycywxLPM0oDNrMbbfGJWLptvxhNQgCwa0i3CrMF0Ch6Jwl4BqP
	 WllbQDzTNkYKgahIOGuITZ1r/146csKB2lDGJwv/0i0RmdxWpYQVcgx2GG2s9w8tW/lDu
	 xSL4gbrVzUa/F3ZiO8djVe+gDfidtKuFiE1tiAYIrVTAf+IKEzwEwaImlJcghff093AKX
	 2sRvzkajVPHLhzW1AqvG56xiHoYuUnn+kW1BibX2gYK3mMzLwtbvZcNOnLEXPDZMdgMmu
	 ocoWVzmoeg+wh9dU/XrWU4Jbhsr6/8z/wywDClyxgrK/DGQwrtv/YN2UAO1xdOyE4+g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042870;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=GtqN4AoAGOQExQf1aKTClGT4jDc8DOE51aK5OFn+O3k=;
	b=PHM1VMmsdXDujfxPech+gIKEcNaVySjMTAcT2O2z8gsYogkkiCt/jCXiT8HFiDSpSoxh
	 5BArTfBZQmNpu92+u5NLD49y2KVZkM0vxwxQGfpSu/WHg6/khvFxnm3Y7r5AypojhwGSa
	 crH7UAFiFLIqkcQgUgV89dbufInaOG6kt49veBrY9qAnq8lTUkBlQ/D/l/RYY8eaatDPK
	 Dh6LrUIhJwEJ013B3t5s4VLrVfOqiVKSGNcnKnzFP5PTRIGEu0V92nh57UnrgQeupgAyQ
	 qlGhAJlzWqYTrKhxq8UhUibkchQdV0QVnaENt+0HUh8+Dyl5PhV6RTzAykCzAo5y7fg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042869;
	bh=GtqN4AoAGOQExQf1aKTClGT4jDc8DOE51aK5OFn+O3k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EOoy6UklmTrI7ILpj+UN0IQC/Iria15SPJ1qQkoQpyBwiuN+OUeyEbGTOTefd4yIJ
	 v6621S5UPo29QU/427xXyw8YTtleLr3Y9hA7G1U+QxHorC3+tD+F67FB5qLpLYw4pC
	 9gszwLxr7MPmxI10S8NwYo2mrPX+fotcgDK2EuzYZKTg190BARruTLT7zrUxfwsB8a
	 MGpALbpgBAXVdkuRNePbThBacB2r4B8wNy9ZVWQSc+ivkVclfwxLSzW85U7LP3EX2U
	 0kok60SgnRmrbiPCvxi68fHlHvHh2+kI2Yv3EL/GtwsrxV7DkW3VY0WyoG+3THBYX/
	 hDo5c2FtOFooQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D26F4813B6;
	Sat,  3 Oct 2026 15:54:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 138AA335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D9F160652
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tQftMoNcOtNi for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D5BC96066E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042843;
 b=DSgyqemHdpeHVXStVKV2e6CqLTqId2GzxHwtlwe1ZDe5k/WZAnU2Hh4hw5HZPcT5sCF9
 MxioRCyA+WlPZ9Xq9UI4Y6BWmFdmTeDSyQeuN9hPcoHSErin+C0WlDEXRmSlMqGi7g1sY
 8y+DaBy2MoeIk86KgmBoZKdF9uBA8iNdbivgO+sv1cC02wnv7D/rvUIQLU5nA0wJRIAI6
 gLwtC7jHHBumP5xwJ2STVLFtnObf6IVqPjihKYMrD8c522fkYX3LK1ncrtSWRGt6SMXp6
 /w2uhZLcybMTwNqdn+tyH8ZdKrAQd9OjNLMnWd25lX2IvSvui8j3kqjkOE/V2OyP2XQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042843;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=c9MdLlxcna+HG5D+h7pWaYK5RY7ihdUEL51tu0oHLH8=;
 b=KCUVF0Hy4VH8zOTdQDvuCgeupiUcdTEOwqDtka5wPuPrd10/bAKTgzQNs1ewZPpbkIRl
 rXHtdizrEVjA80Kqq+4wqXlpgp1Zda3UBeR21+N9h9UDAs/N0w/R22JaNN1pRnojlKGkE
 0iDPCtwoa7LwF24cL3T5VQ/3mtFtt1rzk80J8sDRgQ2VXZHphGhVxSdtKlF1/op7i00kB
 lkMXKV4lEsx4Dm4tY544kjywD51C55zirtuRCr0FHDP3Ox9V5FG6c1A1qBS2cZXhJEMm7
 Xklc21h79x0TdOOc4Qq8LzfVw3Mq7n4+Eg4m6XZ/2OLfGGFbae7BYeUK/Bv4WItG9Jg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5BC96066E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 225148A309; Sat,  3 Oct 2026 15:52:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:43:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c2187012ee625e560451f48f40e8912d32805e78
X-Git-Newrev: 8ab3086a839cead70f0c5bf5097ba15107395cec
X-Patchwork-Hint: ignore
Message-Id: <20261003155249.225148A309@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-proto-plus: bump version to
 1.28.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8ab3086a839cead70f0c5bf5097ba15107395cec
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-proto-plus/python-proto-plus.hash | 4 ++--
 package/python-proto-plus/python-proto-plus.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-proto-plus/python-proto-plus.hash b/package/python-proto-plus/python-proto-plus.hash
index 49e3a7025b..0f43e2e266 100644
--- a/package/python-proto-plus/python-proto-plus.hash
+++ b/package/python-proto-plus/python-proto-plus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/proto-plus/json
-md5  75ae41f8ad85af89da4c83b840087ec3  proto_plus-1.27.2.tar.gz
-sha256  b2adde53adadf75737c44d3dcb0104fde65250dfc83ad59168b4aa3e574b6a24  proto_plus-1.27.2.tar.gz
+md5  53f43e79ef6085de9931338147283228  proto_plus-1.28.4.tar.gz
+sha256  5ff7ecad828e032a491fcb86947801768e32237f99dd049b649965b892ae9a63  proto_plus-1.28.4.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-proto-plus/python-proto-plus.mk b/package/python-proto-plus/python-proto-plus.mk
index 3ae0e2e908..6999d0a2b1 100644
--- a/package/python-proto-plus/python-proto-plus.mk
+++ b/package/python-proto-plus/python-proto-plus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PROTO_PLUS_VERSION = 1.27.2
+PYTHON_PROTO_PLUS_VERSION = 1.28.4
 PYTHON_PROTO_PLUS_SOURCE = proto_plus-$(PYTHON_PROTO_PLUS_VERSION).tar.gz
-PYTHON_PROTO_PLUS_SITE = https://files.pythonhosted.org/packages/81/0d/94dfe80193e79d55258345901acd2917523d56e8381bc4dee7fd38e3868a
+PYTHON_PROTO_PLUS_SITE = https://files.pythonhosted.org/packages/40/a6/4fbadcc2044034449b3f8f0ce82dcf3005d53f37c136642103fd4836a31c
 PYTHON_PROTO_PLUS_SETUP_TYPE = setuptools
 PYTHON_PROTO_PLUS_LICENSE = Apache-2.0
 PYTHON_PROTO_PLUS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
