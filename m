Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B615F46C72
	for <buildroot@archiver.kernel.org>; Mon,  6 Apr 2026 19:09:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9CA280E5E;
	Mon,  6 Apr 2026 19:09:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7pCblqpApv53; Mon,  6 Apr 2026 19:09:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09B9C80E60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775502559;
	bh=i+gjIdyzEEGIAOdH+aoJnpEvRiE8hZdxbAEEJ+lFMSM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mj7RXE85T6V1R0CAuUiGwxKDnvFFA2jWHqxMWJiFdguIsZDFVzshqTT8tKroqlN9F
	 Acqzp0QmPw7iMOd1umLBetxeK5tBp1hpCz+VjWc1YQXpyghPdhThahekUuYcCGI6O1
	 b8l3ti1mM9AETDcluwMG0U5ZLyUhmZwuoL31dk4OPTc+aID2WIFVn0RL8ei6x1m/1j
	 t+hQI/F4XszxOvv2sa+u4IfRp1D9g6BdkZCYqFc/wrHpaWgn4maOMwIZQ8wXmdr0B/
	 XZLf/tXIXlr+YWAs6V/wzi3DlMZa/PicIySGcZ0RBthT9n27DBmbCMA7m3GrwyH/PG
	 pXNuNboM8o/cg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09B9C80E60;
	Mon,  6 Apr 2026 19:09:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C63402EF
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 19:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7C2460BB8
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 19:09:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cPsfZ2X8neBt for <buildroot@buildroot.org>;
 Mon,  6 Apr 2026 19:09:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D361C60BAC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D361C60BAC
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D361C60BAC
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 19:09:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 3FFDA19F5B2;
 Mon,  6 Apr 2026 21:09:13 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 06 Apr 2026 21:09:13 +0200
MIME-Version: 1.0
Date: Mon, 06 Apr 2026 21:09:13 +0200
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260404103414.108069-1-chakrabortyshubham66@gmail.com>
References: <20260404103414.108069-1-chakrabortyshubham66@gmail.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <f1a648b009b9ba9847c2f8e75bde5841@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775502554;
 bh=vCV0tcmJaNtamXiTfACmtqdEXJwCPHcqR1YGobknmM8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tii8fDPSQtl8e6b+wmCNXRW0sVI6m4wAr/d9XERlDkj32eJfg2VRijwRkfikLfvRl
 pahIMoUpH0VJrlevA0WRf/z+4VZTLy/LHt+zpbE03wYfQkCUiQcj8+9mpNsvRIU4WZ
 fk0TW1ScTs6bsQV/REvDxEh3Htb2WWi/BH4hiE0uWw+rwN68g6Ir1NHuy4S1DT5nEV
 nbSG2lYVILSynnHerelWiReyl0b/jqOOpuhEyP0EGKHBqo5WJC2TPxHDC8t3npP4dQ
 QEQzYizN+0ytv5hXuTLZfRATpI42+lMkD1+HF7ml2rKuFC2JzY6xKBCS8sYKVyaZtE
 UApBC/NxQyFRw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tii8fDPS
Subject: Re: [Buildroot] [PATCH] package/hyperfine: bump to version 1.20.0"
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

On 04/04/2026 12:34, Shubham Chakraborty wrote:
> Update hyperfine from 1.19.0 to 1.20.0.
> This release adds the --reference-name option, extends
> --ignore-failure to accept comma-separated exit codes, adds
> improvements to the bundled Python scripts, and fixes command naming
> with parameter scans.
> 
> Refresh the vendored cargo tarball hash for the new release.
> 
> Add myself as the maintainer for hyperfine in DEVELOPERS.
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

Applied to master, thanks. For info, I made few minor changes. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/1b1018ce56347277f972c8596cd5518355af845e
https://gitlab.com/buildroot.org/buildroot/-/commit/5c040a70c84504964f8af656f3fba5a9e15ab936

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
