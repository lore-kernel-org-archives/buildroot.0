Return-Path: <SRS0=GWv0=PZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6F07C433F5
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 10:46:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F23F36124A
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 10:46:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F23F36124A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B61806F94F;
	Sat,  6 Nov 2021 10:46:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fb-Q2su5dWAS; Sat,  6 Nov 2021 10:46:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 128ED6F94D;
	Sat,  6 Nov 2021 10:46:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1724D1BF476
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 10:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2B66405CF
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 10:46:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KlahtwS732Jo for <buildroot@lists.busybox.net>;
 Sat,  6 Nov 2021 10:46:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EEECB405CD
 for <buildroot@buildroot.org>; Sat,  6 Nov 2021 10:46:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 540EA88334; Sat,  6 Nov 2021 10:42:53 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 6 Nov 2021 11:46:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 57a950754227d768f84a85266850e47172310ea9
X-Git-Newrev: deb67dbca6a38094ae74a2070746dc68b4d2fbb8
X-Patchwork-Hint: ignore
Message-Id: <20211106104253.540EA88334@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/refpolicy: move patches to
 subdirectory
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=deb67dbca6a38094ae74a2070746dc68b4d2fbb8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

refpolicy patches are for 2.20210908 upstream version but when using a custom
version from git they may fail to apply.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/1734417630

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-policy-modules-services-samba.te-make-crack-optional.patch       | 0
 .../0002-policy-modules-services-wireguard.te-make-iptables-o.patch       | 0
 2 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/refpolicy/0001-policy-modules-services-samba.te-make-crack-optional.patch b/package/refpolicy/2.20210908/0001-policy-modules-services-samba.te-make-crack-optional.patch
similarity index 100%
rename from package/refpolicy/0001-policy-modules-services-samba.te-make-crack-optional.patch
rename to package/refpolicy/2.20210908/0001-policy-modules-services-samba.te-make-crack-optional.patch
diff --git a/package/refpolicy/0002-policy-modules-services-wireguard.te-make-iptables-o.patch b/package/refpolicy/2.20210908/0002-policy-modules-services-wireguard.te-make-iptables-o.patch
similarity index 100%
rename from package/refpolicy/0002-policy-modules-services-wireguard.te-make-iptables-o.patch
rename to package/refpolicy/2.20210908/0002-policy-modules-services-wireguard.te-make-iptables-o.patch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
