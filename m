Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7D4606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 10:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=col89k4c
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41E7E816E1;
	Sun, 25 Oct 2026 10:35:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pL090-t-j_2G; Sun, 25 Oct 2026 10:35:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4F2FD816D3
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792924521;
	b=GIxajEDj4GzyNyJ7fnVJIQ4Y7fsHmtBNjrfrQqWI/fXTmi6Tf3dxIcRnLoB6KNj/RrSY
	 vlxoDNFxSuxKf9259ziD77m+syfNpbbWd8NFAbBadUJ/2S25O7IMeyrsewt35owO10gH+
	 7xSBrDEfCOrqCiln3+JVWhL4nby2WEULzhjVO7rJovj01CICP7pdNc6/FA4snCaplE3jd
	 pcxZr8tx+8KOqTsbdhu4uiaBS/cdKRmKoCPjm0D2dsSWF3N7cJDzHhOiwVHNZ3y8MQfmk
	 saT+jDQ8xJpwAeQqIrDbVkUjhHg7Dwxk3kq24ltwVKVpaKrwNDw1+a59ZTQU1GWOMiQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792924521;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=tyFneeuNWhE7HSEN7OmTws8dnHmEfKWk4sxf+SkfjU8=;
	b=s3BvLIS+NedHTiSe17yZeR6UmBcgip4Rv+uc/Lg1UaTqlnyqABZGwENub8vBJxrcvgPI
	 5qHCiIaPdlLmiVWFp6GRo67hp8E01dkSEpZqF1CqpAolDzZy/8L5tnNkb0/stwqirG8JZ
	 maCW0BkkOTJlG1qDEPa9LxAlCGBytNA5lU58WHLZGuQ7hnyRTPvqzzScmUltiIFZUWCCY
	 zshYV3YGOjeKtvs8asag1xLbn46JE0teQBgVY14IXzjsuw8YNi0oli50zgnes1CpPOVtQ
	 LIaCee+otslAWH+sP/II353sTbRNdIa1mtQ/DCQMboMlDkNp78jFBwrvunNvYuEL+mQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792924521;
	bh=tyFneeuNWhE7HSEN7OmTws8dnHmEfKWk4sxf+SkfjU8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=col89k4cQ5TNJHwSJPLNIFVNG/U17H53hHvdsdikqRvwYXoHobHett8odVHSGFX9n
	 h9RNNCCVhJaE/M1TRUmJJwXWus7d4xgAjFMcYMoMJzAvbw+JyimUv/6Ixh4tlk4z1W
	 N8kUZKbUKV+kEGPdfw/McB5k6Vf2Ff24iwthYd/NvD/E1YyRxiAiShv+/xf6XogjDy
	 i0QYh0jfo/jbY3rd26CeDXKvTzP5taEZ1UyzkAzQPbdDOmCVe9Kha4d3SrV9siic97
	 B+ViY0BI86tSUgQpyrWpqQEX5mmNVyfmHvE3Nql/l0SiKC9MQ1TRxm/nO23xnGIDeO
	 6654rdSm2gJKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F2FD816D3;
	Sun, 25 Oct 2026 10:35:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C4B5D3AF
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 10:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA49C40A0C
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 10:35:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HzG4Yka16RIk for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 10:35:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 41D1D4009C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792924518;
 b=fPVriE8ipJ3d/KSlcCTi0tGTRCasMarbU7q4EKiTLWJjENTs3BWN1fqf6G6TJaMBc+Gk
 2pBlh6B1pfcBlbHKXXw8NPGNnrqAs6y8lVcfYOCVi2bgpuHj4HjC+Zf7RtwpfZdkOGUfp
 Usw/Ab2MwG96dPBUfdZil8y2wXMvUXj86fEWdyeppc9HIE98UOHv4ZfM1U7ZkZQANorw/
 QbcrljOzX45v6iuE6+g0+TDWlG9AfeMZUNLBBG1Mh4x3rxR5VwI7eEuO0735qMTMEkmN+
 IYIy0UbP1EWRhv3VzpRxsq/QKnq3ZaFHpMI5027GFlg6QqoS4xIDZFzVb+brWutqHdA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792924518;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=rl/qP338+M18/PhK5dAdY3QK1jo44S0KrBZ+oy8njjs=;
 b=sWJlyyNScBlVBQVg4z65mwGpbHoOXUvSkilL5QDmkeLYa6L9oyEny07GLxoV9E98P0Zl
 He3DAFysI4BE2MOwvUJ+ULy8WoNqKFrJcjH0ScEEbQf8v5yl0BQa9WSqb55vzCAApqEcW
 2wxzzzm6v3bCwPdSPoWJIGg9jqm/NRzGuOmaf69G9vdY0novZwpUKWT5qK5LQIc5la6rv
 laimFdQDoi4ujz0j6SbMUC8L+SibNlp86DUPhJJ9Hx5RJQYylpsOUY3Cl257CBn3Gs3ia
 CREW1vIIMTAh/SumQo86EOzp526iA7ExvWeZdQfZRRmg2Fe7UEvqiZBjUQeyB/dUTMw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=oke0dDEN; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::10"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 41D1D4009C
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 10:35:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id B634FB00535;
 Sun, 25 Oct 2026 11:35:11 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 25 Oct 2026 11:35:11 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 25 Oct 2026 11:35:11 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>
In-Reply-To: <20261025090745.3693129-1-bernd@kuhls.net>
References: <20261025090745.3693129-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.20
Message-ID: <25d6328f8222e6038fe9014b504cc023@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/containerd: security bump
 version to 2.0.14
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 25/10/2026 10:07, Bernd Kuhls wrote:
> https://github.com/containerd/containerd/releases/tag/v2.0.14
> Fixes GHSA-hc94-p972-ch66.
> 
> https://github.com/containerd/containerd/releases/tag/v2.0.13
> Fixes CVE-2026-53493.
> 
> https://github.com/containerd/containerd/releases/tag/v2.0.12
> Fixes CVE-2026-53495 & GHSA-rp3h-jf77-q9p4.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
