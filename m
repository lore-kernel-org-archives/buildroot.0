Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6770FCA5FEF
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 16:08:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C31080D7B;
	Sun,  4 Oct 2026 16:08:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sLhjSgXvl1s3; Sun,  4 Oct 2026 16:08:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 644CC80D93
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791130117;
	b=nrGjwv9+pHyfyYreS5pjLfO6l5ps2F1H2D2JvPduJPFJ154vyWPha3bx36TXizSB0fVE
	 aD27/+jtMn+wL2TxIQpIZEuwm8BIE1B0VoTDfmncrgpjNbRHFCeZ2V1zqL3mDBxjY8Nmk
	 tkp2+e31gF88uq409YQcc7HIqJVzMZcPJXXkS6bWvAiVIVwZz9Ol1r1hXO9JRgFJROV6H
	 Q2fwCVATRbTwjoTp+KqXpzFxoXDJ7TH5q4Jox5D6kd1HTnkr9cdY+tQaxJaq14hiS08HA
	 sy6Wf8293KkkJvzxSGqimsIEmZNezAxd8nriwcbCVc1LZD9nfPyFPz0nsplORLA4IuQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791130117;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=HQvy9NqEykYkEY7ivxERhYzu+UBSRm4RcTk74T50ekE=;
	b=rYf7dvyhKrOA+ekT/d+xC1JgWq40nlJtZ5kB90jwha7n6rj25muyTqCbljZewR/qoqxv
	 bWRfNj8H3xbWL0X1sCydepvFDBz9/dFZrFUqSZFxSuS+pxPaasGcqkdZ9PmFZ7bUhjCXv
	 NyPbsdROSeEwr2qoYZXTpbcTOj+gDqswgm+4vHbvPPV+iRgz+E779FzTypwEO3dJo1+95
	 jyykN09n6AkzjpBo8EgKp01MWQP63M40OVsFFFJdcgzj9foT66bgI+Z/fDAVg8/ErQgrz
	 /KXqLv98lRDm8o8QxcvbGjn94hp3vKTt15oE/iq29DwAnBbzxL+5n/leJooSjGaobwg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791130117;
	bh=HQvy9NqEykYkEY7ivxERhYzu+UBSRm4RcTk74T50ekE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CFbOhauUoMsMn9jl1oacfzWAvCLRf//GwswU+PsrSJPMLukScpaJ71i0ZOOc70yZR
	 qNJuPkR0+/8FGtnGjSlesUmvkbTtrJYq2zou0sscPRecrFnqZW7TVfeopnFdgujWdp
	 qsw483Oovx2eUd2oOLcORrdLl7W7McF+00MJQk3D0K0Q0UUsOMVLDdFk+F5f27OIj3
	 b6LiqlRqgWgo1HI7uJYKukajxu7d/4c02dFIdxOFzpMHxqPHO6M43UAXax2pqzepmY
	 BL6VtAs+6GIj4YtpgNTrnBonmJd3HNgdp/ExdMQtA4Pze1oOiNTjw4gInJBV7youBp
	 +oZiAFTUJf7JQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 644CC80D93;
	Sun,  4 Oct 2026 16:08:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9269934E
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:08:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7830880DA6
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:08:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nyaR8xx0sMzB for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 16:08:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A0ED380D7B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791130114;
 b=BTOTywjbxBr57oRgYnJxpufxUPnAFc9qL6R1k2O147BACBLXN6G2nbpevwtZoYOsfwGT
 C4xuvuqlexHWq2mgymFkDbD//piCDKQ25nsPquJo6fHw1zUoAb9H9AacmFHiT2Aoq5OaS
 91eyt8aAwGWAZgSgIKDFpmGp/GSHA7YARxKq8Vr1+7Umc9QWl/m1AzijGMls+b/RIEV7j
 CH6zOhs4QAoO+W9kg6MfjbukfPczi/6MjYetAgEc6M1/jK0NHl3SlQ/HNVghRZNslGbFI
 j5DgI18yj6s3cwUeY0OEUTV94/q/LfBz157LRd+U+XDG2ZGwGMGDTeRw2gLPAFTMzgQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791130114;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=TZuPQWnbEc5H37jhjZko03WaNJ6SzEiD1w/a5f3tTkk=;
 b=EoQAvbUcBp65qtiO+97sFVJCo7DH97d+nVL39RJOGVBqkp4UPAJPfOZzhFHob2JWfjZ4
 GiR4Kl5EF6EdcRs6Gpr3rVo0dyGttLwhC9jskyYxlGWUTFa0N0pR1+sVU77DkVeMH+kDP
 b/AP6C9B1ZniMhdnclRei0xrGyaKN/QVVH7W8o+pbzWCfnM2HjTVuY+FZaIrIWUy9tMkH
 nJ/8UBvHYTxq1DFyTpjsWY5tDNzeFVq2+MKcUMyI0TOxllhqvK03AE23RLlRkad4rL98u
 3phEiVkp70yjhuqWiAwvVArR/9VRT53Hc1kN4pB8SgKHzrE3ePaw4/MCx7lKEyI3ySQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=eruYr2Ed; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A0ED380D7B
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:08:34 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id D497F1A1120;
 Sun,  4 Oct 2026 16:08:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AA3C7604FE;
 Sun,  4 Oct 2026 16:08:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A729010328192; 
 Sun,  4 Oct 2026 18:08:31 +0200 (CEST)
Date: Sun, 4 Oct 2026 18:08:30 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <asJ5-qQu2BZy1biq@windsurf>
References: <20261003210833.735937-16-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003210833.735937-16-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-regex: bump to version
 2026.9.29
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Oct 03, 2026 at 03:08:06PM -0600, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
