Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF1C606A329
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Erx0utji
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65846816E0;
	Fri,  6 Nov 2026 21:23:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GizlG2X1aLzF; Fri,  6 Nov 2026 21:23:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 96CED816EF
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794000186;
	b=XrH1XsfdOSv6l4E2FLVV7vrBxBxUs1QdxCauz0+BjgKGtx+eoC2yQKOk+46GgaDHqw8H
	 +lG5I9Sw3Bjk9Phi9PdzNVV5OAiSWRyVrhAzLwV0ijt4sIjJYsz2IH+gGLvsryJ0ij6UG
	 Gq3VOMnA+ahfYb1h5sARdyrmI6U/WHoLxFXBdRHnfWuu1EuqwY52OeVDxegtpIoCrXc/q
	 uMUJeL3n5Qg53aX35Js+9qvC2oMV/gsvf9Y4UB0Sm9O3mfwVoib7vy5+ZsuhkvvlWLVLa
	 dI6C/813onZ61IoPsEeZwTqh+ed8NGa09/wQV+SiBvKAD2gCh3b2W2pxz/KNFY8ymew==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794000186;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=u+S2SpFsblCQRyjhcbz1tasU8kVLtQftqcpCPlGPfHM=;
	b=S9psu9mzNN9RBAHuxn1dwz4HWDhKDve8IlGiEigwykSBoond5MZi5uSuNchvgPhjAzvy
	 HDgIQO29bvUv6Xoezv5gnMIjr3fS9ex9to4wxVop02kOO9/RVGVeO+1s1OEPAAY26H/PE
	 5rU+F+bqR2yWSgYREN1y1Q60Fgj9kiE9Qj6iYE7YLUkD7J4SlbLxvIUbA8D1zoPrzPt8m
	 JHH4fXNjVE7KGwjgh8lHh0/08IMeuGIvxsG/sz5p4z3hpLUSr8WckzWbvCyba+sWfHGgs
	 Y7T+zZ0GMvnfvdP8KUebJn9L4Fa3WmWXe1vZqAtCRFWzDw74bUXQALUDPDnkp2hu2TQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794000186;
	bh=u+S2SpFsblCQRyjhcbz1tasU8kVLtQftqcpCPlGPfHM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Erx0utjixPMmVjPibhAwSuEXM3a1Siaje6CILsNoecH7k+ZQv2R1/4go44BQ9AqjV
	 fxRqKw4Bz41wFuASqNNQ+cD4NPIHVDwHYhN+dtdIQPw7EsjslajkJixnITKtTrTikG
	 vvEDJUp4gg/Gw/njlx0hZTVbmouyV2TwbE6f0BnYtQz/4cNJf++tzIruKrk/PiAhYm
	 n0o4dC63ZpJnUfWpGNkiP9fn6wgKN8H/CtlWYNKoFmpUoKdkTd5b7ypwXSFWSeALy8
	 Mwtvcor+KyD8/NrhmMKR3HFKKDqKH4S/pN5AagDVZfhWoRmW27XoDMLXxSsHONH5Fg
	 FgRFgbNC7TCqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96CED816EF;
	Fri,  6 Nov 2026 21:23:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B7564235
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D8F760A48
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:23:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3mSxpBfYhvij for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:23:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org F3CEA60A37
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F3CEA60A37
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:23:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 3CC895FF88;
 Fri,  6 Nov 2026 22:23:01 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 06 Nov 2026 22:23:01 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 06 Nov 2026 22:23:01 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Manuel Diener <manuel.diener@oss.othermo.de>
In-Reply-To: <20261106191536.2120153-32-james.hilliard1@gmail.com>
References: <20261106191536.2120153-32-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <9c7af23da22ee32136987a99ecc6fbe9@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-typing-inspection: bump to
 version 0.4.5
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

On 06/11/2026 20:14, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
