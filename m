Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C1B9D0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1530B414F5;
	Wed,  7 Jan 2026 18:03:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6e5DOtOk5SKw; Wed,  7 Jan 2026 18:02:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FD7F41546
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808979;
	bh=cmv4UKNmKhaA/WRP/iMOwms+V3hMLsJ21ozAIvF+x5A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hulJjsUuPe9bEIiODePN2+dYOZh62knMKUHksxJe8JEwdIh8DBIy/JP0d5jGd27Mj
	 5/kR15oefnwcaGzfdq/ifmlpagn0dkuwhJKzZ9n8Ggxx+lLNb+88c49ukVjOEJ0wy8
	 IbH67v621Z5KZzkDfCTw0QKqPquRGpGPSraGG9O2qOQepzQHUKyv4ECEPwFNpTbx0z
	 ouxuNnipzaDBXd97H4twxfFrEzwCqsx+uk/KVGZB5kd5sLpEpEEiNigw/rxEI+IcZx
	 lnamOdDlc35JMv4Wo1uQ4FGrbsBdwe9HqwsKGReV7BcgHM/7uuHOqwUso4e4fus9rX
	 Z5yK7+vjxknDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FD7F41546;
	Wed,  7 Jan 2026 18:02:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 05A0B25B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C33D40DDE
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qsv6XIlcJ91a for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 782C140B6D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 782C140B6D
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 75BD9811C5; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 08:59:20 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 04071794aa2ffc6811e0fd9820ad07373cb99996
X-Git-Newrev: 4beab2c92f61f7ae15cbd5fe69f01aa320717022
X-Patchwork-Hint: ignore
Message-Id: <20260107180114.75BD9811C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/python-httplib2:
 fix sort order of dependencies in Config.in
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

commit: https://git.buildroot.net/buildroot/commit/?id=4beab2c92f61f7ae15cbd5fe69f01aa320717022
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 84c9fc51cc8325611310d5a7b7e3176b790cfe48)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-httplib2/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-httplib2/Config.in b/package/python-httplib2/Config.in
index a029814f03..9647bd495a 100644
--- a/package/python-httplib2/Config.in
+++ b/package/python-httplib2/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_PYTHON_HTTPLIB2
 	bool "python-httplib2"
+	select BR2_PACKAGE_PYTHON_PYPARSING # runtime
 	select BR2_PACKAGE_PYTHON3_ZLIB
 	select BR2_PACKAGE_PYTHON3_SSL
-	select BR2_PACKAGE_PYTHON_PYPARSING # runtime
 	help
 	  httplib2 is a comprehensive HTTP client library, httplib2.py
 	  supports many features left out of other HTTP libraries.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
