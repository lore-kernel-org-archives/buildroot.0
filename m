Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B367EEE642E
	for <buildroot@archiver.kernel.org>; Wed, 31 Dec 2025 11:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4249F8113B;
	Wed, 31 Dec 2025 11:51:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IGV_VNL_m1yn; Wed, 31 Dec 2025 11:51:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56EA380F52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767181915;
	bh=b1qFoYILEcb3EdaJ0W7xRo10UvL4HCK2LKHaE3XzcDU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YFdyvzta5DENn92Ch+rhUcNuvcbAhT26rFIh6ZdV8SeqI42Wv8SARFE3Ot+Vxc0P9
	 h6h6k1st7vABhyopJhFSP3IM59gJ1rzCKesYzSuwQ2qRVIiE+nHvgz1zVEnf6FUo1G
	 gIbex1eAJoRNe0u5WWvx6FqsI2aKGUwWfYftPcISKeeokvzChIn0dvKkA0QpL0aYuu
	 p7PSMkPbon3GzIeK2C3yDGqf8i38ESjOvEWHTuhuVvUVM+4RU2etnIjbQS82Nw69yJ
	 eAIvl9LlG6DbOwSIv07JygTgSBlzUo8PTmJ8zX5qkG44E5OeZH+Evf0AxSySrdnCwA
	 3zPP+tTVwZyaw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56EA380F52;
	Wed, 31 Dec 2025 11:51:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 17F34277
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 11:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A10F4009D
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 11:51:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QrFFrwNLxgQB for <buildroot@buildroot.org>;
 Wed, 31 Dec 2025 11:51:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 30B054006B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 30B054006B
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 30B054006B
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 11:51:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id E41B8B0054E;
 Wed, 31 Dec 2025 12:51:48 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 31 Dec 2025 12:51:48 +0100
MIME-Version: 1.0
Date: Wed, 31 Dec 2025 12:51:48 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Alexander Dahl <post@lespocky.de>
In-Reply-To: <20251230222031.3626500-1-giulio.benetti@benettiengineering.com>
References: <20251230222031.3626500-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <2e86208414b1a0ae1d1b44e00e9831d6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767181911;
 bh=JBEnHemXzQdVQ3+Wx98mFbO/TGF7KIcXmjdkp1dyMYk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=F6aIvbkNJlFSqFyiWv2kykjtvKk3jdDo/8pyU5S45aZJmchm3QOo9r2odRCqFoUk/
 27Q9EPJaHu6pc10k2ikMXeVZQqykywTGQPRSq7/C5FrNtPdoE/lpRmVd09RFtlsB6n
 bGPFDaN5k26Tvdk3t4g96csVeuwJTaZswTh7RBqtRD6JTojq0B8Xw/+sTuzaFPe4nk
 lVVE8H9eZnsVEaV3Y6NNHRvyR7QsV9OSza5PdA06eXdOt3otocBN0MxQFX+WaoOEUZ
 jfQuwqZSBhTf1YubGtY8/bf8YT9+5Ox+WsfnH8mZTQSt74IpkQI23CGHSN045e/pj+
 ITp2A7aN3IZjg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=F6aIvbkN
Subject: Re: [Buildroot] [PATCH] package/putty: bump to version 0.83
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

On 30/12/2025 23:20, Giulio Benetti wrote:
> Release notes:
> https://www.chiark.greenend.org.uk/~sgtatham/putty/changes.html
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
