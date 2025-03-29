Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 157E8C36008
	for <buildroot@archiver.kernel.org>; Sat, 29 Mar 2025 10:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D37A540B67;
	Sat, 29 Mar 2025 10:19:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5niZgfzsnYSu; Sat, 29 Mar 2025 10:19:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E10F40C64
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E10F40C64;
	Sat, 29 Mar 2025 10:19:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CF88F19A
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 10:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5C4C40B67
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 10:19:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KoQdwKeM1P_w for <buildroot@buildroot.org>;
 Sat, 29 Mar 2025 10:19:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 21E3140A03
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21E3140A03
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 21E3140A03
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 10:19:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 437A378050A;
 Sat, 29 Mar 2025 11:19:50 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:58500])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 29 Mar 2025 11:19:50 +0100
MIME-Version: 1.0
Date: Sat, 29 Mar 2025 11:19:50 +0100
From: Julien Olivain <ju.o@free.fr>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250328192656.2035235-1-yann.morin.1998@free.fr>
References: <20250328192656.2035235-1-yann.morin.1998@free.fr>
User-Agent: Webmail Free/1.6.10
Message-ID: <8265da0eaa57e46a0387ad8c84ee07ed@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743243594;
 bh=CMZ3g0FlnUi1fQNgcNtXIlg6I+S56e9DItR5+k0wuM4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dTlXFY3qxeFwaSrVgfb/RUTS5IJXAqV1uIVdQlArqyNfIb5zOEtEEMWZCck72IDsJ
 sOe8IRp9Rd78TzK4cBDTAodFeC/BAzpOfnIPNx9NwB1Y4ETW5BScyO0caGnvgrrD5N
 8Jn60OAJURWabbSCbM5NVzIzzjh+MsalBYQuPTWBO8xMONnawa4hnAk8dzsym+qaiA
 BEn/uqdQeYOj4TKJ8PNyGSYrNQvaxPixPmLCjgJfPsn2juqd1odcssVcmhov1FxO0N
 VkqFC1XM4Pj/B/USp96L7qqL+CwH0gr3MFnjT0ue4WSK61QDtpS5Y9X8vvuGQN8Wki
 zOH3NwVFnNrWw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dTlXFY3q
Subject: Re: [Buildroot] [PATCH] package/libcap: do not attempt to run
 ldconfig
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 28/03/2025 20:26, Yann E. MORIN wrote:
> The libcap Makefile is hand-coded (i.e. not autotools), and hard-codes
> calls to /sbin/ldconfig, unless it is installed out-of-tree. For target
> packages, this is done, but for host package this is not done, as we
> do set PREFIX instead, which causes libcpa's Makefile to call ldconfig
> and emits a spurious warning (twice):
> 
>     install -m 0755 libcap.so.2.73 
> /home/ymorin/dev/buildroot/O/master/per-package/host-libcap/host/lib/libcap.so.2.73
>     ln -sf libcap.so.2.73 
> /home/ymorin/dev/buildroot/O/master/per-package/host-libcap/host/lib/libcap.so.2
>     ln -sf libcap.so.2 
> /home/ymorin/dev/buildroot/O/master/per-package/host-libcap/host/lib/libcap.so
>     /sbin/ldconfig
>     /sbin/ldconfig: Can't create temporary cache file 
> /etc/ld.so.cache~: Permission denied
>     make[4]: [Makefile:200: install-shared-cap] Error 1 (ignored)
> 
> This is just a warning, but it is incorrect still.
> 
> Fake an out-of-tree install with a non-empy DESTDIR that is just '/',
> and thus does in fact not install out-of-tree. This is enough to
> actually silence the warning. Add a little comment to explain that.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Bernd Kuhls <bernd@kuhls.net>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
