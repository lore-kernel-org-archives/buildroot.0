Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8DE2CAC5B5
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 914E4615B1;
	Thu, 25 Sep 2025 20:31:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rD2IoI6GNody; Thu, 25 Sep 2025 20:31:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 234E6616C6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 234E6616C6;
	Thu, 25 Sep 2025 20:30:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E055A12D
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9BD94412C4
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:30:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gRItbS-ddrAA for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:30:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 611B6412C8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 611B6412C8
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:30:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5F50D8644A; Thu, 25 Sep 2025 20:30:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Sep 2025 16:37:15 +0200
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 76aae2522e7942e844ac700913960a3407641dec
X-Git-Newrev: a21dde67e96de24d40b26b4f21ad026d5b39b77c
X-Patchwork-Hint: ignore
Message-Id: <20250925203022.5F50D8644A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x]
 package/python-aiohttp-session: fix deprecated CPE
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

commit: https://git.buildroot.net/buildroot/commit/?id=a21dde67e96de24d40b26b4f21ad026d5b39b77c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

The CPE 'aiohttp-session_project:aiohttp-session' has been deprecated in
favour of 'aiohttp-session:aiohttp-session'.

See https://nvd.nist.gov/products/cpe/detail/667389BF-3561-49F9-A61A-6C86C7B82922

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
[Julien: add https:// prefix to url in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit fdb540a00e72190a8cb2df370226a2e916f899b2)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-aiohttp-session/python-aiohttp-session.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-aiohttp-session/python-aiohttp-session.mk b/package/python-aiohttp-session/python-aiohttp-session.mk
index 8b8337e68e..1a69e55ca6 100644
--- a/package/python-aiohttp-session/python-aiohttp-session.mk
+++ b/package/python-aiohttp-session/python-aiohttp-session.mk
@@ -10,7 +10,7 @@ PYTHON_AIOHTTP_SESSION_SITE = https://files.pythonhosted.org/packages/c2/c4/d73a
 PYTHON_AIOHTTP_SESSION_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_SESSION_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_SESSION_LICENSE_FILES = LICENSE
-PYTHON_AIOHTTP_SESSION_CPE_ID_VENDOR = aiohttp-session_project
+PYTHON_AIOHTTP_SESSION_CPE_ID_VENDOR = aio-libs
 PYTHON_AIOHTTP_SESSION_CPE_ID_PRODUCT = aiohttp-session
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
