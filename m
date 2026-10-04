Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB27CA5FEF
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 16:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B857180D8F;
	Sun,  4 Oct 2026 16:00:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RZvvOUsAVKuO; Sun,  4 Oct 2026 16:00:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E2DB580D5C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791129656;
	b=n5cU/vOvAUmgftdhEZGuQ4hSfvgv0uQWvgrprIAxnOWCoTzvQkNs6p1DfKMwhBm4dNdZ
	 PIdzUkRa3HPGzeVNc/UcbYIcm4XQ6BX3Z5RLYjxjh3iB9Xud/n2u3fsa6+tBvB6b0N6u6
	 YJacgDMsIiasS3EV4JVpim9H/Dl3d4TBrInouVpjh7d4yyT63fiigJNzDRVEA6pFR6o9J
	 0exu1T1b3HzPehsJMq/IQetsHA7CIFFv8tAKbG3ZcjMOnEu8WmwF8CVkh2nTG8s9G+7cY
	 hXehW7T2MCCg4oM8djpGsjGf/QCZySUT0sNde6omIEEJZERQpbk1VTsfX853ZKZoO4w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791129656;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=iGq80NExc7ql6qTL4WuDO6mfLRTLVheuKptdWeNGEsc=;
	b=fJLFOAVsvC9e2j1IaBgoqPVpWZNcfEFf3PgPonYi45sqhmw81FN9yoDmRgtRkPyKAQdG
	 na3LJKtWQokJ3DXQij196ydyhfw6TREniWNGQplsI5pfURvQ09nVrMu52aP6GXjwLRf6u
	 Q6Ic10NN/aoLXKKnttDrjSe6ftZJgvuOAdGkUjajcX4h4p9KzgjbDoGEewx+PwqVun+ak
	 Xe5hysbc8RBivvlsQlaLOcxgbH9ufmwp6xqwgOzZaQZ1X1Oj7gsapg3En2aFcweUckfmW
	 iLKgNCiK8VuaJdt/3z8vEiz384oY8jToaR+o92LG0Z2YKGjwb3VbPRk19yYpI1TqFfg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791129656;
	bh=iGq80NExc7ql6qTL4WuDO6mfLRTLVheuKptdWeNGEsc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Je4BuJV1lUzBPxmLkR3cmSsYgwMz36cCkm5sepRCihGlUipyFUsnKcgWZuhz4TAN2
	 kPqJWptmez5+0WN4zOSQskJfTfP1NT4cOQoq6e1HWpRktQabOYHSWqcC0aHREn62tJ
	 OjJnODJPkYxf43pEHdyqJmbjXQn/9eCPhevKTHsgkCJ4LKpF/hIJQqIxyB3fz1ktCG
	 DGL4coS7/pe+pIE4EGxpampxWoSg+mvkJvFEczGGxf9kWw/SH/ssAZFINpkPi/vEFX
	 CTzi7S58OKcYi0/57vtrHsiGR5d/6MHCJAI/cIBFV4QjBvZgWWSYu1r1BN8jpVuzsw
	 1/PUJV09+QN9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2DB580D5C;
	Sun,  4 Oct 2026 16:00:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F8102E0
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:00:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C89D40068
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:00:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rn34cCOdrQgV for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 16:00:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org ECC2740049
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791129653;
 b=MbvhfBJg+DRogmKKwCq78dsYnwsc/qOdhS9GARBIhL4p3foxhBmqFT53uuNVefNTjNyr
 UXIKG60rzQq93HSSDzotY/wj+FuQN5shDkmlbjmAVAcaBq5LAkBl3+8uAqfejQkk1XA/U
 EKmiahBUN3b4WEJd6bsUtl2WZW5RQJYnTAKHYfnLZQl9HaiRL1aIEivdg/xrjVZsz/CYX
 9CjdwC8hQDdYAmNdWFSW5HDFnYGdxYWluxRNym0CtzIbwf17LQFQnmgJljWoVNglgVQwq
 ZFxQ1Llu6Y3gRerRKI61+si8CMJ9eKgLhgSvIjKBaYeVTGuf/E46lngFaZI5xKOR0FA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791129653;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=ixF8GQKT3gxHnPeuItUqbyL8L7JwuyvpS05MjLhBai0=;
 b=AREee5S5qN8cQ6e4rmS3NAviPg7LdlSxC5Blr7p9XFpiPAQZeq8hNgpLNKZntvap3qoz
 Xzbof7suNh0EmzwO/pf5ijM/8qL3f8RRB6Vth5xqULXeDCUrVCKYZQGYP2HiFDlCCD/tE
 YdkpkO6azLX+fesKNF3z56eTU+Ac0m+vAaSZwnrbfF2Xvmg8pYzIjAK3o5Dyq3/fhk1Vd
 3enYZi3RMZZepqNOIFOTZb2uUSWOghFEeZag33sq/RUlMYDRHGQuAZlp5fRRxu6PFRoTV
 5/mc5hGVXdzHAuKDbTLH5GahH2GGbwb4mqSVulnw8eYP7l5yN8kv4pZ5szSYBuQ5TwA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=IiDxmQTT; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ECC2740049
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:00:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 3441D1A1133;
 Sun,  4 Oct 2026 16:00:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DC2A5604FE;
 Sun,  4 Oct 2026 16:00:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E0538103281F4; 
 Sun,  4 Oct 2026 18:00:48 +0200 (CEST)
Date: Sun, 4 Oct 2026 18:00:43 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <asJ4JkX96zxBfW1l@windsurf>
References: <20261003210833.735937-5-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003210833.735937-5-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1]
 package/python-googleapis-common-protos: bump to version 1.75.5
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

On Sat, Oct 03, 2026 at 03:07:55PM -0600, James Hilliard wrote:
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
