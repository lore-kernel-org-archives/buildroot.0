Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E0B606D816
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=N8sea8M/
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE62481B3E;
	Fri,  6 Nov 2026 16:09:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m4NNUCHvBVDV; Fri,  6 Nov 2026 16:09:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9676081ABB
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981396;
	b=m/SJZn8AXyh2+zdZZVQ1eDp6+yUrftxLcc4Nd0r2m8tONUcrgCZKsw58ai1s5suu3R0v
	 4wF/BuwhBlFrMNjQDP+Rikzepa+Q2sbpoYqPmgd7q1fD9Ol9R4KVCOCysy5qkaAbCi2rm
	 0WmHHdVLCHlv0rGhxFKrVR11y3JyEtcJZyoSnNc0Ij2u74IwF/MA97UDn9Hiy8rzaFyrc
	 W33D76LQjzxbs/3EIxu49lC+iZjDfq6J8rGLxQ8oNruP03tkoUZiKcJRZ+NyvEXkFy5F1
	 ondZ0xX0Fls8r7vSWQNNNXu4vuSc/h8GeVlvKhAtf9aOsJHk/BKI+MZtQVs7DZioIHg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981396;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=2iu1InXPVOixasLCkzwrKXoGqFxCPIYPp8TpqaFZO9s=;
	b=b9VF3HqdCfoBzVWmMzx/tM/Mxnk3Av7MQ3q88OTI9zpRIWff0hwqENaIdlSMR2HyYP2P
	 +i8RZGEM35EKE6P6xBT0U4y5iuoaq8vcBIdkh4OgVjWzlO02y9T0vwu6f9ky+FH5EkTKI
	 Br7+7A14Z0lfrYNtmtnNEFKkgLpCYXfUOGbFsvuRN9yB79qSgF+h0v0d/A4R1c0kjg5DM
	 dGbyPG9lDqjm3vZfJKZ9MjDhCg+cyS3F8YR6CuJgZ6JfKbx1tMHzA2F+ZNPDTJQc+XlpB
	 1INICc+ealtKsohEkEXVIGsOTfcK726pFUhVHT/Sw0s1pkh0iyIxiS13yr3vFWZVOGQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981396;
	bh=2iu1InXPVOixasLCkzwrKXoGqFxCPIYPp8TpqaFZO9s=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=N8sea8M/lp27zppBTRkSnZZHQUCnzXMnfOBJZFt+P86XxFGo1OHoLyCNeLGXZUJ3k
	 mXWBY8m0gR7sebb4wH7EF6r0+p+nIGQOX7bZz0pEpPvDs8aIk+N/VRwrq0+vPSDlcJ
	 pHfznKhdNxdCghXgbo4PrrLdTxH4iYo7SKuMGXBsLK85udUzEuT4tcpDglKpiqr7VY
	 KhAxfcCQ/NTVpSuTOstfKZtNgDVw0MGXdUiB1BVH/E5BcCkiqv2MjoxEBpu+L9oUyM
	 7i91bLVpi1de9RgGc/7sTIvP13zNBV+Nrk77V9aHlAwKz486oaKjR6QJEVmiD+5JoB
	 3qUP2YOQbqjqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9676081ABB;
	Fri,  6 Nov 2026 16:09:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 68CE54B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:09:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F0B440913
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:09:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V8XyCWtL6cdn for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:09:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DC0524090B
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DC0524090B
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:09:33 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4a5036bbac7so5209125e9.3
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 08:09:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793981372; x=1794586172;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=e95wkNHBvArshmPP4pyb03BmGxbxfiq2ugi6kTkBSR4=;
 b=WHblc2ARsewFxtWBjuB/DycubirmiN37FktlU5fHRLJFOzIVS5lI1v3dQt6fodnWAX
 7R/pn7uZsMLxC/N/2D+MzTY7AzuP1Y7O0ptrK+OnXdZYZCAOxdAeOkd6Af0SllvKWlYL
 xlZRvYI7eH/Vqa7LhH2nutqqySFY/9sE0tmiMUokUa/+WjUpRV34tTdQRgwLt5jd5PLn
 DtmHUewT+xIfZhSddy4QmrkfsxrB0JiV+PNc70O62YvC4UQhj5rgl8PkYsSCvNpzzxY5
 ZYwCyQ+cRr41KWiVanQG3un4vToNBQB9QR/euYtnBV7GpXIYXq4DiBgNh8Zol7IU/Iu3
 3Ryw==
X-Gm-Message-State: APuU4Z8zoMJkVbnaS7WPiY7ekrzfBD7ReKqK619yUdxs9TnFDAdGgqFV
 dSmkoKHBN3dRJ/pwFhYsgQAc/bEjxTj/ICloWtyP1MNMHOUB5VvW+Cy7AHV8WB2p/aIFg+0wumd
 EZEzZyH4=
X-Gm-Gg: AYBFou3P3JNODmh66ore/NUKenR/U1gYIcUXRNNxljBmRK1qHUc+Jod5KSFMvblZaR+
 GTAEq+ehJbSQFAViihQht1D7z7MvqYgY83gIglv47crstC+P+trsOS7rIpm5Jpa2r2sj9Y7dULO
 XGnpSYDZRP17DaMFVF3CoS88TjW8ouGZOjsioYm6RS5weo3m95imPGtlkHoDXXD63jLgvknpUdT
 95m2+kzPoIBifXjEvN+LUvIaobhbvPzyv2xn6pdgCqMtX2QOvCo7ttxSjmLlvQKbLbbDGGTR4Nd
 XfOKbtksGMb7xPFj7+4d+nntKExZgSZFIrYQFpfOZ5gb+sCO25E0R/Zf7aZu4zOKXNcRExBUNmN
 iduUZ9KUpQhuKQNtgWU5hX4etJAoudbuhBDqHb7slN+9nmLpF+8WUQrRiXntyopytVssdaAkIHT
 +6fNqIJr8uZbkkhvzifTnBn8vLxMy4E8Esv1u/YRYBK8F4toSJsTutFvkYUXQgy2kyIBaV2UbAk
 XrRTkquVaClf+0Ua659cgVKAksKpD14tbiNGm8/7YXqcvYB8/FFUBOk32lbsPIQwXLitmvmYmwv
 2PCo8MaIgHiuQgCdC+bP7izSWBqvR2g=
X-Received: by 2002:a05:600c:34c8:b0:4a1:f90d:6f4c with SMTP id
 5b1f17b1804b1-4b6de4a6eb5mr54769705e9.7.1793981371834; 
 Fri, 06 Nov 2026 08:09:31 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b6e168f331sm81424185e9.3.2026.11.06.08.09.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 08:09:31 -0800 (PST)
To: buildroot@buildroot.org,
	Fiona Klute <fiona.klute@gmx.de>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  6 Nov 2026 17:09:28 +0100
Message-ID: <20261106160930.607191-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261026190956.376568-2-fiona.klute@gmx.de>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/swtpm: fix license information
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
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> The SPDX identifier matching the LICENSE file is BSD-3-Clause [1], not
> BSD-4-Clause. The LICENSE file was last modified with upstream commit
> 5f1ef9565df074b918a39cb4885af4190c98edb7 in 2015, before release
> 0.1.0, so the fix applies to all Buildroot stable branches.
> 
> [1] https://spdx.org/licenses/BSD-3-Clause.html
> [2] https://github.com/stefanberger/swtpm/commit/5f1ef9565df074b918a39cb4885af4190c98edb7
> 
> Fixes: 87b9b126d23be1e95b3d2b82438f65e28f554a87 "package/swtpm: add host package"
> 
> Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
> Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/swtpm/swtpm.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/swtpm/swtpm.mk b/package/swtpm/swtpm.mk
> index d6559c22d6..3357be9c39 100644
> --- a/package/swtpm/swtpm.mk
> +++ b/package/swtpm/swtpm.mk
> @@ -6,7 +6,7 @@
>  
>  SWTPM_VERSION = 0.10.2
>  SWTPM_SITE = $(call github,stefanberger,swtpm,v$(SWTPM_VERSION))
> -SWTPM_LICENSE = BSD-4-Clause
> +SWTPM_LICENSE = BSD-3-Clause
>  SWTPM_LICENSE_FILES = LICENSE
>  
>  HOST_SWTPM_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
