Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A88CCA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16B1F81871;
	Sat,  3 Oct 2026 15:56:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jkPEloAmE2AT; Sat,  3 Oct 2026 15:56:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6B400817BA
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791043017;
	b=Ct6zx1d2LAZh+Bcpb3ybv9b17ObDGG+WaxTbLF/8yHTNcllqD/1H0lXDl4y+S2BFAMyd
	 vOOT7DMX8idV1Q7IO3KeFu7qAunQSVrusZJUQ0r75PnNoXfRYMeEi16GZneH0o+YvYrHx
	 WKiehv4uJYtsWy9VyPhE+zpNYXgLJNC6uKVKrVtl5X/I1Tpby2isWoHMtH8+qeTs+pTD4
	 78kin/sRJrCI5MvgHq0hMmoCuLtdWBM2cW0Q85/ZIGV1YtjDAp/gh3gSHNgLUuYbE5jOb
	 17V4Sa28XDKDe6m7bEhPAZFMXbfC3I5gOoBgrFhdkRjZOeGkYeM+pRoyL6H7oe1cUuA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791043017;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=NBBH+tUTdGBS3wHCD+mWUNxclq7iIeigtUgsBLlMgyI=;
	b=GYoXCBQ93t5WE49q08OEUvEmiILp01dqhvRuq465LCnmNF7uUuLW4u81dc8IXz3uWiqs
	 1PoNNRPkLDLhcHV9x/OHCJb625c0QR/zrgsOZiUQpK4uutuNcoeVG2gnfNob4F3kZbOeC
	 el+KizVDHDWUE7TyfOxeB9DBV/A2FjtIrTqt9Ipy32f+9LT2mnSm65ugEWJeSpCu0XpF6
	 qhQaRiJv8jbqVYKcR90QbsfMqKIu2Fb9FsGafv6ZyJTvmjxYXxAvdAZmhOorDpvYrk+1n
	 7g1xN7EigZYoCnXkyoZ/FyC61r0/dOCNB8LGRgPzfBvIGUY46NQEuW//3k9NdfmfAZg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791043017;
	bh=NBBH+tUTdGBS3wHCD+mWUNxclq7iIeigtUgsBLlMgyI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kcyUYyFHcW0HlgJWJfFygCjGTWQiKP0Mzzr9IYO+oJlIM9T53/xIQGeXaivd0Inyd
	 vEhrgBL4k6PZ/0nG38YPFc4hmp5HX94+jV3x7+lwJ6gRcT88glRXRg0YBKIJbMrpb0
	 k3tkoKs+Hb09zFiRnDdJDJpMqigaem1JJ4m93KNkYne9rsSP6FJm+FHFUDxYCHLKNN
	 O9ss+oLT6HV7O+NBXyQjBSZPlFoV37MbXQ45v4rzcG6yITBQVlEWIJFZbSpOZDnq6D
	 cZ4Dmtjmb8koZQZEcZhcesKJKCfXJR3TlTdnBcwLQOK21hqDEBXfQKOE17LUvNTkto
	 PRGki7j/Fp5Lg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B400817BA;
	Sat,  3 Oct 2026 15:56:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D2EE4B7
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 29BE06066E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uKqx0LaV09dY for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8AAC26064B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042848;
 b=ftBWPabwpK9h+NX9fpX/7z+7nwAMFkVupe0B8qIrrxPS7nqjB8fhlTNXYsSxxqRb/99O
 yxBTRKnFlEt0/RqPp2yZBxRiFF1kzSAFq7VK8Rw25Wgdixv76j9D77I4zBCfg5fV7MEDr
 j4wIUdpi+kDwEeIOxDG/zxsPj7PKhAfQ57aZ98+hAYRBguDirr5lWLqcb4mKbrdvpHgS9
 g3H7gCkqsb7W0jZysVYrF7heZYW7ZUY2cbM82hJhQHc9KM86+PyzCDh/oY64X7QJmEScY
 ImErtNMHNFyUNmagK/hOjRkl1D2KRROJEM5vwqj9ijqowKGUGqQm70okBi6pVk5DaDA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042848;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=j8UqvAV1CJQj3UdvruF8V+DRTjjc4V/kByfycBzIcS8=;
 b=j4F32qZMHt2A+icQ5yN0WLhfTwqbiUwuqAJsiK12zZ+2Zs9mXp3K9xZ9A/+8oBbia74O
 39MBcPLfzb44naz2RHZVrGyO7fTWKxj0Bzvolihe1zCbVsdymZ3pFQY1ssupytFsUFtB6
 yg5MqBe+fx8ih2CIORmqsnvMFyFIY1CGX2OtuyLCUpLprMy/sYmQVcsX1j2R9eyTtkTqA
 INY/pVGn5zR1/xu2o+Yxk5wEaU658FDnRLPaBLDXaGX+ssbaxt6b1FNw1mCcg253vjUfi
 aSusQ6R+7bGHWubyN+VK+ThvDiIum2jP4Ezm8Plzhr2XlZVYmAlRRx7L+bzrloNiKdg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8AAC26064B
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CB3258A4B8; Sat,  3 Oct 2026 15:52:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:44:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7e70754b9938fbcec0e6effa4d1cd8c229e43474
X-Git-Newrev: d55366889bc1aa30ffda0274e4f90fb9afd6e5a7
X-Patchwork-Hint: ignore
Message-Id: <20261003155253.CB3258A4B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-more-itertools: bump
 version to 11.1.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d55366889bc1aa30ffda0274e4f90fb9afd6e5a7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-more-itertools/python-more-itertools.hash | 4 ++--
 package/python-more-itertools/python-more-itertools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-more-itertools/python-more-itertools.hash b/package/python-more-itertools/python-more-itertools.hash
index f19c07f278..a469ac3905 100644
--- a/package/python-more-itertools/python-more-itertools.hash
+++ b/package/python-more-itertools/python-more-itertools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/more-itertools/json
-md5  cce8548e1d2882b00d83b4b436c7e47c  more_itertools-11.0.2.tar.gz
-sha256  392a9e1e362cbc106a2457d37cabf9b36e5e12efd4ebff1654630e76597df804  more_itertools-11.0.2.tar.gz
+md5  93ea38a66c1727add887f84eb2ea88ea  more_itertools-11.1.0.tar.gz
+sha256  48e8f4d9e7e5878571ecf6f2b4e57634f93cd474cc8cfbd2376f2d11b396e30d  more_itertools-11.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  09f1c8c9e941af3e584d59641ea9b87d83c0cb0fd007eb5ef391a7e2643c1a46  LICENSE
diff --git a/package/python-more-itertools/python-more-itertools.mk b/package/python-more-itertools/python-more-itertools.mk
index 9fd9da10e4..fa3d859905 100644
--- a/package/python-more-itertools/python-more-itertools.mk
+++ b/package/python-more-itertools/python-more-itertools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MORE_ITERTOOLS_VERSION = 11.0.2
+PYTHON_MORE_ITERTOOLS_VERSION = 11.1.0
 PYTHON_MORE_ITERTOOLS_SOURCE = more_itertools-$(PYTHON_MORE_ITERTOOLS_VERSION).tar.gz
-PYTHON_MORE_ITERTOOLS_SITE = https://files.pythonhosted.org/packages/a2/f7/139d22fef48ac78127d18e01d80cf1be40236ae489769d17f35c3d425293
+PYTHON_MORE_ITERTOOLS_SITE = https://files.pythonhosted.org/packages/de/1d/f4da6f02cdffe04d6362210b807146a26044c88d839208aec273bb0d9184
 PYTHON_MORE_ITERTOOLS_SETUP_TYPE = flit
 PYTHON_MORE_ITERTOOLS_LICENSE = MIT
 PYTHON_MORE_ITERTOOLS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
