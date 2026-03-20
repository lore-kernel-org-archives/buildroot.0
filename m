Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E49F483EB
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 19:47:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFC8C40BBB;
	Mon, 23 Mar 2026 19:47:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j8ssjvHniS0X; Mon, 23 Mar 2026 19:47:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E667840BC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774295242;
	bh=XKJXJ22Xr3f49h7iDIVfDF5eqUS3+Psu81CBhukixyo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BN7+UUa+RiklUuV9ESTBn9San/6enMMl2naJSUolLAZWQ6+x1cVWxXwhqOOTYqAJS
	 5FJjauMx+a2JIxQXUVcJ4VKZDm14mP9bpeup83B4aFD644QJOh76oWYxOPXDtdm8cL
	 nWEtB+Jm5cNUO5j2RBFOY3A3T/3GvIklo/hQJrSvRv41izHYRRio2LX8sEpgPrW/3P
	 rZtil5gK+S6tOAyeW7ZnmXpUswplvBMs8KQc4oE29rE31bPOZ0eU4nuuxSNTKHDLIg
	 U1sF4A+fqZRGbyP5rTSikm72FSlxJLcZsrEI1hyycT9raTc3VJbsUF1XRgA83LqWkc
	 BgAiR54aA0S7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E667840BC2;
	Mon, 23 Mar 2026 19:47:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F114353
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 993AC40971
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nBdss7Lh_Zma for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 19:47:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CE9440640
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2CE9440640
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6B2AD84C28; Mon, 23 Mar 2026 19:47:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 20 Mar 2026 16:52:11 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: cecf369586d7d2456d8fd8dbd26da3b29a52aba0
X-Git-Newrev: 5ab801853981163bf7a2eb378c0779d583401298
X-Patchwork-Hint: ignore
Message-Id: <20260323194714.6B2AD84C28@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] docs/manual: use
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5ab801853981163bf7a2eb378c0779d583401298
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
