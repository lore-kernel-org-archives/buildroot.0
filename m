Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18AA4D0D14F
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E695C80CDD;
	Wed,  7 Jan 2026 17:48:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DfqTA9S04eEa; Wed,  7 Jan 2026 17:48:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2167181919
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808129;
	bh=XhzxRfbsRaIWL1sHrgjs1IT12TcCknXHSzeEnv8ZC9s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=a+3aBUAVlZiFkoFsnBZ9swu/4Djrk1tyT9MRZ6kgnMIetR7NvLPIf5VS0SxMC2UQ7
	 QxWEQoUt0MfS2f8k5r3i1sz3x7yeIHIkFmLngBSoKypLqSFbzhmqXoQJ0cFhko2lSW
	 v1U5iaoAufpDeODCsz2uf3ZvS859EnVkUOfV40wO71rXET1iOqqqVJxZud5R96INtP
	 ZmikImc99/RCHNWZyC7fUXHNzRXSFlAz0TaRIFy07Bx1jEgSlbS1HVU4YMpR0ofv10
	 Q07PBqfGMyBIRQq1Vj04owceFa3t8sTPQOxoyn3rtO1+GwmA5Q2J/R9/TOUUGER2/z
	 +vybMgFXptD3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2167181919;
	Wed,  7 Jan 2026 17:48:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B3E325B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0D32607D9
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gZNLRgF17_0i for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72FB1608AD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72FB1608AD
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 72BF781917; Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:19:30 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0be4ecbd7ed8ff8d37de0121d9911eee1bb35400
X-Git-Newrev: cbe5ba25c004fbc2462224a04f84744fcfcb3d5b
X-Patchwork-Hint: ignore
Message-Id: <20260107174644.72BF781917@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/dovecot: add CVE
 trailer in patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=cbe5ba25c004fbc2462224a04f84744fcfcb3d5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit eb0dde58b3f0fa6cd3120343094634fc8a13412d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dovecot/0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch b/package/dovecot/0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch
index 04b8f5392a..99a2b83563 100644
--- a/package/dovecot/0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch
+++ b/package/dovecot/0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch
@@ -12,6 +12,7 @@ Fixed by moving mechanisms and username_filter from struct passdb_module
 to struct auth_passdb, which is where they should have been in the first
 place.
 
+CVE: CVE-2022-30550
 Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
  src/auth/auth-request.c |  6 +++---
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
