Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7322DCA5FED
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 300474054D;
	Tue,  6 Oct 2026 16:31:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D31LHSfa4QAW; Tue,  6 Oct 2026 16:31:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 49543405AB
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304280;
	b=hlBNPcEqV/lHNGXYD7fbEhkkeuTR3WeC+FYVSAqQb97LpR7KixoqY7B1MX3Ilgn5kJbW
	 jN1EogeWjg9ztZ9eBXEbb3b44H8RSoy/FJ3vBjmGuBq7kGrOXMzVZH78xiDitOz9Hfne0
	 EIucTQUJBoFOv1ZLSuEn1pefY1xQkA2C+pTPOA4HJXP3praLciZ//NAqgdLb9fLcCfzWT
	 UpWHGsVIpe1/ifS5eQ1brfXKIbQe2ma0lVWKR3eL5W7RPq4pdzD4N9nl5+PaVFXzyzbGn
	 h25jyJasYUM4BIBAlnX4Bk/yIBnlIDEw2D0VX3y5guJ7oMBQUSyU2MFWb5NNZPp6Q6w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304280;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=FeM1LIQtFjnvZneUxyIDTux9HM1UVakMnhA7CbBLp/U=;
	b=JZkFuhp9yi3AyoveC0tBzzJtnZ7XyptL5cNsSylMYs2zwRKgpMJF4RHCj1kr3g1QvCbj
	 c5O6N3fiXcHpkWsiYdyUvJtz66sB+MvaKBBIHUBa3NbypEemfJrV8wEHH/YsUA4/il/aA
	 tu5ge6Grh3NvJVudXMBxH0b9uZcNE/tVZTvfMjiAi4BYAzYKz80qxl18ZsQzhfOgD6g89
	 tGhKLdySwUAJTiEHmDzNL5dCdP22mqchYKBmhT2zlNk9Yy3K6kwSBmIUjION1ABbGEQZ0
	 GFoH2XYsy5s8ZRnWStjpMrxt8DGbVHL5gWSl6D6t0bum3GC+uMt0eeMzfBKR9DKRPRw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304280;
	bh=FeM1LIQtFjnvZneUxyIDTux9HM1UVakMnhA7CbBLp/U=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Q4FgGxtWFeQr/lyOC74RUA/47TTA1JhjUC7PiU5GnqBoZugnKjXA5Imn4V6TaQ4nJ
	 DZM6j57DjBgJVvCE53ULezTSicU52c07SCPyeWZoq/AZYK/T9gZ+9I1biE7U7G8chP
	 WVevy17kVZfxhLv0LF6UTonmXHQK+x2p90x2dQEa15vgqsy5QUOOZ0Yu9B/8DPLAcD
	 XB8SLE5xMNx8BgpiyJAXrZAj3QwqmWr96PPAmGDMe9CB1ZMF00v2rMnzkQMxvuwHB4
	 S4ODEMHghZNIb06KoQ6KcZSXQJWKlJHu4H8ad/MTuaLuWpdXaUR7d5s6JlkyTXxGcD
	 xK+B95Ps9eaVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49543405AB;
	Tue,  6 Oct 2026 16:31:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F060341
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4CA9A80A8C
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:28:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G-8k_oIZXyTZ for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:28:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 175CD80A4A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304096;
 b=saMbksrvEu7jwvlb1UiOXaGD6+QWkR5ejP7AEc3xCo3FhU19uy72UEs+vrVz9mWSDdbL
 n6dqnXoVblEOGDQw8m6KEen4rzbc5In1+fD8CN7juDFRYF2RwQWskdytvMSsjUyE1Ayz5
 7/W6cXem3zIASGb6y+Vsr/gAotLPF5wOQoqlOjiii5HbXr3XDoaug7zXRyWfsE9CB+fnc
 HxewSyeMDUO+yg2bKMUgkvtLsDNBwA6PXoHCjIczZI7vlA8HaisTdJnd4acn4OOH5B6H+
 SzzWXCyE2UcCRRalZ+gAsXXwAH1wQL+UrY7xFj8hj4+zQjgSLFlNJsD3woXkHcqOlLA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304096;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=396Yd0cDXtHL5UJquEEANIDjZ5YaL973TXF94IgAf08=;
 b=RnqQKBf6sZdgaPiproWHbXxI6TaBfe122DPUk62bB/o1RQy8pO9pl5GyW41GXhUy1Ql7
 11I8IOO/yd73/rieJfK49E8aMWgp323RbHQy5HPSGURJ5DijuiwAByuo9uOzznfC+wqJ4
 botecWIKERDzfYtX/ruYyPGRC3KhMRXEzaqLwESJ9+qw7zt2gIxR44kdW3BSp9wruL3Fv
 8zGXrxOCNYKpi/J+GhSS1dOvWpuhentLyYUqHuJyUqkULXBqMmvYHKVuB4TabWlrIbrHF
 EQnUi5uj2VKH/bvQXcCp9OwEDPCXQm1iyduD9btkGts6aq3CNlFf5YhZ4ioZJD8oriw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=kRxAzFst; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::14"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 175CD80A4A
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:28:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 69A395FFB7;
 Tue,  6 Oct 2026 18:28:10 +0200 (CEST)
Received: from 199.151.230.94.awnet.cz ([94.230.151.199:41332])
 via 199.151.230.94.awnet.cz ([94.230.151.199]) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 06 Oct 2026 18:28:10 +0200
MIME-Version: 1.0
Date: Tue, 06 Oct 2026 18:28:10 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261004201853.915471-1-james.hilliard1@gmail.com>
References: <20261004201853.915471-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <b68d336dfff45111556cb4e352e308dd@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/python-filelock: bump to
 version 4.0.10
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

On 04/10/2026 22:18, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
