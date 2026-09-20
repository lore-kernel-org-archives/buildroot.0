Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B34DC982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 10:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0812581008;
	Sun, 20 Sep 2026 10:29:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Haq7UOcONd8G; Sun, 20 Sep 2026 10:29:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1D6F080FF4
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789900172;
	b=bvl7L3/pI7j7s530bgVE5AAJ8Q3Zh9rfG83PZlXBm6sXrMrRvngfWJ+WL0lSgv+XuXH8
	 KUlir9UYZbr0oXsY08p43pLQogSshc3MW73HrCRP5SwceREi8HWv9VL5OkS8Xl4RY9iCc
	 1d9sqo2+0AFHwAKwqWTEvdLK/jwa1Qyyr9euRCkfoidgNGQHRW/KLkuPN0D1jOHduWitq
	 N/onbAH++tzFMuHkRv2461ov+ZilerUADg1c39zd/8vGnrKjFV0NPO7jzaN5mPjpjXKxF
	 cc5yzlWz0JXGdo9DMme456b0rYtdOk8G6kWhJAmx73tXAb7AFG7FMpao9pdqxmxEl3Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789900172;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=fegaognaNx8CWEGyn2NhEX0YbVHUVx4gzjQhVLNfoTA=;
	b=oIF5pJGTBwY9N8qHb6kdE9zLu9puv9ryOn7c9a7zp/ZrlIDvpZmrNvEuu+C0E7gujRUh
	 oGex2f5h2ZLgzt+jc9DX13631feOUmwikOIm37y34aL6LwCorWnqj9gew8rfyqr5l968C
	 le9wKWfsT8KvOpRXQGRIiv+TJU23IrllY5ApEo0UxBbfW1XVnV4dkGEKNO5/b0lFUwlaL
	 ZcB81D7Li85pbcs85o8vAKqRIJqfrOIyOJGk9SJsf0Ug/oaLPZBDLLlkmL+w9/u/7XXIP
	 o9lPvDdt++MJHdr1fELFJ1ki0wy/4eSPHujb7Vt5rntJUFLw7zlU19bGOovTqSVTGvQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789900172;
	bh=fegaognaNx8CWEGyn2NhEX0YbVHUVx4gzjQhVLNfoTA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RFwxBW7HOqvX5zTLTWNyjnlb956OGPiwzb2la0pvUgp1A0aFwMSD/VUyshTLuBnwj
	 k6kQyC9BA+9gW9dS3Vo6iGNRyVNlI5RYrs+wT2fNpTTOfv6wx8YZKqX2vH0SctpNYK
	 TnKjakkY2XGJv9InvrUfKmvzSklW5W+rMuQODwFjt8E7K7nBqUqeBzC+NHnawo95c7
	 D5j1DG6zF03LPgHSO84uFeMM5FAEXVWRPrffe1HrHsMrxd/H1O14xreIKVgZPyXxoB
	 etczvLRhPotluM6weTwIhiMm+HqgqzPimdby7K89u0CWM30FhR550ZP005S5x3neou
	 jdrVVZAxggdTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D6F080FF4;
	Sun, 20 Sep 2026 10:29:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1218924D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 10:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC24540062
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 10:29:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ngUgH-ETDvL3 for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 10:29:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org C44B84005A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789900169;
 b=ksh8QdqGVOnZfmcULHszLBabMi69R9Yo9Se8ov1xyh4pTqdcBcLgDArabN/hLCTc6JJW
 cvVqoZn9zCnpmETYvF7PtM+m3jU2ZFpROA4pxcMfFK39jY+QqeNfPm6qiIPsGNldXzGU8
 LwhRWmUPv4wBZmiz6dkTL8mDKSeWpI36uQ7ZFIMzNZxUvjdpWWBMJikv7tmK8fIpqvkJy
 Npp0tgei55VZjAxDHyK0vZO1TqvAsJXgEK5D/y9vZsarw4jx4IrwGGlCbrzAa1CuY3vKb
 OaAObv8YNT/tSSTt0M7Q3FTijtCX5cp9BXdeRLdXsKTHq0BkGceTFkudNeJxE+PffEA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789900169;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=7qk1eNxmD4e9PCQW3QWZShzioEipfJbtv0+QplmxYHY=;
 b=AqSW9IPohY2HL+wnf5CckSAdrgr7d+F6etE7XOHhbxYq+CWOE0z/khUEpax30EafHheW
 XamhstNIYAgEGDhxWzn2cCibL3glGDXVLqxdrpKIjivXEGQAuJmgCLbl/PHZAO3/LcM3/
 zhV+2vCf1rAL3EN0G/SqGWRqlNKWQ0P45XQr8lx5IU26NjzirOyWwyGAxuVKeEkjTaw2Y
 gD5+poDoJCI1XT14O6dN5rhQNhrKU83Ta7V0GEExotNoUjB8vcexRGAzzjxpBLjmPrQoV
 Tegl7FZujEwmodYASG3hyrXz6WduVa/cTEv4ORjsLp0Kh9mgbZ+pSVCGnCN4d2vgWZg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=hdlUDFI5; 
 arc=none smtp.remote-ip=212.27.42.3
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C44B84005A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 10:29:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 3330E13F880;
 Sun, 20 Sep 2026 12:29:24 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 20 Sep 2026 12:29:24 +0200
MIME-Version: 1.0
Date: Sun, 20 Sep 2026 12:29:24 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Daniel Lang <dalang@gmx.at>
In-Reply-To: <20260907155344.3755749-1-bernd@kuhls.net>
References: <20260907155344.3755749-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <e6b29676781ab44f367616eb095db6bb@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/3] package/spirv-{headers,
 tools}: bump to version 1.4.357.0
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

On 07/09/2026 17:53, Bernd Kuhls wrote:
> https://github.com/KhronosGroup/SPIRV-Tools/blob/vulkan-sdk-1.4.357.0/CHANGES
> 
> Removed patch which is included in this release.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
