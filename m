Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF6FE8782D
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 13:45:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77C6581456;
	Tue,  3 Feb 2026 13:45:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cgWlgi1tZ85B; Tue,  3 Feb 2026 13:45:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93E7C8145A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770126321;
	bh=prClczE0B3YHodm/FZrOfusAceI69ilRsT55BSnQEXw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gzXdU2q+hLjCnL3JCTC5fYvf77qGmWDMvIKBBKV9Ha3uzIeC65uyngRUoakgL3Nzs
	 EXIl5/batPYZdzCkfraSBBQa8aNqCCTf88otqW2ASfbQ/atu4bY3mvHY42MJYLAcuh
	 VahSQAq+oj3VzybtV6Bl7D0Hi32H7HbQT3ctJdnDZRskShSxqJaqF1mS2567x4Hu79
	 //PMVFsuFq6OuHDRtRi6/IMnBpzaY0ZOrTyAnsryhfNy845r57lLWnMW7d3jARl99R
	 gu77z0lIwSVGJMG4WT4L6U16gNoVgpjX2JygtsnPYyMXmiM8+vmNEZusiMk1pS8JdY
	 S+MQqMm7KL6pA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93E7C8145A;
	Tue,  3 Feb 2026 13:45:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DC70313D
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 13:45:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB830607E3
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 13:45:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XnC100F-_8EE for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 13:45:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB04A607D9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB04A607D9
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 13:45:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DF11D86655; Tue,  3 Feb 2026 13:45:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Feb 2026 14:44:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7bcad09c029bd66cf7ae819e7a2a332025cb7837
X-Git-Newrev: 7ed80ecec1cf2653803e5bbbec48daaeb6e6c056
X-Patchwork-Hint: ignore
Message-Id: <20260203134518.DF11D86655@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/igmpproxy: add CPE
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7ed80ecec1cf2653803e5bbbec48daaeb6e6c056
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The CPE `pali:igmpproxy` is a valid CPE for the package igmpproxy.

See the latest CVE: CVE-2025-50681 [1] that reference the upstream
repository.

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-50681

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/igmpproxy/igmpproxy.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/igmpproxy/igmpproxy.mk b/package/igmpproxy/igmpproxy.mk
index 357c9087e0..f2c32939ff 100644
--- a/package/igmpproxy/igmpproxy.mk
+++ b/package/igmpproxy/igmpproxy.mk
@@ -11,4 +11,6 @@ IGMPPROXY_AUTORECONF = YES
 IGMPPROXY_LICENSE = GPL-2.0+, BSD-3-Clause (mrouted)
 IGMPPROXY_LICENSE_FILES = COPYING GPL.txt Stanford.txt
 
+IGMPPROXY_CPE_ID_VENDOR = pali
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
