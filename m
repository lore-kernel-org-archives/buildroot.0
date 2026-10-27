Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8993606A327
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 20:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rrtL5KPV
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91FF6606E1;
	Tue, 27 Oct 2026 20:45:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7zmK-LDWi7ph; Tue, 27 Oct 2026 20:45:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DF5EF606A0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793133901;
	b=kmSf0zUW2leNU+7dfprLfVtoRSswLoXp4ivwkpndp6xtV/ozYzMdYWZ4Z1Q8EsTTrfq+
	 tOqRcdKE9V6+sv+tYHE8tPySibyHrDKQR8P12Es37El5ZgUH0orMml7B4cTa+r9D27YNP
	 mkeHmgoa05b0Dly1yjMF8j/YmEuq0F7p4CcFX2NT1UF1sWU+hyTqmXzQQpbXi2Rusn5Ep
	 GpauYmzCjTccfoztofRpPue2MAonVxwBKj7pt+DJkh5JZdeefI7LLPVLchKOkThlAC2+J
	 eXb9OcaUJ3XtVqXArwSeh53Mm6yrx8qwG4SKomdBun0XhL+eUUfMROwx1vsKUQ94liw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793133901;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=0gz5T9rM8v4s2Jb+Uj6rpUnftAWcgbtaa6+NJdupfjs=;
	b=X9XrGDuDrNEuY+Y6Lyfu9T1+ot9Nml9ugJYMlDPArAwsiMl6ljn7VvtLs2Awdkvjwk7g
	 ERFpddNAkKlRgC1EV59Y5biIfhiydJ32eQn+akdxI8rxJYNdLpJPMBg3ZYyftb0Ra7Fjt
	 kagf3Og3JVKoANHNdFSEJTvisGESppJ9EXiwRHzTehSaRAtdq5FtNdI1/oP9X0TuaxRl3
	 ZYsSYrafjiPnH7PV4F5aXIPsmhORVnkQJQxcaFfJE2m+Tpowrk75UBPiR8szc2pB+Pihg
	 546vFcqIB2Ry+LFXVrqk5t9Lq6nAknRxxfIw6WvGCvk8ugd5EQD+Dziyy/MIjgOK84Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793133901;
	bh=0gz5T9rM8v4s2Jb+Uj6rpUnftAWcgbtaa6+NJdupfjs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rrtL5KPVzJyUutBXu4K/HLoQlB1IvAel1jY7i71XTwcoKFWsKR/OAUrqr2/u2EQjn
	 46i41dkF+3CS6seXCbNkkG82bQInnCd7Ixqtttr0fnrzC6uF20jl5FRAdQt/shTvHx
	 CkwfdT3vdcIOoEcSGnYywfKCEcZ790QdUq1G5+uU7qJRwvcUQk5H2FvmKkx3m1kl93
	 Wih46gC0koXZXP/T1fG8bF66+L0Jbn/YCXnhkQkyg/L1YRmLhHcIKrAZZHrDXQ83B0
	 ogjpF1P07JWNayh14NZwU0Eg7au9gyXulGtg/76aoKZB8WPckHWsNZtCgv53pB+umK
	 SLESxtatH1GZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF5EF606A0;
	Tue, 27 Oct 2026 20:45:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EFD1A279
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 20:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5769605E5
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 20:44:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1nPoSggYj8I6 for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 20:44:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4F367606A8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793133898;
 b=P2aNRILtCvFYYZ5uKJYU8DSA5O0ytlCAXCkQLdQCBR697LM7p6FD3rQtJjrUPimPuM7M
 JzNR5cLanAAGRf/Zb0JSXNoyyBzczUDTYRZejzFza609jeu/rOtrtNU5B0ljyTv9DwyQc
 6KMvJj4Rzoivm3PiSvhRr7NJ5UF191F11EwKqF6AK8Gz/yEx5Gt6k/a3sBSVkotUzQhR7
 YFojv0JzS+xyEsGtVJ0eCFCLioTIi6IWMXQ5SDpe+C1ZhdecHOa/0r3DrbVVRIRAfKX4C
 KMbsVArSso+2B8OAeq/1r7oEJi9yYrLL7pbQNABZxzr1pthXPxlg7YjNV0mbv6Pyvjg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793133898;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=tFpTkqBurjxLMQG3BD64T2py1QK0hMlcIOdx+hXwNy4=;
 b=WLx9V30Ok/iA+yLdaL8yGoFgydThSfOyiKT5akNHiBOWK5ElgupbXHN5hBYv1YhTHzw8
 lCgXU2IAUWzRliDOb96j7ntTIxrLatvxj8PydrSexS/xF6fbZT4yUr2gtBuABplFkGGX0
 Jv1bPGmoYtq4KuP2uw/hs7YwHfjO3cMGH3mI41JgEMl34CctnVJOqAxSAfIhROHJkthwU
 rJjXEiH7MIuE4dBtTBh+HQArBRHoXbwmhvFdiBpC42IOR9kqPke3IUnpH868ssDOax4ez
 zfPZ8LdAiLDJiAr7DrxriqHi+kezbrwOjOtLWMQUjrNU0Ss9J3WAH4ZYCElVpAj1LxA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=hCD+M9of; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F367606A8
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 20:44:56 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id A22874E41348
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 20:44:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 70EFF603BD;
 Tue, 27 Oct 2026 20:44:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id ECAE2103290A5; Tue, 27 Oct 2026 21:44:47 +0100 (CET)
Date: Tue, 27 Oct 2026 21:44:46 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: buildroot@buildroot.org, Angelo Compagnucci <angelo.compagnucci@gmail.com>
Message-ID: <auEHd8ha0bONRwVM@windsurf>
References: <20261027164013.1602502-1-adam.duskett@amarulasolutions.com>
 <20261027164013.1602502-11-adam.duskett@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261027164013.1602502-11-adam.duskett@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 11/14] board/mender/x86_64: add a udev
 rule to create /dev/root
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 05:40:08PM +0100, Adam Duskett wrote:
> As /dev/root does not appear automatically, add a rule to
> create /dev/root. Without this rule, even running a simple command
> outputs the following warning:

Which "simple command"? Are we talking about Mender commands/tools?

> 
> ```
> WARN[0000] Could not resolve path link: /dev/root Attempting to continue
> WARN[0000] Could not resolve path link: /dev/root Attempting to continue
> ```
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  .../mender/x86_64/overlay/etc/udev/rules.d/99-root-symlink.rules | 1 +
>  1 file changed, 1 insertion(+)
>  create mode 100644 board/mender/x86_64/overlay/etc/udev/rules.d/99-root-symlink.rules
> 
> diff --git a/board/mender/x86_64/overlay/etc/udev/rules.d/99-root-symlink.rules b/board/mender/x86_64/overlay/etc/udev/rules.d/99-root-symlink.rules
> new file mode 100644
> index 0000000000..7d2ae8cb89
> --- /dev/null
> +++ b/board/mender/x86_64/overlay/etc/udev/rules.d/99-root-symlink.rules
> @@ -0,0 +1 @@
> +SUBSYSTEM=="block", ACTION=="add|change", PROGRAM="/bin/grep -q root=/dev/%k /proc/cmdline", SYMLINK+="root"

Is this supposed to work in all cases, or just for the "basic" case of
our defconfig?

For example on my machine, /proc/cmdline has
root=UUID=898654ab-a9dc-46ee-922f-8f5077c83176, and I don't think a
symlink /dev/root -> /dev/UUID=898654ab-a9dc-46ee-922f-8f5077c83176
would work well.

Note: I'm fine if the answer is "it works for the basic case of this
defconfig".

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
