Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBF2606A32C
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=c5+sz29Z
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5123D60DCB;
	Fri,  6 Nov 2026 21:23:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pjjRhOTPT9tt; Fri,  6 Nov 2026 21:23:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7468760AAE
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794000217;
	b=Dc0rJaVfs4xMejTn8GEL0fBvvcxzIusL2AzmiE54S/+vNEv4Wc6W4wfBFrSQd7GRPVnZ
	 eKHJyS5XfkldIv/UXXdBkDQ3niAZ8AFLfWMPoJ3WgOBYFshz6XcYHXLbHDReNCZ/67VVD
	 7/SzHdKX22+0z3HijEiyg4fNbwP9lmtsD9QeyMQ5ypB3gYKJiG6W2wBckFyDHFMuF3R+S
	 lI6/Hwpk1HeX1BA6gr10+9PBNVnmPy8BWgoGtap0nvrErL034EtsjeMsf7vqtWubsewYJ
	 hXmpUTcFaru18nCQLi6EI356RnKdSTCBUrqK6HePvjMPsFn8UbzVRTtK9q2WGWPKwCw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794000217;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=Z0V4sYJO1VbB3myIAgpH/1/HtG9j2tHBq2x21eEJDsM=;
	b=I3AAWvKNePBH8uRbE2uMEq9/LsTFJ3EaFzmfiCVQAYXsbXFIlgHbaAY1y+DcT1OKs+lp
	 pcJrcvNsjGnnEisO46HEeN5PhAIHpHjMoI28Ii616HEceWhiXT8u6lk5j6yzWpXl/QLuS
	 IAkjysmDCdua95KeoKUo5tDhXujs9R7jUx8CwpmH9jFnUb6yprRxohn2u28YGAfUJzHFI
	 ERKuiatSLY4m+NQHUBsOEBr2dUafqyd0SDh4AOruZZVCTp7CmKy7+e3vZ2GHNcT8qNhRd
	 E/sDNEEbGkgMUYpwBL4yjaastujpTcjuP6kdiZoUS1yxpTDs+aBpy045XPPoeHEeiJQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794000217;
	bh=Z0V4sYJO1VbB3myIAgpH/1/HtG9j2tHBq2x21eEJDsM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=c5+sz29ZuHpQfXFVoRjSo02yj/6Nqssc3L9ZF1atBlAAcKFGnisd4yR1v5Oj6DfTv
	 /Ge3NnzgbSWwkPYP/8EFF1LMgKPBfKy0UPe6iwZKyyyt4gmZ630aA5KiWloysiSXUV
	 qx4aSAqj+ZYuJHWM75eJ+yTE7Q52l0W6EgQ8qpm+fnaNiFIyWlB1CRyL7SS2p8zA+j
	 PHfkFBM8zWmMvefV+zKA11AFyOC3npAkxkVcy2MN3EBbWoPLt1yvMAJKBSHjp6yYTy
	 Mmh95uEX8VB6HRKPO7mVEftelsQrQum7sjgzZzggui8NQBEGiAxdfIS7uy5FeGJf4E
	 +RREdFIuWC+fw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7468760AAE;
	Fri,  6 Nov 2026 21:23:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 01FC3235
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:23:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E80A881701
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:23:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id okYQY_UOh5hp for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:23:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 495F881700
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 495F881700
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:23:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 159E313F86E;
 Fri,  6 Nov 2026 22:23:32 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 06 Nov 2026 22:23:31 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 06 Nov 2026 22:23:31 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261106191536.2120153-34-james.hilliard1@gmail.com>
References: <20261106191536.2120153-34-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <9961d3a9524bfbb87c65d2d415a2df19@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-watchdog: bump to version
 7.1.0
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

On 06/11/2026 20:15, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
