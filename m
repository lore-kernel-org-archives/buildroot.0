Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3913BC88E53
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 13:28:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03F3940723;
	Sat, 12 Sep 2026 13:28:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kj3FsUtyozPO; Sat, 12 Sep 2026 13:28:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 11C094072E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789219691;
	b=ZIrWHAhHlHN+/AOxGAp0i8Ws+0ZirRmRxGYQrQzlJ61jK4P7sJDpS/Pubn4lA7RdIdM4
	 trC+FtY91DNz4X63HQBYVAIRjWcKuBnVWRvfj7JAOU275Pysz4lwalqUaa6GwBwBGYRxy
	 F3dN/17YKzZg/3/yt2tAM+RhcNl83VlbemkMGr3cwSQ44wjB8VqM6cl6/MDP7Tlhf6KQA
	 MXbl/OnIgRkkb35P4giv6+ZkfpaXxNbelfEaBpP8amBtYoWuVDiLvDjNmn/0cpijBtNoM
	 R5zqAA6n2++W3iBQt59rWJPzY8AXULYSOEoICv8WbRkoa52gX5rD0evAtJhe071Fr1A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789219691;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=f2q1AVN4L06k0d5px+UnI8gmgB1a6+iJDfmHxOgLgUY=;
	b=fAQVlO3Q8BXwJ+isXJeSDq70zyLO1VD6B3XzXyd+qfJ10dJ0h/2ns3nx/ExJgh4bEPu3
	 4p1B0bkzD3UUQRN0HNYq8KQtSOSGHRqxtgx5pUTkUAMqpzikutSOxdOMxBh4/EDjNUtMw
	 l+PxXHsSQ2FkBef+cUY5QjWnPXOka6y5P49ISVphSBXMVynMnojUsKnB1wT3aZVIsrx8O
	 bGWgMTS3RiXhaw23WJTwSf+KFrH8TjVvi5eDWY6oClRtPJ+dg1hdM7VtTBIZA0D0JC8+y
	 UAiz82VQMyCL89XWuJMB2jGznQvxNvNGSoujrDw8MLJQSFV8BH68KOGMEo/QkvJo0Ig==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789219691;
	bh=f2q1AVN4L06k0d5px+UnI8gmgB1a6+iJDfmHxOgLgUY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mbjfQQ/xAFHUAPt1n89X5Hcvn7qGB0/ENrgTkeDEBzkGVZi8+U5EqgsFpBHDwAuyE
	 A5IczK/f7dFF/Fri0fxBqmN6p0tsgdVcrh+TCeabLYY4J4Gqh87rAWRDjUr5xMR6XG
	 PbPrNyLt91ptic8CCAw2D3i5nTE6hQCteGOr8r5dVVtpofUvvXlJ7R/csedi51DdTC
	 /ByvZgghn44W2A8Aebzx2RtCI8/NbVuNKvtvQF49rZEkvGbXZU3mUAQb+gQBfItvIS
	 Q3xEdydV1bfsxuFa/H38B+UBDWgCfKIP8sSLfmdEtx4Tz00U6Mjm142xptHxHzz8rn
	 u9kWZ+n7Xw3jQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11C094072E;
	Sat, 12 Sep 2026 13:28:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EBD5023F
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 13:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D286E40068
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 13:28:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TpvmaYFd1K_N for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 13:28:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 7C303400BA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789219688;
 b=jfcEp+IdLU46wWId2ikaMt8mA4xavaXGTgn5hRzsn9TcuW+F7IZfFVn+62oRyA7LNQsW
 pmCriOyPxkTOcIPwFSaTG3YlOqpmi9ATRCNIHqfULNgNqy7Hgw1HTAhyQadddKghxdnez
 PMnqVzvSY2qciqFTo7rVa5fZA+RN2l8nIuHaO439chXHNPG7yZHi91kaZbd6QD0EZ8dLF
 Qy0MUNPxhR2f+o6pabWmaN850+BDx/r2qGTS/PIdnRgiqdbRCt/8ch20QwXFzWC7NW2DC
 3jHCsFK7slqnjYArSV+7ZWDwzlbjXAtgK2SP2+NS89+hf0hFVtKoQm4o4+ZRcC/LO0Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789219688;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=7M4hxstn/yZ4rpfuucn4HzpgAZXdF/t9dsKK6s0C1mg=;
 b=nEn30iIQo9BIQKJo4jlcBb5tAa1+TgfDT+gQ8cJImZVfkEmKoIqChtra7z1ZKIq6sC6v
 jbbqlOfiShD9oOYYanQwCIEkaMNdEk9Z/aKZhKqOXk5DhHrhIbFdMpX7830hvPHPc/P/e
 CXAj6dqky9mWCy6glAZ4u9SHzaPyaiHhjOjFlQzrX2hb0BAJ4AM/BbTXRGLRRznXjD1bl
 ebNS4DNK4HTzDkxbvuz0AnX32hwdR4qyb/r3V3eUWKM2uHRtYVgpj5Zd+zbzwQczhOxuY
 Mw6FrontQyGTuMC7hF4DmshA5dgkTiTj3VIIcZzhvj6ZpX0dvidx5K5DBSZ6vctkL6g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=WP1x8UM+; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::12"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7C303400BA
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 13:28:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id D5E1113F879;
 Sat, 12 Sep 2026 15:28:04 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 12 Sep 2026 15:28:04 +0200
MIME-Version: 1.0
Date: Sat, 12 Sep 2026 15:28:04 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260912120557.2548002-1-bernd@kuhls.net>
References: <20260912120557.2548002-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <1d746c1def2f4936da0b491abc4d3618@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH v2 1/1] package/libcdio: bump version to
 2.4.0
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

On 12/09/2026 14:05, Bernd Kuhls wrote:
> https://github.com/libcdio/libcdio/releases/tag/2.4.0
> 
> Disable the configure detection of help2man to fix a build error on
> Fedora 44 hosts:
> https://lists.buildroot.org/pipermail/buildroot/2026-September/809202.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
