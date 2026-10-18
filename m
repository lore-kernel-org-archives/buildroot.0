Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DADCECCF2C4
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 14:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADCC6606BB;
	Sun, 18 Oct 2026 14:28:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MBErcCujxG9J; Sun, 18 Oct 2026 14:28:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D611160659
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792333706;
	b=kLUw5HWeOCw7kLQefwPb4KLaKBUgb4FkO9lRbrO/Z6Ixi6GDt4horlEuPrCnARl8mLGf
	 BnwW4F37sBb8aRB9NdDB6D7kqtlo+DWqVH8K9nyn2BOLCTw1bY7xC9MLsousLQ4NF+YZY
	 FyRo+wHltNJPJMuK7hoZ8oSXV7ikhfDv2yI7bE4iaPRibL5Dy9SzORxTzEKbvNQo2Irra
	 9diFYQE+XkUCpaRnarwbMWS/V6mcXHkzG5+pm0f18dH05emEF7tU9mhKOGPV73Hho6Y1k
	 mA0RCmkRxfRFKp/aGrn5ohzaSnO4PJxrwg3XY7hpj7AL499UMlGciAkYwJOJdmxbPxA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792333706;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=Fp5Z3qtLJujiCOzoJg/CODeqAia0Omr1PYVsLIW/mME=;
	b=hbVv51EyJQUd9m6bFHE33iwoIclw0m9K8jRghwy+seqhDjYy5/zo5Urwl/bFhAV8rJEM
	 BgdxHUpp0BH3yW6/wK6x42o54m94jjdG1z79A6PtD2CWb8yaFoDaZffUTBSsypXbE98J+
	 Uu31Hk/UMxwJWbI95ttTqMH+KAfXCfTyt2OT9Xt1xe5v90Zfr3KpHypXT2nVNB0/szf5f
	 1NtLs9sY+f7gkfKthkbA2yM7sQQYxk8ADDMCU/DkzgpzSBVgryKfZlikIlGaItMcNbicN
	 YiH/x1CkB8Y7m7TFkHroHfQVvFqI6TluTrz90jJdzUoun7alr1OfyfnkwS2gBhftVxw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792333705;
	bh=Fp5Z3qtLJujiCOzoJg/CODeqAia0Omr1PYVsLIW/mME=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hg2wcWZvUbfg8ql7R5GbRbuAd7sIKIo8EvnY/l4Wk2/ZEihUPfkDTDSqKPEpPbKzr
	 plYQWP9TFczfjYsfQacNYWXX8GvIksPRqMAYp2PCHePUvVfn85JpVs9bTRD5jfYmtb
	 gWQ1am2bxA1tC6kFNWLubSW14Wyjnhvn6hsBU4v22XJVCEfPyZ8GhGZ1jyoyAS0gVi
	 Y/V4aekemgqu+KIHZmEkLBuAxWe2MnttSLAHraEnyIzEo92Q0dyNqLFxTHRDp9FaOA
	 KpVa8oAma7aMruZc+x4GqUaHS5swcbFnWMmXwXp4D5iMSeKNq9LtmfMC/IxRHNwTVy
	 +5vLX1ROW3e3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D611160659;
	Sun, 18 Oct 2026 14:28:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C13A2A8
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E88560659
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:28:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4gcU4ebot3sF for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 14:28:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CD45260652
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792333705;
 b=kiU1JFNkRgWDdVnpKKhH6yRW4GBpctCeANlffvoDdUaPkc9QBcHKZ7tQPygmvJEX7Bkh
 CZos1p/2oiv4r3BNeT7WEO59Di7jmQGDHYwu7FLNVNAGmEBOu5g2vDMiSwIvmXQ2mGMlH
 HZaX7HlfVQZ0IREpNumnA9ATenVodYeH1s0/THzAs4y4nZkjFNvFU19u6l3prJN5+tsVU
 AtK0/oRIMwXdXtxFLeAL3SH1Zs5obU4c9/zsjGp6CLau4p6lEq+u/ImM4A2sveNC5f2OT
 jBN4p6N2GixZQCnAY8nK7y3OSbVKi5k496psUxXAUnbCIGFtkTnLipCnHQICVg9iZNw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792333705;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=awyLErPRQ77I/ZziMpclWd3944AdbeOe5V0WcJCQt/4=;
 b=fPmyiEZT6OQqsKeN+C2utdeZbEVW0D3R8YWVWBN9j4R7l3hD181mfPgGCCg0e80r/eTR
 bAVcfybI/3UJdZsLVsSXEqnYvwq11qcc1n4/2SpKoNx0Lof71eR8lu/wr+VpSNq/KdGEH
 YJV8VQRZug2ceVKY4tIfW5+KR/0i2dMiV/C24za33lIdwwOtmWzGnSyV7Q3EAcU4gtios
 Z3rt/q1+CM89sRO/cHswNdu446pyXCaqkVpsf4LuuOdFknGSBDxeYgCotnliKKdW18HTf
 XuMZVId25BqB/s/QcvIFveBzD5kLBA2lu8ikIKAnTZ4R1GX1AHUVE4hq+u7uGmMxGzg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=WYQhvbS5; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::12"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CD45260652
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:28:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 7231213F88F;
 Sun, 18 Oct 2026 16:28:20 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 18 Oct 2026 16:28:20 +0200
MIME-Version: 1.0
Date: Sun, 18 Oct 2026 16:28:20 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Marcin Niestroj <m.niestroj@grinn-global.com>
In-Reply-To: <20261015215210.3426895-9-james.hilliard1@gmail.com>
References: <20261015215210.3426895-9-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <ee078601dbca97823377096cb3453f56@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-pluggy: bump to version 1.7.0
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

On 15/10/2026 23:51, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
