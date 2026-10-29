Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A53606A31A
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 04:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=pgq1LvMf;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ytl/+RS0
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D90EA80F66;
	Thu, 29 Oct 2026 04:27:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vtQErFiB2tFW; Thu, 29 Oct 2026 04:27:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AAC5C80F55
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793248036;
	b=knhbs5V50HiBvRCaD13bDlwTRZRiKBPmb5itb9c1N0NJBp26rtSPmm1qkaygZyDRPMHe
	 /5xUzS8RbQ36EuOOz1x6qPyOmSGB0IUpS95+TB6jvAb/Vxu85ZICtF9Rn+7uC2O1jjwwH
	 0rVVLhwVpKej0r0g+LjzEfP6oEAWdyv1HIDzSO66f0vYjUABATH/mozWvevJb+KEffD6W
	 e6dt50XV3Me4YQvjKJjvXnb1nmI3dTvPJl2FHNxbqOpfylcYolX0CGFHfMXKJxM+bJLCA
	 n8gxwVAJig/bZcAocgvmynh4mIM+/NV1Bn/OrW6D969ZKpU9vZTlm/FdalQ44jIdFYQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793248036;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=BgfMz6bfAtQj++pD550fINqNRzW3cBzHyMY+0ZmeuUI=;
	b=q8PaAlqe0NPFcsAqpZC/bAl7qKu5KsZqEl5EsPz8dregGecKuVcD7tI7/zHyetbH2URO
	 CZ9aAWyPNVmCc8ABWE0G2Zaew/hQHca4gS1AuWoYCj2kg5YlG0fvIYZS83j96BP7SxXCF
	 nmR788KqxhUnd6cYh6mxf4hxEtuGJUoWZsvU28St5q7YlqXZldmusOtP4CEaJhWrnnRwf
	 OlDGZHAAaKckrJAc/pPEiT3PorO4ei0doybqooT/pKunvKjOA83Ax9tJ4vCRF151/08Uh
	 BsYLxJXCPMUngWIFF5ur1JYKN2Wiejsu+Mp4+8d1SoRNrkwsziH9aHF4eC152BOKA3Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793248036;
	bh=BgfMz6bfAtQj++pD550fINqNRzW3cBzHyMY+0ZmeuUI=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pgq1LvMfw3MbiB4whqvudad/t4s5crGLO4nJZ64TYcmjHZq0ps8PuIWDbF8/94AXB
	 fSXhuSlt1QqzQkSoEnYW4+NdtOJSRpaA8hHut4GFGlqQsJUxsyahaPvaOknwdiGeb9
	 G9eRmkbgqJPgaSfw7L4cuWuH0jJKPcb0kNZqu4DwnB6dHHM0I7AVR1FJ6eKXq6GXpf
	 yooBjziXYSp1grPF+D7AwY3bQdHjnzYk6ouvDj31FwqLJUtn6+iuI4l+VMCwIZBFqK
	 K7oMr7Mw2+f99P7kjHmme2e0CCb9d2sfIvuk6baHYP2k1JQ86iAvrA0OTo9iO4LjCJ
	 9YCGsntWGZcKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAC5C80F55;
	Thu, 29 Oct 2026 04:27:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 77BD7235
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 04:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 68AD040310
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 04:27:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id boh78jpf2So5 for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 04:27:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org DA48540176
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::336"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793248034;
 b=C5Xm19MKSAj9pJNYr90c7dXZAqqU2HyZMrstSIi0P4r1Cf/7jH+r6tw+cXRJgPHEn+lC
 tj9D2ALhUv8Jt9buToe0mpeiYXTEKSawHIxh1C2iIEjjzHzHAOddNiWbX49RDY/RBf4k2
 WDGRYEHJ5x8rfFmFO1Vd5svl04KuuUuZWncWhqLbItFrLT4qeV2mtkY1Pn7yhoVp/hmVb
 7e0SF8p//w1iaVoT3bI8oF841kRAEwbxtNh4LKb/f9AXocAJhMmyW89o22Sqi+jaLCQpd
 PvpYz+7f2LM2j3HH/6KRmsPI0IVJlclf1gvqf1dFkqvYDYei+qK9dNMQvA+b7fBn7dA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793248034;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:From:
 Date; bh=2l93ljaCCLBeGS5qt1Sfvq9mtpPA91H2TZ7N4RY8esw=;
 b=h1yM1xRmWBjoEWRgQrVzR51m2usKim9gjfgQTJx7PIIq0qw8HdnXFIkbLZNDg/MPVDcs
 BGOv3lwCAMQQ4sO+pKALiu7jLCyWWTileDPy+Sf3/notcoX+WyyOazWU8jrq1MMVQmK3c
 lkcQnflLabDRxSSZdf4/rku/PRvQfBrm+328rPewA9UloX1HpEoQdRWjmazkg00MCmWDO
 fNwli63OgWr4d2XmQHopEJQ9xrs2TfQpxfxURpsy5SMQKPa1vLSJ162Nti1rU60iFQmLy
 E1+IWwTJFIsAItExKqSBG4Jw5YmJze4kvkI1bJx3bZYy2m0K5YaSh3Y10HLeOOCqrRw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b="Ytl/+RS0"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=Ytl/+RS0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA48540176
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 04:27:13 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4a59100fa83so14611385e9.0
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793248031; x=1793852831; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=2l93ljaCCLBeGS5qt1Sfvq9mtpPA91H2TZ7N4RY8esw=;
 b=Ytl/+RS02Y1yM2VAUlduobmx9/a5hgKpcIUtUITjd6noOhPdqVGWx88JJ+SLGX2Hoa
 1tjoGGXJz6jxNoiO6cNWvlpiMOXvIiCEiSsKmYrB210aR1RDTv164rWIzitBSfW5Je5c
 K1j3GTmAA026P4fwHa/PbHJXkszzkk4S3Qq45+rkhbVzFT4E5nSnUyr6CiRdTgtaL9Ni
 13PqJHJLw7yN3mygJ6aVvTATDENe3Fn+/qlGsEz0Gxs5TW3G3ZdSPE+dtbbpzByUeLEr
 wrvBOxwte9U1g50TjuGhlO3WJ1bIeN//HWO09OPtvYLvxNpCaK14qJqdGgOVaJxOQCbY
 z9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793248031; x=1793852831;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=2l93ljaCCLBeGS5qt1Sfvq9mtpPA91H2TZ7N4RY8esw=;
 b=1QrqSmVbvSPjadgohRZe5sJhDMGSvlpA3Y2CeQBoh/WPFuPPoxlhpFxMUnaZbRZy7f
 4MUoclqlbKyxnumm2t4y2fY3mbvvkYay3LC2QfRAR4THFtW9b2dq4FTjeGrYP9rDJ1V5
 pfXnWO/qyk0Aluih3XRScaAN9euHgrg1d24rtNpUzPX/g72nbFGGMVzgShBmQAIj6gf6
 uDSBCbHMzjo+ZsqU9QZtnlGcvqL8OB7KCgyKdAt4CoExuimA3A+zhsqeEsC82IbcxaFv
 HeACoumJWXUFT/0Uo70AM0U72SvhXnku5b4y72MT2GijoqAQJiAw+zzPcmwMNzJ30KDo
 pN+A==
X-Gm-Message-State: AFq9FYJUHFgz1QuO+h7uHFmCyW78iPVZ0KYKeCw05R0xyy3oBQKxlzvI
 MwCNxD76wj0TwGbeuTonim8CNYtCVK6higr3l1rN729OmUhscvb/takR+U4spdDg
X-Gm-Gg: AYBFou0/Xf0HtWDUHC1sFL6cYTGLIVh8WwWbxVULUZGg/WVp02O7xIRDTCgR1Csf/kK
 viMVcgrmNLCFsZxSVG72slhYmm2RDVp34zq/LTKVahRzetnIbrlzNKaUul7ed8gZv0fqitWAx6V
 HMbxcYce30l7UjI+bKopIm17zR4YCJO+sDJJKC+AUcVcArp5CrIwdYLIuCy8uEgEL5BhU83DfNS
 RLZHmwhaMgxF7WhWUgO/te4qGJcJmWkruau0LKL6XaKf4bT9DOR76YyBkiqXQokjVRTcJFyxC7O
 KI4In37QeaFoHXOftmRcNCG1ZtP/m6Bt16KvcqZtJ7FtZ/bIyvrvQY9Whek9DhLredWjCj93Mw6
 S1ZIKpinOqouMBwlHEa1W0os5CMOfr4oFNc8B6pV6j8Dks3jCEIr4cvH0mDsvpET8Tamu8Xvia6
 roz651Wo2e5+OhrtWYNIgbUjiFlpieo9/rz6NtimPJ2dPkc911upCCxo+PdhfylEHI3Vcq6Nm1Y
 LdMEx7ntPjITIK1uxeWQtnCUcLQYDwNutSrDiiesvCVyLQ+i3rNQom50H+onK/QDpSb6bt8KQBg
 rrj5L9kKx/CUt86aQxA7zNxqq7cYuHYp5bZB
X-Received: by 2002:a05:600c:348f:b0:4a1:fa27:df7c with SMTP id
 5b1f17b1804b1-4a9678c68c3mr94151665e9.34.1793248031125; 
 Wed, 28 Oct 2026 21:27:11 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4aa7fead817sm36074865e9.12.2026.10.28.21.27.10
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 21:27:10 -0700 (PDT)
Message-ID: <6ae2cb1e.ef735cbd.21420e.a28d@mx.google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 29 Oct 2026 04:27:10 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-10-28
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

Autobuild statistics for 2026-10-28
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  9  | 14  |  0  | 23  |
  2026.05.x  |  0  |  5  |  0  |  5  |
  2026.08.x  |  2  |  2  |  0  |  4  |
    master   | 33  | 37  |  0  | 70  |

Classification of failures by reason for master
-----------------------------------------------

              esp-hosted-1.0.6 | 3 
              host-rust-1.99.1 | 3 
                   perl-5.42.3 | 2 
                 rtl_433-25.12 | 2 
                   bird-2.15.1 | 1 
                  chawan-0.5.1 | 1 
        edk2-edk2-stable202608 | 1 
host-am335x-pru-package-5f3... | 1 
    host-mender-artifact-4.4.2 | 1 
host-python-charset-normali... | 1 
          host-xfsprogs-6.19.0 | 1 
             librdkafka-2.16.0 | 1 
               libvorbis-1.3.7 | 1 
               linux-pam-1.7.2 | 1 
                   linux-tools | 1 
                  lldpd-1.0.22 | 1 
               madplay-0.15.2b | 1 
                  mender-3.5.3 | 1 
                    mraa-2.2.0 | 1 
                  pdmenu-1.3.6 | 1 
               python3-3.14.10 | 1 
raw2rgbpnm-f28b903ca63b4c22... | 1 
rtmpdump-6f6bb1353fc84f4cc3... | 1 
        s6-linux-utils-2.6.2.1 | 1 
         s6-networking-2.7.0.4 | 1 
               tcf-agent-1.8.0 | 1 
uclibc-ng-test-132c6134d691... | 1 
                       unknown | 1 
          usb_modeswitch-2.6.2 | 1 
               valgrind-3.27.1 | 1 
                  xxhash-0.8.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/faead7603e1d56278c54a458cef1a7060111e83a |     
    arm      |          chawan-0.5.1          | NOK | https://autobuild.buildroot.org/results/5b04fd2b6e0037cbbf63d81e652f17d8b2f1ac1a |     
    i686     |     edk2-edk2-stable202608     | NOK | https://autobuild.buildroot.org/results/93638d96a458c4e85076762542f5b64d5ce4bd8b |     
  riscv64    |        esp-hosted-1.0.6        | NOK | https://autobuild.buildroot.org/results/9670d8ae6c8a443d92d74a3230fbad1e21abf4ac |     
powerpc64le  |        esp-hosted-1.0.6        | NOK | https://autobuild.buildroot.org/results/4bdf11bbae72d4501301520a0f57591bcb7091f2 |     
    arm      |        esp-hosted-1.0.6        | NOK | https://autobuild.buildroot.org/results/73dfe379673a3ac506ab96ee7bacc9172a3aa66a |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/3d81a93487a6139b9f42d481164a9736f569fa51 |     
  mips64el   |   host-mender-artifact-4.4.2   | NOK | https://autobuild.buildroot.org/results/ac955c67490ce8d58f0b373aecec85068b4e3b07 |     
   x86_64    | host-python-charset-normali... | NOK | https://autobuild.buildroot.org/results/d4793ce4ade5e6254a3535bc4583b795e542fa0e |     
   x86_64    |        host-rust-1.99.1        | NOK | https://autobuild.buildroot.org/results/c45150e56f5ba7fcc346bbc10dbd0a1350fb17b4 |     
   x86_64    |        host-rust-1.99.1        | NOK | https://autobuild.buildroot.org/results/5351175990a6d072209b6346bc2a1af432f85c67 |     
   x86_64    |        host-rust-1.99.1        | NOK | https://autobuild.buildroot.org/results/d53b2bc7c0fe8908b2fa42884b81a2626073b53a |     
powerpc64le  |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/885ad11368e416baf2d63b85c706c95e161cd782 | ORPH
    arm      |       librdkafka-2.16.0        | NOK | https://autobuild.buildroot.org/results/996859c3ab9e5f66cefb6030925c483f652c9cad |     
  aarch64    |        libvorbis-1.3.7         | NOK | https://autobuild.buildroot.org/results/1b129ffba19dd2c0d84a5cb9238e894f1c10fea7 |     
  mips64el   |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/049f4199d5a1ec4ad1d108cc3162ecb8785cd0eb | ORPH
  mips64el   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/0f911aaaf30f8f4aeec935f14908af6a6b9f8d7d | ORPH
    m68k     |          lldpd-1.0.22          | NOK | https://autobuild.buildroot.org/results/6e77aa757cd0571c88bb4d87fbe1f7d1ee596988 | ORPH
powerpc64le  |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/918210517bb3de52dfe3ab0fed5647b81c3ae91e | ORPH
  aarch64    |          mender-3.5.3          | NOK | https://autobuild.buildroot.org/results/01eefdca2c295d14fd0852d2dd4386e7254aa5f3 |     
  aarch64    |           mraa-2.2.0           | NOK | https://autobuild.buildroot.org/results/7fcad13102a974ff4a325d42d824bdaedef56845 |     
  sparc64    |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/c41b5f74067c44b4a48f7c6231c66ba25e377fa3 |     
  mips64el   |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/93d94534f687f2a359d363d91252bcc86aba611b |     
  aarch64    |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/c344b05a26cd091c3cfc65f7330eb0619a7122bf |     
   x86_64    |        python3-3.14.10         | NOK | https://autobuild.buildroot.org/results/ca64f93e85191779d0ef4daf44f1519ad75be6db |     
    arm      | raw2rgbpnm-f28b903ca63b4c22... | NOK | https://autobuild.buildroot.org/results/2e158547d0dff265bdd4e4063d572b43a9d30b68 |     
    i686     |         rtl_433-25.12          | NOK | https://autobuild.buildroot.org/results/315e8bf9dcd7ae0fc19e0283a1412862de0778b6 |     
    arm      |         rtl_433-25.12          | NOK | https://autobuild.buildroot.org/results/80cc49ceab2ec8ad046911237e9bea83335f0e50 |     
  aarch64    | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/6a7e36b3950013931ae9904362fb0435d99adcb0 |     
  aarch64    |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/7addb258537705debbe555c49633f6238bf589e1 |     
   armeb     |     s6-networking-2.7.0.4      | NOK | https://autobuild.buildroot.org/results/5026ce3ea03120e6080c43d08d1fb1f2dd2569fb |     
powerpc64le  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/517fe7a0a77932fb864997385c3c177faaa0466b |     
powerpc64le  | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/c560ac27639250da4e50da8e148c0c040fc0f77f |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/d209a72d062b9f1514eb6306bce2f68725d74d90 |     
  aarch64    |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/31bd2edc5643c7fcc073aeac993651f6b7ab8c99 | ORPH
  mips64el   |        valgrind-3.27.1         | NOK | https://autobuild.buildroot.org/results/a7b1ddaf9887613edd6f137679961175d46bb256 | ORPH
    i686     |          xxhash-0.8.4          | NOK | https://autobuild.buildroot.org/results/34b8bb323a0f7ac424c366b16ba01b9131cf440d | ORPH


Classification of failures by reason for 2026.08.x
--------------------------------------------------

                   dante-1.4.4 | 1 
      libabseil-cpp-20260107.1 | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/56bda829c8ed1f78483c29fa425c15cc8ef65ad0 | ORPH
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/ce00c347abef5b77a48a87d6dfe21f0914912b58 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

              fluent-bit-4.2.0 | 1 
            jpeg-turbo-3.1.4.1 | 1 
               linux-pam-1.7.2 | 1 
        ltp-testsuite-20260130 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |        fluent-bit-4.2.0        | NOK | https://autobuild.buildroot.org/results/58d6309a08096db6cc2289e19dec9f56ceb9c28a |     
    i686     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/d621ba0e95dc745fd71a95828ca1128ea8f64698 |     
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/5fc8b5cd159183db13f9216e24be1f3ca024fc6f | ORPH
    i686     |     ltp-testsuite-20260130     | NOK | https://autobuild.buildroot.org/results/09f47bdc6130aa12b5123c3b90217a8582fed522 |     
    i686     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/8e536d947b1747f952cc6f76aa4ef2db209323cb |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

package/linux-headers/linux... | 3 
                memtest86-7.20 | 2 
             fluent-bit-3.2.10 | 1 
                freerdp-2.11.8 | 1 
        host-python-lxml-5.3.0 | 1 
               libepoxy-1.5.10 | 1 
               libnpupnp-4.2.2 | 1 
                libnvme-1.11.1 | 1 
python-remi-2022.7.27-37-g1... | 1 
rtl8723ds-52e593e8c889b68ba... | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       fluent-bit-3.2.10        | NOK | https://autobuild.buildroot.org/results/34993b49084ed16de4283e6d1a0e33fe5b3a7da9 |     
powerpc64le  |         freerdp-2.11.8         | NOK | https://autobuild.buildroot.org/results/d79495b11219d84587750e697e730f4e0cb30c61 | ORPH
   arceb     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/1b8a5db7a67e2dcd3b80c8719afeb0b38c1fd064 |     
 aarch64_be  |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/a5147423d8f426233dbe64883d43da21937c704a |     
    i686     |        libnpupnp-4.2.2         | NOK | https://autobuild.buildroot.org/results/6d6219456b9cbab7d535d693ac1cc751c2bcec51 |     
    i686     |         libnvme-1.11.1         | NOK | https://autobuild.buildroot.org/results/cb182ae163e82e1462ddb375710899440369bb12 |     
    i586     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/4ecd077551e4547f2b0c9f547c7495b62f08b891 |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/a9a07792ea2fa071cde8d7904d1b7b5a48976170 |     
    i686     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/f18c288cfcf94ce2224824f2de59eec0ae32daa6 |     
  riscv64    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/e542f8a5c2e1daaa54b202746de8442c458fa88c |     
    i686     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/0e308549f56637f4c599cb5731a6ed16344e3b25 |     
    i686     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/3193f8b6931664e9098ef81deab1a73ef067fd46 |     
    arm      | rtl8723ds-52e593e8c889b68ba... | NOK | https://autobuild.buildroot.org/results/eeb26763c71c76c1cffe0c0fc2a6ffeb2be3f3ed |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/4f112fd70e9dcab9c11c38b54c7530f4fefe1bce |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
