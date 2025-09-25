Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81BD9CAC5B9
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54AD061598;
	Thu, 25 Sep 2025 20:19:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MKedVCherrfS; Thu, 25 Sep 2025 20:19:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6798061569
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6798061569;
	Thu, 25 Sep 2025 20:19:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DDDB1EB
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:19:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CBD0C412B0
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:19:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sZkz23Bptts5 for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:19:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 089EB412A7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 089EB412A7
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:19:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0626F86449; Thu, 25 Sep 2025 20:19:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Sep 2025 22:07:17 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 5b42ae0e05a39bf3c0d8af63105f6b9b627274aa
X-Git-Newrev: 94d8e931a586b4c1dba790713b66cdd0569fcaee
X-Patchwork-Hint: ignore
Message-Id: <20250925201942.0626F86449@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/asterisk: fix
 deprecated CPE ID
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=94d8e931a586b4c1dba790713b66cdd0569fcaee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

The CPE 'asterisk:open_source' has been deprecated in favour of
'sangoma:asterisk'.

See the following for more information:
 - https://nvd.nist.gov/products/cpe/detail/7FC01D7D-5AE9-42A8-B31E-A99E745E5BE5
 - https://github.com/asterisk/asterisk/security
 - https://nvd.nist.gov/vuln/detail/CVE-2024-42491

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 505cd0d36705dd1d30d7ec154c7456c6605173a4)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/asterisk/asterisk.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index ec67632ef4..568a5bc150 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -21,8 +21,7 @@ ASTERISK_LICENSE_FILES = \
 	codecs/speex/speex_resampler.h \
 	utils/db1-ast/include/db.h
 
-ASTERISK_CPE_ID_VENDOR = asterisk
-ASTERISK_CPE_ID_PRODUCT = open_source
+ASTERISK_CPE_ID_VENDOR = sangoma
 ASTERISK_SELINUX_MODULES = asterisk
 
 # For patches 0002 and 0003
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
