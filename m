Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12453107BCE6
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 21:25:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62DE960DF0;
	Fri, 13 Mar 2026 21:25:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XBctfPkDnSGQ; Fri, 13 Mar 2026 21:25:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71B8E60E1E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773437157;
	bh=4R4asU+6xQq4zpMMorWidZPRYnIC0rKj6/Vhg1YmF8Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HxWJJf8xbXsAtVWMSQGBc/bIFT9pM231qI/3GeqLLrHzljZu6LgiIjZCr9C2hi2nw
	 uenVwYDRSlzv4vLjqCLGRXrb4mSZWOMxq3euknpCYX3k+qs3lewkX65L8Y/gAX6AMK
	 bqGMG8q2hqWvUwtC4SeKVQNdqki/nGr3Rx0VgebJhZuUrEQMHJ5ilnFfYQ6lh4Nm/Q
	 phIwZxa7gNzhtHoojNuqNKqgFKsjkNYUEKtD2FyNAp2kR3ujZiutn+5H5WrLV6giV8
	 5vNuj7HWjozmfRsuL3iFOQjbzhUzOybrA0KgcJVcSN0urQ5bjQFWb7CFZeN9iN4wbz
	 RAdrcarisfcrw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71B8E60E1E;
	Fri, 13 Mar 2026 21:25:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 368F71AF
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 21:25:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF70160E13
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 21:25:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m6h2rV_fvXrQ for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 21:25:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4AB360DF4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C4AB360DF4
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 21:25:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D8DE48703C; Fri, 13 Mar 2026 21:25:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Mar 2026 22:12:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 72e068001bf88b075abbe230b9ad1b7240c4754b
X-Git-Newrev: f9cdca48a57f24f2babb8f72652e099e08a59cd5
X-Patchwork-Hint: ignore
Message-Id: <20260313212553.D8DE48703C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual: use space-separated list for
 BR2_EXTERNAL
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f9cdca48a57f24f2babb8f72652e099e08a59cd5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
