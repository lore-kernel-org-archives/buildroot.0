Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C08606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 21:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gwEZGRFN
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E57AA405DC;
	Sun,  1 Nov 2026 21:29:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XBLLFcc_0fD8; Sun,  1 Nov 2026 21:29:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D54924056A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793568545;
	b=Wf2LDobsDnU8HR6yofPUWiSEyKG8c5C7WL8BejiGloXJBh2e4HgxpUQ9XtRKIHiB4sXl
	 ge9Yx6RRSeAeNj6DVPNg+P4bcE/KJ6xdFrsmN5lQJealwNpax68ZwqoiVyNwBVWx+bqWK
	 sggr6rvuirU2/MbPH3Zhy9m2ho/6Qe7CaQh1GxLFGblrjr7zh4zKOOmVc/eirDfXn/y5d
	 XH9tQTdGTt5nEWuR9UP+5ZXsgjFxVn9Ys7uEYZjVaEoUevEVE51gEMsTBPQWoqL7eDULv
	 /nkl3mo6e/sR+VRchH/nA3QZb63DBgZ9CmpnGyYsANYg7Cj9VUrw6qC53/6z8dedRkQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793568545;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=dZnfzX8+cnKa/63pdjVCUnYWxkKn8sGYQRO/VWz3EfQ=;
	b=cXKEAqisYqG68xQ1SqwAtEbWyPHiRKdWc+oCHF1sH7vFpKt+lHU3cFL31E5BVyl5TaNM
	 E7IMWC3IBcZ3LrWvsXZriIeHIpvil8n8ond+QmPe0etwG6HioBmi5N1CbG3Fj9GYj6x8x
	 ZmlJIBd4dGLwqiNBcm8+Rad1Lh1kqxSD0A8TofZRqbAiLCB/UoCXtfsZ4qF1CRIXOs4LW
	 rNXemKzH5YhLCR6t6sqOYr759qMJ5hC97XfiqkSQHXEuv68IS53BmOyzJbARBirmS0Jp+
	 pu03YI9e33VkIY526Xn9GcLg9mxsk5Phjfcy5SUgkH5eRQYjcwcepnhHwTN2XnVGbYQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793568545;
	bh=dZnfzX8+cnKa/63pdjVCUnYWxkKn8sGYQRO/VWz3EfQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gwEZGRFN2mxdfpt7vDxVYTX1iKZS7TpDL81OrydFhw/I4NKfaZ3zFRuE4/+N3fGxQ
	 xXGkBxmK93VHqeTN09EqP0ABXPDzsLKXTdQga4dFfCDpUwyOYcjBpDwggsRJgHxCH0
	 RxfFa1+8kzRUns4IAHT3mgBOyAjqmt/CfOJEq3VD0S9PcxnZKaxuO23ji49dOvgaZv
	 6c3CO5l4KE9ax1UPQAIjwQXGDXv0nBBBdZEt7HvnD3HnhNWXjE5e4n8hqcaRE2W87q
	 VxovAMbWDtnO4xFwLufOP99wxm8Tqj2m1IXoqivTL048AQS42edKOUrm2p2GIrOJ+R
	 kPhG98yX4NRZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D54924056A;
	Sun,  1 Nov 2026 21:29:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 976DB356
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 21:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D6284004D
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 21:29:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RE-tM4dUNFT2 for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 21:29:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 7DC7B40042
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793568540;
 b=pgDuUcyow1cMcSSnkHKdYA+lIa+OOoo26huVoB4WyEIaANrRWJ8gIMVwY23PjHaSB8dS
 4cjkTbW9DZB1jc2qkbVM0KRKFu9c0sfWcbz9kdueU43xYG8vfvKKXEZmMxn7vVD8EnkDq
 IYgkk7Iv8KRilrJQlOL1NTNGtvvgIoy0GpgLhKVPV/jbze2doOrGqOtGhUzPT5Kq/bC7M
 UKeVTKTMmpw9XheRx1smsBu37o81SY5NfK7uXGAclVOB4FQqoGzbeuAh1MCT5/oY/fc/i
 v3P61BJdhQmYvTe+9HYUDP/i6QkYBDNN5Yg94bqjBTCUkTQUOPYtP6QeLkgQf7prwRw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793568540;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=N29IUtQE9dbchEBhzoOXgw5WJm2RZ8N0QJhl2Zq3U0U=;
 b=UEczwwWW4lzBpDdiKWY6XipoxEjpzR+y0j57LGVNhbT0bNqwWLAVXSue2g7sZZx4H5dP
 a16kaBrSU+DG44hE7PLxUaly67FD8ZaubTgCIYQMjGSHvwiRuUfu+tiMrXoGjc+HGg/T2
 PQkjxP+8soRgQ6+eMvVnFIAJYTgGVdAAqzEJIiXoSUm7jlcD4JSvpcC3Y4tW3EDyjhRyG
 Bwh+BTPhcE9KyayXPhJTkBAvylFbaT7mEp8uCwT8eFWBCWgirF7/K8r6c5HeU38F6357l
 4Sn583cf5QiKGIvr5zNcwFjWlL1FTte5dsPfr5yKcmfJjuwf3LJXNsBAM67VTGJRPMw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=pyN7EkpC; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7DC7B40042
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 21:28:59 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id E9A29C49F79;
 Sun,  1 Nov 2026 21:30:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2465760750;
 Sun,  1 Nov 2026 21:28:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EBF0210328C5E; Sun,  1 Nov 2026 22:28:55 +0100 (CET)
Date: Sun, 1 Nov 2026 22:28:55 +0100
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org, Francis Laniel <flaniel@linux.microsoft.com>
Message-ID: <auevFFXF0quq8FrR@windsurf>
References: <20261030152434.3738285-1-angelo.compagnucci@gmail.com>
 <20261030152434.3738285-3-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261030152434.3738285-3-angelo.compagnucci@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 3/9] package/libabseil-cpp: allow building
 with musl
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 04:24:28PM +0100, Angelo Compagnucci wrote:
> libabseil-cpp depends on BR2_TOOLCHAIN_HAS_UCONTEXT, which is not set
> for musl, as it doesn't provide the {get,make,set}context functions.
> 
> However, absl/debugging/internal/examine_stack.cc only uses the ucontext
> data structures, to get the program counter from the signal context,
> and never calls those functions. musl provides those data structures,
> so allow building with musl.
> 
> On 32-bit powerpc, examine_stack.cc assumes the glibc layout of
> mcontext_t (uc_mcontext.uc_regs), which is different with musl, so keep
> it disabled there.
> 
> examine_stack.cc was build-tested with the Bootlin musl toolchains for
> aarch64, armv7, i686, x86-64, m68k, mips32el, powerpc64, powerpc64le,
> riscv32, riscv64, s390x and sh4, and libabseil-cpp, re2, protobuf, grpc
> and webrtc-audio-processing with the aarch64 and armv7 musl toolchains.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

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
