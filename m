Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB50606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=HCTaXqvK
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C29481E06;
	Fri, 30 Oct 2026 15:31:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AdrleCjFQY0n; Fri, 30 Oct 2026 15:31:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8C3C681E01
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374307;
	b=Ms0Vc7FbWIo/LmGi+P1ryBVt6rDwP/rBujeAzumom3SlkJQZPJ43ZndS/NnelgoUtaqI
	 9EBLf5cW2RQZiADSSjy0viVnbiV8eOFQcsMVSSMAGVYITFqi8wVSfRNMjgs3WzGWqxfRs
	 v8dk+92Z6XmCGOkfpm/8HXbPC5N/2cwCUyLPb/kxQ/+x+++MsuX2mo4kbLzJm3ba3KKyb
	 4FFXeNEA9ezz4QuesMIXRNkW7l7u2ffCnhW/Wg04rttH187Fz76OSYk7kK0AiXcxY0cax
	 9G0dQx3Gy0WERETtoslDhICPmJ95nI4BD5TqkCcmqRQbXmUGjg/mDHRQjsizsEJuhXw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374307;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=1W6AnEk8xRhcIE/SVE+c8+QGWrtKKE1FSQeu7d3w1Fw=;
	b=oItplTa5N3QCEiW1fZlNKK7NCKAenOp3RvAGbCrqBV2Bh9Cbffn+6jVCSa7Mg9jh6uLg
	 lRSA2y2UjbU2LPO0PujyTucRZFIUu4jCIs0gK6Jr+TNsWlA4IyAFiMCTYBSb4uYghXckK
	 HejDMTZ8eKKYiXHvBZtJwV9fdPlhdhveKE7og1AbitFrRUsFvvfWyX4nzo9gA3tOZ9OmT
	 yDW+h1JcLL7NB9U6YvHCPEL+2z/IAUxb2di+XT1w2ksjOq1TfZI1MYb9BS2W9ppPqPTay
	 rtX9spdW8WfyU0TnVHZSnCwH/KSr7zt+Wy8QCKVFJtFn0cnlIOEoeACN4zlEVT7SSRw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374307;
	bh=1W6AnEk8xRhcIE/SVE+c8+QGWrtKKE1FSQeu7d3w1Fw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HCTaXqvK8gUlzQ2vMs5SoSnLYqbk3wHKlle64c58rNnUXq75gknHUGF7IZH11kk67
	 R6adHXFGQBmB4uoVtrbqfIMj/9stwn/KnTwxBLoPWlg/8kf7JPnhKK04pzL1cBhDPO
	 z1FubfADAqlDLyVn0AN4qaCpQN3NY6ImIeEVU37RAM6H2f3a2oCk/dHlDYfR9FmFxx
	 /Eg1yNc4dWFEa9oM8TqiP+b6AyVvfBHjRYE+nz9XYJ8Q3YnGTu4CuagF4OQQm/dhDe
	 XxKHaz8nKp/5QSWENi4C13LQkL3vsDa+uuMBLL8FwJkjhJ4WIYKpvz2vIdwkhwTi1M
	 X/t/bDeO6fDKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C3C681E01;
	Fri, 30 Oct 2026 15:31:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E3D6D38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:30:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 240F281CAF
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:30:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qpYy6vzPXl3L for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:30:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4F28181C40
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374225;
 b=B9vq/Yw8AxCFTFsM/22S1BxMOMCHU9iVPucFC0w2Fmd05xy654IuqqnT0zEYwsYTuCl0
 oUYKJ9uuZ+6OPf5/1MrS4fAgHYF65FHoW7IMGurTDCiRXw6IK0RenKszlgUyrctGRyOWz
 54rncf1bMOPs6StolrDBt57SkExo0gldvKMWqHWMYfU5TAlaKkseK/OQI/huWNRA5AYG8
 eQxYYvkfRA5P8p5Yfjf7WMa/Z3XEFYi45uQmr/RmwSohBNN4BbwXIPKdH/Lkfu8HxEzNB
 /aH3T3+OLt+FUTeW2YTqTi+qpVfOG/QvZXKW1Z2fjq8duf6NpPaHBqHNN0bCNxR3k3g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374225;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=grag5N+dxxBN8JMbOn3rqu1Hwjs3H4cyhStVaCe5XO4=;
 b=JGcfw/4qc8Q9LiHLxjwaVjPi+7Lo9yUcq0lCCK1sXE6XzrKIaLnEBpnxgNKxr0NXOUK1
 w5iHFh/tdP0TsMDAaCKiLHay4LL2LWZiwzoQYBaYImLEHbGLdHsf2s2V/ZFWCZxfRb9sj
 hNVgZ6Ko0FxnJ7rxglXe6vJ91yv3YywqTMXI8YSUVJPJowqU9kJ3CmQa4bP2gaVeyXi1i
 JaKd8jBrrPKSZ/s9EaVFcEmV+2BxJ77BzLM9RnuxVimElMkMyX1WJvhmcklTxfiKWkksh
 nWL/cn5tvXqUt1HhWxWucyAAE+Js5hQxzOrntQYKWr86bVKMTKGKbTZ1sz5BLuyyEWw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b="QAib/g3R"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::434"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F28181C40
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:30:25 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-48e6eb21a8fso362659f8f.1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:30:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374223; x=1793979023;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=grag5N+dxxBN8JMbOn3rqu1Hwjs3H4cyhStVaCe5XO4=;
 b=xQ/Fgy7zcI4ozTtpt6LiJ+LlH2oSQilSvZg9xxRBHOR3oAJzG7itbUef81+hhMe0TL
 iMwCwouzhT4wpN8UQxkkCTv5SEviQ3ehJ6qF6P19YO7fz6kX4XaNE29xA2uoVD5jDEPz
 us1LteLpmcP7oRaRKdadLq70omISC3RkRMO7UCvZ9B2ALbBfwtVPA6Be5W9w1Z6DhXjS
 I3vSF3d49ZftpEIGxIXnlf+4HX5T67illb6z6HJp53U8c86FCIDXOaTmrrz681akdQpY
 nUlGqWFJHUrOFuBsm4JRZYIEEC0xaTYqWlM3VK78RT3e2rEAI6UXLJjYYgz9ttVdHav2
 joSw==
X-Gm-Message-State: AFq9FYIyHS2ar8EAb3aSzkth30I4MEh3wSsuknlWIslaKizmcbjytL18
 b1RQ6xtLNyM2C2rO5sNcjJVmeIFT0I7EK+ViivbzY2d6GdWyfnRc61fDl0/CfVcZGB3LZl+wdpl
 EeJW1h/A=
X-Gm-Gg: AYBFou18NK+8Wa/b4ZBqoHNYhLTbx9iOmrP1XbkJH8oPee9ApBOzX5PEnQ/3qWMjtB7
 BvG4vWedH8pkqoMH/bJ67pjp6ERJWPgnY8nYVble2hyT7qWoC72ig4g6UPFMy7Ln0hrU9cQCxn6
 8SvrWWKNffEZIFbd1H8XY8G0V3UoSvMaPDaa5VdtqpbNOXP6eZIN1Q7C61s9nbjBiTjI9x8NOJ+
 XGhHvM8qWosCBN6dUPMt2outPsZM8kCHP4Cuu2PN6xtrFNQqLLxIwqyZL178O3MNTgPGQ1hteFC
 LG2aJ1P2ru664V+6XN/+K+wvWrL1F0wgpwlzDljYtRdUR+TSUaK4I9vL5xgXKfaV9Kq2oi1HnQR
 dBYqZq5H3CR8Z6Pt3+M4XxXQo4WtsHV8WUzM5SAXWEbxEnh1Gp0hb1HPJCwyiOKTJ7TXsVJtss7
 OODZbYGULZQqzizNTWRAk28YvQfjYSDD379IFUXdlNkVGToEKz6Dit52imR4BywC8TVamoqX8X3
 ohzfFQ4teRkZA3SSHhN688CiYqL0GoWI2zj9ei8hGXbML5HW3TcG4L24vmFvBcIuHnY8NORouVq
 I2gsc6sPMnzdefFm6zopIR5vVr10GCT+EmAefeaOtAm9Aoi3Bmj3y/l9mu+02uGckBZFqP7C
X-Received: by 2002:adf:fc0d:0:b0:48d:f383:2356 with SMTP id
 ffacd0b85a97d-48e6e500514mr5268405f8f.53.1793374223359; 
 Fri, 30 Oct 2026 08:30:23 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71a4d3e9sm4111149f8f.6.2026.10.30.08.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:30:22 -0700 (PDT)
To: buildroot@buildroot.org,
	Edgar Bonet <bonet@grenoble.cnrs.fr>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:30:20 +0100
Message-ID: <20261030153022.1908454-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <f90ec3b4-bd18-4f71-b4fc-eb2c385a9978@grenoble.cnrs.fr>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/3] board/acmesystems/acqua-a5: remove
 linux-headers.hash
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Since commit a8b9c6f9f512 ("configs/acmesystems_acqua_a5_*: switch to
> Bootlin glibc stable toolchain"), the acmesystems_acqua_a5_* defconfigs
> do not build a Buildroot toolchain anymore. Hence they do not depend on
> linux-headers.
> 
> Remove the symlink linux-headers.hash -> ../linux/linux.hash.
> 
> Fixes: a8b9c6f9f512cc3ef18956b53a99b93ba74a9e8f ("configs/acmesystems_acqua_a5_*: switch to Bootlin glibc stable toolchain")
> Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>

Applied to 2026.08.x. Thanks

> ---
>  .../acqua-a5/patches/linux-headers/linux-headers.hash            | 1 -
>  1 file changed, 1 deletion(-)
>  delete mode 120000 board/acmesystems/acqua-a5/patches/linux-headers/linux-headers.hash
> 
> diff --git a/board/acmesystems/acqua-a5/patches/linux-headers/linux-headers.hash b/board/acmesystems/acqua-a5/patches/linux-headers/linux-headers.hash
> deleted file mode 120000
> index 5808d92afe..0000000000
> --- a/board/acmesystems/acqua-a5/patches/linux-headers/linux-headers.hash
> +++ /dev/null
> @@ -1 +0,0 @@
> -../linux/linux.hash
> \ No newline at end of file
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
