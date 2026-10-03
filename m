Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 616BCCA5FE6
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 10:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BAF060E8E;
	Sat,  3 Oct 2026 10:08:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OfdICTvcze7w; Sat,  3 Oct 2026 10:08:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4CFF160EB3
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791022088;
	b=n2/alQMQQib4hko4EswOUq14T6ed/h2YMyYZO5U8y4joAM9jWLC6SOmcJUzDur52TkqJ
	 Mj/1CkIOwgF44Sf7NJD73PSGSY8wACc+CQ3m1o8vsr9JiEiQ/ZwMSLHKyXRSmIHndBOBK
	 ujDKvA4yeJGEhlvRtcCFKNXtKWRHnU9G2L6RPIjyoX/kWctJr9NdcYHNIuQpu5gJilh52
	 BR+oG0/5awyeBy3hpk1+m6mYz9f7XonwjMunQZqSOe4NDcnEIXc+JGnXUv4mrJz2VfHop
	 pKX9Or2sABia/rOeXnal1gDEAEHxJxpTsWuSSbMZaloLnBYXEu8qXM4D4ByV+t3h08Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791022088;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=19dzLRsUxayklnhZoIqHKPuvo/pr7jkO3qxT1RbJ8xw=;
	b=htOmAwjhjZrYxK7/LakPUxbGaO7qNJDMIQqenVtaST3ulPgVdJQZc4P8dKasPgB1LHqS
	 JHY7XgwzcOoqEpS5QyWuSYwkNimPjX/XW5JeCIY6xoCRaH1It4PBFAF5dy+QesQCDgSxg
	 xbmHYdIrEGjDG7f2giti06pbHQsLU2pSet56V/3RuAhiBE/Qq5ba1NtCkJGbi6ju6WcZM
	 qilbNTmaemx27Do2S5NHj7aVIzNHDa67V6zGA9a9FHrJ1AKicFflD5Me/HOAGZSaz5hMa
	 LVCdpx9fXqpAGSqnAPHvrgnT4wAUA+8avhKS3lCPjpSgwc8H8KYkSFnvbEZf7yffg1A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791022088;
	bh=19dzLRsUxayklnhZoIqHKPuvo/pr7jkO3qxT1RbJ8xw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mR4aCLP85HTndmkOCso/Kua08mXJOe5mKYtBWJqvDvNbYTZkPiaEbxxRh5k38N9WA
	 pYiTsF9ZM5bRY6J+cG7fhjgutQI2hgp602zt6jIapDLclVUuO5ucK2mIJLvgCt5xrQ
	 URBqcihCOOb2JsKAV5fhWhWytjAPCrv9iO1XF1On2WM5QA5cM8Gbs5bEEySF0E1mHy
	 pvf4VQ/Zx8xwVltzECnbWapx6zPuZv2iS3Ur6hMojdMU/N9UUX1Lvt9yBwfXz3DVqn
	 5saVqBAbD86nwhUJ/MDWHLPqDuClM7tFBaPBj2ukxmI04ftq6ERAjH1Uc67WXnl3ic
	 lLgdqkIpFoBtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CFF160EB3;
	Sat,  3 Oct 2026 10:08:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F739179
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49C8F60E84
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yyvqirOHyFgf for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 10:07:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org BA62B60E96
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791022029;
 b=r5NW7Nozx9jDla76Un9AnKbTWRJdn0l76hZ2HBYbxILz6Ul47445PCa1EW0RBC2uNBEU
 AXrrJeu52Oox4SzTL51WrFisQjl3hucQZL2XfZAcmBCf0SXOwFd0FwPnHsz7ElnPddOof
 1iE9p8lbDYJk68BzDS8kmG/1dbvdLB5oILdEY+w8bnlQ8ApGfBfTiI+18ZLfWx9FoDb8Z
 D8VmAcZ+gExqOWZJl7umpFOWPQhHB5K8rwvoEr27MkHYzTvUmCAvjLZhw8qG1U24/pAOx
 ZDoFl1TnLzI59vDy3hJy75KhRN8Z7qxJ0eS4w4UhhMSO4+iPOacSGEmcTz/MMt4Zk9g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791022029;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=h7ev4LXjV/ZSw1xSOHRXLwbs6ZV9/wYrlOzV+nSUfd0=;
 b=MNXFTtDwj7hJo2Y0ysuRAPLaewbRiQOXj93Fb8zVMspK1YPLHgIOk4UFZ8fG7aQ9vunS
 1qiXvZi3YVYaF8gYOLj1WDjd0WMzH0vXNXJFzhmcR+bINyc5Auihqt+w7OeiQEFZR3F/k
 epXHZyrweuSDvWTWq/JQg4U18gXHn2QFUIHz6Tl5yFTferlMIu9nZPsuNyVANGTStgomt
 drxFTRv+yvyOpuyUL5nsN2TJnKQ+Tu/UkYUQb4Go/0Eh0iL0D88hEO0mh/msmLUNTGDVL
 3neHbLhRGnxzz+dsKEE9g9N818VomJ8/acJdcobJu+Ox8iQuqT88KIaFxap+jpmqwDw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA62B60E96
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2594088801; Sat,  3 Oct 2026 10:05:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 12:06:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 203eb431981caf6bf9fabc2593605b12564ba26b
X-Git-Newrev: bbb840e83a7d51ab1ed9f93a060ebcf193497b40
X-Patchwork-Hint: ignore
Message-Id: <20261003100555.2594088801@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-webob: bump to version
 1.8.11
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bbb840e83a7d51ab1ed9f93a060ebcf193497b40
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-webob/python-webob.hash | 4 ++--
 package/python-webob/python-webob.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-webob/python-webob.hash b/package/python-webob/python-webob.hash
index 8f9c7a1fe2..f88c07f5d1 100644
--- a/package/python-webob/python-webob.hash
+++ b/package/python-webob/python-webob.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/webob/json
-md5  4167b16880e0d4c22aadee8ec3cc6c26  webob-1.8.9.tar.gz
-sha256  ad6078e2edb6766d1334ec3dee072ac6a7f95b1e32ce10def8ff7f0f02d56589  webob-1.8.9.tar.gz
+md5  a3e12b9c6083af0e5827136a7607e292  webob-1.8.11.tar.gz
+sha256  aa8c27231070b135c025e567a9cd7eda03f4df71352ffaac740cb6a75f0f81a5  webob-1.8.11.tar.gz
 # Locally computed sha256 checksums
 sha256  27bc4919e7e9e6b6cda40644517ca74d32203e32fba89ef832aba1ed93e457b3  docs/license.txt
diff --git a/package/python-webob/python-webob.mk b/package/python-webob/python-webob.mk
index 1e58d590d1..cedd2ae270 100644
--- a/package/python-webob/python-webob.mk
+++ b/package/python-webob/python-webob.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEBOB_VERSION = 1.8.9
+PYTHON_WEBOB_VERSION = 1.8.11
 PYTHON_WEBOB_SOURCE = webob-$(PYTHON_WEBOB_VERSION).tar.gz
-PYTHON_WEBOB_SITE = https://files.pythonhosted.org/packages/85/0b/1732085540b01f65e4e7999e15864fe14cd18b12a95731a43fd6fd11b26a
+PYTHON_WEBOB_SITE = https://files.pythonhosted.org/packages/e6/92/9329872e36be90e25ba616ac6e9ee8c1be4326a1ea3fdffcdabd0eb48efb
 PYTHON_WEBOB_SETUP_TYPE = setuptools
 PYTHON_WEBOB_LICENSE = MIT
 PYTHON_WEBOB_LICENSE_FILES = docs/license.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
