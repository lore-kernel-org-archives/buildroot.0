Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B60C27C79
	for <buildroot@archiver.kernel.org>; Sun, 16 Jun 2024 12:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21DCF40313;
	Sun, 16 Jun 2024 12:53:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X18Lfo3mZ6vF; Sun, 16 Jun 2024 12:53:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95BC940579
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95BC940579;
	Sun, 16 Jun 2024 12:53:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 45C0C1BF2C7
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 12:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2779A40579
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 12:53:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id simSMNjJUegg for <buildroot@lists.busybox.net>;
 Sun, 16 Jun 2024 12:53:16 +0000 (UTC)
X-Greylist: delayed 322 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 16 Jun 2024 12:53:15 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 10B0740313
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10B0740313
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br015@umbiko.net; receiver=<UNKNOWN> 
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 10B0740313
 for <buildroot@buildroot.org>; Sun, 16 Jun 2024 12:53:15 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id A3DBCBDE5CB1;
 Sun, 16 Jun 2024 14:47:50 +0200 (CEST)
MIME-Version: 1.0
Date: Sun, 16 Jun 2024 12:47:50 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: James Knight <james.d.knight@live.com>
In-Reply-To: <mailman.7053.1718427304.112976.buildroot@buildroot.org>
References: <mailman.7053.1718427304.112976.buildroot@buildroot.org>
Message-ID: <84ac29e17f0f002f287bad75081ea73c@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 1.0.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1718542070; bh=WEUrR5PWYJCAvX+OomRi50nfS/0Vq6EJizstGDfILlg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=eA8CcpQNigvJ+rb3b/8sSv9DduHhB48SrAaEDDSKrw5Il/Uwhfe3kMZMgqobPDcJv
 1bsKraEXNXmxsoqz5T7E+JkKqhDKMdDNeuKjjI68/yR8kn/A4E2yYqKcb982nf3t0i
 zE8tTRaTSYYTNjBPyvAeJf7n+3bQnmPYxgMAugGc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=eA8CcpQN
Subject: Re: [Buildroot] inquiry | configuring for a specific linux lts
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
Cc: Edgar Bonet <bonet@grenoble.cnrs.fr>, buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi James,

also probably not what you are looking for; and does not incorporate the 
hash topic, since I use CUSTOM_KERNEL_VERSION ...

On 2024-06-14 14:35, James Knight wrote:
> 
> Trying to figure out the best way with Buildroot to target a specific
> Linux LTS branch for images. At this time, using a setup that has an
> external toolchain build (v6.6.x Linux headers) and inside each
> project configurations a `BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE`
> option is specified to a value of (for example) `6.6.32`. As Buildroot
> evolves, it may update its own configuration and Linux hashes to a
> more recent version (e.g. v6.6.33). In turn, when updating the
> Buildroot version to use, there is a need to update all configurations
> to use the most recent LTS version.
> 
> I am looking for a capability somewhat provided by the existing
> `BR2_LINUX_KERNEL_LATEST_VERSION` option, but targeting a specific LTS
> version. For example:
> 
>     BR2_LINUX_KERNEL_LATEST_VERSION
>     BR2_LINUX_KERNEL_LATEST_LTS_0606_VERSION
>     BR2_LINUX_KERNEL_LATEST_LTS_0601_VERSION
>     BR2_LINUX_KERNEL_LATEST_LTS_0516_VERSION
>     ...
> 
> Then these configurations can use whatever the latest LTS version of a
> configured major-minor without updating.


I used to use a script to bulk-replace specific kernel versions, but 
recently switched to a few definitions in BR2_EXTERNAL/Config.in:


# latest release candidate
if BR2_TOOLCHAIN_HEADERS_LATEST

config NABLA_LINUX_VERSION
	string
	default "6.10-rc3"
config NABLA_LINUX_PATCH
	string
	default 
"https://mirrors.edge.kernel.org/pub/linux/kernel/projects/rt/6.10/patch-6.10-rc3-rt5.patch.xz"

endif # BR2_TOOLCHAIN_HEADERS_LATEST

# stable kernel for 64-bit systems
if BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6 && (BR2_aarch64 || 
BR2_x86_64)

config NABLA_LINUX_VERSION
	string
	default "6.6.33"

config NABLA_LINUX_PATCH
	string
	default 
"https://mirrors.edge.kernel.org/pub/linux/kernel/projects/rt/6.6/patch-6.6.32-rt32.patch.xz"

endif # BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6

# stable kernel for older architectures
if BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10 && BR2_i386

config NABLA_LINUX_VERSION
	string
	default "5.10.218" if BR2_i386

config NABLA_LINUX_PATCH
	string
	default 
"https://mirrors.edge.kernel.org/pub/linux/kernel/projects/rt/5.10/patch-5.10.218-rt110.patch.xz"

endif # BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10


Variables are referred in the project configuration:

BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="$(NABLA_LINUX_VERSION)"
BR2_LINUX_KERNEL_PATCH="$(NABLA_LINUX_PATCH)"

Not elegant, but at least allows central management of the kernel 
version(s) for all projects.

Kind regards,
Andreas


> I imagine this may not be implemented since these additional
> configuration options may be a bit too much to maintain. Assuming such
> an approach is not desired, I wonder if it may be possible to support
> a `BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE` option where users can
> define a value such as `6.6.` (or `6.6.x` or whatever) and have
> Buildroot use whatever the most recent version it "supports" (e.g. has
> a hash reference).
> 
> For now, it seems the tasks needed to handle an updated Buildroot
> framework with a custom Linux version is to first have projects
> track/patch the hash version of Linux any time a custom version is
> set; and update both the version and patch-hash in a board
> configuration when wanting to update.
> 
> If I am overlooking another way to approach this, please let me know.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
