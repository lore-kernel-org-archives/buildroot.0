Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981A4606A31E
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=sOLuKDO6
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6434340E25;
	Fri, 30 Oct 2026 15:30:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kJR8lmKpE4PZ; Fri, 30 Oct 2026 15:29:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EB97740E80
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374194;
	b=or8okfKSMCufatmee09X5mnJidpAwSnwCZaoZsWQIuiSbZQkZMUh+vsdUHdnasN4/LzF
	 qQ0V7hkGpGsd8ZMrwUx+G4wiaUizH7/IPRpWRy70rby45Vm/V8s1Rk1pGmD/7DgepZETK
	 TTIczpKU3RUyIFAnI75kc+qGnAFt9TO2uog00Avzn4M2eheQ+QG1Onv0Wdu4rwqiWw78t
	 MLkV+GJULu/z0pvZiiYkNEAA8DrbrDLG1g8MZ7aiJRz1YgaDuFFAcBm4lHRPbUjmA+Mt9
	 davk0pSVPD0gNo3pQaeZoVGGwXvme1y2JA1ZzqJk4y06d7MOMGGp61JObPJ04xgpdGw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374194;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=R9u8PYCJQPE3hHnP1CvrdoKL/hMSnIsBg6THbjZJaB4=;
	b=E+lq1OKvNwk703vAB3GbJm4itViVdM+cuNwmpv4h/AVi7UJB13dUE/a5oMRqDrZnjffW
	 6sfSl2ZReS9c6Yzi4B2Etou3/UifkmUpuHBaj/hCdc4XJXtSj6yM51PLDW2myktQuuxR5
	 s+PDe5gLibRoRuZVarDoJpZUDvswGYK4O7XqoImrW8AF+O+yNjZawA06VPfI2MQrclcUg
	 frCDi2JEkbxCbGkMLYqyFFv7g8TCBX6pztXOXn1xJnrS6/DweS62IQd8vQyUVsS+xMc4e
	 IU2VW5rV45x2Qa1qmkgUxPvt+Xz65+5MGNVDQ9uociT0K5CNIwXOKWByYN8AMFT85hQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374194;
	bh=R9u8PYCJQPE3hHnP1CvrdoKL/hMSnIsBg6THbjZJaB4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sOLuKDO6IpGvqP2fyJkKVpZLjjxlJVW4r30bRoJgkhxeqc/BTw0CZX6P4EGbWPZmM
	 JUQtn5NiAW3h4QD5yrxyUVq4m7+5O7binywp2RJFksug7DTWKh5X91yhfDME2MJOAs
	 IsPv91mKO3jIRvwjwbN3wvHpz4r3zLSXpUw2BJEQvwOAjTFAaeDiAiqJTVm4A03XYN
	 9T/kARYNEamuyqL7Hhswyyjs8e64LJL/QFI59JIKhAthlPdd+LVPZWR/KwEE7HyZ6C
	 ZftPcfMbACWGA7doDlrl6yMQ1jLEtBAC0HjRYc1XvFv+4wqoDEDZnjWHNrNufrVc/E
	 rUykNI/Ujp/zw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB97740E80;
	Fri, 30 Oct 2026 15:29:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 235D9D38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08F1081971
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8xWs7m_wNnEW for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:29:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 391098186E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374167;
 b=aKn3b7YBZcSRlB2/e9Y13TcOwwwoTblka2DWpafA03DbWkYnrqpD4wiyMW5FDk7BG9qg
 q3TQ3z2q7RXZd89zrfhaSAlru5DE1TXm+LDwgu4YLc8wiX8YLQkKY77L3UOhSHuL2Vhh4
 axTCSubY/ZeHVSwYfJ/dIQVFJyL0Finp6mET9JDj95+ZrcutD3rjXW1jq/ZNqHJ2OHkVa
 ZBzQdz21Kpnz6SX9zk/qwGVpmaKyYhtJL6n77LaId5BP7xWg7VadcoLvAEozbZzZ6eTxR
 OBD2jUrrzNDhHROJCEZG/RuwMZyxjGswBBHK7P1nYwUrjWjseUAyWuCb9YgQ9lA50Yg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374167;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=7p3+z3QdNyPtwhra/G5rr3swLvIiQk7o8PjJVYiX5uY=;
 b=HaBx9xOm62ndWapdL4EieF5ij1uRHTpxuopGcvkeWAvSZTIuBjILyAn2SUuHTCjGmsIG
 lifr8A1WhjHA8kTtevGOGyX+WFvWeGljiNhOxzTBgYV470vQpYUtS2PVWIKmXBels74wi
 C/9zUausJFBp86mAkVW3MvEsyrlzdnbBcMEPfrpPjbV6RwMaztD+BvGSVd2daehTjLudr
 Qdr8uYTNldbg6W1FPtweFvesZnvyrT2cdkwg16sC1yzaG/T/Ykz1BzUWo6UN1JR/IdKGX
 a8BKYZwfG3ZlzoKZEZBwfEM3/O01Z8wLMk+ePs6ZNPg0OD0CN59itSeEtZt/uf6G+yQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=eS3bDt7S; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 391098186E
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:26 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4a140e7405dso8744985e9.3
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:29:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374165; x=1793978965;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=7p3+z3QdNyPtwhra/G5rr3swLvIiQk7o8PjJVYiX5uY=;
 b=EKg/fqRAeYTAgKaMHGON7AKdTLy4llNlhhJ0pDARHDRBKmwlPxSyyazXiO2NebJR4l
 oJ0kA0QB/ZDoiDOTptJEeK1CGvFxravtL6KILKhJQauIBuNJc7bpwkVsE1IjpwkFtd70
 +OaI8EQAqtUfi/N9S4PepgIvoPpyjPbemDSSWmTkzI6X368cDPmU0pd+omA+L5+G38qj
 6ipjIn1mZBwkAe4JO4XMYlr5vw1ZpMtrOud47g5NvQt2XIahkiTH+Y1sfbvdk6eWLfOA
 9vEkkd88KlSl7c4SwDlbUwY2IyAT8gxaKcMkil2lpeQ86omihHOx/4QTONP/U1Bihu4W
 V2Dg==
X-Gm-Message-State: AFq9FYLZX+xue0KK4XTAyoYgA36UylG3e7cS2DDdStyXJFlHjm3umQ7I
 W7P48WoRutwmmDDbACJwxPtqjWXJRRHnD1bHttgI7A7TxfMTt1bfbekMPI0Tw5sLCP0hRVPZueu
 Qwp0aDmQ=
X-Gm-Gg: AYBFou1eKZijKaQz3dT1QVigqmnHrwJv5hEF6ZBDcGDNXEtYl7BMcvKYxcYS0DP3G3B
 eGWt9bRATAMI0taa5oCAKVEghQKceNIk2VcG3mhRlUZHHq274ttiOa3LbTTaZHTdCs/TagzWV//
 p/vlpq1wzd7Ox3FaFEN30B3+9B2CmT4ZmUeRT2CH6BtdUDQZt6478e6MxVcEu44d5U0LSP1keTk
 OMBzWDFQCNZGLsAziSDCpdMJzJPEuD+nr0+8o2kxWtCcyzEeTqXL08kq2dWxhmGswdJOq1GSDxf
 jACpygbzwMHP7RcpKwATQ89xhVfanra6x+XWK8buKD474z05nycZEddXdjRoIYdt6zxb2O7TwpH
 MX90X6jW96R6R81/dxBop00q12LoGp9zRhHiGcOCnq8lWFiUZk+GRHCksaHqj9nz84rYew987rF
 LZYnecgxIr7zaNA6pW/nJrGODPgdHQdp1lfjN053JxgsLR2szYXQal+hEs8+AjHLl93+AGa+z0X
 UcZ+NQRAySEe3LVIVDmX1v62ClT5+ojVvaUjTelCUPDtfV/zBY9JLTHJtCvBTaApTKHEmgId4hi
 FzWfc9QARuH6b5zYcHZndGldO3u8eo9aF0Y85m05Z2uD3OCQ6XGAQgPgoCStDuK+RxCNOq5n
X-Received: by 2002:a05:600c:46ce:b0:4a6:7d6:821f with SMTP id
 5b1f17b1804b1-4ac189928e9mr60257355e9.29.1793374165175; 
 Fri, 30 Oct 2026 08:29:25 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71ba5dc2sm3688460f8f.54.2026.10.30.08.29.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:29:24 -0700 (PDT)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:29:22 +0100
Message-ID: <20261030152924.1907891-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261024075628.3205436-1-yegorslists@googlemail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/3] package/jimtcl: install pkg-config file
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Install jimtcl.pc to staging, so that packages can use pkg-config to
> find jimtcl. This is especially needed for static linking, as jimtcl
> lists the libraries it links against (e.g. openssl and zlib) in
> Libs.private.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/jimtcl/jimtcl.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/jimtcl/jimtcl.mk b/package/jimtcl/jimtcl.mk
> index f2d59265ad..5e09e776ad 100644
> --- a/package/jimtcl/jimtcl.mk
> +++ b/package/jimtcl/jimtcl.mk
> @@ -71,6 +71,8 @@ define JIMTCL_INSTALL_STAGING_CMDS
>  		cp -a $(@D)/$$i $(STAGING_DIR)/usr/include/ || exit 1 ; \
>  	done; \
>  	$(call JIMTCL_INSTALL_LIB,$(STAGING_DIR))
> +	$(INSTALL) -m 0644 -D $(@D)/jimtcl.pc \
> +		$(STAGING_DIR)/usr/lib/pkgconfig/jimtcl.pc
>  endef
>  
>  define JIMTCL_INSTALL_TARGET_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
