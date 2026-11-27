Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270CC606A31C
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 04:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Og4704VT;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tL3aOelh
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB7F460A68;
	Fri, 27 Nov 2026 04:30:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C4I1DZ7EI6S6; Fri, 27 Nov 2026 04:30:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A05D3608E8
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795753832;
	b=GvhmLQxWxbMtA7BriZeQq28vjC5JLnX1hqNTMxHzDwRdwjl8PC67n/Mltz4P/hAIChq2
	 kpoVSulfz58v+pUcG1O65bK3innu4vR5ZvCbFAzMnOQrwQ4nx6dlYaEjVa0HIXVXvghWd
	 9nNenwFYJiARxYZYOgBwu7kSwqs6rA/LzDNAjCosaKIKzhardz1pSMak4nLAdtBeOAKMK
	 Uth15muYxDggPeE1u+b9C2Pdo/ifdNxYOoWE++ovuAUHsS4pILwe3yASuZeAcGTIn4pF4
	 4ytaoXaqlc4hgKw+oG2gQl5ZM7ukVLbF+EdaeRluucMTV65Zt4cixOBEg6hRIoBoNMQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795753832;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=U970oyNCJIRLQBDrABFWsHgGHb+KrBlO6OTxmQ6PT40=;
	b=AaUg3+xhHt3xLW0aSq+ZzOyW0j98oic/NSy63RHiSu0k7Jf3UYDVy6F60QCfSAKKQVjH
	 WjhK90rYLtyUHqAZT9z/DapJ/3yBPBIYjZzt3k74HFzcQsAccniRIDd8sGpGG6fr7Q5J3
	 zDpjI9i9mZGthxywMXL528VZ5sZKOFyeJRdMXndi3dZD6x1T8fYjqqVaBUh32kDNt6JaO
	 21P994zvMLsUhn8ACguiViHZ+o4fxqEWUdSqrJv8IXHWWv09xztNdudMUsYcLO8quAkCh
	 TBpjWh5Petn+//UgPHhGaHKwhwLcNcmQtLcazNzUeV74jrAUcgdF7KD/IPo81c9aXkQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tL3aOelh;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795753832;
	bh=U970oyNCJIRLQBDrABFWsHgGHb+KrBlO6OTxmQ6PT40=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Og4704VTuICaKLpy3hbNTP0l8HQJeGbbmHKrrt/fal7NHBsA8CedCnnImA2IxItQq
	 1Otie81ytKZTKDenOxSYTFBipUTIebxsUyzsxoR6XRMEN0etAzXpAAjqT6QmPlLcgn
	 CLys8QQE3IT/w7VVYZw/2dGRTlqEyhEuTZgvD7LSVmf83RYHHhLQ88VCuAxVkHs0Fw
	 AtbIwuSIsue+E5HFX/fqIFZi3XFuJDFcnsmM/aI5JHG6W63yZYLKbWMxCZS3YxZXv8
	 oxeZVumrL9V6/znfy4tNuhK5u5hloxRXIO3DlE+fJs7aWERkw8G6I5VqZ6AegjhVTA
	 7IqbXw8mh2Zkg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A05D3608E8;
	Fri, 27 Nov 2026 04:30:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D5433311
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 04:30:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C6C5D60A4E
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 04:30:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LlNtA-nQt_sV for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 04:30:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2A7406064A
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::433"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=tL3aOelh
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2A7406064A
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 04:30:28 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-48e20ed3b9dso6753206f8f.2
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 20:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795753827; x=1796358627; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=cDC7MXluL2M7Fo71Cj90qcm07h7/W6jNhHwes21PKK0=;
 b=tL3aOelh8SFHtvvGzKh7RDP9qQrsyprmF4MDZdr6TyTxiS6yDKt4S9jeloTMyjFNcr
 A5ItulHVLnNokSO8NurVa4NYH2pPWDlkClHD8qAtfF4PIYcid9nJC2Z6x9eiLzXgfYpf
 PB+1ksAgRxE67SDjHIIbfi6qC3dJRYsGSZRnxakl/2k70sdKj9eQD6OsgydygapImI6H
 VdAkD4c8i/ZC0S8PJesTfv0vFBq8LEGfVMBKq40kq0wJC5i0+zxb7GjlatyABHt1+g5x
 UjRSNSMe/qbjtwEAEGUO1+qMfz44RSG7tW3R4pHU0rOqI8bqZ2709Erld0LdVv+5+uqG
 vKVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795753827; x=1796358627;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=cDC7MXluL2M7Fo71Cj90qcm07h7/W6jNhHwes21PKK0=;
 b=IZ5vB8bHAKR14/0xFtvZfvVaAf+KyVzUTmf6St/gdbDGj3iIFHWfGLAd5R2zLoL1SY
 au544nxGBdOs2R/8guFPJLKUomxZ1gLPU1swxomM/PjaONj69nky7D9RwiZFIm+kutGn
 H2muzkYvQSK8ByQ1PO2mWwKbiUuv7TnWPSvyORjhAtBJwSMBX9+bFZ7Hpbmi53DQbvq4
 BP7Xtsemui4YKhW+xrrXltlxkfxNiEeXlEEFX/O5Hfrt2hVN9SHXoksesBuxzepIuThT
 M6Qo/DAkQ/aSROhmxXRmTYx2voUyfR6ECAh1OzK+IW47ncectm5G3xjXTR7jH5R26Q4f
 M9fQ==
X-Gm-Message-State: APuU4Z/jLOdJuW2rjtcoCYWV4KtJa/W2yf16JipS+kJXECWO8drXdroi
 Hety2a++WRKnOF138ei4TwHxQlpjVwmNJFMhm763Tu+DbAZvtWKCJZt+kuE+g2zL
X-Gm-Gg: AZFdTZf5ZyS1fdTj+8WHbdxuWUHkSKqFAEhmeIuLA7PEE+Ausztia9sE47KXCaMYGl4
 1E2G1Z6sC1d409QBI02+noBFSP14KRQpMGipGeyCrOU2kJZWYlH9DiG1d8zK2EWY8TqttDhsNzd
 sIkQwbJAg3DVamE4srWpB6mllQ/e2QVJMQtfrVpqNOD7jMiYaNRcdWkikrNe7OkuXylxe0CtsBV
 ue5rLIvadhXW62R+ioMcJz09c2PoEHuRlBxynExm/2STmCHtuvjCrEGbhWFfzenceVakAhuoXYm
 5lKeRRLrCGpZ9vtSTkmQHum+JFNbECXQgvqLLZ89JsxLx8Gw/lPxkQK4B0noWI9Lhtq4KoDJm8c
 Ke+89PCWqY4XbDjlNBzYgzVdzU5uQJvMDpZuTf9aQSapYF3oJ82f4Xkq/mE4WpwHnbDnA9i1/Il
 S7BWBb4biIB5hP1fdVkF+uj7ddYLVP37z8gOY9/3NYrrWIPq7TTjXLDz8GTYpC8jbhCerCYxoQO
 AfA4D+DbL1M1qyw5RU56zTsgDXP/Iiz8XYpPgJ+o2mnqGvq0L3dRPUOleLN9R8QR+dbCWYYfrLy
 MKnGsHW0C9CP2bfCcosPxxNZ3+ts1Sl1
X-Received: by 2002:a05:6000:2c13:b0:4aa:874c:a1c7 with SMTP id
 ffacd0b85a97d-4abb86ed79amr43438751f8f.43.1795753826772; 
 Thu, 26 Nov 2026 20:30:26 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab658e2e6dsm43141208f8f.6.2026.11.26.20.30.26
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2026 20:30:26 -0800 (PST)
Message-ID: <6b090762.f995908e.243a70.c85f@mx.google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 27 Nov 2026 04:30:26 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-11-26
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

Autobuild statistics for 2026-11-26
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  3  |  3  |  0  |  6  |
  2026.08.x  |  0  |  3  |  0  |  3  |
    master   | 28  | 54  |  0  | 82  |
     next    |  1  |  3  |  0  |  4  |

Classification of failures by reason for master
-----------------------------------------------

    host-mender-artifact-4.4.2 | 4 
             host-libbpf-1.6.2 | 3 
                    attr-2.6.0 | 2 
                   bird-2.15.1 | 2 
                 host-gdb-15.2 | 2 
             libxmlsec1-1.3.13 | 2 
               linux-pam-1.7.2 | 2 
        ltp-testsuite-20260529 | 2 
                    lua-ev-1.5 | 2 
                tpm2-tss-4.1.3 | 2 
                  xxhash-0.8.4 | 2 
                      at-3.2.5 | 1 
             batman-adv-2025.4 | 1 
                 binutils-2.47 | 1 
                  botan-3.11.1 | 1 
                  chawan-0.5.1 | 1 
         cloudflared-2026.10.4 | 1 
                diffutils-3.12 | 1 
              execline-2.9.6.1 | 1 
            gdk-pixbuf-2.42.12 | 1 
                host-gzip-1.15 | 1 
jailhouse-e57d1eff6d55aeed5... | 1 
libdill-32d0e8b733416208e04... | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
               libglib2-2.90.1 | 1 
           libwebsockets-5.1.0 | 1 
                linux-5.10.275 | 1 
                   linux-7.3.6 | 1 
                   lmdb-0.9.35 | 1 
               madplay-0.15.2b | 1 
                     mtd-2.3.1 | 1 
                  ntp-4.2.8p18 | 1 
               python3-3.14.10 | 1 
raw2rgbpnm-f28b903ca63b4c22... | 1 
                 rtl_433-25.12 | 1 
                 rtptools-1.22 | 1 
             superiotool-24.05 | 1 
                 systemd-262.2 | 1 
uclibc-ng-test-132c6134d691... | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |            at-3.2.5            | NOK | https://autobuild.buildroot.org/results/b13e9474985ac64533e11ffc3fa089d1bcb0b4ee |     
powerpc64le  |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/21a7eced2fd2e160764dc6322092c7e1a4046363 |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/0a14fddc933e72eb0b4c9e6f876419f2fe086fd9 |     
    arm      |       batman-adv-2025.4        | NOK | https://autobuild.buildroot.org/results/dd4e561c091b62b0933e961c91cfd22c232e96bf |     
    arm      |         binutils-2.47          | NOK | https://autobuild.buildroot.org/results/4e7931123f75ac10e09468802648786b2bfb38cb |     
  mips64el   |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/79a5e7e3ebf72464f3cdccda416079c8db36ace3 |     
  mips64el   |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/cf2359b004f00a91188c39e8b344375053a0e149 |     
    i686     |          botan-3.11.1          | NOK | https://autobuild.buildroot.org/results/034a082ecffbc41043e65c134b260f68f939b0c5 | ORPH
powerpc64le  |          chawan-0.5.1          | NOK | https://autobuild.buildroot.org/results/67776d4b86a52656a0630c88171d3795132f3fe7 |     
    i686     |     cloudflared-2026.10.4      | NOK | https://autobuild.buildroot.org/results/30b6d7bed176f4f34cbc055ba145b8380ee69c3f |     
loongarch64  |         diffutils-3.12         | NOK | https://autobuild.buildroot.org/results/a6f2f6acbaf666f35b6c938ca40e9c163575d171 | ORPH
powerpc64le  |        execline-2.9.6.1        | NOK | https://autobuild.buildroot.org/results/cbb6c2d8b743b1c1f47771b25bcc60642fbcf712 |     
  aarch64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/6dc9e07e99393634caffd554e5c4b19ff3afe23b | ORPH
  mips64el   |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/820a22e567fefc42dfc1b95103bdc039638a055a | ORPH
  mips64el   |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/d76ce18e8dc1b650e071136fe75f3de86cf20eef | ORPH
   x86_64    |         host-gzip-1.15         | NOK | https://autobuild.buildroot.org/results/7214781bbe29151530c59db03665c298f37daeeb | ORPH
powerpc64le  |       host-libbpf-1.6.2        | NOK | https://autobuild.buildroot.org/results/ca4275b1bc9bd01e81e9a32263c286ba89314c37 |     
  aarch64    |       host-libbpf-1.6.2        | NOK | https://autobuild.buildroot.org/results/146cce6f8547acda663293ca8057691b862880e4 |     
  mips64el   |       host-libbpf-1.6.2        | NOK | https://autobuild.buildroot.org/results/2c71709f60c6d103d4f01ca64fd194dfe53959e0 |     
  mips64el   |   host-mender-artifact-4.4.2   | NOK | https://autobuild.buildroot.org/results/b6023be91b060f03f17d2663c21f43936fea0845 |     
  aarch64    |   host-mender-artifact-4.4.2   | NOK | https://autobuild.buildroot.org/results/3b26aa33701ee581520443abb103c11371cf21a8 |     
   x86_64    |   host-mender-artifact-4.4.2   | NOK | https://autobuild.buildroot.org/results/b1ccf85a3301e3e23bd1ecd42f85b25e09984bf2 |     
  mips64el   |   host-mender-artifact-4.4.2   | NOK | https://autobuild.buildroot.org/results/864bce85084a9ccaec159b8a155b7ffff630260f |     
  aarch64    | jailhouse-e57d1eff6d55aeed5... | NOK | https://autobuild.buildroot.org/results/d5db91b05921760127d59196e9314419a997984e |     
    i686     | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/612c96c94caae831c4dcfea7d511766a256596e8 |     
    arm      | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/6fbe85f95cba456e53a182901dd7f3b2603078a6 | ORPH
   x86_64    |        libglib2-2.90.1         | NOK | https://autobuild.buildroot.org/results/e4cf2e613ece9e52b407881eef9ca5e431433859 |     
  mips64el   |      libwebsockets-5.1.0       | NOK | https://autobuild.buildroot.org/results/47b8e0d9a0392bf58752f9b55a60a7c988da5fd6 |     
  mips64el   |       libxmlsec1-1.3.13        | NOK | https://autobuild.buildroot.org/results/7ea93ce84f85e0f5ed2392b4d02c0d1db9cd21fc |     
   x86_64    |       libxmlsec1-1.3.13        | NOK | https://autobuild.buildroot.org/results/166b3e61c8fb7df4f275a772884135a309306905 |     
    sh4a     |         linux-5.10.275         | NOK | https://autobuild.buildroot.org/results/b3e9243760a65218c74dd70005eccaa5ac9d137f | ORPH
   x86_64    |          linux-7.3.6           | NOK | https://autobuild.buildroot.org/results/60f9bfbe124a66362c00208da5659c5c3e7e6686 | ORPH
    arm      |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/c75b66f200603c2881df53db85000832a1e28c50 | ORPH
  aarch64    |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/fa5dd6bd5ba3d91308a25d9230dd64b08729309a | ORPH
  mips64el   |          lmdb-0.9.35           | NOK | https://autobuild.buildroot.org/results/18806f2fb84c4988a0a5193be812ef5891637e44 | ORPH
   x86_64    |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/919a02e234304a226ae1d1d030c015daed4cc8bc |     
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/be1e80f1fe6e35e9c6e2d8541914dd4714856c80 |     
  aarch64    |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/c1bec5948cc42b5368d095dee5a4ed6a133647ce |     
  aarch64    |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/5129706bbd88e018173234fa533aa751b4905826 |     
  mips64el   |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/98c8955b4feef62ec99fb6fe5a2ab3dbbf39e083 | ORPH
  mips64el   |           mtd-2.3.1            | NOK | https://autobuild.buildroot.org/results/f88b2b560b9a19b0f369dcd5fba034814dd79bde |     
  aarch64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/e154829520a412b414df200f1ba19adaa9e17869 |     
   x86_64    |        python3-3.14.10         | NOK | https://autobuild.buildroot.org/results/1d8fec609bb7a6b60404df97b5e9e65ad696efc1 |     
    arm      | raw2rgbpnm-f28b903ca63b4c22... | NOK | https://autobuild.buildroot.org/results/397173a01ed6107a7d883643e1ba735b0db27eb9 |     
   x86_64    |         rtl_433-25.12          | NOK | https://autobuild.buildroot.org/results/274f7002b5bd52c4fff52613433d970335509ab3 |     
   x86_64    |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/7d6c65a759fad779cf1e7739e47e5238fcc22b30 | ORPH
    i686     |       superiotool-24.05        | NOK | https://autobuild.buildroot.org/results/f137b41999ee71784d942f54ceefa66b8f23cc0c |     
  aarch64    |         systemd-262.2          | NOK | https://autobuild.buildroot.org/results/2e11845fd0e1981354f31a9178ed5659f42afb31 |     
powerpc64le  |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/367bfc6aab25524d715108a6c81418c68a96fd7f | ORPH
   x86_64    |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/2594a7cf849fa495eb218c70021d0ad3475c92f7 | ORPH
loongarch64  | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/47c525a7245e3724a0e902f6aea225e117835b86 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/798b529dc2ef7c32326bc69320c22755745347eb |     
loongarch64  |          xxhash-0.8.4          | NOK | https://autobuild.buildroot.org/results/b080f3a67dd59e2a4980d8e878f751bc874b0d5b | ORPH
  aarch64    |          xxhash-0.8.4          | NOK | https://autobuild.buildroot.org/results/891bdacdbfa3f10332300075c57a1a8b9e7e5f51 | ORPH


Classification of failures by reason for next
---------------------------------------------

                       unknown | 2 
           oath-toolkit-2.6.14 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/3a459f22fa49681bd27b34236e69f9e96fa222a2 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/e7fb40f6e1498e159578f347fcc34763fa9aab45 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/9fb2cb1f6404761c923948ddac52c5454fccdb6f |     


Classification of failures by reason for 2026.08.x
--------------------------------------------------

                  dpdk-25.11.4 | 1 
             parsec-tool-0.7.0 | 1 
           sane-backends-1.4.0 | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |          dpdk-25.11.4          | NOK | https://autobuild.buildroot.org/results/63e74bf132c1d2e95c9885ccad0948927fd5e7b5 |     
powerpc64le  |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/3ae91067de06d3078e8ae2f4300e0d4c306627e3 |     
    arm      |      sane-backends-1.4.0       | NOK | https://autobuild.buildroot.org/results/05a02e17ccf341599f6b84bf96e5dad1e4fcbb72 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                cifs-utils-7.4 | 1 
ulog-0389d243352255f6182326... | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |         cifs-utils-7.4         | NOK | https://autobuild.buildroot.org/results/4f6b6c4a36da7a1864f35163062dff5f2f5d0870 |     
powerpc64le  | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/f0980a97fe9c980d29893157471153ace2f12435 |     
    arm      |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/93477aadc3cbfea90f16d1590aa26201a5f20127 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
