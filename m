Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5643606A31C
	for <buildroot@archiver.kernel.org>; Thu, 26 Nov 2026 04:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bgFVIjZA;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cvRL5Nh3
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D74680DB4;
	Thu, 26 Nov 2026 04:25:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kIdxxrvnckUK; Thu, 26 Nov 2026 04:25:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 262E480D1B
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795667128;
	b=p/5DFv7I1M/cLy94LxqHyTo1rWJwHUWa5Pc4zojLfhTpJTEIV3Mp43pvoQnzVJ+gGUd9
	 uFDzpKVJCqOTSC4zv6MqK/gZJbMQyNtcK/WmOt0hF/uL0GZXHw+/pttHAuweq4B3GIp2R
	 ekAi+FBbnHOoonjA4//kcv0wSqd8x2QjYdIMBiuHvGigfTpe3zSi5b54FeMUbkHWNudp5
	 /WROcs+Br6G/x1kp5c7JnNNqFrRjFqUrW4/0gMdBUvrfJ44RkHJDpkLOWLeaYKfkVGnuD
	 xEdA+G5FF0cGI7VeZT6FXKcHH5wDs+/to+FLm+KdinEf34i+9jYV+TZYbV/TawU6upg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795667128;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=U0GLo4HYFiO4Fo5YxxAPYv73xIn0gJjPKotcqk42pBs=;
	b=d4EDklHhYhEG035g65Ab+QJFsyuXFQgk/9ptYeKQxH9SHNmXBAQwcvG0TU5uW0URELZ8
	 7nDbCEOl4Dyl1MU7UK8MbJ6sRd+KusbLMSlXw0Cu4cz3Dc5FK2W5j/GU5kk7nkeDdPXsw
	 q/5S2ya1xMJ7HoOm/PovbMS9tFf0q1k0o5pqpX7/ffSG08U59aT1+Voa85fdpaemeaj45
	 sd8W2qZO1abl/qYwnLhQoEdlVDi1C+ECK4jeReu+jC9jgWg7UXypYKUXFrr7C/degmPN9
	 Wg5WXBtkzS8nS9UlFrtEhbXxomdWSYqd0La1AovN3FFz8MNfAAKr2ZcW5jd+j3xEZdg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795667128;
	bh=U0GLo4HYFiO4Fo5YxxAPYv73xIn0gJjPKotcqk42pBs=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bgFVIjZA6Xm6vOpc5yG7y8HtaX0OhrqV7yr3Pm0QM+nszmaMJKgBzjQ8U812FF3Gw
	 CFtYECMgicaNx2zmudowZghst6tZKljdHJ19mfsU6RmDBIzcKd0LBipjINB6cN576Y
	 WdjuwNJI8nyPH66e3/DFWlwblg0NrhA/bGn0/VlgcK7V/kM2Y6dE01mtLwz5YeC4hS
	 mo2bZrpi4ZOMch4qJJjPzKRTgwxJdgndoXkhh0a0GqGvTiCLCEuuOB0udNUUpXnf0H
	 OKm8SBvGPxSYOkDHnL0DIcxhEPCvmKR8FRtFChozpr1MY/T1B26Ryw+yZPdmgVsk80
	 m8vLWY6QvzrTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 262E480D1B;
	Thu, 26 Nov 2026 04:25:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 415A8260
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 04:25:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 332E9400AF
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 04:25:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sVZMlEnWVjg4 for <buildroot@buildroot.org>;
 Thu, 26 Nov 2026 04:25:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org B10FC4008A
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::434"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=cvRL5Nh3
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B10FC4008A
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 04:25:23 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-490c3ae81d3so4088956f8f.2
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 20:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795667121; x=1796271921; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=xxI4pKrKpEULVyPiIYAYeyzlBpRuKM5QHXHOxiTYTlo=;
 b=cvRL5Nh3AglUPTSEBMPv7a2lzyXl9nehwdwqP/xR/tFKiMUCV0+U4wxoJAddgQrrOX
 c1Alzj5eNYyNkci/Kv0qGDeZkoSUyPd+dVxuVi2hMNjsANb0gqQPcaK9QJS4NnxzZq1t
 XQl/nTiQo6c79L9ostGSTlw+KZNstiGNMuiptBLfbW6RtxPkjYuk9G5iSnG3ZqwKPpi0
 lNFYWribRXerOf6dMucNnfazzN3W2YN/LBE9BTzZ/D/mnvAjwIfmw5gdBOymdKt2X9Up
 PhJR+3EUOd6HNoh3JhbGeSBqwoz1qI128IykncHIkeW0VMObZFMPnXpa2QHt2/4gCe7c
 eZ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795667121; x=1796271921;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=xxI4pKrKpEULVyPiIYAYeyzlBpRuKM5QHXHOxiTYTlo=;
 b=CGG50D5yzJbnGC0RkwAu7vke+I4SOF62rwGuPX3SRMY0SZicpvn/tMTgMSVYhcUr3o
 D+XfnJ3+VbjSf4NRpIBTr1lD80SazkAjW0xdsrcbrcla5+TRsWwMRsnogqaOldX6+ovS
 vy59azE6Tq1SmEzaWCHXhCiBnwZ+pZtF4If9zxKT1eapAsZAzZ3ZEmqDd3AsS07bvitl
 dMTAfVNnZV9xH0QfcxeMSN09IBaYNvFwRMc2+bu2cbfPps1voH00Eh83YdhvEjhC7yfX
 KO+k8Vw1uQjT9eMAmP5guHH7mDzdnkobhXugEjj+O/aNWc5IeDqm/Vq5lkqePZGy+fWt
 LjMg==
X-Gm-Message-State: APuU4Z9oSkIWURVFY3dgap2sMh6PiD+BX0lcUttStYnCG3iH/BJ2CsST
 nz2IWg3oWlWS8Ek8KTMHKn7UHrx/mJxv9Y/Iw04n63fwND85y1Bdf987js+FmQLh
X-Gm-Gg: AZFdTZd9eGdN0UkuuAXsi1RryNwFUCAcp+cYbkEheiJyO01UGSKXk9huZXMM+mdofLd
 Z3G6Qf7/9ZQyNyD7CUlXAjEBASDXOC2y6saXuDP7/CurybQN55U1iIxPGe1iOaXbQEwt8iUeL2J
 yALVcUzLjGzDv/+15sqtAAyeKYPoobVQVraLnqoTOtv6b4pVcUNJ4TfURp1c111ZIWL36Dh21dr
 75/dL4sy+5ZxYvVkvq620+/4PmAGqTzwK/6YgU/LMEPaZmzm6lIROkEjx6cUaZ0xXB79g8xOPP9
 hAZq7yfPtCWu5luJqRGjdxYLTdd0GmbcHqDK6zch1G+zwOkp9fAcbk27hc9e9nqTNDcL7FlGjk6
 di90yjqEHOl/EHIsiIZsAZvgbouA1sGKipPShVQPxH46zXYEJOLIp0X/02UiJZpQ2lSEhc29gQF
 FHW+wKkvmCVRzht/CYbTaSJAmyocRVYojESDaB+qs+mzMki7CZOERPSnhvST0pUepU1MqKq75UN
 7VNQm6OEZWb+VZeUHVT87C7M0oZlbQCuwBCWEtUzNLsK3DjguXfiw93KQmdmS5Q9P3N/jEO9oPA
 QT0QnognTLPtXZCvLrobyxc1XE2E6j/8+R7WOMfI+M0BWJXBjau2TA==
X-Received: by 2002:adf:e9cb:0:b0:4aa:f018:e063 with SMTP id
 ffacd0b85a97d-4abb225e922mr27905153f8f.24.1795667121186; 
 Wed, 25 Nov 2026 20:25:21 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab658e2d1bsm39624304f8f.8.2026.11.25.20.25.20
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 20:25:20 -0800 (PST)
Message-ID: <6b07b4b0.4bb8ff69.389246.8624@mx.google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 26 Nov 2026 04:25:20 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-11-25
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
X-Spam-Status: No, score=0.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

Autobuild statistics for 2026-11-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  5  | 11  |  0  | 16  |
  2026.08.x  |  0  |  2  |  0  |  2  |
    master   | 25  | 43  |  0  | 68  |
     next    |  3  |  2  |  0  |  5  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 5 
             host-libbpf-1.6.2 | 4 
                 glibmm-2.76.0 | 2 
                   linux-7.3.6 | 2 
               pulseaudio-17.0 | 2 
               collectd-5.12.0 | 1 
                 e2tools-0.1.2 | 1 
        edk2-edk2-stable202608 | 1 
firmware-utils-c42a3bc53da8... | 1 
glibc-2.44-77-g438677ef4985... | 1 
             glibmm2_66-2.66.8 | 1 
               gocryptfs-2.3.2 | 1 
google-breakpad-f49c2f1a202... | 1 
             host-libffi-3.8.0 | 1 
    host-mender-artifact-4.4.2 | 1 
              host-rust-1.99.1 | 1 
      host-uboot-tools-2026.07 | 1 
             librdkafka-2.16.0 | 1 
             libxmlsec1-1.3.13 | 1 
                   libzlib-1.4 | 1 
                   lmdb-0.9.35 | 1 
            makedumpfile-1.7.8 | 1 
             matchbox-lib-1.14 | 1 
                 mdevd-0.1.6.5 | 1 
 qcom-db410c-firmware-1034.2.1 | 1 
raw2rgbpnm-f28b903ca63b4c22... | 1 
rtl8189fs-13bbdbc750bfaa37f... | 1 
rtl8812au-aircrack-ng-c3fb8... | 1 
                   s6-2.13.1.0 | 1 
        s6-linux-utils-2.6.2.1 | 1 
               tcf-agent-1.8.0 | 1 
uclibc-ng-test-132c6134d691... | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        collectd-5.12.0         | NOK | https://autobuild.buildroot.org/results/da2ff1633ce113c8bcc5d2d1a160db0cd55c975a | ORPH
    arm      |         e2tools-0.1.2          | NOK | https://autobuild.buildroot.org/results/7bea8d1673e175ffd8785b710cdc8905ebaf4064 | ORPH
   x86_64    |     edk2-edk2-stable202608     | NOK | https://autobuild.buildroot.org/results/1f903f1da4239be9cd8782e7920a49f3a2b120f3 |     
  aarch64    | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/4abcf4ce5f226b07de41101472661c1d711b70d6 |     
    hppa     | glibc-2.44-77-g438677ef4985... | NOK | https://autobuild.buildroot.org/results/a74b550ff7cc6eaba1785dd3500311bb9ee3d1bb |     
    i686     |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/3d988630fb40e49777f11520363536ec90942755 |     
   x86_64    |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/1b4026d6c7824df040f8bb9d42ee7387808f53d7 |     
  aarch64    |       glibmm2_66-2.66.8        | NOK | https://autobuild.buildroot.org/results/58e39f64029c1efe77fdd097b307255eab60129a |     
    arm      |        gocryptfs-2.3.2         | NOK | https://autobuild.buildroot.org/results/8bf157489c2e73982aec5854fc60f477fc018b35 |     
    i686     | google-breakpad-f49c2f1a202... | NOK | https://autobuild.buildroot.org/results/f49685176e56f255b1bc1f59e0977793ace858a4 |     
   x86_64    |       host-libbpf-1.6.2        | NOK | https://autobuild.buildroot.org/results/3945b6671c1f60368bc0e77ee2f394f2ff6c8193 |     
powerpc64le  |       host-libbpf-1.6.2        | NOK | https://autobuild.buildroot.org/results/f9c5015890c3507439bd1853f9aced46a6d824f8 |     
 aarch64_be  |       host-libbpf-1.6.2        | NOK | https://autobuild.buildroot.org/results/80bb3ada073d2302283ca92e3c980c990954361d |     
    i686     |       host-libbpf-1.6.2        | NOK | https://autobuild.buildroot.org/results/1515307220f0e63acf6aa2dca84918de00cde8f6 |     
  mips64el   |       host-libffi-3.8.0        | NOK | https://autobuild.buildroot.org/results/d09005f73af99a1d8fc45dbe277e8f3b96f27349 |     
  mips64el   |   host-mender-artifact-4.4.2   | NOK | https://autobuild.buildroot.org/results/7a525cd9e6406cee385ca8bb687ccb05ff672335 |     
   x86_64    |        host-rust-1.99.1        | NOK | https://autobuild.buildroot.org/results/fe0c214f7cd47af3bf5f03191c4abcbcf239bb80 |     
loongarch64  |    host-uboot-tools-2026.07    | NOK | https://autobuild.buildroot.org/results/eea686800a6296ff7e8520906c5f7210bf86d590 | ORPH
   x86_64    |       librdkafka-2.16.0        | NOK | https://autobuild.buildroot.org/results/7e966c808be8d4ed96dfcb1e8f4c5905454226f0 |     
  mips64el   |       libxmlsec1-1.3.13        | NOK | https://autobuild.buildroot.org/results/ec25d1a5068e441cb09fac7cadb094f9f5dd81ee |     
   s390x     |          libzlib-1.4           | NOK | https://autobuild.buildroot.org/results/f8c8fac507f8482276ece1f8ef23a693673f4375 | ORPH
   x86_64    |          linux-7.3.6           | NOK | https://autobuild.buildroot.org/results/6558b09e15f73f3ccae348d010785ed4211eb080 | ORPH
powerpc64le  |          linux-7.3.6           | NOK | https://autobuild.buildroot.org/results/023396f29113d279125c545b08e63ed1492b5658 | ORPH
  mips64el   |          lmdb-0.9.35           | NOK | https://autobuild.buildroot.org/results/da83e7d4365a8b7e495ec11864fe348e860bcb6b | ORPH
   x86_64    |       makedumpfile-1.7.8       | NOK | https://autobuild.buildroot.org/results/df234d6c61e4a7c841a894455f06f90be39245f6 |     
  mips64el   |       matchbox-lib-1.14        | NOK | https://autobuild.buildroot.org/results/76375ab54fe205c89b48ef32baa7d5e04cb906b3 | ORPH
  aarch64    |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/590eaa19517d4d5251a99549d676f79cffc4e621 |     
  aarch64    |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/f0849607b0a893b54582ce6ea39297f87b0f837f | ORPH
  aarch64    |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/9e3c45fb10bbcb58af5c62ce6e0c06b892cd14d4 | ORPH
  aarch64    | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/b28e24d0a4f631d17899d92e46ea3ff3252e8249 |     
    i686     | raw2rgbpnm-f28b903ca63b4c22... | NOK | https://autobuild.buildroot.org/results/f0c19cc5ee3da444967ec2f56fe073835f452945 |     
powerpc64le  | rtl8189fs-13bbdbc750bfaa37f... | NOK | https://autobuild.buildroot.org/results/69642e17002c33219233281bda75239a27eda983 |     
   x86_64    | rtl8812au-aircrack-ng-c3fb8... | NOK | https://autobuild.buildroot.org/results/58d1e15a9b690fdd9e6fced3c129d4e156048340 |     
   x86_64    |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/a48a3931bfdcd32cb092855617b3870317f48528 |     
   x86_64    |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/f7716b806061f4ede71ddf199f34c84088e92533 |     
    arm      |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/3261563093d48f179299330366fd313d8c1f4180 |     
powerpc64le  | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/24cc508986eec5498ea2ae70ba19552d96a4d8e9 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/162009929ec6b4123a1ca9f9a142f572bef929c9 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/416804c52f27d33b7d445ba497c11613401c1b73 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/0e2964634eed8a1c61f3bebd16cac82af5659089 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/d388dbec48af9ffd3813192b43912b338c6e4fe0 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/90ce103b8f4e521effce9de3888cb1da6941add3 |     
  sparc64    |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/075cba9818afb01c4221fbde9d43009708af51c4 |     


Classification of failures by reason for next
---------------------------------------------

                    musl-1.2.6 | 1 
           uboot-tools-2026.07 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |           musl-1.2.6           | NOK | https://autobuild.buildroot.org/results/1c257f6f8c853a8c2fecea4d03f1a963bb12e6af |     
   x86_64    |      uboot-tools-2026.07       | NOK | https://autobuild.buildroot.org/results/b26ae1d166ef25fc9fa92800d2c912d161848352 | ORPH


Classification of failures by reason for 2026.08.x
--------------------------------------------------

                drogon-v1.9.13 | 1 
                    ne10-1.2.1 | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         drogon-v1.9.13         | NOK | https://autobuild.buildroot.org/results/754d40eb11cdfe1521c6ca391e2965afdd7974a4 |     
  aarch64    |           ne10-1.2.1           | NOK | https://autobuild.buildroot.org/results/6b982100c53842b3b15c11b6f4c760c1446626a1 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                freerdp-2.11.8 | 1 
            gdk-pixbuf-2.42.12 | 1 
host-netsurf-buildsystem-75... | 1 
        host-python-lxml-5.3.0 | 1 
libuci-f3fc0b76040685829191... | 1 
                 libv4l-1.28.1 | 1 
     linux-5.10.246-cip66-rt29 | 1 
                memtest86-7.20 | 1 
package/linux-headers/linux... | 1 
python-remi-2022.7.27-37-g1... | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |         freerdp-2.11.8         | NOK | https://autobuild.buildroot.org/results/e67fb2eae36e615ab368ec7777e3dc1ea48a67f3 | ORPH
microblazeel |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/3a1dd8966ce0cba1621969a321b8aff0479c5bff | ORPH
   arceb     | host-netsurf-buildsystem-75... | NOK | https://autobuild.buildroot.org/results/b373bd116b436eea3f442e3d5243921dbed111a5 | ORPH
  aarch64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/a55ab558ca528f2edeacee893c40b2a26c4fd06e |     
   arceb     | libuci-f3fc0b76040685829191... | NOK | https://autobuild.buildroot.org/results/d9d369cf5b3fa945d1cd54888c32e25bce9d1e86 |     
    i686     |         libv4l-1.28.1          | NOK | https://autobuild.buildroot.org/results/3251b39dd352674b4af510d79dc0516a57db3b3e |     
microblazeel |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/a7df1c5e2c66d026558a66b0763f2c3cd462e68e | ORPH
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/658e1f064a02a022a3bb7c010065e4ad5cc97597 |     
  aarch64    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/6fa0b621a43fb774b937e3db7c616107582b2921 |     
powerpc64le  | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/3ce1206c1720d522abd51818aebb3b967500c842 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/09e89343568813fbf9808b95b08f59e06b9f64d7 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
