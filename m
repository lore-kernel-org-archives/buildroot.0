Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04245CA5FF1
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C46A660F7C;
	Sat,  3 Oct 2026 15:56:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oGy1oz7WmUe0; Sat,  3 Oct 2026 15:56:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org CF1F560F56
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042970;
	b=msKaLnsH5DdSF8JUOnLRDt2etU/IpCmQPqLfPv/MEBaoRrLRp10Qy1Q+W79A3YWq5PRJ
	 bu1MUHeJKfZCFF1peojxseBLiNCIrtLhY+myyj2Mn60g/wkkQ+yJZfOxn5xctY56HqMOX
	 5cm9PDUFE8DYSrJ0aQy61SwiirSGgE4PHiVi6MI7iLtE5obp3PkZPO9HhvdsoLpijmWsX
	 CIlM1DYmdeHwqQ/OTAmczNDSJ6XMK79YDLMczyrsQMapgooZGzhRsgDtKsoYfgIkW/2do
	 Ivtr9ByrEcdndbTU9DP79fZbw6NcxbCQXk4axy9Z3BhGJaHFf2JvEOqNbupp5BWVnqQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042970;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9OBu+iYq1FSm+8X/z2XE4lkCm2Q71i1DwG9YXHzLWcE=;
	b=YqNExAJJ2p2HDGmxQu7+qXU4e71NFQyXNtKflyu4FDCH3PXBuGDg3dbgjBhNxcW2w8b/
	 oQjFpoXgIWdCfwp5/5VRGAsgpOlV2H5YWL0B8qVzwA8YjLhlmp/v5HrnBy6PmbC8SPhJG
	 +p4fRm4PWr5bta981DBZ+nV6iah2LMHWDH/cX+BwwV4jSgdK4I2avookpqd3l/tyiuSNh
	 kwngjwT/Lzns1o+m1UE7U5IPez4XtcPB9MprEFkXIWkQKszrFht9SsbZIHwbeT5hYLJIc
	 I4UuHhWVg7IS/b6CQ2XRNz4HqJhWCBjEu/VcC4AD9Q6rG43V1jiNCHbXTBvkAIXqEng==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042969;
	bh=9OBu+iYq1FSm+8X/z2XE4lkCm2Q71i1DwG9YXHzLWcE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=q+D6eVx5By50US/zwY1W2HjGgfYYv+ucU6ViLXinvHiTRY5hCPLQpVMm/BV4gLByX
	 5wpts4CZOX8mUFYe47/1DzMtJNM90F+RE0uhUnZ3f3+QShG8+bZevjArYU7izOzqsI
	 mJ0QE66ESqu2WP6ZM6WaE2Bs1ej2L0VoRJFP+cD2+Ve7Bg3dzAfMbBQlMa/BRHl1IL
	 3Zxng/E14XlE1AHTXWJ6xNw+Kzig31zCAFuxse4M7NgKKMPA0vxtCan3xI5RoEnH5r
	 MkX09MGlYc3qZnG5wuxQy9roMy/7ex2JeGLcc3vLVwse5oUioySmz8xSMiA1srWWBk
	 E+8SWKPxCk1Sg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF1F560F56;
	Sat,  3 Oct 2026 15:56:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 461FD476
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2566E606E5
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id axuLQy-Cm_o9 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4217460603
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042846;
 b=T0OYKdRIb7T202yn9d8vNcciSiqtdXSk6zBYVXk+VZNwcz6AbS9MbBckX2mWHuPQ5AV7
 dSaI0xIleXKSKmcyjY8Hc4qAz+jk0YQ+Jgb/IdtzytTsCzp18mdPAMCsensurqU3ozi3b
 Kp1tOAQSGcbCK7EN35joMG+yhV0tXQcXpvN7bXZzlqHs9r0tFqQOqeAvSBcHRAy0mRAZa
 rEC6fWm7W0hfbNRvQ5rBye73LR6Ofo49deDbZVE5L7SLS9orHQfDpTaYdxQ1jQlILUXB3
 1qtw6fP3J44ep0eIbIZiabnTQ8h4XHmq1EXt7BDMWNq1Xel4h72DdOU9sRrvUGd+Edw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042846;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=AFEwlgnOcksNA+DAuiO5jelG1ndHnJE3fUkQ6rwn/4A=;
 b=QjJVONhu5ibi9rWjo59hZw6F3dVBvZtyPZKKD6S9mkp42g+q6mDs9AUX/6oWRSzAh7Mf
 A30Z4bS3XYTxd2XpCzAHEVKo1hSUTGZa1Lu37F+PCkF/1N/vrd0S5Q2Qrr49tcHew3JQ6
 SvDkwCarKVIeX11ylMySSb7OJ41YNe+I7PwWNy0A3ek2sivj0Ck021B8iSKOFKXkGI8gF
 z63zLT2O9xYTTHSLvApEM4/tR5GTWPDk1gb6HykhIJJpQ6SRn+51WbyFp8kVir7SE8n3B
 IvHqWHNSYSb+D9KvD5M+KC6Ffbtvtksd79T3cB7dx83yUs0pUeXEy6dBYpyxa0e8T2w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4217460603
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 83CDB8A58C; Sat,  3 Oct 2026 15:52:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:43:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 739f1a07df46a37fcf30c43b804dc51cb0d2f0f8
X-Git-Newrev: b27c1a81cce6c15e8b00743c61f68d61565df19c
X-Patchwork-Hint: ignore
Message-Id: <20261003155251.83CDB8A58C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-beautifulsoup4: bump
 version to 4.15.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b27c1a81cce6c15e8b00743c61f68d61565df19c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-beautifulsoup4/python-beautifulsoup4.hash | 4 ++--
 package/python-beautifulsoup4/python-beautifulsoup4.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-beautifulsoup4/python-beautifulsoup4.hash b/package/python-beautifulsoup4/python-beautifulsoup4.hash
index 32c331e28b..7c925030a0 100644
--- a/package/python-beautifulsoup4/python-beautifulsoup4.hash
+++ b/package/python-beautifulsoup4/python-beautifulsoup4.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/beautifulsoup4/json
-md5  c7e801c7d4e2300c1112eeb0b21ccb9b  beautifulsoup4-4.14.3.tar.gz
-sha256  6292b1c5186d356bba669ef9f7f051757099565ad9ada5dd630bd9de5fa7fb86  beautifulsoup4-4.14.3.tar.gz
+md5  a9d04db2259b78ec23fcdfddfed5bcb8  beautifulsoup4-4.15.0.tar.gz
+sha256  288e3ca7d54b06f2ac191970bc275c1939cb46d450b255bf6718b04aa37ab4f7  beautifulsoup4-4.15.0.tar.gz
 # Locally computed sha256 checksums
 sha256  55b4d8d4b1e5bc86d10efac91b74c87bcb77526b0f5b9edaf8b9cd2adc7397b2  LICENSE
diff --git a/package/python-beautifulsoup4/python-beautifulsoup4.mk b/package/python-beautifulsoup4/python-beautifulsoup4.mk
index a9661345aa..0aa70fff81 100644
--- a/package/python-beautifulsoup4/python-beautifulsoup4.mk
+++ b/package/python-beautifulsoup4/python-beautifulsoup4.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BEAUTIFULSOUP4_VERSION = 4.14.3
+PYTHON_BEAUTIFULSOUP4_VERSION = 4.15.0
 PYTHON_BEAUTIFULSOUP4_SOURCE = beautifulsoup4-$(PYTHON_BEAUTIFULSOUP4_VERSION).tar.gz
-PYTHON_BEAUTIFULSOUP4_SITE = https://files.pythonhosted.org/packages/c3/b0/1c6a16426d389813b48d95e26898aff79abbde42ad353958ad95cc8c9b21
+PYTHON_BEAUTIFULSOUP4_SITE = https://files.pythonhosted.org/packages/43/65/318323f98dbee45d42dff61d8f047181bc6f2268a9068cfad035a46be5af
 PYTHON_BEAUTIFULSOUP4_SETUP_TYPE = hatch
 PYTHON_BEAUTIFULSOUP4_LICENSE = MIT
 PYTHON_BEAUTIFULSOUP4_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
