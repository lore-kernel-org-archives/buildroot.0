Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4928606A31D
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 19:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Dt1frl09
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E85E4094D;
	Wed, 28 Oct 2026 19:43:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VxsuMMdmrG7o; Wed, 28 Oct 2026 19:43:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9602140954
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793216610;
	b=X5tV0vc2D7eZvrETXnUSYbrD8SPmyXUVDeEKHwTLEksmlW1PKNrW0VyODwWmlI8uKom2
	 3myQDwHao9da8aQ24iLAjm2lWfYyMfrVtRmyjG3Sx96cuEia/YlJ3c55B4VQRpsl96UX/
	 /V609qZshanpz3X2R9p1Ta0CBBiPxRIiWaLobH7hOg3uPjqI8devUXuqt3M+EexrynTkJ
	 YX204SqX6yU/25ILKmG4SuvzSPkNbrddIiMGCvUkaAhpcgJbS7i4PysjAE36xOa5SB3Q3
	 RmX7mtTd7P6Vpz7kV9XSuVN6KMU/Cz92vlAHyW0CjmVYbbaWh0sIaUfpQAdeqAJcCjQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793216610;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=GKcPjNQqHatiyTUoM5X5wgdPGy+JoIgq1OlowxZ0vUw=;
	b=JzqWyRQ3vFWP/EzYUPBhd7G74JxRitDuxB6GSyFBk2NyK4pGyEB+N3Jsrz0AuLhUb7ty
	 h7qdG57Dxz7noZP9w/87aiWIeWvAMW7fbj/5+l+Z2kqEI2CyCpJnZFXd0r3Xa0U9NKH/n
	 zCUqtPdV5fUbOPGB5hiyt0jNPYWnE/E7YZwzzFw6JoRRS++gDS/ZP4OIQN2kRC75nPTnH
	 qOQbakDo0NwmX3HbsT0NWpoa9sBJJAw9Scq/xp3aVnrkRipvM9Ccx8i+SMtUZiEILS8/i
	 CK4ekliUnvJK8AtpEFfeZ+3+OxiL7yIyRqNMwuJybxvM/xN9l76jLHuP5EMpp2ji7/g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793216610;
	bh=GKcPjNQqHatiyTUoM5X5wgdPGy+JoIgq1OlowxZ0vUw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Dt1frl09SnpAVoYifGWFbeBW67qHkqb8K1TaCsDXN41i1PlNC6KSLhp5+gTMPUbvA
	 P6IqSD11PlC9qEwoYgMTHUMuH3aLNQbbrFqPPzk45cjyS6EQKqNY2dzaWzUwxLHIL0
	 /oqco01NnPyng/B8sOOnbczqFdL49W5vE/7D7w/q0tjIao4guFTpQuXlY5CYBnpLSz
	 JWYH/hRdyWa8ReqNSNJOj2DDBlAOkgyanLE3EGouvqIvltOIw/xb/tS6oUTnalzGCn
	 ZV2YbFRj7x3Y8QAmIje61cE1QiDXhl3GlKWodkmIvrNtPE5SkQt/BcM+9yA3TC7qbg
	 Kf3OZCx1QvVIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9602140954;
	Wed, 28 Oct 2026 19:43:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D59D73AF
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 19:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C78676074A
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 19:43:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L6iFyxP96wYJ for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 19:43:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 85F006071D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793216607;
 b=BgCBxfnmoivdM/jgAfDQffY61udzbS0Ox19+0k2wVDKeHq0SuMlKvDUxU+5N7y5ZYxVJ
 /Gb7JMapZDup0LZH3zjLUJ+caEQY9JnfP9ANviIN9NrCQdSKhspfzoZPZ2qUhNqMK5dpe
 HiWWKQlGwMtypNQz12k/85MX/Pwswntkz9Cukvgcz4AhAp6XkoBQCE6tPouLWQYjlueNu
 S/Kdvsiq9zSb34Wsw4KAw+RXSFQOHjI1qNownrm2Kkr7GMZIP396DPA2rNYSWx3yAub6g
 9h4/NSDuLscqofKGpN+hOYovgPge8Wte0cNItls+oXmMlu/LY7A3NO2eYM63Z6wwYtQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793216607;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=MgSXOa5S01VB/Tgea0RMFVLT7GPCquC8/mFmtWwEEUg=;
 b=Wzs1fICwi7q+JJg8GGVDPHCqQ3IcKam2jIy2npiRkn5UVzbG5o3VHiWW984/M9N+AgcV
 PPHj0MehzVlAMaTlxkkKK09kRwGwo/+DIQ1l0g13hwqTsY8zmGnkZlU5sHKVzAm9NeL1X
 nKzmPHYBrIJSU/JAi4mqwyXq4dJlEyqNFfrZCOY+Li3ezelzt6dTVn9myhur5/61F1CMu
 tmniBZ01DIiGJTgH1SJUmMfPEhIr4Nr/qCyDHKo/01OVWYwv+T1llHuMt+YZ3qvPI6h5a
 yFp7MXStJKHPZalhECorAS1X6jNq4pXbo7vNHtsaVL0y1OMGQAEElDOh4XY9tlf7K9g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=hhSvh22U; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::11"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 85F006071D
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 19:43:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id C8CA02003C3;
 Wed, 28 Oct 2026 20:43:21 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Wed, 28 Oct 2026 20:43:21 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Wed, 28 Oct 2026 20:43:21 +0100
To: Peter Seiderer <ps.report@gmx.net>
Cc: buildroot@buildroot.org, Robert Rose <robertroyrose@gmail.com>
In-Reply-To: <20261027195613.2168721-1-ps.report@gmx.net>
References: <20261027195613.2168721-1-ps.report@gmx.net>
User-Agent: Webmail Free/1.6.20
Message-ID: <a9587805fd2ea471e873c68c51e1504c@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH v1] package/grpc: bump version to 1.84.1
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

On 27/10/2026 20:56, Peter Seiderer via buildroot wrote:
> - bump version to 1.84.1 (for details see [1], [2])
> - add patch 
> 0004-CMakeLists.txt-fix-grpc-compile-without-third_party-.patch
>   to fix compile without extra/third_party downloads
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

For info, I added the missing links and also marked the
commit as "security bump". See:
https://gitlab.com/buildroot.org/buildroot/-/commit/727b904c13bbc2a9a7a530b1f8e47d7d180c2768

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
