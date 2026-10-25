Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927D4606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 04:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=p4MM8GLh;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mtg4QIw9
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D0CA40676;
	Sun, 25 Oct 2026 04:33:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UGItPqAXyRxY; Sun, 25 Oct 2026 04:33:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5819A4066C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792902786;
	b=ltrphd2fzi5cjTUUulRLGnkgpyOtLbFCNBAADGTssrvjxMxOJEBOxUHgg9L9inq4yx2h
	 Qt0V6v28TJeBCgqW747oKV5Qo+c1uT0sOr1Sgs6RlNTU/4kEtAxfYTyry7JQp4xV8mxjT
	 qgPbfoqJicrdqcs83kk9CN2FK+1PoJ1MkSW2zXnFNTmfcrY5ZMBMNMshKzcfWJYoncCyq
	 ebYIsBsy8fGjh6nxmIQq5/VRfqRbFoFlQ8k4LoRDZ715i7wdyLEgaQ0F8OuEw4Nbu5tN6
	 8QSaDgSdjoje2ih1kJ8O4CmVXFBnlalS3OI9AB6IMEjoglIqZv+v6MKBN0Co+xC+6pQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792902786;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=BSyUZsl/kTZErdsxyAjjc43Paa+wWgIGV75raGncy3U=;
	b=VHswBCRn6D/RT3Eu55iSGJiyviZ9PpptiKGloIHd+SUsWdjIOYmY3ZhSqaNdO1cc4EsL
	 ci9Pm+lWrsFXFx/M3zc1VDOeEAh4VyLWN4wwDIvCeTaRWJmdvJNuJ6GRABTu7l85cnC8m
	 +rJ4i2rr7L8NKa6sWTN2y2+8o3Cly45P+1SSeDUZOtNrLsTrTvQLHt9AN9WLfqvK971Np
	 U6o5seIIOph7RNke9t99da3ygcSRJKKaardMedKCmznbcXWbFyQihr9Bq+SF4ndlZ+6XX
	 /jzr/4u8fd+aaKRyVcehWXRExklABuXdHD4JH5DPlM7/0g0nGeVQ4iacf599jFKLt3A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792902786;
	bh=BSyUZsl/kTZErdsxyAjjc43Paa+wWgIGV75raGncy3U=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=p4MM8GLhRMIL+dFeZyunph2GUmB9NuJQaaGd+oIUdT2xazQTeNzTt7keI9Tkmw4yE
	 0pK6q0/OadYR52cvfpGhTbvAOzUcNT4FOJvsbamKWCn43stTZV2AAYgiSVNRf8safW
	 xHh2tQwFnkh4482gyurNKtdbRHh5u4X0METybf0pzk5cwGQhLlTF30yQtCuRiVA0u+
	 0kdsvwUx8fj8drnopw3ylIhtMhJE7i+W5YpHlY2iWDAuLW1Bk67UWccJdTs10YATNy
	 dt8fdKciVuMlmGg9yzNgvp+7Q0j4+CgI8rnI4Q7r9tzAhv9rlzgHq4jm7Q2jQNK1IX
	 PTFhHGydb6aDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5819A4066C;
	Sun, 25 Oct 2026 04:33:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D78493D9
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 04:33:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA4C760614
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 04:33:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sm8mhL1TQUDU for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 04:33:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A6E7460612
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792902782;
 b=jVjtHDcW68nMqPQHXWbCXjlu6GYF9bUQ+pqglVw/zS6ichQHkfBzkN6/x6xgDkz264gq
 AIfE27j8e+b+hhMW1+tl2N51DMp9LRp/h3JHrPwwshmcwVvGiFNqijMpL6NJJoxZWsBm0
 6rLLPWyYTdrGvgCle091qAuH6rjfXgjqY/MoPzqDrzvJT7eNOCfq2NGjkFHfg1F2B5VK0
 VGebqcIyulWpOHxw8tGVKg7kkX/XSQtNc9FLU8l5rW6adicycwxwWKj36zMcGthbVvKQz
 Ih2a//Qzi5NybvWAE8mTWHeTef4cvMFqQEh1mZJY8cfxGghqaMQ4jZ5Y0HErRNpqREg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792902782;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:From:
 Date; bh=2Krz4y1jmumbr9f09RFo4dn3kPyqTXDysG5FQa+BcGk=;
 b=VKs0o19TKz7hQXS+WLt3z8VXf7xFsciVrqTrkMf7PWGywzF++NJ85fUjS4/Sh38J7VjU
 2WwiHQZyT4r4NPMTIRysMrqsu/xpVUDJZSKG0woJ006jzx5E+ZFema0AovgjvxIw72py6
 C0OyTSBMRVxWKhbepdz/hHqOPz7B9P52OydC/U8EkUoi8d+rYS9iFNWTkos1dq8Kh1Cik
 IU4hGilQXelbzCfpX1Pw5xorkNNjKZ9TVqGCc1tzKlJXFk6UG5KP0ULimSIZ4s5C4kPi+
 RNQsERgglfSoOZ8JRxrDJLZcpLGYjjrmLG51Xaf4YkXP4AZZIB81Jq5kzDTIGMOnCaw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=mtg4QIw9; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=mtg4QIw9
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A6E7460612
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 04:33:01 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4a20bde60a0so15851095e9.3
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792902779; x=1793507579; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=2Krz4y1jmumbr9f09RFo4dn3kPyqTXDysG5FQa+BcGk=;
 b=mtg4QIw9/+uyTN/Y3XYM44Q3/MiCxf+6hpPoRAK1p1uhkXG/p9QNNAmRUGDg/wVuX6
 cUbkRfmGLD7E4y4f0QzA+uX019x+5w5c6P7f+np/zQpTbRAssncheb+KDit9+WusoEwO
 dqAC/hFU8KJmdftwz4ZydeXzH3nd9Z1s7xqL5gRExxjKYyPe6bCe6P3dAckqFo7Yj/oe
 ApLzB5iBi8CD4uD7eNo3OEzEILZ7Emqi/zJGNAi04nMMU919qaDqMMj5b3xi5AIAkUiA
 3Z/DakV6VH3SVwMWnYKSQHVViZ3QYEFP63vsFkeWqJUSy+QBuuf6jKRbT+8UgYAzPgPW
 dLhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792902779; x=1793507579;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=2Krz4y1jmumbr9f09RFo4dn3kPyqTXDysG5FQa+BcGk=;
 b=X/q53FYW421WxyCAFv7l+/51VvLUSGHAl0QJBUOSVHV3ObwFzIrqZmQKkr1+5eqG82
 iGjBe7FlZD+cSbxgCLB45vEHSpq1pvLN/E710KiIjv2x+L2QIi8urOl/iOSe3lRZuIpz
 V1AMGqaXkOpnx3ATJhVjsGCaZGVuAnuupm330riV2nw3lb+mX3bQeln66oCvSYuPwaMi
 C/Fv6QHl5UwnhneiUX3EthKPGupgOpx3LxDbMY7ULDIkdObFJParSSImuxgzzuHWf++B
 qukROO9t8mgDyyCR/67nmrlBtG1e30/PFdf7FQh46tZ1WIFy77w7d7BCHcjpE7Ml/xco
 X81w==
X-Gm-Message-State: AFq9FYLqjdgc2TApGiAJIFhNe/37ogjpEDPOejCf91L3r68G3CA3H/QJ
 0cin+pztXHw2Z6nQ6YhdDzWWI72HNR014gZuWCyOdlnX3zEuJXsEnQPwbbgrU+z9
X-Gm-Gg: AYBFou2mWnQjW2VzhcBU7bo93Hw/C3bfJtIIANIOD+4mr5NgHa1tBSz4L/40kT9/zVr
 j0JOptevC7cdJAgZdKXyFhglXpBTDLs29ZcjZhpAGKSayUFZA/mm1T1f8PKDsC0dyh/XYRYZsTq
 NaGazfR6yYzvJz/kUEI7tCrDYCEauaHYut8xxL8lwYxLyF0FwX7q7dKdIbCzyws2ol75KGjr9d1
 PBrMbcKc/MrJ436tTkWHTXq3740iTQ7ESM+WnXoPsf3Tqs3ZfiVhAsuBn80rifQelxG3VX2mKlf
 h287rz+geb6MnhkWTyiXPD8oaGXSF+aX9O1s9nu8Z5lpUPaycjzBQml3Zp0Bk57TLB9InHY/XfK
 TXuq+KL8pRH9fm3KYzDkbirjCwt9B6+BljB3TJPACnsKe8WgSjIEnSQmiiRvWBAguXtgdcm9lS4
 zdYoJOZhRs9MpzZUkQO3ana/9QXryqjekvBDL09JYG2vR/r3rVfwStjT06nzIq46uK2HT328/NT
 GFHtTSN+BqlLgkz0S8kKU3g+8O14mPe0PDIe2ppe8n0nn4qHJGQYBvtCnQ=
X-Received: by 2002:a05:600c:a03:b0:4a1:d992:9476 with SMTP id
 5b1f17b1804b1-4a35ac9f30dmr54997195e9.23.1792902778762; 
 Sat, 24 Oct 2026 21:32:58 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebd4d8dsm8677412f8f.36.2026.10.24.21.32.58
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Oct 2026 21:32:58 -0700 (PDT)
Message-ID: <6add867a.869db401.28d2e9.06f5@mx.google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 25 Oct 2026 04:32:58 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-10-24
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
	SPF_HELO_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

Autobuild statistics for 2026-10-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  7  |  7  |  0  | 14  |
  2026.05.x  |  1  |  2  |  0  |  3  |
  2026.08.x  |  3  |  4  |  0  |  7  |
    master   | 60  | 108 |  8  | 176 |

Classification of failures by reason for master
-----------------------------------------------

                     host-rust | 6 
                  chawan-0.4.4 | 5 
                host-odb-2.4.0 | 5 
                       unknown | 5 
               harfbuzz-15.0.0 | 3 
               iptables-1.8.13 | 3 
                    lua-ev-1.5 | 3 
python-types-python-dateuti... | 3 
                 systemd-258.7 | 3 
           uboot-tools-2026.07 | 3 
                   ccrypt-1.11 | 2 
                        chawan | 2 
             dahdi-linux-3.3.0 | 2 
                  ffmpeg-7.0.3 | 2 
    host-mender-artifact-4.4.1 | 2 
         host-ti-cgt-pru-2.3.3 | 2 
               madplay-0.15.2b | 2 
                   perl-5.42.3 | 2 
                  prboom-2.5.0 | 2 
            quickjs-2026-06-04 | 2 
                 sredird-2.2.2 | 2 
               tcf-agent-1.8.0 | 2 
                  xxhash-0.8.4 | 2 
            18xx-ti-utils-R8.8 | 1 
                        apache | 1 
           at-spi2-core-2.58.2 | 1 
                    ccid-1.5.2 | 1 
             containerd-2.0.11 | 1 
             docker-cli-28.5.2 | 1 
                  dpdk-25.11.2 | 1 
                drogon-v1.9.14 | 1 
               ebtables-2.0.11 | 1 
        edk2-edk2-stable202608 | 1 
              execline-2.9.6.1 | 1 
firmware-utils-c42a3bc53da8... | 1 
             fswebcam-20200725 | 1 
            gdk-pixbuf-2.42.12 | 1 
                           gmp | 1 
                 host-gdb-15.2 | 1 
host-gobject-introspection-... | 1 
            host-mfgtools-0.02 | 1 
host-python-types-psutil-7.... | 1 
              host-rust-1.98.1 | 1 
 ibm-sw-tpm2-rev183-2026-08-26 | 1 
kvmtool-7ad32e5514aca2b6d19... | 1 
      libabseil-cpp-20260817.0 | 1 
                  libbpf-1.6.2 | 1 
                 libclc-23.1.4 | 1 
libfutils-c326ce0cc2a735438... | 1 
                linux-5.10.272 | 1 
               linux-pam-1.7.2 | 1 
                   linux-tools | 1 
            makedumpfile-1.7.8 | 1 
                 mdevd-0.1.6.5 | 1 
                  newt-0.52.25 | 1 
                 openmpi-4.1.8 | 1 
                openocd-0.12.0 | 1 
package/mender-update-modul... | 1 
             parsec-tool-0.7.0 | 1 
                  pdmenu-1.3.6 | 1 
               pulseaudio-17.0 | 1 
python-charset-normalizer-3... | 1 
            python-iwlib-1.7.0 | 1 
python-remi-2022.7.27-37-g1... | 1 
          python-tinyrpc-1.1.7 | 1 
raw2rgbpnm-f28b903ca63b4c22... | 1 
rtl8189es-0a5d04114fac3c9f4... | 1 
                 rtptools-1.22 | 1 
                   s6-2.13.1.0 | 1 
           sane-backends-1.4.0 | 1 
              shellinabox-2.20 | 1 
       sp-oops-extract-0.0.7-1 | 1 
                 uclibc-1.0.59 | 1 
                  xvisor-0.3.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/5e0c84f9e37294de7f7a54ef534bdd7236904d3e |     
    arm      |             apache             | TIM | https://autobuild.buildroot.org/results/403aee1da6f1ad88ae6ead85711ef2f59ecd66a5 |     
    or1k     |      at-spi2-core-2.58.2       | NOK | https://autobuild.buildroot.org/results/96cfe2c6085ca4ebf455df93c5b9397f80e9f69f |     
powerpc64le  |           ccid-1.5.2           | NOK | https://autobuild.buildroot.org/results/f12f2765606f8dff01e64a32fd38baaf65d6115c | ORPH
powerpc64le  |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/1fc5bbd15b990730c6b972bdce5f8e19c3bb86e7 | ORPH
   x86_64    |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/13b4d6a84714e867e6514dea002c583efa7571d7 | ORPH
    arm      |             chawan             | NOK | https://autobuild.buildroot.org/results/e7387c14afeba6982d121fad79b60303e9db9858 |     
  mips64el   |             chawan             | NOK | https://autobuild.buildroot.org/results/84d0e5c8ca9349563aa461be0a9e0f386e747811 |     
   x86_64    |          chawan-0.4.4          | NOK | https://autobuild.buildroot.org/results/7f33865404de20b4bbe672d7401aa8d682cfb6ec |     
    i686     |          chawan-0.4.4          | NOK | https://autobuild.buildroot.org/results/c26f523f4ee4cc4ab56737edaf2050d728508b67 |     
powerpc64le  |          chawan-0.4.4          | NOK | https://autobuild.buildroot.org/results/dbe5b84f3e78c47dce9ffd0f85a78e2cfeec8445 |     
    i686     |          chawan-0.4.4          | NOK | https://autobuild.buildroot.org/results/4e882c8bbdeeea05e57ef9e489ad9aaa902e1fa1 |     
  mips64el   |          chawan-0.4.4          | NOK | https://autobuild.buildroot.org/results/e00d929f0d804ff7a5083c7cdd81eab7fc333bc1 |     
    arm      |       containerd-2.0.11        | NOK | https://autobuild.buildroot.org/results/4c9f84233e6368312628fb77d5f874baf4bdaf13 |     
   x86_64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/a470aa87e5a9f5cdade5086cc40fbe9bb7044369 | ORPH
   x86_64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/f10d1635258079bfc68c86d2c75f96e2207996f4 | ORPH
   x86_64    |       docker-cli-28.5.2        | NOK | https://autobuild.buildroot.org/results/756ceb50b78218ac6085e0143d9f358f97d9568d |     
  aarch64    |          dpdk-25.11.2          | NOK | https://autobuild.buildroot.org/results/6cb809e319c0f1d99c597e3586503ea0fc9650f6 |     
    arm      |         drogon-v1.9.14         | NOK | https://autobuild.buildroot.org/results/f1c7a336f3fabb2d2a2793930573b69bc47c3ee7 |     
  aarch64    |        ebtables-2.0.11         | NOK | https://autobuild.buildroot.org/results/459bb5f98a02e6b490ad75e586c8c6cfccc17814 |     
    i686     |     edk2-edk2-stable202608     | NOK | https://autobuild.buildroot.org/results/bc5981c757e8d96cf51728847ab22dffd1db9936 |     
  mips64el   |        execline-2.9.6.1        | NOK | https://autobuild.buildroot.org/results/c565c6123a0a4c757dbd2cc4957daec09d82ef7b |     
powerpc64le  |          ffmpeg-7.0.3          | NOK | https://autobuild.buildroot.org/results/c3f54415bb7622defdcb754467bcbbd9ae15f4ec |     
powerpc64le  |          ffmpeg-7.0.3          | NOK | https://autobuild.buildroot.org/results/251e29ab75d1ceee26b431d0f6a7dfcfde825330 |     
  mips64el   | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/6d9d63525a238ed0457a6762c793f3d18102420f |     
    arm      |       fswebcam-20200725        | NOK | https://autobuild.buildroot.org/results/2a1e09327c72e468a48d0425f6f640556b137223 |     
  aarch64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/f109c2518edcd19d82e78985300c66b7518f34b7 | ORPH
  mips64el   |              gmp               | TIM | https://autobuild.buildroot.org/results/dbe3a62bd32b891ec892c14b2f647451d828c2eb |     
powerpc64le  |        harfbuzz-15.0.0         | NOK | https://autobuild.buildroot.org/results/c6d2cd8550a63efab728135f3d5d4c5b022ebf7d |     
  aarch64    |        harfbuzz-15.0.0         | NOK | https://autobuild.buildroot.org/results/eff7a0f67c80011bf8c390c0bb53d830e00d4e57 |     
    arm      |        harfbuzz-15.0.0         | NOK | https://autobuild.buildroot.org/results/9b812afadf813e777ae00b51c24e32bfc78fc66b |     
  mips64el   |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/9e14e40a349ebd3afe175806ea12c086dc8d68c8 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f247d4528030985de30ab64593362fd47b13bbfe | ORPH
powerpc64le  |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/8c72c9313d9b04f1ca5b34bf8b298fb77c96c9eb |     
  mips64el   |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/335d67676961fd11d521ac21b2f095d81c8bb7d5 |     
    arm      |       host-mfgtools-0.02       | NOK | https://autobuild.buildroot.org/results/592cb0704ed91b7496351988c5640c16f7a42d30 |     
    arm      |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/4490c12397d01512e512ed81b1787f291301b9de | ORPH
  mips64el   |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/c7d8855830225a6b9f9934603b26423d86a8fcba | ORPH
  aarch64    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/6f439076ec4cab1d973e3c5abad5ddcea7438dc1 | ORPH
  aarch64    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/d5eaace669d87574682dfb2f04cc199a568e209a | ORPH
  aarch64    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/2770b10486cd24675dc4c196e9c84e56619d6172 | ORPH
    i686     | host-python-types-psutil-7.... | NOK | https://autobuild.buildroot.org/results/0bc1e8af10c7bf375c9e37d1701e74a9b37e3452 |     
    arm      |           host-rust            | TIM | https://autobuild.buildroot.org/results/e4509b57ab8ecea787992693c31e69e64731962b |     
powerpc64le  |           host-rust            | TIM | https://autobuild.buildroot.org/results/53e51cde2caec19bfb223c73c5cd559012578604 |     
   x86_64    |           host-rust            | TIM | https://autobuild.buildroot.org/results/f476d3aad4d14bccd2a9ce3acafaacf6009d2d5f |     
powerpc64le  |           host-rust            | TIM | https://autobuild.buildroot.org/results/a96dedfbe4530211f649c4896133a1ed57582e27 |     
   x86_64    |           host-rust            | TIM | https://autobuild.buildroot.org/results/ffa4c55393b524d80dbe373895a328e1428bb023 |     
   x86_64    |           host-rust            | TIM | https://autobuild.buildroot.org/results/0999bdb713d41a108b2da50135499df180d5eebe |     
   x86_64    |        host-rust-1.98.1        | NOK | https://autobuild.buildroot.org/results/2588a129c7e7c2ab81c499e77a9fae5dc33999cd |     
    arm      |     host-ti-cgt-pru-2.3.3      | NOK | https://autobuild.buildroot.org/results/521cbeaf9383d7c4eaca154d9ea326d91ac5f424 |     
    arm      |     host-ti-cgt-pru-2.3.3      | NOK | https://autobuild.buildroot.org/results/29f2fccf639306e6e4141c97b0fe7f236025b4d8 |     
    i686     | ibm-sw-tpm2-rev183-2026-08-26  | NOK | https://autobuild.buildroot.org/results/58abed12895196007f70a8ffb05f35d3eefc43bd |     
  aarch64    |        iptables-1.8.13         | NOK | https://autobuild.buildroot.org/results/550a8798b360650e81bcb714f5736d733d27ef5a | ORPH
  aarch64    |        iptables-1.8.13         | NOK | https://autobuild.buildroot.org/results/241476c4b945519dd55909cf31b5c9ffc8f3ec23 | ORPH
  aarch64    |        iptables-1.8.13         | NOK | https://autobuild.buildroot.org/results/1436a58bf4bfde5655e9cd1ebf929b3705b0bdd8 | ORPH
    arm      | kvmtool-7ad32e5514aca2b6d19... | NOK | https://autobuild.buildroot.org/results/be785687d8b8f405de42dbbd005761c05b9aa35f | ORPH
    i686     |    libabseil-cpp-20260817.0    | NOK | https://autobuild.buildroot.org/results/ace9e73b57bba1a28f757ef90046060775ee9fc2 |     
  aarch64    |          libbpf-1.6.2          | NOK | https://autobuild.buildroot.org/results/92e2a9f1f6583b8dd36c095f11258c4e69116778 |     
    arm      |         libclc-23.1.4          | NOK | https://autobuild.buildroot.org/results/740b8192e28a3ceae1ec036acb36bd81101501a3 |     
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/a342ba20e422c671917c9e1f115622caf371ce67 |     
powerpc64le  |         linux-5.10.272         | NOK | https://autobuild.buildroot.org/results/17ea04bdc5a0bba6c12cedd40543181ce494855b | ORPH
   x86_64    |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/b41a7390db62550f74e3b2aa0e257628bcd6ff20 | ORPH
  mips64el   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/03cf80dc8009bd21a93251e2c7b2e00eae8d7ebe | ORPH
   x86_64    |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/6fd03f2855fa49ec72df8c97911670ed4517af24 |     
    arm      |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/9abb3fc3fc8bb3b3182d20eed050d85d88e5bc7b |     
powerpc64le  |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/64d85063780aea3d97b38d65ad37636c2250a3d9 |     
    i686     |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/e1f8a8b443b56c830e51c0573eaa61a88db98201 | ORPH
  aarch64    |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/12d0082b74bacdaf6593ed55f9df5bdbfdae6820 | ORPH
   x86_64    |       makedumpfile-1.7.8       | NOK | https://autobuild.buildroot.org/results/184a94b1ccf00de90ec38f0a5770d83008b8ac8d |     
   x86_64    |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/0dae25552325d5d58947f44811e2f97e1358d766 |     
powerpc64le  |          newt-0.52.25          | NOK | https://autobuild.buildroot.org/results/13a67c4a0f1c7832f7ae3350e23b77edccc81112 | ORPH
    m68k     |         openmpi-4.1.8          | NOK | https://autobuild.buildroot.org/results/2c846c82b7dd6d005bc3985ae318e72fc822bb18 |     
    i686     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/f8daf551a62093da64870f8aa69c03dd38688104 | ORPH
   x86_64    | package/mender-update-modul... | NOK | https://autobuild.buildroot.org/results/20f8afc61d30cd0aae2a64240d890404d64eba43 |     
powerpc64le  |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/b411a63809f24e1a3f7e955b18b8edc2674c5d34 |     
    i686     |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/beaf5f02ab12675e278f45a8e6104afd8bf97619 |     
  aarch64    |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/227214dee4ddcdd149b074127711ec099c23fe63 |     
  mips64el   |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/8b2ea04f6f893972d44cbe1c224af67b7c2d9f01 |     
   x86_64    |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/cdd4048953d8f32191f1e917557ca31f7dc751fb | ORPH
  aarch64    |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/07098eef50c461fa0b067d18df66a71e12e83afb | ORPH
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/354b3cd4e6cf724d1d4e4dddc7f26a9e7f98faf9 | ORPH
  mips64el   | python-charset-normalizer-3... | NOK | https://autobuild.buildroot.org/results/c6427c6f1e065615e853860c5fd25d09281ca5aa |     
  mips64el   |       python-iwlib-1.7.0       | NOK | https://autobuild.buildroot.org/results/b29b6f9974cbd4d063e4480d40fc5391be719357 |     
  mips64el   | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/4aab79e1eaba2f475d141a193dc88772a2947974 |     
  mips64el   |      python-tinyrpc-1.1.7      | NOK | https://autobuild.buildroot.org/results/a0997a97787c7506485415c2674d2088e4468f03 |     
powerpc64le  | python-types-python-dateuti... | NOK | https://autobuild.buildroot.org/results/f41625f7b190b11c0af223ac28c8a272125cbf6e |     
  mips64el   | python-types-python-dateuti... | NOK | https://autobuild.buildroot.org/results/7139b524e096e348030070c118908a221dd252d4 |     
   x86_64    | python-types-python-dateuti... | NOK | https://autobuild.buildroot.org/results/90c2d0a91a84a5a1fbeab4fbcd260de3fe8428ed |     
    arm      |       quickjs-2026-06-04       | NOK | https://autobuild.buildroot.org/results/8db2c212cdb654ea8bbe159f7b7efdc68bdc1f1f |     
    arm      |       quickjs-2026-06-04       | NOK | https://autobuild.buildroot.org/results/cdecd422743d6e04634a89b81d93e6e5d302acdc |     
    i686     | raw2rgbpnm-f28b903ca63b4c22... | NOK | https://autobuild.buildroot.org/results/898d92cea09e66e057f8eca127d92c68d0644705 |     
powerpc64le  | rtl8189es-0a5d04114fac3c9f4... | NOK | https://autobuild.buildroot.org/results/563fe6cb18825c2289f0272d71f6bac9a6403e0e |     
  aarch64    |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/b7a6d85938331d55d7fb672febcff4767d76ed57 | ORPH
powerpc64le  |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/1012b30ec4d01bbc0deeeaacf914c120155f8753 |     
   x86_64    |      sane-backends-1.4.0       | NOK | https://autobuild.buildroot.org/results/c9c2b5cd3e97b4dc07d90ac7f1896b2993903ef0 |     
  mips64el   |        shellinabox-2.20        | NOK | https://autobuild.buildroot.org/results/44ad508e4088f99d6a5a981522827f5f57f891b8 |     
   x86_64    |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/14aca55163d10c32b6c94677a5c6e17b1674b143 |     
  mips64el   |         sredird-2.2.2          | NOK | https://autobuild.buildroot.org/results/276ba4b638acf118277bff8f2ec5b59558b8e151 | ORPH
   x86_64    |         sredird-2.2.2          | NOK | https://autobuild.buildroot.org/results/b4a42dee0a1a0a603739bc574bcaf48dd3a80bd7 | ORPH
  aarch64    |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/2e13a5569e68e5198521ab032f16338c3cb2feac |     
  aarch64    |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/617544a2cbbb16bf5783976da879d76390425676 |     
  aarch64    |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/72881319af3157ee085baa3f2c5fcb85df3c5202 |     
    arm      |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/59aa32740eca88b0c1bae60a48dff61e918bced3 |     
    arm      |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/b9cf4fb7493d0ed17210f085bbd071fd1c1070d8 |     
    arm      |      uboot-tools-2026.07       | NOK | https://autobuild.buildroot.org/results/c3d71de7f2055a7b4dedac2af64a364c9fe983ec | ORPH
powerpc64le  |      uboot-tools-2026.07       | NOK | https://autobuild.buildroot.org/results/03af067b30dc2e4f83350e075d72893a622ff76b | ORPH
  mips64el   |      uboot-tools-2026.07       | NOK | https://autobuild.buildroot.org/results/b454d2964d2e08a5a0c5d20d241291861c03b847 | ORPH
    or1k     |         uclibc-1.0.59          | NOK | https://autobuild.buildroot.org/results/e0969e9c94b5f82fbf2af5501d82f72424b8ddfb |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/0da5287705ff80554faae4e4dd1fd5799225c678 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/27ab2ab1f559c222d16cdcbeaa213998a4798909 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/4b836b3c052879573255e36c6ffc272f7a51375c |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/ccd55d3e3e892a25e8459f509cd08550a1ef18ae |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/204de24453b2acac283d1c4770a4546555cc5973 |     
  aarch64    |          xvisor-0.3.2          | NOK | https://autobuild.buildroot.org/results/bf39b0fdc065af4541ec5d997ac11de5e302575f |     
  riscv64    |          xxhash-0.8.4          | NOK | https://autobuild.buildroot.org/results/946816384c3a18c8a410e58352ab8e3c35e6ddde | ORPH
    arm      |          xxhash-0.8.4          | NOK | https://autobuild.buildroot.org/results/33da072559dc98d8d0a3bf229dc350dd426f6b80 | ORPH


Classification of failures by reason for 2026.08.x
--------------------------------------------------

             alsa-lib-1.2.16.1 | 1 
                 opensc-0.27.1 | 1 
 qcom-db410c-firmware-1034.2.1 | 1 
rtmpdump-6f6bb1353fc84f4cc3... | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/7e8e163c12a7e37aab923d0e5e28ffa817f9e938 |     
    i686     |         opensc-0.27.1          | NOK | https://autobuild.buildroot.org/results/a9fa94d28a6b5186c9d834b3eab58dc266d1baa6 | ORPH
  powerpc    | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/6203659ce697917f5704883d8b34f09e0b944cf9 |     
  mips64el   | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/eb2cf36a1f91309d7276be93d09288a346982e95 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

            jpeg-turbo-3.1.4.1 | 2 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/0f6ef8e8b93a923827d376935b230ed12c82b538 |     
    i686     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/e13d57f5a8549fb352d8e4b4621c2e9698fd8c61 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                 agentpp-4.6.1 | 1 
               libcodec2-1.2.0 | 1 
                   lmdb-0.9.33 | 1 
            lttng-tools-2.13.8 | 1 
python-remi-2022.7.27-37-g1... | 1 
rtmpdump-6f6bb1353fc84f4cc3... | 1 
                   rubix-1.0.6 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/4be57ce1f0dd03f4a55ccf8c47a600b9858296ba |     
    arc      |        libcodec2-1.2.0         | NOK | https://autobuild.buildroot.org/results/0204767fadb0bac5f8f2973dc85064e14a5b1ed7 |     
    i686     |          lmdb-0.9.33           | NOK | https://autobuild.buildroot.org/results/e5b4c6bc57630dd218acd73bb4fce7e080a3de7f | ORPH
    i686     |       lttng-tools-2.13.8       | NOK | https://autobuild.buildroot.org/results/cdfa29ec7e5320d90748ab5005dc47ba8e9758dc |     
    i686     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/8a3aa675288b6aa2b8d77e7d6aeae5fea9107dbb |     
    arm      | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/6eae9a9b23b9c2d3d3df29ba718216e8d34af583 |     
   x86_64    |          rubix-1.0.6           | NOK | https://autobuild.buildroot.org/results/aea91c5d1c026c89bc25d950a4f122bd360b8cf9 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
