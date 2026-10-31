Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFBD606A31C
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 07:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gy4cInMA
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CCFC60639;
	Sat, 31 Oct 2026 07:48:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id omPpn5WC6KBP; Sat, 31 Oct 2026 07:48:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2BF3760666
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793432927;
	b=MEzkkz//67boke+/+rMGkcYxRwgPjRIXt5arNGJnKtGcZ10IiMb+mLRNXfm5TVq4tRrd
	 hmZeVy0HhdnDymUbr7VlHjxJ74NJm8J9QhluPHfKZYoVbx9idji0TlCFlzEdwfmmwPr29
	 3brdTjCmAshyQvvhxCXs1y9ep6A8ska1SYvAC5KhO04VHuP8yMvOet1oyADLP64lMlSWO
	 IiOaTYL4Rk8dQWLeIYPhcJ5B7naACobjraEn2vGG8ghKuVxj7xxj4UUqAe2R8dyZNMt3g
	 lUHZavlhqrL9Y4yuvxoVin8Sw6n0FeiKOcSsfmxsuzNBsF+Di/dGk3+aVOqmFSbKG+w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793432927;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=UhkokiGLyjazzhRB6UvGRpi2p3cn0oLb7i8lXwsSpEY=;
	b=gZOLv1mYs3ljqDopNb37sVtEkI7xTLB24flj8Z3PJRou3+NC0Z5qIk648wzTkVWMjVcZ
	 ks/ecIK2n0D6lZ76QxeXh/N38zjZYS8s4VZJKWTgPGBYgyLc4JPOqMjktrtAZyq5hXlk5
	 IjTmg+kRJo+iu8Tr7QItNSKhYO5gC4R36+c7daDztPjKIk1Uhp/cwmcrI/z7z7ZOiKWDA
	 mgPZyZ2mb+8R52um6y+dFsuV6LN0+ehKyF6RYGj4vi1pYuVNwcDxDVRlastuSFHFL16WL
	 Dx7ivhp/2KSgcU1Z9oZuCCaSH+AlSCq82viB8G+V58ArltsteQqkSVmOEwzKM7WQ5QQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793432927;
	bh=UhkokiGLyjazzhRB6UvGRpi2p3cn0oLb7i8lXwsSpEY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=gy4cInMAGfFN8HYpXZRUAiVCcfX/8uyxcme7CDxEFeBRp2wGIgPxGfKUrtIJGNpyQ
	 V5yo9yHcE7p/cQ2QvTMML/Vh1qZw3bCivkjFbk++RGJqNVnDy0GCDxGSzRf5/poA7R
	 hAX5z1Q7q7S05/UAdr7WcQ1LrV8NzUSU2WX0M/m1Z1JpxqtMgWjcLBheY7YUJV4Bcz
	 tS3bDYpauyY57lZTUKhv9pPGN2Ki9izfYmfehP8zLc62Q4qTGfouAgIUL2ZNpKLqRs
	 pnmm4hd0vAJTD6T+3xE4P3bZyEk+McTXjFTGePUDB1t5/E2cFcG/bWZRxSj9agc8SY
	 z0w9YRi0PuO6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BF3760666;
	Sat, 31 Oct 2026 07:48:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BDE29362
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 07:48:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF4E240B00
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 07:48:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FcJX75hVm40j for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 07:48:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8675D40AFB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793432925;
 b=EBuIpxGxJoDV0IP/BnnAzcCyVaoDOL21C7nlwltT5ZoXPBnmYevKdT4WwTm8rYy0MU92
 s/VsnTQZYy6dEu1252zLw5h/zv53Z8Dnbbdjlllf47HcpPguUxMa5tOulJyBiH4QkSSCQ
 f3ausSpaQVj2AJCMc0HMQ8TIyO7bnjHpudccKLlejTSYML6HQ8bXZNBKZVTxE+hE5Mn6c
 lmPHI29jcFJ01QQUxkHoYbcow52EiZCFdwJL3xaOYxY+w7ktWBjZ2BvGkIZRXZcLm+bXk
 jl2I585bARe8wIHnwEUrOldCoAlGHC/F8QCFrzSBZAH8f/XqFmqHyW+J5jvxw2aVaTQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793432925;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=SdNnSJ4DkhTNGpRMF6kTlnKXTNnVZhqjBU1/VPNhxk8=;
 b=RqpS0ugY1sFqNZrXI99Wy2Z1IfJ6zsdyCfiZsUWbay3iABPjZzLd97VpiUu8F94BYV1U
 mkL78Y8SlDq7WuFNOn746+p2eZuGzHvBJx+kBdGIzjNa9pQXHtXdwgnSPIdGdWsC63LoB
 zxB5YNNVTV+1v4oSVmnGNDs6YIXn68LerMbtip0ef9PGJr7LuU8rwI2QczER1sZ2SbEU0
 aeOfPJbn+x6RGAoC+KZkdSfwZcYDoMNlGZIY9qYpiX5tCsXw7JCYBmh+Vm+k54HEXlgGL
 iZ5Yxl9RYzk1zqdMT5VKcrvtFERG6SrNO0qEgiIsXfiPbwaQP7j4URLRUX0pkJhZPsQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20260707 header.b="JouY6/xB"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::529"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8675D40AFB
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 07:48:44 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-6b167ffd132so2272047a12.1
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 00:48:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793432922; x=1794037722;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=SdNnSJ4DkhTNGpRMF6kTlnKXTNnVZhqjBU1/VPNhxk8=;
 b=kOazkethfcA2Vm19UsbC7FEzf7SJ94nY8QHq/z9aMlDLhIn4co77OLbb/euQ//Mo3Y
 Gw5jkaXbqPayfEzNeguQvjyR4VG/bK4/4xxSG3+ItTf+pW8hf6ZumbRp+chKhyqAdJEC
 YsezAEQNYsgVThceVlRKWw1iSS5sGonKcoDNFJWW+vU3pMws4MqDTy3RGnbxoKoy1mFf
 4KGXTYQTbJ2Jaq2sLM24MZOmY41mZH9HvjUgOBH1YwZLibiMpD8gnYaTVa5bFKzXy5PA
 YlWJp+Xc740LnvVWv1ECzf/wMZCjuU2ctG40z4Z8s/ibsu9/qhVfiVivikxrprAQATC2
 Yutg==
X-Gm-Message-State: AFq9FYKzNdlwgPh7ElDxqXrma9F90EuCly0L7e0r2GkADL/emat7Vx7A
 kcCcpROMJERavbI3TJe5J/tRH7uPBCaGcSfw6Vh+z2tNen58YYPk2hHbIQbzpw==
X-Gm-Gg: AYBFou263jevHd+tnCJtnvrWpok9ab0ubhwuvpy8iBEikB3aYRUsHwhV7zEDeqp4aWp
 WpkURyenhFiMJJSC3ZY6piyzTDtUdClDrLb3i7hdnCW0l+uKCep8ErQDOTk9zZJmiYvntjVy8L6
 C3aEXc6GHnlp1D19NzXVtapArWerf8sxbYGUNxkQUnvxW56GHL2Q1FQhugRUp2YbtfPTNjCzw9o
 CkJSeZas4miatzmjRNuUzXKqdjwPT6w2+/Jt0DNU726g/4UqCifpRXktUqY9U3mCdE7mCKX8tdW
 lj7KPUbh/R6XXSBs6Q8xHZvQDQMEpJeG9sFd57uDNrcxU4OqjrqRpXkbAgHD+6QWkL6zoikpsbp
 D3Y+qH790Qp1dOmC6j0g9kJB77kjsA1+fFVrrGheqTgKLORjuPtIpV4qPWw7edr+T94xIWpX6BY
 mOyjyhnu5I46lsGVgpDYhWXLdcwhnds7PuVLsYOboOk7cwQU89EcEnmsYWvEDypPqfhP2EB/VvE
 Jv0b+pj03LDWbUoIh369QGNze52sFr0Td2FcBEEs35Q33lHaedX0XR6vPcIPDScsd2U1FFSiVlB
 //IMOKN4b1Qx65nAR6oDjJ1996Jqv7uMBrQJ0+90RpVBioMqRDVN1S7hpG5oWNi4yFuoSQEazET
 XNOq7RNGW
X-Received: by 2002:a17:907:961a:b0:c31:91f9:60b7 with SMTP id
 a640c23a62f3a-c4ca7a69731mr412644366b.34.1793432921895; 
 Sat, 31 Oct 2026 00:48:41 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4cabe5006dsm149202766b.64.2026.10.31.00.48.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 00:48:41 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 31 Oct 2026 08:48:40 +0100
Message-Id: <20261031074840.373331-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libcap-ng: bump version to 0.9.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://github.com/stevegrubb/libcap-ng/blob/v0.9.6/ChangeLog

The new llvm-strip requirement only applies to cap-audit, which is not
enabled by Buildroot.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libcap-ng/libcap-ng.hash | 2 +-
 package/libcap-ng/libcap-ng.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcap-ng/libcap-ng.hash b/package/libcap-ng/libcap-ng.hash
index a39cbf142c..073800e4f9 100644
--- a/package/libcap-ng/libcap-ng.hash
+++ b/package/libcap-ng/libcap-ng.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  a2b4211f59b231d607c61ea2a13e9ecb38f446fe769b44e12da939d5af6d978a  libcap-ng-0.9.5.tar.gz
+sha256  399040138e0ca62fa2bcabd63da9af4431a246ef7a654561a0ca3cb00010a539  libcap-ng-0.9.6.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
 sha256  f18a0811fa0e220ccbc42f661545e77f0388631e209585ed582a1c693029c6aa  COPYING.LIB
diff --git a/package/libcap-ng/libcap-ng.mk b/package/libcap-ng/libcap-ng.mk
index 9d29350b2b..419ebc8b0c 100644
--- a/package/libcap-ng/libcap-ng.mk
+++ b/package/libcap-ng/libcap-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCAP_NG_VERSION = 0.9.5
+LIBCAP_NG_VERSION = 0.9.6
 LIBCAP_NG_SITE = $(call github,stevegrubb,libcap-ng,v$(LIBCAP_NG_VERSION))
 LIBCAP_NG_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (library)
 LIBCAP_NG_LICENSE_FILES = COPYING COPYING.LIB
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
