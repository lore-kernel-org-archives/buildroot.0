Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C0C5D68BE2
	for <buildroot@archiver.kernel.org>; Sun, 17 Nov 2024 04:18:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8701F8447A;
	Sun, 17 Nov 2024 04:18:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NLMI71RnnNqb; Sun, 17 Nov 2024 04:18:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB38684480
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB38684480;
	Sun, 17 Nov 2024 04:18:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D9DEDB2
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 04:18:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E167400F1
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 04:18:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P0oxHJOeC86v for <buildroot@buildroot.org>;
 Sun, 17 Nov 2024 04:18:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EF4E940127
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF4E940127
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EF4E940127
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 04:18:42 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a9f1d76dab1so528677166b.0
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 20:18:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731817121; x=1732421921;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KRlQH/KvyrwUGED0VGaHr0TEcZXHP3grGyu508zin2c=;
 b=PelNCkAlkwhpSckl9CWtgpT1xcWqg7GI4raeWFgDEOzBJWHssglCLh66XPUgqtowcJ
 rA8sJ0ClBt8GxoUqvvq9lZvMgWLJ/7BfivpYytykaM7wuDoZCZohjJgtSqqfIVMhjh1Y
 FzIJj4voO3w2E7i2UCmYYdG5cnhAnCCBCOgnxrIvCIrcKpK7ERjzDpmfHCcQ6KQSryp/
 8NTazkU/Uu2DWpjgu3EUpRZdG9vqTNiUgqu9VgagHppXAIWIEngedBoMTyfRek70pY8I
 +odrou3gml066274hafaX3TbytDx4Jxk0QZD3865eHpT9xhdrgtFblrYCIAGRzJHhvxK
 RlfQ==
X-Gm-Message-State: AOJu0YyCum5qRMLECM8ZxOEjZ0HOrvErjk9aetjfR4bsHjdzEpMgrNMu
 ojC7Vwcc9KN9DsciX/b3TD8lyBu07V3kOscZUPG4t3qZJE/FRCKItd12Zg==
X-Google-Smtp-Source: AGHT+IG4w831aVmrRbWfemjka6Zrt3PbfSjYLgdmkwdQRTsJSa6pF0oL8dmIJ/WC9VEaADGZUC29ow==
X-Received: by 2002:a17:907:809:b0:a99:5021:bcf0 with SMTP id
 a640c23a62f3a-aa483454541mr625781266b.34.1731817120520; 
 Sat, 16 Nov 2024 20:18:40 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20df26c5esm373103466b.32.2024.11.16.20.18.40
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Nov 2024 20:18:40 -0800 (PST)
Message-ID: <67396ea0.170a0220.1ac934.f5e3@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 17 Nov 2024 04:18:40 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731817121; x=1732421921; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=KRlQH/KvyrwUGED0VGaHr0TEcZXHP3grGyu508zin2c=;
 b=kY+Gd1EH8x09HcduL73mQckPKTrjclI8uQAxxBpNAOdt2apT3mkMBTmYsenCHA2qeS
 ZUBZOCFvcPNE1dajZR364YW6WSDMcdrnSlCmSlfDPrACMhH+IFd4gcP3KKx50NsDu06h
 4AH8zEqQUixPOg/F3ugp5XQmT5RvUZitaBG+mn+ICyGju3wbvpGNsQVOo1b14fZBdXjK
 VW3laeKPOJh7PlPb2fmJhwXnbF5c1CFKGmx35oq2ftYpM8Ste4EFhm6uIGel+jZeHeKS
 ncJaokymdpFKbYAh3gSqt01HxKad3Ukd6ORjKeBZEJxBYJzm8K3v+mD0YKrBongSA09q
 NxIA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=kY+Gd1EH
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-11-16
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

Autobuild statistics for 2024-11-16
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.08.x  |  1  |  1  |  0  |  2  |
    master   |  7  | 58  |  0  | 65  |
     next    |  0  |  1  |  0  |  1  |

Classification of failures by reason for master
-----------------------------------------------

                  linux-6.11.7 | 5 
 ibm-sw-tpm2-rev183-2024-03-27 | 4 
                lmbench-3.0-a9 | 4 
            host-binutils-2.42 | 3 
                    brltty-6.6 | 2 
             dahdi-linux-3.3.0 | 2 
  gobject-introspection-1.76.1 | 2 
               linux-pam-1.6.1 | 2 
                       unknown | 2 
               valgrind-3.23.0 | 2 
android-tools-4.2.2+git2013... | 1 
           at-spi2-core-2.50.0 | 1 
                  bcusdk-0.0.5 | 1 
                   botan-3.5.0 | 1 
                   bullet-3.25 | 1 
                 c-icap-0.5.10 | 1 
          cups-pk-helper-0.2.7 | 1 
                   duma-2.5.21 | 1 
              fftw-quad-3.3.10 | 1 
                   foot-1.16.2 | 1 
                freerdp-2.11.7 | 1 
          host-binutils-2.43.1 | 1 
host-heimdal-f4faaeaba371ff... | 1 
jailhouse-e57d1eff6d55aeed5... | 1 
           janus-gateway-1.1.2 | 1 
           libfreeimage-3.18.0 | 1 
                  libnvme-1.11 | 1 
                 libpng-1.6.44 | 1 
                  libsepol-3.7 | 1 
              libunistring-1.3 | 1 
               libunwind-1.8.1 | 1 
           libzenoh-pico-1.0.2 | 1 
          linux-5.10.162-cip24 | 1 
            linux-fusion-9.0.3 | 1 
                   linux-tools | 1 
                  ntp-4.2.8p18 | 1 
           oath-toolkit-2.6.12 | 1 
                 openssh-9.9p1 | 1 
                   pcre2-10.43 | 1 
               procps-ng-4.0.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/309540bc5a6fcb37eea9e7fe51494c5e0520bb19 |     
microblazeel |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/1bc1f0078c4f9d778427649d9ec27ba1b93fc047 |     
powerpc64le  |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/21670a00c35ef44ae516c131e62158664228d739 |     
    mips     |          botan-3.5.0           | NOK | https://autobuild.buildroot.org/results/8ae84444d803e4ec13edf320c891c7f603065040 | ORPH
microblazeel |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/a5b5af0c6735e53b2bb3319b0794f4c731d4b22c |     
 microblaze  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/84e9ae4651b161d7b715a2147775bee9c22bd4c3 |     
microblazeel |          bullet-3.25           | NOK | https://autobuild.buildroot.org/results/46c47c8c9307a626cca19ec7a629f94946be87de |     
   armeb     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/7180756427ab059881db5ad7aec248560d9a5716 | ORPH
   s390x     |      cups-pk-helper-0.2.7      | NOK | https://autobuild.buildroot.org/results/cf14a382e2800f2edef83a2e48de208308c40053 | ORPH
  sparc64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/6dfa82f87e44a2711541d493eece7e5b798846b1 |     
   sparc     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/3b94881c15d593e2cdeddb52f6b306397b87fd57 |     
   nios2     |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/400c6a12d8c0c0141f92469bdd97f89b108f6151 | ORPH
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/be20ceed5f704de00e09ef978160f85aa9725667 | ORPH
powerpc64le  |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/e074bf46686760f6189f61640ceb12ad3851a853 |     
   nios2     |         freerdp-2.11.7         | NOK | https://autobuild.buildroot.org/results/f15f5a984c8afe2461b605519745f1916980dca0 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/8e3560adab9f1eef5c88a8044e40519e5372f050 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/202fef73fb4a799c407bf7bc761b6f768cce8851 | ORPH
   x86_64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/5d1fe30ce25e9ec77e8f0598bc032dd59e3e1c87 |     
  mips64el   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/b2ced8fa259526a297f7c83e85b55ba2516d8a6b |     
 powerpc64   |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/5655118756ec4e05c9d60e57a6cec1ebd05eb7a8 |     
   nios2     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/41e895bc705f7d34045c6d42c36b1e19de1a4598 |     
    or1k     | host-heimdal-f4faaeaba371ff... | NOK | https://autobuild.buildroot.org/results/6960bb61513a62a52978e49f1951bc6d1cba9141 | ORPH
    sh4      | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/54cc65913c7c4651d63ae0c16e7c2fb03b89acea |     
    mips     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/852d2105dda3a262ac77450c7eb7f13d71aff4e0 |     
  powerpc    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/3c038c77c5ffa0c6397e5f268f242032793419af |     
   nios2     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/8649897177105cca94e73c11a7ad0badbcdadea5 |     
   x86_64    | jailhouse-e57d1eff6d55aeed5... | NOK | https://autobuild.buildroot.org/results/91a4e26ae82658bced049d2a032ead8513cfe66b |     
    mips     |      janus-gateway-1.1.2       | NOK | https://autobuild.buildroot.org/results/ad064a968e97558884588a76aa25ec3845e69ca3 |     
   sh4eb     |      libfreeimage-3.18.0       | NOK | https://autobuild.buildroot.org/results/fdc6506fa56d8209dba601b0ac95eafff102b271 |     
   x86_64    |          libnvme-1.11          | NOK | https://autobuild.buildroot.org/results/af20f9b52b089541b0a7d2d1245892972fbe521a |     
    arm      |         libpng-1.6.44          | NOK | https://autobuild.buildroot.org/results/8fa0cac4794043d27215acc3db2d84fe6d7e7fac |     
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/65ef19523fbfb21f00144b6eb6f191d4e023e44b |     
 microblaze  |        libunistring-1.3        | NOK | https://autobuild.buildroot.org/results/1674a3427d5b90576fa54e2325dcfd9f81b801c8 |     
    mips     |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/a33f6403aec3e17f523dfa0c6579009785933c1d | ORPH
    i686     |      libzenoh-pico-1.0.2       | NOK | https://autobuild.buildroot.org/results/0deb35487efd01b5992b203b19891914ab5ca4a3 |     
    mips     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/eb20236210dabd942d98cf10c626b22a21037679 | ORPH
powerpc64le  |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/fd9c39b67e74650a4606efa74f9bf93689a95e45 | ORPH
   mipsel    |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/0cbaed9fb90aaaecedb2e675e24967e568d630a5 | ORPH
   nios2     |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/75c265c286908ceae5af99e80b151647c02c9968 | ORPH
  mips64el   |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/838682509c69075d96e07455c57e72bd34a9ea2d | ORPH
   sh4aeb    |          linux-6.11.7          | NOK | https://autobuild.buildroot.org/results/14efeb912c513458d3997ee4c40598550ca93d03 | ORPH
   armeb     |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/ef61ea654b142490181a9984a774b113ed2610d7 | ORPH
   armeb     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/51b67d90f68ca2f194b8b15b59b4ac78cf4764a1 | ORPH
    or1k     |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/540f75ae7f148eff0691e2da16a86551d833d14f | ORPH
  sparc64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/c8657d191ff9be86fd91719ce025a2fdc3fa2405 | ORPH
microblazeel |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/690d64128b42070036a1ddbd98041bbf91283838 | ORPH
 aarch64_be  |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/0dc41c6d69f5433bd732bce5115ce9764f991e57 | ORPH
    i586     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/b89c722db5bbc66f868c90019c53d519de48c6e5 | ORPH
  mips64el   |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/03160c5570c1ebac6a6b7272720d1b0deb0d7cb2 | ORPH
    m68k     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/86c4e794e1359b78bd14878e88e9fbeb50468f13 |     
microblazeel |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/a6267ba8c56f8068b037bf37ecffa0d4b209dc8d |     
  mips64el   |         openssh-9.9p1          | NOK | https://autobuild.buildroot.org/results/629be241d703b284882d9e4cea1fa9d715ba1d17 | ORPH
   mipsel    |          pcre2-10.43           | NOK | https://autobuild.buildroot.org/results/face3fea302d9b786ee80dba5d3249f4dabedd87 | ORPH
   nios2     |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/edc34024b8e373242296820f5c58f45faecfcdf1 | ORPH
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/64e93dd24149dee1eeea1673b7673893f7bc3f05 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/127975cf047da8bf29c995da94e9222f9ab3f4bf |     
  mips64el   |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/6c500b6a4f646099c64e75f03a996fa1a447b7b1 | ORPH
  powerpc    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/b65e7210e4a3436d624aa918e580546941b1eac8 | ORPH


Classification of failures by reason for 2024.08.x
--------------------------------------------------

           host-checksec-2.7.1 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |      host-checksec-2.7.1       | NOK | https://autobuild.buildroot.org/results/4d8a36dd162fd8821644bc241643005a5d15ca8c | ORPH


Classification of failures by reason for next
---------------------------------------------

 ibm-sw-tpm2-rev183-2024-03-27 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4a     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/9c79978ea560f840218eb5db22d07e15449c82bf |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
