Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B0A9CCFA02
	for <buildroot@archiver.kernel.org>; Sun,  2 Nov 2025 10:37:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E89506F548;
	Sun,  2 Nov 2025 10:37:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xGRY3fqCJsGz; Sun,  2 Nov 2025 10:37:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E60C46F549
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E60C46F549;
	Sun,  2 Nov 2025 10:37:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FEBE436
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 10:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41DA9852D1
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 10:37:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ye7P7crXiidx for <buildroot@buildroot.org>;
 Sun,  2 Nov 2025 10:37:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3911B852D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3911B852D7
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3911B852D7
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 10:37:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 06CF519F59C;
 Sun,  2 Nov 2025 11:37:43 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 02 Nov 2025 11:37:43 +0100
MIME-Version: 1.0
Date: Sun, 02 Nov 2025 11:37:43 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
In-Reply-To: <20251102082949.4515-1-bernd@kuhls.net>
References: <20251102082949.4515-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <7cc9d15d3ea233e66b925a1c86e569ee@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762079866;
 bh=1SDgOrKSEIblJmuOqRN5AIiWyvk59d4Bmmar60F/nS8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=q/TQ25we698lyPaQG/XV5fXXNh8OKXraPU3Tu9E3I8TV1js7SVUXDjdsyCgJxuGdY
 mXiRX4uwv+iq+ZpEq4/Q2ty7S+r6VkPJTY+DwQ/Oa0bXYNPaT/61QIzBOCcrI/xg4T
 BzKh64YuIeW6hZUEqzLRNIgpWy8IEnj+EpmqXCVvPIHlPFxYgBQL3Y5pNVopU+oKD1
 EymiCS0qUDGDKLf9jZTtHu6Ss/q/SWe/xbSxIHhx6hjyo2h3fv1SliCh4mPaU2bdGV
 GXBPOr+FVfm/qQ1HXfTjPLhtJqUqGlPWRRJ6B+tL44BH6WpUeQd6kKJP+HebxVyLcF
 NGL3OL/SyWqcg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=q/TQ25we
Subject: Re: [Buildroot] [PATCH v2 1/1] package/exim: bump version to 4.99
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 02/11/2025 09:29, Bernd Kuhls wrote:
> Release notes:
> https://lists.exim.org/lurker/message/20251028.114149.3bf19800.en.html
> 
> Rebased patch 0001 due to upstream commit
> https://github.com/Exim/exim/commit/cd43f5ee0f7f76f0d624899f892b10eb5f40a37c
> 
> Rebased patch 0004 due to upstream commit
> https://github.com/Exim/exim/commit/834dae55650eb31b893242b9d50b477f5a339bf5
> 
> Added patch 0005 to fix cross-builds.
> 
> Added ldflags for mips arch to solve build error with 
> br-mips64-n64-full
> defconfig, code copied from package/linux-tools/linux-tool-perf.mk.in:
> 
> output/per-package/exim/host/bin/mips64el-linux-ld: dkim_tmp.o: ABI is 
> incompatible with that of the selected emulation
> output/per-package/exim/host/bin/mips64el-linux-ld: failed to merge 
> target specific data of file dkim_tmp.o
> output/per-package/exim/host/bin/mips64el-linux-ld: dkim_transport.o: 
> ABI is incompatible with that of the selected emulation
> output/per-package/exim/host/bin/mips64el-linux-ld: failed to merge 
> target specific data of file dkim_transport.o
> output/per-package/exim/host/bin/mips64el-linux-ld: pdkim.o: ABI is 
> incompatible with that of the selected emulation
> output/per-package/exim/host/bin/mips64el-linux-ld: failed to merge 
> target specific data of file pdkim.o
> output/per-package/exim/host/bin/mips64el-linux-ld: signing.o: ABI is 
> incompatible with that of the selected emulation
> output/per-package/exim/host/bin/mips64el-linux-ld: failed to merge 
> target specific data of file signing.o
> output/per-package/exim/host/bin/mips64el-linux-ld: attempt to do 
> relocatable link with elf64-tradlittlemips input and 
> elf32-ntradlittlemips output
> output/per-package/exim/host/bin/mips64el-linux-ld: dkim_tmp.o: file 
> class ELFCLASS64 incompatible with ELFCLASS32
> output/per-package/exim/host/bin/mips64el-linux-ld: final link failed: 
> file in wrong format
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
