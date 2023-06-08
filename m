Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB8C1C7EE23
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 13:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C1F8417B5;
	Thu,  8 Jun 2023 13:44:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C1F8417B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WDzgifnIH_3c; Thu,  8 Jun 2023 13:44:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AAF5C40494;
	Thu,  8 Jun 2023 13:44:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAF5C40494
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B7CA91BF3A4
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 13:44:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9192683AAD
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 13:44:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9192683AAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6dKOjxnP7K8A for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 13:44:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5EE381CDB
 for <buildroot@uclibc.org>; Thu,  8 Jun 2023 13:44:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5EE381CDB
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 92D2881A0E; Thu,  8 Jun 2023 13:44:34 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Thu, 08 Jun 2023 13:44:34 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: sebastian.weyer@smile.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-15628-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15628] New: Missing dependencies in
 BR2_PACKAGE_PYTHON_MAKO
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

https://bugs.busybox.net/show_bug.cgi?id=15628

            Bug ID: 15628
           Summary: Missing dependencies in BR2_PACKAGE_PYTHON_MAKO
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: All
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: sebastian.weyer@smile.fr
                CC: buildroot@uclibc.org
  Target Milestone: ---

Piglit depends on mako, which in turn imports the modules pygments and
markupsafe which are not selected by selecting BR2_PACKAGE_PYTHON_MAKO

# piglit run sanity
Traceback (most recent call last):
  File "/usr/lib/python3.11/site-packages/mako/exceptions.py", line 287, in
_install_highlighting
  File "/usr/lib/python3.11/site-packages/mako/exceptions.py", line 271, in
_install_pygments
  File "/usr/lib/python3.11/site-packages/mako/ext/pygmentplugin.py", line 7,
in <module>
ModuleNotFoundError: No module named 'pygments'

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/bin/piglit", line 107, in <module>
    import framework.programs.summary as summary
  File "/usr/lib64/piglit/framework/programs/summary.py", line 30, in <module>
    from framework import summary, status, core, backends, exceptions
  File "/usr/lib64/piglit/framework/summary/__init__.py", line 31, in <module>
    from .html_ import html, feat
  File "/usr/lib64/piglit/framework/summary/html_.py", line 37, in <module>
    from mako.lookup import TemplateLookup
  File "/usr/lib/python3.11/site-packages/mako/lookup.py", line 13, in <module>
  File "/usr/lib/python3.11/site-packages/mako/exceptions.py", line 292, in
<module>
  File "/usr/lib/python3.11/site-packages/mako/exceptions.py", line 289, in
_install_highlighting
  File "/usr/lib/python3.11/site-packages/mako/exceptions.py", line 277, in
_install_fallback
  File "/usr/lib/python3.11/site-packages/mako/filters.py", line 14, in
<module>
ModuleNotFoundError: No module named 'markupsafe'

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
