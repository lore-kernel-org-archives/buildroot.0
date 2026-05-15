Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20938CD4F48
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF28B8407B;
	Fri, 15 May 2026 17:45:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Prlayuh-CQCR; Fri, 15 May 2026 17:45:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2C7784551
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867105;
	bh=x0l+E/+yZoyd4sKK+ybRpi8ZL8QyJ/x9O95D/w5UXoQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=btbvpbr1azUdWd/AT3WJ4dks5WAX+O2IwcL3NrJAp1dfCDkq1QIStC2tHq69/hvi8
	 jD0tj9zHD7ywv64FNrefDYbJMzu/1QHixWIB2LM1yeTz6+xmky4sg8INdo9nHtnQM+
	 fbGghMR2DXFRspG/adXtiMHo+4FZfHpLvKls8Z3/H8sEG0wmRGR+rYn29/asPmP3Pn
	 iLCkpMHdGkHWT3Eiv4PL7eMprCH0f2r9Q6xHyJDVbclgu1PpNqOlDPWPI0qW2eNa2g
	 k0MA3O0JZ+VcWedmN3MpCtjv2Q8jC4CsgoQZesKjpkFRIvN/PN0pb7snavORdCCZdY
	 YVK1ykOprmnmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2C7784551;
	Fri, 15 May 2026 17:45:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2373723F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 45F8F616A2
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:44:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pJl_XhSkhrmk for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:44:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2878F6169D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2878F6169D
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:44:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 66951863D5; Fri, 15 May 2026 17:44:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 16:59:24 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0b36bd22e8e3d8198493ef5dc12bf2cbdc584e71
X-Git-Newrev: 3d586c429be838e9f55aabd21f9a269b53f15e61
X-Patchwork-Hint: ignore
Message-Id: <20260515174449.66951863D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 support/scripts/pkg-stats: run main function only if called as script
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3d586c429be838e9f55aabd21f9a269b53f15e61
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The __name__ == '__main__' guard allows importing pkg-stats as a
module using importlib, circumventing the normal module filename
requirements. This in turn makes it possible to test/debug individual
functions.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 8cde69e1011e82e44447803d6dbbaac96375d0a7)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/scripts/pkg-stats | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 5dcc812e2b..2b2194b9a5 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -1334,7 +1334,7 @@ def is_newer_version_available(pkg):
     )
 
 
-def __main__():
+def main():
     global cvecheck
 
     args = parse_args()
@@ -1403,4 +1403,5 @@ def __main__():
         dump_json(packages, defconfigs, stats, date, commit, args.json)
 
 
-__main__()
+if __name__ == '__main__':
+    main()
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
