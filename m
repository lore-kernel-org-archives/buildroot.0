Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FBBDC02198
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 17:27:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42A3F81D3D;
	Sun, 16 Feb 2025 17:27:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JgfTbqUGtjFZ; Sun, 16 Feb 2025 17:27:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64FDE81D65
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64FDE81D65;
	Sun, 16 Feb 2025 17:27:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C165172
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 17:27:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A57DE4018D
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 17:27:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zoXEdDAXv6WD for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 17:27:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8916440144
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8916440144
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8916440144
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 17:27:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id BDF372003D3;
 Sun, 16 Feb 2025 18:27:02 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 16 Feb 2025 18:27:02 +0100
MIME-Version: 1.0
Date: Sun, 16 Feb 2025 18:27:02 +0100
From: Julien Olivain <ju.o@free.fr>
To: Gilles Talis <gilles.talis@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250216153441.2706067-4-gilles.talis@gmail.com>
References: <20250216153441.2706067-1-gilles.talis@gmail.com>
 <20250216153441.2706067-4-gilles.talis@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <24940c1b03672501d85bee30cea03ece@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739726823;
 bh=DvvvJJTiPs9C7PkJO4yedIt/hGJt2cu2BX/RnIsOYpM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=vNLLIemkEX9MoAxle++DlXrO84g1w/F94DBw+1AhraH4kzwkKfLxysYccrD8AZPug
 Q7v8x6aphAadPZmDaCPjPoI/b0vOLdpcPZePGhvjX+FbzAsTESMuVQ1cgijcNaQZ38
 T7CDvdq+9grLlFgZKYcRLf3u7uznXhQ+7X++jZBjpxVJJ5MiVkuRwKzpYysf1SV0MH
 A7dR8rOHfUJVlPgtmhcMGBXHcmVuQ1e3CzUsRx8TbqhsFHjqCK0kg2xlG3mKjF1b8e
 ecYwrxNnCveBQvGuF3m8KhClwoxK8SS1SyiyVRYmwIewlDRSxxyfWttSMJWsOvkf6N
 hYWqCfNXzfbSQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=vNLLIemk
Subject: Re: [Buildroot] [PATCH] package/restclient-cpp: bump to version
 0.5.3
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

On 16/02/2025 16:34, Gilles Talis wrote:
> ChangeLog:
> https://github.com/mrtazz/restclient-cpp/blob/main/CHANGELOG.md
> 
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
