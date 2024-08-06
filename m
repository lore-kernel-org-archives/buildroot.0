Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF7CEC52D70
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 16:05:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CED740340;
	Tue,  6 Aug 2024 16:05:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 35rxSfPyqBrb; Tue,  6 Aug 2024 16:05:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19ABC403D8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19ABC403D8;
	Tue,  6 Aug 2024 16:05:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 860B61BF32A
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 16:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 741D1607A3
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 16:05:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vIi9PvwlmJ1R for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 16:05:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CD8A60740
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4CD8A60740
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 16:05:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 44C3484249; Tue,  6 Aug 2024 16:05:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 6 Aug 2024 17:57:45 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 6c995cb48e66e2f714f2dd0f7acd7a0a4e754e9c
X-Git-Newrev: 50b13c9f865ab820cb6166a220f4eb524bdf5125
X-Patchwork-Hint: ignore
Message-Id: <20240806160516.44C3484249@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/nodejs: bump to
 20.12.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=50b13c9f865ab820cb6166a220f4eb524bdf5125
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

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
