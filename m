Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD5BE7718B
	for <buildroot@archiver.kernel.org>; Wed,  1 Jan 2025 13:00:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22317608E3;
	Wed,  1 Jan 2025 13:00:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8_PCYJIloNCQ; Wed,  1 Jan 2025 13:00:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDBA0608BB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDBA0608BB;
	Wed,  1 Jan 2025 13:00:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A1DC9F24
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 13:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82FB981C46
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 13:00:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vgiaaJ1n_qIy for <buildroot@buildroot.org>;
 Wed,  1 Jan 2025 13:00:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::217; helo=shout02.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6589F81BB2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6589F81BB2
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6589F81BB2
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 13:00:06 +0000 (UTC)
Received: from postfix01.mail.de (postfix01.bt.mail.de [10.0.121.125])
 by shout02.mail.de (Postfix) with ESMTP id 04218240D11
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 14:00:04 +0100 (CET)
Received: from smtp01.mail.de (smtp04.bt.mail.de [10.0.121.214])
 by postfix01.mail.de (Postfix) with ESMTP id DD0412405B6
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 14:00:03 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 8AF75240A4C
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 14:00:02 +0100 (CET)
To: buildroot@buildroot.org
Date: Wed, 01 Jan 2025 13:59:04 +0100
Message-ID: <6114083.lOV4Wx5bFT@kilian-laptop>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 2219
X-purgate-ID: 154282::1735736403-9EC692C4-2E0F70ED/10/3626336762
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1735736403;
 bh=alJW/hZpKwN0/rbdLp6PBz/6cPbZA/FcPXRUID+xy4U=;
 h=From:To:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=WbjZBePQnAtpkf9Vrv+nMmvKPiDWboepErYmtr0rk+3OmF7CHFRGdSZz/siCMrap0
 O2Hgf40EJEkEbG9aeu/1GWbi6CuK2MmBU4McSW6o4DdVnG3VmO0L0BixeU8n42WsOx
 GJLx2gR5PvHtusUqzG+ecn8MV7xV9eWmPHTg7D7fV523WWJKIrhcXT042MiYP776YR
 WBZsZKQYKVuqmlkVa9ExDZYxqaSu3Xo7RNxu3VcUzv0D3lPajonUMrnfuj50dsW8X8
 BPvpPP03O9CmxVcoSaRzIDJPG7z/A+tbBr26FClasftO5X6aWOvM7ulyof9fnC7KVK
 8dG3XPU8RCL2A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mail.de header.i=@mail.de header.a=rsa-sha256
 header.s=mailde202009 header.b=WbjZBePQ
Subject: [Buildroot] [Help] Problem with BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
 and kernel 6.12
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
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello all,

I am struggeling to get a custom device tree compiled as part of a developing 
a board support (i.e., for the beaglev-ahead). And I suspect it might have to 
do with a recent change to mainline kernel 6.12, which buildroot might not 
take into account yet. Here is what I try:

I add my own device tree source file into the board folder and set the 
following lines in my defconfig:

BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.7"
BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
BR2_LINUX_KERNEL_DTS_SUPPORT=y
# BR2_LINUX_KERNEL_INTREE_DTS_NAME is not set
BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/beaglev-ahead/beaglev-ahead.dts"
BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT=y

Now when the kernel gets build, the Makefile throws the error, that there 
exists no rule to build my particular dtb. I checked, an my custom dts file 
actually gets copied into arch/riscv/boot/dts. Also in this folder, there is a 
"dtbs-list" text file, which is not part of the original kernel tree, but seems 
to get created during some configuration step. This file lists a lot of dtb file 
paths, but there is none for my particular custom device tree. So I grepped to 
identfy where this file gets created and it seems that it was introduced into 
scripts/Makefile.dtbs in this commit, which is from September 2024:

https://github.com/torvalds/linux/commit/
e7e2941300d258d551dda6ca9a370e29e085fa73

Using "git tag --contains e7e2941300d25" shows, that the commit is part of 
kernel version 6.12.

I don't fully understand the mechanisms yet (i.e., how kernel 6.12.7 decides 
which dtbs can be built), but I suspect, that maybe now the kernel creates 
such list, which is somehow used to derive the Makefile targets for the dtbs 
(i.e., which dtbs can actually be build). And I also suspect, that maybe 
buildroot does not take this into accout yet and therefore my custom dtb does 
not appear in that list, and hence does not get build. ... Or I overlook some 
mistake on my side and am doing something wrong here, which causes the error.

Could anybody have a look and help me out with this issue?

Thanks and best regards,
Kilian


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
