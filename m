Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6ED8CCFA00
	for <buildroot@archiver.kernel.org>; Sun,  2 Nov 2025 22:49:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1B9583CBF;
	Sun,  2 Nov 2025 22:49:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kKziTjOUIJcp; Sun,  2 Nov 2025 22:49:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C986D83D20
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C986D83D20;
	Sun,  2 Nov 2025 22:49:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D3E38436
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 22:49:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D05F260B3B
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 22:49:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3HQGQj3rEarQ for <buildroot@buildroot.org>;
 Sun,  2 Nov 2025 22:49:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D19CB60B3A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D19CB60B3A
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D19CB60B3A
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 22:49:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 3791D2003C3;
 Sun,  2 Nov 2025 23:49:33 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 02 Nov 2025 23:49:33 +0100
MIME-Version: 1.0
Date: Sun, 02 Nov 2025 23:49:33 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Mario Lang <mlang@blind.guru>
In-Reply-To: <20251102185409.1169454-1-dario.binacchi@amarulasolutions.com>
References: <20251102185409.1169454-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <d898031d897e94e1c199be918623d40f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762123775;
 bh=Eqf30UmBEgV0B9MjPb79ABOjJ0Q1LuSoOr9gF3Uf9v4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=S1e3WEBu+96CP8jMc5AbLjAw9Tu1bs6m1hHNNZpiJ5izwwjjgQpF6AVq6hTtdKXag
 UCAGcoQJNCc5r+p7k1kljP55tkMbHurOvPQS/A9XImp0vOWByMmigiBRLDPG1a8qCX
 E0Tpy4bvrcFa32/O/f7f1uj3PSC7QdwJU+Qn+GVDRj1sbuO18yR58ubrPE8sJ23MeC
 Wc1auBxqoDlUOUcZSqpxfshCkwdDdwLMA1TVmN+f7WxeLyjBwBkXnc2pogwDnBF7z/
 hTQYV8bzYy4A2DF6r/NnWLxh4TuwvzdO72G01gOERwnoJBW3ptM6O6dWSD7K4ZSXkh
 RWtiFaXFCeuKw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=S1e3WEBu
Subject: Re: [Buildroot] [PATCH v2] package/brltty: bump to version 6.8
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

Hi Dario,

Thanks for this v2!

On 02/11/2025 19:54, Dario Binacchi wrote:
> Commit [1] has made ncurses a requirement for building the package.
> 
> The added patch fix the following build error:
> 
> /usr/bin/install -c -d ../../../lib
> buildroot/output/host/bin/arm-buildroot-linux-gnueabihf-gcc -shared   
> -Wl,-export-dynamic -o ../../../lib/libbrlttyxfv.so screen.o -ltinfo
> buildroot/output/host/lib/gcc/arm-buildroot-linux-gnueabihf/14.3.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: 
> cannot find -ltinfo: No such file or directory
> collect2: error: ld returned 1 exit status
> 
> git format-patch -M -n -s -o outgoing origin/master
> Update README hash:
> - v6.8:
>   - Update the copyright from 2024 to 2025.
> - v6.7:
>   - Update the supported braille devices lists.
>   - Add support for the HIMS eMotion.
>   - Add support for HT's Activator Pro models.
>   - Add support for the KGS Next Touch 40.
>   - Change the copyright from 2023 to 2024.
>   - Document that HT's Basic Braille Plus models are supported.
> 
> Release notes:
> https://github.com/brltty/brltty/blob/BRLTTY-6.8/Documents/ChangeLog
> 
> [1] 
> https://github.com/brltty/brltty/commit/8f7d65569ef77eec8b8e4b97e68cb5689cf57ef9
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

This version still fail to compile with uclibc toolchains. See:
https://gitlab.com/jolivain/buildroot/-/pipelines/2135626184

Could you have a look, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
