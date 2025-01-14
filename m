Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E87E77188
	for <buildroot@archiver.kernel.org>; Tue, 14 Jan 2025 20:57:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79D5441365;
	Tue, 14 Jan 2025 20:57:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6kJEBdNNJvP1; Tue, 14 Jan 2025 20:57:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D568C4125A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D568C4125A;
	Tue, 14 Jan 2025 20:57:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B84794B
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 20:57:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7BFAF82194
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 20:57:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4DE-LJgUtKoQ for <buildroot@buildroot.org>;
 Tue, 14 Jan 2025 20:57:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CF9FA80E20
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF9FA80E20
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CF9FA80E20
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 20:57:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 91EA619F88C;
 Tue, 14 Jan 2025 21:56:57 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:52516])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 14 Jan 2025 21:56:57 +0100
MIME-Version: 1.0
Date: Tue, 14 Jan 2025 21:56:57 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250113184815.3023660-1-james.hilliard1@gmail.com>
References: <20250113184815.3023660-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <04a2492f0d386e5c458a218a4774e2d0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736888218;
 bh=GpQJOeEuSgYq0UowPZ36fjL7FKyXbYtPeXSHMuNKppU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rjzLUACc3sdNdbRuHYTwDXpnnH9rKAwAjxBY/pjRIpZZbXDshQthVQ9gMFm+MxITx
 WeQVgbd/dTMizzmiXalj2tXuZtpjRQhvP3/hrwbiFpfcLOgyVb62O9yg1/IIoSUwIp
 aiiUyln7LRmBvnxStXg8ueJKrAwt6dBdliUGvDqRWCus3pyc67z8WnNcIScHMlNbtl
 zZjLN0MZGUoc/Kf6kljA9Ojdq2WpITugQVwdJhs+7VFl/86BTK2JCrrics1+k/rlrJ
 0yR0BwIsfbjew2LrzFvGfaAYC15sxaV7PxmINNwkc+OYCK3n620SuPAL3xF3MDHJhf
 CNsl88YuNPEHQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rjzLUACc
Subject: Re: [Buildroot] [PATCH 1/1] package/python-grpcio: bump to version
 1.69.0
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

On 13/01/2025 19:48, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
