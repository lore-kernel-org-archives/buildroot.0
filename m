Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6401C79F85
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 17:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D69D80539;
	Sun,  6 Sep 2026 17:02:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z7umqAIiFRCa; Sun,  6 Sep 2026 17:02:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7344780AA2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788714166;
	b=adkOc3OdJPr5uM3Wl2u2nU0w1e35bNz7X2CguKFq8E62uwyBA9o6Wd1V4yRHpfZabuR6
	 81YPDtr0mVqIolaILseIAVb80EQpt8b+v5El7SflTS7KmpjVjFOOz5ckozn0YyIDjZLGV
	 qqi1pvTvDpowz80biHt6pjrvFQI1/nOZ0NJhqGr5dokoYTXLlpsb4CJBYw8tHt/HS77Cc
	 CSZSLIhfThPhYWmN/QHiCYo4TPsJWVFXmLOgqgcmQwi1Mpd6vJrsU6J4L6FSw6BEq5Cuf
	 EgaTNBD3gywmLll9aNk+ajASXjvTcxfYrg5WvsRIijyWgv50qKhLKHiUFTMuaz8aCxw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788714166;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=ANWGKA6kwxZ21LQ38UkhE2S4A2vwgGXlE2SLrcljvP8=;
	b=N9/Af0nTQN2cPwPTrsucfSx86hGOmsYsCGVY8Qpvk4gUwxxqMcXL1sYqFmXE1QyU8eVP
	 FNH46gGSJFvw4uRXq0l8fo5wo+1LIEuoyYoy262TiDGh9tqM/MlpWfXvI2UvLw+Nbv+Wb
	 T81LJNTCLH514BQ7vH7Au6xKw0onWdAaA7z/YBdv0W5lcVaT4+PZx7jgGaiESca95ZAfZ
	 dcNj1j+QCHeErd90Ep8L0yD8CmgmUzdIKTt2omitg0PERz0mzki4rgCd3+i1qMIi6mjwT
	 odYTQG+2gHWRkZs4jdpqF5RBXj60OYUrmNYMoWKLyChdBw2zaZrfX+Uz4S5dF6iJqFQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788714166;
	bh=ANWGKA6kwxZ21LQ38UkhE2S4A2vwgGXlE2SLrcljvP8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GAxwFMvqW7TLpg53IJLL6vpnawCqmu0xFFhqIYJmCqHRHgwOFVo4v0MoRo50Q9IUE
	 GCJ9cGu3nanJ5QJIwFpjY/sLWx2ux4IFRRbKLKh/KBKiiVD5QEgVWwSkIMb9CqrBtj
	 RJJmgSfirdOC0cRJyUjvuYYhCpiUAHgiBII8G03TpfGWNuzY3hdpkpKitkF7QgQjd/
	 ZQRnI9SF/dDyK1khe8wgk7cGY++S11MulP6HTsgSEkyMLC7f06sAUdydxVCGbNUbUO
	 IC1SSi/i2SSdIYfUk9guAEOsNjmzBLSyhXA0nJMOT2i1V7HAUAAbBjWszGbf/dKg8N
	 hyMCe8QUj7unQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7344780AA2;
	Sun,  6 Sep 2026 17:02:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F46D990
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 17:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1090080AA2
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 17:02:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NELcqdM5hs96 for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 17:02:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9881380A9B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788714164;
 b=r+C7E8nrPXaKp0/cNuGiMw7IZn/ue+0v0wVJDCvneL0k9Q+hsMpTKrx1ipEGGLm25YVi
 WJAnpceMtDiQNvG3H2Vwhh84nbG9XxNZBTQKZS0fJPun4/ssopg38IRF4CHah0rjhG6rE
 zH7s1A6EARL15oFs+UBKbqGaS0/uESXsGIUHLhd4kbnHkxiFlZCpK7AtPcIm/gk6TbjHz
 nbefuShlHEQ7iatVTIDm3QFlyDTJGfC/v5U2zrkxpXh8Wxbcw60oHi0MtIWjRzJZX6R0N
 /SpnA/OfddOhf3CHIuyc0UX6rJIGPrbsxl4nPKg5OCvl9tX4XhWkCAq7z/MR0SoU7fw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788714164;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=N/f7PeGKuUJgsKjfY89r2DC3u7lvm7yXvYfem3zsNx8=;
 b=oyCWhymvzu+8AAmCp6PtQuDJa7NCwbTfPa577q1/UTS+eAEuZp9PuP+Qovvs4KvsCs+G
 OgmDlU9osCTKSkhl4iTXJ1Lxqa+h7f/Mq0mG1Sq0ty9O5BY1XGDyqj386VB5gZT/tezFm
 Tuedx8w2qtkLcSQXM4YKvlBmSOJ3SKyB+xMOX1hkuCnYUxG+LnPkbLUosuTQU7Coml9oo
 6NCQFBs4ObilCQ5ie/8oqFxoA8iTvaY/F3qcFDUYqQabU/NPdrrrmGksGQDgAln30CROQ
 e5+7OVkyjowXemTfS1YGSYNhO6PntaYPlBAc4Fp8d4L29z5pCZcapjXTjKKVKRa1CqA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Q+XsakhF; 
 arc=none smtp.remote-ip=212.27.42.6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9881380A9B
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 17:02:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id CB56F78034E;
 Sun,  6 Sep 2026 19:02:38 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 06 Sep 2026 19:02:38 +0200
MIME-Version: 1.0
Date: Sun, 06 Sep 2026 19:02:38 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, David Bender <codehero@gmail.com>
In-Reply-To: <20260906090948.3583566-1-bernd@kuhls.net>
References: <20260906090948.3583566-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.18
Message-ID: <2e5c081f9a140a88286e955867483715@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/openldap: bump version to 2.6.14
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

On 06/09/2026 11:09, Bernd Kuhls wrote:
> https://github.com/openldap/openldap/blob/OPENLDAP_REL_ENG_2_6_14/CHANGES
> https://www.openldap.org/software/release/changes_lts.html
> 
> Rebased patch 0001.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
