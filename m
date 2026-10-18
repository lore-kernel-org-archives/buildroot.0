Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B32E1CCF2C9
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 13:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C95740707;
	Sun, 18 Oct 2026 13:41:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZgR3fjKtICme; Sun, 18 Oct 2026 13:41:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A5BA440608
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792330880;
	b=nDumUJecC7dQDDfmaq7QMLxWYQ0M0AmvKH9SGLt0pRvlNC96i7UwrGkUvZm0oNlUWh52
	 hMVmNwlj0Wk5Rz7AFaZonjo9t8UVbPbyjJOUTVHcnGJlJ4j1EXvdtAdgPc1snJ70ZDxVU
	 YAlOQxGDmqJTY3O6Z8oORoMdMSyDzCz2LhRFiVK39Gw7I9++xqN/SGbCLQLrxK3x+Tyxx
	 bcYA5xWESj88mUB9Q9uITkdpZiwEPWT5PtwZhuIogm3nfPy1lB3zURFN5O5SX9EJ2/vZj
	 Gp62broY6jU9Omatsaeo7piEWTHeTLYH1YYlELCwI0sG0/qCjfnHzR4Pw7cyKvO5Uew==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792330880;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=juOrSADEeUR+MEY3F8A7FB6eEAZHf4qI98rQ5wLaTtc=;
	b=XdXbxl87Kr71q94+3d1Uq7VdagPAExMyQpykJPJHvMBPhFfYwToPVJyEvGPoV+P2BG6U
	 fVkVeS8w492Sdc7xJ1gwck9tJELfUgeaSiNoZr/9k6/5KKi8Q4oGGTvmqWjEcixO8VlW/
	 x+33pzPEYGS7snqZE3xsBrkGdEa4S7LSrqwdJCeSy4nyudMRP2eMy6ueRZvaGNqK+mePx
	 oyLV22n0eL5YepJDs4DK/vJBWArMUK592RGBru4xA7d6FA2U/YdbN6hBROoOd7Tyvv43n
	 /SSmM5OKaPXBmPfl4hlzOPxOIl2NbUwJ+vOh1Xs3Q6+e9+hPkv57Mz9YjtSuhZxesnA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792330880;
	bh=juOrSADEeUR+MEY3F8A7FB6eEAZHf4qI98rQ5wLaTtc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VFOSy8mx725VaFANDD0rSN9AgUJgV140wwbCEkibcVQTUDl2gw1oASSkA5qh7vrL5
	 Ceka5hOqCbpJk/2W2318GrWONB3A3+s3Hzv5OBh/p41pmRoThZzdbBG13JIWu2q+mb
	 fdn/oQ2S02/StaYcFG0dYn1JEackudQOSNeDebGfGRN2Ago8hGGtkyyybeyCNJfxcE
	 dkcQgOJDQ1cxDh/SROVBekGDzPKYNN59qAGyfFNEcuEhmZcwoHwU26Y79X5Ism/hn/
	 b5p7JEEw2APoibsU061RNE6jD47eub74uGxMcLEmoLjLjSLj3g9Sj6py1daVa+Ynpo
	 1NN0pZh4PJqBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5BA440608;
	Sun, 18 Oct 2026 13:41:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 54AB2255
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 13:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3BC20400BE
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 13:41:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B5P0FwzrXs7v for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 13:41:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 982564005F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792330877;
 b=eV2OQ6tpP8NYzKepW/n3HgZX12Ii2uxygGkGo09xhEPb+q1totEJtk+xvxJOSbXu911i
 4+kOEtW0/HQ769JpIp2jPz1PYa3gtZom310kPkpzIZxIL0b+hZB9pI2UuTHjYX1gS0Mpd
 fNt/GAvKUlHM/qDCfRfMjp4hv5XIvhbFB+lDKUs8EibNvy0i1NrKcPdGgubJAm7EoTOPb
 tKtdym+32NxhTjwVHvz/pDxhz9sgNHtzlvQhpuuN4ErTI6tQDZPbeCZdsP4tqnBU2bl9I
 gGu2XYkWa70AWWVb6lrU0mT0qFmzv05T6iQqUu7qcyRmtakG7+YEqmyd2eDAX+qLmHQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792330877;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=p+f9OP1OR2UCy9p7dXds6ZOHgx/7Pvekd/Lo5cOF+40=;
 b=Sg1Ms1A47Cl8gOftHw1gP4xXzBeJ5auRoUYWpZ7aX64bDu0kKnnGqvFgAaLaXyNTHPH3
 Lz+YG5i2gTScmTX5VGVo9ec4EllX6chRR84XhZTi4g7FMQ8qahtOzmgLeehA6hwacdj8m
 +y5uaK8ORMhaHuo/VrIYvZTtGNxgU9N+nuYPCGK5JZW0ATUBqyrJ4HHFCa5IqOCyO6SqZ
 e/AK7oUhUuDHMzetX8kK2ozoGQZ/WCZc27dVkADBiL4aSni2jr8WlnyhhXsvXe+g+9aBV
 zMsTwQ3OVdhE2E3o7XsR+pwRL90G8kNgzV2G6kXVtCqeCn/mfYdW1AcSRkp6g4RnrUg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=FQ1rSpa+; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::15"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 982564005F
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 13:41:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 54D50780368;
 Sun, 18 Oct 2026 15:41:10 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 18 Oct 2026 15:41:10 +0200
MIME-Version: 1.0
Date: Sun, 18 Oct 2026 15:41:10 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Bartosz Bilas <b.bilas@grinn-global.com>,
 Marleen Vos <marleen.vos@mind.be>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
In-Reply-To: <20261015084157.1073663-1-dario.binacchi@amarulasolutions.com>
References: <20261015084157.1073663-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <7b9daa6d9fae996befa9ed2343cfd80a@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] configs/stm32mp1*_dk*: bump Linux to
 6.12.112 and U-Boot to 2026.10
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

On 15/10/2026 10:41, Dario Binacchi wrote:
> The patch bumps the Linux kernel to version 6.12.112 and U-Boot to
> version 2026.10 for
> 
> - stm32mp135f_dk_defconfig
> - stm32mp157a_dk1_defconfig
> - stm32mp157c_dk2_defconfig
> 
> The removed patches are contained in the new U-Boot version.
> 
> Tested on STM32MP157C-DK2 Discovery Board.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
