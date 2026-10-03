Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F71CA5FEF
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:56:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 455E960E8A;
	Sat,  3 Oct 2026 15:56:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xjfpEZ5TCptR; Sat,  3 Oct 2026 15:56:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 62EDF60FB8
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042987;
	b=GbhS+FPBbCRSBpl5r1mweD3ogSdY4IaeVLQAl3Msn2SyMAXNODqrXOZtN++sXmL/DmxK
	 NIIlZqYbZ3gDJAAM+bm00t3zKUP4wd8lwdCcz/m/acI3crdvWGGyFeZ7kMCJyCvRTrZTK
	 OHr79ucpF8ZMF3ozYDbPoS/naOh80r/y2CVCXVeNvbNq8A2o5swkg3euRzmoSZybdAA9W
	 rVcOAzZCWVGRvhcHRSyQmtD7ZNfOh70BElkYoydaPQpIeIyhzZtf3Dz+i+OhnM2qhYAjy
	 RIeQz6YPOzXTWy+KsCBU53MMF/JF4EQA1VJWodMh9+X3upaRmLIYCXik6C+6TSbNj8g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042987;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=EI1H9aPqMnnl7sXWkpEMQyHQpD1kq3Wte2unmjkcmK8=;
	b=qqEG/YvoeL/vHs9EFEfQnQJa+L5QqExtk1RXKUuUZcmaratJ3+p9hTR7IY/ePbPDpK5t
	 rwVsqFl9Dpo+uN+suppg/MfXER4LLOeaINaeFtKsl1wr2jOBKa8u02IiK4utI5mlSTJxl
	 sl/dq2S8EKEwbyl1mwll1y/7F55sMIfMGmIcnX8lqJ1eUy7voKttK/sARH6n4h52p+hPf
	 pRqm0FWxjc0q0r3laUTm+EQ1CRdI1AIymrhOq3j/c3mNJgnb17AYS9jz8+QPa9SfTi2fp
	 ++MLRwmMdLP0OUVf6ONzyOK7Zyz4aFHxGKLB84Y6cxDVKk4DWAb+6qHBVT14PeKq7yQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042987;
	bh=EI1H9aPqMnnl7sXWkpEMQyHQpD1kq3Wte2unmjkcmK8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WQYFKV6XVqYDKwjFRV03oNmLk5XVQWT14gxm1+6dCMxbzCKWm2cRXgm50tr7EnIwp
	 yvJto0rSrFFdPPy4WEdp1RWsVKmGsFWJapMQnqf5GmYgCcP9dw+9kh5PPiJFUmKseN
	 WArS1hgCGdWtFyBRoXnH8sqGouWhVHKLUrvCJXY2zmOdLg5Vu4i2X6myLjWgp599KI
	 GKHfFPQq+mJI3MXtQWdhKXvlo7pDTdgy8EBYIPsHrH84e04SN0yl511P/pL6d3NKUt
	 Qv9H7QbaLyZkSzy2CbS8GLyBY/hNB/NmlmRt6vwEipADOIpHAGxww8pFYaR6Ra4ljN
	 atxQemTUf248g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62EDF60FB8;
	Sat,  3 Oct 2026 15:56:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EE773335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D00D96063A
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cFABXpxT9xqW for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org BF3EC6064C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042846;
 b=eYmS8BpO7L2nu6JUWUWjpmj7Hy7lkyZGovM+fJvZGGILGHlcCFGcMI24OdhGN5BgInhn
 rJYJfjfReTGu2ULHba0RhDzUGMadB487rvZACyA+ngPdvfIMvLLQugqwQhlzEkPx0/y9+
 lvnFZHBoyGss+mG8rnTEpmPxY/am8Dc/8ZWRVFJliuFqD/jq/0zLug0G4WJSSXdDtWQ1z
 c27ZQPxnI9iR+nvUMjYzerQfVlo3NXipXPhc04m1DVV+0myhrZihc2lB2hyHSADnHHW9C
 woDqSbLQ44BfzPEOXYrqSOxXx4uOnQf7iJqAZLIaiHaTNGNHRGmXrx6y66p7Fw9qUWQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042846;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=gLJyuCd74o7x7nPX4ccUOa55E3LW8uyopVbl8EjR9+Y=;
 b=B80IumBNlFftU2f72lagcTCaAhMROADEZk8uEqVuBqb4DNJRX7S+hRZw+GVadPOxN+FA
 04fuKtJ4AjxICt9c9lQz+djwFSy1X3GPMgGHkrguH3Tj47+YJbeb4QZyVDQVQiVkYRDiQ
 vKzXiGMFIiHU+kt54a2O4n4QxDPejhpaPczXod26FB3/hi0ckaxKEQdQlwqa26UBTUUKq
 lHjW1qdwBJ+COcxx+d5IAPContm+xtfbV9p3bjTJ/0jllbAosPxjI1rauaDvcnxbpN1lz
 09rUYbUUSV/lRdjTyPlMLQmoR2wYEEF70kCSG+haLg2WE0+jSeH0vHV8berrIDEra4A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF3EC6064C
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0BE3E8A31E; Sat,  3 Oct 2026 15:52:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:44:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 16bea591ff67164b79fc8e2caf49c4e8d7d10ba8
X-Git-Newrev: 4467dae356e78c724107434c57ef7798e36e816b
X-Patchwork-Hint: ignore
Message-Id: <20261003155252.0BE3E8A31E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-argcomplete: bump version
 to 3.7.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4467dae356e78c724107434c57ef7798e36e816b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-argcomplete/python-argcomplete.hash | 4 ++--
 package/python-argcomplete/python-argcomplete.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-argcomplete/python-argcomplete.hash b/package/python-argcomplete/python-argcomplete.hash
index 81e556363a..4a09383432 100644
--- a/package/python-argcomplete/python-argcomplete.hash
+++ b/package/python-argcomplete/python-argcomplete.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/argcomplete/json
-md5  0c612498a4b7b421aa870d47361e2322  argcomplete-3.6.3.tar.gz
-sha256  62e8ed4fd6a45864acc8235409461b72c9a28ee785a2011cc5eb78318786c89c  argcomplete-3.6.3.tar.gz
+md5  b6553ad23016cb210399570522f90223  argcomplete-3.7.2.tar.gz
+sha256  aad8b69a0b9969edb62db0d1752354c0d50717b10e0cbb00e2a958381b9fc6b9  argcomplete-3.7.2.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.rst
diff --git a/package/python-argcomplete/python-argcomplete.mk b/package/python-argcomplete/python-argcomplete.mk
index 520c2e5390..d93d20492e 100644
--- a/package/python-argcomplete/python-argcomplete.mk
+++ b/package/python-argcomplete/python-argcomplete.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ARGCOMPLETE_VERSION = 3.6.3
+PYTHON_ARGCOMPLETE_VERSION = 3.7.2
 PYTHON_ARGCOMPLETE_SOURCE = argcomplete-$(PYTHON_ARGCOMPLETE_VERSION).tar.gz
-PYTHON_ARGCOMPLETE_SITE = https://files.pythonhosted.org/packages/38/61/0b9ae6399dd4a58d8c1b1dc5a27d6f2808023d0b5dd3104bb99f45a33ff6
+PYTHON_ARGCOMPLETE_SITE = https://files.pythonhosted.org/packages/87/6f/5a73f04007ca950701765949209f068da628bd11f9c2da287278ce91e0ee
 PYTHON_ARGCOMPLETE_SETUP_TYPE = hatch
 PYTHON_ARGCOMPLETE_LICENSE = Apache-2.0
 PYTHON_ARGCOMPLETE_LICENSE_FILES = LICENSE.rst
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
