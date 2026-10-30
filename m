Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA85606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=grHnCnA2
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 986CF814B8;
	Fri, 30 Oct 2026 15:26:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3sGU-IQmhVKc; Fri, 30 Oct 2026 15:26:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B9B438132E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374001;
	b=Ay8RUSS4+CTclzjmCKU4zSkgtm2t6ZWlCquj/Fe9+hm32h8FzYnAf6L78gJNPe9LhpU+
	 qet/PSr00HHLYzCkZNRS8QCFjMrZf/cNFw4E2fK7q3DUiIFQqcApG6GQBxhCgea5QEfVZ
	 EMhoxYLGHNIZZSLYlNvh/q6iprG1RXgCNtUYwCTPpQkNfCnrgCGe4jd5zCAxYVzxLIUWs
	 mZWK+RwL/sNUDKXyV+OdRyiZ/3cgBJMhALDzGDe4bs5LYc6EAOE1clIwtuvo3hlbeq2JR
	 mMUy3+pttiutnlvCv9gkTRijo1NV2aPVQ22oiVR2I1qTKF3Pjog9YE7kPU02WHelgng==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374001;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=k5SLqF140WQHZYfA5zj9wNcx9WmRQ69pp+26wXsSIug=;
	b=CO9DVSjVJTpN+XKM+HF1pQjhIbV4ZRKSDswnIBJK0yaDD1oCd3vweLkrx5ZR6VzqXlw+
	 gazJ3YTCgHBT2d93VUXtyygJEKVmsb8nl1GQl2k/m2jpeExylcJQSrv6mfR4PAX3Ophtd
	 3cI2NwAauAOYsxwPq36AVwGJoc16R1KScH2Nt7ximdXfwQbuA3WjFnyXiz62ir64WKf5t
	 U1mb3EkV7Zbp50oiHRJGPz3phuB/DJ6I1JLZPZk97Cb63I+CVCEP8gRyWs0clj7IOGg1x
	 Mb7TBiaNkKoRN3PZKoRqSd4lUPUkog0cFZpNMeoDNOgUcqTLmCDKoX1TaHSXwpSHIwg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374001;
	bh=k5SLqF140WQHZYfA5zj9wNcx9WmRQ69pp+26wXsSIug=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=grHnCnA2sAmPmlyiOP52sC6nbRKUqZsqmzFDvC2RRyZRpLJoBfzFfhmh/1Fw9Fz2Z
	 xkyv5+Kl8/O+oE8sMvO9V5M+u5eArgyXICY96vV9TcG6VTRW43ZA5CrMWZI4KSsFkG
	 CoCidCRSWNCPr4TA2yem6niDyuE51eXZB/fCeCc8lMY7F+3F82DmrJ+QCN+cqB52TE
	 6HkMFJ6/CT/U+8rd6dn1eJGrIw5+Rd3HwMSEq9WpbtKQGEH7EoLNBjXkdTyk94C8xJ
	 yOnMjCMlJRT8oNw0PksFEt8VXf6PAVFIKLjQCKzHLCH/K0RBpRNV1wP6qvczj4n0i8
	 JjG9lD8U5BrwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9B438132E;
	Fri, 30 Oct 2026 15:26:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 81743D38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6793360AE2
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:26:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3osuGCWx6fPV for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:26:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7663F60A9D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793373985;
 b=GwhlxvAngRUYFRn7N4iRkbG4j3cScsoNaAENCHVXqI/Jj9GDFUrgyku9Ec9KcD8Lngt2
 goirJBVcq1we87lza7ojku63x33hQAkgxuKC236Ph2EDTkZv8fawURh0GfDSnycrRcqrz
 EOvu2ktpek0IcLk0HRYMMWSvGQnrIu9/3sI7T7r/GwuFUXXgGyUbgq2M2K6k+zyVnKNSp
 qRAzCpppXiPeekL9oKO63eHoAZu1qz1bwch/eb1lkr32lnhCAZr5ns/mvMmcaSDqsZ/tP
 m9blZWHxcDRqGNCBw9xwHcnRyzRlXzUq/yuaZSZ9QVynArkr4MgPXuqqPOHGLHmg6PA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793373985;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=uTVKl84tiTcZ7sGDd4oI00eRXuMaEaEr3pxvrWRhD68=;
 b=HNcgwT468mX+LI7SVPeyn46ZMssldKKiKPMCiAPJCnMj5j5oKHBZhWwjEl/D7JVPCv1Y
 2rAJyipgt3HUGrQjr2Wjxb29tSgD5itFKlgNQK3xYTSEWs90uC7dojw9L0PcFynJA08Bl
 u4La8+ruepnWzm7yX8fuiuRgdDljSqOoLxJ9Rd/a2Benp8CcZJCDNFNhajQQGnocpZvLQ
 XQJzWtHU4+EHsDaEu6AMI/Dges1GLOThopy2Dfc/ZnPkM+v8wMou4I306nuik5XWBAo++
 C8oZs2F6l5wkju932K6GA1FYpEIygqs7ehbR4an4aC5JIz9WmiKXRzHci1B7etJWkoA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b="BQEN/Orm"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::432"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7663F60A9D
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:26:25 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-48b060ec084so478428f8f.0
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:26:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793373983; x=1793978783;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=uTVKl84tiTcZ7sGDd4oI00eRXuMaEaEr3pxvrWRhD68=;
 b=bmPhyg6MIfi+IF6YOM8YWLy/MR2kl1xnNpCASieHMPzZgPBxWeabQp84Ft9HrLlxCH
 15N7voiEsWaFd+kdaojYi+SWJpEC6gv11HDyZ9RxMch6s2RYEOufzzIq6IqMBFvoRICk
 324KNvzJIQPXih/YAYuEZFgd+vxJNOrwWlm8g1UZbFQ87aVZqPaiqwtcJmYz6EsEmD8k
 80y3iQ6s/UVxrlZzGDkcSBa1l2mAmv1qtQ87QI6wJNB5wCI6LF/trpegb3+HBd0Me7gV
 9jrlpZuLzi52MDLx8JLE4SB35+/s8s+HlC8NgaerWNsl++A0LlOS+lbNxmjfxawFeEzg
 rK3A==
X-Gm-Message-State: AFq9FYKXtKfXjHWKq966sdlPSNgh2K2wxHLZFMFmSQDeFyDvwFPbOhL+
 dakS19Jt/eJSFrkYXbjyTeMEPdjrEaEP4zXklPrKMXoXDnWclPtuENOkiravJFAsic86gBAFjXe
 Y6kikMik=
X-Gm-Gg: AYBFou2CoX/FcP62OOqLDk4chXsI/7rKewnhEXxnGiigtUWJ3C3iTJcLXBGs8p2UZKo
 PrDOOc5j/zLTWAZRBd5ko/OnUN3Fs6I9Ia8okPJQwjXyb27KOQhf3+6Ay8lwhG6fWz7pyX/rD1A
 r4LH5O2TQkg6NYxX2dy+CNXhK/FPiIIjyF+XWHNTTsBpy3AOt3RFufdRtLSyBN0r0k1HOqg+Ugd
 L9mVhSJtkJtoJvYuHd7zQGlFc0JpOBb8tzc86joYF+zN/coiynZ3Jx6UUotdX3HHJLKmICtSWrh
 GRDqLQXrOK1sY6F6TeNjM2t6hirQdwtxFl9TlLlw66ND57nEq8aQ9wF5GkVElC3kgavgMjmA3mS
 Wxn5QQv1S4bpUWR0aeialk8oX1SlPohIbNQMxG04V5LjRjX3Dujp4WLKOP5M7X3n4BWgU9mSv4/
 r/O6rYYUx8wyVr7+F7pR2CDQu8ulwTUpgubiiLWle7jDppvfl21/bSuJqY9JQF7zRH/LDo3zte5
 QIsniUmVpF5alryMSmEwKp5SCV03U9JwlMmovS3/E5sMF6tauyC4Q/+OS5W6wfd5Vd6kTApZ1DP
 Yvh33S5pblkPKH4+N2BNUNC1QG/lqLY5V4G362U0anTR4Vp/Pjlq/Ge8DYCHJeXXU0vsTyIc
X-Received: by 2002:a05:6000:2002:b0:48e:5eac:7e48 with SMTP id
 ffacd0b85a97d-48e6e2f692emr6219727f8f.22.1793373983197; 
 Fri, 30 Oct 2026 08:26:23 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b77f06sm3814645f8f.21.2026.10.30.08.26.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:26:22 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:26:19 +0100
Message-ID: <20261030152622.1906134-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261014214158.535942-1-thomas.petazzoni@bootlin.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/podman: propagate missing
 dependency inherited from runc
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> BR2_PACKAGE_PODMAN has:
> 
> 	select BR2_PACKAGE_RUNC if !BR2_PACKAGE_CRUN
> 
> but forgot to propagate the
> BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS dependency from
> BR2_PACKAGE_RUNC.
> 
> Propagating this dependency requires a bit more care than usual, due
> to the ability to use crun as an alternative to runc.
> 
> We also propagate it to the only reverse dependency of podman, which
> is mender-update-modules.
> 
> Fixes: ebbaac08e3f462bf023c12077f739ed1c0543eb2 ("package/podman: new package")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2026.08.x. Thanks

> ---
>  package/mender-update-modules/Config.in | 2 ++
>  package/podman/Config.in                | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/package/mender-update-modules/Config.in b/package/mender-update-modules/Config.in
> index 88e0805976..cf2929dc69 100644
> --- a/package/mender-update-modules/Config.in
> +++ b/package/mender-update-modules/Config.in
> @@ -129,6 +129,7 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_PODMAN
>  	bool "podman"
>  	depends on BR2_USE_MMU  # podman
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS  # podman
> +	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS || BR2_PACKAGE_CRUN # podman
>  	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS  # podman
>  	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS  # podman
>  	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS  # podman
> @@ -153,6 +154,7 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_PODMAN
>  comment "podman support needs a toolchain w/ headers >= 4.14, threads, wchar"
>  	depends on BR2_USE_MMU
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS || BR2_PACKAGE_CRUN
>  	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
> diff --git a/package/podman/Config.in b/package/podman/Config.in
> index bbcb15691d..a8c625c5b1 100644
> --- a/package/podman/Config.in
> +++ b/package/podman/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_PODMAN
>  	bool "podman"
>  	depends on BR2_USE_MMU  # fork()
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS  # host-go
> +	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS || BR2_PACKAGE_CRUN # runc
>  	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS  # netavark
>  	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS  # libgpgme
>  	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS  # libseccomp
> @@ -91,6 +92,7 @@ endif
>  comment "podman needs a toolchain w/ headers >= 4.14, threads, wchar"
>  	depends on BR2_USE_MMU
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS || BR2_PACKAGE_CRUN
>  	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
