Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 240A3CE8D62
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 09:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E6B54128E;
	Thu, 19 Sep 2024 09:15:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XtOrDWuOiL0M; Thu, 19 Sep 2024 09:15:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4AA1641279
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4AA1641279;
	Thu, 19 Sep 2024 09:14:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7A1961BF980
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:14:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68CDB427FD
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:14:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GczOIUwOCXD4 for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 09:14:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78DD1427F4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78DD1427F4
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 09:14:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 63FD183C66; Thu, 19 Sep 2024 09:14:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 10:33:12 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: bd83efd28888f0e5d6781ba6d4f6d89802ad8b80
X-Git-Newrev: 30f9e284d98df4c923b6f52a0564aabeae867833
X-Patchwork-Hint: ignore
Message-Id: <20240919091451.63FD183C66@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] support/misc/Vagrantfile:
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

commit: https://git.buildroot.net/buildroot/commit/?id=30f9e284d98df4c923b6f52a0564aabeae867833
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

And configure memory/CPU like for the other providers.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 75b543880ceaeb8ff039b0cf3a2ba3e1d38aba37)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/misc/Vagrantfile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 8252f555b6..1155026ee3 100644
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
