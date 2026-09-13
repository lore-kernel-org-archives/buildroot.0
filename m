Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 630A4C88E5C
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 19:36:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FCF8405A4;
	Sun, 13 Sep 2026 19:36:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZhaMRzJqy_rc; Sun, 13 Sep 2026 19:36:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 46F85404A2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789328175;
	b=Pfhx3tbQqPHyjL6OqniolDVlH/QvccMDJhcH1OovrX1WLo9kIAreboCJBOj5bOlcM/wy
	 xVjsE1/72vhlD3bLprvjt1cXIxcFbDIY73w7w9orhg2SPwC/z3CbiWbsbLmE3xYLE4AYH
	 l/GWnUVnsqV6ThEGm/auZacLG9jvCcgr8k5iJvWEp1WfFpgevA/1Ar5Va+DX6z2p7Lyy2
	 Q4AjDXxrpC8Qy0X17YUgApVqrtEdpJAUni+CHUdjYC1ChY9mBRiubMFrH+0u0qea2mehS
	 VGQWR302fnvi0QzmTre7qwujQB2PsUniDiG+xtFbDmenVmHoQHQkLxNtDBuZ6LW67Nw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789328175;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=nGwVrUj23HKjFZjzBnx+pdearbU5SGN0ouGiVwHOit8=;
	b=Ao2nfna5hXUysJY4uj/0Iv8b1HrNiwGYCjJYtWru2ydnvO7emg8+oPySNYd85kRwWCpu
	 EAbXtR25KmjSfIfSOStbB8CRfGCecKiiXOwHb+HuzoRel8Snu+/gZhSQeHJk2X/VtAvf9
	 tGH7aYkiG2W5mOmeBwvR9rOCTng3B7mnspl6d7FIIIf49522L5IjUZnDa5PodgitinQqm
	 T5wdon1xKXZnNMtf+FXpXsGIGmL7OxgAYL2dHeCfQ64twqlQSc9oRRR9V8/RXoU70jeSt
	 XId54jsJ9EbCefoHAPyiH92vJsUsiJApDbFp3D+Cvc10awPV5+RLPraav28fLsRWTKQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789328175;
	bh=nGwVrUj23HKjFZjzBnx+pdearbU5SGN0ouGiVwHOit8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UIVFKL8rnLbXsRTgBgH3WsdUpH7DjcEjhaTBEFFjlhUe3+lvIJQmXYo7CefLHj8GR
	 nOQGOMA9eclaRjmyN8fVNuW8Gd6TAmnbIZ+8iCTWW7odW0Y/Bya7749nh4vVd6CDqy
	 WLgVpVZajjTxDFjxbSFBEfW+IOUUOsRtw9s9TAiw2Jt5OJx79UH/vIWo8B4byEE6V1
	 T0242ZMp7WNtcAWcw0u6ROswYNCPnG0s5HHMuPp3v7Thl7P/6FKlAkZ+MY4//gJcAH
	 q+dqeEJzZAScDcwTp71nx8SjCV/eMANE2i1SehGw6HZY06b0M8QpXvxCOCogjxK/r9
	 jhZIpMpT36bmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46F85404A2;
	Sun, 13 Sep 2026 19:36:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 007BB259
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 19:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA4D680CEE
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 19:36:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Ji4cPjX4REK for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 19:36:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2033080A82
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789328173;
 b=Lpv3pDHbvQVibOEb+qwYCArXU98ViIbSuGjPcZw4HTEZH7Cjd9x9JXeMnZwOVK0opKDm
 FC7LZRcT7VmvtD+d47xrpMX2fCVAfSKk1Ftd4AXZTziZkmihwIgzfXB9cuMT92Yqxyc6V
 bKkmVmphxFYfmxIJDoaDklJm14gz3wEsgsaR2bZxCxnHzGXabCxwl+p6MO7nCNN/AD32F
 4oJKhEknOz3F6DpQoQl0YQAczcngX+rP20S/E5HbRMCOCmGpvhvbjqyvQQ9RvFadheMUf
 eATRjc3P1s4pH+2l0v0Xs8QYtkwPuKRHilEdIXfEud/yAdXTzNoih2NTfAZ+S5RzuaA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789328173;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=d88rzBzeJOiniAQjC56xTQl9YPdxKbvrmkzmikcqKSQ=;
 b=NuA5elQ5mLO4XQSu37SfNK0eqnWNHMIjK5jIzVsS3J3p5pBohv8xnm9MR9ZJrLVPsWf+
 tK799xE/ITtpiewnErj5xH9m2IAoD+IVOfNxk9OM3KsSovjOnqCCHCYWJFplT0Zx4iKFU
 jGsHmGZKj6B7gRdG/qtYbttBYOJ5/3WA3TjXR/pSk0YlpFcCl3DWWPJMKHr2wxHXFyifh
 ciX/9zEnsqXCQjSlSxb03S2jZo61nA+bIVftPzooUvr0B7+tNrjtU95GHYYtmJFkp49Pe
 8u6WoQ3xxpXe8xyuRy4hKeeuT67hKLFdi0y+ds1vkULc/EWUdNMCmcJ6o03HwIEr7CQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=F1thGbBn; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::15"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2033080A82
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 19:36:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 1A849780372;
 Sun, 13 Sep 2026 21:36:09 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 13 Sep 2026 21:36:09 +0200
MIME-Version: 1.0
Date: Sun, 13 Sep 2026 21:36:09 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260913164000.1689498-1-thomas.petazzoni@bootlin.com>
References: <20260913164000.1689498-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <2c049cc59b9f831cc1470e562405a20f@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/libssh: fix select
 BR2_PACKAGE_LIBOPENSSL_ENGINES
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

On 13/09/2026 18:39, Thomas Petazzoni via buildroot wrote:
> BR2_PACKAGE_LIBSSH_OPENSSL unconditionnally selects
> BR2_PACKAGE_LIBOPENSSL_ENGINES even though libressl is also supported
> as an OpenSSL provider (and BR2_PACKAGE_LIBOPENSSL_ENGINES doesn't
> make sense for libressl).
> 
> This causes the following Kconfig warning:
> 
> WARNING: unmet direct dependencies detected for 
> BR2_PACKAGE_LIBOPENSSL_ENGINES
>   Depends on [n]: <choice> && BR2_PACKAGE_LIBOPENSSL [=n]
>   Selected by [y]:
>   - BR2_PACKAGE_LIBSSH_OPENSSL [=y] && <choice> && BR2_PACKAGE_OPENSSL 
> [=y]
> 
> We checked that libssh, with OpenSSL support and libressl selected as
> an OpenSSL provider works fine, using the following defconfig:
> 
> BR2_aarch64=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
> BR2_PACKAGE_LIBSSH=y
> BR2_PACKAGE_LIBSSH_SERVER=y
> BR2_PACKAGE_LIBRESSL=y
> 
> Fixes: 62103be918e7a155749b1b3b680a9e4ecba6af87 ("package/libssh: 
> select BR2_PACKAGE_LIBOPENSSL_ENGINES")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
