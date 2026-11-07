Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E442C606A33E
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 10:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=PNtB4MNW
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA5E2811FC;
	Sat,  7 Nov 2026 10:30:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8QU2Vsq-i9LB; Sat,  7 Nov 2026 10:30:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E617F811D0
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794047426;
	b=Y3sk4FtkaZMoenQo5W/oIINNJw9feuC9EY0gZ4YzXYfc9zFr9amKLhqhQGLar8UGcfeN
	 UmltTelORKPBYqFaagbPy0HNfdx8DVGO2dLlfEg2dNSMT/5Rp7RMIF/Ju3JAyrQvUak3M
	 9Y4rA72SPXfpGBkPyEJxrWAh+7dhjgyuNvKma0SqddnMRF3M4BA/RFJLKNTe3t3EKihjT
	 v2oKLKxK9fVSpZTLHDl0rnen0+S39XaUlaGszCyWM1qHg0DtvfVG62463OOi36PUY/L7d
	 fGiPMuVC0LzN6XtyV92tle+4RkCkjTy7TCWz58qIkTUi1RvOi1FwOoY/mcEr1oA7fZA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794047426;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=6BRyS7SRdpvvuBby1z9K9bNjXQYIp4Nx26bTxCCTe2U=;
	b=UsbmSH3KVpaR5pGX8JW05+Lg6QlxCYmw+lAKKaVkxi5L2AWOjrsXbatlhc1N1F6qzWQP
	 LCEZeWBQjjJ9cgDVPzlYYUz7owCVIDnhqwM/0nOsiLDe+PEp1W6jlMmrBmw3rg7y2XRvO
	 tGGvYtACao+EIUi2c0Wl8euVtyN14WXBNcVLzljX/jUdFVMXVW0QaMDWMGcNmbyRMQoAR
	 oA11OVEzY6p+dUCILAJzRDJu2GXWDGlaO7f3VlZ54rXZMOMoqMl2jzLM9BnTBXAspDh6X
	 jdCEjZGsOCkLJqCyMbW5vde1PpZ6SJif/kEShNu0Wo71RZhMKkag7XopdQWYUgydMUw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794047426;
	bh=6BRyS7SRdpvvuBby1z9K9bNjXQYIp4Nx26bTxCCTe2U=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PNtB4MNWLn/XJtl+0UKN44tTKjoJ9MbvbVEQQWh4/V1Zi0nw1GNIewUzwKqp3LgfE
	 llV1fb+U064tTA/fC2GXSOsBJeFqat/d8Z7hZ3n5b7XhTC8e5A7fi1NS5XctsVIVOp
	 2/SuU+qcFaK2rUtlmaiqMgi4yalXM28uz3Z57ZgizLT68+knDeJvQVAmBOv/7fvZbn
	 yNUUIEP5gWK398xObyt1J94DzJc4ggXjJsHbTzt27AIiQC3hjNJxcfIRW8oZip7GID
	 zWoBHvqOzO9A3l9b+R3MZj+KRJsiKtkIwiOnMChKE1DUOLkcvICRGgOuP/XxteChQV
	 YwtXd+FaTz5XA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E617F811D0;
	Sat,  7 Nov 2026 10:30:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 19CAD32A
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 10:30:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B80B606C0
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 10:30:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6ZPett4iDpBH for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 10:30:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6FA72606BA
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6FA72606BA
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 10:30:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id B06A678034E;
 Sat,  7 Nov 2026 11:30:18 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sat, 07 Nov 2026 11:30:18 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 07 Nov 2026 11:30:18 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261106211918.2606369-1-james.hilliard1@gmail.com>
References: <20261106211918.2606369-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <5d59b691b5e929bd52f39caf3cbd3606@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-click: bump to version 8.5.1
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

On 06/11/2026 22:19, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
