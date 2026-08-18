Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFEB7C5DF81
	for <buildroot@archiver.kernel.org>; Tue, 18 Aug 2026 21:48:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89280405D7;
	Tue, 18 Aug 2026 21:48:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZRBT5cj3OSoj; Tue, 18 Aug 2026 21:48:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787089690;
	bh=s4R7UVFGWKsfcLK2KpmIiTTXPyGVpEJYN5BkL1ViVcU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Qs00u1sar/meS4obaUG+5GsQyuzuwyb8UrgCDsoZui7RgdRqhno80CMDiTCkkcHZO
	 pETslFCc4gezpWhsqMejZwgwNEecGtTixwW0wJMh2BJ28+Va7X2oLvXzm5UPC0KKhC
	 9jFBxpAJWLsDI2LMjsDQHBZvrvIk2B8M9Cv6hDBClUYXlYXpr/2TDdnGtur3iDcRN3
	 26rv5U5Ff41kE6T6Jrv8pWpqjhK7dejr7Lk3ojZhriuEUQrcQIqHbzwSnN1AVP9JZi
	 pKqHBydeyi8ROqUGMFp/KN1zkpGYIdXdVXtPPfjpMDn0xPu1YgJdsre+Zhpb+uKkRG
	 Ox9+dEyOJKa3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C823F40762;
	Tue, 18 Aug 2026 21:48:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F47C333
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 21:48:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85DA040077
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 21:48:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0srBVCxQhp8l for <buildroot@buildroot.org>;
 Tue, 18 Aug 2026 21:48:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8124F40024
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 21:48:07 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 6687C4E412B6;
 Tue, 18 Aug 2026 21:48:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1D55E60355;
 Tue, 18 Aug 2026 21:48:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2AE8211C74FBF; 
 Tue, 18 Aug 2026 23:48:01 +0200 (CEST)
Date: Tue, 18 Aug 2026 23:48:00 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Julien Olivain <ju.o@free.fr>
Message-ID: <aoTSw0AjOev0Ae2M@windsurf>
References: <20260802194421.1914703-1-fiona.klute@gmx.de>
 <20260802194421.1914703-2-fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260802194421.1914703-2-fiona.klute@gmx.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v3 2/2] package/btrfs-progs: bump to version
 7.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sun, Aug 02, 2026 at 09:44:21PM +0200, Fiona Klute via buildroot wrote:
> Upstream changelog:
> https://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git/tree/CHANGES?h=v7.1
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
> ---
> Changes v2 -> v3:
> * update to btrfs-progs 7.1 instead of 7.0

Thanks, applied.

Please note that generating a btrfs filesystem fails for me, but it
already failed before your bump. I think the issue was already
discussed with Julien and is SELinux related:

ERROR: zoned: unable to stat /home/thomas/projets/buildroot/output/images/rootfs.btrfs
NOTE: several default settings have changed in version 5.15, please make sure
      this does not affect your deployments:
      - DUP for metadata (-m dup)
      - enabled no-holes (-O no-holes)
      - enabled free-space-tree (-R free-space-tree)

Rootdir from:       /home/thomas/projets/buildroot/output/build/buildroot-fs/btrfs/target
ERROR: getting a xattr value failed for /home/thomas/projets/buildroot/output/build/buildroot-fs/btrfs/target attr security.selinux: No data available
ERROR: failed to add xattr item for the top level inode: Operation not permitted
ERROR: failed to copy rootdir inode: Operation not permitted
ERROR: unable to traverse directory /home/thomas/projets/buildroot/output/build/buildroot-fs/btrfs/target: 1
/home/thomas/projets/buildroot/output/build/buildroot-fs/btrfs/fakeroot: line 11: 539047 Segmentation fault         (core dumped) /home/thomas/projets/buildroot/output/host/bin/mkfs.btrfs -f -r '/home/thomas/projets/buildroot/output/build/buildroot-fs/btrfs/target' -L '' --byte-count '100m' --nodesize '16384' --sectorsize '4096' /home/thomas/projets/buildroot/output/images/rootfs.btrfs
make: *** [fs/btrfs/btrfs.mk:55: /home/thomas/projets/buildroot/output/images/rootfs.btrfs] Error 139

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
