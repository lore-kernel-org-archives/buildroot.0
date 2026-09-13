Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D091AC88E56
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 09:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9708560649;
	Sun, 13 Sep 2026 09:54:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I7MrW2to3QWR; Sun, 13 Sep 2026 09:54:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org CC3FC605FF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789293277;
	b=Lb4p3IdR7a2KkoQ3Jb84h50kOSuLECgnLYMeV0O+CAWhiBzWG/crA8nVsGNmOBb+8ZSv
	 1E/UoLaMWxqZLRGQCt1kVZN9mB7s7GUGQzcVHVqPpTG124VeS1LmwjAvFeyhcdDF0a9if
	 ZhL5ynbW3tfNum9MuDVu4rumREQpFsy56IOE51G152VGRnUfIxeY70idOPMh++ZnTykfh
	 BgRiSdhqfkIBTAzrx1ZHx24GJG0WV16wuhbz/T7Oa4AxxlkkV84llypqda5073opyBjq0
	 iOYCNp/ecZqjlW9JP0yTHPx8EbwqtCzq6TdFnYl0a0JResVroZOgwOIvODvEah+YLPA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789293277;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=MR0C9H6XhN6c/FrALvEvg8S4fuTYsuf9gh35634Z3QY=;
	b=Y+EJwat/XOWKeH1NlZEwTj7HmWjdLb+PmWfmHF+i5YiPpXsoxH88xOkFWWkR+T+XB7tS
	 uDe7lCvpKBc2nvlVh1yPqV2C59FVFCDDJoxljgDcbuJo60gN1c7XTCqbrsOMokvu9o+qz
	 OAG1+Le42Jx5xHP41whrePv12mIHlUZth6j4avJWmGPSzj3n2q6TEXFes+sriz23oaJ4M
	 h29mp0xkL1h5c7vos5xuN+D3aQ5tMjdTrOAJx14unXq+yng2kzIW+xZJnupJ0+15bjLOi
	 C26C3jh19eRyTRZHhkEOGU64Ie30xcH5zMHFyfCRaEFU/68U7SN62XmMnTHKM1PjMfA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789293277;
	bh=MR0C9H6XhN6c/FrALvEvg8S4fuTYsuf9gh35634Z3QY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NnJfufsN7Kz8J47C6zerdZb/d4DNrSx29FYaJ13SJzzjehiOsTzc2l52b0AsprYhB
	 lz0+PUFD946DIxIyS+YYEUg83nHgebWDI9Yf9YKLQpPfBYK0A7/h8TJAcMQvLUwFoS
	 Ioqah2zBVNOehJlFCBg1maUYy0lil8Rz7F10SOsM+DWbKQ1kK4b1w/Y4cpip0pSNfH
	 BoFTxobBd/mUiizaH0RrxeZnJh6gpUyiCGSxJ6fx3XTfG3l6om6N5DTjymIVDnNBRc
	 8KL24C1g13MDaJdZy/sGxvMeYYsYwJfS65p7A+35cfH8mtsK8yFwd8BrODrVK+hQax
	 ABPU0wbE9Bowg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC3FC605FF;
	Sun, 13 Sep 2026 09:54:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A11A23F
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 09:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F98480E57
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 09:54:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 363l-gD47g9D for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 09:54:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 276F280E53
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789293275;
 b=EJx2qXJox6yIVbjSR7nRnfQZ3MAWUEJnun+DoTYavqCmrCyWHluAyP4BJ26d39usO0rP
 S5Rm754t2ph5bii82c8qbBnalQf+ixlPRvLaj6qCRIe/fgY244QNOSwwoM6RFDz2GUQNT
 z6MiqJkKe4iHiblakagLgEYQBqHDZX5Y0YrXPnSMFSptDhlgXHQXj5+99bIWHFpeTlrkz
 c69hq8TiEZHVELJ8DV1SVV3GdLdAl2zp0CU8t7rcHFbFxI+1Q7TKvQjFGnFtgYDDi2vgG
 576AWYJKqiMEWqAKHGo8MsC4TJOq37lpRcCFOCt8Su8gawBEkw00cnZRsl2t89AJJFg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789293275;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=nLCEQTisdtl14Tw1tHO5F6ihmADa2+9hP7vRDNN0IpI=;
 b=DKO0KR79GLoUF+b0f+5MKte31OPI+DydYRmPibDEQawodOi2Ce9yaIrV3uWVxpcSwQ9G
 uAK2+Ub+LdPyty+oy4cuoixaYZ8ZP/LdB4RVIEXe+SoVBLGMDk4ImE17U/97T36HHxg65
 bRf+qWjrFCD1vuAHTxieBgARDF8rOWy7kV1Wd+VxJsBu4blnYbfAQOBaOE1fYgo5JP7+e
 ZqGAFv79+TMTQ0vCgNBIWbcOMakBMjbAzXfMI6QfNug6kkfJT6PU3Isz1VBFF1rdrWsCh
 hth1N9ObiAv11hxNO4QGQaW0cdRXvu+6zg0f2T3eNfDzfqoa2tQgBfoFU5lZRh4GD4w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=W8ShGFZ6; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::14"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 276F280E53
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 09:54:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id D84085FFBA;
 Sun, 13 Sep 2026 11:54:31 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 13 Sep 2026 11:54:31 +0200
MIME-Version: 1.0
Date: Sun, 13 Sep 2026 11:54:31 +0200
To: Adrian Perez de Castro <aperez@igalia.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260910230621.1936231-1-aperez@igalia.com>
References: <20260910230621.1936231-1-aperez@igalia.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <d10bf2b38337c78b77693a2d5ebce80c@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/wlroots: bump to version 0.20.2
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

On 11/09/2026 01:06, Adrian Perez de Castro wrote:
> Both .1 and .2 have been minor bugfix releases. Changelog:
> 
>   https://gitlab.freedesktop.org/wlroots/wlroots/-/tags/0.20.2
>   https://gitlab.freedesktop.org/wlroots/wlroots/-/tags/0.20.1
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
