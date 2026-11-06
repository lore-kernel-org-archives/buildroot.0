Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208C0606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WPeIconB
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBF5560AAD;
	Fri,  6 Nov 2026 21:17:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P6d3AFwN4uan; Fri,  6 Nov 2026 21:17:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2759360A44
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793999868;
	b=idZjwkwS6r1GSSuQj9yA5MByk/scuIn5uhEUM6ZJvicqTsKRSQv+EXh2BITIIp0Lir6Q
	 NiHM1f93RQKTRswgpkoTw0rzxdUfnmwruCo309qKk104+WObu3ZUlxmg81swuYw338dnz
	 dYGr9XSFzGqts1I4YeruPRYf4r0L3fx1Os8m1fR/tZOUkInKNlEoOJ//AC/3Bi8QCvgQa
	 pQ/BdviTj1HG7byAC2HAYP5ADIPW6FEtQvo0HgQn4kTNStMgXs4UVC0vqJabJF6YXgWh2
	 QCoOeglMTWJfHo/FH4tO++lssA+R8dbOKc3jvo9+47RrOCewhuX/Wcl6IuciTU09bog==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793999868;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=u+S2SpFsblCQRyjhcbz1tasU8kVLtQftqcpCPlGPfHM=;
	b=ZE/w0ncuQGlWX0iafVUwpguBQqaI5lsAEumXEtWuO3UB8gzL4T9OWGJFvpOsNU+l1FN1
	 CewZhEx15fKbxj49C92NOUuH8o6dTdFmOQWwj07lIc/FbtzbIAqb2MgXzQxYKmeDgomBd
	 1upCnqf3P42GWTjHF4Sp8BVs2FwrE3c9MtE0E9tntclYrClPg5V0boPkxB7PwYgbaxTRp
	 XX+09pq5rS4Dzfj8ljkEKAq7Llon1k0kX+6tvN3nc+mxcusGUrgfriOIwGCFO/ThdGebS
	 asmPmJdn6ki+qQGAwGCrrJDfle/Zr0WeS4i6qNJ83zQldA5bbnlSPUDMA3q/z9xfK0w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793999868;
	bh=u+S2SpFsblCQRyjhcbz1tasU8kVLtQftqcpCPlGPfHM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WPeIconBynU5+T97Lq171ZuMIgEI6eO/ilM62pOqyBjX4WIBodiUE/h7J5at4sORa
	 dFJsXmE0RHuVmUnFPr7jUsTMjGFJqoFOniDEc5C27coRniFmrNUgqeYBUWy/Re1X15
	 woDBq/ldh0gSjuQwO8HymvflFo96Aul1p43eY3KAWQLaxTNYASh/RnYLv7sl+2kQ2s
	 Xyu8hHXBtlV6Ac28TDOOoGhnbX8tKpVL6eznUYUj6j0DPnF/h646jtJJwQkyupvbMj
	 cLDBhlNzxYN0aC/394gqBWlK1wCbiI6ErfGeZwS77oIxMeOM7RGAOwVP/o8T1pEUqM
	 cL/18Fd4lxAgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2759360A44;
	Fri,  6 Nov 2026 21:17:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A88C235
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:17:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C67860A44
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:17:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3VgV_4QpYoA8 for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:17:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CB85A608D6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CB85A608D6
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:17:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 903A819F593;
 Fri,  6 Nov 2026 22:17:42 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 06 Nov 2026 22:17:42 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 06 Nov 2026 22:17:42 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261106191536.2120153-10-james.hilliard1@gmail.com>
References: <20261106191536.2120153-10-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <4b0e5894b02cd9dc15ee5575e70c17b5@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-filelock: bump to version
 4.2.9
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

On 06/11/2026 20:14, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
