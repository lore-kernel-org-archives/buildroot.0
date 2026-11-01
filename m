Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18351606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=l7eDrtnE
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E691A6065A;
	Sun,  1 Nov 2026 17:07:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NQBuQRe7JZYW; Sun,  1 Nov 2026 17:07:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C5F83605F9
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793552840;
	b=Zmbfyq0oovFLaYOqRIZeRvL8a7Zcd+aL111RuwSaMItHzAXAie71D6EbiWeSMMAcDUju
	 Bdni1juePhU3Qp+pMe3RiLzPVaCR/tpp9vS4TeoUAmSo5QfRko0yADxRTNt+2i1yLl+p4
	 mnqhKoo5RDwuYBGmE/neOtvKfZvnh0edTN2PSr+OqKboy2V9TqImkU8TyiGmafDqxSC3B
	 OaTd5ibXlG55V4un5aQuF2+FPwrXFq6lfy90V6MxZviHRyA4MqJZ4L4Dfhm03RhSj0T/H
	 cI05n0u7Kh4AOC/7EJ+ZX6yKRFUOGtoVXcmrenqru57/BBkXHThCPoSNBJStLUvmt0A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793552840;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=gHz/rPP7XSAzITwuuLWdu1i12Zy+qPy4ir8w/wTVq00=;
	b=tQoa40okB2Bxs94JpPLRvnH8tHhR7tIW35XHViyQIlDx5JrSVy0w83nKFlcbbu0W3G4n
	 wRl3zUDm8AAE83Yyk40gVkVjrYxDKJyxg0M9iXP9TJiNZ0Zv8IZkaglORP1cmmtcs/ww4
	 JdcK5Hby2PGVVUywZWyV9re2Ff5l4pufIiQ6tJGVKahJ5KMAuOX1j3BRBPBhvWlh7/FeS
	 kTE0+jOwxijJDslRQsC6++E1zCxN4/8DeUSB4Pq9++c9YlkF+NiDd4Nk2fNSQZO3cRuBS
	 zmW89vfbfWPXt2LoonHiPfHmeBTPSrX5Ap8bRuKZ1+ed0OGKopBxgHJRyx5snjT/pIg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793552840;
	bh=gHz/rPP7XSAzITwuuLWdu1i12Zy+qPy4ir8w/wTVq00=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=l7eDrtnE6BelckuMJK2uKx1aS6C/6fDq+/XVPHjk4vlTARPYZJIrmW+12+UTU+X0b
	 3qK2Q5bqk6KNxR3DCAYpgjSPbxambAk2YSVoe8+C4kBK9quYYAOOgsmViUnqfLF+So
	 R/hGJ4GerkqdCf4YDOHZ+fu1yN4DJGrbauaMjGD6y5Iv+aoMLdedj1w51XTF9eYeYf
	 DQCCclqq+4u9olA363K98UigISRcRmM8GrOl3eUNC1yy/a3pVV0Zj/xcTyqTb1mJqQ
	 a6ZqS3RuA8v4ZDt0tyQijmv3grdGrxwSFDb/5bcI5L7aleQQC6lknOAzJjUaCk7cQZ
	 vkRw7ey1E5CaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5F83605F9;
	Sun,  1 Nov 2026 17:07:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F7D52AC
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40EC740098
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WkcJbpUwyLVT for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:07:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org DE39E4004D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793552837;
 b=nHmAJqnH8SQKKBm6zZDQIvATclpITPOace7thRl4x76KcyUu2S7UmZm2NNfebj9wto2g
 OOlXiqfPfIP9TVfJFkdD9SDhnjMBpp7IUEHMjE1HjLK/3Lq4xBhX9S4JtEdbUlq8QBy5O
 ezDF6PCEIamjaR5AXAoDGp8PrVC6jCVpYnowwdlQxz4588VFTO0ZufGBz5G/xZLmZrVZw
 ZzAMYlXecelvhpZHx0sKnByRqmIYYt/oiFuhZ5dDxLiRNJb+Scu/dSd/bVRf66eOCcVIQ
 BWqB3pFVAh1j3jCHaK7WahOj529crs+48J1APuoGGC8mrDQ/WTCY4DMc4nD1n8wnggQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793552837;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Dp7hypxPVCvkDL/Alc9ONFSx8emOtds9jcpjK9ODUuA=;
 b=ln8Y2pEeYThkPNY38+YgdUi+dsr9Ry7h+PvsDORx2h6IOutRTTuXmsLXEyweABIzK1/k
 lF95zLxTzzWXgXrmsP9xAQzQiwpgaeHm6aUEtCllw3dwXMJcx4295kmHPYGIoFfkjWl5w
 t6LDXaAcf16tGHbjcD6RzlSmGc97M/+au3uSd/Drg8aGB1xDemR7qAgKLFEIQG+VRi3Es
 5S+JYTzD8P+ZIPBbl32SggWz5Dzyomvim8pWOh3gkItre+vL1WbV3Jwvn3CEObNf0zl9S
 Pg4wV2HjTsh4y8GAw6MjdYrkrZK6ly0soZZwzn5hJteEEesNZ4Gi3n3ZbEtPZSNyV8A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=fo5M5EC7; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DE39E4004D
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id A72C84E41378
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6B10360750;
 Sun,  1 Nov 2026 17:07:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BF57A1032912A; Sun,  1 Nov 2026 18:07:10 +0100 (CET)
Date: Sun, 1 Nov 2026 18:07:09 +0100
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Stefan Hager <stefan.hager@ginzinger.com>
Message-ID: <audxuGQMwQPpYQAj@windsurf>
References: <20261031134509.1584908-1-thomas.perale@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261031134509.1584908-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/cpuinfo: don't support ARMv4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Oct 31, 2026 at 02:45:09PM +0100, Thomas Perale via buildroot wrote:
> Building the package cpuinfo with an ARMv4 architecture would result in
> the following error message:
> 
> ```
> /home/thomas/autobuild/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-gnueabi/13.4.0/../../../../arm-buildroot-linux-gnueabi/bin/ld: CMakeFiles/cpuinfo.dir/src/init.c.o: in function `cpuinfo_initialize':
> init.c:(.text+0x28): undefined reference to `cpuinfo_arm_linux_init'
> /home/thomas/autobuild/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-gnueabi/13.4.0/../../../../arm-buildroot-linux-gnueabi/bin/ld: libcpuinfo.so: hidden symbol `cpuinfo_arm_linux_init' isn't defined
> /home/thomas/autobuild/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-gnueabi/13.4.0/../../../../arm-buildroot-linux-gnueabi/bin/ld: final link failed: bad value
> ```
> 
> This can be reproduced with the following defconfig:
> 
> ```
> BR2_arm=y
> BR2_fa526=y
> BR2_PACKAGE_CPUINFO=y
> ```
> 
> As stated in the README of the upstream project [1] only ARMv5 and later
> CPU are supported. This commit then exclude ARMv4 from the supported
> architecture.
> 
> [1] https://github.com/pytorch/cpuinfo/blob/main/README.md#supported-environments
> 
> Fixes: ea1cc1af55 package/cpuinfo: new package
> Fixes: https://autobuild.buildroot.org/results/f14/f14e4afacaa61021463c457def1cad3c81d35f29
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
