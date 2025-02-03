Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D86DC02192
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 17:53:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 335FD403B3;
	Mon,  3 Feb 2025 17:53:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id acmGN6l9I_sG; Mon,  3 Feb 2025 17:53:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DDD7410CB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DDD7410CB;
	Mon,  3 Feb 2025 17:53:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 43FCA1A2
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 17:53:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2919180DEE
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 17:53:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o5UfSG1kiKKF for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 17:53:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4DDB080DBB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DDB080DBB
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4DDB080DBB
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 17:53:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 63945780395;
 Mon,  3 Feb 2025 18:53:16 +0100 (CET)
Received: from 94.105.106.182.dyn.edpnet.net ([94.105.106.182:56118])
 via 94.105.106.182.dyn.edpnet.net ([94.105.106.182])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 03 Feb 2025 18:53:16 +0100
MIME-Version: 1.0
Date: Mon, 03 Feb 2025 18:53:16 +0100
From: Julien Olivain <ju.o@free.fr>
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org, Brandon Maier <brandon.maier@collins.com>
In-Reply-To: <20250129063112.4139-1-nemaakhilesh@gmail.com>
References: <20250129063112.4139-1-nemaakhilesh@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <1c5cc20e2b0b652874fa86def451a5de@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1738605198;
 bh=FenMeWIc1D5u9sksjNR2Oc/gAmTE9P65VcrAQR/eU48=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jW6g08UqgCAikRRWPiFh59gdVRetLDzQDtGVTuY0lggv0fb7HxkFs2/WnPwYwT46T
 rJWz9nEHRy+Izo+7qkScp1VTcMRjDTyIrLtCxHD64X5knnW0vv4cf6yOXD6xfLm972
 LWJcutiNKXauJqKwFNj+UZd3oWS0t1t3cia+NKUrW+q1OXYVpnwO/lJxbnNQJHjXoE
 S4sx2IWVq1Xsg4zkTN0bMldXHYliTBTPqYXm12S8cukD/UQ8MAyiURlzW1VX2a1KBv
 xDD/EyPaiAenWxEmsR/7PyzX0sYtOsUQmI6xGA3oiVvQkth9MmGInhtE0qNI5gaShx
 xJwa6RZgaeGuQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jW6g08Uq
Subject: Re: [Buildroot] [PATCH 1/1] configs/ls1046a-rdb: new defconfig
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

On 29/01/2025 07:31, Akhilesh Nema wrote:
> This is a reference design board for the NXP LS1046A SoC.
> 
> The config is heavily based on the ls1046a-frwy_defconfig.
> 
> see 
> https://www.nxp.com/design/design-center/development-boards-and-designs/LS1046A-RDB
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
