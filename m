Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C32BC27C79
	for <buildroot@archiver.kernel.org>; Mon, 17 Jun 2024 14:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA3B3401D8;
	Mon, 17 Jun 2024 14:52:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HPgOhal8mD5f; Mon, 17 Jun 2024 14:52:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8631240319
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8631240319;
	Mon, 17 Jun 2024 14:52:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7C8E51BF377
 for <buildroot@lists.busybox.net>; Mon, 17 Jun 2024 14:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7625440319
 for <buildroot@lists.busybox.net>; Mon, 17 Jun 2024 14:52:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j3UQ6Atu5ig9 for <buildroot@lists.busybox.net>;
 Mon, 17 Jun 2024 14:52:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=bugzilla@busybox.net;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67D77401D8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67D77401D8
 for <buildroot@uclibc.org>; Mon, 17 Jun 2024 14:52:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 5084D87BCE; Mon, 17 Jun 2024 14:52:28 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Mon, 17 Jun 2024 14:52:27 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2024.05
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ciprian.craciun@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-16111-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 16111] New: QuickJS binaries in `/usr/local/bin`
 (instead of `/usr/bin`)
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://bugs.busybox.net/show_bug.cgi?id=16111

            Bug ID: 16111
           Summary: QuickJS binaries in `/usr/local/bin` (instead of
                    `/usr/bin`)
           Product: buildroot
           Version: 2024.05
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: ciprian.craciun@gmail.com
                CC: buildroot@uclibc.org
  Target Milestone: ---

After BuildRoot has updated QuickJS to version 2024-01-13, now QuickJS installs
it's binaries under `/usr/local/bin` as opposed to `/usr/bin` (as it was before
the update of QuickJS release).

Apparently the BuildRoot `quickjs.mk` script uses `prefix=/usr`, but the latest
QuickJS makefile seems to expect `PREFIX=/usr`.

The following minor patch solves the issue:
~~~~
diff --git i/package/quickjs/quickjs.mk w/package/quickjs/quickjs.mk
--- i/package/quickjs/quickjs.mk
+++ w/package/quickjs/quickjs.mk
@@ -22,25 +22,25 @@ define QUICKJS_BUILD_CMDS
        EXTRA_LIBS="$(QUICKJS_EXTRA_LIBS)" \
        all
 endef

 define QUICKJS_INSTALL_STAGING_CMDS
    $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
        CROSS_PREFIX="$(TARGET_CROSS)" \
        EXTRA_LIBS="$(QUICKJS_EXTRA_LIBS)" \
        DESTDIR=$(STAGING_DIR) \
        STRIP=/bin/true \
-       prefix=/usr \
+       PREFIX=/usr \
        install
 endef

 define QUICKJS_INSTALL_TARGET_CMDS
    $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
        CROSS_PREFIX="$(TARGET_CROSS)" \
        EXTRA_LIBS="$(QUICKJS_EXTRA_LIBS)" \
        DESTDIR=$(TARGET_DIR) \
        STRIP=/bin/true \
-       prefix=/usr \
+       PREFIX=/usr \
        install
 endef

 $(eval $(generic-package))
~~~~

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
