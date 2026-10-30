Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5CA606A31D
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=DagNos+j
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D96D08169B;
	Fri, 30 Oct 2026 15:27:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wdVYcAbO2m_m; Fri, 30 Oct 2026 15:27:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EC4B08168A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374073;
	b=aT96DT3DtE4EbQacv8j0THXrZd2daO6axLidqQtT/IzAkGOC81tnTFHhQrOPxRKrj27L
	 j4XuwANuMLuyZ4iHo71M6YbPJHfZQ3avUj9tT/ijK8C/X+zK0UXh10+Y8aapnL9kjWO4Z
	 D5av9nMDyHEVM65A9i8o/iqGUcTix/fl7zMw5vhtVd+0qt7LRmlwTfIeL22y5SNwfVCzB
	 65nG8Mv5KSCdWzfmONmJycVBxceGELfqQRwHka1eAWwb8bUa/JA2juV6DkVXtU4/RsGO/
	 qIoD9nEG91oCux48nz2KoFxm8F8ypIFqQuLyz9o/f176o9FTzeRfyLL3YP0fwS6ZS6w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374073;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=vKuxm7xGNhl6me4e913y8/0IZGm4fHbPhscDyksCBbc=;
	b=a6FKr8ps+geUqwUzPp0CTRwQBQDQ6HjGd2nTDau0HgZcLlRz+L/j+7YwznzGY+cOF1Qp
	 EmUtCKnQ1LyS46NaDgmQGZZSq5hVi1haWwhdNQZCl7iqW1ffr9+K3Fp/iIL3Qd07dRXc/
	 S215zyHjIEcMz7UO1XmrMwIkw64fYklo0W2LLXzBB934W2khYs0jvHuAwQsiZMGCg2slW
	 lBZFpqan5cqSuaci02rvKqh7jYSZNhPgEsouvlgB8MmBMvSmU1LtH8PPkddVo/3prayDS
	 w16x8xaq2VY9sKlnRiCLFzqoMHa09hYDo+2xD37t+b1M6fcljCcTqzAe9mI2jbbDIWA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374073;
	bh=vKuxm7xGNhl6me4e913y8/0IZGm4fHbPhscDyksCBbc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DagNos+jNfY9IQsQ9sbG10KmXhMaLvgqsGjbJs5GfmiSbfC/Nnr8o0iId2FC3cZMG
	 C9eIBTZHay+ZneyygHxR2g4PdkjNcO899jXzi9HI8mIJkcAE3566caWFVVIhb9k3sL
	 9EZJa0xv3mfTiK6CYVe9tzVN5laGdSTSOSy9VbGtl/1HAP91Np0AdaXFigpuI+DnEm
	 6dWsGkI1oAfobJtvyAtpxb6dCGRKZIlaAynXiVLL8eWFV0CoE8fmO/mCRcp9gHdfob
	 vgZvxlQiV0UD9qdIxNRtTJIKifQwLmhRdo3xSBheIOliWm1Bxuq9V+1ttOHEQAVL4D
	 8mKaWHLqWGGKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC4B08168A;
	Fri, 30 Oct 2026 15:27:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A0982D38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:27:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9CD4760B27
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:27:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DeVmTGw7jWY2 for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:27:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EB4FC60AE4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374040;
 b=cSzC/WUZOIaYplbETl4sryR0HFvq5lfd3yisl91Ot4BwaS+et07TIk68l9LFEN3bEUNz
 FeI2jkusNfpkDDqYBW9LHaWbc8Mt7IIrkQd9kei7U7X7k4h4VzPYHV2kX/L/Hck9kmbNy
 d9eBmIs/sT5Lvaj7+/CG2/6qk3JUO9xw2Foo3y4s55kzlR9WeU//gU7ZTZ49p8JZOYYDh
 jo/RUfZPXNQrcj6ML7eJeSSn7XSGsGqdx7l+DOSkDoj1hYAxfG5riu0GueGbPx9eCpcEX
 IflyubQuNzufE4l0ccdIObMJX6TnecyIz2dN/nAsHbqpHixTEh6XwTWy8OsMHuI0HoQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374040;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=ZeYYnQzbxFMsTIDp5q/nTdVrdZu9j3s0lXQmxFrG38c=;
 b=BaeP79zb2GxzZ+OxgncmSHDR+MABBQ8RAhD2b0PeEZzchGt4tQxIRKM+ZJutikugxd77
 +odkKVT76OBPdDex3VHLl/pPxthcSvw/8T+0V15y2k0eT6wOzj6uTyRiYTwPOq90dKDpd
 riqYk5ddotEeA/oj84EKJ7iXIEGSgTbCJBJIbXgYliJPWqbIIQ1+ZfbbUKWuxnD4Gb6ZO
 QsvjPnK5SkF76JHrzOoVtZVIOjbe6mYF2lef2Q9C91hPWU+g+e7es1fjrtQaGc6hbo89M
 XkB6thSleV7R+49AbvTIau5Uyzm+O4Groxm2C7PRSMR8/PaQgIAaX0IbulmEmTQNL5g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=S9vIoAnu; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EB4FC60AE4
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:27:19 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-48e04773687so299149f8f.2
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:27:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374038; x=1793978838;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ZeYYnQzbxFMsTIDp5q/nTdVrdZu9j3s0lXQmxFrG38c=;
 b=koMf+OPjdyeM3BfYLUrJHMlR1Z6gTdoW9zYeo/Xc59m7HtaoB/nVu9n25UPm/7fLEK
 18lyRrATgZ+fRyUJ+8hTs2mF/Jp2HkrRhtuLJEngaeNAyeh9zoEmC9KKfwGb/iYgKog0
 UefudHxTtmhdVFkVmS7aRxzNoQRz5zxFZxHrjBZ33bUP4tuoQ4adulvj1mW6uOw5gwI6
 ngBocPvm5sMFZi7xcfQoFr+3nzMz85+MNe4ZorOlfYNBAAi7P9pnVFKspUGhftAJ5sIH
 GAKYp4xpnHlW6u0XMJiG3TcWQykXH9NU/kxEDSsnHThbykTKJgQtzU9jGCcNz+eLVtXR
 kdsA==
X-Gm-Message-State: AFq9FYJ8jpvgHuvzk9jrvN1Gwe2r1gq5W5XyXAABR0N3CZdhKfsXbY7y
 /hzSJPjLM1uGeAjryMwS9od5S6vyBLO35ZWxgig7h/fwZwU06RaVNlS1bgCYAByl5iwjymo3Dx9
 HncSfnnI=
X-Gm-Gg: AYBFou2tC51c92jFsMYkYrNYm5zucjytE66aZ0f0DcRX3ExWfUSg3VZ5BtClsDwCCZg
 p8EM1wa8yeUqitu1CQ5edvbv4HtT4O/Xc41kmD5ge8vmZNXSWZqgYcbt1DrHhP5t6NsC3dS/vI+
 sEYbwG6p+5ImvNH/nlPS0SHT7kHpa3PFH2WpepYaFynlaZl8ABdbkKkYmu09mSdiBMtWEvf0HIC
 BnN4/dbzpIEAeV803cVNyGZR9lwmm58ppU2Mi09VGCD/MLpzJc2Qg+D/Qr6YHaf3lfy8SgAkXHA
 VdSOcU4h8mRXUIXjY6NaCp3jz/XG9U7nh9G/x03hmrBuP4SnyJuEkkIeBDxzkIMLN62qdpy2yah
 Fwzn8uF7t6CGJe5H08zmHnFPWIkq/AF8QeoCIdqEY/HWCSTk67TClm/OETEVmJanWiTwcO+P4Lv
 YcgDwQ6Pmlw6+q8ztayldUusn8jyr65TpTgXTlGh6UVrDOXLoFbf1L1fU5hWwylUngkeVfnAw7s
 PME8yCTRj1grooPYNrbt67j+SJM9sIe3TVe457ysqc1LmgzjJcM7DOSslVsOVtoWLOEM1vFqJ6v
 A5YtQdS3sLNoFUKHTc6HvD5Y3ZUZ2wBF3Tcbw/1wjO+z876WIPUUCrQsXz2p1vWE1n32uhq7Lmm
 O3p3iByXEQNbtUEFbMkg=
X-Received: by 2002:adf:e009:0:20b0:48d:f58f:c91 with SMTP id
 ffacd0b85a97d-48e6e3022eamr4698358f8f.19.1793374037902; 
 Fri, 30 Oct 2026 08:27:17 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b80333sm3913752f8f.32.2026.10.30.08.27.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:27:17 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:27:15 +0100
Message-ID: <20261030152717.1906655-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261020153353.1865260-1-thomas.petazzoni@bootlin.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/libvncserver: explicitly disable Qt
 support
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
> Qt can optionally be used to build an example VNC client. Like for the
> other example clients (Gtk, SDL, etc.), let's disable building this
> example client. First because we don't care, and second because it
> fails to build:
> 
> CMake Error: Cannot determine link language for target "client_examples_qt5client".
> CMake Error: CMake can not determine linker language for target: client_examples_qt5client
> 
> This Qt client was introduced in libvncserver version 0.9.15 (by
> upstream commit b44665c0a28ba3776edebb57548562cf7ddc117f).
> 
> No autobuilder issues were found, but the problem can be reproduced
> using:
> 
> BR2_aarch64=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
> BR2_PACKAGE_QT5=y
> BR2_PACKAGE_QT5BASE_GUI=y
> BR2_PACKAGE_QT5BASE_WIDGETS=y
> BR2_PACKAGE_LIBVNCSERVER=y
> BR2_PACKAGE_LIBVNCSERVER_INSTALL_STOREPASSSWD=y
> 
> Fixes: 3b62f17f327ddacaca9ba134c4a9c1570bd869b6 ("package/libvncserver: bump to version 0.9.15")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2026.08.x. Thanks

> ---
>  package/libvncserver/libvncserver.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libvncserver/libvncserver.mk b/package/libvncserver/libvncserver.mk
> index 49c94b8708..e541c2471b 100644
> --- a/package/libvncserver/libvncserver.mk
> +++ b/package/libvncserver/libvncserver.mk
> @@ -24,6 +24,7 @@ LIBVNCSERVER_CONF_OPTS += \
>  	-DWITH_FFMPEG=OFF \
>  	-DWITH_GTK=OFF \
>  	-DWITH_SDL=OFF \
> +	-DWITH_QT=OFF \
>  	-DWITH_TESTS=OFF
>  
>  ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
