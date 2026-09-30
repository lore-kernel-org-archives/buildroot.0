Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE5BCA5FAB
	for <buildroot@archiver.kernel.org>; Wed, 30 Sep 2026 03:28:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFA8E407F6;
	Wed, 30 Sep 2026 03:28:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rCXUR-8coSMU; Wed, 30 Sep 2026 03:28:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B1B6D40800
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790738882;
	b=X2vjcRnKR18j3vanGAGfWs3Y+2BSDaTSrtoMFJ7tAAR4dJLivy0QwBfRIuOOzs3+PXPx
	 uX9ut9f6z30laJKv5AGkDgdmM3f2Whh3Y/DKWcrrTUS/z4+KRSDcLBwmeKhOQF2F/USWj
	 uasrPALZzeZPUiHhmOwDG/MR1yQZi02uFe/0FCcBd42EFJM7P+4vgms6sEmtjvlZcN6r2
	 rj1X4Q/3wozXVvUkGhHmBreke9m2PsJ2iocq/IENkUqlYi2EKXeq7VGXhzGwj65V1b6Su
	 4XCVp9AnfUcc1R263YJ+N8o2ozJ96ZmZQWzAcKWcgAhApbdQAr3TX4Li6OlyUmQiAxw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790738882;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=O90OLPJvpfMFn0r0wLQFyqw8efkhA0d8t5ZyzFGXfJ8=;
	b=jfIWzGdRrJzQab9h9AB0708aW3XPnQTE+uGHXQzKcn0FGLf3mkuL1Xivcu9x8PAbZWhY
	 lTNmceDHPZyeCOLCJ//I6t3D9xTeEItTRJ1HLJSvRejmkyjFvTrsDJGE2En0sZB31YO3P
	 XsFcEzH2EFggAkU4YmOJCKrgj+MlPiey468CWKLGSdDIhM8CqZqXSmq+ry00i6F0B8fap
	 oqPhol4v5vJ6Hw3fyCcK8u92nHNuyq6fjZcA1GwHbBq+ZzVk/1Y3Az2ybcAKw8bVja+u8
	 jlE9a0ifAFPzg7EraLNfM1L7Mog0f51Z9Px7jymjFYGfXnUEbmQAqao2Z+rOMAMgfXA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790738882;
	bh=O90OLPJvpfMFn0r0wLQFyqw8efkhA0d8t5ZyzFGXfJ8=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ox35knONyTuQvRsISwuQhgafHMVgEECOnldLcW1NW48okxaDgYeUJien5wddwL9ot
	 dYNDI1eC4ie0ugbC8I4uVPWbG6iFS4Jnc5vUhQQh7tO7zoCSsGQKqheQ30TxT1Voev
	 XDYfQuICHzaJr+i8i0uSJIAOQdDBlHi2DjAFoZFBsIN+wyBeEYFnF4tPwzQjtTzhB1
	 wtW42nbaJ8J+lX3yBNGgeYBCsBD89x0MCYIpXY4wwr0Ev3p7DRUI1Svj5mTfbpjlm+
	 37uB8UJ7dSP/xr0Gc433MV6fnFQ8NnqUAlSGqWqjBMEqsP4PUgS2z6S3jHLukOgej8
	 SN3tsRtYuRbMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1B6D40800;
	Wed, 30 Sep 2026 03:28:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4696C2E5
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 03:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C87B40098
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 03:28:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JTvIJLLWz4-O for <buildroot@buildroot.org>;
 Wed, 30 Sep 2026 03:28:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org D4A7640051
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790738880;
 b=nI1PjxZ0tWNhVmnk3UrpYbHM/EZfxv0hHm10Z70z1eid+PwW0mOzzJgB5ASOBRWiyBWL
 W4xvkaX0RFIQDXHqUWqxApQrzfgoeH+QrEdqpJuIRuoAdtoCvPNtBFgt6AKbAXNa/VCWt
 cddglKVPpYwa2xkZczovDv4Bfqi8KC9M8Hku7mg4mRMh0P09KsV/JM0iUU+wYDpjc9Lle
 CMKoAwRxLrQ3UuLuvUbTXT6iNa0Omz6MiDocUzCdN7TnYuDZs1JOQoLkAmCqyC+6Hq/fj
 WY1Zp8ms5k6ouTJVBcoeVjRmc1CVsyfg3oE/k/OyZfNzF0r002buGwHnOGefkMnIdyA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790738880;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:From:
 Date; bh=GLgdMX8RG/Hx4cHPz/1xJYUrNwZUInKrgYP4P9j4dWY=;
 b=AGWJEOsOb1p2JUBS+p0tjRriL/i40sVZgSp5Wfx6W1lB/eVMYvOlGrM12wFDBiSWRche
 N8AvP6gLV63PFfJNZ6xKLxFW2GTydK5RqxT/wHBhXLWTrbSsK1wjArDsbIlJe3RQvbYFK
 /yShF7YLOSA34C6JkZM7eemgy5Tax9SbK2QRptIJL6SeTsmiaYwZzyF61fxucyB+rD1RB
 Qbz1wVp8yDw/y/e+2vv7Yc5GwVbbssbC9VrBRMxijqNc02OtiGrhD2IfoRkA6rYTScz3i
 5PTWU7X5qf6NTGDWMA3wbwfIlv18fnECSdUyyDKU2D+ZnMICiVmKbnUSEESV4K/4akg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=ObOnrNds; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:30::10; helo=mail-wr2-x10.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=ObOnrNds
Received: from mail-wr2-x10.google.com (mail-wr2-x10.google.com
 [IPv6:2a00:1450:4864:30::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D4A7640051
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 03:27:59 +0000 (UTC)
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-482f6351831so2820329f8f.1
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 20:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790738877; x=1791343677; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=GLgdMX8RG/Hx4cHPz/1xJYUrNwZUInKrgYP4P9j4dWY=;
 b=ObOnrNdsQWyLZgbHggDP7dNRb0XaxREx3DXfKcIgq4A9fLS2Z/SdXisExetG/UE/M6
 4rcMh+FF550IhfaGl+/9vYidz5JvfCx1K3N+9jF6pTPSQyH/tS6mNrTgBiMj7GC8Qrbp
 CdLita/FwwI9ZTgV6WaVBUsMJr1lqkAstDnTYEWmOAHaeY+Y/st1c3ZXo1yjSrc0g6MD
 QEus/4VAdzDiU6zGyLCitFUZHn5P9UgKlN3TVge52X/TB3VjfwQPifLqK3liAZXdFaNT
 eZrLKOtAQdw2yXu2W2yECKvtsOIiar1gLYMRydFHhoGUPsH/gb/+iU8DVsHNKXQh9Feh
 EJMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790738877; x=1791343677;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=GLgdMX8RG/Hx4cHPz/1xJYUrNwZUInKrgYP4P9j4dWY=;
 b=hTF4mOt0rIkJEDFTZ5Mgn+gg+0PYXvusxuRJNMb08lN3r9vqzqKmxAcdyQVfC0zdyz
 +YetIVHEGyy8HMQFCHCJzwRj9Oym/kaV6l1JzhSpbeWBK57eD+Zf3FUi867WaxwEjMT9
 o+Sk5Zob8LQPW1F+H0of754jcyUy3vGDXQ+Ty6JULihWE+yl+6gl+lv6zt29cz4Hu7Et
 JrAxAxwNRBVDGB3C8NdAFV1mdaJKjtpglrhxK+VNfFMpyu0B5Nde3I2p0+gZfQ61phVY
 3MExVqZ6p+vzsAxnjqtf6mO3KvdjNXn9zcNWhNEGIbRR/bz0CuLh6RbLiSeiPEjToqTx
 Zo5w==
X-Gm-Message-State: AFuF++m2glxZBKNoT+uF3KcKr2N4CTV14E2aqYY4EXSRHuZ7TUUpIIHF
 reWfKHAMn6TtqcDw94tGkPKR98k11MxvlzjWnShiLrnQ7WdQq0SUB6UeluCTZjIn
X-Gm-Gg: AYBFou3EJ/IFfu9eo+ckc80csucCpFVUt6k+glzEwmuMO4AI5dUse9VLMHoW9rBdUnl
 B8MVEmKNW+59jFhXbs8w3Xog4ybLyyoOjC6E63yJ4hP6dM3ojpoGp+v+DcZBo+n8nMLIwzJe9AJ
 DIFoJlfCVri5x4c71CB/dCkAgH20CZwOJr9CSx+v17HDDewzr9xK5UI+pBnfbCxf5KfEmGdZVki
 XmoLluZhGFvVsJqu68yGwNmm4T5GuKvzvI6OHEWi9fFTtOzkXpoyzYvavmktprrQ3AkHRrl16qT
 NsxPJe6gkaj7+WdIRrUekazqeE5lLYVU35+l5OwST4rKMldIRuD9SUh1vHOf7hHuXs1UCE/Qx1a
 +6gR4j330VfXk1wUkcf5qNhNp36NXAMQcT1AN+7Fk0NQV6k2Q5K9YlaisuwQCZOejtKxWfr/jAc
 rdbdL46EI1VG6sclSNdR5F+CjVxHcL0Ae/iCFAhY+tJITsgC8cv4qPmveVVTT1Qg+WbqTazGRxO
 Iz9JOGUqwKZ
X-Received: by 2002:a05:600c:4ed1:b0:4a0:8b1:f5c with SMTP id
 5b1f17b1804b1-4a01503c330mr16061105e9.22.1790738876784; 
 Tue, 29 Sep 2026 20:27:56 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01771beb7sm19839375e9.13.2026.09.29.20.27.56
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2026 20:27:56 -0700 (PDT)
Message-ID: <6abc81bc.f5ac67e6.db28d.0f8c@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 30 Sep 2026 03:27:56 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-09-29
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Autobuild statistics for 2026-09-29
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  1  |  3  |  0  |  4  |
  2026.05.x  |  0  |  3  |  0  |  3  |
  2026.08.x  |  1  |  3  |  0  |  4  |
    master   | 20  | 39  |  0  | 59  |

Classification of failures by reason for master
-----------------------------------------------

               tcf-agent-1.8.0 | 4 
                       unknown | 3 
             alsa-lib-1.2.16.1 | 2 
                   atop-2.13.0 | 2 
                    attr-2.6.0 | 2 
                 libclc-23.1.2 | 2 
        ltp-testsuite-20260529 | 2 
                   bird-2.15.1 | 1 
              cryptsetup-2.8.8 | 1 
             dahdi-linux-3.3.0 | 1 
        edk2-edk2-stable202602 | 1 
hare-dbus-e9a89f8bc5ce783fa... | 1 
            host-go-src-1.27.0 | 1 
host-google-breakpad-f49c2f... | 1 
          host-xfsprogs-6.19.0 | 1 
                  hwloc-2.12.2 | 1 
 ibm-sw-tpm2-rev183-2026-08-26 | 1 
                 lcdproc-0.5.9 | 1 
               libepoxy-1.5.10 | 1 
                 libv4l-1.32.0 | 1 
           libzenoh-pico-1.2.1 | 1 
                 libzlib-1.3.2 | 1 
                  mender-3.5.3 | 1 
               openblas-0.3.34 | 1 
                  prboom-2.5.0 | 1 
python-remi-2022.7.27-37-g1... | 1 
        s6-linux-utils-2.6.2.1 | 1 
                 systemd-258.7 | 1 
          usb_modeswitch-2.6.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/5de362eb1d1fce54e3410507fcdfc900170d7eda |     
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/d1ca937606dba3d1645717b5e242f94538563e61 |     
    i686     |          atop-2.13.0           | NOK | https://autobuild.buildroot.org/results/914c1d8fa0fc8bbef64e4a64d58e5941d0077a3e |     
    i686     |          atop-2.13.0           | NOK | https://autobuild.buildroot.org/results/133619fe017c25222ad74cfbd93b1d37e741f6d4 |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/bdf9ba1c5dff06f9eb9f5bd55b42db13b9d90927 |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/900a1aac67aceac505205a4122203d823b68fe3a |     
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/395c4fb0822534a15607ad49f34daf0243fb2c47 |     
    i686     |        cryptsetup-2.8.8        | NOK | https://autobuild.buildroot.org/results/98a0149cd80b2ee6546786d1efab933581db14ff |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/8f5e75e20c52aa600054b471ed449892762c439a | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/0e7544a4d4f89bbedcc08e3c29697cbdbbbf5c44 |     
  riscv64    | hare-dbus-e9a89f8bc5ce783fa... | NOK | https://autobuild.buildroot.org/results/2d0299e32f6f0660187a1b62ac507263fe21b343 |     
    i686     |       host-go-src-1.27.0       | NOK | https://autobuild.buildroot.org/results/fedba68810bd241363956090e2e440b01b42bae2 |     
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/cf08d4ed481f96d834cba904ea885a414c3bcadd |     
  mips64el   |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/9b6517e0d6ddc28994b9d76fb3dafb601d9017e1 | ORPH
   x86_64    |          hwloc-2.12.2          | NOK | https://autobuild.buildroot.org/results/2c1ce4039ae28fff7181c513063438494c4f19b4 |     
powerpc64le  | ibm-sw-tpm2-rev183-2026-08-26  | NOK | https://autobuild.buildroot.org/results/ea89b7a2c1783bb7c01b65ef9741aa8dc5c0af73 |     
   x86_64    |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/c68acf9ab6c142011759d41b60eeb8a1824679b4 | ORPH
    arm      |         libclc-23.1.2          | NOK | https://autobuild.buildroot.org/results/271ff66f0b771acc8c2195b13e3a574c1b1f19e5 |     
    i686     |         libclc-23.1.2          | NOK | https://autobuild.buildroot.org/results/15f120bd206e4feb67db494bb2a5f3a6e0fe4a80 |     
    i686     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/c3c43c9b20ab16fbb1274e4e28d35511f4d196c3 |     
    i686     |         libv4l-1.32.0          | NOK | https://autobuild.buildroot.org/results/a9fe8c58fae48c59e4241532e2d44097ca963eff |     
    i686     |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/57217c89944333a3d43e95d0f5741e46d1aa5902 |     
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/6152f545853e44c6035325683289d5decd0bca2c | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/099239dd95bc386e72092b0e63455ce7aa04ac6f |     
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/40a4e5274ab8e97d8eb3b2538fd9218105786f32 |     
  aarch64    |          mender-3.5.3          | NOK | https://autobuild.buildroot.org/results/d4ee04be06d06de2804b14a91df34f767daa9c79 |     
  riscv64    |        openblas-0.3.34         | NOK | https://autobuild.buildroot.org/results/4b8581d955ed8a680aba695457b286ff780f52d5 |     
powerpc64le  |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/1a6da22c22faa9aeac4abc42749264ea26cfee95 | ORPH
    i686     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/f6405093651db5a1838b1f68e1798604f4c31111 |     
  aarch64    |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/43d0857b5ea81cab05afce86d9d77a58e797bc76 |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/1010e0508e35627cf1b590b27c952d446d78dbe8 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/ca5dd83fd2c44ab99d74477d127b08f8ae566990 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/72649f7796b46c170e14da0e8606a68afeca72d8 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/9696587868a8acedfccb89018520c4939077e914 |     
    i586     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/e853bdbb7be9ccbad754acbd705a3ebfb47e3a37 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/4dcd32b7a39744a57c02ac75ab77a553f55c3460 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/a729640475a6c42f64aaeb2cfc7f9083de57614d |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/9336f3b933fc7e949474062e8cd70e2a8fd23bab |     
powerpc64le  |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/d2761507fcbd3983be0ed43a5f1265e84c4c99b2 | ORPH


Classification of failures by reason for 2026.08.x
--------------------------------------------------

             bubblewrap-0.12.0 | 1 
              host-rust-1.97.1 | 1 
               tcf-agent-1.8.0 | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       bubblewrap-0.12.0        | NOK | https://autobuild.buildroot.org/results/e618d81e930b97d47abef03852ee42b4a6f678be |     
   x86_64    |        host-rust-1.97.1        | NOK | https://autobuild.buildroot.org/results/e61594fd1bb85650a199105cec2a7ab8a4c0d386 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/4ad8b5f4be5772881835fef3d1f6b6cb8b7d1418 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

             dahdi-linux-3.3.0 | 1 
            igd2-for-linux-2.2 | 1 
                openntpd-6.8p1 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/16f7c46179ed98e35c304ce143225e9b818d7d54 | ORPH
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/b24fd11f8b5e110b32b359fab117f37edc4a3bbd |     
    i686     |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/d094dd7837269c55e000fb61c967ef01f5854dc0 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

        ltp-testsuite-20250130 | 1 
            lttng-tools-2.13.8 | 1 
                systemd-256.17 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/dc8aacd32da4ac52dc59e70817322d608b52ad8f |     
    i686     |       lttng-tools-2.13.8       | NOK | https://autobuild.buildroot.org/results/ed0bf0c3ae289edf800156161452c5858436f80f |     
    i686     |         systemd-256.17         | NOK | https://autobuild.buildroot.org/results/ca13bf6e9d9e5d693ff15dd0d48d53170eecc792 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
