Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29CF8C79FB6
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 09:15:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC44140702;
	Sat, 12 Sep 2026 09:14:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lb2_RvEfQ0TA; Sat, 12 Sep 2026 09:14:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7C0B340676
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789204496;
	b=ON7UcsyXc03DSi3wihSidl1u6VarRday+kXNRv0pp4p6VHQUNOhPZza5i3mmoGkJcS5q
	 +T7XEbfpV2lDcB9iYJxJhnasX1w4CHc/2NBThHojjIwQqH6Jnfq1go5KoJscRBlKoFc9u
	 QbPqbkvgg+LoK/+qmd5iVgD7MAYw0qpAwnaahyJryb+hbuomrdMo5qOPDoutJCEhqdaQj
	 zxDbI/O2hRw0V+JCTdtlh+Kmo6QOiHS4ND0MeEq9ahEZ8rzV7lVdZHGoKNHxEc2WPVA79
	 pEHHziteEK8Ar+vewsWrTkhCvpQv9lgvaiKBGMaByZdSqG2biywDusjQooFB6uFJPoQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789204496;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=SJ35ialyZ+GACtJmNpa0I61kF1qGnk8AbrTz/3PTUIY=;
	b=GJsBBHV+Y0gN9+JBfZyJmLHqmb9YrKpWJBKShiRyPKxRKTDlK9RohD8/IVTtfBiG+AT6
	 XNWfVHKLVrxs6v216vz9p+PMgmIjIc8WJfAD29vt5jZTF6/njDb6J4/LyGfSCXFM92o97
	 kvLeHbcuSh6p3RpjqmW9a+4dYB+/lQcjZ47I5nAD/xL4PD+ndPLfMLAN78Maja7qjTWa3
	 a0dX3i3bR21hovmxiXykOhoRL4Wb4dlTSPvJYrwQrPregpy8tX82hEx1Ck3hwa18YlSgI
	 X4534SJ0ntt01aovX09vJkyaXNe6f37HfsFnegkVgbQa/a6VUALgTVTda0EntrP0IPA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789204496;
	bh=SJ35ialyZ+GACtJmNpa0I61kF1qGnk8AbrTz/3PTUIY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mnCwEF4+55ElcunGJxuTY22aw2jLKo5WtpyBpn0smHl8TVGMnniWsSwPrASsEa63z
	 6iE38805C3dFjaqv7spsLaS3Rd9rKzEyeIMH29fV6rQH80/W0Tn8XWA1YHf89Fhjbc
	 WLcwBWfDAMuv3uHsPi7uWJo7anZ9RpvY/FPSnCwS3+9WwHPRpDzlqhIfSg9osc1Iz5
	 W0fa68jLcQZ2+oEm6qwYvoKHyJIEtoxXzOazl07931ZWygwQY+1j+Vbn/yo6dB0eGj
	 WZMtseAZ6mwRA+7P4uOe+3xotHXd9a6RKjBamkyiW7Cf/B2dL7VOMo/qkUFGBYlWIs
	 q+tkHZyEyQHbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C0B340676;
	Sat, 12 Sep 2026 09:14:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2758B49D
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 09:14:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D0C980E30
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 09:14:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LqlhkDnGcLq6 for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 09:14:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2FDD480E2D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789204493;
 b=aJboE4CkJ75SF3tOiueeG7ycFc8JhLzn7LYrXCJ2qGLC5ki5gU5Db9g2tDawracqvhTx
 crL6u0axHtcz2+tTu9Y0V8tlRg8iiHet5j4y3ccW4lXRLAL18/NVMIGkTadJQCaozkgmg
 inDPTZ+6SigPUyd5JyRQIEH8njO4YwTSOsf44grwjs+oAvGB38P+peyUt3fXRd8ruHDbI
 ZQh4Dt634kR8GRKtNIf40gYgTWPZJr+oIM/jDY7gc8LYCLVrxZnJenT/df1OpkZn9qVFx
 Nx3wBYaFrtwLjCXp/rYpzCd6z/qkhTDfk9buDwpxx1CC470/yylGURtlzwcffr5N7tg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789204493;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=wXUYvrgmPMF0h/K5Z9tSGVeG/2UvjIyaPdYTFvpa/Bw=;
 b=jsR6kMRBJaLEvqi3mN4bOB5wW0nhfIQnNis3+/dTSaPdVQ2lNB+rphPW+ey8bsa9Jimr
 7sFnyEEP0s2QTvmi2t5zFDuUvykjXPySD2d4c/cPzJ4NCROTez2fFrvwg4XA2Kr8yO7Ss
 l3iiffSerkPQRqsS447mce/4M8+K9riHAMP5SVNd9xTxBO+NgwD2wh/oxrYKRPXWAcI56
 2IV2UQNc64mZUUM0Yy9iogeZxDNhibm+di1Giy/qe9X698+Jw39zsD1WiX5dRCWxe17fp
 1ipETSqfzpreKJn3x4LFrPiMC5BYtt9NmyvgtPRwVngBgSf/9ef5otEd9/WOiaNdRDg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=qIrfSR8r; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::14"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2FDD480E2D
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 09:14:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 727FC6013A;
 Sat, 12 Sep 2026 11:14:47 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 12 Sep 2026 11:14:47 +0200
MIME-Version: 1.0
Date: Sat, 12 Sep 2026 11:14:47 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>
In-Reply-To: <20260911200326.2421678-1-giulio.benetti@benettiengineering.com>
References: <20260911200326.2421678-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <a459db5093212dd483bbf8ee07b9bdca@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/libnss: bump version to 3.129
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

On 11/09/2026 22:03, Giulio Benetti wrote:
> Drop local patch that has been upstreamed.
> 
> For release note, see:
> https://hg-edge.mozilla.org/projects/nss/file/NSS_3_129_RTM/doc/src/releases/nss_3_129.md
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
