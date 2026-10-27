Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC25606A31A
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 19:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MQOmZ7PP
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6999160752;
	Tue, 27 Oct 2026 19:58:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rYA9eUCOZoc6; Tue, 27 Oct 2026 19:58:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7C8DB606BA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793131114;
	b=nLkgberJdx5L8+qEhoORebAiF16u3uKVghARXXx699NhMB5AX3S5gk7GFl840g3anQ9a
	 By/b1vv9Lr1mH9txVelhVXYv4LI2sbSbE5rlE2vgRO4TH3HT4WUkX3kAXL0Y4rlbs5HQi
	 oUGKe5FhCMfCmHNP+K5bYpVoVG3md+C0v/d99kj6xUnUVtUEnS9aAEXtIRbJuj/QO8O+7
	 41BrxFWvGtjc5bXor6uqoSe8rtHDd3Piw31dXQmQpqmAve6ha1ylfK7sSNfWcaN5pM9ee
	 Rk0KwcO287nonn5mChv9AZags5v1FGNpHVq4l7t30H+gdpii03Dilk8bWGdQSBPyehw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793131114;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=TtlwNPoZDc4Vj6zz4q5nZI0U0ngv+U2KYR/AylxxDsI=;
	b=CbqGAmrZ285e9+qm8TR/HDnHBIed8cgwAQWxd2lbCfZiN708Jzl8qa0qYdTrtQrRN0le
	 f8HVXqj6budWI02c/vOagzBh31DheQS/9HjTB4s/dAp3dRlcs4nqOatfTnYkJ1K00xEXc
	 G/BzXEGUDNJfM8LMO0sswYJZOiqHgAkwzS0+T/Gaeg0Fz4Ba+yS0Ks+kxy80b9Nx2yGEM
	 lXdSkng158nUpoYJ0n+Rj/6lbyacl+CY0mdTXJS0UyxB64Mzp1XDIu3Ik6WQtfO/BjlMu
	 hHH16SubEJh6iL2/I9fVIt7xOlpzAzk46qinneQVK4hhcwmh4+5ig/hn2BFe7aZeyag==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793131114;
	bh=TtlwNPoZDc4Vj6zz4q5nZI0U0ngv+U2KYR/AylxxDsI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MQOmZ7PP+pAuGomPUPg5kzpm7rPIub4dTZoiDXyiJ0lWOkzYcpEMbxGx5Oc/bEzov
	 K/BDQm5efs8Um4rUokvZHnfB6M7e+7lvEjYQOiT95Y2l1KdXD6vgfRH7TfowT3c4U8
	 HIOZGTlUuyB6QgBSd5nLclz9XTOn8jiQDm1XRu/+bQfhC/s7Hp8ddf/HmiEIodBxv3
	 bgaSPFK581tzFt24Zi4Sn38kftvd1ra+KB0GiaDxmHOD2WkuGEpWS3FH6WyTU1lDLs
	 ebntE98ZznXnl3Fllp0bpqZ92b8jP6bnbO9qHjqObECwZQB0idaq/Ai/S0vfUkRWFc
	 R8J/tPROxGphA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C8DB606BA;
	Tue, 27 Oct 2026 19:58:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0000A529
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:58:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E506F606BA
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:58:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s1kSyAUgmI09 for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 19:58:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 06FE5606A8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793131112;
 b=WTg9UXYX0sW1oJZ7K848nHmyxH+526cWTMoGHK0ilziMPZ3VdHJczPRIv20+AL5752Wt
 AwOyW9/qEwwjdXZ6SRQNT36axxyYMJOUjFChFv1RM3tomQx1mSUNyfoh87gZ5wDzL9HnL
 5OudvEIvLspeNlW75fxL48Mukorh2iW3unOhhoHD9qk2KvAgFHt7nz8C3nssZ6PKo3Plj
 OxLhVtBEBSWY6c2x/GVJ7bVMqInflqMaz9rzF0rKKIFZlYev/Jzkf5dntJPoN9rZPg984
 unaaNXP6Ez5QbueTU/pnZfeQDnGQwPCSXrOX1J65Tjg+IVYYgc67YqfPT4hFXFvupgg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793131112;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=MrbnJwqrhvNovIGt54xXSkQcIAJGZw/zlcRtNKWmbrY=;
 b=qCa0//qbUNiJSP/e8ygh7zntPpKovwD5Bz20vq5zITozFc+u0B70o1iRqc2vCJdoPZuB
 BVHYSheCk6HbET9giZ+Wb1QXiSk3nxdWjlvXgyo8jN92Hqn8f/dox7TJ5KiF98WCRy8xn
 3lAqH/XRNqSpXUUq6IB/WyMrvRzzt3bYByX7ZKl0AdW9DA2pkqbqvMirTjONA2f1b31IC
 5Jbynn2JEQHardIw2v+HCTHimpFYjSYjbH5MXVozN7KfTOR4R5pT6sMgUJbbPwG53VbxW
 z3BCtnE6Rat3sMjb15LHKEK56i/8VtqfgiwycI1kObPJd3Rf/fm7vmjZ4GWstjrgsgw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=z6bUIbKr; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 06FE5606A8
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:58:29 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id DEF771A1246
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:58:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 961FF603BD;
 Tue, 27 Oct 2026 19:58:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 91B7B103290A5; Tue, 27 Oct 2026 20:58:22 +0100 (CET)
Date: Tue, 27 Oct 2026 20:58:22 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: buildroot@buildroot.org, Angelo Compagnucci <angelo.compagnucci@gmail.com>
Message-ID: <auECKbMQiSSgPrL_@windsurf>
References: <20261027164013.1602502-1-adam.duskett@amarulasolutions.com>
 <20261027164013.1602502-6-adam.duskett@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261027164013.1602502-6-adam.duskett@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 06/14] package/mender-update-modules: add
 banner module
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Adam,

On Tue, Oct 27, 2026 at 05:40:03PM +0100, Adam Duskett wrote:
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  package/mender-update-modules/Config.in              | 12 ++++++++++++
>  .../mender-update-modules/mender-update-modules.mk   |  4 ++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/package/mender-update-modules/Config.in b/package/mender-update-modules/Config.in
> index 7c5a7e4442..97f583e0e2 100644
> --- a/package/mender-update-modules/Config.in
> +++ b/package/mender-update-modules/Config.in
> @@ -16,6 +16,18 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES
>  
>  if BR2_PACKAGE_MENDER_UPDATE_MODULES
>  
> +config BR2_PACKAGE_MENDER_UPDATE_MODULES_BANNER
> +	bool "banner"
> +	help
> +	  The Banner Update Module manages the system's message of
> +	  the day (MOTD) displayed when users log in via SSH or
> +	  console. It uses metadata-driven updates to change the
> +	  banner text without requiring any file payload, supports
> +	  rollback functionality, and operates without requiring
> +	  system reboots.
> +
> +	  https://github.com/aduskett/mender-update-modules/tree/master/banner

                             ^^^^^^^^ any reason this points to your
                             Github fork instead of
                             github.com/mendersoftware/ ?

No need to resend just for this, just let me know and I'll fix while
applying.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
