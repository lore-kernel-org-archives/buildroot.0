Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 324C4CA5FE0
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 19:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F01E680D64;
	Fri,  2 Oct 2026 19:27:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dcO4UNNGHTAZ; Fri,  2 Oct 2026 19:27:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 3B0A280EA9
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790969258;
	b=opu7zr180tvE0ufuUu3unbiPs8VeHflClVY8WgJC1Q0q1lAohWbfo3i2S7r+9tscMahK
	 q96o9FQR54K8QTt9WaNWUONWMVhJ+b/va3oT6cJ51N6Rqn/kAMaLcb7XG9zwC8nHnvsqp
	 vY36n33OpXX2EeCdnWGm26lX/hEJXlQJqGADsUSx0ZNAS0onuXDdmpXiLdhN2j/a3zu67
	 s0kOykXnmqxw+2WJ2emReyO4WAAuiAza8k07xBM/zPc12PjuupaGYzdDoEEq1EQKDBC97
	 Piwx1WyPlhcI0jTu6nb6WdqfFVn4pSlh2fx/4Yr/SkKbsZvPBmX1TWzkVjqLFKSKVQA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790969258;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=RGobpI6n7wKV4/K+i+OLp5YZie48aEvyA0iOyFxoxhQ=;
	b=dQkCzwlnltMhtOkgBnfVBBkqQ+ZeVDdAevql15Uog/ZrdDDi0Fha+SXULjiHSlPFcKLL
	 k2FuEjkvqIF+1IEMMfoMalE+IeCkvwHZOAA1o21AZQ2A/OlVwPy4RAs5UnaG9DdxnHs/c
	 gpnOI3t/FRsTy/lS/azMhSPHZaZldvEdW6KEXuFwbsy/xWKYwVbrPeRY7mqMMQd7WxjP4
	 ZP5qABKBHIxVu+E01xsn7ps1G03K9ak+JxqIb3ccgzI/EencA2JBtziFxQFOAcAGi85bn
	 rndAr4sLlFD4/6xMPbZ9iUf9bBLeCYKomKnoVCAgTLuYX0qxXOwmRb1vOYym7eA1ZOw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790969258;
	bh=RGobpI6n7wKV4/K+i+OLp5YZie48aEvyA0iOyFxoxhQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KD8ILdjOg6EUCD5isoy+/Ph8aYFHKd9Rq9pqAJiWoMX424zkmfk6oUpmhjNm5iAcT
	 xfwanZ+waCMf9zheCMJocHHcLCDo0jXng8TYGjITfUnNqZezdkhaQiLFsStszmgLX1
	 k403j/6tctfZIP2ELUnX77urnILIoqDTrNJX4vJD/RFy2JQg8sUngGLYwo4AD73m3u
	 i6lAAkJ9dkO0QwEdXNw77JaacWNnpuBEoXzXbt7ZtGw8YExhSws8CtDxIr3ZIJ+g2C
	 Fn79DGWorPPECWGyCqdqfXfMeDKUFXzcYqsCeEhfPo6tgZJ9ywMWBPqhTSrjiYX/G+
	 XYMKID5LR6Ekg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B0A280EA9;
	Fri,  2 Oct 2026 19:27:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DD5B21D2
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:27:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2C5180EA9
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:27:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KG6Gttl_bJWk for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 19:27:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org DA7E080D64
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790969255;
 b=S5B9IInAnb6Trhx+swXRdVZeiTMBYgvWNKvi+b4OK17WXTly7oSoiJwxBYyGkqrUe39C
 33vqUgUXDMt0xAvUbFVvlZe6CB/q/3GvChXEwiZeRFQh+H3iOVSG49rgOYlzoP1KtNl4d
 8+hhAvhZ6/xyIXpmLC+AHIxvCFpXlbfE9Zs+BJooae4KVqRYU0lOkBK5DL0KNaNQ/Ogmj
 D20lykneHmNSvGuePezOsETGx1LpAazapbgDL0rRYXzJSQb85qQfZFgZddbQo5YfnAok9
 r8AyU+wupff758bkj/OZqZ0wwXKs4Bcr9GsrCoXjmh+rlu58F36GwjxikIqxKXbQMNA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790969255;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=HlJPwcKZ223LeUNi3Xn/7IabCX5sk2fYtx3c30g+WQ8=;
 b=iMN+wqOA0ccAjOtMlByFYZjbVTJi5T2HbYzw9E6FxjS51unWfKvFn5ttG+F0lIS6Wkda
 7WdwjOsAFGhoXYwY3ULxxVBVfGwsjErnKhbAbXAmC36xp7CzzIStWDIf1YzcDRJyOqIxR
 0pP6PiIaZ6dPrWHtAs4DL71GMtPyAbnK7VFu/Zz8NjrYkJg4tSDw9LNjd3gJKz6KfRWxQ
 /gwHZlE+WfEA2cvKShApoR1X4SSnf83lbIPAVttEM8f87Ly031cSTlkfP63qDcZ5ZXMdM
 KlTZWMXZpQErw0385aiA1gh/GJfhjhqUSn+TGK2VAvM8/Aa3jkr25PGFmdciK+AB3sA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=zivFtXkS; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA7E080D64
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:27:34 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 96EEB4E41113;
 Fri,  2 Oct 2026 19:27:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6BC45603DC;
 Fri,  2 Oct 2026 19:27:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 717361032813A; 
 Fri,  2 Oct 2026 21:27:31 +0200 (CEST)
Date: Fri, 2 Oct 2026 21:27:30 +0200
To: Paul Elder <paul.elder@ideasonboard.com>
Cc: buildroot@buildroot.org, laurent.pinchart@ideasonboard.com, 
 tomi.valkeinen@ideasonboard.com
Message-ID: <asAFmvWILxe9bCKI@windsurf>
References: <20261002102335.12501-1-paul.elder@ideasonboard.com>
 <20261002102335.12501-2-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261002102335.12501-2-paul.elder@ideasonboard.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/2] package/kmsxx: Bump version to current
 head as of 2026.10
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

On Fri, Oct 02, 2026 at 07:23:32PM +0900, Paul Elder wrote:
> Bump version of kmsxx to the current head as of 2026/10/02. Remove
> build options as appropriate.
> 
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> 

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
