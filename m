Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E72C6379F
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 20:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8195C822FC;
	Mon, 20 Feb 2023 20:52:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8195C822FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZmckDaA3HB5j; Mon, 20 Feb 2023 20:52:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8DB0822F7;
	Mon, 20 Feb 2023 20:52:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8DB0822F7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1B1711BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 559D56106E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 559D56106E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ahKB73I42hUo for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E3676101C
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E3676101C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8EB768648F; Mon, 20 Feb 2023 20:51:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 22:12:03 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: cd95a33511b9d9de6f6885ec75e6f39608238b9d
X-Git-Newrev: 5adf96d5bd3a580ab47e74ef8988594435a18a20
X-Patchwork-Hint: ignore
Message-Id: <20230220205145.8EB768648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/makedumpfile: fix
 mips64 build
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5adf96d5bd3a580ab47e74ef8988594435a18a20
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix the following mips64 build failure raised since commit
0b389385666687ecfd09cdbce6c6ecfd74ce11ab:

makedumpfile.c: In function 'is_kvaddr':
makedumpfile.c:1613:39: error: 'KVBASE' undeclared (first use in this function)
  return (addr >= (unsigned long long)(KVBASE));
                                       ^~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/94824fa8baa8edb99a5ca245e5561e0c4e430638

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/makedumpfile/0002-Handle-__mips64.patch | 69 +++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
