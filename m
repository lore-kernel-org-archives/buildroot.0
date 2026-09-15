Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C916C88E77
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 17:28:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE3DA80E14;
	Tue, 15 Sep 2026 17:28:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mmYC6e-yeZuo; Tue, 15 Sep 2026 17:28:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E340580E02
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789493302;
	b=HybTCSXMZ4A3WrbbKXU5WcT9+rViQs3GkbJDlhPsD2jJswmpoGHg0gZvmYhj3i9x7B37
	 5a4mc8OkXZqmnKzUoUWi3W2KBdbVptYwSRa8KBW6asJ6NQpck4VROJ2Kopt70BoPeBxP5
	 /wr++OvFJPhUc7IKB2ftbrDrAlDjdRmYV6JPsZLyB4kbw1Q0sMQZ5okcjLzfcaPS84c7G
	 VgdQi8JK2Tm6FzvpyPDLqjpUKALJ93CG3/km63WCK8n9pSPI0kVowIhlrSKN7KBA9859s
	 Z0vyPnsgyluW3N2h96x+kraQSI2DsPO0RsHVH2P1GqBHaxIfqGbEX3Y1mDFeXGQkjEg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789493302;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=RlOCEIof2IOzv9fFLpo9W3Fe3m2B1gNqseh4/hW4ltg=;
	b=XQ5bY78N0I9dBbsV9JEF9zetcn+A35iMOs7Z5+WdALRpea6WpswLI6BbfKoNqk7r5/kN
	 WD4sEJ3EIxSjWpnAosMTZKoFFvBlXM9jwMtCrQS3sNK6OgaK4QMwAObV6dK71DHQprgCI
	 zIh+Legpz0utSuhE1ElRtJvkJenoOJPT4EGljREfBerIWdY+9Ghul8BXfCbHUSh0y4h4P
	 f4EmuPIaCj5s9sJSdvIZXraypd+yPwYZ+Orz0Y1aGCnel6zH9KLqlwhni8GFhhXHZtZvi
	 vBUSn33QTJmFBBQjXObzz7SGMmPmYVW4kwYhWezcK3nntD4kdRKRj+ugJVnya7cAs5w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789493302;
	bh=RlOCEIof2IOzv9fFLpo9W3Fe3m2B1gNqseh4/hW4ltg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=onXOiUkW4asGbkya93qPHsgjggpylICAEjhYaFBqpYgsgCYRFVI+beetxeqmmmyt9
	 b41UyJ2udMa26657dMoDtnNDkU0YpcKTaKhgN9qHjGLnztUaeaFl6dVe1wQkfUgkV+
	 bK1RSBWgcdMFZj3vqVNhDHOy89+xikXhgutxpZMFMhNpmMvGR9HnGd3GpQYejFlx/x
	 jGNElaTqEDFanZSorA+kfnaiBmCC7MHh2NlATc3BVGo39uUXXVNVnUwjTyDvX4BANY
	 Eig4DLyQnmi6I1ImvsI6bz+Av3ODWdHAPAToTKTZkNGcDNyStEd28PKwo73X6f5uyT
	 b4ueSxoV1t/Sg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E340580E02;
	Tue, 15 Sep 2026 17:28:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5616323F
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:28:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3BEBF60778
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:28:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3feEpck8w871 for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 17:28:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 95E2160760
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789493299;
 b=Y5ZO2z9pmkohG9Ty6eEXn/vZYRkZwH+LQ32eno5a/H6I0TygP4jxjqUPYypTGafdoh3O
 E225lEbZ69cM7VUdMSVT7F410cpvgo4kXrWeL5N97VkncaPpiL/xvEMJfIp2UXk1Qwu9b
 X8ENu9usBAFyIa35i0bp7KGkneABpsfe97A+dsQRlQ7CB8YL2j+RjoSeX/M0YedKQR5+g
 U4DwT5H6uoTWkrtdo+ojD+Miqd6lNazlZSr859J+LH7SnxjwUb1gG3xBgwdcP4QRM/eFW
 Nsr/2e2PEgEHfZkKDcMHFGndW4Jgj0SC7jqjGaGodrrnjsKlivm4NJUdVx4WlpFj6yw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789493299;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=FUPFUnEV3goVjt9pE+t++TNbnzlIJ/TdTYkrQ/zIceo=;
 b=DI53cybGIrtNnppoMQ7/rzGM8Ioj5oThuccGegYU34/Xu+tqinI4iDxBCLsUTfmDBBV0
 fx8L7asWVyfHALDknLBhb+/ROI1Wx/Vd53I46vVfMwla/YYhuJkfdUl8bh1cNeh8xdfl4
 kBtWjSmxd2ogx5nZpY2VrxLKWHkkuclXUMyICvK4lUPJjDKqiEmBI+Rw/6VCJkzT7Y1/Z
 ULC5tRKMY3zBU9kqaPTCsR22OiV2Bb6UypWXggvIxqMQW6VKz4N58H/maQUtEq6dB3L3F
 ZkiXUfQ2Lln/UtZXzZpV+5hnGD8oSX6O0fbRLEsER11vgA9OcRiUt2/v17/21l7nZdw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=azUkHcCT; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::11"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 95E2160760
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:28:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 923922003BE;
 Tue, 15 Sep 2026 19:28:14 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 15 Sep 2026 19:28:14 +0200
MIME-Version: 1.0
Date: Tue, 15 Sep 2026 19:28:14 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20260915111218.1918981-1-thomas.petazzoni@bootlin.com>
References: <20260915111218.1918981-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <0572cd482a38703b1240d632e9d6a5dd@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/gerbera: propagate icu's dependency
 on !BR2_BINFMT_FLAT
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

On 15/09/2026 13:12, Thomas Petazzoni via buildroot wrote:
> gerbera selects BR2_PACKAGE_ICU, which depends on !BR2_BINFMT_FLAT,
> but this dependency was not propagated to gerbera. In practice this is
> not an issue because gerbera depends on BR2_USE_MMU, and only noMMU
> platforms can use BR2_BINFMT_FLAT. But for the sake of completeness,
> let's propagate this dependency.
> 
> Note: in the Config.in comment, we handle it like an architecture
> dependency, like is done in package/icu/Config.in.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
