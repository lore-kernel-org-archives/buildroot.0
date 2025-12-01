Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8472BD43370
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F5EF828D1;
	Fri, 12 Dec 2025 07:55:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SKDJhYnk2zpV; Fri, 12 Dec 2025 07:55:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05C87815D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526154;
	bh=Gv2wqIK6OEPEQY4XoXl/n9o2NqMT8mbTmWnXA/OJp2E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AI9oS+508iURKcvpSPwt9YQ6qB0LVwd81vLF4jafeTAjttHn+cUrG6iaa/APWtTLv
	 rm8qSy79S5tsM51LZBweHAkcHsZK/X8pa1VkDvdc8/4PVMjOlnOHEb1+ROEt5Z5UY1
	 HufgaRbPbbxJh3U7dfMsSZQgUk/qRNChccaYT+2WNx1Q+IB+p5dYxQlPPV+/zJiW6h
	 AvQCwBxZG51DndOhoGWGjJIZsFHAbl7IQZPZq9hr0+1vdMPMbNmT+Hw++2CsbUvdCm
	 jVC8s39FxtwZXDmCYbciMVAZpnw0+3n8n9wkPT9BQwPF4m6D4hmXFNENM4rBnLNue9
	 gWbvBHak0vhdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05C87815D7;
	Fri, 12 Dec 2025 07:55:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B1A3B2C1
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF658608E2
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W6vhTxFey1LV for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46544608D4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 46544608D4
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4384285C4C; Fri, 12 Dec 2025 07:55:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Dec 2025 21:03:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c8845983ae593553b22cd94876fd8a2491b36c43
X-Git-Newrev: 5f6eb0855a7de7e27929fd52a74bb6d4a9897e1d
X-Patchwork-Hint: ignore
Message-Id: <20251212075536.4384285C4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/frr: install headers on staging
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1182347992047917659=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1182347992047917659==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=5f6eb0855a7de7e27929fd52a74bb6d4a9897e1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since FRR 10.5, header files can be properly installed [1]. Enable their
installation in Buildroot so that packages depending on FRR’s headers
can build against them.

With these headers available, the Grout package can build its zebra
dplane plugin, which allows FRR to configure the Grout router instead of
the kernel for packet processing.

[1] https://github.com/FRRouting/frr/pull/19351

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
[Julien:
 - move FRR_INSTALL_STAGING up
 - add "package/" in commit title
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/frr/frr.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/frr/frr.mk b/package/frr/frr.mk
index 9282e13fbd..af94793bd1 100644
--- a/package/frr/frr.mk
+++ b/package/frr/frr.mk
@@ -23,6 +23,7 @@ FRR_LICENSE_FILES = \
 FRR_CPE_ID_VENDOR = linuxfoundation
 FRR_CPE_ID_PRODUCT = free_range_routing
 FRR_AUTORECONF = YES
+FRR_INSTALL_STAGING = YES
 
 FRR_DEPENDENCIES = host-frr readline json-c libyang \
 	$(if $(BR2_PACKAGE_C_ARES),c-ares) \

--===============1182347992047917659==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1182347992047917659==--
