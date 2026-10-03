Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C4A9CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 14:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4D0260FB7;
	Sat,  3 Oct 2026 14:01:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p9upQ4WJRL3W; Sat,  3 Oct 2026 14:01:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 190F260FB8
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791036073;
	b=WEuQPq8lxDpaCzqsdSu0Ipi/E3K5ICaQGSvjFd0PkybI53PMU4m9uLUiHx26PnE1eFWM
	 vHB0BL9rs3kGj43pml5VYDbE3BYMmLNzGTKdom57YygE0CwjFPlEY00DhjFaAZQZ2LCiY
	 8ZlGKXqRAcA0Q1mwL+EqB7TEDvM8Wd9djuouqCVLyiQ1fTZRV7xuKc1pG1aYacGXnrjCL
	 QzZyaOhEwiKeGPUT4cCltOHumMGfKffNsLyLtFRhTlRxpMKu+QFr7/PnZLuT3EFkUAv5F
	 DHC2VwcM754O/xpwocEE7jn1JOFfxHOY65eOsiwwWXifrlMC+B7nnEUaKn/rP0t2keQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791036073;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Sz6aXTCsK4/ah+Ztn/sPZkaYS6jF3Qk2ZesYdnNYYFs=;
	b=B1EFcpgn8csUHQwBaPGZUceImXDFSMkIYAoB7/zJ66oVL39wbRwU0GBcr8t75005aPRm
	 0yQSrCDXU19JTjVqVUJjbC/9+aNIk/LDtvaTjx0Pkx/+Q/Ak18vRHLv8zzNi8ZSTAN9Ub
	 GmgEVEfXzFRQtlggU0NcJrAgD5hXjJh+xX/JhK8u5HeqqP2g3vrKXyr4o5CNC8E+MKyWX
	 MjzQVrZ8bhZaWxQOLjP8WCJNQpQSYObMP/KdCDLlYR//pnUD3up7+50nQEwx5Nl1C3Wdd
	 6mCR95aIYtGKPfMmcBI4EElPTXCXj7D51siEfAUUK/wLPi9HF/Rd5dpE7cPN4/sSl1g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791036073;
	bh=Sz6aXTCsK4/ah+Ztn/sPZkaYS6jF3Qk2ZesYdnNYYFs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=g6Ao2Kv0TjweHAoiygvBr8oli6UrUiSi0mk/uycZSkVVEkj5wj9JzQHGTzt5aMS/K
	 lIAn5I92jhIPHlCjg1+d/rjq/9xt+4f/Pfti2QyaQ0Wk0G9CRyiN+O4d6M8BBeomUI
	 WbP9+84nkh/bnNL33Rk4l2HpStnrDYDCkLPAZ5TtN1MQNM7QuYeZ/UMva5E2dpSY6j
	 NRbyxe1wUAu12ITN+tqTDvRIvZuBjo0h9lTd+PrwGypHCef5R5BMwhy9O7kgXub4kW
	 WzGP6FelEoPxrDK3qjN3SpkP41B6ZXTLzvFwAbQYelSngzL90oUbWuvfNGuS7g5Efp
	 veK1tgBxAWy8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 190F260FB8;
	Sat,  3 Oct 2026 14:01:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DD9A179
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 14:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1BAC560FB7
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 14:01:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M0QXGSZmMbTR for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 14:01:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 694A860FB2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791036071;
 b=Nu3LJRyYIqyDMDAGg+L8t8ceaupt0xEph/vb6kzLOyPM/1RREOORBGKTTtvCb+dHlBtB
 0HtKq08jg9LnG8RkyjxYXd4Lg5uP/ADxPiZxl6qGEUms1bbHh28TDA6v0l6Cw6/yz8+wH
 apHnsg91hhm4y404cR8M0CBmw2PMzhAuNDmm7UEEiBE/UH8JAIPvGrkbhokIIv6ryMXxy
 A3Ux4sqp2YTmaxwUVbaqlArpIb3CKXO//wTP9KBzO7cjWBGxyYQ13xE/NPHWB34aJD10R
 62hPIPcwdNVoc/U/JxFTTb7AJSP9aUbCZhPVUNuzg5nhjd5iaBBu9Puf0fA8v4idPwg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791036071;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=gwnQEzkTroppXu9ZWCy6EMdjZ+Avzij0FO7TpzUovVE=;
 b=iXPonRXF2xdqo144XFLB6eDX7yG8mRu7ua5JcQzpNuVXpkU8LC2O2WTiGYHx7OWIXi0x
 snDXsRPCw9M/6w8CsfPs3W+OQ24VQDsp9Lc5YhrcMDYVCDTbh7kKMW5B6GgsKBR57DThJ
 9atPV7zJozn8/31FMm8xS7ccapup7bgvs7XkQZJjIjtUubRK1y4IgOxzy4LRCaYTK/puv
 adrpVYTqhNcazwIEzMyMDczr7Z3cjLNIGXkjaX3oRocPLSn6M/HklBAcJBzNAJvZxh73y
 VajNScT9BLjTK4gEmS/ts5zgRe4zfsFzkSzA0jUvWYvIeKxqI2XSnYhY71veIEoSkVQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 694A860FB2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 14:01:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B24F78A40F; Sat,  3 Oct 2026 13:59:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 16:00:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9611b785816f2546bd69a56b9329f09b0c246874
X-Git-Newrev: f66899b1c37b3a5cebdb4c513773d1529ecd4c39
X-Patchwork-Hint: ignore
Message-Id: <20261003135956.B24F78A40F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-logbook: bump version to
 1.10.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f66899b1c37b3a5cebdb4c513773d1529ecd4c39
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/getlogbook/logbook/blob/1.10.1/CHANGES

Updated license hash due to upstream commit
https://github.com/getlogbook/logbook/commit/963dd98736ae223f4f19028d19cc4fc3b5bcb4bf

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-logbook/python-logbook.hash | 4 ++--
 package/python-logbook/python-logbook.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-logbook/python-logbook.hash b/package/python-logbook/python-logbook.hash
index ee812562ea..c308309cd3 100644
--- a/package/python-logbook/python-logbook.hash
+++ b/package/python-logbook/python-logbook.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  07d53ef8b7cb1f267862f72df81857c9d6665104535cc5309774de7966164c46  python-logbook-1.9.2-cargo6.tar.gz
+sha256  b9c6fb8f13d295864342a02ec7256a989dbf786370cb5d84e7a259908b2b7b9c  python-logbook-1.10.1-cargo6.tar.gz
 # Locally computed sha256 checksums
-sha256  2ca266337cc6947578654ab0dd6438de4d01fa78b2e6eb554b09757df1178f98  LICENSE
+sha256  5187d311b2de7c67ce4ae6067c36eb62c5c87ff617d0a772ddaa27ef721f0a13  LICENSE
diff --git a/package/python-logbook/python-logbook.mk b/package/python-logbook/python-logbook.mk
index 2bcd48bc2f..dcb6808a61 100644
--- a/package/python-logbook/python-logbook.mk
+++ b/package/python-logbook/python-logbook.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_LOGBOOK_VERSION = 1.9.2
+PYTHON_LOGBOOK_VERSION = 1.10.1
 PYTHON_LOGBOOK_SOURCE_PYPI = logbook-$(PYTHON_LOGBOOK_VERSION).tar.gz
-PYTHON_LOGBOOK_SITE_PYPI = https://files.pythonhosted.org/packages/f2/cf/e39c249003caaa7f84e2b00c11c7423892d525f8136ff349f9914914a744
+PYTHON_LOGBOOK_SITE_PYPI = https://files.pythonhosted.org/packages/75/73/2998c9192466f93a63d325866d7c3e3800403ccc49ba9f7dc6bd89963873
 PYTHON_LOGBOOK_SITE = $(PYTHON_LOGBOOK_SITE_PYPI)/$(PYTHON_LOGBOOK_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_LOGBOOK_SETUP_TYPE = setuptools-rust
 PYTHON_LOGBOOK_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
