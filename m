Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E29B7C433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 22:00:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B47A6109E
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 22:00:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7B47A6109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 570B48386F;
	Thu, 14 Oct 2021 22:00:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id At0I8Ok2ypua; Thu, 14 Oct 2021 22:00:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D366883837;
	Thu, 14 Oct 2021 22:00:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B57631BF576
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 22:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80B234012D
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 22:00:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PaNCG7F14XuP for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 22:00:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F1C634046C
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 22:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1634248812;
 bh=lOf+UIryQEmLsn8yqdFmb6GiCAGd/MNABQ/7ownvqSE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=WIN2gbvSbKiqy+u74l5eomJKU2ytjDWuYYhGVLA/XZgEIzaDcwqkC0WeO7iYTrd1+
 RJgUn4d0LDpbPPt3dvspK9uT+G7ecUJp7uTeRAHK1Nak1j2yEzKv+qdo/60p+z+n6g
 76K/jhzjUuuEt55waqeBaxNRJZA13ryNCyyTbSdM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.156]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MkYXs-1n0obK2Etq-00m5Tk; Fri, 15 Oct 2021 00:00:12 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Fri, 15 Oct 2021 00:00:11 +0200
Message-Id: <20211014220011.17230-3-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211014220011.17230-1-ps.report@gmx.net>
References: <20211014220011.17230-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:erA8VHtubJJio+Xc4+Z+oWSOKeX7fl9RmFbwIYU2EdUyo1E+R+8
 CafEM7DSL4ZKzdFJKihvt3NJluvmFlHddLsK8ESudf+2AEAYbwMvOji0xu5bI7urYQkSdea
 F+uNJhmRVahyTUpBujFF2RQctbzblrwPKcNW9KuBnuY4toiRb52R2oATlZIO2prPiRN1Zsj
 M3NadRN7UIkIC05AHuuTQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:C0NmrZ/ld/g=:0SyXjAiDGlDk3gGd9bxFSn
 7e/U6B62MM3BZFOOgZohMwnUe9PShY8wpPvqgBV+aI+/0slpG8H2EgY9IbVCpzMl6R9Mfq8l5
 BAFjb1qv9cGe1X2w9AtNI2IHmb4myjvEiirbvUfPWH8ut5/uGJ3NUm8Piz0p+PkTvGvhWgIkS
 U7n89/8qx3lKWNm4AtBfCmDAhQwJDN+XsH5/3p5FF/e7mchMJmG9ZASDcHPIu1LCSAoAJoK85
 /E4IbNpYlmk+je6GL+whlHu8D/lFHiMUi5bgrkUHNCT4Zd8A4VSMtTIjR3j8ZblIkBBE3ktwr
 pJVcxFtkgR7CgYFPBxwJ/zxWGVBWDtE1+F0RbiphnFSkFBcA513IJv0H6qVicGH4TgIcUdNf3
 8kwDgIOD7xBGSseAoiN+7Ey21HqoFuQcZNKmHC/1uM6lxYwl+OLjhgQSX6UbWY4jfJbTcY1y6
 Ur23/kd9NxcmndmCACEO1joDffY8+wo4syjviHcxqzAw2SRVCO5RS4Gu16zW9zgeFspowH8kK
 IvCdbwX9Nbcxj8pxXd3AVctL981ROJW+hNlzD9KKE+f/szWBtE3++y+ePs4V7FMMOdzQ/8mJU
 talIDizIdTOYG6uZG/RmMDmkGcqx7R2T+BQ8Gvzv/Op0hScEyHCeDxEPHotrH9ap1KK6CU+fb
 +EuurNqOocBOXLnuVyCh1xi7gTOubG91XGXe0d8x9KsyYqCObqkBFg6fs8RmonLaAsOUVMqvm
 0ofhKtoGjexlKZ2Mb2gpjepS3SWRhkWCN09h+oG5f9nSH7xR8ozBJGFP1r01XOIoqBUTYgiGj
 aVhmHCDeLP2Va9hQQV9OWDw2yzvCJaqsJ4PyvNBqyDMyo8HkBiSylzQ0UM9OT4leeg6kQoUSA
 Pg2iwHOsPshSn7bpBJsj5dC2GPrg4S7honojJUQwCi3BJF4n/f6hGZ/9mJe9H71EuOV5cQmlU
 x8dyO63Pp6VRN6ZUzrFrUm35cRRE0TVm+ZHsM2aD2g44ScbjIqSitEkJCm+7OzcX/pE/n/+L7
 kbyjr9nhsTSnjkQLzU9Qe5YSTD/H/ynLMSBbJdJbr1dvcd0MzqbEM9rtUfpPP1h0Zl2uy8OpO
 dBVsG4e7UOUksU=
Subject: [Buildroot] [PATCH v1 3/3] package/nftables: disable debug build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/nftables/nftables.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index 6a27975a53..2409eb0571 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -10,7 +10,7 @@ NFTABLES_SITE = https://www.netfilter.org/projects/nftables/files
 NFTABLES_DEPENDENCIES = libmnl libnftnl host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 NFTABLES_LICENSE = GPL-2.0
 NFTABLES_LICENSE_FILES = COPYING
-NFTABLES_CONF_OPTS = --disable-man-doc --disable-pdf-doc
+NFTABLES_CONF_OPTS = --disable-debug --disable-man-doc --disable-pdf-doc
 NFTABLES_SELINUX_MODULES = iptables
 
 ifeq ($(BR2_PACKAGE_GMP),y)
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
