Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B4CCE87829
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 13:45:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 625AF607B9;
	Tue,  3 Feb 2026 13:45:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hq8F8RqHrmx9; Tue,  3 Feb 2026 13:45:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F839607D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770126327;
	bh=d4y6biKGM0PvfsP6gV8uQtVSaRaOAFdgyi9g1iLI8Pw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Gn41Lo2hCAIqGoDqjpm43sScavaAudmkKBfopZScdmTS0HrPgKldu2JFcv2PQ79SK
	 WesbOxCNf7QF75iPIH4fdfS465gX31Z+r5NM34vguawEhS2Mya0fneUfiiLI8SyP77
	 iVAG0S6i+o1rIowOdxIdXBlHQQh00KzOaRlHv11AqU48jibD5ezQBc2ErdLZJy2SaD
	 ia+KcZ6UM/Txic7CMJa2pAn2KbXnodFQnSK8stsmOmOvXxm+UjRouv6JKcudhjd214
	 V2DZ6283WHBTsIkB03irr4TmzIPEY8UKb6+btD/RLkcXnCsg73Ct831cLWppagw9RX
	 uzzG1QKUjMKlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F839607D9;
	Tue,  3 Feb 2026 13:45:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EE3812E9
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 13:45:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D7ED38145A
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 13:45:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Raktbt6-jhAY for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 13:45:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D89ED81456
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D89ED81456
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 13:45:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C313086697; Tue,  3 Feb 2026 13:45:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Feb 2026 14:44:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3848bea3c3cedddf173b621503d351025266ee4b
X-Git-Newrev: 5a03ffed801f5558e334d0e0000668d6e3355af0
X-Patchwork-Hint: ignore
Message-Id: <20260203134518.C313086697@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mp4v2: add CPE
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

commit: https://git.buildroot.net/buildroot/commit/?id=5a03ffed801f5558e334d0e0000668d6e3355af0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The CPE `mp4v2:mp4v2` is valid for the package mp4v2. See the latest
CVE: CVE-2023-33719 that reference the upstream repository.

[1] https://nvd.nist.gov//vuln/detail/CVE-2023-33719

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mp4v2/mp4v2.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mp4v2/mp4v2.mk b/package/mp4v2/mp4v2.mk
index ae777cdc75..8d8e184b99 100644
--- a/package/mp4v2/mp4v2.mk
+++ b/package/mp4v2/mp4v2.mk
@@ -12,6 +12,8 @@ MP4V2_INSTALL_STAGING = YES
 MP4V2_LICENSE = MPL-1.1
 MP4V2_LICENSE_FILES = COPYING
 
+MP4V2_CPE_ID_VENDOR = mp4v2
+
 # help2man expects to be able to run utilities on the build machine to
 # grab --help output which doesn't work when cross compiling, so
 # disable it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
