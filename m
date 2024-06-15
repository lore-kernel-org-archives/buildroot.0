Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5389BC27C53
	for <buildroot@archiver.kernel.org>; Sat, 15 Jun 2024 14:59:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 273AB82BEB;
	Sat, 15 Jun 2024 14:59:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QWdCjWWwjIWs; Sat, 15 Jun 2024 14:59:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FDED82C3E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FDED82C3E;
	Sat, 15 Jun 2024 14:59:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 032711BF302
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 14:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E544A6079D
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 14:59:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AYdUfWCLsviS for <buildroot@lists.busybox.net>;
 Sat, 15 Jun 2024 14:59:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=bugzilla@busybox.net;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D26D4605FF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D26D4605FF
 for <buildroot@uclibc.org>; Sat, 15 Jun 2024 14:59:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id CD74487BF7; Sat, 15 Jun 2024 14:59:06 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Sat, 15 Jun 2024 14:59:06 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2021.02.3
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: yann.morin.1998@free.fr
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: MOVED
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone resolution
Message-ID: <bug-13986-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 13986] New: Host python3 fails to run after
 relocate-sdk.sh
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

https://bugs.busybox.net/show_bug.cgi?id=13986

            Bug ID: 13986
           Summary: Host python3 fails to run after relocate-sdk.sh
           Product: buildroot
           Version: 2021.02.3
          Hardware: All
                OS: Linux
            Status: RESOLVED
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: dennis.peeten@heliox-energy.com
                CC: buildroot@uclibc.org, yann.morin.1998@free.fr
  Target Milestone: ---
                CC: yann.morin.1998@free.fr
            Status: RESOLVED
        Resolution: MOVED

The host python3 fails to start after relocating an SDK.

Reproduce:

Build an sdk with BR2_PACKAGE_HOST_PYTHON3=y
Untar the sdk to some location ${RELOCATED_SDK}.
Relocate the sdk by running ${RELOCATED_SDK}/relocate-sdk.sh
Run ${RELOCATED_SDK}/bin/python3

Result:

python fails to start, spewing confusing error messages.

Expected:

python starts with an interactive prompt. 

Note: running python3 from the build dir and running python3 from the relocated
sdk dir WITHOUT running the relocate-sdk.sh script does result in the expected
behaviour.

The problem is that the relocate-sdk.sh script also substitutes paths in the
.pyc byte code files, after which they become corrupted.

The relocate-sdk.sh script converts files who's MIME type starts with 'text/'.
The `file` utility on my machine (Debian 11) reports the MIME type of .pyc
files to be 'text/x-bytecode.python'. 

I'm not sure what the best solution is. But for now I've just changed the
relocate script on my end:

diff --git a/support/misc/relocate-sdk.sh b/support/misc/relocate-sdk.sh
index caabeaa6f6..8d381c41c3 100755
--- a/support/misc/relocate-sdk.sh
+++ b/support/misc/relocate-sdk.sh
@@ -36,7 +36,9 @@ echo "Relocating the buildroot SDK from ${OLDPATH} to
${NEWPATH} ..."
 export LC_ALL=C
 # Replace the old path with the new one in all text files
 grep -lr "${OLDPATH}" . | while read -r FILE ; do
-    if file -b --mime-type "${FILE}" | grep -q '^text/' && [ "${FILE}" !=
"${LOCFILE}" ]
+    MIME="$(file -b --mime-type "${FILE}")"
+    if echo ${MIME} | grep -q '^text/' && [ "${FILE}" != "${LOCFILE}" ] &&
+        ! ( echo ${MIME} | grep -q '^text/x-bytecode' )
     then
         sed -i "s|${OLDPATH}|${NEWPATH}|g" "${FILE}"
     fi


Kind regards,
Dennis Peeten.

--- Comment #1 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Thank you for your report.

The issue tracker for the Buildroot project has been moved to
the Gitlab.com issue tracker:
    https://gitlab.com/buildroot.org/buildroot/-/issues

We are taking this opportunity to close old issues in this old
tracker. If you believe your issue is still relevant, please
open one in the new issue tracker.

Thank you!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
