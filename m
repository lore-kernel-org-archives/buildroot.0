Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E680FD3C546
	for <buildroot@archiver.kernel.org>; Wed, 10 Dec 2025 13:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C917740E72;
	Wed, 10 Dec 2025 13:20:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xu1H0nB3eO3K; Wed, 10 Dec 2025 13:20:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F077240E60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765372801;
	bh=CGjfr+SXdDtN6IpKncY/QFmE95679cikN0qVvUdjCdw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TmhG13w+m8rgXomForzXX5b+HnYRkH3Ai78ezVIWZBYoVK9QyLkrdYulo+2z8ub6g
	 iuUCz9Qymytt8McQy5Q5wsGsYcVuUYVLiOCb1YvBdAdE4yMmiIMnoperqqa5FytkmI
	 6rEVqZeLATOXWMBdji4hti4NOycO8CoU4mWY9Os2W+uer93cq4TXLzYE9aHscimlhw
	 m+sIcrY8aHsARoYvdfLbRBN1Ic1lFy+nB+PdeiifM1TAsz24MhwOexVaw1hmhIOf0b
	 yUdIp3TLtPMd0ySwBF1LzBtKGjItHCC29tzlHSolFeqkP54mVCshFOO/m5LeJz/d6X
	 mVAMnaxGVjGug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F077240E60;
	Wed, 10 Dec 2025 13:20:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 502FFE7
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 13:20:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36B1B40F24
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 13:20:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ls6bWF3pCGU7 for <buildroot@buildroot.org>;
 Wed, 10 Dec 2025 13:19:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.72.192.73;
 helo=mout.kundenserver.de;
 envelope-from=nicolas.cavallari@green-communications.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8683C40F1A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8683C40F1A
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8683C40F1A
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 13:19:58 +0000 (UTC)
Received: from evilbit ([88.171.60.104]) by mrelayeu.kundenserver.de (mreue107
 [213.165.67.119]) with ESMTPSA (Nemesis) id 1MiIlc-1vztQi2ZL4-00g2HI; Wed, 10
 Dec 2025 14:14:50 +0100
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
To: buildroot@buildroot.org
Date: Wed, 10 Dec 2025 14:14:21 +0100
Message-ID: <20251210131421.16305-1-nicolas.cavallari@green-communications.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:BTeVe7WTG7Za1DeWw3I6Z5hGm+hjAvKhwmufeVF+9L9Y4W6ILLf
 Kj2NyEW4JzI3t7CyBlSOoD3LIvzYfxslTF6yx2+l9ya99Ztca9UvaYHaCdt0yrv96ZK1nPL
 Xx0akWZb6YyDCWeEKCNSYaelPKaCCOS20xAfZ7u8jq3PDa+dOf2Y2Hl9W6A9erMUpKAmDRm
 qhpplGafXA5wQVB+s/wXQ==
UI-OutboundReport: notjunk:1;M01:P0:uWFLu13YK8A=;DNlHLj32CNu9TQQOgK3T41L5O5+
 k4045Hb3fDfMLMwfh8dE6AEylgpFbX/d5Fi04ASrQf/fv1QVeAwhuWukDvcIJqKzn2XBs5nSw
 box+vHFEaJUmGGwD8Tc0Elv8L0rcUR7uNfK41GTaPipcr64O5CVbXeIO1hCIHJRLwkCbC5tRB
 r4+1bzgcLnUPEoUROWjj3YNk44PBLIKyfGqTBIbx4P1oghNptikr31n+Wbq2n5+ZVn3lKmeD9
 Ji5Y94H7aRQTf1JTSU0Y/GStNZX6YZEG+rcDp5bBZ9Gw/mCCqq+k2t1tYkG6C9OQD7LMweT8q
 bVXwF9xirKbYj6Wcm38qSZPAe5B3be8LTYrwaD9l2QA1l0VMeVFG+xWekxGFVYP4uB12Jh4py
 3WkXe9LVGHcL5yVAww0fPhWDhS6SlU1nL+mP1zkM6ls9p8J34bobuvNERFOasOCbbI+c95pWk
 ekku474Ei9B5HYhpgUUxZEw94TdpdN25gQl5vG8MsQVzOVMeGy5jXU8dxcIfMk9jcNBEYFpnK
 rb++qRCp3EwxuMNui44taCqdfeQNwKQM3hVJZFeNla6Me5tttZl9u8lji2zuG3i1JTaTMg2af
 1wV8dwP5w1xdrWAiqh/XCdHiuLy07aWwi2glWL1xBNrM+wduyA28ORQytsYI/6kbsNL3ioh2i
 Op7/fTA5OOQaaP2xm4jiHZSeh/qjsY/GN/YDVtrUU7WAekbDBNLd8+YSLi3XoiBqP/P/oJBcM
 g7AxjriPqrEtUgMxz/MNoTEIMRZRpVjymgSXn/q7ttxG2zI9DbBPn0sWNRjW0n11ASx+eyczH
 OjQn3CSp37EGNHY7Wp177ep2LO/W5NUxbsYnKByf8CjKMMkyyQzLl/NDuMb0nhRXwUp3XRUyC
 wCBr+2YYKCOU8VWlVJuYlpFVfuzn+pw78dpwjILVdJw2CqY+WZNBVLOQAa1PHCUMLhsUQJR1G
 mXxRAYUkFuZyr4iMxqQIGv808bmZ0x/K/aG4vl5vmxr5QWANkJtYicROIbIcEWly3gK1t+mC8
 bMnFawUdhpUgxBwUk3fugKfrvM9J4aQEx7T7fzhd8ttjSB6dse90yAy33bkM7WPhGEarga7aO
 pCIrIcoNYrGFOONP9d2Pkf0KezUYpmkgtQJMTIqzLIlWb1V7XGoDLJjvU+fPxvpv4/cPuGL20
 Zri6zJ59JtyXIXj7QYJqgfTPcZEIqhGhcLmMKnCt7h4HzZIxwE4LAMksFT0OlK4mzleYe+V57
 Ry6N52JQfyFD5TiLcH0VyGdCb1MBXrtJ0Thvb7mLo/BtZE8/6aubquCOB4OgUIo7xJ3GUov4y
 /bhy5VTWjVwpdC3TCX9QF2Awr1WxCLsD9v7y8wTyPzcsNwHUq3xWLmAc9cp9xqNu64nOqiFQx
 0IsHIHPpBvPt3dARngsen8Ry0mTBELChdslg0kbGsG2dzNdFZwbQuTdRTgQOiNzETmJAeZvAx
 C6FM4E0FO8DKkBdrykHHXKTvdcuvJMzQgy1H7iYcSarx2Z6KS/i2PQnS07k/2W8ixlX5CXHMc
 PQWUpur6FeypT5wlgxUiOrWyrSn17NIOv7U/lmY5s85i2jAAofhE8vNqIH7zkb8TsEQDkImSh
 SaCUyckS2EXaHkhQEmWz1VUzGbcb4SYxoQYbLFcxfKRCPgL6eZhF3hYYqYCf3vLJ7jCoNeXSn
 jDcWV+XSXQic8iA/5uU0VYvxFtjfJbDlNPcqZoxuSiqI7H7fqZlNbL0agoJ5M+iDI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=green-communications.fr
Subject: [Buildroot] [PATCH 1/1] package/libgit2: security bump version to
 1.9.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix two vulnerabilities related to SSH support:
* The external SSH execution code lacked shell quoting on repositories
  name, resulting in arbitrary command execution.
* SSH public keys were zeroed by calling memset with the wrong length,
  resulting in either buffer overflow or incomplete zeroing.

Release notes:
https://github.com/libgit2/libgit2/releases/tag/v1.9.2

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---
 package/libgit2/libgit2.hash | 2 +-
 package/libgit2/libgit2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
index 8c9b210581..e8c155c994 100644
--- a/package/libgit2/libgit2.hash
+++ b/package/libgit2/libgit2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  14cab3014b2b7ad75970ff4548e83615f74d719afe00aa479b4a889c1e13fc00  libgit2-1.9.1.tar.gz
+sha256  6f097c82fc06ece4f40539fb17e9d41baf1a5a2fc26b1b8562d21b89bc355fe6  libgit2-1.9.2.tar.gz
 sha256  e3712465634e97cfd850822a4eb5ac7d2f8a10f753189366d5a2060046f28288  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index f615484edb..34cb67929e 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGIT2_VERSION = 1.9.1
+LIBGIT2_VERSION = 1.9.2
 LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
 LIBGIT2_LICENSE = \
 	GPL-2.0 with linking exception, \
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
