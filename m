Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3722ACA5FC1
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 12:36:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00C73812AC;
	Sat,  3 Oct 2026 12:36:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TMhpmvgNJvCV; Sat,  3 Oct 2026 12:36:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 392CE811AD
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791030983;
	b=Ez6JxporvOuMSH6wcH2yLJHT7NunI816fVT+qJm3XpFm2py74lCp645Zgjc+YlEbW8UG
	 kiFw1LY4saUS44jrPWg3r7esCBc+/G7jfquI4LQ+ZC1VOouPe2MUwxGFjY/tfVWcHr7ub
	 dULOjCo4WnG2+tgYrhMzRuFoGARCFEzPZLiBhszM9GudTSFTyN17GY7Dq/pbLmiPaifoU
	 ZAscqZ3uXSEs7OynXWICDPcN382UX/0HfXEtY5iO+DKQFuKqpmjliklFqcSMPMgOoyK4U
	 up6id/nH1DimAwWEeDVnfTajpHTQM3wa/ww1NlQzpDg0V7Tffb6mw8D3XQcxHBPV2FQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791030983;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=5Y0+p85OH9s75V1sSTHrtwhFtlfSrHBwLipKO8NIxck=;
	b=JpEEW37qgUeIR2eL5zD5bV/axnjH/KVdEjBqzmITekuPjge1d0X1fbIeamLMc4YKeVDm
	 WiJ+kz1KdLnNIyvkmbZzPmcJ/AmJskU69GPtAW4Z4u/iyYQfa1OYTd7DnKVrH8tgGkNpl
	 6HDS0II4Ljvx8TgX1p5XFN8QgPSZ2LP4mnB6o0NVcnDJwMcbvsVmHu7T/0TDFbWy1NPik
	 EJWbQEbOTaflICQo+rCOkg0eDZ/RVXHuvJ0QTeZD/FL/7e/9adazWvOQmnlNX8lLq8A79
	 PIUyBTJ5B/hDywaJARDYpuWRd6EptxP7Ho+8KvcGoBfiZXCeG5YgkBraPAyrDqKZizQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791030983;
	bh=5Y0+p85OH9s75V1sSTHrtwhFtlfSrHBwLipKO8NIxck=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dv2UJkS5heMkfSz/+WopyNWQh1IRfy3txaihKTmBgsAUTLzF16gYXLIWbiodf3G4r
	 5MIY0fLpLhFsUrR0cyMBpQJ77z6kkdKtspoImUYZltbwUiAbNzvSryL7lDX7uftlJV
	 97GEOYPBfunHWclur1OeO55t69Y2nCojiFuNvWDi+ZwTtNgWzwlbITmo3JS33TXVnt
	 +UouVU5ICf5AY3mPOr49QtRPw+RLnpxVufMbbpR9UoiIZ7hs2CNAihOwVBpOs/0FV4
	 v9q0zNFvby+JEsQJdDLbVtmdFfBJLPzffirwA2Eu1TAeyQm0S+01GSaox2WjW6U+1D
	 CXjUVvYB9dCAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 392CE811AD;
	Sat,  3 Oct 2026 12:36:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C89C476
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 599266067E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:36:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dO1iofTjRGk9 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 12:36:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5E53260652
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791030978;
 b=r4DutZckUDxJrBcRn56CkHu3E7LbWfl35AMKWYp4Gh2hrGEBCrS1WhReRLG8dOFrtKW1
 HkHJbtWUFvcISs4nDS5IFBIXy7Yc7xH9iNTR9f5/gmlfW+kElc5IKM1oFE2uHjEw5f0Q8
 mNLaWD2B0fpNV8GTMEzN9drocYmoW9PpGFlfgd9DXGUuK2I3BF0432j8KR94wbHnyGgBS
 VpWUxw6qGd1PqQ60TlWFs2qIBR/fcCGusVa2lEmMjBu9jevOc93n66elddTI6zttaHiMY
 PuO0i5LCfkDm/am56O7PQLCpOfYCjyesV+HJ0ADYnPZ4qZeKpf1fWTdIhF0yyWjT5Qw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791030978;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=XOD2H+qOt+XISU0d7wwRuDnhkMI1DLi2be/hBhYfLPU=;
 b=oBBomphPiQiIE3ZvrVMdDeoJpJf9k/1K/pbETgq2VKun5E+zYz1LBVFNPSDr2NLw//+9
 te5FjpoJhE9WqvskhxxaozVEGtz5mx6gBxxq/f43GatmrmZlRTpD3lN1UjRVty3XwLqu9
 er4e/UgA6gujCmyNj3S/9utf1dkavuFULYl17BxyK3grBPh501aQ4OFLM9Vgqt5/06Czv
 aoxDKkO50v6tIWPfB/hy8Vb8n+uA48rApHAlj96KhAeAlo93yTCg2uRmWU7veky+ejkTG
 LcthkWIKneBy8ACsVzJznwZzNUckvliqRdopptm9ro0drp4YNn88eePqGUoKT8uvwdA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Pm8t2Zsa; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E53260652
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:36:18 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 8588A4E41128;
 Sat,  3 Oct 2026 12:36:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 59304604FF;
 Sat,  3 Oct 2026 12:36:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2A9E910328366; 
 Sat,  3 Oct 2026 14:36:15 +0200 (CEST)
Date: Sat, 3 Oct 2026 14:36:14 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Esben Haabendal <esben@haabendal.dk>
Message-ID: <asD2t9L6YI4tiHmU@windsurf>
References: <20261003084453.545653-14-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003084453.545653-14-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-kiwisolver: bump to
 version 1.5.1
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

On Sat, Oct 03, 2026 at 02:43:59AM -0600, James Hilliard wrote:
> Update license hash due to copyright year update:
> https://github.com/nucleic/kiwi/commit/d28b726aa2e7eb4e0b2ce58e55c651855053f45f
> 
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
