Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB24C52D70
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 16:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3173400BF;
	Tue,  6 Aug 2024 16:02:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G2SP0TY0CAih; Tue,  6 Aug 2024 16:02:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F5004023D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F5004023D;
	Tue,  6 Aug 2024 16:02:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A92071BF408
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 16:02:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 969D3400BF
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 16:02:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kyfieDqLGd8E for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 16:02:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8858F4023D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8858F4023D
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 16:02:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7158983FEA; Tue,  6 Aug 2024 16:02:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 6 Aug 2024 17:58:08 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: fd6e1c41b9f7bdda2f5c4f2aa73aa9a4406f586c
X-Git-Newrev: 7499b91b1ee0e4ee4afaacd029b51246a8df2b3f
X-Patchwork-Hint: ignore
Message-Id: <20240806160239.7158983FEA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/nodejs: bump to
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

commit: https://git.buildroot.net/buildroot/commit/?id=7499b91b1ee0e4ee4afaacd029b51246a8df2b3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

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
