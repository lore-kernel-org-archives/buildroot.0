Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E3DED2A537
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 20:39:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 630E140780;
	Thu,  4 Dec 2025 20:39:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mEhxsgRN59xF; Thu,  4 Dec 2025 20:39:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 910CC40797
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764880763;
	bh=f9LCJKXBUN4pizBhrHjHjZ/n1PeqPtTjStDI98Q1Egc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fcJv9d84kBwijEISzBIojlxeSFLep8xKIOLt6W8kNdCwptSpK1fClqdEXk9kjDU4f
	 w5OzMprFoColQKBP11i7wyew1ZB/lJzGQtD6yiIdJDRugmX276O/Va/l9ts7AU9uCv
	 2xHuElLXX0/+udFbLLbIbsPY86Pio9GwjIHwUOmhK+LvMRrWXvzKbyi2R9yqnNRknG
	 sL9F24hEj8146WtFQ82bcDo1XiEJD0W0Dn408mx3simuWwnXW88rJNAeqYYQJY3tRj
	 RJZRSZyOtpWFPJy2Dhxw8tvm7SzD0UmI+0GTIOW4si2UG74ygfgMctplY6rVIxQSez
	 WaTvILJjnhWRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 910CC40797;
	Thu,  4 Dec 2025 20:39:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0452C345
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD7A041089
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:39:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XPGqQfZ9yUt9 for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 20:39:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2DF94035B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2DF94035B
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:39:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B4A7585FFC; Thu,  4 Dec 2025 20:39:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Dec 2025 13:12:52 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 11e5e88ad14c027728ebfe33ea44f37a325967aa
X-Git-Newrev: 784ac62c9495238ef2829496c1042a0c14c8ca26
X-Patchwork-Hint: ignore
Message-Id: <20251204203917.B4A7585FFC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/swipl: bump
 version to 9.2.9
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=784ac62c9495238ef2829496c1042a0c14c8ca26
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

For change log since version 9.2.8, see:
https://www.swi-prolog.org/ChangeLog?branch=stable&from=9.2.8&to=9.2.9

Fixes:
https://autobuild.buildroot.net/results/158/1586997a84236b678249ac45b83b4e330e727f39/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: add link to change log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 743bc22135cc47e91f7bbfcdea4aa74a66c5e034)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/swipl/swipl.hash | 2 +-
 package/swipl/swipl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/swipl/swipl.hash b/package/swipl/swipl.hash
index 20278cfb8d..efc3aa963f 100644
--- a/package/swipl/swipl.hash
+++ b/package/swipl/swipl.hash
@@ -1,4 +1,4 @@
 # From https://www.swi-prolog.org/download/stable
-sha256  b331637a57c913c49edcfcb10ddcf6c031278ce93d2411d54542778531abb5c7  swipl-9.2.8.tar.gz
+sha256  53f428e2d9bbdf30e53b06c9c42def9a13ff82fc36a111d410fc8b0bc889ee2d  swipl-9.2.9.tar.gz
 # Locally calculated
 sha256  770594d0f4463b71f1485f00e4bc5cf4b6f667d62ef6bc9bde2fee236541992a  LICENSE
diff --git a/package/swipl/swipl.mk b/package/swipl/swipl.mk
index e29b8d8f46..20faaefe7c 100644
--- a/package/swipl/swipl.mk
+++ b/package/swipl/swipl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWIPL_VERSION = 9.2.8
+SWIPL_VERSION = 9.2.9
 SWIPL_SITE = https://www.swi-prolog.org/download/stable/src
 SWIPL_LICENSE = BSD-2-Clause
 SWIPL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
