Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C3FC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 14:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36974405E5;
	Fri, 12 Jul 2024 14:50:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ARPKVcfHidWR; Fri, 12 Jul 2024 14:50:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB1AD40754
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB1AD40754;
	Fri, 12 Jul 2024 14:50:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 962801BF424
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8CCDD60631
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:50:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LX5k3wq1sm-Y for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 14:50:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C417D6061E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C417D6061E
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 14:50:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AD5F785FDB; Fri, 12 Jul 2024 14:50:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 16:49:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 28e6953ba84d39a6074aee439a64ef86b109dcf0
X-Git-Newrev: e86fa6bdb4707c56f96677b41be17460e77d2757
X-Patchwork-Hint: ignore
Message-Id: <20240712145011.AD5F785FDB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nodejs: bump to 20.12.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=e86fa6bdb4707c56f96677b41be17460e77d2757
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release Notes: https://nodejs.org/en/blog/release/v20.12.0

LICENSE hash changed due to changes in vendored components:

* copyright year updates [1][2]
* version name update [3]
* change from "Unicode, Inc. License - Data Files and Software"
  to the "Unicode License v3" [4]. This is in the icu vendored
  dependency which is unused in buildroot.
* new build tooling script [5] under BSD style license

NodeJS tests are passing:

$ ./utils/docker-run ./support/testing/run-tests -o ./outputs/ -k tests.package.test_nodejs
13:40:05 TestNodeJSModuleHostSrc                  Starting
13:40:06 TestNodeJSModuleHostSrc                  Building
14:05:52 TestNodeJSModuleHostSrc                  Building done
14:06:02 TestNodeJSModuleHostSrc                  Cleaning up
.14:06:02 TestNodeJSModuleHostBin                  Starting
14:06:03 TestNodeJSModuleHostBin                  Building
14:24:25 TestNodeJSModuleHostBin                  Building done
14:24:31 TestNodeJSModuleHostBin                  Cleaning up
.14:24:31 TestNodeJSBasic                          Starting
14:24:32 TestNodeJSBasic                          Building
14:42:53 TestNodeJSBasic                          Building done
14:43:02 TestNodeJSBasic                          Cleaning up
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
