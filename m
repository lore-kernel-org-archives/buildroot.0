Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E1FCA0EFA
	for <buildroot@archiver.kernel.org>; Sat, 23 Aug 2025 04:59:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD89F80E54;
	Sat, 23 Aug 2025 04:59:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RsiizN9lmfsz; Sat, 23 Aug 2025 04:59:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3DDD80D3E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3DDD80D3E;
	Sat, 23 Aug 2025 04:59:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 64CC671E
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 04:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B81440E9A
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 04:59:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kSfL06ozVogV for <buildroot@buildroot.org>;
 Sat, 23 Aug 2025 04:59:35 +0000 (UTC)
X-Greylist: delayed 305 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 23 Aug 2025 04:59:34 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ABB7440E16
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABB7440E16
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=dalang@gmx.at; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ABB7440E16
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 04:59:34 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from thinkpad ([213.147.165.25]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1My32L-1ubjtV1yf9-00w2HP for
 <buildroot@buildroot.org>; Sat, 23 Aug 2025 06:54:26 +0200
To: buildroot@buildroot.org
Date: Sat, 23 Aug 2025 06:54:09 +0200
Message-ID: <20250823045411.255895-1-dalang@gmx.at>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:AyhZ0I1hhMRBtLLGPXovRu5Sc0zSkJJOmpVyQ11s5OZjXgqs1nw
 31LX6h0m29FJf92ktOPlxxT5mkSY4yIbN9GA38VGPkvuKuPaBXCMwDXrPCCKaKk2lgr05sO
 TwqGuco6RmmfB+4h0OZ+zukoAy5elx/S6jeHpFK/1tkkVzLKhafaMSY5eCNTHkvxdOJ0IQ9
 MvKEM/6I9PeIhaCfTSlTg==
UI-OutboundReport: notjunk:1;M01:P0:BDhE+JU0Jo8=;GfU0RZoz9ezm6XBxySvph7Xu8xN
 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
 /18Si6ZSOrmDZdV5sC7+GaUeYDtVgUDR3uT1R
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.at; 
 s=s31663417; t=1755925172; x=1756529972; i=dalang@gmx.at;
 bh=xB8sZiFzIoYmTbhnavSvWBLGe7FobXz9wKFDXbRRpMk=;
 h=X-UI-Sender-Class:From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=ThCntU4T3KpqKZ+XkbVY6NEu/RajtFD7fl1R8RJEUdLywIFG6nmJRxXMqDBie0MN
 qfzxm3h9Bo442KrZoaLq/GeZgtllVVkcdThV7GAW7i1W/h0sqvfcjIOaM35UkA6Kv
 YTUwO6cBOBFPNHzJSKSYs6A9mJAOhfWpmkUmtb/54YviZeXoE3xbtCezkEinECEc9
 zZn1YVbzA+xwd9pYh9pQzPqH9ZVrWcSM8BRZZd87mn9eFZ5fHgEqivmmlaNpSm1nT
 BjHu6672oRxHZ7e7u3FdJ/wCi2LdvNztqq99gWCDgmLkFoLJlJKlH2QIloO9Tt/1t
 sOkpEvxnLYUQWgr7KQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.at
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.at header.i=dalang@gmx.at header.a=rsa-sha256
 header.s=s31663417 header.b=ThCntU4T
Subject: [Buildroot] [PATCH] package/vim: security bump to version 9.1.1665
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
From: Daniel Lang via buildroot <buildroot@buildroot.org>
Reply-To: Daniel Lang <dalang@gmx.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following CVEs:
- CVE-2024-41957
- CVE-2024-41965
- CVE-2024-45306
- CVE-2024-47814
- CVE-2025-1215
- CVE-2025-22134
- CVE-2025-24014
- CVE-2025-26603
- CVE-2025-29768
- CVE-2025-53905
- CVE-2025-53906

README.txt got updated three times since the last bump:
- [0] updated some wording regarding who the developers are.
- [1] updated the link to the release archives
- [2] updated the goals of the project

[0]: https://github.com/vim/vim/commit/b75825f749cf87feb9ae8e7e5327bd2efe707c86
[1]: https://github.com/vim/vim/commit/4225f28855c5d3023662b3a90a70b22caf9b6ade
[2]: https://github.com/vim/vim/commit/2bfd1ee161e26ece8e5a72cdca4fff22d11728a2

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 package/vim/vim.hash | 4 ++--
 package/vim/vim.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index 194bcb4378..e432f40a53 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  0056537cb57190aa41c12ba6c2ad04ce10e7f714cde4c1fe7193a37e1c44db46  vim-9.1.0145.tar.gz
+sha256  596c75a5a2d6f93c129cc53c46fbe9fa0dcad1aab67421dc707eb945d22afa24  vim-9.1.1665.tar.gz
 sha256  0b3f1f330cb1b179bb17c7c687d4cec601e0aa3462bc7f890ad4c3888d37d720  LICENSE
-sha256  7a2f621c8496396dae5eecdcc4dccff9d534dff4627193d3ebf7fa6d2cb27042  README.txt
+sha256  ee1d0885bbc4a95a24e49873a075391bdf26b69d13758e30f3d9271f8f42bd2d  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 7d51a6ddab..31ea637a8e 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 9.1.0145
+VIM_VERSION = 9.1.1665
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
