Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D968C001B0
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 18:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A71D882089;
	Tue,  8 Aug 2023 18:49:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A71D882089
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ckWIf8jl_c3s; Tue,  8 Aug 2023 18:49:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E524A82055;
	Tue,  8 Aug 2023 18:49:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E524A82055
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D7F071BF330
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 18:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BECD5401AD
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 18:49:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BECD5401AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vqsz3SDTfyee for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 18:49:27 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7EAF5402D4
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 18:49:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7EAF5402D4
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([89.144.222.147]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MkYc0-1q5gGQ1OUI-00m5hd for <buildroot@buildroot.org>; Tue, 08 Aug 2023
 20:49:24 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Tue,  8 Aug 2023 20:49:16 +0200
Message-ID: <20230808184917.4929-1-dalang@gmx.at>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:6FiUsRiJX6Pb9sbT+eRc7qMYl5hAVhfFqdvGcFZmw3LfVfwLHMn
 cXELkjzFXdJhTaRiMoG2q/WR1FIcsws5JmoXg7zYQY+dV4mgZmDY3ur6vNrcdy87Odvp+gn
 bnAp9Vuxw2y/sqckSz+PjK1f071aDAfmRaIsXrOwAXYieX+Yixv+MJo0BAlIgHjrWjFjfA+
 3yya3SDrk/VPJCrFA/0LQ==
UI-OutboundReport: notjunk:1;M01:P0:84w8gEJzxtw=;+wGOrtcasslKSyGYe6Bk9Ku4uE3
 lNLo609gtt+crnzBLox4F+QczgAQ7KqVBCDNBuBax4zOksxrqZViFxQze82bd2e/2AeWGns8G
 JUJqe7hmIOAvyAqjlsH+1Qr0I21OG0EfjpLKL8QcDzp0RKjc1uPQ0HPwFAjYDCLxtSMLiXE8z
 49oRAQ6HcZzC7YA4QrKBXxVYj5idm3PzRYuVfz0US5OvtrmMCMUyy3tXtXT8nYxmA76q2Enlz
 WDKsGHQCtVPH8Tp56Op6Ys867XOnoPBJeVzZr+8Nqg8UpQOuDizJoVIeSLJ5ByEsjMmkzgxsi
 M/WCU/WxKTahbQAi9e9MEbbqYsGke2yc1ekT0p9vMKWW6xnlh288JmYtGshYF7mzV+P2m2Lfr
 IrSXeV4q0hCc9skGLRBPHDMi7R4IwpFxiODGv69by9GjigXyRowzwS4/dvuPQe+8hwldAfslY
 zR+Up1kaKktQiBCTVLw48JOnpvmayNsnOhw6skesfR2loJOTlrKkKeC4IYhosANQH+j6wEevA
 XcvsX18qc1cQFYapzcRykiMEs0CmCkRYj4fDgU5X4qeLKVZDyp8ICXnJfPTkzAv4PaVy8uTNQ
 D3bAxTmBL0LHKdEXtOrUqyEMzzm090mbpRE7TyZk1aHAA6EjSorJsZuYzNp+27dAZAxIxZXyN
 tHxt5CsIH8UN7Omfv5/om3AkO/iEpIRCnYq2Bgn7vFrwaMnL1yEnt5ePRghbK6hh48ClP4cJG
 wxepIR0PUNsMlZhb9QyGGcTqHqFI+oBV+qzCpjrCYQCqQQsxguW0X6bzJffMi0RQhvo8bfM0Q
 wP/7weOYGq2tvPCibxUuLyH4x4I2lxcawVfW1V9p8/0yoGgsMAet6KOszOjVBpJuisnJSVUeA
 taiXWPCe8w7zihjGf8y4K4U3qwNxTj6gFlJ7z5i6KL9+J5e5ti9/BGbxX7+4IFCvjgtLxmSes
 hgLO79l8HXJpu8cwMo3eN/y5SB4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; 
 s=s31663417; t=1691520564; x=1692125364; i=dalang@gmx.at;
 bh=yNGy/37Yy1RfaU5K1A7r4xT7jie8Lu9T94EFz/IGu3g=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=EXwsj36RetqBbZeSzwbv4idmmK1+GI+CbWhgpxm8rYJDqXDLZuhH8RfWFavstVPeIpxc0Ao
 85ynYHpfi8fDM38x/G1yDg5xnQwAWsQOvwd6I0lmSgvNXd+nLpEskL6S4S99IIgp0Pvn88i+K
 SEBoSC+o7KS9O8XLnF56FiBOw6ue//xVV+TO1HFimqadrv5dg39HJqD5j4ArEpX0G7wuPeOyv
 c4lnzV9WHXj8drjGSxDdLl669fXPBnGjylggkwimwZ93CTVGJ/6e4Lt+s/ow0VjUttESXu9jx
 3v7dvQcaEt819DFraghRsAAzBKfgltR47kCYO+O8AhZxmlKc7I9g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=EXwsj36R
Subject: [Buildroot] [PATCH] package/yajl: add CPE ID
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

yajl_project:yajl is a valid CPE ID:
https://nvd.nist.gov/products/cpe/detail/CD8C46A4-151E-4DC3-BCE8-4C322E9E10DB?namingFormat=2.3&orderBy=CPEURI&keyword=yajl&status=FINAL

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 package/yajl/yajl.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/yajl/yajl.mk b/package/yajl/yajl.mk
index d14a68b402..cd23c8728d 100644
--- a/package/yajl/yajl.mk
+++ b/package/yajl/yajl.mk
@@ -9,5 +9,6 @@ YAJL_SITE = $(call github,lloyd,yajl,refs/tags/$(YAJL_VERSION))
 YAJL_INSTALL_STAGING = YES
 YAJL_LICENSE = ISC
 YAJL_LICENSE_FILES = COPYING
+YAJL_CPE_ID_VENDOR = yajl_project
 
 $(eval $(cmake-package))
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
