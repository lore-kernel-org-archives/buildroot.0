Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25564CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 13:57:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FBC881466;
	Sat,  3 Oct 2026 13:57:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MdCVl7P1TBWL; Sat,  3 Oct 2026 13:57:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 42E1881462
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791035820;
	b=po60bVzxVYCXMzpZSn20OCPPuopxdI6MUe6CBOqp0Tz8NxtmXMpwHb53bhmrE5BVKXxD
	 zwKpx62vZ938pTScN8XneF7XKE7IE6hKr9GHgZ0OhqxSz91G5++Js8w8Sb/AVTpbDIQag
	 fZsbLaPEo13dqs7AbhRcdyyUajN1GB7WcFSrs6dK6OHSEepVc5fkXOyBIyAGDG9K0cZes
	 Sp6kiCZrF7aEnlZukuJyomIEPtF34/cNwIp8/MaKS2tyVnHBSdIZst8OC6j2yrn6CbFGV
	 yRfzc/MlI+z/zc70bfDO8dBK8BVxZh7ihWgTpVGfDrSCTjFkjMpFl7VgoLIC4Io+viw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791035820;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=MY4dJZvoB4cJpTCA3w2BSBNFlZp/uUpT/YMxETg8uN0=;
	b=Z3YF2/4QSspSIZCgGVmGBuull9TzuTwmH5lzURepBg/eeVkKlxm8M5s01X/trjBFfVvM
	 8p7exHQ1qysrliF1CFmrx5mT1DwAke9Tj62UcZM6b4R9bMmjRVy0c4db+pM0gHmEn5Pe1
	 q0HZvvVFi7XBGNGyhyW6tr4D/mMYVDdsQP9Z7MytIf81JqNqLvnjYCffCNXyzjZAleFBu
	 hwifvT83st9RCZpx9fXQiqHS2iN9/wTWsx/uc2Ruu4ab4rqVAL/+1H+fGqPm/reis9YlF
	 oNdgY1diBBEw/BKWpBe7plmamkmm1s4JGzll38N5ydPoeBHX8Ji/zkj3z4bAdgEC+3Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791035820;
	bh=MY4dJZvoB4cJpTCA3w2BSBNFlZp/uUpT/YMxETg8uN0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=G5wqG6AFVfk6i2LIWRrfL7dE+aDtohR0kfR9rXaMB8R2Ba5jovKuWPYv0k2+mqZNA
	 mSvzJEcClcSIpdsDpDc5A22nySHbx6Fo5ILWdrxU6YgrCaBicqqw0rBxeahT6hsyHy
	 dCvCTiMlkiiRsdAM4z4jJjHfHhRBmtNlOCoOd+KL+xdnLmHgNrMCjrj4grD0SqEkla
	 n/xqKSoKfM+zLd+1qumxtq1dlhkKkcYHjVlmkasRxsqvuePhwQ/fFElELgSxHeB6ah
	 yLK2eXTv76q3Rrg/4xr9kUww1b6yR5JLc/wLDV+6rSxWBjzWEtq6TXqrRHe5M7dsay
	 qNbovXA5VprZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42E1881462;
	Sat,  3 Oct 2026 13:57:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B8E08476
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F276414E7
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hE2gwgp1o0v2 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 13:56:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E3B77414B6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791035814;
 b=Z10PaoIXVhZ+l+xMwnOQrQHDtgOGWXhNYAAzyStMJc7oTwRLHUR3wR2GW1Rb8iTujP1r
 W7oAr1EHNqfVKwdZN0C8AASHhb+Nx99f6AnzBq9lXoIqPzTk+eY0wdQ0tVOrYcDDO+qeW
 2GhoQ5xcV3SjY5T270z15oQGNtpzj2VpNaRUsJBGFe5LvrsatAPz9F33nF5222ZAYYUBy
 QrFsdipuarMXLOXGj4Jxh23CyMqTTVvzT18lzB1FHOyTjNXnFQNZ9etamhhYHeaIzvQbl
 +5gv6AYklYuGsf/oh8xOWni54s8f9fXxpQ+9LrvdK+Yz/qJvvg0nOyAx5+qGa46D89g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791035814;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=AN2mUt7K+fpo1lMaandMp6cPjn/pKSzhlulSBLO0l+M=;
 b=QX3qHG5TPhhiUSC7IQTVsrXUBhVXnAO7kzqUvNwfQmmti1AniW6P4JxsS2bVYTDK+kH7
 faY+jbHNmfZu/S7RUOjSv/9/JIYGxUCU4pwQQjKCimPvbzUn3Gqq/2dhpv9K0Ud/CjEDQ
 ZW4jriuED1/KCes4z52iCtyRsRbB+AzEZNiBFZ7bAhmqhJfTRaEsS20MWzPZ/JrF0exS/
 n71F1RScjBmcx2SNJagnffikcA/y0ndnUDrdLl1Vq8DuzEKi0eE8rjNtANT31z+Bo4U78
 gLtU+IvBlkEF7yWHK8bAByPSrPLWSz9Jp2QzmoogDjH4H6I6y0KT5eRAAF2QpCgO6Gg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3B77414B6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3805A8A31E; Sat,  3 Oct 2026 13:55:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 15:43:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e825373a0a622098658e33a8b930677c2112ea5c
X-Git-Newrev: e606573180597b875161f07dbaf420103a705c9b
X-Patchwork-Hint: ignore
Message-Id: <20261003135540.3805A8A31E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-annotated-types: bump to
 version 0.8.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e606573180597b875161f07dbaf420103a705c9b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-annotated-types/python-annotated-types.hash | 4 ++--
 package/python-annotated-types/python-annotated-types.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-annotated-types/python-annotated-types.hash b/package/python-annotated-types/python-annotated-types.hash
index fc92476eda..7d76c76c25 100644
--- a/package/python-annotated-types/python-annotated-types.hash
+++ b/package/python-annotated-types/python-annotated-types.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/annotated-types/json
-md5  5c943b7c51b0b7dcadf46da4a99c84a1  annotated_types-0.7.0.tar.gz
-sha256  aff07c09a53a08bc8cfccb9c85b05f1aa9a2a6f23728d790723543408344ce89  annotated_types-0.7.0.tar.gz
+md5  e82458911a4050ecf61f2a4c6015b7e9  annotated_types-0.8.0.tar.gz
+sha256  13b2beaad985e05e2d6407ee4c4f35590b11f8d693a258a561055cac8f64cab7  annotated_types-0.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  fe1049884b1a0d9342901e88e07f32925d24b3121d9972b6a6805fb9824b095d  LICENSE
diff --git a/package/python-annotated-types/python-annotated-types.mk b/package/python-annotated-types/python-annotated-types.mk
index b962c1a07d..677a1f92e2 100644
--- a/package/python-annotated-types/python-annotated-types.mk
+++ b/package/python-annotated-types/python-annotated-types.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ANNOTATED_TYPES_VERSION = 0.7.0
+PYTHON_ANNOTATED_TYPES_VERSION = 0.8.0
 PYTHON_ANNOTATED_TYPES_SOURCE = annotated_types-$(PYTHON_ANNOTATED_TYPES_VERSION).tar.gz
-PYTHON_ANNOTATED_TYPES_SITE = https://files.pythonhosted.org/packages/ee/67/531ea369ba64dcff5ec9c3402f9f51bf748cec26dde048a2f973a4eea7f5
+PYTHON_ANNOTATED_TYPES_SITE = https://files.pythonhosted.org/packages/5f/56/a8120250d128bed162cd73c76d45f6ef9991f3e068f62a8ee060afa3104a
 PYTHON_ANNOTATED_TYPES_SETUP_TYPE = hatch
 PYTHON_ANNOTATED_TYPES_LICENSE = MIT
 PYTHON_ANNOTATED_TYPES_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
