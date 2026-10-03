Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB6DCA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 13:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBE0760FA4;
	Sat,  3 Oct 2026 13:57:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FIRCkhsAX953; Sat,  3 Oct 2026 13:57:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 952A860F71
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791035877;
	b=tY8QsBeoLjKkzxDVBWhBwtZy7KWv1SOztoi3q18efnc2GsIXd/BXYO7LMC2KbtGY5l/Z
	 ei8ThVsAJ1pFOgR5fDDvCTdJiKsvOVivMPY46HrLnpsli1QTudr3W9Yql1Nm46MPsQIkt
	 2Sf2Tn4MkX4KzAuO8BOgmX0od8njYK+aPtYoFujry1aPQumonWFCnqdUvB3mq4W+Deg6p
	 H8KczSjaE/XKpxCzxdmQMaJPjDideX5eWyV1sO+X94Q28mPTpkIwR0rj0izJVGI8TX1RW
	 +ZbCDu8tMmfkdq7ai7erpEHPmbg24DH+ZA/ai/Fd9mhNKyH5N+38Rj/WzzZay5QaSLQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791035877;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=kmeXharjOi4TotZh8rFetg3t7N1Z/RNksKb92rk7aUo=;
	b=VqrxuKLadDIj9xF9xfac1dWwhEIgil9WqiQzQxul7F80g1C9v+xViXCHGgq2lbuqpXXz
	 1oo4K1HjXw+ghuHwAajeHaTYTil+us/Kl8lhv/MRsyEAMVfW4313aE17AWb2Iua8v1DGU
	 Lqp/p26sGceJtRsNdz327sU+CotihVQW2u/RMwcz/MzU2kWQgF+qCK058Q1sCnHbjadjl
	 8WzDsyGes7dkC7u6r2HXgINwh7/Fg/8zWJkFCnonViThI+0MTlMZM2qLzqO/XIjQWUX7L
	 f0kpgZSuuA8oBXkFEQtpoMJV6j8p4S0A9ulDt2RPzzqwQ1XX+X5/6LljWE0dj7n9Yhg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791035877;
	bh=kmeXharjOi4TotZh8rFetg3t7N1Z/RNksKb92rk7aUo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=S63A+zAaO7u8s7jRt/oQHddRugdQnlnUteqAve1ozaIvGmYui33lrb9MjGHgJBsAo
	 Q145msnOjQW3F974q0ZKOp1MvKdQ3pqYpfCv4U20fZ7PsXNiYylJZOxWYtN9/DR6N3
	 GOsIgCBjzDj5VS0ypdJnN8ravtFo+v6VsdGRO6cLg/kqAp49gna5f8VdAlEIwu6U4g
	 76vRl/y1QHVeElb1wY1Q63hPtMSj4qOQvPX8Y/OcSqmU1Hs0P2jM97cRJKiMILmvlh
	 eyaFpNjK3znWTmTTNJe1ao09OXDcArZt7sUmtbzX7wAE2L2GWIu96DVDIBeUZW3Ldy
	 ev3BhxFm5kZEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 952A860F71;
	Sat,  3 Oct 2026 13:57:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 415BCA15
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 042FD414E2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pLHsxf1664_t for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 47D16414E1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791035816;
 b=jXVWXdfGdQU/S+GMBMIyOQT7NtPNoaCrwBlsJvqnbnY8N7Gp3hmmRlbDCz0py1LDn5rY
 QTicDVas9eFl+DWBNVhrvFKv++hY8KxcnajOqPcPqRMibClibeN7hdmr0XyWxpsUYIxU/
 imTwKDeXarCHA/V621S58KGPHXMW/whY6XSAOFO9BLASfx6u8usM6bjKpePrILNJYedK1
 mdUuOpACQm/AYgc32sYjrOxp0vHcmpLsSm/uDx3mLatOHiDwVf24svh8j6wfrbxaVxz1I
 u+ywA+VNw2AX4HgDat1T0quTuK23HdUSJiDSREm79VSwDpRN53nJiOxzwuHsyCBF0Ew==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791035816;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=zlp/B0eVTf508RlCmj4uwoM2JqhRu37TF81L/H5iCZw=;
 b=rXiDIQbCKsjh+OfqMSv3z/m2H8GZ0VMfR1o8eUD3fgHPy0f7f6pdUPdQhmaNuvCn3gkc
 MjI0IuHdoTAgV7IBf1gv65oi/ChNnfClLPuL35nRhTGoIJkvrree96FezgJ77XCoQGqwD
 NaHwsicQgVmXSVhj1C+QkaZiUsk6w1o9HfazIP/uanO0uvulw+vMjIdFrU+bLZafBbLM3
 6DnQDETgdJdliuywjyMqaO1ps2ZIDS60GlRp5PiTdNn1uzU+3fm1fdOG0l23/7SJOOzBl
 m8XxcgCdDqjfOKQ4CZDAGuQDlMTLlPWtZM0WYWbtjVlvqQAVQWGB6RmQ0Ep6GFZ1Efg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47D16414E1
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 91DB188699; Sat,  3 Oct 2026 13:55:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 15:43:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 827345fb5544e7aeb87addfcc003615a62342623
X-Git-Newrev: 3eb9b971f077a376860d8836ab25b7fa51cf2af2
X-Patchwork-Hint: ignore
Message-Id: <20261003135541.91DB188699@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-tortoise-orm: bump to
 version 1.1.8
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3eb9b971f077a376860d8836ab25b7fa51cf2af2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-tortoise-orm/python-tortoise-orm.hash | 4 ++--
 package/python-tortoise-orm/python-tortoise-orm.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tortoise-orm/python-tortoise-orm.hash b/package/python-tortoise-orm/python-tortoise-orm.hash
index ca76cc9219..a1652f92b0 100644
--- a/package/python-tortoise-orm/python-tortoise-orm.hash
+++ b/package/python-tortoise-orm/python-tortoise-orm.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tortoise-orm/json
-md5  0c980e5e003b197f22c271da5fd72875  tortoise_orm-1.1.7.tar.gz
-sha256  a0f0f27f9c92547739f0a3f0862c257ab64d8baadbc0e548cbcfa2d70bcbe275  tortoise_orm-1.1.7.tar.gz
+md5  d31bc68389936220db65f389df34ee7b  tortoise_orm-1.1.8.tar.gz
+sha256  09e27be9db148824dacea470d01018ab571676f94aa5428a05bcaec44c413ec7  tortoise_orm-1.1.8.tar.gz
 # Locally computed sha256 checksums
 sha256  f955d347b975d5867ee364f978476b3012878a706d468571b9758cac74de6041  LICENSE.txt
diff --git a/package/python-tortoise-orm/python-tortoise-orm.mk b/package/python-tortoise-orm/python-tortoise-orm.mk
index 48a7e84e6d..927d8fda97 100644
--- a/package/python-tortoise-orm/python-tortoise-orm.mk
+++ b/package/python-tortoise-orm/python-tortoise-orm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TORTOISE_ORM_VERSION = 1.1.7
+PYTHON_TORTOISE_ORM_VERSION = 1.1.8
 PYTHON_TORTOISE_ORM_SOURCE = tortoise_orm-$(PYTHON_TORTOISE_ORM_VERSION).tar.gz
-PYTHON_TORTOISE_ORM_SITE = https://files.pythonhosted.org/packages/1d/55/e75d3ae0dd2c96cf961bf068f465fb62ec481d802beb65f406620bfd40a0
+PYTHON_TORTOISE_ORM_SITE = https://files.pythonhosted.org/packages/10/8c/059f284ed7a08e9cf3a45973e2b9d013a8f242fbb1051a06c3d60c638920
 PYTHON_TORTOISE_ORM_SETUP_TYPE = pep517
 PYTHON_TORTOISE_ORM_LICENSE = Apache-2.0
 PYTHON_TORTOISE_ORM_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
