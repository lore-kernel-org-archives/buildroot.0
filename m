Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3664EF99D2
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:40:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A47D961759;
	Fri, 13 Feb 2026 19:40:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0upYTRVernkz; Fri, 13 Feb 2026 19:40:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E45606174D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011611;
	bh=oiL/8Ed8rnQlGpzAeqgkJde69N3MGnXrqhGaXOdQbMA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=leUhoT+YBhGFknOWpY/kwG/tJu2hFA0tHKRMOdi1whK3wZg1kN++89DLpTqw8pZz9
	 HGPgJnrmxnDUxiAiepXOER7dljSwvsBcWK27WFDzGa/WWZ8HAsHQ/UugB1BaXVWU1N
	 NX0Ibr2mzkzCqwSXDKPj9DnMDxMu9FCyLDkdDQ8ir5hsGa1Y6wZ7HH60UWjIwUM4m8
	 VyUOxA1BiPp90ozE3+009Yu352bI/IgtallfrpcGw6LqX75A+NcRVSkVVGJc7O2RSK
	 f/fYtROrlnMZPmIsGKdhYDAZS9kb5eKVE3vaGpRcsYc8QpnDkcCckJsPfLp7K3xoMp
	 6T5AvJyu4Y2pA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E45606174D;
	Fri, 13 Feb 2026 19:40:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AA0BEC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E41C4412A7
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a7qvFNkq-8zK for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3C41413F1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3C41413F1
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C77DC83593; Fri, 13 Feb 2026 19:37:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:33:49 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 9c0d30029553da413422bf9fd9d7433dce2403c3
X-Git-Newrev: 06ac307b2f86ad26e28a43487c799b8448acf45b
X-Patchwork-Hint: ignore
Message-Id: <20260213193705.C77DC83593@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/swig:
 swig-wrapper.in: handle symlinks
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/06ac307b2f86ad26e28a43487c799b8448acf45b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Fixes https://autobuild.buildroot.net/results/e656684298b0462f8044667e7384c64d6508f22f/

Use realpath when constructing the path to the real swig so the wrapper
works even if it is called through a symlink (E.G. the swig<version>
symlinks).

Reported-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2b3b25a7dcfb4d0dbd99cadd8d898e3b7ecc790f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/swig/swig-wrapper.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/swig/swig-wrapper.in b/package/swig/swig-wrapper.in
index 61c885fc90..e6cf2df134 100644
--- a/package/swig/swig-wrapper.in
+++ b/package/swig/swig-wrapper.in
@@ -5,4 +5,4 @@ if [ -z "${SWIG_LIB}" ]; then
     export SWIG_LIB="${0%/*}/../share/swig/@SWIG_VERSION@"
 fi
 
-exec "${0}.br_real" "$@"
+exec "$(realpath "${0}").br_real" "$@"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
