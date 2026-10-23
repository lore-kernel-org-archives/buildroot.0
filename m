Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996E9606A319
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 03:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SOn0GLql;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RzhgWOBy
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6ED5B6068C;
	Fri, 23 Oct 2026 03:44:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OjISzbFBaacJ; Fri, 23 Oct 2026 03:44:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D1F9160666
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792727068;
	b=qQH1+h1Yndu/VjG2LgjDGjnQnnueDtd+RyxKi3sZh0lZB1s7cwdAIbjNFbB88I0qsW/A
	 VyAp7BxaKEhDKkvdOvE283P83frWkYSKnyFxW0e2oLePO+2UpspNhSSDAs8iIi7JICJpO
	 ytDQssFQq7K72plGcPa7Em7SkON9smCq98Cfe2jqA4esD5ox7wuDvszfgIKqvfwDNXbKc
	 zlPzEld3Y94zwuAIVooTQJL9hKANQhL61awTQ7xWHmf9e/Kv35yIn1UTLrFji/mmxu1hY
	 7Y8LUV2rzmpSz2Yq1cUy4HoIfMdklh+WoRbqvXh6QDigen7vLma6Epg9kLJFy7MUc6A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792727068;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9V7TA78t5+KtoTEP2Pd5AqdDNAqMM37NvArRq0Sw+Pk=;
	b=QvwCL8qSIv1UwHa/fo5wU8qN9Xdog+bSbNHDddgPsrSsQcW9SEauxGFsRKJLSqcaNU7I
	 jSHn3soYA2UgQo6XDjJx++9ChbhOP8JZNZQkVoxGwcr9nZoDR3XUd3UN4IcHbfGH8Uc9z
	 kkCgS2g0X7+Mt/mACuJ2YHV+ijktHoP4h+mvqCbzEG2U7vXaYCoMzGBsp7EXrtJkpaFzs
	 UX1P/12Wr2tyIR72bY6e20oDjLGdsbpYE2C/rdmWEwKXTSOmd5L5dQHbuVk2YMzdWAlMU
	 gsaNMXzVK3Mb2El8ZhIcDjrFPX0AE11igoi+FE5/oxhG2Lr1AcPw7hbeZvULF36x8DA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792727068;
	bh=9V7TA78t5+KtoTEP2Pd5AqdDNAqMM37NvArRq0Sw+Pk=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SOn0GLqlW5FNaK8Rg2dJ1OteBdUKbw0GmI8adZ3B9v8ovamU9BaG8+Uj+wBoITKxE
	 nRdjbzL8xAkpBe6LkUcgSIwufjJOvj9vjBB8njWHKXxDBo3ndBmm9KCbbXZZZspDZ+
	 rbW/2cTmkYwvHfKC4N99ujL9UFO7SB0khAlq/cV1jXtvcDscnlj2FDTxbSD/EsgV+3
	 Uvw0nIlIL9VV8QicwFWCDukL9/AVqT8PJ/rvWgvJOqDqeVCLj9SrtzE9/wWGXyZ7PA
	 36RY0ZOpUl+1gs0BDR+1lH0urGoJXpVVofxVA7+WR39qnk2Yo6P40MPZmOaARaImSU
	 2H7nycxn5AHdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1F9160666;
	Fri, 23 Oct 2026 03:44:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EF0D6356
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 03:44:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E08398116F
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 03:44:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rFo0om8Dij1T for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 03:44:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 537D081160
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::433"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792727064;
 b=EQurBRZVF3RLt5uFd+UTtJ9jq87BjPGpdeZN7Pous7wvUKf57MoIf786Z7tYeRR66C65
 nGnDCmkzcfsnfXmEsGdEtWhciUAsU31bZ74krdAJzMJYumDJKK9BbYO4YPZU34jH/nqLU
 Np8Unr+RKCkHZb+cgUgb3TwSee7jIvFoGaW2ejo54IYTyCPdYmUNKXyQkM5VdSGeqFzj+
 lp5EGQgFTHE78oMAcrjNY8HDw9BfVxy5eYjvppvevovqXRWi4TJmU269JSuoOao/y38pN
 8ee5M1E8vi2l8WlhFxGjX45EGJHLNzUjyl/ytkRIC2ORiaO1vRvhqd49r1SPsnPyKXQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792727064;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:From:
 Date; bh=9jNadrNHd+jP4hUHCWCxYds7O4e4ws6KcFKqu79XN8w=;
 b=bKjOkU7vLfLq6fVPS3MpL6JZUVDTlR4lTCR8z8Hw6sL87i9UtO26NuDDgin6tj+VCwCS
 LXVA7XCiLdw0yno5q7Nb+5DBmDkUeexwPVrLXY3rRbe2SraiVxex/VhQOm9d8Sx/Ifh8E
 huGtgQA7pWjndjm6KCP0DhQnc8zgrTgILOJCz0EU2a+pYiy89SeeoHu3XE1eC7l557f38
 MeLAmmJaIXhr2loLL7h/cM0bvr3s4FF0gF8D+Di/8A0IsBp4Dxs/J9zBG3XsCWO4HTGk0
 lACNjKXlXOc2C8yaF0rP4gBiEV+AVS5Ckff2jyIoVoNCQ8wB+4iGqvg9ke4w+zFmJAw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=RzhgWOBy; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::433"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=RzhgWOBy
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 537D081160
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 03:44:23 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-48df8fe8513so355116f8f.0
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 20:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792727062; x=1793331862; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=9jNadrNHd+jP4hUHCWCxYds7O4e4ws6KcFKqu79XN8w=;
 b=RzhgWOByC3OjkX10nIsAf9CS72JIl92hRrlrbkqXMdEw0rGdLSAQwJxziCz4MtQ5Mv
 4inse96SxI+LVZbSl5FStcPZaF1+ETpy79L8ZvLXgE6KFuQMGHI2mrwy76AuQhyLMfu0
 Udv35//otkE24nQrWxQ0sso/tnuJANAj8bunAYB8HBnAns5OW433r20a/8EJQqiTahZb
 UzBOW40J+kTu4aKjV+9HhZ+5I9pqgXeS9cjZpaQYAg1ya3Ff1QKP43pTjhjEXdBCM8Fy
 0s5f3kyWlulORSv+BjwqGWBBh1PQ9lLiLVyWZbKBb4wiFWwtRoRGLO638JH+F/aIKBPP
 Ne9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792727062; x=1793331862;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=9jNadrNHd+jP4hUHCWCxYds7O4e4ws6KcFKqu79XN8w=;
 b=i6jSL9SNL49W6yiWF1M+2E0CkuCVtttyYicRQOy5rnWT0AQXLSVh9BVRxiKzaYean8
 VSwgoZLTxv/FF0iDNtz41tp6dTeB2+HVoiq8u4J+iUI1Np/ePB2mKhEKBUhbzH/dKM3H
 jELfihfK1bYNkxWm2g9vIAr1z1sizpXGMRRI3MVSbkB2ggBF9b2VmBVusRJKrvh87N+A
 JtRY1G+9sB+VwFlVZ6vfwKVlw7X3JArc4nfl8lvYbMUmSmv3cUToH4cBEo44eNUkSpXi
 oeYcJkDrU0pfZWLcukgNkWXuRtWhNqHgyPA8Euf6i8Hu2R4yjh+o4SR0W/9P6uUXOSDU
 iq4w==
X-Gm-Message-State: AFq9FYI5dCIKNnrXCD7hr9rIux3E7e3mPXHMIhPLBe08ltOczMDY48WL
 nG59xenl0doDsRT+qq4z4ZIByq8NNlpGZHGPkLdWwWmVj2aLkED/x62vCvB4s3Bn
X-Gm-Gg: AYBFou16Wf/fuZgfYSgoJN/xYuar11QB7g/cd10WvpxLhqcg2tF+F0kr3Z5xOfgOF/v
 40hrClC1cRwj9S6kGIrbpLEjteJgEPGxNhremvXXX6plFeqsAEfFJu7Cjlt0G+GbnzbBm1tQmTA
 kYMuwwfJgnXN4S6VDwIj7aD5m3HDUG5XkOxOFhSbeeZVlHChgWen8IfgbvlVzb6Szro9dNGIB9V
 xUb5KY1a/p7zyGWdyU07QgS5B8CDpq/1I5Q34vmS4KnsQpu+ovhBa31/3wj+MU41O0EuECbo//V
 AF9rdmolc4BjyFF3vYZHWwglUF+TL1JttAWbMd/zG+wPCUG7E7SQCqDKUpI/HNOeam3jx368djL
 KjbWMY50Kx/GFFcFue73BQlf8dEX3gmj4ZReHBYxZjei/y1dRvHcC27rC0fhVJgmRxod5amq6xH
 RUkUPL7Uy+KaVJjqbew3tkKir3Cw8bU97kEy3bmJ0GYIjtn2e7+/Hv1hi3z7e9fnb3IAVhs+ZKT
 Zn4qqmKcGfksknH5bin/atQBZxcRr1CLoJIPGMHWDaR6GTpC0eZpR2mXn01
X-Received: by 2002:a05:6000:2407:b0:488:89af:e95b with SMTP id
 ffacd0b85a97d-48e38546d09mr1120837f8f.8.1792727061644; 
 Thu, 22 Oct 2026 20:44:21 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3803147asm2082055f8f.23.2026.10.22.20.44.21
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2026 20:44:21 -0700 (PDT)
Message-ID: <6adad815.d1b7c3f5.f12de.0da2@mx.google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 23 Oct 2026 03:44:21 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-10-22
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

Autobuild statistics for 2026-10-22
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  3  | 11  |  0  | 14  |
  2026.05.x  |  4  |  3  |  0  |  7  |
  2026.08.x  |  1  |  1  |  0  |  2  |
    master   | 50  | 167 |  5  | 222 |

Classification of failures by reason for master
-----------------------------------------------

              libmodbus-3.1.12 | 23
                 libclc-23.1.3 | 9 
                  chawan-0.4.4 | 7 
                 systemd-258.7 | 6 
                     host-rust | 5 
                        chawan | 4 
            host-gauche-0.9.12 | 4 
               iptables-1.8.13 | 4 
                   ccrypt-1.11 | 3 
             containerd-2.0.11 | 3 
                   dante-1.4.4 | 3 
host-am335x-pru-package-5f3... | 3 
                 linux-6.1.190 | 3 
               linux-pam-1.7.2 | 3 
               madplay-0.15.2b | 3 
                   perl-5.42.3 | 3 
             alsa-lib-1.2.16.1 | 2 
                    attr-2.6.0 | 2 
             dahdi-linux-3.3.0 | 2 
        edk2-edk2-stable202608 | 2 
host-google-breakpad-f49c2f... | 2 
 ibm-sw-tpm2-rev183-2026-08-26 | 2 
libfutils-c326ce0cc2a735438... | 2 
               libunwind-1.8.3 | 2 
python-types-python-dateuti... | 2 
                tpm2-tss-4.1.3 | 2 
                       unknown | 2 
           virglrenderer-1.3.0 | 2 
                  xxhash-0.8.4 | 2 
                 apache-2.4.69 | 1 
         cloudflared-2026.10.2 | 1 
cpuinfo-8a1772a0c5c447df2d1... | 1 
                cryptopp-8.9.0 | 1 
                  delve-1.22.1 | 1 
      docker-cli-buildx-0.25.0 | 1 
                 dovecot-2.4.5 | 1 
                  dpdk-25.11.2 | 1 
                drogon-v1.9.14 | 1 
                 e2tools-0.1.2 | 1 
        edk2-edk2-stable202602 | 1 
              esp-hosted-1.0.6 | 1 
                  ffmpeg-7.0.3 | 1 
firmware-utils-c42a3bc53da8... | 1 
             fontconfig-2.17.1 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
             fswebcam-20200725 | 1 
                      gdb-16.3 | 1 
glibc-2.44-57-g34106fee698c... | 1 
               gst1-imx-0.13.1 | 1 
                 haproxy-3.4.4 | 1 
            host-go-src-1.27.3 | 1 
host-gobject-introspection-... | 1 
host-mxsldr-2793a657ab7a224... | 1 
           host-qt6base-6.11.2 | 1 
              host-rust-1.98.1 | 1 
         host-sigsum-go-v1.0.0 | 1 
         host-ti-cgt-pru-2.3.3 | 1 
            igd2-for-linux-2.2 | 1 
kvmtool-7ad32e5514aca2b6d19... | 1 
                 lcdproc-0.5.9 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
libftdi1-v1.6rc1-2-g92d657b... | 1 
                libglvnd-1.7.0 | 1 
               libgpiod2-2.3.1 | 1 
               libnpupnp-6.3.0 | 1 
                libressl-4.3.2 | 1 
                   linux-tools | 1 
                  lldpd-1.0.22 | 1 
                    ne10-1.2.1 | 1 
           oath-toolkit-2.6.14 | 1 
                    olsr-0.9.8 | 1 
                openocd-0.12.0 | 1 
            optee-client-4.9.0 | 1 
             parsec-tool-0.7.0 | 1 
      passt-2026_07_28.f8df3f1 | 1 
                  pdmenu-1.3.6 | 1 
pthreadpool-560c60d342a7607... | 1 
python-remi-2022.7.27-37-g1... | 1 
raw2rgbpnm-f28b903ca63b4c22... | 1 
                      rtai-5.3 | 1 
rtl8821cu-7f63a9da2e8ed8340... | 1 
                    sbctl-0.18 | 1 
              shellinabox-2.20 | 1 
sunxi-cedarx-b8f52d913f7372... | 1 
              tinyproxy-1.11.2 | 1 
                  unifdef-2.12 | 1 
               valgrind-3.27.1 | 1 
                 wolfssl-5.9.4 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/ff613c2d94c35a38a5886b70d72aa37b58440b5d |     
powerpc64le  |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/f0c3f281554cd7fe7d48ab22513ba50f55af9060 |     
loongarch64  |         apache-2.4.69          | NOK | https://autobuild.buildroot.org/results/527d46dfc25bead256725917768a2e55765218cf |     
  aarch64    |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/8f50248d0d7e4d22b65f03678d35382ae81d86b1 |     
    arm      |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/13323130cfa06931cc9e76ea903febd78914c491 |     
   x86_64    |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/5df1277e0c44d953b11ac51f795adf10a95d6a83 | ORPH
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/51d7db4d3143b379c40fd5193603d3eb13ea196e | ORPH
  mips64el   |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/ea047231ee44e2a261225a50d5a52dccd885c4de | ORPH
  mips64el   |             chawan             | NOK | https://autobuild.buildroot.org/results/95b92908f7650da3503d00d05bb4f86b64716d7a |     
  mips64el   |             chawan             | NOK | https://autobuild.buildroot.org/results/6c6454e2a5b4667e306b94d522cfabeb7c664f20 |     
  mips64el   |             chawan             | NOK | https://autobuild.buildroot.org/results/fa19003e50fb0d31490e7b2fe0e528461fe8a570 |     
  mips64el   |             chawan             | NOK | https://autobuild.buildroot.org/results/676a14a9057ca922e757fc156b893b1c89262347 |     
    arm      |          chawan-0.4.4          | NOK | https://autobuild.buildroot.org/results/35f6ff053723bf0d16ac5b425cf943bac01a4418 |     
    i686     |          chawan-0.4.4          | NOK | https://autobuild.buildroot.org/results/16888bbe55bc290733c79a8cdd0517f5f4df2a30 |     
powerpc64le  |          chawan-0.4.4          | NOK | https://autobuild.buildroot.org/results/553aca94416bcafabfe23d34d6907bdb9ebb84c3 |     
powerpc64le  |          chawan-0.4.4          | NOK | https://autobuild.buildroot.org/results/41cab338af1c162d9d1444645020a20b2b0c05ae |     
    i686     |          chawan-0.4.4          | NOK | https://autobuild.buildroot.org/results/cf6a6cc4babb214f27f4f0e69ce915bf39d05042 |     
powerpc64le  |          chawan-0.4.4          | NOK | https://autobuild.buildroot.org/results/cf6401afa998d5e131614bda67730a79526da784 |     
    or1k     |          chawan-0.4.4          | NOK | https://autobuild.buildroot.org/results/2aa8986b4161c9ce25d4bddf8c29d1b204893e0b |     
   x86_64    |     cloudflared-2026.10.2      | NOK | https://autobuild.buildroot.org/results/3693f21363f9b3e46e118510bd4d8d978990458f |     
    i686     |       containerd-2.0.11        | NOK | https://autobuild.buildroot.org/results/df04027d53201731fbe26ff649d67fa146ce1c58 |     
    arm      |       containerd-2.0.11        | NOK | https://autobuild.buildroot.org/results/bfd84070f4c3b04efabe073d311dc374a658cd0b |     
   x86_64    |       containerd-2.0.11        | NOK | https://autobuild.buildroot.org/results/d4d818a5d90210b0a643a94e9d039b28478e65bd |     
    arm      | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/512b51152239ebe8d9f0d5cec21ef2a086b00274 |     
    arm      |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/8aa610d6e24b1e5d881d233c451db0116698fc86 |     
   x86_64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/b7c3d3848c5d24e3f12c1775aae20d219ba313b6 | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/5bb1b483e7bc748105209dc50977050ac4d805f0 | ORPH
  mips64el   |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/5379c43a1aafc98aaf6249c9964837c3d0f46638 | ORPH
   x86_64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/4934ec395a28b91587c2b3584c8462799c9c25e5 | ORPH
  aarch64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/57346005be5942ccf4173426bde478e3de064b44 | ORPH
   x86_64    |          delve-1.22.1          | NOK | https://autobuild.buildroot.org/results/7cd4fad84e22f4983d611d0a1d8568793ab66293 |     
   x86_64    |    docker-cli-buildx-0.25.0    | NOK | https://autobuild.buildroot.org/results/656a9a77469634608bda9cf9ff5c65fe00a32e8c | ORPH
   mipsel    |         dovecot-2.4.5          | NOK | https://autobuild.buildroot.org/results/d584a066c24ad676cc0eed92ba79e3febcb278b5 |     
   x86_64    |          dpdk-25.11.2          | NOK | https://autobuild.buildroot.org/results/434188b17f0040614ea1af08c6a492c77e4070dc |     
    i686     |         drogon-v1.9.14         | NOK | https://autobuild.buildroot.org/results/795c9ab125a029f0d90a267147cb6d6d80887688 |     
  mips64el   |         e2tools-0.1.2          | NOK | https://autobuild.buildroot.org/results/b1c052de12148bc37e2010fb28f8b9d6b4e24fe1 | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/480539cbc05bab8826e9f3b606100b8e28a15711 |     
    i686     |     edk2-edk2-stable202608     | NOK | https://autobuild.buildroot.org/results/5f9965b7847d5a489429d42b6173a641f471e427 |     
   x86_64    |     edk2-edk2-stable202608     | NOK | https://autobuild.buildroot.org/results/edabce734d9ef571cdbf3e46fd14895488ed3685 |     
    i686     |        esp-hosted-1.0.6        | NOK | https://autobuild.buildroot.org/results/e632cb988d9e2a4c34edcd96fa61d2716c159ceb |     
powerpc64le  |          ffmpeg-7.0.3          | NOK | https://autobuild.buildroot.org/results/f36c257fa1bc8c0a60c135d9d1a063edd867c28d |     
  mips64el   | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/97f16ac9f984196441aa40e508c37b58b285ac80 |     
 microblaze  |       fontconfig-2.17.1        | NOK | https://autobuild.buildroot.org/results/f9d237282fac2f15803ab19f45624b6e48792c8d | ORPH
    sh4a     | fs/jffs2/jffs2.mk:71: /home... | NOK | https://autobuild.buildroot.org/results/13feb60aff3198940caf65b97a7aeafe3538d1f5 |     
   x86_64    |       fswebcam-20200725        | NOK | https://autobuild.buildroot.org/results/e1ec355cd7720a722ce30e1a6c8427ba5c95836e |     
    i686     |            gdb-16.3            | NOK | https://autobuild.buildroot.org/results/92f837065f2b4490afe801972b7b052af4f6f75d | ORPH
loongarch64  | glibc-2.44-57-g34106fee698c... | NOK | https://autobuild.buildroot.org/results/3e42461ab7b60bddd8439a0cda37932e3752c62c |     
    arm      |        gst1-imx-0.13.1         | NOK | https://autobuild.buildroot.org/results/54ce5e590c3540fd67d601e824e1e6e915a6585d |     
    i686     |         haproxy-3.4.4          | NOK | https://autobuild.buildroot.org/results/8d4a69c98392678ef0b8760baf0f4a91d3514d7e |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/4af8a58e65f2bfdf26a8b81805600bcac28baf22 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/f4797e7325fe8199d455b95de05f7df7ade21341 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/e28814021805a819871882797d665b43e3386015 |     
    arm      |       host-gauche-0.9.12       | NOK | https://autobuild.buildroot.org/results/7064c728b33ef1546eddd7efc3b8d15542b70cba |     
  mips64el   |       host-gauche-0.9.12       | NOK | https://autobuild.buildroot.org/results/f83be09065dc8872bb217d7d2ba35c31c954bc45 |     
    i686     |       host-gauche-0.9.12       | NOK | https://autobuild.buildroot.org/results/12dba819007f98f9fef7159671bb4ff8d9ae3fe1 |     
   x86_64    |       host-gauche-0.9.12       | NOK | https://autobuild.buildroot.org/results/28b0abf659c910505c5d03c1ec456c3c67ab82a5 |     
    i686     |       host-go-src-1.27.3       | NOK | https://autobuild.buildroot.org/results/993ce92fcd53cf4cf5fbce5fa3e9e66b36678cfc |     
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2fc865e7b0e92f6e246cad45ace0fdbef9dcebb7 | ORPH
   x86_64    | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/355eeea419d058a771f9e168146189d856d12336 |     
   x86_64    | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/27e6719c8dfffaaee1bcd542504ad6f6e173f2f5 |     
    arm      | host-mxsldr-2793a657ab7a224... | NOK | https://autobuild.buildroot.org/results/323df3ed4ca9093e530a29353dd42ffe60ef0f60 |     
  aarch64    |      host-qt6base-6.11.2       | NOK | https://autobuild.buildroot.org/results/f8098e8c1f0c4c6d05ca67320c347254a4b93c12 |     
    i686     |           host-rust            | TIM | https://autobuild.buildroot.org/results/2aa57a40689012701ff741930a50391f65e8659f |     
powerpc64le  |           host-rust            | TIM | https://autobuild.buildroot.org/results/b2abe43f03fab5305b90fbd5a2b07c02b29a2867 |     
powerpc64le  |           host-rust            | TIM | https://autobuild.buildroot.org/results/bbfbe9d21bd819ef0c109d2e2f4235cab560b3cf |     
   x86_64    |           host-rust            | TIM | https://autobuild.buildroot.org/results/0b6617c8a7e148acd1ab6cb2f81e37ab9fe9739f |     
powerpc64le  |           host-rust            | TIM | https://autobuild.buildroot.org/results/633af9a3a9c9deefeecb3b46cfda3fd49a878e1a |     
  aarch64    |        host-rust-1.98.1        | NOK | https://autobuild.buildroot.org/results/165d4f6536932587b21638b847c14ec4245c0ec9 |     
  sparc64    |     host-sigsum-go-v1.0.0      | NOK | https://autobuild.buildroot.org/results/7a134541047213e710cf81f04a12571bb5b4a299 |     
    arm      |     host-ti-cgt-pru-2.3.3      | NOK | https://autobuild.buildroot.org/results/5684a3ba7f81d8bbf5742887e026bb107800c050 |     
  aarch64    | ibm-sw-tpm2-rev183-2026-08-26  | NOK | https://autobuild.buildroot.org/results/fa112d6c796d07195a1454a114147dcfbb8ad6fe |     
powerpc64le  | ibm-sw-tpm2-rev183-2026-08-26  | NOK | https://autobuild.buildroot.org/results/d4207dfe2f05ba1a09ca9271fc1e8da2ec9e7be9 |     
    arm      |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/c380f61022e83a19cbdd0c82ec6ede049e868e6f |     
  aarch64    |        iptables-1.8.13         | NOK | https://autobuild.buildroot.org/results/67d3ea2763122233129f8024ff4c1578cef82b97 | ORPH
  aarch64    |        iptables-1.8.13         | NOK | https://autobuild.buildroot.org/results/3881ac383bf48cd31a294f5e3f5841deca246f97 | ORPH
  aarch64    |        iptables-1.8.13         | NOK | https://autobuild.buildroot.org/results/4dfd00322ac76f0d747ebc9ffc54658c6b161b7b | ORPH
  aarch64    |        iptables-1.8.13         | NOK | https://autobuild.buildroot.org/results/52f76594edd016cd2343876bbe2a6989e6d7564f | ORPH
    arm      | kvmtool-7ad32e5514aca2b6d19... | NOK | https://autobuild.buildroot.org/results/77ae0500acd69fcf66e9ef8e09f63cb6b4d4ddb1 | ORPH
    i686     |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/4c70acca91a8a5b960562b9153af2914acf1ce03 | ORPH
    i686     |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/6edfd60af515b91f9e27e5ac40e8bb8d37151057 |     
    i686     |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/9e8590ebcc59fab2c0f0b7d038d2d9517a5d6b7f |     
   x86_64    |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/f4d527ce5a032666a2aa7ccdfdf91d73c09e1c92 |     
    i686     |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/cfa4d88ff81d9493aa02791afb4993ecb17e7d98 |     
   x86_64    |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/f793566968ee9ae074a8cd4fc81cb7b538240e3f |     
    arm      |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/4c1967c31ab42fc313d0f576c4ad045de4a790ef |     
    arm      |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/1e6fae304d87b7992715ad3a0a6fcb0180c7bfee |     
    arm      |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/50135488cd743631a41cb37bcd79ac925a31a7fd |     
  aarch64    |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/39a940ad33f6c6c999b9c4368f195014ce7f5f0a |     
    arm      | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/9fc36c939306c1078519893bb9a609e74e714558 | ORPH
    mips     | libftdi1-v1.6rc1-2-g92d657b... | NOK | https://autobuild.buildroot.org/results/69d3f3e8be1341f71372767afc49fca24f8934e9 |     
  aarch64    | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/a339b6d408a97c031058ae4ba5df8b8f1f191dcc |     
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/d79ffe1048f9593dcc00bbb3bb1a8d016f56f095 |     
   x86_64    |         libglvnd-1.7.0         | NOK | https://autobuild.buildroot.org/results/b29c1e4deae36cabadb31270e09cf42d5fb72eea | ORPH
    i686     |        libgpiod2-2.3.1         | NOK | https://autobuild.buildroot.org/results/64cf813e982a4506a7496f1125b0df8948fbfe0e |     
  mips64el   |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/64b7ae392e1bad71779a7d655acb5ede5beffad4 |     
  aarch64    |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/7eee00295d83007766ed08afbecd959c51127e72 |     
   x86_64    |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/907fa1dda1161a519e729912fa9a71bada061dc6 |     
powerpc64le  |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/29d81cbfa62d3155c440158fd872f051580e46c4 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/b4169a45a0e179ab516726dddf987ab0605a92d3 |     
   x86_64    |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/483ebd35e4096aa4fdc3b65e79b2f44f7ec3e5dc |     
powerpc64le  |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/550d1372f5094c83a616c861c63f5268e4611255 |     
    arm      |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/9b210be339b7d1fbe5f15fc5844f9570dfbdc7d4 |     
powerpc64le  |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/2ff27ded9b0245a3bc7533ff24ef15c54d91d09f |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/d269a953af4f72e632bc03f7434e478177922c29 |     
powerpc64le  |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/7cf67bd712aa36e64b255567b28c0928ba00ee1c |     
   mipsel    |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/500e8b705212f49769c67cbeeee671ce4cd77a37 |     
    arm      |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/8eed7b9b0b75823575db2b463bb535039592050d |     
    arm      |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/8cb35f02dac38cdca5b597418a0c9ec1e54c18af |     
  aarch64    |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/b999ee1a6e1bd751c03f5a26865a1b9a0ab95b5e |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/141ad1d42c6e272cb4201977b7a85d0c7a24bd71 |     
   x86_64    |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/9ed11969303307a58e9e1f06790d741e0485ebc5 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/135054d7658bb7bb4e6aff3fdfa0cac278f0bda4 |     
powerpc64le  |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/5dbf52534345b8b00ff1452b1c43f5ae0d75c4de |     
powerpc64le  |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/8edb39b57c3e2a966754b96e2074acc4c6bb4320 |     
powerpc64le  |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/15de221c69d9b5236728658af3b6e2142590d7b0 |     
    arm      |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/076bd151382e0532da26744e051eb1a45a9c7b0a |     
    m68k     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/a35b18c7ebb7fe705d968a80d170504bcfcf6726 |     
    arm      |        libnpupnp-6.3.0         | NOK | https://autobuild.buildroot.org/results/1e9043f3372d49b8d8cd7ae7fb253b7384000419 |     
    arm      |         libressl-4.3.2         | NOK | https://autobuild.buildroot.org/results/797967c623d24c0eeb90978f4cc944d0b5dc0f7f | ORPH
    arm      |        libunwind-1.8.3         | NOK | https://autobuild.buildroot.org/results/1144523d5f01b866839499d17e0c97e0d41159a5 | ORPH
    arm      |        libunwind-1.8.3         | NOK | https://autobuild.buildroot.org/results/232de9da69c69f8d0d0fffa8d82461123c403e07 | ORPH
  mips64el   |         linux-6.1.190          | NOK | https://autobuild.buildroot.org/results/c7540085551a5c9b95679ed0279261cd070fe27f | ORPH
powerpc64le  |         linux-6.1.190          | NOK | https://autobuild.buildroot.org/results/47c779df892969afc11207b2a7a1778e19712d59 | ORPH
powerpc64le  |         linux-6.1.190          | NOK | https://autobuild.buildroot.org/results/8fa55b49a6ffe19dcf2f8d0bcf82160244d3ecdf | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/8aef9856a9175eed047a308a469e44f99b3ea3a8 | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/2e5cde1ce357b5d013c914dcef5c6658a6dec5ee | ORPH
  mips64el   |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/681a5aeb76aeece087fdc9a5377328894f29cd4e | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/e0a0d415a50b29cb503b800a859c4de9baac1c29 | ORPH
  aarch64    |          lldpd-1.0.22          | NOK | https://autobuild.buildroot.org/results/d7f3c7e464dd720f9d27b9e05d3d30f8499dbe5a | ORPH
  mips64el   |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/de75a4f24ec97fab3ff1d1d4529903810b5cfec0 | ORPH
powerpc64le  |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/c773bb8144e311e0f5366fd38410266faf9f973b | ORPH
powerpc64le  |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/8b5ed874dd8b55534e29386ad59aa0afecc18706 | ORPH
  aarch64    |           ne10-1.2.1           | NOK | https://autobuild.buildroot.org/results/194b206782e19247eaa5398455115001b01f4cb8 |     
  aarch64    |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/c8514f6e34714a3107a13bfb61315c1a887d0f14 |     
  mips64el   |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/bbd7e73dec318a191585a9fd0b44da2ce1b28a3b | ORPH
  aarch64    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/6436c7c81cda5eeb8331f18d40f33f4bf1dadd79 | ORPH
  mips64el   |       optee-client-4.9.0       | NOK | https://autobuild.buildroot.org/results/bd53f12f98082a5b4a8ad3f32407d44eac53c97e |     
powerpc64le  |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/c8c59d2659b7e7dde5fa7005ff6c969585fd0878 |     
    i686     |    passt-2026_07_28.f8df3f1    | NOK | https://autobuild.buildroot.org/results/60b2be87c337411312db205deba234d8ca74ccdf | ORPH
    arm      |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/3dcce3e8e0c6a0ca0db24726020094ae9bbb75e9 |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/1714c824a87325a4d2b57937bae2967bdebcb8b6 |     
powerpc64le  |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/472a277513cef468c04d0351a01484d67d0853bf |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/8f4d7b15fb3eff68d0f177c9c4a9bc88f090a075 |     
  riscv32    | pthreadpool-560c60d342a7607... | NOK | https://autobuild.buildroot.org/results/e9b63591fb9a33840e4dc3abe46656e1ebb14de6 |     
   x86_64    | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/cf1985c008c0af6a0a2dc08f98ae426b3b17874b |     
    i686     | python-types-python-dateuti... | NOK | https://autobuild.buildroot.org/results/f1d05e9584e4ba1cc77e5a4ab30023f245f7f2fc |     
   x86_64    | python-types-python-dateuti... | NOK | https://autobuild.buildroot.org/results/f91768dd4051ef25607f08e98dc3c658d7ea8c28 |     
    i686     | raw2rgbpnm-f28b903ca63b4c22... | NOK | https://autobuild.buildroot.org/results/f0fba290f164db79ee320c7b415b533317d12281 |     
   x86_64    |            rtai-5.3            | NOK | https://autobuild.buildroot.org/results/24364819229d65dda43a4294f26a31667e7bd77b | ORPH
    i686     | rtl8821cu-7f63a9da2e8ed8340... | NOK | https://autobuild.buildroot.org/results/f5623cfe248d60a5f722ff0e4481bd04482cab41 |     
  mips64el   |           sbctl-0.18           | NOK | https://autobuild.buildroot.org/results/8251097a15152126d52816d554f1e8d08744857e | ORPH
    i686     |        shellinabox-2.20        | NOK | https://autobuild.buildroot.org/results/9733d86f19877fc32f0d000a9228b3f951751be2 |     
    arm      | sunxi-cedarx-b8f52d913f7372... | NOK | https://autobuild.buildroot.org/results/d18c396c1c8e01dcb09ff2be50531d9bcc6824d7 | ORPH
   x86_64    |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/6b32cdb0373e9ad644822575ac3b9d1112f437e7 |     
powerpc64le  |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/fbe44f6e2811a13b10816c13ed913a25945e54f5 |     
  aarch64    |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/eaefecb2fed431bf072bcd9cfdae48b8da75a468 |     
powerpc64le  |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/27e2bbe333b50e4ec86f615667db17f26015fac9 |     
powerpc64le  |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/5b6eafa09352276d08293b66dfc819343953d869 |     
powerpc64le  |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/c7a800b17fc9351b951db8f301f9a67574683a6e |     
  mips64el   |        tinyproxy-1.11.2        | NOK | https://autobuild.buildroot.org/results/2e645ae38ba2e706d3dc5d29034ddc41cffabfad | ORPH
  aarch64    |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/93040475b62743e52a20a4c034c44a3194a87b8c | ORPH
    i686     |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/f9b4790779064df4bac6b6398b7e21cccef40901 | ORPH
   x86_64    |          unifdef-2.12          | NOK | https://autobuild.buildroot.org/results/ab9f1eb7b7e513bd31c953bbc27be228a8ce24c4 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/8ef7e3ada4195166b999687adfb89e1f9324e544 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/c962c40eb8a1bf85fd9c84523578029392f85be6 |     
    i686     |        valgrind-3.27.1         | NOK | https://autobuild.buildroot.org/results/8a8a1a608a83f76bca6803f5c0a98e044502c0f8 | ORPH
  mips64el   |      virglrenderer-1.3.0       | NOK | https://autobuild.buildroot.org/results/0661522975048fcdebb04a6bcc6b60d8af823a6f |     
powerpc64le  |      virglrenderer-1.3.0       | NOK | https://autobuild.buildroot.org/results/bbefa7e289f398ea7f33d3711a01cdaf1d190da5 |     
  mips64el   |         wolfssl-5.9.4          | NOK | https://autobuild.buildroot.org/results/84e99b2a6fde2fbcc406a7f040508dbe659dcbc3 |     
    i686     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/756b9ae976b35aebca599ba27d522dc9122bcc14 |     
  mips64el   |          xxhash-0.8.4          | NOK | https://autobuild.buildroot.org/results/bbbcdaa80dc91eb949c873cb55dabf56a0ee3fdb | ORPH
powerpc64le  |          xxhash-0.8.4          | NOK | https://autobuild.buildroot.org/results/20fd80cd569834fb29b729ce28996beee22526b7 | ORPH


Classification of failures by reason for 2026.08.x
--------------------------------------------------

              libmodbus-3.1.12 | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/eac7ad894a57710a073dca1ca8ace1ec42c7bca1 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

            jpeg-turbo-3.1.4.1 | 1 
        ltp-testsuite-20260130 | 1 
                       unknown | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/bb7f681d081053b8cc6563e33bc564b10ceaed51 |     
    i686     |     ltp-testsuite-20260130     | NOK | https://autobuild.buildroot.org/results/ec9321e47dbf0529aaa207f30a38550ce0e75cfc |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/e334a23cbcdc0bfbf4b2c66047f555a31172b831 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                   crun-1.18.2 | 1 
                   dillo-3.0.5 | 1 
                 fwupd-efi-1.7 | 1 
                 gerbera-2.4.1 | 1 
        host-python-lxml-5.3.0 | 1 
                 libgee-0.20.6 | 1 
        ltp-testsuite-20250130 | 1 
package/wine/wine.mk:347: w... | 1 
                   perl-5.40.5 | 1 
             python-lxml-5.3.0 | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          crun-1.18.2           | NOK | https://autobuild.buildroot.org/results/74dbd125af081d8a55d4814db6b31ffca6cb5b99 |     
powerpc64le  |          dillo-3.0.5           | NOK | https://autobuild.buildroot.org/results/c41233bcd536cfeccc3e7ebb35dcac09dc29ad67 | ORPH
    i586     |         fwupd-efi-1.7          | NOK | https://autobuild.buildroot.org/results/cff0d2de97825966cd78ff55116d18c05f7c7911 |     
    i686     |         gerbera-2.4.1          | NOK | https://autobuild.buildroot.org/results/9145b976e247c2939985a7da89cf32ce4edc381a |     
   x86_64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/d8df3baf4775ba3c484996509441d8556363560b |     
    i686     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/c56c26baf47d840640821bb11100590f693332e0 |     
    i686     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/dd94e7d178e14f3b89fb83ea51c621176787b1a9 |     
    i686     | package/wine/wine.mk:347: w... | NOK | https://autobuild.buildroot.org/results/92ad7be1a8b329e5838fa373f8b42a8a86d851e8 |     
    i686     |          perl-5.40.5           | NOK | https://autobuild.buildroot.org/results/ff08409da0079f2240d742d4add10e5eef7eed8f |     
powerpc64le  |       python-lxml-5.3.0        | NOK | https://autobuild.buildroot.org/results/74e79fb529bf0e3aedb2dc6dfedaa1c60bc53c41 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/a86d5ea46190b2f61a6833487cd8a2f0d84ac1b9 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
