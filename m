Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CFD606A31B
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 19:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=j1XkNOZF
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24F9E6089E;
	Thu,  5 Nov 2026 19:14:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GfQMM9zxGGRV; Thu,  5 Nov 2026 19:14:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 68AFB60885
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793906060;
	b=jl6t/m4esdMsj54x1Ao1PABaLJXQ8TS2PyuJP1zPlfllWQLWVkWg7MvrAOMX35MSE5WF
	 3rfkKmVe8oZWttp0Smgx5d4s5pETd7v97lbE0NA+utLLzrQER4X7U8yJcbTiwZC30XqTS
	 UwgkawhOgfmvWwfEjYsBlp9BL3bpL1OrtDy6SZUL7/N7TL7+9OFHdQGunzrRdXZYeoRlT
	 ADqZZBqH+g4n+dfYK3BhKy5LCXVcBocMMprTz7bpQ6YJ2BH/VNzf0S/PBsUM3SSHEo3gr
	 XYbLBqbFDwrZ8MKIuPlcDuT5GXE5tPp/v41ni7sjShr+5h+sJIAdiwQlBceO44z3dXA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793906060;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=lMdO9+qG+nqVrZNho5I6FjHSw5WlJuX4fQhiw49DuNk=;
	b=i0Ct7ylPKU+CvhPERWrbfF4JohbOeQ+Kfz0mY03yjVW7+OW+tSviqmluRpusVndNbLKB
	 1omKkxAwYSs46e2/qBgJCZkc2SGDlKLPWLn15rrj5rhGKh7HMMYphpFZ1XTWrE8MtJS5B
	 SXbQtiaJQJ/+lDvITooT9v8+2EGM1zdxZgDkCvFNcfWBhPFiMMnzXfo8a+lP80U5HPu+K
	 G9beak35vLlMLgiCAhe6lCebK5RdppKpJ0n7BsWZ1eKNwUAv+zC5r2XIRmtclkyZOyqzT
	 gR1bpqKBLVDNIM8XgvXNXrFtx/cuq5gxcivqFnotsmrRDHxyNF3soRhuMAZnbjDDf8w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793906060;
	bh=lMdO9+qG+nqVrZNho5I6FjHSw5WlJuX4fQhiw49DuNk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=j1XkNOZFUhSHnAxhUWRhCA9s5bmdDVlUdsvQeu6l76gcCBFBBxTe9HoxUIcRf7EYM
	 GJ2Ce2Tgv6E+HuA+WWLL4emG4PWW4H3RM/LZLCy0+e7eCJ8hhf3J7gNzgA2Jefba/L
	 fhurRS+2Yvg9MGldNHXufLbKAS+eYpV6JTuoEqVs9keizUVcX691h6h0pc5Kthfuhl
	 wIusx8olLgHDBIpk2M9D2y6CFl2cVB7+oNF/bIP2lbR+snL09uMw3cekf6VCVjzBcl
	 ov2q+JqC2MMMdVhlhq0EBxYL0U1Wwh1hNSphQAPMSU2Q3IdWnZ4Ybb5SRnVxl+iI8r
	 /iMrz/BhD13Aw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68AFB60885;
	Thu,  5 Nov 2026 19:14:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 80926B00
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 19:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5289140856
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 19:14:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s3AL7nzgQDwl for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 19:14:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CD6094084E
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CD6094084E
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 19:14:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 6FD8713F861;
 Thu,  5 Nov 2026 20:14:10 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Thu, 05 Nov 2026 20:14:10 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Thu, 05 Nov 2026 20:14:10 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Thomas Perale <thomas.perale@mind.be>
In-Reply-To: <20261104213230.296551-1-bernd@kuhls.net>
References: <20261104213230.296551-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.20
Message-ID: <becae70c5f8d8dd29140d29eddcdd3eb@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/tor: bump version to 0.4.9.16
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
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 04/11/2026 22:32, Bernd Kuhls wrote:
> https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.16/ReleaseNotes?ref_type=tags
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
