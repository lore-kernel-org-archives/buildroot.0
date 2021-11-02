Return-Path: <SRS0=drHZ=PV=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7537DC433EF
	for <buildroot@archiver.kernel.org>; Tue,  2 Nov 2021 20:13:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D1AB60D42
	for <buildroot@archiver.kernel.org>; Tue,  2 Nov 2021 20:13:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3D1AB60D42
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 130C5402FC;
	Tue,  2 Nov 2021 20:13:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id arrJXFSTiyzN; Tue,  2 Nov 2021 20:13:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72E4E4022F;
	Tue,  2 Nov 2021 20:13:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 53F971BF9A4
 for <buildroot@lists.busybox.net>; Tue,  2 Nov 2021 20:13:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F9D1402EC
 for <buildroot@lists.busybox.net>; Tue,  2 Nov 2021 20:13:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VpGg8SRYpjUV for <buildroot@lists.busybox.net>;
 Tue,  2 Nov 2021 20:13:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7EF9540103
 for <buildroot@uclibc.org>; Tue,  2 Nov 2021 20:13:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 4BBA087E97; Tue,  2 Nov 2021 20:09:38 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Tue, 02 Nov 2021 20:13:17 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2021.02.3
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: thomas.petazzoni@bootlin.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone resolution
Message-ID: <bug-13946-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 13946] New: ip6tables-nft build does not include
 MASQUERADE target options
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

https://bugs.busybox.net/show_bug.cgi?id=13946

            Bug ID: 13946
           Summary: ip6tables-nft build does not include MASQUERADE target
                    options
           Product: buildroot
           Version: 2021.02.3
          Hardware: All
                OS: Linux
            Status: RESOLVED
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: mbuil@suse.com
                CC: buildroot@uclibc.org
  Target Milestone: ---
        Resolution: DUPLICATE
            Status: RESOLVED

Since 1.6, iptables supports the MASQUERADE target options:

MASQUERADE target options:
 --to-ports <port>[-<port>]
                                Port (range) to map to.
 --random
                                Randomize source port.
 --random-fully
                                Fully randomize source port.

When building iptables-nft, the MASQUERADE target options are included in the
iptables-nft binary, however, they are not in the ip6tables-nft:

sudo ./output/target/usr/sbin/iptables-nft -A POSTROUTING -s 10.244.0.0/16 ! -d
224.0.0.0/4 -j MASQUERADE --help | grep random
 --random
 --random-fully
                                Fully randomize source port.
sudo ./output/target/usr/sbin/ip6tables-nft -A POSTROUTING -s 10.244.0.0/16 !
-d 224.0.0.0/4 -j MASQUERADE --help | grep random
$>

Those targets come from the files libipt_MASQUERADE.c and libip6t_MASQUERADE.c
in https://git.netfilter.org/iptables/tree/extensions but for some reason the
ip6 one does not get included in the binary

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@bootlin.com> ---


*** This bug has been marked as a duplicate of bug 13971 ***

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
