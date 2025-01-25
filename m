Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C47C0218C
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 14:37:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4FAD60C2E;
	Sat, 25 Jan 2025 14:37:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mm29F5JEh592; Sat, 25 Jan 2025 14:37:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6B6360EB3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6B6360EB3;
	Sat, 25 Jan 2025 14:37:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 82CC5941
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 14:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5713660C2E
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 14:37:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RDlPXBUZp2G6 for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 14:37:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 52E8960BD2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52E8960BD2
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 52E8960BD2
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 14:37:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 68494B0053D;
 Sat, 25 Jan 2025 15:36:57 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:47700])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 25 Jan 2025 15:36:57 +0100
MIME-Version: 1.0
Date: Sat, 25 Jan 2025 15:36:57 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250124193829.3818109-1-james.hilliard1@gmail.com>
References: <20250124193829.3818109-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <cc5d27b0e41c9442a88eba7a69c127f1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737815818;
 bh=IiawMHFTCfTF2wDFrw52bMZ855/vxU+zVukL10nNRRo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eLfPHHvXQwRL9PhJKSLD5nGtbJa6LoH73xFt2wSTFYJdpUQE2HGu1lKuoUfXToRUE
 7Ko2aM84Z3qsB0DgbWpiRVsnVI2f2ZOZ5LSyvt33O4grBPH+6AHpbKYkaxRlUtTVvt
 7qMgP7AkvqgBdhwNYp1VKNJjrknUdbZ9RVBAOES0q28u7lBMxfmMze8lIqpovBZUZv
 qv+BDW4JwgBY/6XO8QnxeSaSP4VUi3eXhu+be7n19v7wNoM46aeFLAkWu2nBwnRqKv
 vNyVlnA4zJBxmCrPRQIYO1YVLFwsGpoELiEiW2QZ4nwZFrTI8wlAZoS+uuRzo2g8+w
 uWCxkRxZOezeQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=eLfPHHvX
Subject: Re: [Buildroot] [PATCH 1/1] package/python-legacy-cgi: bump to
 version 2.6.2
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

On 24/01/2025 20:38, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
