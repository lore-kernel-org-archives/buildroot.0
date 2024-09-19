Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23DCFCE8D5F
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 09:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB44641348;
	Thu, 19 Sep 2024 09:17:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5OxFhnW7Xb5b; Thu, 19 Sep 2024 09:17:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C41241463
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C41241463;
	Thu, 19 Sep 2024 09:17:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1097B1BF4DA
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C32D414E7
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:16:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7o8VS3Uv3Ox2 for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 09:16:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E45341509
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E45341509
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 09:16:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 395FF83C66; Thu, 19 Sep 2024 09:16:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 10:33:20 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: f24ec49d6677b55ec6062806e38d614201824cc1
X-Git-Newrev: 460200bbe2d3759061b262028dacb6f8c1d29dec
X-Patchwork-Hint: ignore
Message-Id: <20240919091606.395FF83C66@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] support/misc/Vagrantfile:
 support libvirt provider
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

commit: https://git.buildroot.net/buildroot/commit/?id=460200bbe2d3759061b262028dacb6f8c1d29dec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

And configure memory/CPU like for the other providers.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 75b543880ceaeb8ff039b0cf3a2ba3e1d38aba37)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/misc/Vagrantfile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index c14754ee12..4017089779 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -29,6 +29,11 @@ Vagrant.configure('2') do |config|
 		end
 	end
 
+	config.vm.provider :libvirt do |v, override|
+		v.memory = VM_MEMORY
+		v.cpus = VM_CORES
+	end
+
 	config.vm.provision 'shell' do |s|
 		s.inline = 'echo Setting up machine name'
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
