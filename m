Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC03A606A31E
	for <buildroot@archiver.kernel.org>; Wed, 25 Nov 2026 04:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ebE24qbM;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JeKHyNcQ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9074680D15;
	Wed, 25 Nov 2026 04:24:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ikXBDvEvl3Jr; Wed, 25 Nov 2026 04:24:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 51CD080CA4
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795580691;
	b=YDXRY9SzZh8GnPN+S9eZ3vUzpnZ0YYQnPF7YaGhBlmDMUqSLm9Emqr0BXq6jCg4CE3vM
	 USap53RSjHPf81l0dssyIU9LSWvDLbkfDf7O+fwAjtaOeg1n154vamCyCiEEM6imqXWT7
	 d1ZU+QKYNABE9WA9Tm5FDkZPn9ZH/LMhhltrBa913MwYsIXPpFRG8R9qPquq3bLJYEhgX
	 8bhwxqjHIyX2Bi39/ai9KrsBq335kAYtFVeVGZZB4egu2Cjn1Y3lvT6VROk9INJfaSoJf
	 1ijeNxqfseGxnCkkVPNo/PAMEVn8Ldrrvd8BofYKM15vr0IsZa5yMl+6CeR68nUxqBQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795580691;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=fHig77bo0CMnT41xU0mcCA04zOqmgDYnkuWeQPBnGLM=;
	b=l+UqAobeXO0g3Nf/LJnPDCIKKSKIM5mylix2tXz1jIwTmOtljDiKXLp333M5phArDD9g
	 5KKAnaRZLg4609eSOc78/PiBkomauxKp3S4GAIe0bKrQKf2R8o8AdYaRIFGlqOq6oe0ZL
	 aOPKWGpNdY3wuLSOQO5l/QlRn+AON0jVln+aMqzCcLSLwtMMk0kkQByEqlv+m3FGOZxzW
	 qiuxim1ryj0ZXsXYv7HYifpFXpzKy+loJo0YdZeuaRLTxbiLFhVXVljrLAtxyQQ5Wqx1l
	 q0EXsET5ukOeMv3Qr3l7X5kBpsA6csFJwgY/KlpgEfDHlEkPgfKbYANZaP8WE2QULaQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795580691;
	bh=fHig77bo0CMnT41xU0mcCA04zOqmgDYnkuWeQPBnGLM=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ebE24qbM3I+iPkVeRHZVlF+glfx8Zlu7qspfKlna3mI47B6fkEP/m+OXt45+UaQy1
	 fQ3R3jnqyR2KV+Wl7npRJcw5F56oPsVTDdjVjMmUNrNaQedtp0P2Iro2GOnZVWNUX0
	 UzjCu+L9ttXS2JqdlazHILYK6JxUXNg3so+ud/DM9PjFgD8/7a+yL2qMe63bcoY6FY
	 waaLpWprTUN5FuR6hK/UuAlXUNXfeptyCbYgYEou1FThNYQe3hayIs6duTG9kfffH3
	 dORSyikKkITi8VrGVJh4qCBAZbotyE16fXixU7cbnfZgn6r3C4UWkgWRwEVKau1dDM
	 1aOVoMA++LzJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51CD080CA4;
	Wed, 25 Nov 2026 04:24:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 27BB210B
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 04:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E1A660876
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 04:24:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 00K6VvETvz8g for <buildroot@buildroot.org>;
 Wed, 25 Nov 2026 04:24:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6D291605E1
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=JeKHyNcQ
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6D291605E1
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 04:24:47 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4a5177d78c7so51768435e9.2
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 20:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795580686; x=1796185486; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=hJPPchzOdVO0KImyUepb8RPozmke+hOxeErmfTUJRis=;
 b=JeKHyNcQeT436umzShrryeqNgEy9kxcfhXWyL9ungR1hBDQfTNBKhoFL07V55Treh2
 +X2SmO/w7cr4B8aFNQjUAWZIjkoCdSTuulKvAWD9wbBVjZwlbDXcJuqG5xxHO1dSWhLw
 64KmNNTBddI96kabi0ru2rKDMkgatb+CjEJ8Zcah27v+mEXs8usPvvF9vEqEaYAr6sh7
 nPO+PWCttJL6AfhavdSjhg82ZcQMNSXEGawvNvqgfdMTQcTgQUBKJN1Dlb3Rzz233ukJ
 yrd9olam/NZeg4CqdEHYYbFPHox4GsajiN7/V5jPNBnUVf0grwaC50JbismJCtawsFHy
 sS6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795580686; x=1796185486;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=hJPPchzOdVO0KImyUepb8RPozmke+hOxeErmfTUJRis=;
 b=1FESi36YYqurPphgpFQRrYJYRWPS4HkHkJn5sQDCyyfNc8ZxAcnPufN43HK7LooJe6
 OBREfrqfy36m+5E5RoLpdxoJq93z7GArQPdD0mS3i9CwUy45GNExK2Cj1JGWfj6jgOqV
 hmRaDnAZTmrJoid//jsZ+MszN5c474JDXp8Zw7KlmmC5KROyhYNLLygZXTgUS+8AZRAq
 S8kT6OJSniIQef7OYe5t02mnXLzXMdOhGmWGq+RK9w8eQdPBX0By4tsyVLSFfCGMgSF5
 cx4DPvVH1v37QQZZi6gT6/jB988Vb+CxjjOPOmkZcYR+mg1AgGf6k4jTKTeAS1V9Yvu6
 SlOw==
X-Gm-Message-State: APuU4Z/9CK6QjqI+0Nj7221bheOEBumtiGSj90ZHRCH2A/jUGVwF98cn
 LfDM5bfAXYbagBfggnT6/1rNgimwLQqFJ4SyaAFCK0Z6SkLshbu+jK8h9PlMZCIB
X-Gm-Gg: AZFdTZfQygOxLcmiMm86v6i1oZA1eLUoJWuCHkmV0uhCRd3EPsTfAwFzgXQ779C3dln
 QSfctJO4oILyvgMjVyJnsIHRGnDboEtm/8NCFz6V+PlvjRjBalX22Ig9fggi9P6HX63NAmi1l6e
 aNvmowhbpwZ9TB/wwiicRE/p+2Q5E+P4hmkP8pclJbXUiXeMkU42+lBfKh7PqnT5+PZGqD07cjk
 UrzlGaIa8bHT+CwpyshpPeihwhJh5ad/zx0tjILoSYU9yXZxVtbuR2o11RvmHcrGrF/DPa5bjqq
 MR67xoKZ8CkyzRX56M07YVjg5jm9+y6p33yo1m7Kiuz4ZJRv0ew8WHen6EyJzcLVINfswK5NP0B
 28JNRXprfiVUIdVW5OStaG1j/zRlWN05hBchGCSsGX/XCERROxqyqdJFiizBOOrdjBnLnGgBSW8
 LiRBl+4glDVjKIt708T43i6UJHmOzOOvj7kSAOmFo9r1gAsThPAHONfNoNiMIsZ8afMLNFrL7Pi
 xjmXLx/mc0N8ttSG74zdxUBlTKGlHA2vFeaC701XdOM6mCkURG49CZDkXpstoSgxhPw5RsYnqZ/
 +hRbl7lyMChhIBFHtAe1CaVOue94MDLm
X-Received: by 2002:a05:600c:4e16:b0:4bb:6f77:1e35 with SMTP id
 5b1f17b1804b1-4bb88810991mr357722375e9.21.1795580685902; 
 Tue, 24 Nov 2026 20:24:45 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6b205443sm33442843f8f.39.2026.11.24.20.24.45
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2026 20:24:45 -0800 (PST)
Message-ID: <6b06630d.013ab60d.10f7be.cb8a@mx.google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 25 Nov 2026 04:24:45 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-11-24
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

Autobuild statistics for 2026-11-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 11  |  8  |  0  | 19  |
  2026.08.x  |  5  |  4  |  0  |  9  |
    master   | 20  | 46  |  0  | 66  |
     next    |  2  |  1  |  0  |  3  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 6 
                  chawan-0.5.1 | 2 
                 glibmm-2.76.0 | 2 
             host-libbpf-1.6.2 | 2 
kvmtool-7ad32e5514aca2b6d19... | 2 
                libroxml-3.0.2 | 2 
               madplay-0.15.2b | 2 
                   bird-2.15.1 | 1 
                     crun-1.24 | 1 
                  eudev-3.2.15 | 1 
                  exim-4.100.1 | 1 
              fftw-quad-3.3.10 | 1 
            gdk-pixbuf-2.42.12 | 1 
glibc-2.44-77-g438677ef4985... | 1 
          host-libtasn1-4.21.0 | 1 
     host-ncurses-6.6-20251231 | 1 
libdill-32d0e8b733416208e04... | 1 
               libglib2-2.90.1 | 1 
             librdkafka-2.16.0 | 1 
               libtasn1-4.21.0 | 1 
               libunwind-1.8.3 | 1 
           libwebsockets-5.1.0 | 1 
                linux-5.10.275 | 1 
                   linux-7.3.6 | 1 
                   linux-tools | 1 
                  linuxptp-4.4 | 1 
                  lldpd-1.0.22 | 1 
                    ne10-1.2.1 | 1 
             open62541-v1.5.10 | 1 
                  pdmenu-1.3.6 | 1 
                   perl-5.42.3 | 1 
raw2rgbpnm-f28b903ca63b4c22... | 1 
ulog-0389d243352255f6182326... | 1 
                 xenomai-3.2.5 | 1 
           xtables-addons-3.24 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/d57375ac64f27c559a0d3619b3d291fa59ce0ead |     
  mips64el   |          chawan-0.5.1          | NOK | https://autobuild.buildroot.org/results/2d0823849c690c6471249c066f20b9dc8460f25b |     
    arm      |          chawan-0.5.1          | NOK | https://autobuild.buildroot.org/results/b7c9c7baa358cf40f0b7fb1277fc55ad2b479dd1 |     
   x86_64    |           crun-1.24            | NOK | https://autobuild.buildroot.org/results/c9f6796c5cb1b6cce3847d17b3a44b326af19502 |     
   x86_64    |          eudev-3.2.15          | NOK | https://autobuild.buildroot.org/results/9b0aa7ce89d11a5c4f4c349904cc8902199b2b8d |     
  aarch64    |          exim-4.100.1          | NOK | https://autobuild.buildroot.org/results/ed540d92c8375108a0f302fe6deb1cc3b4a4acf1 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/a7eb2536977e10ac8f51893c46ab7589dfaabfca | ORPH
powerpc64le  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/4307f624640d595e4dd717ac3b09098bd337af1b | ORPH
  mips64el   | glibc-2.44-77-g438677ef4985... | NOK | https://autobuild.buildroot.org/results/a57c4afd56ddd48a19965c0326f8c2a549f5623a |     
  mips64el   |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/6dc424ddedec51be9d08a10a5deeeca465a9aedd |     
powerpc64le  |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/e6d5008bd02449ae2fc8e0b7dc3b00c6ae50c667 |     
    or1k     |       host-libbpf-1.6.2        | NOK | https://autobuild.buildroot.org/results/5e51329dc41171469588712739171bf8808fb5a2 |     
    i686     |       host-libbpf-1.6.2        | NOK | https://autobuild.buildroot.org/results/2553023201fcc56790d614556a9083e263dd5835 |     
  aarch64    |      host-libtasn1-4.21.0      | NOK | https://autobuild.buildroot.org/results/67f31d360c20fb88341c1940f3a07bba23f028c3 | ORPH
  aarch64    |   host-ncurses-6.6-20251231    | NOK | https://autobuild.buildroot.org/results/8da1e9d9d5e6892545d74c8920a392d8605c73bd | ORPH
    arm      | kvmtool-7ad32e5514aca2b6d19... | NOK | https://autobuild.buildroot.org/results/c6c10d55e603831c520e7e21f4c404b095158e41 | ORPH
  aarch64    | kvmtool-7ad32e5514aca2b6d19... | NOK | https://autobuild.buildroot.org/results/6d4c05915d6785064cc28c1680d85c6343ebb22c | ORPH
    i686     | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/74188b42efa356e953c7dc41bec2f07790447fda |     
   x86_64    |        libglib2-2.90.1         | NOK | https://autobuild.buildroot.org/results/876625945464d16072f74bea40792d9e5e188afc |     
  mips64el   |       librdkafka-2.16.0        | NOK | https://autobuild.buildroot.org/results/fb71058572ec270c46ff5de542c186c73bc06ceb |     
  powerpc    |         libroxml-3.0.2         | NOK | https://autobuild.buildroot.org/results/383e7c5ba1b8a87af1d455ec5f71a15c3d0c8329 |     
    i686     |         libroxml-3.0.2         | NOK | https://autobuild.buildroot.org/results/54c4c3522ae4e337ef7818988866dff2e961027d |     
  aarch64    |        libtasn1-4.21.0         | NOK | https://autobuild.buildroot.org/results/75fd9966742d289594ec56d9f00778e1084e9ec3 | ORPH
  mips64el   |        libunwind-1.8.3         | NOK | https://autobuild.buildroot.org/results/f3feedcac12027d7610226023915e4aeee225e4c | ORPH
  aarch64    |      libwebsockets-5.1.0       | NOK | https://autobuild.buildroot.org/results/2cf0b8ebd870946a5bd76b8b611f7ef6b8147308 |     
   x86_64    |         linux-5.10.275         | NOK | https://autobuild.buildroot.org/results/a4c5aeac71764d174117fd9744dba15de20b635d | ORPH
powerpc64le  |          linux-7.3.6           | NOK | https://autobuild.buildroot.org/results/b62a6669e942931c46ad36a65557b1a489d62229 | ORPH
  mips64el   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/9045d480fa98fff58945b9552f08e84cd9a74d34 | ORPH
    arm      |          linuxptp-4.4          | NOK | https://autobuild.buildroot.org/results/ec8d888d254eb7c9573d523ea230659ee3da6288 |     
powerpc64le  |          lldpd-1.0.22          | NOK | https://autobuild.buildroot.org/results/e145fba0c95c9cd51ad43907df62b7f6a775821f | ORPH
   x86_64    |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/9fcfc88ffd24fb974e6ccbc5824c37047856da62 | ORPH
    arm      |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/995908cd468d5ede9f09a30fc6b36f87e3e48a32 | ORPH
  aarch64    |           ne10-1.2.1           | NOK | https://autobuild.buildroot.org/results/f64ae830015a519a458676e5cf634ef500280912 |     
  aarch64    |       open62541-v1.5.10        | NOK | https://autobuild.buildroot.org/results/25283100fa2d396aff7113dcaa583ae4b552ad05 | ORPH
    i686     |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/ee17e7db07b2f772fc2811c4d6986ab9ada60123 |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/bddfe4da3fb8a07fc2800d853969c75f40ef55fe |     
    or1k     | raw2rgbpnm-f28b903ca63b4c22... | NOK | https://autobuild.buildroot.org/results/d68d45d7ad9fb790c0d5b46abacce69ab43e5bb8 |     
   x86_64    | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/60397b107a5c09de5fd444babae8db538690ef33 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/a380cfc1377cc397c21c863cdaf54a5870381e55 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/22f3d2974199a0891c78aadf9dfa30ef36f0b0b9 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/8d7b5a463541da986ebe36205f1b305d4a923362 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/927521546b429e61ea9cb428695925d7fb24b2f7 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/de1e81a4807c3871794894344dab276cbbd76d8d |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/b0f3e38fc7f920d48a74214cb831f4716f1e538f |     
  mips64el   |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/1d7ecaede10885557d463ddd2e0172d49fe222fe |     
   x86_64    |      xtables-addons-3.24       | NOK | https://autobuild.buildroot.org/results/aa8bc17ccc5349f677248c074f430525c0a1c991 | ORPH


Classification of failures by reason for next
---------------------------------------------

                 glibmm-2.76.0 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/94344651289965d334cabcf5b746f7fecc484738 |     


Classification of failures by reason for 2026.08.x
--------------------------------------------------

               linux-pam-1.7.2 | 1 
      passt-2025_06_11.0293c6f | 1 
                   perl-5.42.3 | 1 
               tcf-agent-1.8.0 | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/8a74e115ee90fa4250c6d37fdf626458c08e9c5f | ORPH
 microblaze  |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/2d85e9040042442ff04a31567d01c9ad350f81a3 | ORPH
    arm      |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/2a14235775d93298c769a3517ef78561bee6f5d4 |     
powerpc64le  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/624b63f155fa61b31f5c46e9e6a1c1bc4b76823b |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

 host-softether-4.30-9700-beta | 2 
                bpftool-v7.1.0 | 1 
                freerdp-2.11.8 | 1 
host-netsurf-buildsystem-75... | 1 
              host-rust-1.82.0 | 1 
     linux-5.10.246-cip66-rt29 | 1 
        ltp-testsuite-20250130 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         bpftool-v7.1.0         | NOK | https://autobuild.buildroot.org/results/f4a61bb0c655f1b0f3bb5fa284fb482a9b802e15 |     
powerpc64le  |         freerdp-2.11.8         | NOK | https://autobuild.buildroot.org/results/66a03ef011b4761b12de3c89ccb1ab80387c530b | ORPH
   arceb     | host-netsurf-buildsystem-75... | NOK | https://autobuild.buildroot.org/results/6ad5fec54192b17c13747bcc8d90bcdca7f75dd1 | ORPH
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/0f277b2b3b3ccc6cf33a23e8c2fb5c5cbae7bab8 |     
powerpc64le  | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/00a07e442046a8d00af63bd07f78049bba55a8fc |     
  mips64el   | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/6a5ca0721675774bfee3b395540074c32339bdac |     
   x86_64    |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/cc3a3704c777dc1950e684975efbb70cd210337a | ORPH
  mips64el   |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/215a5a371ce5210ff2c1e4f49615f767677ec473 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
