Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DBF3CCA465
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 20:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0414408F2;
	Thu, 15 Oct 2026 20:02:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xMPwxgvCH8tC; Thu, 15 Oct 2026 20:02:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3A172408EE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792094549;
	b=alIONnxsxzpeFVZ5CCbJK+AG7p23A3KAl9v7MMxJo3hgUigzviw12iKWpVpfztF25Oj9
	 YlL3vzf+BQmgXyGqpcbUAk6QCeVDkirhV6Id3OtgZrnf2GYj8q+s5MxA2vs9jwhhzhtIr
	 V7sm4ikCuuIMLxxBhTj59pBaj6j7TpMcToLRezGGy4yPTJ02/caVVZl8Z4c2JF3YHYe/B
	 f4SgSWbUhR1hJ8qhNnTwkn+OvupSdxo5/VqkZ0cVdY5WSJ4wYkEi7ZP99C3BaB1LXB863
	 yEVcDVkazYhyZyWiRObaHau0W+pg0bdWa3YnBVFMfdxyYT0ujxPuDVOoGtTgV/ZFVbw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792094549;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Cp9qeJdupxEzCiJGcQpAlYI9Bmi7aSjh7iQm03VGgYA=;
	b=FO0DHINg3VPZWNW0bsoDddkR7F7+Om4L2sbKjRqZn3IFZSZ7vRTuYzEuQ4rHYTykR9fO
	 FEUZ5+ZSw5nLLQLIUM7nFyPb0iWMMU5dZY9tmTdYIhDu4/5AOx5GrQVNdbF2uzNpCc4CP
	 z+snwaLGCjzEVgQ3XXS7e2E6wb9xdP2wFmyqzsAhGy/KmnXswQxKeG9A4CxYINmcEnYAm
	 PlDaO2TKP9GENPA9kpRE4rhCER8pZanutBV3hesteC9Ifit9gFvVz344oUls5uTt/cU4W
	 Tm8MdkQCXWSXPCgZkOXix4nHZ5MKd4SWgOWnD0yksv5eQfn1Ne1gySuy4iEJ90vF5nQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792094549;
	bh=Cp9qeJdupxEzCiJGcQpAlYI9Bmi7aSjh7iQm03VGgYA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WJr9FZsxfTRNRbqbj3d8D6HGr+23jI9gTU0H5TS1z99lYYUC0ssXtNd+1dIsTTBRg
	 63gRywmep9ggVUTtQAe28nIaXfoYo5mQ32tOKrcc8vkFEPBbLq+bsRU5I+MSC4oePF
	 BI+FWo8jDtw3G0MQypB7uSC+1v75N7yy1yxMIvGV4EoB4cLlu/Y21WO2Bm6woLXQkt
	 TGIdP4QLnscXa90ebrafFdvK4IqEdVYJ+YYl3YUfjJSvk3hbMUi0FA3KG9d3hhXyxo
	 4SOjfQz/GrVQsgWQuDliTjhgWlcjb+EavSteyapagAhBQLJ0QiPvLsy5oN2RG1cW3I
	 sNgcgZNANpylg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A172408EE;
	Thu, 15 Oct 2026 20:02:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 871B11AB
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 78DD760A48
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:02:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uodNUlqdv_uN for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 20:02:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1A2D360843
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792094547;
 b=S92wcierK8Zt6hDTphoAf7jk3+fAgLGtNPpXgquL5W8LeJRvwbOg00WjDP3sUUrQCo6i
 jaytvxkfztGui7OdSwnGy6/BWx/d96jXfqM4pR+9voeW+ztwI0MV+Gr0fxYuLz/E6EQ2M
 tHeylm/awM6t7wMGzwltGuU64cnCgci9i0HqJ+2fkopS/F+ZFiC+e6mw39KT/kHgwexg1
 91Q6W2LivgD1CFxHDq3Al4fxte0opuKaHfLTBrOIG3g+t9W640oXdXVN+SlhrxSvcjWZ0
 FO3ruagkSnYDcZuA2sN3DUHUv5NJFgbKhpK73p8ZXTxRpPDLGt6Yw/2Y2iXURKHwg3g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792094547;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=8hdZ7cygET/0O5UVyLRDtcWl6wOftytR8RovnQq0sLc=;
 b=Y0z3YihwsBNkg++7g/CAKntYpx7987b1rWA4idTlvZ/Fgj2FkhwK0dWKPpLJlKMfZezC
 TgE/L/YUwtt/mEFjXtv+IkMvoTfroxtBw9oSplbCmiqLOwtYADmHqTaL3vkOCJR7l/IHi
 A0mVL8yExNnkHThwfhUUe1bFpgIBUFrI4Tdm3PvSh5CXG7LNX6kYtAcArNTzGGjCAOW5W
 u9D4Uhdx3FAFixk2cDwSj0TxjqNnxakHH8BFZKVdIx31bBKgPDtIvS3HVv7Zz2AwmoIpH
 vlzmiOTNr4fizIb3BVJNSsb0Y61rjkFU+drJXY0OmZhqrw1hC9ApswvAx+0pkh4iQFg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=T95Qehkd; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1A2D360843
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:02:26 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id A42FBC63449;
 Thu, 15 Oct 2026 20:03:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2B6AA6075C;
 Thu, 15 Oct 2026 20:02:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4E56910328D1B; 
 Thu, 15 Oct 2026 22:02:19 +0200 (CEST)
Date: Thu, 15 Oct 2026 22:02:18 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <atExR8rtQYPVK4us@windsurf>
References: <20261013215216.2460255-3-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261013215216.2460255-3-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/python-serialx: bump to version
 1.13.0
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

On Tue, Oct 13, 2026 at 03:52:11PM -0600, James Hilliard wrote:
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
