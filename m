Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D56CF11F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 13:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 408C5402F7;
	Thu, 10 Oct 2024 13:29:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S4MfeSUS9ZMO; Thu, 10 Oct 2024 13:29:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08D5940FE8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 08D5940FE8;
	Thu, 10 Oct 2024 13:29:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A4F471BF427
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 13:29:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9382A402F7
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 13:29:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D0v6-MbjSMnE for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 13:29:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 29BDB402C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29BDB402C6
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 29BDB402C6
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 13:29:33 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.112.249]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MCsQ4-1t7iv32Uym-00EB6p; Thu, 10
 Oct 2024 15:29:29 +0200
To: buildroot@buildroot.org
Date: Thu, 10 Oct 2024 15:29:11 +0200
Message-ID: <20241010132912.3061663-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:blrSsiq3o18BxqorvnPMP9BCNesRTRUMbH+ENzqrC3vHyNtrg/p
 XfS9t5tvWsROjILNMFDy/+vcPK/eyciXBplmd/dYE3tXypqq81ysVIPgBnzMr2mviZ1btpc
 XiaINlXCBCeDdeRcKMixxKoRUlBWdKDq6FkXJifgkMAz9NKVqKKrmv+MGTLrtiKzJdGk+ud
 6yPLGJYHRspuY6Gs3Zhuw==
UI-OutboundReport: notjunk:1;M01:P0:R5JwJwVMhI4=;o3mt6RFVkzbGIh8f6Ks+XKrkzWv
 Wlb9azCG3c1OAWOcte+fsB/R3a8SCSrW4hiy65rMEHiM6+tnEyP3a1Xc9GJQv8Bg19TiKtPtn
 ZttDmeEFnIcBWMFjjTBwDfmnTxXSsU+qPWqh/Xd0MDnX63mPKYgqjNsreaQrodxcUhL58IoL6
 Ihany2JvyKWXoyZgcqnIkBLvTV2cbDV4mtp8z1GHWh1RvYtWcGMVFYt7R4hiXppYSVzNo7mwT
 epPd4YVsang1m+tgHZuuBfGeC41kYoND6EjJ9bsnNHuGGvLTnOHQ0ZnyTT6Tw8mPFOObqavcZ
 znGxNdAQIPPkcRjnET159zUktOqkPZvqKZ4Y5vJhnLwlgXdDEe/3LiGG30pUfnwhpLhNMQItg
 fXidT/aWqOLtGn2YCig70xbQl5nJiFxgWIbN9xpI7b4jAAJZiTUw6k75iGJ4B68FBx6jC63n0
 pbEgv5NnAlebjobqy1O48DGk0fR0jiET7UpFd3J2399O+tC/KE9pdLpLEkqTrrpwzEB1Hn9Ag
 pDehBausFQ+9houuFjBa2nXbNTMgfSRMk13qjYqBvfJq680U2qPUMX6j1c0ulHWLqsL+QsEFA
 /6j+1adbWv0MofMG7ANSOxpeijYGR3cQQQOvbINBCIelKmqqJMFi3R4pU6Qq3fzvkbF49OQgz
 qOYyaEkAoaBeCuBddqweuVGQW45d/4CLLzH1iat9fsqt2nOwIPGI4kdautlad+GFec0NxaAMu
 JOz8NZW/M/n1b44HCJm5FZ/HNU1J8W45+wvEqJCT56n8V1vfqTTnoZjFE7Rlbc1vKI33ieG8F
 dYR9qBVY3cwsgAxPx0T80w6w==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1728566969; x=1729171769; i=fiona.klute@gmx.de;
 bh=h0RZvatIb7Uemr0vBtnsWXaTWaDy/0dnHXaO6AdpYb0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=MInCLxGKW9NsNT8knoDH19JhXsxYxIRw9i/IdetwHm5DqgjZFm/6drmQYLRUGrDr
 MLTYOpHzj2+aeqgF3XzJbje+ONYd8w81XnusRDCs/mK8ALA8YBY0VGqqTmhTJVmI4
 mVhTEx8JJu/aNtHUagwZWgg04KSbt+DXYABQ7IfTG557zMild8yDvjMGsrIuUNXAp
 3Hwlse7vIOELacgsvzhE1p8N4qutnKZQVwTPI5YVcApBVueRB9VrO6d151XxzDVEN
 xQJ+ElS58EtFSZLXAniK+8DucP1WecOlAewSA58HLdIgUjLMq85OsvgM+15fv9+Hq
 mLpKdzXk2FbswiMx/Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=MInCLxGK
Subject: [Buildroot] [PATCH 1/2] package/tini: restore use as docker-init
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>,
 Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Commit 24cac9c4e6a36fd14b263a8eecf7ae7d58ab5a59 "system: add tini as
init system" made BR2_PACKAGE_TINI depend on BR2_INIT_TINI. This is
incorrect: tini is not only needed when building a container image
using Buildroot, but also to run Docker containers on Buildroot
systems using another another init system, if Docker is configured to
provide an init process for the container (e.g. with "docker run
--init"). The tini package already provides the "docker-init" symlink
required for that.

Example error without tini installed:

$ docker run --rm -ti --init alpine
docker: Error response from daemon: exec: "docker-init": executable file not found in $PATH.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 package/tini/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/tini/Config.in b/package/tini/Config.in
index bca8ad8e96..719e1e1f22 100644
--- a/package/tini/Config.in
+++ b/package/tini/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_TINI
 	bool "tini"
 	depends on BR2_USE_MMU # fork()
-	depends on BR2_INIT_TINI
 	help
 	  tini is a simple but valid init binary to
 	  act as PID 1 for containers.
--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
