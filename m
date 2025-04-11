Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B4CC369A9
	for <buildroot@archiver.kernel.org>; Fri, 11 Apr 2025 10:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43FE1414FA;
	Fri, 11 Apr 2025 10:45:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XhRx0IMvCn4M; Fri, 11 Apr 2025 10:45:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A4AA4167C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A4AA4167C;
	Fri, 11 Apr 2025 10:45:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 14A281BA
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 10:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C973822EA
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 10:44:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c0JZRDrAoLgr for <buildroot@buildroot.org>;
 Fri, 11 Apr 2025 10:44:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2425781C56
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2425781C56
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 10:44:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 222C1843A1; Fri, 11 Apr 2025 10:44:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 11 Apr 2025 12:42:45 +0200
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: ee7c227b1607db81ceca0727f63202515ffb0024
X-Git-Newrev: 0800072403b7ad198e6f346e98592986b50ae7d5
X-Patchwork-Hint: ignore
Message-Id: <20250411104451.222C1843A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/python-twisted:
 fix cpe id vendor
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

commit: https://git.buildroot.net/buildroot/commit/?id=0800072403b7ad198e6f346e98592986b50ae7d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

twistedmatrix is deprecated, twisted is the current cpe id vendor
for python-twisted.

See:
https://nvd.nist.gov/products/cpe/detail/A38171CB-8F75-4CE2-8C00-229D4A8F1C0E

Signed-off-by: Gilles Bardoux <gilles.bardoux@sagemcom.com>
[Julien: reformat patch and add nvd link]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 1747ebf29b577f4b1ef03b0633bedd525ce9947d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-twisted/python-twisted.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-twisted/python-twisted.mk b/package/python-twisted/python-twisted.mk
index 424efdadba..90b74bc9a3 100644
--- a/package/python-twisted/python-twisted.mk
+++ b/package/python-twisted/python-twisted.mk
@@ -10,7 +10,7 @@ PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/b2/0f/2d0b0dcd52a8
 PYTHON_TWISTED_SETUP_TYPE = hatch
 PYTHON_TWISTED_LICENSE = MIT
 PYTHON_TWISTED_LICENSE_FILES = LICENSE
-PYTHON_TWISTED_CPE_ID_VENDOR = twistedmatrix
+PYTHON_TWISTED_CPE_ID_VENDOR = twisted
 PYTHON_TWISTED_CPE_ID_PRODUCT = twisted
 PYTHON_TWISTED_DEPENDENCIES = \
 	host-python-hatch-fancy-pypi-readme \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
