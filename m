Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11D1606A339
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 18:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bclFphla
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 780A9812F1;
	Fri, 27 Nov 2026 18:12:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w0xP_aQqJaL7; Fri, 27 Nov 2026 18:12:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B760E812F2
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795803146;
	b=djlzL3iv1UmqV+xR8it+KAKIUgrXOHlUW9AMRoLm19LOeL6b1aexf/1QYmD6XPsyCWKq
	 TBTdXymY/BoS1mL1lRUTHNcDic9/VBE0HZP9WMuG6ASy5Uox8bmWwu69ymnA5SGa5JOFk
	 5KTtnr5Q2uoG8R2ua2CGjrrUoajqD1PltDcosxOk5d7qn6BdnlGoysk/k0c0siRqc3bS/
	 LKy+wGvIlrK9p5B1RDvkLwQCv0eJtWgsqoTkXxjDsQjhVUSe4yji9IamfWIf4NLpu83+1
	 Clb/OokSAx0aNWcfNSIXJ3mpmq+vylP2+osGkihtdEFO0uU3Ojj8tOUkHF33vhHHfdg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795803146;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=k0EYlWw6M+7mUjHUg6xcGoMDTS8uobGx9AjZqeZYt08=;
	b=ENplWdAAy7yCKHaf4jYe2ZD5lCQJvdEfJMxblem1NxEnxfYY1JWxn+QX0DkMEkU0tIB/
	 X+dniOZVUSUbtAojqYuWhpYzGaOoAuc46Oc/LhkVlxMKX6s51a77tM9Fh9l9gqRTvNf5E
	 swtQE4orOpHm6dxJ5UggdRyEeMsqsgsNzXt1+63judkbRncT4s/LWzZeek6PQupt3PcRy
	 ZeWjHOhvAsLY+bUfIJmlYlQ+WBWVbuOpS6XllaFLoILsmtWWHURNMs/WODFCqSnRRZwbt
	 eeP5wn6+QUixjtlpj3AglITA/USjTc89zxjeC3gxdezwFr53Qe5sqAGu77eV9er4kcQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795803146;
	bh=k0EYlWw6M+7mUjHUg6xcGoMDTS8uobGx9AjZqeZYt08=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bclFphlaCcvXSLaUr7MIldJ7/HuRDuQobopa3G2t3YbrZWfNaZwHcFKc6OHPWh9Lk
	 FhWOZrGt7G+xrtx9pUbGPXezTPden8cG8x7Q6GDrVRRpUAJ9K1wOhT3ITSjBWEF9ua
	 PQIlvkVOqFTzDOB7KYfD3dOS+4MD49TNzngz9OfDrqMnOnJomByx58jjl6LIE1pT10
	 Iz6C2DAdhk++Kvu47S+lvTjZu2vkMNNQAWg3ugzSTNLfzePy4nKiWGwzYYk/ZcGMzT
	 PrkAggR8v0LOvflk7xqchTkK8YMvDJ/cNEyzh7+YlCPeoZVENIa2sXKYZbPRUPeiA+
	 bEA4kgSWNdD6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B760E812F2;
	Fri, 27 Nov 2026 18:12:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 126991C9
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 18:12:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ECB9B812F2
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 18:12:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GGBrRpF0q0WO for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 18:12:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0899C812F1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0899C812F1
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 18:12:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 6D0D819F576;
 Fri, 27 Nov 2026 19:12:20 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Fri, 27 Nov 2026 19:12:20 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 27 Nov 2026 19:12:20 +0100
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>
In-Reply-To: <20261125223554.3326338-1-angelo.compagnucci@gmail.com>
References: <20261125223554.3326338-1-angelo.compagnucci@gmail.com>
User-Agent: Webmail Free/1.6.22
Message-ID: <5558b96a6e0825d8d1c6413deb3e1c31@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/2] package/sunxi-tools: install
 fel-sdboot.sunxi
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 25/11/2026 23:35, Angelo Compagnucci wrote:
> Some boards have neither a FEL button nor FEL pads (e.g. the NanoPi NEO
> Air). Once their eMMC holds a bootable system, the boot ROM always
> boots it. Then, without a serial console, the only way to enter FEL
> mode is a micro SD card with fel-sdboot.sunxi: the boot ROM boots the
> micro SD card first, and this small stub only jumps to its FEL entry
> point.
> 
> sunxi-tools provides it prebuilt, in bin/fel-sdboot.sunxi. Install it
> with the host tools, in the images directory, next to the bootloader to
> load over USB, so that a board readme can tell how to write it to a
> micro SD card:
> 
>   dd if=output/images/fel-sdboot.sunxi of=/dev/sdX bs=1024 seek=8
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Series applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
