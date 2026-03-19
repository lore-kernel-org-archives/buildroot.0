Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 288A5F483EA
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 19:47:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0EE640C1E;
	Mon, 23 Mar 2026 19:47:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 45sOJeC2paf5; Mon, 23 Mar 2026 19:47:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BA3A40C38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774295262;
	bh=jUCvfCd0wLtkomUL5Jkr0R6sBhbrlYHDVZoZZieENWw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dMtAIKmglc0NWJ9tcqh8nxp7X4q0/uEVUi3nMXkK2vb4BJZ++YrrYh+WCTlpH4Cs6
	 UQnpufpy4MsV2m3gx32z5gkwxDFWRNe7mNPTiZGFboKiC57SAaVEFy3u9YPe4LXn1D
	 fLYkrPQywYc0vXEpYe5Zv874hIpW3fxQGHzI7FR8x4ZvTTOeuArqZJFPnW3QpZj62+
	 BynFrbR8AkYusOvkPnwE6lc6W/nRfr0rh3eLmUu/XXppH+6ULq7SJKgwj+RdD2cb8O
	 gbVzOXJxZAdgjGOofmE6P2S+qb0/vqJC6lY5e8R5BQ8CrHXEgP2ylC48R8WzCF3Jb2
	 GWj5b9g6aG20w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BA3A40C38;
	Mon, 23 Mar 2026 19:47:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 19B39F4
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFCCC40C00
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nG2Qvu09hsV4 for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 19:47:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6D8A40BED
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6D8A40BED
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E5DE784C53; Mon, 23 Mar 2026 19:47:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 19 Mar 2026 11:56:18 +0100
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: b7aa889e19bd97177865e5edba05e72ff4caa951
X-Git-Newrev: 667111a94d5334ad578f931c228373fefba692ac
X-Patchwork-Hint: ignore
Message-Id: <20260323194728.E5DE784C53@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] docs/manual: use
 space-separated list for BR2_EXTERNAL
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/667111a94d5334ad578f931c228373fefba692ac
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Specifying a list of br2-external trees is poorly documented, and the
only example uses a colon to separate the br2-external paths.

Adding the support for colon-separated list is the biggest mistake that
was made when introducing support for multiple br2-external [0]. Indeed,
both space and colon can be used to separate entries in the list, and it
is also possible to mix the two. However, internally, the list is stored
as a space-separated list, and all the code will split on spaces.

Besides, all other lists in Buildroot are a space-separated:
    BR2_ROOTFS_DEVICE_TABLE
    BR2_ROOTFS_STATIC_DEVICE_TABLE
    BR2_TARGET_TZ_ZONELIST
    BR2_ROOTFS_USERS_TABLES
    BR2_ROOTFS_OVERLAY
    BR2_ROOTFS_PRE_BUILD_SCRIPT
    BR2_ROOTFS_POST_BUILD_SCRIPT
    BR2_ROOTFS_POST_FAKEROOT_SCRIPT
    BR2_ROOTFS_POST_IMAGE_SCRIPT
    ...

So, using colons is odd.

The fact that BR2_EXTERNAL is passed on the command line rather than
being a Kconfig item is not a reason enough to justify that it be
colon-separated.

Change the documentation to only mention using a space-separated list.

Of course, for backward compatibility, we keep the code as-is to accept
a colon-separated list, but we just do not advertise it.

Note that keeping the split on colons means that colons are not accepted
in pathnames of br2-external trees; in practice, this is not a new
restriction, or one that could lift as usign colons in Makefiles are
problematic anyway.

[0] in 20cd49738781 core: add support for multiple br2-external trees

Reported-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Reported-by: Brandon Maier <Brandon.Maier@collins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit f9cdca48a57f24f2babb8f72652e099e08a59cd5)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 docs/manual/customize-outside-br.adoc | 5 +++--
 support/scripts/br2-external          | 3 +++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/docs/manual/customize-outside-br.adoc b/docs/manual/customize-outside-br.adoc
index 78065489d4..8a76f3a998 100644
--- a/docs/manual/customize-outside-br.adoc
+++ b/docs/manual/customize-outside-br.adoc
@@ -58,10 +58,11 @@ We can switch to another br2-external tree at any time:
 buildroot/ $ make BR2_EXTERNAL=/where/we/have/bar xconfig
 ----
 
-We can also use multiple br2-external trees:
+We can also use multiple br2-external trees, by specifying a space-separated
+list of paths to use:
 
 ----
-buildroot/ $ make BR2_EXTERNAL=/path/to/foo:/where/we/have/bar menuconfig
+buildroot/ $ make BR2_EXTERNAL="/path/to/foo /where/we/have/bar" menuconfig
 ----
 
 Or disable the usage of any br2-external tree:
diff --git a/support/scripts/br2-external b/support/scripts/br2-external
index 474feaded7..641f8e18ae 100755
--- a/support/scripts/br2-external
+++ b/support/scripts/br2-external
@@ -34,6 +34,9 @@ main() {
         error "Cannot create output directory '%s'\n" "${outputdir}"
     fi
 
+    # Historically, BR2_EXTERNAL could also be colon-separated, so for
+    # backward compatibility, keep splitting on colons (in addition to
+    # spaces).
     # shellcheck disable=SC2068  # We do want to split on spaces
     do_validate "${outputdir}" ${@//:/ }
     do_mk "${outputdir}"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
