Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6597C6FD18
	for <buildroot@archiver.kernel.org>; Thu, 30 Mar 2023 01:57:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 275D0841D7;
	Thu, 30 Mar 2023 01:57:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 275D0841D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0EbBJkmjrFLt; Thu, 30 Mar 2023 01:57:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71AA78419C;
	Thu, 30 Mar 2023 01:57:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71AA78419C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 17B0D1BF573
 for <buildroot@lists.busybox.net>; Thu, 30 Mar 2023 01:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE99540492
 for <buildroot@lists.busybox.net>; Thu, 30 Mar 2023 01:57:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE99540492
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wj49G1OmSxSb for <buildroot@lists.busybox.net>;
 Thu, 30 Mar 2023 01:57:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E27B4011F
 for <buildroot@uclibc.org>; Thu, 30 Mar 2023 01:57:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E27B4011F
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 29EC183567; Thu, 30 Mar 2023 01:57:23 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Thu, 30 Mar 2023 01:57:23 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2020.02.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: simitel@163.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-15506-163-x7SAfpHDpE@https.bugs.busybox.net/>
In-Reply-To: <bug-15506-163@https.bugs.busybox.net/>
References: <bug-15506-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15506] Failed to login to system with root and its
 password.
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

https://bugs.busybox.net/show_bug.cgi?id=15506

--- Comment #1 from wangt13 <simitel@163.com> ---
(In reply to wangt13 from comment #0)
The busybox in buildroot is also configured as follows to support login.

#
# Login/Password Management Utilities
#
CONFIG_FEATURE_SHADOWPASSWDS=y
CONFIG_USE_BB_PWD_GRP=y
CONFIG_USE_BB_SHADOW=y
CONFIG_USE_BB_CRYPT=y
CONFIG_USE_BB_CRYPT_SHA=y
CONFIG_ADD_SHELL=y
CONFIG_REMOVE_SHELL=y
# CONFIG_ADDGROUP is not set
# CONFIG_FEATURE_ADDUSER_TO_GROUP is not set
# CONFIG_ADDUSER is not set
# CONFIG_FEATURE_CHECK_NAMES is not set
CONFIG_LAST_ID=0
CONFIG_FIRST_SYSTEM_ID=0
CONFIG_LAST_SYSTEM_ID=0
CONFIG_CHPASSWD=y
CONFIG_FEATURE_DEFAULT_PASSWD_ALGO="des"
CONFIG_CRYPTPW=y
CONFIG_MKPASSWD=y
# CONFIG_DELUSER is not set
# CONFIG_DELGROUP is not set
# CONFIG_FEATURE_DEL_USER_FROM_GROUP is not set
CONFIG_GETTY=y
CONFIG_LOGIN=y
# CONFIG_LOGIN_SESSION_AS_CHILD is not set
CONFIG_LOGIN_SCRIPTS=y
CONFIG_FEATURE_NOLOGIN=y
CONFIG_FEATURE_SECURETTY=y
CONFIG_PASSWD=y
CONFIG_FEATURE_PASSWD_WEAK_CHECK=y

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
