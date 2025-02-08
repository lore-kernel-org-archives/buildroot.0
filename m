Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D748C02198
	for <buildroot@archiver.kernel.org>; Sat,  8 Feb 2025 18:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF25080F1F;
	Sat,  8 Feb 2025 18:38:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i8PJU0sSpGGO; Sat,  8 Feb 2025 18:38:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8EB68148D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8EB68148D;
	Sat,  8 Feb 2025 18:38:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 663A86C
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 18:38:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FCBD4175F
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 18:38:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WGgod2lg-yXV for <buildroot@buildroot.org>;
 Sat,  8 Feb 2025 18:38:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 699D64175C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 699D64175C
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 699D64175C
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 18:38:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 41A8F19F522;
 Sat,  8 Feb 2025 19:38:31 +0100 (CET)
Received: from 94.105.106.182.dyn.edpnet.net ([94.105.106.182:46100])
 via 94.105.106.182.dyn.edpnet.net ([94.105.106.182])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 08 Feb 2025 19:38:31 +0100
MIME-Version: 1.0
Date: Sat, 08 Feb 2025 19:38:31 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250207214758.625294-1-bernd@kuhls.net>
References: <20250207214758.625294-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.9
Message-ID: <92bf807e91598a4125e85320c430c281@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739039912;
 bh=rw3fZQQJioVRy6l6h1i+UM/09OuQU/AMbcF/UCm6aQU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=u3lxzxdXx3M2AXnE1dEWACFtdLCaYukG1FNj/9tThYpoSb5iBVtBU/SMTA81msqjb
 WEkM0NT79AtPvZ4clK/mZc4fqYTC0K/6ClqAykDb7pTFPrg7Eo6q5x3Ek7EM9t1Ey4
 bPA9+I4QTwU04pi5jFqAB50wW2DUgrP3GB1SO3Q7duLLE6gVdOV8uElj7JvTQwI4lW
 YE6Fyb4u3qG3vx9jhXQSYoypM3pbbcAwVUpIKIZurLB1xNgfogBXFYZ4Py3qxDlCY0
 qVoCNmIgIp9wuSr7IuQsYzUr193Nx8YqD92Bj7esl1ukWJW3Z+uy7kOJPett7xEzXn
 6rvXneFeJbUCg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=u3lxzxdX
Subject: Re: [Buildroot] [PATCH RESEND 1/1] package/freetype: bump to 2.13.3
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

On 07/02/2025 22:47, Bernd Kuhls wrote:
> From: Francois Perrad <francois.perrad@gadz.org>
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
