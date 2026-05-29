Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E6FCD8CAA
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:03:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3D8E85654;
	Tue,  9 Jun 2026 13:03:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yqIa8gRxtfmr; Tue,  9 Jun 2026 13:03:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C29C185A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010213;
	bh=4bn72Ww/7Xam3Q0W5KmC7qlGbgj0jwWlubC9euRmHy4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EQJbHvhL/2wXVGSaTwjcaQE6cHfmKWFVJCDcL4D2ZRLI2Zaq7QV7y1wdwS22plyxi
	 zDKFV+0jkCB9yZCVbapiTlgndPu2rqduhNMFzz46mnOY/5JQmxWIRASTGsiqhETrzg
	 BHPxT7GBeG7mSK6zi3Ckn6IZVkWhzCypCuOVDNusXAkAXO+rS/SXV98eEI7K9DFbqB
	 juzIbCi6NupSgrK70uhjbbJYdXbUpamvl7MKdEDqNEO19IXr+VKpnj5sImKA67nCEo
	 POgBp/6LNUSz1ixJfsCX6iTR84CBbAfvu33/YOj3mkjcZLyyubP2xd33DOhB+kdEYP
	 WzVl6g8Tsh1Aw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C29C185A4B;
	Tue,  9 Jun 2026 13:03:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 48725196
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 758B645CE4
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T_Q9gKntmvPb for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCCD9457F9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CCCD9457F9
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 14DB487E7E; Tue,  9 Jun 2026 13:01:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 15:37:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a85ec5435c79490596e5048afc796b59d906c110
X-Git-Newrev: 5726264e197691951b35dd017c484858126d536b
X-Patchwork-Hint: ignore
Message-Id: <20260609130120.14DB487E7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d: add optional dependency to
 libudev
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5726264e197691951b35dd017c484858126d536b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/mesa3d/mesa3d.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index f46c50e878..d3874766d0 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -277,6 +277,10 @@ else
 MESA3D_CONF_OPTS += -Dvalgrind=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_HAS_LIBUDEV),y)
+MESA3D_DEPENDENCIES += libudev
+endif
+
 ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
 MESA3D_CONF_OPTS += -Dlibunwind=enabled
 MESA3D_DEPENDENCIES += libunwind
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
