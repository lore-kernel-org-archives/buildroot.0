Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81987CA5FEF
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 16:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5601260652;
	Sun,  4 Oct 2026 16:08:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9d14P2uJ7ZVY; Sun,  4 Oct 2026 16:08:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E129760664
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791130082;
	b=Gp99LXhxpdnuwVoK6dBTkzIp6WSWU1xVA/6gwGOGU62Yz1FVAyYFd/6GoNP4j9Q3A+8t
	 +rwAbB+Ju3cXzjO+xghtqlUPIjE8akXiIohu4HsjW9rgeitlYVjIrbabfO9puujDJaLm+
	 IHXYs6EpYisF4Ap8uZ3HQUHxqrm0SIWfEFDvbt/a8ESAqZ0qRoKt9lWYqGhhWhZ0f/TB0
	 iF4dYWqe9xiLyBN3d9Sj/FmmGD6YIoTVe25XqDR7KqC4k5Lmj1pEj+ISDd/Ha6rHJd87n
	 OUHhMs77rFcKZonHEWpCiZDfitI3q9X0NCN4TIdtCo5aF7SCUQ0u27W7/X/+fB4dlyg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791130082;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=E9Ls46QcNTs3zfBs52tNpoNqFTAGF6aSNWm8j6h/HaI=;
	b=eblwmSdLEW0ovGqADZh2E621zMfpzIZ2oPsi/ijz4zgxCBO4GqYXy6ml3Z7e6nwQdtxx
	 cIzviw+RICLYWTa2pI1m5YlPd6cRbzy9W5aHacJ8U4zQLQYkaCYs6NKwyEdWpHUUHhfc/
	 WSCzozqtez8p1b1YVv2SKnyk6JLnvHruwhzMzHNwKeH1jq8dFzRX6xZM5Ved/KJQyELqy
	 2S9IdwijmT8mhiXeXwfqKLybq9K+b3Qq4vyaldEMclu7RdZsAsf46j1wrPjS/POU2ibFi
	 way51+oD5R7ewbrLwI3utdCpmhAtCxuCPq+IzO1lH0785rkn+0jlzhG3s02hmpC5KfA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791130082;
	bh=E9Ls46QcNTs3zfBs52tNpoNqFTAGF6aSNWm8j6h/HaI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DIOu3MtfE2v3Ejr+sWXXS1SFzaTlZtFBKrZ3N6GAnx1sZhD8PNozs9Tj8Wc+ZdwiZ
	 YGNW069e/YfsGEaSHbu+E7Zbt5lnka5ufO5hQrJN85egIDBVSlwzAC61itrn2yUEHJ
	 gAh68H+eRKLodODbEPFRyMw/87CdVsA+AawhsNXKrNKr0hcPGMFw2VXlVLPN93NQ57
	 sHZsbeAlawvoMtV6my619ZuHwxNFN/kVjmKiWnFT6J141/mdZtQeIk/J3et1eKFN+B
	 oDo1/QYmnCIb4FT+d5qgQxxWGdA0l87L+Rrn9K2mqaf7AZIsJyG4F/kmJEu3flW2s/
	 /LyTWnPJxFrlg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E129760664;
	Sun,  4 Oct 2026 16:08:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2BC83435
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1046F406AC
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:07:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oYihEj2OA8gT for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 16:07:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 681BC406A1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791130077;
 b=XYT7k/lyA07S0+hi/MkCSbsnK6zTs4ahJffXr5FzhV+9Mz4hYx5pKA8dK/zHRgOUnnWO
 Kk+MdokR9aUfyTGZpGwvumF2vKPnjg0cGDBpTT6c9P5L2STsrbdMbWCJqH6LgLaojOtk4
 +CXVLdComRVDdLzXNq/y38gLQTYs7fCCc51fzyUfYwexFPl8FviUREuTS8m/WULyO2Mi/
 QueWKCTxan58uJP3akmV6nJ56uAnPvaqXV9N6VrMa1Uz4MIj4Od0ambTwVicGo/cM7BPO
 kPIVl/sohvha9/1zVvSwnr4sPPCbaq2TSdmBFJfAx6ssBUXaiIUdJOTEvRaTyAVno8w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791130077;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Nqq2sdaERhFNxo6asqVLM+fWiX3GsGyiE5zXEXMK170=;
 b=TAaHKJO3EW7vNnt7UJAygvpER4DVDdWjs9Bn+LydwR1hxNzF5hyh7yKRhRjAn+bjFMAo
 wL7zNI/3rH56gu8b4fGbhdWjHE1VWou+5a8OG5igIOrYevf7IhehkitTEF2mE3l1NunxJ
 IoubUcZYLgH9s+rZ4tFN37qXIsMoJOAyAq+HWpV0Tcvi+Y6QThaal3pKY/tC7nsqUGrpt
 VLkbH7bL0d9+Sd++/OKRX+8g2eBDBHpgTBG/Hp3SSqsmxaE2HF6OaS5cDrQlpLcOl8ZNH
 zwJXnvpuUxHHZ71gu/vp/BHEK+DM0T7luIQ1nSbM2bTdlR8YUnOxTahpSpOaRdfbtNg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 681BC406A1
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:07:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 205838D220; Sun,  4 Oct 2026 16:06:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Oct 2026 18:03:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 74df9b364621f9e220b5aae8b9c9a9dcb6329f81
X-Git-Newrev: dd7096fbbdd7cf3bfc181d1c0c7bba779e0d259c
X-Patchwork-Hint: ignore
Message-Id: <20261004160642.205838D220@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-regex: bump to version
 2026.9.29
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dd7096fbbdd7cf3bfc181d1c0c7bba779e0d259c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-regex/python-regex.hash | 4 ++--
 package/python-regex/python-regex.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-regex/python-regex.hash b/package/python-regex/python-regex.hash
index e30af29b65..6c762af95a 100644
--- a/package/python-regex/python-regex.hash
+++ b/package/python-regex/python-regex.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/regex/json
-md5  b3113da02f37c37ae91946626ec4410e  regex-2026.9.10.tar.gz
-sha256  1e321e2c84f0e52c457f5ea5944f796d6e8e09cb99738ea98dcc1bfe402a128d  regex-2026.9.10.tar.gz
+md5  118d130c65d0c98c7dc183433362ce75  regex-2026.9.29.tar.gz
+sha256  8b5fcc4771732191b2b7d1dd68d8f0353f47f8d90b6150f6dce58bf1112442cb  regex-2026.9.29.tar.gz
 # Locally computed sha256 checksums
 sha256  bff55ef4cdcc8c14ce259f8e8ab60e264418440d6335f4dc138273fbd506144d  LICENSE.txt
diff --git a/package/python-regex/python-regex.mk b/package/python-regex/python-regex.mk
index 169e62b080..713f81a306 100644
--- a/package/python-regex/python-regex.mk
+++ b/package/python-regex/python-regex.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REGEX_VERSION = 2026.9.10
+PYTHON_REGEX_VERSION = 2026.9.29
 PYTHON_REGEX_SOURCE = regex-$(PYTHON_REGEX_VERSION).tar.gz
-PYTHON_REGEX_SITE = https://files.pythonhosted.org/packages/b9/5c/f403115361de25809e8f785686ec7096e30fef73be9ae35aa51da4e80abb
+PYTHON_REGEX_SITE = https://files.pythonhosted.org/packages/fc/f2/af1da9d3ceed77bfcdce40427d49ba0be94e4fe84245e3bfef68c10e75b6
 PYTHON_REGEX_SETUP_TYPE = setuptools
 PYTHON_REGEX_LICENSE = Apache-2.0
 PYTHON_REGEX_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
