Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7248F606A321
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 06:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=o+ikhvND;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VV+P8/UT
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34EAD605EB;
	Mon, 26 Oct 2026 06:39:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fvAzkacu_-gN; Mon, 26 Oct 2026 06:39:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5ECF660619
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792996760;
	b=rgyLhzoFQWG7xd6r011mmtYKfTSwtcz21UDNIoNGpawZjdKRSKkHHTpehh3nYvFkUdZ7
	 k9H3jqHij+3h3uK91BOG0brchDNv2vlLbwVLdP0MKiJkusCE5P2N1GWi7eVDBXtIUMt8f
	 PAvP2jM6Tig0pO8bamowaAmXErUrdFkrbA9ly39Dcicq7BmQ7Um4BeHx9/i4jg9XISVHc
	 Z+yTv+TtXw387XZghFMYrdPIG7ZKh+78DIE+tX4iF+IDaHE5hMocGDg7E78l2VjhxGoOR
	 YZ6tFlrgjdHOrWjox9RxpsbeoBLfF31WdKUCLxsdUwSXZf5QIQF+1yCLPbYiTvLnDVg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792996760;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:
	 X-Mailman-Approved-At:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=9h6GN1xEGy9LXbSoGUiXZQZJX+cx+vkkdLuCeVRjM0M=;
	b=tXUgQ1zq4TY60zVg2sn+3NC0GyYE8wfUPlrWA0S5ob2SBh5Eoojgk+Ow9e73/2ZhkoXU
	 Yc4fhG9c+aZtGkTmL2zuWUXhLu0K0bnj9CLEBhjn9v1Vb4z0KDkiysoacJo0wc9sNR+Z6
	 T7/vmXFf+SAPmPEF+BMHNNwb3nNeFznruTx1EgeLpX/tFsTGAOjSXU7QN5u8Az0ZkupS8
	 8nGfQvliomOBcDfNJu4nYyyOq12viQKE+L4/SVqTef1OaSxEAD5tZGLkNf30SBu0DLBWo
	 cwpugufEZsClS9nYHXRTrdg7XZkaN3Szwoa1D0fNsPz4ERDhHgx5vG029v+IwtbYoEg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792996760;
	bh=9h6GN1xEGy9LXbSoGUiXZQZJX+cx+vkkdLuCeVRjM0M=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=o+ikhvND3P9IJq40N5uuyWq99T8ajns5vv1C9lHd3bIDV+NFy5wERah7499gX1OMM
	 /KxY0k0dUEnk1UricvAQ57leDkM9DFjMQOIMyYj6ycy2iPW1EbdwVpJ4eqblTuSDa9
	 p+vR3czdClKZVoYIlBCxA2VOzv24dvtdnTRk64Dob33CqvLsvZrtr/vwu1Y5BpQm8i
	 FFwh65IXJy3wD87f4Ec0ArFyXlK88BzoS4xXMI0ghdb9g3apqbz3nMerZwG8u/u2PG
	 lI9aur7Htzcpe+wGeD4KqfMjFa8Y6Q+UyCw0KNeIAGuoCe4aHeR43Qn9ZLwD6t/jKF
	 OS+3zWzc1ThwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5ECF660619;
	Mon, 26 Oct 2026 06:39:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 265CE334
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 04:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B39B4400A8
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 04:35:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 59-2LZEHybmV for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 04:35:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 2584040049
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::330"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792989333;
 b=jfc+Zp3YUKX5oo0Efw6CUUW1Q5fajDvyCAoBWgd+Tvo1mAvtI2EF7nx/Q4bw0m/a18DX
 MauiuWUYn6Q/FFFzzbEWP1LwkfUI6aHNDS4GR35UWKt+o7M+pbL5V0Fe6f8wOYVGcQ+fu
 yO4zKDL44CCjWgOgNloNVXjmJh2txo+A5ZEajP9TDRrMk3OS6EJVR4AnY4Rqc3D+blDNq
 PBNplM9qse+vvBSOzphP7awppftUUz4j6DmDTBci8+PldCq5Q0H+xo7h1bFTb6jznR924
 S/0eyX5Q5+LpeaFreCSPJlh/QwIc0Q/j3R5iU04hYWv0jzpoZA0vbkfYXjA5tkIQGxg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792989333;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:From:
 Date; bh=iXy9alzNvi/1eeATFzeJwxzq43wiT2rD67JV872ZBxQ=;
 b=G4tmLEJ+mV1QUeBUqKchHfPhetI7O1To0o1wIb1FVUpgPGKkENp+x8w+NYSdFZ17bbcW
 TC2ztGkygHq220tg83mQp9DWlL+IuSgGjLgxNHZSOqZT8czsFICywE9GpM1gEn5fBWzax
 +OoSP2SXQiTOGRvSlV5f0AgKRorvgGdRzZ/Tt59GmYrL42JHLMmEte3GKiUK6L+wATR/r
 ixnhqCKkWC76pjzEe2YmQH3/xvPsWyaxDyD8u//KtALKDCYsgxw5Uz55SvbR54jfr6mDa
 PtDWt2zeh1jGi9kNvGGjsk0BHOkrH5XjewN4lXxOUKdA4U91U1pwB8xnHgp2YpP0elw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="VV+P8/UT"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::330"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=VV+P8/UT
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2584040049
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 04:35:31 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4a3517554f7so15072025e9.2
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792989329; x=1793594129; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=iXy9alzNvi/1eeATFzeJwxzq43wiT2rD67JV872ZBxQ=;
 b=VV+P8/UTiT9OFJ8x3f3oNhyvbQVCfSzXWF81qaLn2IjZPmVlpkuJ9lr3tcKZqvoy3E
 U8hZHZ5sRNtcXLPbsDyY13MHxHsH9b4bG2WQATOMXY/LUUhAVB1O1qW6g738T+5gs8Ie
 vWdQkvOjpRQYbU26wqIx6XgeKT5+BYwSjhYL5nmFC+YENeqUCwRD0NeqdSc/dl7oJuZu
 SmfVXF11Xh8ubRW8RgG0MJgQF/WQUxAZf7qAIzI4VkhUL9XkWtWtqnLPf9E28GWfdHB0
 GLjg6u1j0818lV6DwefcrIW/Z9OkZ5heP+mu4kLdyEjjwTi3yQsQtMCgWB5zx68KMQ/C
 iyXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792989329; x=1793594129;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=iXy9alzNvi/1eeATFzeJwxzq43wiT2rD67JV872ZBxQ=;
 b=0rBIhngXqKd2M5gJS5YaDTRBoYZZBeYuYJPD4P+829mN3ofQfl3rOaXxip/aj+MM86
 4KqhKVWe68Ss4Lic9opypI0FewCD4oVNDaxv4PRqZ0jO+7z7HTbZKAe+f1qSEpOESI9k
 ktvjJQ02NAnRPf/w3G0ONhGN7rD9kKwEBwPbQ8+6tNzHbdZJtaMRKx8b5AOa9pJvGEBq
 mUHNwErxfCn5g0wqV9lINxuZZSyOxG94WfitT74lF8MVjl+OYObKvigkafhqO6pj/NDO
 1loTzaig7K5T23NVwZG3Gm5AbwzJNGdZA+5eRYRFNvtRT7w6C2/1zeDL3BYNopyQcR2v
 49oQ==
X-Gm-Message-State: AFq9FYIn40UgeRKctMbJmZyYVAOY8SV0ZZb34ymIzq9botDByHPINkY+
 TR+7nyWyo8rrBG5ZdcdvUmhS/RcIqrhQyR0k7fyZkTJ7VoRsTnLcnMPIS7ls1QTA
X-Gm-Gg: AYBFou2WumdK6CrcOOJZwSWsRh8mYugtRMn0EMvJzk/WYKkUUUEqgaPeuclJrW2KP1O
 prf3jUrzHylbbyPxYdS9cHOm+izj3GpWqEpmszjyDP5z0iPBUzgLKBUwFtY5LAWV50voCHBo6sn
 53JzeV1hT+MLSpXaCxJqQzBiA+Rn+uJNMs274PJk+XTCHkNXbwe+JB179DK8ulakO319GlrXQyr
 Y/rpMIJ3Dx52swsKKgCj1rgZX2bOmU6AK98Bz+8wghuMApBR4fQzDS5TLmGbLEkNws88gCwSrqF
 5LiwK1YwI7FMl/14mSoT59nzzQejlY3yglzhroVme+cbK0zVENWHwvfQ0xMPr0ZIPiDB9Qoi+jx
 0vL123u4raF9gg26q+YL88T9NtrMMxZZc1+gOWd3Xtd2ENGDs2itJqw15B1FPv2jh2unxYHqh7d
 WrS1hLldiEmyc0VzFTAd6tTxLM6HW0WbvJpWEDHIgypIOANcFoYgppJUFAbpfUn0+92Mnbt9B/p
 2qBS3V0WNMCbo4DqzZpI5wjFfd7XgoZ1JKyOJ0OZx5KlKV8TpWkvAQBiurH
X-Received: by 2002:a05:6000:2905:b0:48e:2a6c:153b with SMTP id
 ffacd0b85a97d-48e3eb912e7mr11651541f8f.35.1792989328224; 
 Sun, 25 Oct 2026 21:35:28 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ecde7c3sm14553260f8f.51.2026.10.25.21.35.27
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2026 21:35:27 -0700 (PDT)
Message-ID: <6aded88f.b5bed76c.3d31b8.1384@mx.google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Mon, 26 Oct 2026 04:35:27 -0000
X-Mailman-Approved-At: Mon, 26 Oct 2026 06:39:19 +0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-10-25
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

Hello,

Autobuild statistics for 2026-10-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  3  | 11  |  0  | 14  |
  2026.05.x  |  3  |  3  |  0  |  6  |
  2026.08.x  |  1  |  6  |  0  |  7  |
    master   | 33  | 126 | 17  | 176 |

Classification of failures by reason for master
-----------------------------------------------

                     host-rust | 17
python-charset-normalizer-3... | 6 
                  chawan-0.4.4 | 5 
host-am335x-pru-package-5f3... | 5 
                   dante-1.4.4 | 4 
                host-odb-2.4.0 | 4 
              host-rust-1.99.1 | 4 
raw2rgbpnm-f28b903ca63b4c22... | 4 
 ibm-sw-tpm2-rev183-2026-08-26 | 3 
               iptables-1.8.13 | 3 
libfutils-c326ce0cc2a735438... | 3 
               linux-pam-1.7.2 | 3 
                 systemd-258.7 | 3 
          usb_modeswitch-2.6.2 | 3 
                   ccrypt-1.11 | 2 
             containerd-2.0.11 | 2 
                  dpdk-25.11.2 | 2 
                  ffmpeg-7.0.3 | 2 
firmware-utils-c42a3bc53da8... | 2 
                    lua-ev-1.5 | 2 
  nxp-mwifiex-lf-6.18.20-2.0.0 | 2 
                statserial-1.1 | 2 
               tcf-agent-1.8.0 | 2 
                       unknown | 2 
                  xxhash-0.8.4 | 2 
            18xx-ti-utils-R8.8 | 1 
          aardvark-dns-v1.17.1 | 1 
             batman-adv-2025.4 | 1 
                 binutils-2.47 | 1 
                   bird-2.15.1 | 1 
                    ccid-1.5.2 | 1 
                  delve-1.22.1 | 1 
            dt-utils-2023.11.0 | 1 
                   duma-2.5.21 | 1 
              e2fsprogs-1.47.4 | 1 
            erofs-utils-1.8.10 | 1 
                     fd-10.3.0 | 1 
fs/erofs/erofs.mk:69: /home... | 1 
fs/erofs/erofs.mk:69: /home... | 1 
fs/ext2/ext2.mk:65: /home/a... | 1 
fs/oci/oci.mk:105: /home/au... | 1 
              fstrcmp-0.7.D001 | 1 
hare-dbus-e9a89f8bc5ce783fa... | 1 
                 host-gdb-15.2 | 1 
host-google-breakpad-f49c2f... | 1 
    host-mender-artifact-4.4.1 | 1 
            host-mfgtools-0.02 | 1 
              host-rust-1.98.1 | 1 
         host-ti-cgt-pru-2.3.3 | 1 
                  hwloc-2.12.2 | 1 
            igd2-for-linux-2.2 | 1 
               libecoli-0.11.3 | 1 
           libsoundtouch-2.4.1 | 1 
                  libva-2.24.1 | 1 
            libxkbcommon-1.9.2 | 1 
     linux-5.10.254-cip72-rt32 | 1 
         linux-headers-6.6.160 | 1 
                   linux-tools | 1 
                   lmdb-0.9.35 | 1 
               luasyslog-2.2.2 | 1 
               madplay-0.15.2b | 1 
                 mdevd-0.1.6.5 | 1 
                     mtd-2.3.1 | 1 
                 openmpi-4.1.8 | 1 
                   openrc-0.56 | 1 
                openssh-10.6p1 | 1 
                    opus-1.6.1 | 1 
                   perl-5.42.3 | 1 
                    php-8.5.12 | 1 
                  prboom-2.5.0 | 1 
                python3-3.14.9 | 1 
                   qemu-11.0.0 | 1 
                    sbctl-0.18 | 1 
                  snmppp-3.6.5 | 1 
              tinyproxy-1.11.2 | 1 
           uboot-tools-2026.07 | 1 
uclibc-ng-test-132c6134d691... | 1 
                 wolfssl-5.9.4 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/486c9c6250056a0c9b6d14c9cb64699f795a1044 |     
   x86_64    |      aardvark-dns-v1.17.1      | NOK | https://autobuild.buildroot.org/results/f89df8f5ffb16ee49411369988c9a41f034ae34f | ORPH
powerpc64le  |       batman-adv-2025.4        | NOK | https://autobuild.buildroot.org/results/3ce839f8cf4fa961d6cbd8c0e696a7913e91607f |     
  aarch64    |         binutils-2.47          | NOK | https://autobuild.buildroot.org/results/bc6a68141090cbe2f1385331ad2999412b4d7acb |     
  riscv64    |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/22536ab33bb1a745f0e58540956f56e9128e6d09 |     
    arm      |           ccid-1.5.2           | NOK | https://autobuild.buildroot.org/results/f943d7af2a9b96860db2fdc4a89fe2d2b8db84cd | ORPH
  mips64el   |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/dd2b362542488a306a523fa05dedc859dfb0cf7e | ORPH
   x86_64    |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/e3aea222c0f538a7ee8a9cab83e8d64154de39a1 | ORPH
powerpc64le  |          chawan-0.4.4          | NOK | https://autobuild.buildroot.org/results/d28d4636a55cc29896f0801e874cae6fa8060fcb |     
    i686     |          chawan-0.4.4          | NOK | https://autobuild.buildroot.org/results/ee03e374829b4026e8dbc5f6de84cfd01bbfca22 |     
powerpc64le  |          chawan-0.4.4          | NOK | https://autobuild.buildroot.org/results/c5a3f4419230847998e16e10df6df2877a1ae064 |     
powerpc64le  |          chawan-0.4.4          | NOK | https://autobuild.buildroot.org/results/523c417e7d0d2ba86f687c22261312bddc8aeb85 |     
    i686     |          chawan-0.4.4          | NOK | https://autobuild.buildroot.org/results/0e059adf42dee6524c31f760b4d81ec9750fc231 |     
   x86_64    |       containerd-2.0.11        | NOK | https://autobuild.buildroot.org/results/8d1752190b354276eab7c0004f2a0dd58630808f |     
    i686     |       containerd-2.0.11        | NOK | https://autobuild.buildroot.org/results/066cf14f84b57134f2a94aaa472e37d1ac173146 |     
    arm      |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/0706b54c06cea6269d584bde2abeb8ee030e476e | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/3306c8859f0f16c35591e646d789f43bce17cf77 | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/7fc8c4f22720da6fa1b2548fd6bf47a53fda31a6 | ORPH
   x86_64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/657076ec011182266accc5f353afa0ba616b5557 | ORPH
   x86_64    |          delve-1.22.1          | NOK | https://autobuild.buildroot.org/results/1135dc043973ab76062ef5f887cbce3b6e252522 |     
  aarch64    |          dpdk-25.11.2          | NOK | https://autobuild.buildroot.org/results/5a40d19adcb70653820ea7f19e1c41fb27a88abd |     
  aarch64    |          dpdk-25.11.2          | NOK | https://autobuild.buildroot.org/results/8812f1dda1f3e3f9426ae23ad3bca3ee7f1519d8 |     
  riscv64    |       dt-utils-2023.11.0       | NOK | https://autobuild.buildroot.org/results/13ac8a9aacff1414febec86bd2c597b1809fd28c |     
powerpc64le  |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/d56db6989a3cdf1ee1a79942e4195b80b0a5b34f | ORPH
   x86_64    |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/aba85c25efd61fe4dde1b64234ce8fbcd11e8bb8 | ORPH
  riscv32    |       erofs-utils-1.8.10       | NOK | https://autobuild.buildroot.org/results/878aff0525486ea57a5b175057238b630b317982 |     
  aarch64    |           fd-10.3.0            | NOK | https://autobuild.buildroot.org/results/d44ba667ed8e1ba6792a647ad3eaa2fd24b95b62 |     
powerpc64le  |          ffmpeg-7.0.3          | NOK | https://autobuild.buildroot.org/results/9276936efc19af159a38b9229ad4d5629a77ec1e |     
powerpc64le  |          ffmpeg-7.0.3          | NOK | https://autobuild.buildroot.org/results/54c39b4d2fabd3bd4c518421dbdf8af2e4bd37cc |     
  mips64el   | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/ce78a482b3cf34d1dc2d3ada176a2cef54e5196f |     
  mips64el   | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/efebf4b3a6b310578663635da7d89df8e9f7f620 |     
   x86_64    | fs/erofs/erofs.mk:69: /home... | NOK | https://autobuild.buildroot.org/results/82ff02aed28cd2852f563d8acf9a8abdd7ef2a80 |     
powerpc64le  | fs/erofs/erofs.mk:69: /home... | NOK | https://autobuild.buildroot.org/results/d875bc5ba4a91b48fcea2b275495e6c701d5e362 |     
  mips64el   | fs/ext2/ext2.mk:65: /home/a... | NOK | https://autobuild.buildroot.org/results/a02f43c703dd6a6963f9fc9fa4720d66fae906e8 |     
  mips64el   | fs/oci/oci.mk:105: /home/au... | NOK | https://autobuild.buildroot.org/results/9e6f6f745308a23efcbd2cdcbbfa717585a30bc2 |     
   mipsel    |        fstrcmp-0.7.D001        | NOK | https://autobuild.buildroot.org/results/5f3b4cbe2c5cb3cdfdb11d0667319441c9686bb9 |     
  aarch64    | hare-dbus-e9a89f8bc5ce783fa... | NOK | https://autobuild.buildroot.org/results/6cb3491a16a9db7188ab978bee234b70abaf4daf |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/71e418663b475ab1a03161f88a3a2b6f122bb1dc |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/e6bfc4393703155bf27a79a4b4e45c31bea8ad73 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/9b45960b2c7fa8c8a6808a5053bdc331c22b9ff0 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/7ca98ba9c3457d7800f5d3851c4a2a0ae3aa600a |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/2d61492b7a18c1e3eed81ebf310eaca89ab5b172 |     
  mips64el   |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/9376df5e14baae1265295404f9b4a43ae116fccb | ORPH
  aarch64    | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/cb94c54704c4499139ff7d051671ba787dd45fa1 |     
   x86_64    |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/d31d307fee80bb97ce261f7e0492d53b4414bd3e |     
    arm      |       host-mfgtools-0.02       | NOK | https://autobuild.buildroot.org/results/49acabdfdb25333037ec526b47f51af08aea567a |     
  mips64el   |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/31fd96af1837410c878e9eeaee0015ac949dde56 | ORPH
    arm      |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/e43a110e76888fa425810b2e237a1132abdfbb72 | ORPH
  mips64el   |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/b477bc179cd169527790859d3488931e02e48730 | ORPH
    arm      |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/3c491005fb262911f592b9b3fa8764ebe7d8e2ac | ORPH
    i686     |           host-rust            | TIM | https://autobuild.buildroot.org/results/ba11ffc57972c9036766fb86ffddeac219aca58a |     
   x86_64    |           host-rust            | TIM | https://autobuild.buildroot.org/results/ad1735ae5b754335074ee55eba07cd5a1af53bd2 |     
    i686     |           host-rust            | TIM | https://autobuild.buildroot.org/results/f2e9a7f89c13fe2d0265054b507c5c723168a61c |     
    arm      |           host-rust            | TIM | https://autobuild.buildroot.org/results/0884e284412b93719fc6a3c3d90cd20bf286073f |     
    i686     |           host-rust            | TIM | https://autobuild.buildroot.org/results/043a81b0505b5f0cc9f5f1641f722914c57bb8c1 |     
powerpc64le  |           host-rust            | TIM | https://autobuild.buildroot.org/results/49e853e17b1518d184cdbf6903827ea0615f42db |     
   x86_64    |           host-rust            | TIM | https://autobuild.buildroot.org/results/934d40ea35527b608dfb413cd10219c93018d991 |     
  aarch64    |           host-rust            | TIM | https://autobuild.buildroot.org/results/cb0622b99b2e8b2fbabb973ffb3f799359861b21 |     
    arm      |           host-rust            | TIM | https://autobuild.buildroot.org/results/b91f224d09506631f1e61b53e40a22040783b867 |     
    i686     |           host-rust            | TIM | https://autobuild.buildroot.org/results/89a2fa5ed5904b34e2d070561dc61191a2742968 |     
   x86_64    |           host-rust            | TIM | https://autobuild.buildroot.org/results/3701510d6c6bb6a280b8219eacf3b5e9c987d641 |     
   x86_64    |           host-rust            | TIM | https://autobuild.buildroot.org/results/2c224aaab3ee369119c9b20987c001c3cfdafdd4 |     
   x86_64    |           host-rust            | TIM | https://autobuild.buildroot.org/results/767860cc93aa92c5db9516f6d7bc252d1a3f6000 |     
powerpc64le  |           host-rust            | TIM | https://autobuild.buildroot.org/results/5dfa1d7b7dee48781a19f912b2f1d7aab03bd613 |     
powerpc64le  |           host-rust            | TIM | https://autobuild.buildroot.org/results/f8af94adb14153d16fb349366e0efac3eadeb807 |     
  aarch64    |           host-rust            | TIM | https://autobuild.buildroot.org/results/3bd054f3ac5eb7f4da11b6a9a71adeb2bb11047b |     
  aarch64    |           host-rust            | TIM | https://autobuild.buildroot.org/results/d944c35a1403ae3486f7c41c412358383d154f26 |     
  aarch64    |        host-rust-1.98.1        | NOK | https://autobuild.buildroot.org/results/f8c88996dc154a4824fceb8e5b848059fc124563 |     
  aarch64    |        host-rust-1.99.1        | NOK | https://autobuild.buildroot.org/results/425149c4f09ff165c4d97801c1cdb3019942db1c |     
   x86_64    |        host-rust-1.99.1        | NOK | https://autobuild.buildroot.org/results/b174fd70bb96005aa13928eeaae7161fc7a9d2ed |     
   x86_64    |        host-rust-1.99.1        | NOK | https://autobuild.buildroot.org/results/ca998ac63627a7e8c42fc532e18fe09631799ed1 |     
   x86_64    |        host-rust-1.99.1        | NOK | https://autobuild.buildroot.org/results/a35fcbc986f2aa342127362acb3321c325624923 |     
    arm      |     host-ti-cgt-pru-2.3.3      | NOK | https://autobuild.buildroot.org/results/128998a9f6a5d2b244ee7103c832eb72c5e289b1 |     
   x86_64    |          hwloc-2.12.2          | NOK | https://autobuild.buildroot.org/results/d88993e1ef9482099d55458b668340139e23ea17 |     
    i686     | ibm-sw-tpm2-rev183-2026-08-26  | NOK | https://autobuild.buildroot.org/results/d41cd0dd8a40d90e99f17b456efd47504158afec |     
    i686     | ibm-sw-tpm2-rev183-2026-08-26  | NOK | https://autobuild.buildroot.org/results/16da50c8bd6e12ea023fb74bc05c6939b9568f3c |     
  mips64el   | ibm-sw-tpm2-rev183-2026-08-26  | NOK | https://autobuild.buildroot.org/results/73786e13c8b719adcdb5e3afad5ea0306ba65002 |     
  mips64el   |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/43b5804f0b53c107d8b8e4e88b660f621d4e11ed |     
  aarch64    |        iptables-1.8.13         | NOK | https://autobuild.buildroot.org/results/333d2575993153d814c05808e67eb567f4e72a39 | ORPH
  aarch64    |        iptables-1.8.13         | NOK | https://autobuild.buildroot.org/results/49194c036c77366c541230de3b45fd7040b7d512 | ORPH
 aarch64_be  |        iptables-1.8.13         | NOK | https://autobuild.buildroot.org/results/57a54c5bfe410f4a8dcd80188737d1a57f56f423 | ORPH
    i686     |        libecoli-0.11.3         | NOK | https://autobuild.buildroot.org/results/32738f07f0fd5126db59e6882b3d7d9558039256 |     
powerpc64le  | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/2e1e087679cc609d758f49e1a7d07ffe7229a014 |     
   x86_64    | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/05f71efdc2c7c9841a86951e825f5cbbcf6e0649 |     
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/389a470e8973fbb8cc320155c0620705f36df681 |     
  aarch64    |      libsoundtouch-2.4.1       | NOK | https://autobuild.buildroot.org/results/af70452e8ccbc53a57e37729327e61908cd2344a |     
   mipsel    |          libva-2.24.1          | NOK | https://autobuild.buildroot.org/results/1333325f56ef2437041188b8cb863b483699ceed |     
  riscv64    |       libxkbcommon-1.9.2       | NOK | https://autobuild.buildroot.org/results/5679f0d3b229d9380b251233f274c8d216ab3276 |     
    arm      |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/c4d768363da2babb3340b618f23bebe6a09ce5cf | ORPH
   x86_64    |     linux-headers-6.6.160      | NOK | https://autobuild.buildroot.org/results/8570296451fed025c248530da8186ad5c7b237a3 | ORPH
  aarch64    |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/47a949998108d066afe1516070cc9a4656406eca | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/e7f66dc472543be3217969192041af74ad884773 | ORPH
    arm      |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/c5332a4508be69cc5da1da5a4ea9d57b2a7a3441 | ORPH
    arm      |          linux-tools           | NOK | https://autobuild.buildroot.org/results/3fb376507fece7a973c8c31b37288bd2fbdf4223 | ORPH
    i686     |          lmdb-0.9.35           | NOK | https://autobuild.buildroot.org/results/04953f6a640548b06c9bad3ff9b7a3337e593e02 | ORPH
   s390x     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/93e45dd77c5aae35487aaaa4f742df8ce642bff3 |     
   x86_64    |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/de5f3039c2d57b3187afd2b04c6fc10cfe310fb9 |     
  aarch64    |        luasyslog-2.2.2         | NOK | https://autobuild.buildroot.org/results/450d86ae19fa0a2b796023aeac40bd90b8211124 |     
   x86_64    |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/cc65d7a56346bd4afc7fc6fe18768348493d8d6f | ORPH
  mips64el   |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/5ff2e4b60c174eb615cb93ca5838bd8cf65f1d19 |     
   xtensa    |           mtd-2.3.1            | NOK | https://autobuild.buildroot.org/results/a2b888e4ab3b569a5bef90ce0a4f720945b23099 |     
    arm      |  nxp-mwifiex-lf-6.18.20-2.0.0  | NOK | https://autobuild.buildroot.org/results/cbaac54d7a9baf3e1bbcd19658e903e8b48c09af |     
   x86_64    |  nxp-mwifiex-lf-6.18.20-2.0.0  | NOK | https://autobuild.buildroot.org/results/5a284246350dc472b850b4674e1a5bc8936e2df9 |     
  mips64el   |         openmpi-4.1.8          | NOK | https://autobuild.buildroot.org/results/69cf754b3e383aae40a38d437db48b32baf726ee |     
    i686     |          openrc-0.56           | NOK | https://autobuild.buildroot.org/results/d4d9d70ce4dee0160771cc70227126f712ccb6f0 |     
    arm      |         openssh-10.6p1         | NOK | https://autobuild.buildroot.org/results/e93768b157de8a2de37100f017b55860ebd7c341 | ORPH
    arm      |           opus-1.6.1           | NOK | https://autobuild.buildroot.org/results/f3e8faac1504669df5b3f3babfe842cb452b8eb6 |     
  mips64el   |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/e175fedcaef89e8b62735b05746b6174197f7a75 |     
   x86_64    |           php-8.5.12           | NOK | https://autobuild.buildroot.org/results/2373fd73c1a38c417c83bef184b921e2d12e1c38 |     
    i686     |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/626205d4c7e4108027bd2fbcc2da7c81932b90a3 | ORPH
  mips64el   | python-charset-normalizer-3... | NOK | https://autobuild.buildroot.org/results/f000ccad906bf4620e12c57e75f3978e04960da7 |     
  aarch64    | python-charset-normalizer-3... | NOK | https://autobuild.buildroot.org/results/12e92a2e60375d6e8fdf081210bb0c3eaf92e89e |     
  aarch64    | python-charset-normalizer-3... | NOK | https://autobuild.buildroot.org/results/03644dd6955f4f8ccee2b0fe14f4500f0332c2bd |     
powerpc64le  | python-charset-normalizer-3... | NOK | https://autobuild.buildroot.org/results/ddd076ad656ed8d5ed83b552e2ac23093c7f2ddb |     
    arm      | python-charset-normalizer-3... | NOK | https://autobuild.buildroot.org/results/ed86af37b6ee4c91f03fca4cb7d7c3d42b9d9e56 |     
  aarch64    | python-charset-normalizer-3... | NOK | https://autobuild.buildroot.org/results/1fe610678c119e11c240609e373072765994e23c |     
   x86_64    |         python3-3.14.9         | NOK | https://autobuild.buildroot.org/results/83a93f2c3251e223a3aa9e05a456a2b8ac618782 |     
   x86_64    |          qemu-11.0.0           | NOK | https://autobuild.buildroot.org/results/d4820a25ad85ff5d6d60724c0d31da41534374d4 |     
    arm      | raw2rgbpnm-f28b903ca63b4c22... | NOK | https://autobuild.buildroot.org/results/6f9a045d4b1ac6823e689f6eddb72a3ef99553a7 |     
    arm      | raw2rgbpnm-f28b903ca63b4c22... | NOK | https://autobuild.buildroot.org/results/55af96dff0eaa6686b7a47bbf8f1c0f7a133af5b |     
    i686     | raw2rgbpnm-f28b903ca63b4c22... | NOK | https://autobuild.buildroot.org/results/879623d3a7b6fd2fbb0b28f04bb1e8454b6de54f |     
   sh4eb     | raw2rgbpnm-f28b903ca63b4c22... | NOK | https://autobuild.buildroot.org/results/cd17730521004a814abe207d1e9fa6a9ef9d6bb3 |     
  riscv64    |           sbctl-0.18           | NOK | https://autobuild.buildroot.org/results/db2c3f497df9c2694317a0c3062102d957262734 | ORPH
powerpc64le  |          snmppp-3.6.5          | NOK | https://autobuild.buildroot.org/results/4b86c34da6b868b6e0a7e540450d18c1411d6c07 |     
    i686     |         statserial-1.1         | NOK | https://autobuild.buildroot.org/results/e32a18cdba2d2a12c12032c1ab3d356aed8ba962 | ORPH
   x86_64    |         statserial-1.1         | NOK | https://autobuild.buildroot.org/results/9ebccee3ac77b3721f9787b003e1b9177a390661 | ORPH
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/9dd7cdf3868dc28ccbfac4cc62dfadef4ba6a024 |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/b2a20dbfe4033cb5c064c54fe0ebe946f0dfce1d |     
powerpc64le  |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/9c20f921a61c1bfce5a95610f14fd912dc47f14a |     
powerpc64le  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/9a5f9295eea2bbfa797f29605e230d91712a922c |     
powerpc64le  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/f570e391641ab80cb7f1e94c427bad95ca008205 |     
  aarch64    |        tinyproxy-1.11.2        | NOK | https://autobuild.buildroot.org/results/29dc13130a0682c5c0c65bf4b1241d8b3a968371 | ORPH
   x86_64    |      uboot-tools-2026.07       | NOK | https://autobuild.buildroot.org/results/336eb999195e6c588ddfb3ccbe3ac5e723fe7ca4 | ORPH
  aarch64    | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/43e026c8b8993e6290671c476dfa59ff13f521df |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/15506ce8314802c934fdfb42a8888ee3997a15f3 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/ed7afd3b20200b23ab1c3c83063d9a6393509802 |     
   x86_64    |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/40e1490b9b64f96b5574bd8cd1ceaa4e6d50b7ca | ORPH
   x86_64    |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/8f0055de7e9529fc68551dd9526571d190b3fd5c | ORPH
   x86_64    |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/9fe27a7d5c91c9cdf478a7bf39dfd08809539436 | ORPH
  mips64el   |         wolfssl-5.9.4          | NOK | https://autobuild.buildroot.org/results/d2af856f70834f00ba7ffcc98c1e6e8ea5942a9c |     
  mips64el   |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/54f94248db039dcc3c087176272c225cc263ad08 |     
   x86_64    |          xxhash-0.8.4          | NOK | https://autobuild.buildroot.org/results/ad696e4d0f31fa6ab4ffc92780b40dbb21665b91 | ORPH
    arm      |          xxhash-0.8.4          | NOK | https://autobuild.buildroot.org/results/2174b7fa4ea6587666acdfd940ef4a9cd1cb311d | ORPH


Classification of failures by reason for 2026.08.x
--------------------------------------------------

              libmodbus-3.1.12 | 2 
              e2fsprogs-1.47.4 | 1 
           oath-toolkit-2.6.14 | 1 
             openjdk-25.0.2+10 | 1 
                  pdmenu-1.3.6 | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/460606d7acc710f26747ceeb0873b3909101c7da | ORPH
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/8008185296509c30f27dd9b27379abbd07611bfb |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/8376f213e82eceea9a54288e5f1b74f1b47ce264 |     
    i686     |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/921d3bd5d06d93b907b494bd97bfd7bce9223b18 |     
    i686     |       openjdk-25.0.2+10        | NOK | https://autobuild.buildroot.org/results/fcb4b668ec72e18334c3d6a02c187e32f2e9ab7b |     
    i686     |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/bd9b47f421ecc4ffbe428e2ebfe6a5005be4db04 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

                     kbd-2.9.0 | 1 
package/mender-update-modul... | 1 
               pcsc-lite-2.1.0 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/37132cb874e9b363e005b219e78ebb732611a09d | ORPH
    i686     | package/mender-update-modul... | NOK | https://autobuild.buildroot.org/results/242cc582e5cb5433c00515e721b665b738a66028 |     
    arc      |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/5c6b89bbe98ecec84ec8fd5443cf00c67d29a4d3 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

        host-python-lxml-5.3.0 | 2 
              libmodbus-3.1.11 | 2 
                 agentpp-4.6.1 | 1 
            host-skopeo-1.18.0 | 1 
     linux-5.10.246-cip66-rt29 | 1 
                  mender-3.5.3 | 1 
             netsniff-ng-0.6.8 | 1 
python-remi-2022.7.27-37-g1... | 1 
x264-baee400fa9ced6f5481a72... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |         agentpp-4.6.1          | NOK | https://autobuild.buildroot.org/results/b68cb53d4d13b6086cb8b0712e998e8fe32ae8ba |     
    i586     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/1ec40a8216647f3dbd2f7c31cd2b5bdd88442177 |     
  riscv64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/b64089c49eda346c181105d658be76f926744c4c |     
    i686     |       host-skopeo-1.18.0       | NOK | https://autobuild.buildroot.org/results/064e7c33c70f49ad10cd4699ebf9792d294eb8a5 |     
    i586     |        libmodbus-3.1.11        | NOK | https://autobuild.buildroot.org/results/c44fb81d29314acb236ae8097049201d9e5f4935 |     
  powerpc    |        libmodbus-3.1.11        | NOK | https://autobuild.buildroot.org/results/144a4741d4e14c0182bea4a0874def4625b4730f |     
  riscv64    |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/20627c790bb2fe8cdc4bce54015a5d247e655f73 | ORPH
  aarch64    |          mender-3.5.3          | NOK | https://autobuild.buildroot.org/results/0e1beda90ec92d860d27c48d43c11dc60bc8d7e0 |     
   x86_64    |       netsniff-ng-0.6.8        | NOK | https://autobuild.buildroot.org/results/9a80566b13a1d03663fe539fd6cb735faaab5d19 |     
  mips64el   | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/9d65ade1ac50a40eb489a4ab55df15781c19d91d |     
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/4426257920dda176eae118f2e58a83df611b0559 |     


Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org         |   version    |   upstream   | orph?
-------------------------------+----------+-----------------------------------------------+--------------+--------------+-------
                  aardvark-dns |  DISTRO  | https://release-monitoring.org/project/242641 | v1.17.1      | 2.1.0        | ORPH
                           ace |  DISTRO  | https://release-monitoring.org/project/242395 | 7.1.1        | 8.0.7        | ORPH
                      adsp-ldr |  DISTRO  | https://release-monitoring.org/project/388235 | 1.0.1        | 1.0.3        |     
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/013117 | 3.37.2       | 51.0         |     
                       agentpp |  DISTRO  | https://release-monitoring.org/project/021316 | 4.7.2        | 5.0.2        |     
                        alfred |  DISTRO  | https://release-monitoring.org/project/241870 | 2022.1       | 2026.3       | ORPH
                      apitrace |  DISTRO  | https://release-monitoring.org/project/006170 | 13.0         | 14.0         |     
                      apparmor |  DISTRO  | https://release-monitoring.org/project/094819 | 4.1.8        | 5.0.2        |     
                         argus |  DISTRO  | https://release-monitoring.org/project/000107 | 3.0.8.2      | 5.0.4        | ORPH
                         asn1c |  DISTRO  | https://release-monitoring.org/project/016926 | 0.9.28       | 0.9.29       |     
                      asterisk |  DISTRO  | https://release-monitoring.org/project/009838 | 22.11.0      | 23.5.0       |     
                  at-spi2-core |  DISTRO  | https://release-monitoring.org/project/007841 | 2.58.2       | 2.62.1       |     
                         atftp |  DISTRO  | https://release-monitoring.org/project/015219 | 0.8.0        | 0.8.1        |     
                         atkmm |  DISTRO  | https://release-monitoring.org/project/007962 | 2.36.3       | 2.36.4       |     
                     atkmm2_28 |  DISTRO  | https://release-monitoring.org/project/373360 | 2.28.4       | 2.28.5       |     
                         audit |  DISTRO  | https://release-monitoring.org/project/015225 | 3.1.5        | 4.2.1        | ORPH
                        augeas |  DISTRO  | https://release-monitoring.org/project/007017 | 1.14.1       | 1.15.0       | ORPH
                      automake |  DISTRO  | https://release-monitoring.org/project/000144 | 1.16.5       | 1.19         | ORPH
                  b43-fwcutter |  DISTRO  | https://release-monitoring.org/project/000152 | 019          | 021          |     
                 balena-engine |  DISTRO  | https://release-monitoring.org/project/141616 | 20.10.26     | 20.10.44     |     
                          bash |  DISTRO  | https://release-monitoring.org/project/000166 | 5.2.37       | 5.3          | ORPH
               bash-completion |  DISTRO  | https://release-monitoring.org/project/005667 | 2.17.0       | 2.18.0       |     
                        batctl |  DISTRO  | https://release-monitoring.org/project/014740 | 2024.2       | 2026.3       |     
                    batman-adv |  DISTRO  | https://release-monitoring.org/project/019529 | 2025.4       | 2026.3       |     
                   bats-assert |  DISTRO  | https://release-monitoring.org/project/372274 | 2.2.0        | 2.2.4        |     
                     bats-core |  DISTRO  | https://release-monitoring.org/project/010587 | 1.13.0       | 1.14.0       |     
                  bcache-tools |  DISTRO  | https://release-monitoring.org/project/021397 | 1.0.8        | 1.1          | ORPH
                    berkeleydb |  GUESS   | https://release-monitoring.org/project/138386 | 5.3.28       | 18.1.17      | ORPH
                      binutils |  DISTRO  | https://release-monitoring.org/project/007981 | 2.46.1       | 2.47         |     
                          bird |  DISTRO  | https://release-monitoring.org/project/000192 | 2.15.1       | 3.4.0        |     
                       bitcoin |  DISTRO  | https://release-monitoring.org/project/013618 | 31.1         | 32.0         |     
                       bitwise |  DISTRO  | https://release-monitoring.org/project/111150 | 0.50         | 0.70         |     
                        blake3 |  DISTRO  | https://release-monitoring.org/project/369414 | 1.8.3        | 1.8.7        |     
                    bluez-alsa |  DISTRO  | https://release-monitoring.org/project/021324 | 4.3.1        | 5.0.0        |     
                          bmon |  DISTRO  | https://release-monitoring.org/project/000209 | 4.0          | 5.0          | ORPH
                         boinc |  DISTRO  | https://release-monitoring.org/project/000211 | 8.2.11       | 8.2.15       |     
                         boost |  DISTRO  | https://release-monitoring.org/project/006845 | 1.83.0       | 1.92.0       |     
                         botan |  DISTRO  | https://release-monitoring.org/project/000214 | 3.11.1       | 3.13.0       | ORPH
                       bpftool |  DISTRO  | https://release-monitoring.org/project/328454 | v7.5.0       | 7.8.1        |     
                      bpftrace |  DISTRO  | https://release-monitoring.org/project/141354 | 0.27.0       | 0.27.1       |     
                        brltty |  DISTRO  | https://release-monitoring.org/project/000220 | 6.8          | 6.9.1        |     
                         broot |  DISTRO  | https://release-monitoring.org/project/141357 | 1.60.1       | 1.61.0       |     
                   btrfs-progs |  DISTRO  | https://release-monitoring.org/project/000227 | 6.10         | 7.3          | ORPH
                    bubblewrap |  DISTRO  | https://release-monitoring.org/project/010937 | 0.13.0       | 0.13.1       |     
                        bustle |  DISTRO  | https://release-monitoring.org/project/006428 | 0.8.0        | 0.14.0       | ORPH
                        c-icap |  DISTRO  | https://release-monitoring.org/project/021325 | 0.5.14       | 0.6.5        | ORPH
                   c-periphery |  DISTRO  | https://release-monitoring.org/project/021328 | 2.4.3        | 2.5.1        |     
                         cairo |  DISTRO  | https://release-monitoring.org/project/000247 | 1.18.4       | 1.18.6       |     
                       cairomm |  DISTRO  | https://release-monitoring.org/project/007959 | 1.16.2       | 1.18.1       |     
                   cairomm1_14 |  DISTRO  | https://release-monitoring.org/project/369459 | 1.14.5       | 1.14.6       |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/010888 | 0.0.25       | 0.311        | ORPH
                     capnproto |  DISTRO  | https://release-monitoring.org/project/011515 | 0.10.4       | 1.5.0        |     
                        catch2 |  DISTRO  | https://release-monitoring.org/project/007680 | 3.16.0       | 3.16.1       |     
                        ccache |  DISTRO  | https://release-monitoring.org/project/000257 | 4.14.1       | 4.14.2       |     
                          ccid |  DISTRO  | https://release-monitoring.org/project/002612 | 1.5.2        | 1.8.4        | ORPH
                        cdrkit |  DISTRO  | https://release-monitoring.org/project/010520 | 1.1.11       | 1.1.11-5     |     
                        chawan |  DISTRO  | https://release-monitoring.org/project/392954 | 0.4.4        | 0.5.1        |     
                   checkpolicy |  DISTRO  | https://release-monitoring.org/project/001717 | 3.10         | 3.11         | ORPH
                       chicken |  DISTRO  | https://release-monitoring.org/project/000280 | 5.4.0        | 6.0.0        |     
                    cifs-utils |  DISTRO  | https://release-monitoring.org/project/000287 | 7.8          | 7.9          |     
                         cli11 |  DISTRO  | https://release-monitoring.org/project/020578 | 2.6.1        | 2.7.2        |     
                        clinfo |  DISTRO  | https://release-monitoring.org/project/010503 | 3.0.25.02.14 | 3.1.26.09.26 |     
                   cloudflared |  DISTRO  | https://release-monitoring.org/project/186920 | 2026.10.2    | 2026.10.3    |     
                        clpeak |  DISTRO  | https://release-monitoring.org/project/015180 | 1.1.5        | 3.0.4        |     
                   cni-plugins |  DISTRO  | https://release-monitoring.org/project/096794 | 1.7.1        | 1.9.1        |     
                      collectl |  DISTRO  | https://release-monitoring.org/project/000330 | 4.3.20.1     | 4.3.20.3     |     
                 comix-cursors |  DISTRO  | https://release-monitoring.org/project/021882 | 0.9.1        | 0.10.1       | ORPH
                      composer |  DISTRO  | https://release-monitoring.org/project/009710 | 2.5.8        | 2.10.3       |     
                        conmon |  DISTRO  | https://release-monitoring.org/project/096793 | 2.1.8        | 2.2.1        |     
               conntrack-tools |  DISTRO  | https://release-monitoring.org/project/000338 | 1.4.8        | 1.4.9        | ORPH
                    containerd |  DISTRO  | https://release-monitoring.org/project/016460 | 2.0.14       | 2.4.2        |     
       containers-image-config |  DISTRO  | https://release-monitoring.org/project/378977 | v5.35.0      | 5.36.2       | ORPH
                   cpp-httplib |  DISTRO  | https://release-monitoring.org/project/274636 | 0.48.0       | 0.63.0       |     
                          crun |  DISTRO  | https://release-monitoring.org/project/096792 | 1.24         | 1.30.1       |     
                  cups-filters |  DISTRO  | https://release-monitoring.org/project/005541 | 1.28.17      | 2.0.1        |     
                      cutelyst |  DISTRO  | https://release-monitoring.org/project/021335 | 3.5.0        | 5.1.0        |     
                          dado |  DISTRO  | https://release-monitoring.org/project/058442 | 1.8.3-1      | 2.2.0-1      |     
                   dahdi-linux |  DISTRO  | https://release-monitoring.org/project/021412 | 3.3.0        | 3.4.0        | ORPH
                   dahdi-tools |  DISTRO  | https://release-monitoring.org/project/010252 | 3.3.0        | 3.4.0        | ORPH
                          daq3 |  DISTRO  | https://release-monitoring.org/project/212345 | 3.0.27       | 3.0.28       |     
                        davici |  DISTRO  | https://release-monitoring.org/project/021340 | 1.4          | 1.6          | ORPH
                      dbus-cxx |  DISTRO  | https://release-monitoring.org/project/242464 | 2.5.2        | 2.6.2        |     
                     dbus-glib |  DISTRO  | https://release-monitoring.org/project/001979 | 0.114        | 0.116        | ORPH
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/015086 | 7.2.641      | 7.3.1        | ORPH
                   debianutils |  DISTRO  | https://release-monitoring.org/project/021341 | 4.11         | 5.24         | ORPH
                    dehydrated |  DISTRO  | https://release-monitoring.org/project/011312 | 0.7.1        | 0.7.2        |     
                         delve |  DISTRO  | https://release-monitoring.org/project/040149 | 1.22.1       | 1.27.2       |     
            desktop-file-utils |  DISTRO  | https://release-monitoring.org/project/000421 | 0.26         | 0.28         | ORPH
                      dhcpdump |  DISTRO  | https://release-monitoring.org/project/021415 | 1.9          | 2.00         | ORPH
                        dialog |  DISTRO  | https://release-monitoring.org/project/000431 | 1.3-20251001 | 1.3-20260721 | ORPH
                     ding-libs |  DISTRO  | https://release-monitoring.org/project/013710 | 0.6.2        | 0.7.0        |     
         distribution-registry |  DISTRO  | https://release-monitoring.org/project/378976 | v3.1.1       | 3.1.2        |     
                          dlib |  DISTRO  | https://release-monitoring.org/project/018600 | 19.24.9      | 20.0.1       |     
                    docker-cli |  DISTRO  | https://release-monitoring.org/project/021076 | 28.5.2       | 29.9.2       |     
             docker-cli-buildx |  DISTRO  | https://release-monitoring.org/project/325723 | 0.25.0       | 0.38.1       | ORPH
                docker-compose |  DISTRO  | https://release-monitoring.org/project/006185 | 2.40.3       | 5.6.1        |     
                 docker-engine |  DISTRO  | https://release-monitoring.org/project/000447 | 28.5.2       | 29.9.2       |     
                      dos2unix |  DISTRO  | https://release-monitoring.org/project/000453 | 7.5.5        | 7.5.7        |     
                       doxygen |  DISTRO  | https://release-monitoring.org/project/000457 | 1.16.1       | 1.18.0       | ORPH
                          dpdk |  DISTRO  | https://release-monitoring.org/project/000459 | 25.11.2      | 26.07        |     
                    drbd-utils |  DISTRO  | https://release-monitoring.org/project/389396 | 9.34.0       | 9.35.0       |     
                      drm-info |  DISTRO  | https://release-monitoring.org/project/299264 | 2.9.0        | 2.10.0       |     
                            dt |  DISTRO  | https://release-monitoring.org/project/021844 | 18.32        | 21.27        | ORPH
                           dtc |  DISTRO  | https://release-monitoring.org/project/016911 | 1.7.2        | 1.8.1        |     
                          dtui |  DISTRO  | https://release-monitoring.org/project/392526 | 3.0.0        | 3.1.0        |     
                      dump1090 |  DISTRO  | https://release-monitoring.org/project/231403 | 10.2         | 11.1         |     
                          dust |  DISTRO  | https://release-monitoring.org/project/141344 | 1.2.3        | 1.2.6        | ORPH
                      earlyoom |  DISTRO  | https://release-monitoring.org/project/017392 | 1.7          | 1.9.0        |     
                      easy-rsa |  DISTRO  | https://release-monitoring.org/project/017770 | 3.1.7        | 3.2.7        |     
                            ed |  DISTRO  | https://release-monitoring.org/project/000659 | 1.22.5       | 1.22.6       | ORPH
                      ejabberd |  DISTRO  | https://release-monitoring.org/project/000667 | 24.07        | 26.09.1      |     
                      elfutils |  DISTRO  | https://release-monitoring.org/project/005679 | 0.195        | 0.197        | ORPH
                       enchant |  DISTRO  | https://release-monitoring.org/project/006601 | 2.3.3        | 2.8.21       |     
                 enlightenment |  DISTRO  | https://release-monitoring.org/project/000698 | 0.25.4       | 0.27.1       |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/000707 | 26.2.5.21    | 29.1.2       |     
                   erlang-eimp |  DISTRO  | https://release-monitoring.org/project/017060 | 1.0.23       | 1.0.27       |     
                   erlang-jose |  DISTRO  | https://release-monitoring.org/project/016913 | 1.11.10      | 1.11.12      |     
                erlang-p1-acme |  DISTRO  | https://release-monitoring.org/project/045375 | 1.0.23       | 1.0.31       |     
           erlang-p1-cache-tab |  DISTRO  | https://release-monitoring.org/project/008757 | 1.0.31       | 1.0.34       |     
              erlang-p1-mqtree |  DISTRO  | https://release-monitoring.org/project/020220 | 1.0.17       | 1.0.20       |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/009302 | 0.6.14       | 1.0.12       |     
                 erlang-p1-sip |  DISTRO  | https://release-monitoring.org/project/010576 | 1.0.54       | 1.0.61       |     
          erlang-p1-stringprep |  DISTRO  | https://release-monitoring.org/project/009222 | 1.0.30       | 1.0.34       |     
                 erlang-p1-tls |  DISTRO  | https://release-monitoring.org/project/010455 | 1.1.21       | 1.1.26       |     
               erlang-p1-utils |  DISTRO  | https://release-monitoring.org/project/008643 | 1.0.26       | 1.0.29       |     
               erlang-p1-yconf |  DISTRO  | https://release-monitoring.org/project/045378 | 1.0.16       | 1.0.23       |     
                erlang-p1-zlib |  DISTRO  | https://release-monitoring.org/project/009283 | 1.0.13       | 1.0.16       |     
                   erofs-utils |  DISTRO  | https://release-monitoring.org/project/063188 | 1.8.10       | 1.9.4        |     
                      execline |  DISTRO  | https://release-monitoring.org/project/005482 | 2.9.6.1      | 2.10.0.0     |     
                        exempi |  DISTRO  | https://release-monitoring.org/project/000767 | 2.6.3        | 2.6.6        |     
                    exfatprogs |  DISTRO  | https://release-monitoring.org/project/094441 | 1.2.9        | 1.4.3        |     
                           eza |  DISTRO  | https://release-monitoring.org/project/369474 | 0.23.3       | 0.23.5       |     
                    f2fs-tools |  DISTRO  | https://release-monitoring.org/project/014689 | 1.16.0       | 1.17.0       |     
                         faad2 |  DISTRO  | https://release-monitoring.org/project/013755 | 2.11.2       | 2.11.4       |     
                      fail2ban |  DISTRO  | https://release-monitoring.org/project/006602 | 1.1.0        | 1.1.1        |     
                      fakeroot |  DISTRO  | https://release-monitoring.org/project/012048 | 1.37.2       | 2.1.4        | ORPH
                      faketime |  DISTRO  | https://release-monitoring.org/project/021348 | 0.9.12       | 0.9.13       | ORPH
                        fbterm |  DISTRO  | https://release-monitoring.org/project/008331 | 1.7.0        | 1.8          | ORPH
                          fcft |  DISTRO  | https://release-monitoring.org/project/143240 | 3.3.2        | 3.3.3        | ORPH
                            fd |  DISTRO  | https://release-monitoring.org/project/373722 | 10.3.0       | 10.5.0       |     
                       fdk-aac |  DISTRO  | https://release-monitoring.org/project/016208 | 2.0.3        | 3.0.0        |     
                        ffmpeg |  DISTRO  | https://release-monitoring.org/project/005405 | 7.0.3        | 9.0.2        |     
                   fftw-double |  DISTRO  | https://release-monitoring.org/project/000803 | 3.3.10       | 3.3.11       | ORPH
              fftw-long-double |  DISTRO  | https://release-monitoring.org/project/000803 | 3.3.10       | 3.3.11       | ORPH
                     fftw-quad |  DISTRO  | https://release-monitoring.org/project/000803 | 3.3.10       | 3.3.11       | ORPH
                   fftw-single |  DISTRO  | https://release-monitoring.org/project/000803 | 3.3.10       | 3.3.11       | ORPH
                          ficl |  DISTRO  | https://release-monitoring.org/project/021430 | 3.065        | 3065         |     
                          file |  DISTRO  | https://release-monitoring.org/project/000807 | 5.47         | 5.48         | ORPH
                     findutils |  DISTRO  | https://release-monitoring.org/project/000812 | 4.10.0       | 4.11.0       | ORPH
                           fio |  DISTRO  | https://release-monitoring.org/project/000806 | 3.42         | 3.43         |     
                  firmware-imx |  GUESS   | https://release-monitoring.org/project/390526 | 8.30         | 8.31         |     
                       flannel |  DISTRO  | https://release-monitoring.org/project/007421 | 0.26.0       | 0.28.10      |     
                    flare-game |  DISTRO  | https://release-monitoring.org/project/021434 | 1.14         | 1.15         |     
                      flashrom |  DISTRO  | https://release-monitoring.org/project/010202 | 1.7.0        | 1.8.0        |     
                        flatcc |  DISTRO  | https://release-monitoring.org/project/021350 | 0.6.1        | 0.6.4        |     
                          fltk |  DISTRO  | https://release-monitoring.org/project/000823 | 1.3.7        | 1.4.5        | ORPH
                    fluent-bit |  DISTRO  | https://release-monitoring.org/project/267335 | 5.1.2        | 5.1.5        |     
                    fluidsynth |  DISTRO  | https://release-monitoring.org/project/010437 | 2.5.7        | 2.6.1        |     
                       fmtools |  DISTRO  | https://release-monitoring.org/project/021435 | 2.0.7        | 2.0.8        | ORPH
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/000826 | 7.2.0        | 7.3.1        |     
                    fontconfig |  DISTRO  | https://release-monitoring.org/project/000827 | 2.17.1       | 2.18.3       | ORPH
                          foot |  DISTRO  | https://release-monitoring.org/project/141611 | 1.26.0       | 1.28.0       | ORPH
                         fping |  DISTRO  | https://release-monitoring.org/project/000834 | 5.4          | 5.5          |     
                      freeipmi |  DISTRO  | https://release-monitoring.org/project/000848 | 1.6.18       | 1.6.20       |     
                       freerdp |  DISTRO  | https://release-monitoring.org/project/010442 | 2.11.8       | 3.32.2       | ORPH
                      freetype |  DISTRO  | https://release-monitoring.org/project/000854 | 2.14.3       | 2.15.0       |     
                         ftxui |  DISTRO  | https://release-monitoring.org/project/373193 | 6.1.9        | 7.0.3        |     
                fuse-overlayfs |  DISTRO  | https://release-monitoring.org/project/101220 | 1.13         | 1.18         |     
                          fwup |  DISTRO  | https://release-monitoring.org/project/021438 | 1.9.1        | 1.17.1       |     
                         fwupd |  DISTRO  | https://release-monitoring.org/project/005833 | 2.0.4        | 2.1.9        |     
                           gcr |  DISTRO  | https://release-monitoring.org/project/011801 | 4.4.0.1      | 4.4.1        | ORPH
                          gdal |  DISTRO  | https://release-monitoring.org/project/000881 | 3.11.4       | 3.13.3       |     
                    gdk-pixbuf |  DISTRO  | https://release-monitoring.org/project/009533 | 2.42.12      | 2.44.8       | ORPH
                     genext2fs |  DISTRO  | https://release-monitoring.org/project/021440 | 1.6.2        | 1.6.3        |     
                     gengetopt |  DISTRO  | https://release-monitoring.org/project/000892 | 2.23         | 2.23.1       |     
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/000898 | 0.22.4       | 1.0          | ORPH
                        gflags |  DISTRO  | https://release-monitoring.org/project/008735 | 2.2.2        | 2.3.1        |     
                           git |  DISTRO  | https://release-monitoring.org/project/005350 | 2.54.0       | 2.56.0       |     
                     git-crypt |  DISTRO  | https://release-monitoring.org/project/017093 | 0.7.0        | 0.8.0        | ORPH
                 gitlab-runner |  DISTRO  | https://release-monitoring.org/project/011337 | 15.5.0       | 19.5.1       |     
               glib-networking |  DISTRO  | https://release-monitoring.org/project/021353 | 2.76.0       | 2.90.1       | ORPH
                        glibmm |  DISTRO  | https://release-monitoring.org/project/007960 | 2.76.0       | 2.90.0       |     
                    glibmm2_66 |  DISTRO  | https://release-monitoring.org/project/369440 | 2.66.8       | 2.66.10      |     
                           glm |  DISTRO  | https://release-monitoring.org/project/001181 | 1.0.1        | 1.0.3        | ORPH
                          glog |  DISTRO  | https://release-monitoring.org/project/008732 | 0.7.0        | 0.7.1        |     
            gmrender-resurrect |  DISTRO  | https://release-monitoring.org/project/021445 | 0.3          | 0.3.1        |     
                       gnuplot |  DISTRO  | https://release-monitoring.org/project/001216 | 6.0.4        | 6.0.6        |     
                     gocryptfs |  DISTRO  | https://release-monitoring.org/project/021085 | 2.3.2        | 2.6.1        |     
                       granite |  DISTRO  | https://release-monitoring.org/project/005410 | 6.2.0        | 7.8.1        | ORPH
                graphicsmagick |  DISTRO  | https://release-monitoring.org/project/001248 | 1.3.46       | 1.3.49       |     
                         grout |  DISTRO  | https://release-monitoring.org/project/375897 | 0.16.2       | 0.19.3       |     
                          grpc |  DISTRO  | https://release-monitoring.org/project/019117 | 1.83.1       | 1.84.1       |     
     gsettings-desktop-schemas |  DISTRO  | https://release-monitoring.org/project/013139 | 45.0         | 51.0         |     
                         gssdp |  DISTRO  | https://release-monitoring.org/project/001262 | 1.6.4        | 1.6.6        |     
                 gst1-devtools |  DISTRO  | https://release-monitoring.org/project/021856 | 1.24.13      | 1.28.8       | ORPH
                      gst1-imx |  DISTRO  | https://release-monitoring.org/project/021846 | 0.13.1       | 2.2.0        |     
                gst1-interpipe |  DISTRO  | https://release-monitoring.org/project/021847 | v1.1.8       | 1.1.10       | ORPH
                    gst1-libav |  DISTRO  | https://release-monitoring.org/project/021848 | 1.24.13      | 1.28.8       | ORPH
              gst1-plugins-bad |  DISTRO  | https://release-monitoring.org/project/021849 | 1.24.13      | 1.28.8       | ORPH
             gst1-plugins-base |  DISTRO  | https://release-monitoring.org/project/021850 | 1.24.13      | 1.28.8       | ORPH
             gst1-plugins-good |  DISTRO  | https://release-monitoring.org/project/021852 | 1.24.13      | 1.28.8       | ORPH
             gst1-plugins-ugly |  DISTRO  | https://release-monitoring.org/project/015187 | 1.24.13      | 1.28.8       | ORPH
                   gst1-python |  DISTRO  | https://release-monitoring.org/project/003881 | 1.24.13      | 1.28.8       | ORPH
              gst1-rtsp-server |  DISTRO  | https://release-monitoring.org/project/021853 | 1.24.13      | 1.28.8       | ORPH
                    gst1-shark |  DISTRO  | https://release-monitoring.org/project/021854 | v0.8.1       | 0.9.1        |     
                    gst1-vaapi |  DISTRO  | https://release-monitoring.org/project/021855 | 1.24.13      | 1.26.11      | ORPH
                          gstd |  DISTRO  | https://release-monitoring.org/project/235022 | 0.15.2       | 0.16.0       | ORPH
                    gstreamer1 |  DISTRO  | https://release-monitoring.org/project/001263 | 1.24.13      | 1.28.8       | ORPH
   gstreamer1-editing-services |  DISTRO  | https://release-monitoring.org/project/230920 | 1.24.13      | 1.28.8       | ORPH
                        gtkmm3 |  DISTRO  | https://release-monitoring.org/project/311572 | 3.24.10      | 3.24.11      |     
                 gtksourceview |  DISTRO  | https://release-monitoring.org/project/007724 | 5.18.0       | 5.22.0       |     
                  gumbo-parser |  DISTRO  | https://release-monitoring.org/project/214990 | 0.13.2       | 0.14.1       |     
                         gupnp |  DISTRO  | https://release-monitoring.org/project/001281 | 1.6.9        | 1.6.10       |     
                      gupnp-av |  DISTRO  | https://release-monitoring.org/project/001282 | 0.14.4       | 0.14.5       |     
                   gupnp-tools |  DISTRO  | https://release-monitoring.org/project/001284 | 0.12.2       | 0.12.4       |     
                    gutenprint |  DISTRO  | https://release-monitoring.org/project/001285 | 5.2.14       | 5.3.5        | ORPH
                          gvfs |  DISTRO  | https://release-monitoring.org/project/005496 | 1.57.2       | 1.62.0       | ORPH
                       haproxy |  DISTRO  | https://release-monitoring.org/project/001298 | 3.4.4        | 3.4.7        |     
                       haveged |  DISTRO  | https://release-monitoring.org/project/011695 | 1.9.21       | 1.9.27       |     
                       highway |  DISTRO  | https://release-monitoring.org/project/205809 | 1.3.0        | 1.4.0        |     
                       hiredis |  DISTRO  | https://release-monitoring.org/project/001318 | 1.3.0        | 1.5.0        |     
                         hplip |  DISTRO  | https://release-monitoring.org/project/001327 | 3.17.10      | 3.26.6       | ORPH
                          htop |  DISTRO  | https://release-monitoring.org/project/001332 | 3.5.1        | 3.5.3        |     
                       htpdate |  DISTRO  | https://release-monitoring.org/project/132187 | 2.0.1        | 2.0.2        |     
                         hwloc |  DISTRO  | https://release-monitoring.org/project/013501 | 2.12.2       | 2.15.0       |     
                          i2pd |  DISTRO  | https://release-monitoring.org/project/021355 | 2.61.0       | 3.0.0.1      |     
                           icu |  DISTRO  | https://release-monitoring.org/project/016134 | 78.2         | 79.1         | ORPH
                      ifupdown |  DISTRO  | https://release-monitoring.org/project/021673 | 0.8.44       | 0.8.45+nmu1  | ORPH
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/001372 | 7.1.2-26     | 7.1.2-34     | ORPH
                        imlib2 |  DISTRO  | https://release-monitoring.org/project/021676 | 1.12.5       | 1.12.7       |     
                 inotify-tools |  DISTRO  | https://release-monitoring.org/project/008864 | 3.20.2.2     | 4.26.270     | ORPH
                        iodine |  DISTRO  | https://release-monitoring.org/project/001386 | 0.8.0        | 0.9.0        | ORPH
                        ipcalc |  DISTRO  | https://release-monitoring.org/project/007555 | 1.0.3        | 1.2.0        | ORPH
                      ipmiutil |  DISTRO  | https://release-monitoring.org/project/001391 | 3.1.9        | 3.2.3        | ORPH
                      iproute2 |  DISTRO  | https://release-monitoring.org/project/001392 | 7.1.0        | 7.3.0        |     
                           isl |  DISTRO  | https://release-monitoring.org/project/013286 | 0.27         | 0.28         | ORPH
                 janus-gateway |  DISTRO  | https://release-monitoring.org/project/015715 | 1.4.1        | 1.4.3        |     
                      jemalloc |  DISTRO  | https://release-monitoring.org/project/001441 | 5.3.1        | 5.4.0        |     
                        jimtcl |  DISTRO  | https://release-monitoring.org/project/001459 | 0.83         | 0.84         |     
         jitterentropy-library |  DISTRO  | https://release-monitoring.org/project/029701 | 3.6.3        | 3.7.0        | ORPH
                           joe |  DISTRO  | https://release-monitoring.org/project/001467 | 4.6          | 4.8          | ORPH
                    jpeg-turbo |  DISTRO  | https://release-monitoring.org/project/001648 | 3.2.0        | 3.2.1        |     
                        json-c |  DISTRO  | https://release-monitoring.org/project/001477 | 0.18         | 0.19         |     
                    keepalived |  DISTRO  | https://release-monitoring.org/project/001504 | 2.2.8        | 2.4.3        |     
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/008762 | 5.116.0      | 6.31.0       |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/008762 | 5.116.0      | 6.31.0       |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/008762 | 5.116.0      | 6.31.0       |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/008762 | 5.116.0      | 6.31.0       |     
                  kompexsqlite |  DISTRO  | https://release-monitoring.org/project/021462 | 1.12.15      | 1.13.15      | ORPH
                   ksmbd-tools |  DISTRO  | https://release-monitoring.org/project/241856 | 3.5.2        | 3.5.7        |     
                       kvazaar |  DISTRO  | https://release-monitoring.org/project/012418 | 2.2.0        | 2.3.2        |     
                          kyua |  DISTRO  | https://release-monitoring.org/project/016901 | 0.13         | 0.15.1       | ORPH
                          lame |  DISTRO  | https://release-monitoring.org/project/012523 | 3.100        | 4.0          |     
                           lft |  DISTRO  | https://release-monitoring.org/project/021863 | 3.91         | 4.03         | ORPH
                   libapparmor |  DISTRO  | https://release-monitoring.org/project/094819 | 4.1.8        | 5.0.2        |     
                        libbpf |  DISTRO  | https://release-monitoring.org/project/141355 | 1.6.2        | 1.8.0        |     
                     libcamera |  DISTRO  | https://release-monitoring.org/project/301902 | v0.7.1       | 0.7.2        |     
                     libcap-ng |  DISTRO  | https://release-monitoring.org/project/001570 | 0.9.5        | 0.9.6        |     
                     libcgroup |  DISTRO  | https://release-monitoring.org/project/001575 | 2.0.3        | 3.2.0        | ORPH
                        libdex |  DISTRO  | https://release-monitoring.org/project/328356 | 1.0.0        | 1.2.0        |     
                       libdnet |  DISTRO  | https://release-monitoring.org/project/006308 | 1.18.0       | 1.18.2       | ORPH
                       libebml |  DISTRO  | https://release-monitoring.org/project/007879 | 1.4.5        | 1.4.7        |     
                      libecoli |  DISTRO  | https://release-monitoring.org/project/375859 | 0.11.3       | 0.11.8       |     
                      libevdev |  DISTRO  | https://release-monitoring.org/project/020540 | 1.13.5       | 1.14.0       |     
                   libfastjson |  DISTRO  | https://release-monitoring.org/project/012043 | 0.99.9.1     | 1.2609.0     |     
                         libfm |  DISTRO  | https://release-monitoring.org/project/008794 | 1.3.2        | 1.4.1        | ORPH
                   libfm-extra |  DISTRO  | https://release-monitoring.org/project/008794 | 1.3.2        | 1.4.1        | ORPH
                     libgcrypt |  DISTRO  | https://release-monitoring.org/project/001623 | 1.12.3       | 1.12.4       | ORPH
                       libgeos |  DISTRO  | https://release-monitoring.org/project/013493 | 3.14.1       | 3.15.0       |     
                       libglfw |  DISTRO  | https://release-monitoring.org/project/001180 | 3.4          | 3.5.1        | ORPH
                      libglib2 |  DISTRO  | https://release-monitoring.org/project/010024 | 2.88.4       | 2.90.1       |     
                      libgpgme |  DISTRO  | https://release-monitoring.org/project/001239 | 1.24.3       | 2.2.0        | ORPH
                      libgpiod |  GUESS   | https://release-monitoring.org/project/020640 | 1.6.5        | 2.3.1        | ORPH
                        libgsm |  DISTRO  | https://release-monitoring.org/project/012587 | 1.0.23       | 1.0.24       | ORPH
                       libgtk3 |  DISTRO  | https://release-monitoring.org/project/311549 | 3.24.51      | 3.24.52      |     
                       libgtk4 |  DISTRO  | https://release-monitoring.org/project/013942 | 4.21.0       | 4.24.1       | ORPH
                        libhtp |  DISTRO  | https://release-monitoring.org/project/001632 | 0.5.51       | 0.5.53       |     
                        libidn |  DISTRO  | https://release-monitoring.org/project/001639 | 1.43         | 1.44         |     
                   libiec61850 |  DISTRO  | https://release-monitoring.org/project/141617 | 1.6.1        | 1.6.2.1      |     
                        libiio |  DISTRO  | https://release-monitoring.org/project/015689 | 0.26         | 1.0.0        |     
                  libimxvpuapi |  DISTRO  | https://release-monitoring.org/project/021479 | 0.10.3       | 2.3.0        |     
                      libinput |  DISTRO  | https://release-monitoring.org/project/005781 | 1.31.3       | 1.32.0       | ORPH
                      libiscsi |  DISTRO  | https://release-monitoring.org/project/010862 | 1.20.0       | 1.20.3       | ORPH
                       libjcat |  DISTRO  | https://release-monitoring.org/project/229583 | 0.2.3        | 0.2.6        |     
                        libjxl |  DISTRO  | https://release-monitoring.org/project/232764 | 0.11.2       | 0.12.0       |     
                      libkcapi |  DISTRO  | https://release-monitoring.org/project/016828 | 1.5.0        | 1.5.1        |     
                     liblinear |  DISTRO  | https://release-monitoring.org/project/021363 | 2.49         | 250          |     
                    liblogging |  DISTRO  | https://release-monitoring.org/project/001654 | 1.0.6        | 1.0.8        | ORPH
                        libmad |  DISTRO  | https://release-monitoring.org/project/021487 | 0.15.1b      | 0.16.4       | ORPH
                   libmatroska |  DISTRO  | https://release-monitoring.org/project/001657 | 1.7.1        | 1.7.2        |     
                  libmaxminddb |  DISTRO  | https://release-monitoring.org/project/007470 | 1.10.0       | 1.14.1       |     
                         libmd |  DISTRO  | https://release-monitoring.org/project/015525 | 1.1.0        | 1.3.0        |     
                       libmdbx |  DISTRO  | https://release-monitoring.org/project/141559 | 0.13.6       | 0.14.4       |     
                     libmodbus |  DISTRO  | https://release-monitoring.org/project/009728 | 3.1.12       | 3.2.0        |     
                libmodsecurity |  DISTRO  | https://release-monitoring.org/project/068638 | 3.0.16       | 3.0.17       |     
                  libmpdclient |  DISTRO  | https://release-monitoring.org/project/021364 | 2.23         | 2.27         |     
                   libnetconf2 |  DISTRO  | https://release-monitoring.org/project/031639 | 3.7.10       | 4.6.4        |     
        libnetfilter_conntrack |  DISTRO  | https://release-monitoring.org/project/001675 | 1.0.9        | 1.1.1        |     
                        libnfs |  DISTRO  | https://release-monitoring.org/project/007325 | 7.0.1        | 8.0.0        | ORPH
                       libnice |  DISTRO  | https://release-monitoring.org/project/001683 | 0.1.21       | 0.1.24       |     
                       libnspr |  DISTRO  | https://release-monitoring.org/project/007953 | 4.39         | 4.40         |     
                        libodb |  DISTRO  | https://release-monitoring.org/project/001687 | 2.4.0        | 2.6.0        | ORPH
                  libodb-boost |  DISTRO  | https://release-monitoring.org/project/001688 | 2.4.0        | 2.6.0        |     
                  libodb-mysql |  DISTRO  | https://release-monitoring.org/project/001689 | 2.4.0        | 2.6.0        |     
                  libodb-pgsql |  DISTRO  | https://release-monitoring.org/project/001690 | 2.4.0        | 2.6.0        | ORPH
                   libopenh264 |  DISTRO  | https://release-monitoring.org/project/021365 | 2.6.0        | 2.7.0        |     
                    libopenmpt |  DISTRO  | https://release-monitoring.org/project/141468 | 0.7.13       | 0.8.9        |     
                    libopenssl |  DISTRO  | https://release-monitoring.org/project/002566 | 3.6.5        | 4.1.0        |     
                      libosip2 |  DISTRO  | https://release-monitoring.org/project/015135 | 5.3.1        | 5.3.2        |     
                     libostree |  DISTRO  | https://release-monitoring.org/project/010899 | 2023.8       | 2026.5       |     
                        libp11 |  DISTRO  | https://release-monitoring.org/project/001699 | 0.4.20       | 0.4.21       | ORPH
                       libpeas |  DISTRO  | https://release-monitoring.org/project/006871 | 1.32.0       | 2.2.1        | ORPH
                       libpfm4 |  DISTRO  | https://release-monitoring.org/project/021491 | 4.13.0       | 4.14.1       |     
                    libplacebo |  GUESS   | https://release-monitoring.org/project/020101 | v7.360.1     | 7.387.0      |     
                      libplist |  DISTRO  | https://release-monitoring.org/project/011675 | 2.7.0        | 2.8.0        | ORPH
                       libpqxx |  DISTRO  | https://release-monitoring.org/project/021367 | 7.10.7       | 8.0.2        |     
                        libpri |  DISTRO  | https://release-monitoring.org/project/011042 | 1.6.0        | 1.6.1        | ORPH
                         libqb |  DISTRO  | https://release-monitoring.org/project/009399 | 2.0.8        | 2.0.10       |     
                        libraw |  DISTRO  | https://release-monitoring.org/project/001709 | 0.21.4       | 0.22.2       |     
                       librelp |  DISTRO  | https://release-monitoring.org/project/001713 | 1.11.0       | 1.13.0       |     
                      libressl |  DISTRO  | https://release-monitoring.org/project/012102 | 4.3.4        | 4.4.0        | ORPH
                       librsvg |  DISTRO  | https://release-monitoring.org/project/005420 | 2.50.9       | 2.63.4       |     
                       librtas |  DISTRO  | https://release-monitoring.org/project/010717 | 2.0.5        | 2.0.7        | ORPH
                     libsecret |  DISTRO  | https://release-monitoring.org/project/013150 | 0.20.5       | 0.21.8.2     | ORPH
                    libselinux |  DISTRO  | https://release-monitoring.org/project/001717 | 3.10         | 3.11         |     
                   libsemanage |  DISTRO  | https://release-monitoring.org/project/001717 | 3.10         | 3.11         |     
                      libsepol |  DISTRO  | https://release-monitoring.org/project/001717 | 3.10         | 3.11         |     
                       libsigc |  DISTRO  | https://release-monitoring.org/project/007961 | 3.4.0        | 3.8.1        |     
                      libsigc2 |  DISTRO  | https://release-monitoring.org/project/311642 | 2.12.1       | 2.12.2       |     
                    libsigsegv |  DISTRO  | https://release-monitoring.org/project/001722 | 2.14         | 2.15         |     
                       libsolv |  DISTRO  | https://release-monitoring.org/project/007908 | 0.7.35       | 0.7.41       |     
                      libsoup3 |  DISTRO  | https://release-monitoring.org/project/011483 | 3.7.3        | 3.8.1        |     
               libspatialindex |  DISTRO  | https://release-monitoring.org/project/004864 | 1.9.3        | 2.1.0        |     
                       libspdm |  DISTRO  | https://release-monitoring.org/project/369161 | 3.8.2        | 3.8.3        |     
                       libsrtp |  DISTRO  | https://release-monitoring.org/project/018547 | 2.8.0        | 2.8.1        |     
                        libssh |  DISTRO  | https://release-monitoring.org/project/001729 | 0.12.1       | 0.12.2       | ORPH
                     libtalloc |  DISTRO  | https://release-monitoring.org/project/001733 | 2.4.4        | 2.5.0        |     
                       libtool |  DISTRO  | https://release-monitoring.org/project/001741 | 2.5.4        | 2.6.2        | ORPH
                    libtorrent |  DISTRO  | https://release-monitoring.org/project/001742 | 0.15.3       | 0.16.26      | ORPH
          libtorrent-rasterbar |  DISTRO  | https://release-monitoring.org/project/004166 | 2.1.1        | 2.1.2        |     
                 libtraceevent |  DISTRO  | https://release-monitoring.org/project/288159 | 1.8.7        | 1.9.1        |     
                    libtracefs |  DISTRO  | https://release-monitoring.org/project/288157 | 1.8.3        | 1.8.4        |     
                   libubootenv |  DISTRO  | https://release-monitoring.org/project/020618 | 0.3.7        | 0.3.8        |     
                        libucl |  DISTRO  | https://release-monitoring.org/project/021371 | 0.8.2        | 0.9.4        |     
                   libucontext |  DISTRO  | https://release-monitoring.org/project/017085 | 1.3.3        | 1.5.2        |     
                       libupnp |  DISTRO  | https://release-monitoring.org/project/021315 | 1.14.25      | 22.1.8       |     
                      libupnpp |  DISTRO  | https://release-monitoring.org/project/015849 | 1.0.3        | 1.0.4        | ORPH
                       liburcu |  DISTRO  | https://release-monitoring.org/project/007134 | 0.15.6       | 0.15.7       |     
                      liburing |  DISTRO  | https://release-monitoring.org/project/230185 | 2.12         | 2.15         |     
                       libvips |  DISTRO  | https://release-monitoring.org/project/005097 | 8.18.0       | 8.18.7       |     
                       libvirt |  DISTRO  | https://release-monitoring.org/project/013830 | 7.10.0       | 12.8.0       |     
                        libvpx |  DISTRO  | https://release-monitoring.org/project/011083 | 1.16.0       | 1.17.0       |     
                  libxkbcommon |  DISTRO  | https://release-monitoring.org/project/001780 | 1.9.2        | 1.13.2       |     
            libxml-parser-perl |  DISTRO  | https://release-monitoring.org/project/003531 | 2.47         | 2.59         |     
                       libxmlb |  GUESS   | https://release-monitoring.org/project/179028 | 0.3.27       | 0.3.29       |     
                      libxmlpp |  DISTRO  | https://release-monitoring.org/project/011129 | 5.2.0        | 5.6.1        | ORPH
                       libyang |  DISTRO  | https://release-monitoring.org/project/018554 | 3.13.6       | 6.4.13       |     
                   libyang-cpp |  DISTRO  | https://release-monitoring.org/project/388240 | 4            | 12           |     
                    libzenoh-c |  DISTRO  | https://release-monitoring.org/project/372354 | 1.2.1        | 1.10.1       |     
                 libzenoh-pico |  DISTRO  | https://release-monitoring.org/project/369957 | 1.2.1        | 1.10.1       |     
                        libzip |  DISTRO  | https://release-monitoring.org/project/010649 | 1.11.4       | 1.12.1       | ORPH
                          lilv |  DISTRO  | https://release-monitoring.org/project/001818 | 0.24.12      | 0.28.0       |     
                     linux-pam |  DISTRO  | https://release-monitoring.org/project/012244 | 1.7.2        | 1.7.3        | ORPH
                    liquid-dsp |  DISTRO  | https://release-monitoring.org/project/014535 | 1.6.0        | 1.8.3        |     
                       live555 |  DISTRO  | https://release-monitoring.org/project/012414 | 2025.10.13   | 2026.10.24   | ORPH
                  lksctp-tools |  DISTRO  | https://release-monitoring.org/project/021497 | 1.0.19       | 1.0.21       | ORPH
                         lldpd |  DISTRO  | https://release-monitoring.org/project/014019 | 1.0.22       | 1.0.23       | ORPH
                          lmdb |  DISTRO  | https://release-monitoring.org/project/006974 | 0.9.35       | 1.0.3        | ORPH
                lockfile-progs |  DISTRO  | https://release-monitoring.org/project/010135 | 0.1.19       | 0.2.0        | ORPH
                     log4cplus |  DISTRO  | https://release-monitoring.org/project/001835 | 2.1.0        | 2.2.0.1      | ORPH
                       log4cpp |  DISTRO  | https://release-monitoring.org/project/021499 | 1.1.4        | 1.1.6        |     
                       log4cxx |  DISTRO  | https://release-monitoring.org/project/015330 | 1.7.0        | 1.8.0        |     
                        log4qt |  DISTRO  | https://release-monitoring.org/project/180409 | 1.5.1        | 2.0.1        |     
                          lpty |  DISTRO  | https://release-monitoring.org/project/011671 | 1.0.1-1      | 1.2.2        |     
                         lrzip |  DISTRO  | https://release-monitoring.org/project/001842 | 0.651        | 0.660        |     
                          lsof |  DISTRO  | https://release-monitoring.org/project/001844 | 4.99.6       | 4.99.7       | ORPH
                        lsscsi |  DISTRO  | https://release-monitoring.org/project/001845 | 0.32         | 0.33         |     
                 ltp-testsuite |  DISTRO  | https://release-monitoring.org/project/021502 | 20260529     | 20260930     |     
              lttng-babeltrace |  DISTRO  | https://release-monitoring.org/project/000155 | 1.5.7        | 1.5.11       |     
                           lua |  DISTRO  | https://release-monitoring.org/project/001847 | 5.1.5        | 5.5.1        |     
                     lua-lyaml |  DISTRO  | https://release-monitoring.org/project/011733 | 6.2.9        | 6.2.10       |     
                lua-resty-http |  DISTRO  | https://release-monitoring.org/project/013887 | 0.15-0       | 0.18.0       |     
                      lua-zlib |  GUESS   | https://release-monitoring.org/project/380938 | 1.3-0        | 1.4          |     
                      luaposix |  DISTRO  | https://release-monitoring.org/project/011729 | 37.0         | 38           |     
                      luarocks |  DISTRO  | https://release-monitoring.org/project/001856 | 3.12.2       | 3.13.0       |     
                         lutok |  DISTRO  | https://release-monitoring.org/project/021509 | 0.4          | 0.6.3        | ORPH
                           luv |  DISTRO  | https://release-monitoring.org/project/021510 | 1.52.1-0     | 1.53.0-0     | ORPH
                          lvm2 |  DISTRO  | https://release-monitoring.org/project/005354 | 2.03.31      | 2.03.43      | ORPH
                           lxc |  DISTRO  | https://release-monitoring.org/project/001860 | 6.0.6        | 7.0.0        |     
                          lynx |  DISTRO  | https://release-monitoring.org/project/001863 | 2.9.2        | 2.9.3        |     
                         lzlib |  DISTRO  | https://release-monitoring.org/project/021513 | 0.4.1.53-4   | 0.4.3        |     
                    lzma-alone |  DISTRO  | https://release-monitoring.org/project/145824 | 9.22         | 26.01        | ORPH
                  makedumpfile |  DISTRO  | https://release-monitoring.org/project/131396 | 1.7.8        | 1.7.9        |     
                       mariadb |  DISTRO  | https://release-monitoring.org/project/001887 | 10.11.18     | 13.1.1       |     
              matchbox-desktop |  DISTRO  | https://release-monitoring.org/project/235369 | 0.9.1        | 2.0          | ORPH
                         matio |  DISTRO  | https://release-monitoring.org/project/001893 | 1.5.26       | 1.5.30       |     
                          mawk |  DISTRO  | https://release-monitoring.org/project/001953 | 1.3.4-202... | 1.3.4-202... |     
                       mbedtls |  DISTRO  | https://release-monitoring.org/project/013824 | 3.6.7        | 4.2.0        |     
                        mbpoll |  DISTRO  | https://release-monitoring.org/project/368619 | 1.5.2        | 1.5.4        |     
                       mbuffer |  DISTRO  | https://release-monitoring.org/project/015518 | 20220418     | 20261015     |     
                        mcelog |  DISTRO  | https://release-monitoring.org/project/008093 | 210          | 212          |     
                         mdevd |  DISTRO  | https://release-monitoring.org/project/016553 | 0.1.6.5      | 0.1.8.2      |     
                     memtest86 |  DISTRO  | https://release-monitoring.org/project/001966 | 8.00         | 9.00         |     
               mender-artifact |  DISTRO  | https://release-monitoring.org/project/020630 | 4.4.1        | 4.4.2        |     
                    menu-cache |  DISTRO  | https://release-monitoring.org/project/001968 | 1.1.0        | 1.1.1        | ORPH
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/021519 | 0.02         | 2.8.0        |     
                            mg |  DISTRO  | https://release-monitoring.org/project/131079 | 4.4          | 4.5          |     
microchip-hss-payload-gener... |  DISTRO  | https://release-monitoring.org/project/368767 | 2024.06      | 2026.04.1    |     
                   micropython |  DISTRO  | https://release-monitoring.org/project/010539 | 1.28.0       | 1.29.0       |     
                      minetest |  DISTRO  | https://release-monitoring.org/project/001978 | 5.6.1        | 5.17.0       |     
                 minetest-game |  DISTRO  | https://release-monitoring.org/project/021522 | 5.6.1        | 5.8.0        |     
                       minizip |  DISTRO  | https://release-monitoring.org/project/301509 | 4.0.3        | 4.2.2        |     
                        moarvm |  DISTRO  | https://release-monitoring.org/project/021100 | 2024.12      | 2026.09      |     
                 moby-buildkit |  DISTRO  | https://release-monitoring.org/project/020836 | 0.11.6       | 0.34.1       |     
                  modsecurity2 |  DISTRO  | https://release-monitoring.org/project/068638 | 2.9.12       | 3.0.17       |     
                          mono |  DISTRO  | https://release-monitoring.org/project/006360 | 6.12.0.182   | 6.14.1       |     
                           mpv |  DISTRO  | https://release-monitoring.org/project/005348 | 0.40.0       | 0.41.0       |     
                       msgpack |  DISTRO  | https://release-monitoring.org/project/012278 | 7.0.0        | 9.0.0        |     
                         msmtp |  DISTRO  | https://release-monitoring.org/project/002024 | 1.8.32       | 1.8.34       |     
                           mtr |  DISTRO  | https://release-monitoring.org/project/002029 | 0.95         | 0.96         | ORPH
                      multicat |  DISTRO  | https://release-monitoring.org/project/021734 | 2.3          | 2.4          | ORPH
               multipath-tools |  DISTRO  | https://release-monitoring.org/project/000424 | 0.9.8        | 0.15.1       |     
                         mupdf |  DISTRO  | https://release-monitoring.org/project/002034 | 1.23.9       | 1.28.5       |     
                          mutt |  DISTRO  | https://release-monitoring.org/project/002035 | 2.4.1        | 2.4.3        |     
                          mxml |  DISTRO  | https://release-monitoring.org/project/013545 | 3.3.1        | 4.0.6        |     
                       mxt-app |  DISTRO  | https://release-monitoring.org/project/373381 | 1.45         | 1.53         |     
                          nano |  DISTRO  | https://release-monitoring.org/project/002046 | 9.2          | 9.3          | ORPH
                       nanomsg |  DISTRO  | https://release-monitoring.org/project/014540 | 1.2.2        | 1.3.0        |     
                          nasm |  DISTRO  | https://release-monitoring.org/project/002048 | 2.16.03      | 3.02         | ORPH
                           nbd |  DISTRO  | https://release-monitoring.org/project/002052 | 3.26.1       | 3.27.1       | ORPH
                          ncdu |  DISTRO  | https://release-monitoring.org/project/006045 | 1.22         | 2.12.0       |     
                         ncmpc |  DISTRO  | https://release-monitoring.org/project/002055 | 0.52         | 0.54         |     
                       ncurses |  DISTRO  | https://release-monitoring.org/project/002057 | 6.6-20251231 | 6.6-20261024 | ORPH
                        ndisc6 |  DISTRO  | https://release-monitoring.org/project/021531 | 1.0.7        | 1.0.9        | ORPH
                         neard |  DISTRO  | https://release-monitoring.org/project/021866 | 0.19         | 0.20         |     
                       nerdctl |  DISTRO  | https://release-monitoring.org/project/242901 | 1.7.3        | 2.4.1        |     
                      netavark |  DISTRO  | https://release-monitoring.org/project/242639 | v1.17.1      | 2.1.0        | ORPH
                netcat-openbsd |  DISTRO  | https://release-monitoring.org/project/021534 | 1.234        | 1.239        | ORPH
                       netdata |  DISTRO  | https://release-monitoring.org/project/011046 | 1.37.1       | 2.12.2       |     
                       nethogs |  DISTRO  | https://release-monitoring.org/project/002065 | 0.8.8        | 0.9.0        |     
                       netifrc |  DISTRO  | https://release-monitoring.org/project/021917 | 0.7.3        | 0.7.14       |     
                     netopeer2 |  DISTRO  | https://release-monitoring.org/project/114978 | 2.4.5        | 2.8.21       |     
                       netsurf |  DISTRO  | https://release-monitoring.org/project/005386 | 3.10         | 3.11         | ORPH
                       nettest |  DISTRO  | https://release-monitoring.org/project/392517 | 2.1.3        | 2.2.0        |     
                        nettle |  DISTRO  | https://release-monitoring.org/project/002073 | 3.10.2       | 4.0          | ORPH
       network-manager-openvpn |  DISTRO  | https://release-monitoring.org/project/069977 | 1.12.0       | 1.12.5       |     
                        ngircd |  DISTRO  | https://release-monitoring.org/project/002083 | 26.1         | 28           | ORPH
                           nnn |  DISTRO  | https://release-monitoring.org/project/017080 | 5.1          | 5.3          |     
                    nodejs-bin |  DISTRO  | https://release-monitoring.org/project/008251 | 22.23.4      | 26.12.1      |     
                    nodejs-src |  DISTRO  | https://release-monitoring.org/project/008251 | 22.23.4      | 26.12.1      |     
                          noip |  DISTRO  | https://release-monitoring.org/project/021539 | 2.1.9        | 3.3.0        | ORPH
                          norm |  DISTRO  | https://release-monitoring.org/project/021540 | 1.5.8        | 1.5.9        | ORPH
                         nqptp |  DISTRO  | https://release-monitoring.org/project/293307 | 1.2.4        | 1.2.9        |     
                       ntfs-3g |  DISTRO  | https://release-monitoring.org/project/002504 | 2026.7.7     | 2026.9.28    | ORPH
                       nushell |  DISTRO  | https://release-monitoring.org/project/031106 | 0.108.0      | 0.116.1      | ORPH
                 nvidia-driver |  GUESS   | https://release-monitoring.org/project/021843 | 390.151      | 390.157      | ORPH
               nvidia-modprobe |  DISTRO  | https://release-monitoring.org/project/141657 | 450.57       | 615.78.08    | ORPH
           nvidia-persistenced |  DISTRO  | https://release-monitoring.org/project/369496 | 580.95.05    | 615.78.08    |     
                          nvme |  DISTRO  | https://release-monitoring.org/project/009074 | 2.15         | 3.1          | ORPH
                  oath-toolkit |  DISTRO  | https://release-monitoring.org/project/002515 | 2.6.14       | 2.6.15       |     
                        octave |  DISTRO  | https://release-monitoring.org/project/002528 | 11.1.0       | 11.3.0       |     
                           odb |  DISTRO  | https://release-monitoring.org/project/002531 | 2.4.0        | 2.6.0        | ORPH
                         ofono |  DISTRO  | https://release-monitoring.org/project/016859 | 2.18         | 2.19         |     
                          ogre |  DISTRO  | https://release-monitoring.org/project/033334 | v14.4.1      | 14.6.2       |     
                    open-iscsi |  DISTRO  | https://release-monitoring.org/project/010861 | 2.1.9        | 2.1.13       |     
                     open-isns |  DISTRO  | https://release-monitoring.org/project/009393 | 0.102        | 0.103        |     
                     open-lldp |  DISTRO  | https://release-monitoring.org/project/115714 | 1.1.1        | 1.2.0        |     
                     open62541 |  DISTRO  | https://release-monitoring.org/project/016896 | v1.3.15      | 1.5.9        | ORPH
                        openal |  DISTRO  | https://release-monitoring.org/project/008172 | 1.24.3       | 1.25.2       | ORPH
                  opencl-clhpp |  DISTRO  | https://release-monitoring.org/project/271141 | 2025.07.22   | 2026.05.29   |     
                opencl-headers |  DISTRO  | https://release-monitoring.org/project/223257 | 2025.07.22   | 2026.05.29   |     
             opencl-icd-loader |  DISTRO  | https://release-monitoring.org/project/378666 | 2025.07.22   | 2026.05.29   |     
                  opencore-amr |  DISTRO  | https://release-monitoring.org/project/021548 | 0.1.5        | 0.1.6        | ORPH
                       opencsd |  DISTRO  | https://release-monitoring.org/project/368613 | 1.8.1        | 1.8.3        |     
                       opencv4 |  DISTRO  | https://release-monitoring.org/project/006615 | 4.14.0       | 5.0.0        |     
                openfpgaloader |  DISTRO  | https://release-monitoring.org/project/241709 | 1.1.1        | 1.2.0        |     
                      openipmi |  DISTRO  | https://release-monitoring.org/project/002549 | 2.0.36       | 2.0.37       | ORPH
                      openldap |  DISTRO  | https://release-monitoring.org/project/002551 | 2.6.14       | 2.7.2        |     
                       openmpi |  DISTRO  | https://release-monitoring.org/project/002554 | 4.1.8        | 5.0.11       |     
                        openrc |  DISTRO  | https://release-monitoring.org/project/011687 | 0.56         | 0.64.1       |     
                    openresolv |  DISTRO  | https://release-monitoring.org/project/021551 | 3.13.2       | 3.17.4       | ORPH
                      openscap |  DISTRO  | https://release-monitoring.org/project/015641 | 1.4.5        | 1.4.6        |     
                          opkg |  DISTRO  | https://release-monitoring.org/project/059397 | 0.7.0        | 0.9.0        | ORPH
                           orc |  DISTRO  | https://release-monitoring.org/project/002573 | 0.4.41       | 0.4.44       | ORPH
                 paho-mqtt-cpp |  DISTRO  | https://release-monitoring.org/project/021376 | 1.3.2        | 1.6.0        |     
                        pahole |  DISTRO  | https://release-monitoring.org/project/231624 | 1.31         | 1.32         |     
                          palo |  GUESS   | https://release-monitoring.org/project/389410 | 2.29         | 2.30         |     
                         pango |  DISTRO  | https://release-monitoring.org/project/011783 | 1.58.0       | 1.58.2       | ORPH
                       pangomm |  DISTRO  | https://release-monitoring.org/project/007958 | 2.50.1       | 2.58.0       |     
                   pangomm2_46 |  DISTRO  | https://release-monitoring.org/project/369412 | 2.46.4       | 2.46.5       |     
                    parprouted |  DISTRO  | https://release-monitoring.org/project/010309 | 0.7          | 0.65         | ORPH
                        parsec |  DISTRO  | https://release-monitoring.org/project/183223 | 1.4.1        | 1.5.0        |     
                         patch |  DISTRO  | https://release-monitoring.org/project/002597 | 2.7.6        | 2.8          | ORPH
                      patchelf |  DISTRO  | https://release-monitoring.org/project/002598 | 0.13         | 0.19.2       | ORPH
                     pax-utils |  DISTRO  | https://release-monitoring.org/project/002601 | 1.3.7        | 1.3.11       | ORPH
                       pcmanfm |  DISTRO  | https://release-monitoring.org/project/002607 | 1.3.2        | 1.4.0        |     
                     pcsc-lite |  DISTRO  | https://release-monitoring.org/project/002611 | 2.5.2        | 2.5.3        | ORPH
                          pdbg |  DISTRO  | https://release-monitoring.org/project/021378 | 3.5          | 3.6          |     
                      perftest |  DISTRO  | https://release-monitoring.org/project/017223 | 26.01.5      | 26.07.8      |     
                          perl |  DISTRO  | https://release-monitoring.org/project/013599 | 5.42.3       | 5.44.0       |     
              perl-cgi-session |  DISTRO  | https://release-monitoring.org/project/011821 | 4.48         | 4.49         |     
                perl-crypt-cbc |  DISTRO  | https://release-monitoring.org/project/011930 | 2.33         | 3.07         |     
        perl-crypt-openssl-aes |  DISTRO  | https://release-monitoring.org/project/002743 | 0.02         | 0.23         |     
        perl-crypt-openssl-rsa |  DISTRO  | https://release-monitoring.org/project/002748 | 0.33         | 0.41         |     
             perl-data-optlist |  DISTRO  | https://release-monitoring.org/project/002769 | 0.114        | 0.115        |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/002807 | 4.046        | 5.014        |     
                      perl-dbi |  DISTRO  | https://release-monitoring.org/project/002811 | 1.643        | 1.656        |     
                       perl-gd |  DISTRO  | https://release-monitoring.org/project/012660 | 2.77         | 2.91         |     
           perl-image-exiftool |  DISTRO  | https://release-monitoring.org/project/006175 | 12.50        | 13.59        |     
            perl-io-socket-ssl |  DISTRO  | https://release-monitoring.org/project/006569 | 2.080        | 2.099        |     
               perl-mime-tools |  DISTRO  | https://release-monitoring.org/project/011809 | 5.519        | 5.520        |     
              perl-mojolicious |  DISTRO  | https://release-monitoring.org/project/005966 | 9.49         | 9.53         |     
               perl-mozilla-ca |  DISTRO  | https://release-monitoring.org/project/003136 | 20260813     | 20261020     |     
                    perl-plack |  DISTRO  | https://release-monitoring.org/project/006578 | 1.0054       | 1.0057       |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/014338 | 0.52         | 0.61         |     
           perl-time-parsedate |  DISTRO  | https://release-monitoring.org/project/003469 | 2026.033     | 2026.0219    |     
                      perl-uri |  DISTRO  | https://release-monitoring.org/project/003485 | 5.37         | 5.40         |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/003527 | 2.0134       | 2.0213       |     
                      php-apcu |  DISTRO  | https://release-monitoring.org/project/011010 | 5.1.27       | 5.1.28       |     
                       php-pam |  DISTRO  | https://release-monitoring.org/project/241707 | 2.2.4        | 3.0.0        |     
                      php-ssh2 |  DISTRO  | https://release-monitoring.org/project/021742 | 1.4          | 1.5.0        | ORPH
                    php-xdebug |  DISTRO  | https://release-monitoring.org/project/013302 | 3.5.0        | 3.5.3        |     
                      pico-sdk |  DISTRO  | https://release-monitoring.org/project/373461 | 2.3.0        | 2.3.1        |     
                      picotool |  DISTRO  | https://release-monitoring.org/project/373463 | 2.3.0        | 2.3.1        |     
                      pinentry |  DISTRO  | https://release-monitoring.org/project/003643 | 1.3.2        | 1.3.3        | ORPH
                      pipewire |  DISTRO  | https://release-monitoring.org/project/057357 | 1.6.6        | 1.6.10       |     
                       pkgconf |  DISTRO  | https://release-monitoring.org/project/012753 | 2.3.0        | 3.0.10       | ORPH
                      pngquant |  DISTRO  | https://release-monitoring.org/project/003674 | 2.18.0       | 3.0.3        |     
                          poco |  DISTRO  | https://release-monitoring.org/project/005418 | 1.15.3       | 1.15.4       |     
                        podman |  DISTRO  | https://release-monitoring.org/project/093284 | v5.7.0       | 6.1.4        | ORPH
                          poke |  DISTRO  | https://release-monitoring.org/project/179926 | 3.0          | 5.0          | ORPH
               policycoreutils |  DISTRO  | https://release-monitoring.org/project/001717 | 3.10         | 3.11         | ORPH
                        polkit |  DISTRO  | https://release-monitoring.org/project/003682 | 126          | 128          |     
                       poppler |  DISTRO  | https://release-monitoring.org/project/003686 | 25.10.0      | 26.10.0      |     
                         pound |  DISTRO  | https://release-monitoring.org/project/005436 | 4.17         | 4.23         | ORPH
                 powerpc-utils |  DISTRO  | https://release-monitoring.org/project/010715 | 1.3.13       | 1.3.14       | ORPH
                      powertop |  DISTRO  | https://release-monitoring.org/project/003702 | 2.15         | 2.16.1       |     
                          pppd |  DISTRO  | https://release-monitoring.org/project/003703 | 2.5.3        | 2.5.4        |     
                     procps-ng |  DISTRO  | https://release-monitoring.org/project/003708 | 4.0.6        | 4.0.7        | ORPH
                         procs |  DISTRO  | https://release-monitoring.org/project/076458 | 0.14.10      | 0.14.12      |     
                       prosody |  DISTRO  | https://release-monitoring.org/project/003709 | 0.11.14      | 13.0.7       |     
                proxychains-ng |  DISTRO  | https://release-monitoring.org/project/006499 | 4.16         | 4.17         | ORPH
          pru-software-support |  DISTRO  | https://release-monitoring.org/project/021825 | 6.0.1        | 6.5.0        |     
                          ptpd |  GUESS   | https://release-monitoring.org/project/003726 | 1.1.0        | 2.3.1        | ORPH
                            pv |  DISTRO  | https://release-monitoring.org/project/003736 | 1.10.5       | 1.12.0       |     
        python-aiohttp-remotes |  DISTRO  | https://release-monitoring.org/project/021248 | 1.3.0        | 1.4.0        |     
                  python-anyio |  DISTRO  | https://release-monitoring.org/project/049275 | 4.13.0       | 4.15.1       |     
   python-argon2-cffi-bindings |  DISTRO  | https://release-monitoring.org/project/241938 | 25.1.0       | 26.1.0       |     
              python-bitstring |  DISTRO  | https://release-monitoring.org/project/014665 | 4.4.0        | 5.0.0        |     
                python-bsdiff4 |  DISTRO  | https://release-monitoring.org/project/044268 | 1.3.1        | 1.3.2        |     
             python-cachetools |  DISTRO  | https://release-monitoring.org/project/007022 | 7.2.4        | 7.2.5        |     
                python-cheetah |  DISTRO  | https://release-monitoring.org/project/013246 | 3.2.6.post2  | 3.4.0        |     
                 python-django |  DISTRO  | https://release-monitoring.org/project/003828 | 6.0.6        | 6.1.2        |     
              python-dnspython |  DISTRO  | https://release-monitoring.org/project/013190 | 2.8.0        | 2.9.0        |     
                python-esptool |  DISTRO  | https://release-monitoring.org/project/011619 | 5.4.0        | 5.6.0        |     
            python-flatbuffers |  DISTRO  | https://release-monitoring.org/project/085010 | 25.9.23      | 25.12.19     |     
              python-flit-core |  DISTRO  | https://release-monitoring.org/project/044841 | 3.12.0       | 4.1.0        |     
                python-glslang |  DISTRO  | https://release-monitoring.org/project/205796 | 16.1.0       | 16.6.0       |     
                 python-hwdata |  DISTRO  | https://release-monitoring.org/project/011771 | 2.4.1        | 2.4.3-1      |     
             python-jsonmodels |  DISTRO  | https://release-monitoring.org/project/019849 | 2.8.0        | 2.9.0        |     
                python-libyang |  DISTRO  | https://release-monitoring.org/project/035917 | 3.3.0        | 5.1.0        |     
             python-matplotlib |  DISTRO  | https://release-monitoring.org/project/003919 | 3.10.9       | 3.11.2       |     
                 python-memray |  DISTRO  | https://release-monitoring.org/project/267110 | 1.19.1       | 1.20.0       |     
              python-ml-dtypes |  DISTRO  | https://release-monitoring.org/project/330555 | 0.5.4        | 0.6.0        |     
         python-more-itertools |  DISTRO  | https://release-monitoring.org/project/012201 | 11.1.0       | 11.2.1       |     
                   python-mpd2 |  DISTRO  | https://release-monitoring.org/project/019721 | 3.1.1        | 3.1.2        |     
              python-multidict |  DISTRO  | https://release-monitoring.org/project/011132 | 7.2.0        | 7.2.1        |     
                   python-mypy |  DISTRO  | https://release-monitoring.org/project/008453 | 1.19.1       | 2.4.0        |     
                  python-numpy |  DISTRO  | https://release-monitoring.org/project/002509 | 2.4.0        | 2.5.4        |     
              python-periphery |  DISTRO  | https://release-monitoring.org/project/021705 | 2.4.2        | 2.4.3        |     
                 python-pillow |  DISTRO  | https://release-monitoring.org/project/007974 | 12.3.0       | 13.0.0       |     
                  python-pydal |  DISTRO  | https://release-monitoring.org/project/021582 | 20260520.0   | 20260818.1   |     
                  python-pyicu |  DISTRO  | https://release-monitoring.org/project/012004 | 2.16.2       | 2.17         |     
                  python-pylru |  DISTRO  | https://release-monitoring.org/project/021584 | 1.3.2        | 1.3.3        |     
                python-pymupdf |  DISTRO  | https://release-monitoring.org/project/017320 | 1.23.22      | 2.0          |     
                  python-pypng |  DISTRO  | https://release-monitoring.org/project/006706 | 0.20220715.0 | 0.20250521.0 |     
                  python-pyqt5 |  DISTRO  | https://release-monitoring.org/project/020104 | 5.15.6       | 5.15.11      |     
         python-pytest-asyncio |  DISTRO  | https://release-monitoring.org/project/007273 | 1.4.0        | 1.4.1        |     
                  python-pyzmq |  DISTRO  | https://release-monitoring.org/project/004104 | 25.1.2       | 27.2.0       |     
                  python-scipy |  DISTRO  | https://release-monitoring.org/project/004768 | 1.17.1       | 1.18.1       |     
             python-sentry-sdk |  DISTRO  | https://release-monitoring.org/project/021603 | 2.73.0       | 3.0.0b1      |     
                    python-sip |  DISTRO  | https://release-monitoring.org/project/013626 | 4.19.25      | 6.17.1       |     
                 python-smmap2 |  DISTRO  | https://release-monitoring.org/project/012729 | 5.0.3        | 6.0.0        |     
                python-systemd |  DISTRO  | https://release-monitoring.org/project/007314 | 235          | 236          |     
                python-tempora |  DISTRO  | https://release-monitoring.org/project/021225 | 5.8.1        | 5.13.0       |     
               python-uv-build |  DISTRO  | https://release-monitoring.org/project/377550 | 0.12.23      | 0.13.5       |     
                 python-web2py |  DISTRO  | https://release-monitoring.org/project/020617 | v3.1.1       | 3.3.3        |     
                  python-zlmdb |  DISTRO  | https://release-monitoring.org/project/066674 | 23.1.1       | 26.10.1      |     
                       python3 |  DISTRO  | https://release-monitoring.org/project/013254 | 3.14.9       | 3.15.1       |     
                    qbee-agent |  DISTRO  | https://release-monitoring.org/project/372328 | 2026.27      | 2026.41      |     
          qcom-db410c-firmware |  DISTRO  | https://release-monitoring.org/project/235382 | 1034.2.1     | 1036.1       |     
                          qemu |  DISTRO  | https://release-monitoring.org/project/013607 | 11.0.0       | 11.1.2       |     
                         qlibc |  DISTRO  | https://release-monitoring.org/project/021737 | 2.4.7        | 2.5.1        | ORPH
               qoriq-mc-binary |  DISTRO  | https://release-monitoring.org/project/377827 | 10.39.0      | 10.300.138   |     
                qoriq-mc-utils |  DISTRO  | https://release-monitoring.org/project/377824 | 10.39.0      | 10.40.0      |     
                          qpdf |  DISTRO  | https://release-monitoring.org/project/005542 | 12.3.2       | 12.4.2       |     
                   qpid-proton |  DISTRO  | https://release-monitoring.org/project/015198 | 0.40.0       | 0.41.1       |     
                       qt5coap |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.12.0       |     
                        qt5knx |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.12.0       |     
                       qt5mqtt |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.12.0       |     
                      qt5opcua |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.2       | 6.12.0       |     
                  qt5webengine |  DISTRO  | https://release-monitoring.org/project/007927 | 5.15.18      | 6.12.0       |     
                       qt6base |  DISTRO  | https://release-monitoring.org/project/007927 | 6.11.2       | 6.12.0       |     
                qt6core5compat |  DISTRO  | https://release-monitoring.org/project/007927 | 6.11.2       | 6.12.0       |     
                       qt6grpc |  DISTRO  | https://release-monitoring.org/project/007927 | 6.11.2       | 6.12.0       |     
                       qt6mqtt |  DISTRO  | https://release-monitoring.org/project/242923 | 6.11.2       | 6.12.0       |     
                qt6positioning |  DISTRO  | https://release-monitoring.org/project/007927 | 6.11.2       | 6.12.0       |     
                  qt6serialbus |  DISTRO  | https://release-monitoring.org/project/007927 | 6.11.2       | 6.12.0       |     
                 qt6serialport |  DISTRO  | https://release-monitoring.org/project/007927 | 6.11.2       | 6.12.0       |     
                        qt6svg |  DISTRO  | https://release-monitoring.org/project/007927 | 6.11.2       | 6.12.0       |     
                     quotatool |  DISTRO  | https://release-monitoring.org/project/004146 | 1.6.4        | 1.8.0        | ORPH
                    rabbitmq-c |  DISTRO  | https://release-monitoring.org/project/013768 | 0.14.0       | 0.18.1       |     
                         ragel |  DISTRO  | https://release-monitoring.org/project/012105 | 6.10         | 7.0.4        | ORPH
                     rasdaemon |  DISTRO  | https://release-monitoring.org/project/377958 | 0.8.4        | 1.0.0        |     
           raspberrypi-usbboot |  DISTRO  | https://release-monitoring.org/project/115700 | 20250227-... | 20261002-... | ORPH
                     rdma-core |  DISTRO  | https://release-monitoring.org/project/012907 | 62.0         | 65.0         |     
                     refpolicy |  DISTRO  | https://release-monitoring.org/project/021663 | 2.20250923   | 2.20260922   |     
                        reproc |  DISTRO  | https://release-monitoring.org/project/151400 | 14.2.4       | 14.2.8       |     
                   restorecond |  DISTRO  | https://release-monitoring.org/project/001717 | 3.10         | 3.11         | ORPH
                         rhash |  DISTRO  | https://release-monitoring.org/project/013843 | 1.4.4        | 1.4.6        | ORPH
                       ripgrep |  DISTRO  | https://release-monitoring.org/project/015461 | 14.1.1       | 15.2.0       |     
                        rlwrap |  DISTRO  | https://release-monitoring.org/project/004199 | 0.46.1       | 0.48         |     
                       rocksdb |  DISTRO  | https://release-monitoring.org/project/015560 | 11.0.4       | 11.8.1       |     
                       rsyslog |  DISTRO  | https://release-monitoring.org/project/004218 | 8.2510.0     | 8.2610.0     |     
                      rt-tests |  DISTRO  | https://release-monitoring.org/project/059450 | 2.8          | 2.11         |     
                       rtl_433 |  DISTRO  | https://release-monitoring.org/project/014997 | 25.02        | 25.12        |     
                      rtorrent |  DISTRO  | https://release-monitoring.org/project/004221 | 0.15.3       | 0.16.26      | ORPH
                          ruby |  DISTRO  | https://release-monitoring.org/project/004223 | 4.0.6        | 4.0.9        |     
                          runc |  DISTRO  | https://release-monitoring.org/project/007462 | 1.3.6        | 1.5.2        |     
                         rygel |  DISTRO  | https://release-monitoring.org/project/004751 | 0.42.5       | 46.1         |     
                    s390-tools |  DISTRO  | https://release-monitoring.org/project/010714 | 2.44.0       | 2.44.1       |     
                            s6 |  DISTRO  | https://release-monitoring.org/project/005485 | 2.13.1.0     | 2.15.1.1     |     
                        s6-dns |  DISTRO  | https://release-monitoring.org/project/016547 | 2.4.0.0      | 2.4.1.3      |     
                 s6-linux-init |  DISTRO  | https://release-monitoring.org/project/016552 | 1.1.2.1      | 1.2.0.2      |     
                s6-linux-utils |  DISTRO  | https://release-monitoring.org/project/016551 | 2.6.2.1      | 2.6.4.1      |     
                 s6-networking |  DISTRO  | https://release-monitoring.org/project/016550 | 2.7.0.4      | 2.8.0.1      |     
             s6-portable-utils |  DISTRO  | https://release-monitoring.org/project/016549 | 2.3.0.4      | 2.3.1.2      |     
                         s6-rc |  DISTRO  | https://release-monitoring.org/project/016548 | 0.5.5.0      | 0.8.0.2      |     
                      safeclib |  DISTRO  | https://release-monitoring.org/project/021385 | 3.9.1        | 08032024     |     
                  sane-airscan |  DISTRO  | https://release-monitoring.org/project/121086 | 0.99.37      | 0.99.38      |     
                           sbc |  DISTRO  | https://release-monitoring.org/project/016338 | 2.1          | 2.2          |     
                         scdoc |  DISTRO  | https://release-monitoring.org/project/068662 | 1.11.4       | 1.11.5       |     
                        scrypt |  DISTRO  | https://release-monitoring.org/project/021238 | 1.3.2        | 1.3.3        |     
                           sdl |  DISTRO  | https://release-monitoring.org/project/004777 | 1.2.15       | 3.4.18       | ORPH
                    sdl2_image |  DISTRO  | https://release-monitoring.org/project/004781 | 2.8.12       | 3.4.8        |     
                    sdl2_mixer |  DISTRO  | https://release-monitoring.org/project/004782 | 2.6.3        | 3.2.4        | ORPH
                      sdl2_net |  DISTRO  | https://release-monitoring.org/project/004783 | 2.2.0        | 3.2.0        | ORPH
                          sdl3 |  DISTRO  | https://release-monitoring.org/project/375746 | 3.4.16       | 3.4.18       |     
                    sdl3_image |  DISTRO  | https://release-monitoring.org/project/004781 | 3.4.6        | 3.4.8        |     
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/004778 | 2.0.23       | 2.0.27       | ORPH
                     sdl_sound |  DISTRO  | https://release-monitoring.org/project/010262 | 1.0.3        | 2.0.6        | ORPH
                        sdparm |  DISTRO  | https://release-monitoring.org/project/004787 | 1.10         | 1.12         |     
                         seatd |  DISTRO  | https://release-monitoring.org/project/234932 | 0.9.1        | 0.9.3        | ORPH
                       sedutil |  DISTRO  | https://release-monitoring.org/project/015203 | 1.20.0       | 1.49.13      |     
                selinux-python |  DISTRO  | https://release-monitoring.org/project/001717 | 3.10         | 3.11         |     
                semodule-utils |  DISTRO  | https://release-monitoring.org/project/001717 | 3.10         | 3.11         | ORPH
                 sentry-native |  DISTRO  | https://release-monitoring.org/project/135639 | 0.4.1        | 0.17.4       |     
                          serd |  DISTRO  | https://release-monitoring.org/project/230531 | 0.32.8       | 0.32.10      |     
                       setools |  DISTRO  | https://release-monitoring.org/project/008951 | 4.5.1        | 4.7.1        | ORPH
                     sg3_utils |  DISTRO  | https://release-monitoring.org/project/004801 | 1.48         | 1.49         |     
                        shadow |  DISTRO  | https://release-monitoring.org/project/004802 | 4.18.0       | 4.20.3       |     
                shairport-sync |  DISTRO  | https://release-monitoring.org/project/021384 | 5.6          | 5.6.2        | ORPH
              shared-mime-info |  DISTRO  | https://release-monitoring.org/project/005524 | 1.12         | 2.5.1        | ORPH
                   shellinabox |  DISTRO  | https://release-monitoring.org/project/009501 | 2.20         | 2.21         |     
              signal-estimator |  DISTRO  | https://release-monitoring.org/project/284559 | v0.0.4       | 0.1.0        | ORPH
                       siproxd |  DISTRO  | https://release-monitoring.org/project/179540 | 0.8.3        | 0.8.4        |     
                       skalibs |  DISTRO  | https://release-monitoring.org/project/005486 | 2.14.3.0     | 2.16.0.0     |     
                         slirp |  DISTRO  | https://release-monitoring.org/project/096796 | 4.9.1        | 4.9.6        | ORPH
                   slirp4netns |  DISTRO  | https://release-monitoring.org/project/096795 | 1.3.3        | 1.3.6        |     
                        snappy |  DISTRO  | https://release-monitoring.org/project/004844 | 1.2.2        | 1.3.1        | ORPH
                        sngrep |  DISTRO  | https://release-monitoring.org/project/017075 | 1.8.2        | 1.9.0        | ORPH
                        snmppp |  DISTRO  | https://release-monitoring.org/project/021318 | 3.6.5        | 4.0.2        |     
                        snooze |  DISTRO  | https://release-monitoring.org/project/376662 | 0.5          | 0.6          |     
                        snort3 |  DISTRO  | https://release-monitoring.org/project/013263 | 3.12.2.0     | 3.12.4.0     |     
                     soapy-sdr |  DISTRO  | https://release-monitoring.org/project/014536 | 0.8.1        | 0.9.0        | ORPH
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/010152 | 0.7          | 0.8          |     
                    spawn-fcgi |  DISTRO  | https://release-monitoring.org/project/005388 | 1.6.4        | 1.6.6        | ORPH
                     spi-tools |  DISTRO  | https://release-monitoring.org/project/020628 | 1.0.2        | 1.1.1        | ORPH
                         spice |  DISTRO  | https://release-monitoring.org/project/004871 | 0.15.2       | 0.16.0       | ORPH
                spice-protocol |  DISTRO  | https://release-monitoring.org/project/014892 | 0.14.4       | 0.14.5       | ORPH
                 spirv-headers |  DISTRO  | https://release-monitoring.org/project/230542 | 1.4.357.0    | 2026.08.0    | ORPH
         spirv-llvm-translator |  DISTRO  | https://release-monitoring.org/project/227273 | 23.1.1       | 23.1.2       | ORPH
                   spirv-tools |  DISTRO  | https://release-monitoring.org/project/334920 | 1.4.357.0    | 1.4.363.0    | ORPH
                     sqlcipher |  DISTRO  | https://release-monitoring.org/project/011213 | 4.5.5        | 4.19.0       |     
                        sratom |  DISTRO  | https://release-monitoring.org/project/014903 | 0.6.14       | 0.6.22       |     
                      sshguard |  DISTRO  | https://release-monitoring.org/project/013819 | 2.5.1        | 2.6.0        |     
                          sslh |  DISTRO  | https://release-monitoring.org/project/006184 | 2.0.1        | 2.3.1        | ORPH
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/008127 | 1.20.7.1     | 1.23.11      | ORPH
                        stella |  DISTRO  | https://release-monitoring.org/project/006861 | 6.7.1        | 7.0c         |     
                     stress-ng |  DISTRO  | https://release-monitoring.org/project/012538 | 0.21.02      | 0.22.01      |     
                    strongswan |  DISTRO  | https://release-monitoring.org/project/004899 | 6.0.5        | 6.1.0        |     
                       stunnel |  DISTRO  | https://release-monitoring.org/project/004901 | 5.80         | 5.82         |     
                    subversion |  DISTRO  | https://release-monitoring.org/project/004905 | 1.14.5       | 1.15.0       |     
                   superiotool |  DISTRO  | https://release-monitoring.org/project/010128 | 24.05        | 26.09        |     
                      supertux |  DISTRO  | https://release-monitoring.org/project/004911 | 0.6.3        | 0.7.0-rev.1  |     
                        swaybg |  DISTRO  | https://release-monitoring.org/project/020562 | 1.2.1        | 1.2.2        |     
                         swipl |  DISTRO  | https://release-monitoring.org/project/236197 | 10.0.2       | 10.1.5       |     
                         swtpm |  GUESS   | https://release-monitoring.org/project/116461 | 0.10.1       | 0.10.2       |     
                       synergy |  DISTRO  | https://release-monitoring.org/project/005718 | 2.0.12-beta  | 2.3.2        |     
                        sysdig |  DISTRO  | https://release-monitoring.org/project/016898 | 0.29.3       | 0.41.4       |     
                       sysprof |  DISTRO  | https://release-monitoring.org/project/021649 | 49.0         | 51.0         |     
                       sysrepo |  DISTRO  | https://release-monitoring.org/project/034820 | 3.7.11       | 5.2.27       |     
                   sysrepo-cpp |  DISTRO  | https://release-monitoring.org/project/388239 | 6            | 11           |     
                       sysstat |  DISTRO  | https://release-monitoring.org/project/004931 | 12.7.5       | 12.8.0       | ORPH
                       systemd |  DISTRO  | https://release-monitoring.org/project/005440 | 258.7        | 262.1        |     
             systemd-bootchart |  DISTRO  | https://release-monitoring.org/project/011774 | 233          | 235          | ORPH
                      sysvinit |  DISTRO  | https://release-monitoring.org/project/021648 | 3.14         | 3.18         | ORPH
                           tbb |  DISTRO  | https://release-monitoring.org/project/008217 | 2021.12.0    | 2023.1.0     |     
                     tcf-agent |  DISTRO  | https://release-monitoring.org/project/021833 | 1.8.0        | 1.11.1       |     
                           tcl |  DISTRO  | https://release-monitoring.org/project/004941 | 8.6.15       | 9.1.0        | ORPH
                         tclap |  DISTRO  | https://release-monitoring.org/project/004942 | 1.2.4        | 1.6.0        | ORPH
                        tcllib |  DISTRO  | https://release-monitoring.org/project/004943 | 1.21         | 2.0          |     
                      tealdeer |  DISTRO  | https://release-monitoring.org/project/084521 | 1.6.1        | 1.9.1        |     
               tensorflow-lite |  DISTRO  | https://release-monitoring.org/project/016141 | 2.11.0       | 2.21.0       |     
                   terminology |  DISTRO  | https://release-monitoring.org/project/004951 | 1.12.1       | 1.14.0       |     
                 tesseract-ocr |  DISTRO  | https://release-monitoring.org/project/004954 | 5.5.2        | 5.5.3        |     
                      thermald |  DISTRO  | https://release-monitoring.org/project/014500 | 2.5.6        | 2.15.10      |     
                           tig |  DISTRO  | https://release-monitoring.org/project/004969 | 2.6.0        | 2.6.1        |     
                          time |  DISTRO  | https://release-monitoring.org/project/004971 | 1.9          | 1.10         |     
                   timescaledb |  DISTRO  | https://release-monitoring.org/project/017545 | 2.28.3       | 2.31.0       |     
                      tinifier |  DISTRO  | https://release-monitoring.org/project/241900 | 4.1.0        | 5.1.3        |     
                      tinycbor |  DISTRO  | https://release-monitoring.org/project/021379 | 7.0          | 7.1          |     
                     tinyproxy |  DISTRO  | https://release-monitoring.org/project/008699 | 1.11.2       | 1.11.3       | ORPH
                       tinyssh |  DISTRO  | https://release-monitoring.org/project/014678 | 20240101     | 20261016     |     
                       tipidee |  DISTRO  | https://release-monitoring.org/project/373437 | 0.0.5.1      | 0.0.8.0      |     
                            tk |  DISTRO  | https://release-monitoring.org/project/011426 | 8.6.15       | 9.1.0        |     
                   tl-expected |  DISTRO  | https://release-monitoring.org/project/112689 | v1.0.0       | 1.3.1        |     
                          tmux |  DISTRO  | https://release-monitoring.org/project/004980 | 3.6b         | 3.8          |     
                     tpm-tools |  DISTRO  | https://release-monitoring.org/project/021640 | 1.3.9.1      | 1.3.9.2      |     
                    tpm2-abrmd |  DISTRO  | https://release-monitoring.org/project/016819 | 3.0.0        | 3.1.0        | ORPH
                      tpm2-tss |  DISTRO  | https://release-monitoring.org/project/012683 | 4.1.3        | 4.2.0        | ORPH
                     trace-cmd |  DISTRO  | https://release-monitoring.org/project/007873 | 3.3.3        | 3.4          |     
                          tree |  DISTRO  | https://release-monitoring.org/project/005006 | 2.2.1        | 2.3.2        |     
                          uftp |  DISTRO  | https://release-monitoring.org/project/021638 | 5.0.3        | 5.0.4        | ORPH
                       uftrace |  DISTRO  | https://release-monitoring.org/project/195039 | 0.14         | 0.20         | ORPH
                           uhd |  DISTRO  | https://release-monitoring.org/project/012572 | 4.9.0.1      | 4.11.0.0     |     
                         ulogd |  DISTRO  | https://release-monitoring.org/project/005038 | 2.0.8        | 2.0.9        | ORPH
                       unbound |  DISTRO  | https://release-monitoring.org/project/005042 | 1.26.1       | 1.26.2       |     
                       unionfs |  DISTRO  | https://release-monitoring.org/project/017617 | 3.7          | 3.8          | ORPH
                         unrar |  DISTRO  | https://release-monitoring.org/project/013306 | 7.2.6        | 7.3.1        |     
                      upmpdcli |  DISTRO  | https://release-monitoring.org/project/015848 | 1.9.7        | 1.9.18       | ORPH
                        upower |  DISTRO  | https://release-monitoring.org/project/005056 | 0.99.19      | 1.91.5       |     
                           upx |  DISTRO  | https://release-monitoring.org/project/013737 | 4.2.1        | 5.2.1        |     
                      usbredir |  DISTRO  | https://release-monitoring.org/project/016012 | 0.14.0       | 0.15.0       | ORPH
                      usbutils |  DISTRO  | https://release-monitoring.org/project/005061 | 019          | 020          | ORPH
                     ustreamer |  DISTRO  | https://release-monitoring.org/project/314869 | 6.61         | 6.67         |     
                      utf8proc |  DISTRO  | https://release-monitoring.org/project/007455 | 2.10.0       | 2.12.0       | ORPH
                    util-linux |  DISTRO  | https://release-monitoring.org/project/008179 | 2.41.5       | 2.42.4       |     
               util-linux-libs |  DISTRO  | https://release-monitoring.org/project/008179 | 2.41.5       | 2.42.4       |     
                  v4l2loopback |  DISTRO  | https://release-monitoring.org/project/010956 | 0.15.3       | 0.15.4       |     
                          vala |  DISTRO  | https://release-monitoring.org/project/005065 | 0.56.18      | 0.56.19      | ORPH
                      valgrind |  DISTRO  | https://release-monitoring.org/project/013639 | 3.27.1       | 3.28.0       | ORPH
                      valijson |  DISTRO  | https://release-monitoring.org/project/018452 | 1.0.2        | 1.1.3        | ORPH
                           vdr |  DISTRO  | https://release-monitoring.org/project/005069 | 2.6.5        | 2.8.3        | ORPH
         vdr-plugin-vnsiserver |  DISTRO  | https://release-monitoring.org/project/005080 | 1.8.0        | 1.8.4        | ORPH
                           vim |  DISTRO  | https://release-monitoring.org/project/005092 | 9.2.0943     | 9.2.1240     |     
                          volk |  DISTRO  | https://release-monitoring.org/project/147733 | 3.2.0        | 3.3.0        |     
                           vte |  DISTRO  | https://release-monitoring.org/project/010895 | 0.66.2       | 0.84.1       | ORPH
                vulkan-headers |  DISTRO  | https://release-monitoring.org/project/088835 | 1.4.317      | 1.4.366      | ORPH
                 vulkan-loader |  DISTRO  | https://release-monitoring.org/project/230557 | 1.4.317      | 1.4.366      | ORPH
                    vulkan-sdk |  DISTRO  | https://release-monitoring.org/project/370476 | 1.4.313.0    | 1.4.363.0    | ORPH
                  vulkan-tools |  DISTRO  | https://release-monitoring.org/project/242111 | 1.4.317      | 1.4.366      | ORPH
                       wavemon |  DISTRO  | https://release-monitoring.org/project/005120 | 0.9.5        | 0.9.7        | ORPH
                       wavpack |  DISTRO  | https://release-monitoring.org/project/005121 | 5.7.0        | 5.9.0        | ORPH
                       wayland |  DISTRO  | https://release-monitoring.org/project/010061 | 1.24.0       | 1.26.0       |     
             wayland-protocols |  DISTRO  | https://release-monitoring.org/project/013997 | 1.48         | 1.49         | ORPH
                 wayland-utils |  DISTRO  | https://release-monitoring.org/project/129361 | 1.2.0        | 1.3.0        | ORPH
                     webkitgtk |  DISTRO  | https://release-monitoring.org/project/005355 | 2.52.4       | 2.54.2       |     
       webrtc-audio-processing |  DISTRO  | https://release-monitoring.org/project/015929 | 1.3          | 2.1          | ORPH
                        weston |  DISTRO  | https://release-monitoring.org/project/013745 | 16.0.0       | 16.0.1       |     
                         which |  DISTRO  | https://release-monitoring.org/project/005127 | 2.23         | 2.25         | ORPH
                          wine |  DISTRO  | https://release-monitoring.org/project/005134 | 11.0         | 11.20        |     
                   wireplumber |  DISTRO  | https://release-monitoring.org/project/235056 | 0.5.14       | 0.5.18       | ORPH
                       wolftpm |  DISTRO  | https://release-monitoring.org/project/256219 | 3.10.0       | 4.2.0        |     
                    wpan-tools |  DISTRO  | https://release-monitoring.org/project/021835 | 0.9          | 0.10         | ORPH
                     wpewebkit |  DISTRO  | https://release-monitoring.org/project/017557 | 2.50.5       | 2.54.2       |     
                       wtfutil |  DISTRO  | https://release-monitoring.org/project/243189 | 0.47.1       | 0.51.0       | ORPH
                        x11vnc |  DISTRO  | https://release-monitoring.org/project/010182 | 0.9.16       | 0.9.17       | ORPH
                          x265 |  DISTRO  | https://release-monitoring.org/project/007275 | 4.1          | 4.2          |     
                        xapian |  DISTRO  | https://release-monitoring.org/project/015919 | 1.4.30       | 2.1.0        |     
                   xapp_bitmap |  DISTRO  | https://release-monitoring.org/project/000191 | 1.1.1        | 1.1.2        | ORPH
                  xapp_editres |  DISTRO  | https://release-monitoring.org/project/017160 | 1.0.9        | 1.1.1        | ORPH
                  xapp_fstobdf |  DISTRO  | https://release-monitoring.org/project/017156 | 1.0.7        | 1.0.8        | ORPH
                  xapp_iceauth |  DISTRO  | https://release-monitoring.org/project/015048 | 1.0.10       | 1.0.11       | ORPH
                      xapp_ico |  DISTRO  | https://release-monitoring.org/project/021722 | 1.0.6        | 1.0.7        | ORPH
                  xapp_listres |  DISTRO  | https://release-monitoring.org/project/017161 | 1.0.6        | 1.0.7        | ORPH
                     xapp_luit |  DISTRO  | https://release-monitoring.org/project/015047 | 1.1.1        | 20260907     | ORPH
              xapp_mkfontscale |  DISTRO  | https://release-monitoring.org/project/015043 | 1.2.3        | 1.2.4        | ORPH
                xapp_setxkbmap |  DISTRO  | https://release-monitoring.org/project/012314 | 1.3.4        | 1.3.5        | ORPH
                    xapp_xbiff |  DISTRO  | https://release-monitoring.org/project/015034 | 1.0.5        | 1.0.6        | ORPH
                    xapp_xcalc |  DISTRO  | https://release-monitoring.org/project/005164 | 1.1.2        | 1.1.3        | ORPH
               xapp_xclipboard |  DISTRO  | https://release-monitoring.org/project/015033 | 1.1.5        | 1.1.6        | ORPH
                   xapp_xclock |  DISTRO  | https://release-monitoring.org/project/015032 | 1.1.1        | 1.2.1        | ORPH
                 xapp_xconsole |  DISTRO  | https://release-monitoring.org/project/015030 | 1.1.0        | 1.1.1        |     
                    xapp_xedit |  DISTRO  | https://release-monitoring.org/project/005180 | 1.2.4        | 1.2.5        | ORPH
                      xapp_xev |  DISTRO  | https://release-monitoring.org/project/015026 | 1.2.6        | 1.2.7        | ORPH
                      xapp_xfd |  DISTRO  | https://release-monitoring.org/project/015024 | 1.1.4        | 1.1.6        | ORPH
                 xapp_xfontsel |  DISTRO  | https://release-monitoring.org/project/015023 | 1.1.1        | 1.1.2        | ORPH
                 xapp_xkbprint |  DISTRO  | https://release-monitoring.org/project/017159 | 1.0.7        | 1.0.8        | ORPH
                 xapp_xkbutils |  DISTRO  | https://release-monitoring.org/project/015016 | 1.0.6        | 1.0.7        | ORPH
                    xapp_xkill |  DISTRO  | https://release-monitoring.org/project/014993 | 1.0.6        | 1.0.7        | ORPH
                    xapp_xload |  DISTRO  | https://release-monitoring.org/project/014992 | 1.2.0        | 1.2.2        | ORPH
                 xapp_xlsatoms |  DISTRO  | https://release-monitoring.org/project/014990 | 1.1.4        | 1.1.5        | ORPH
               xapp_xlsclients |  DISTRO  | https://release-monitoring.org/project/014989 | 1.1.5        | 1.1.6        | ORPH
                 xapp_xlsfonts |  DISTRO  | https://release-monitoring.org/project/014964 | 1.0.8        | 1.0.9        | ORPH
                  xapp_xmodmap |  DISTRO  | https://release-monitoring.org/project/014960 | 1.0.11       | 1.0.12       | ORPH
                      xapp_xpr |  DISTRO  | https://release-monitoring.org/project/014959 | 1.2.0        | 1.2.1        | ORPH
                   xapp_xrandr |  DISTRO  | https://release-monitoring.org/project/014957 | 1.5.3        | 1.5.4        | ORPH
                     xapp_xrdb |  DISTRO  | https://release-monitoring.org/project/014956 | 1.2.2        | 1.2.3        | ORPH
                 xapp_xrefresh |  DISTRO  | https://release-monitoring.org/project/014955 | 1.1.0        | 1.1.1        | ORPH
                     xapp_xset |  DISTRO  | https://release-monitoring.org/project/014954 | 1.2.5        | 1.2.6        | ORPH
                 xapp_xsetroot |  DISTRO  | https://release-monitoring.org/project/014953 | 1.1.3        | 1.1.4        | ORPH
                 xapp_xstdcmap |  DISTRO  | https://release-monitoring.org/project/017150 | 1.0.5        | 1.0.6        | ORPH
                   xapp_xvinfo |  DISTRO  | https://release-monitoring.org/project/014951 | 1.1.5        | 1.1.6        | ORPH
                      xapp_xwd |  DISTRO  | https://release-monitoring.org/project/014950 | 1.0.9        | 1.0.10       | ORPH
                 xapp_xwininfo |  DISTRO  | https://release-monitoring.org/project/014949 | 1.1.6        | 1.1.7        | ORPH
                     xapp_xwud |  DISTRO  | https://release-monitoring.org/project/014948 | 1.0.7        | 1.0.8        | ORPH
                xdata_xbitmaps |  DISTRO  | https://release-monitoring.org/project/013645 | 1.1.3        | 1.1.4        | ORPH
                xdg-dbus-proxy |  DISTRO  | https://release-monitoring.org/project/058434 | 0.1.8        | 0.1.9        |     
                       xdotool |  DISTRO  | https://release-monitoring.org/project/008648 | 3.20211022.1 | 4.20260303.1 | ORPH
              xfont_font-alias |  DISTRO  | https://release-monitoring.org/project/015059 | 1.0.5        | 1.0.6        | ORPH
               xfont_font-util |  DISTRO  | https://release-monitoring.org/project/015055 | 1.4.1        | 1.4.2        | ORPH
                      xfsprogs |  DISTRO  | https://release-monitoring.org/project/005188 | 6.19.0       | 7.2.1        | ORPH
              xkeyboard-config |  DISTRO  | https://release-monitoring.org/project/005191 | 2.38         | 2.49         | ORPH
                         xl2tp |  DISTRO  | https://release-monitoring.org/project/005193 | 1.3.19       | 1.3.20       | ORPH
                   xlib_libX11 |  DISTRO  | https://release-monitoring.org/project/001764 | 1.8.12       | 1.8.14       | ORPH
            xlib_libXcomposite |  DISTRO  | https://release-monitoring.org/project/001769 | 0.4.6        | 0.4.7        | ORPH
               xlib_libXdamage |  DISTRO  | https://release-monitoring.org/project/001771 | 1.1.6        | 1.1.7        | ORPH
                  xlib_libXext |  DISTRO  | https://release-monitoring.org/project/001774 | 1.3.6        | 1.3.7        | ORPH
                    xlib_libXi |  DISTRO  | https://release-monitoring.org/project/001778 | 1.8.2        | 1.8.4        | ORPH
              xlib_libXinerama |  DISTRO  | https://release-monitoring.org/project/001779 | 1.1.5        | 1.1.6        | ORPH
                   xlib_libXmu |  DISTRO  | https://release-monitoring.org/project/001785 | 1.2.1        | 1.3.1        | ORPH
                   xlib_libXpm |  DISTRO  | https://release-monitoring.org/project/001787 | 3.5.19       | 3.5.20       | ORPH
                xlib_libXrandr |  DISTRO  | https://release-monitoring.org/project/001788 | 1.5.4        | 1.5.5        | ORPH
               xlib_libXrender |  DISTRO  | https://release-monitoring.org/project/001789 | 0.9.12       | 0.9.13       | ORPH
                  xlib_libXtst |  DISTRO  | https://release-monitoring.org/project/001794 | 1.2.5        | 1.2.6        | ORPH
                  xlib_libXvMC |  DISTRO  | https://release-monitoring.org/project/001796 | 1.0.14       | 1.0.15       | ORPH
              xlib_libXxf86dga |  DISTRO  | https://release-monitoring.org/project/001797 | 1.1.6        | 1.1.7        | ORPH
               xlib_libXxf86vm |  DISTRO  | https://release-monitoring.org/project/001799 | 1.1.6        | 1.1.7        | ORPH
               xlib_libfontenc |  DISTRO  | https://release-monitoring.org/project/001613 | 1.1.8        | 1.1.9        | ORPH
               xlib_libxkbfile |  DISTRO  | https://release-monitoring.org/project/001781 | 1.1.3        | 1.2.0        | ORPH
                     xorgproto |  DISTRO  | https://release-monitoring.org/project/017190 | 2025.1       | 2026.1       | ORPH
                  xscreensaver |  DISTRO  | https://release-monitoring.org/project/005269 | 6.14         | 6.17         |     
           xserver_xorg-server |  DISTRO  | https://release-monitoring.org/project/005250 | 21.1.24      | 21.1.25      | ORPH
                xtables-addons |  DISTRO  | https://release-monitoring.org/project/007736 | 3.24         | 3.31         | ORPH
              xutil_makedepend |  DISTRO  | https://release-monitoring.org/project/013528 | 1.0.9        | 1.0.10       | ORPH
                      xwayland |  DISTRO  | https://release-monitoring.org/project/180949 | 24.1.13      | 24.1.14      |     
                           yad |  DISTRO  | https://release-monitoring.org/project/005280 | 14.2         | 15.0         |     
                            yq |  DISTRO  | https://release-monitoring.org/project/303696 | 4.49.2       | 4.54.1       |     
                            z3 |  DISTRO  | https://release-monitoring.org/project/007812 | 4.16.0       | 5.3.2        |     
                        zabbix |  DISTRO  | https://release-monitoring.org/project/005492 | 7.2.15       | 7.4.16       |     
                          zbar |  DISTRO  | https://release-monitoring.org/project/013689 | 0.23.93      | 0.23.95      |     
                        zchunk |  DISTRO  | https://release-monitoring.org/project/178035 | 1.3.2        | 1.5.4        |     
                           zic |  DISTRO  | https://release-monitoring.org/project/016905 | 2026b        | 2026c        |     
                  zisofs-tools |  DISTRO  | https://release-monitoring.org/project/010520 | 1.1.11       | 1.1.11-5     | ORPH
                        zoxide |  DISTRO  | https://release-monitoring.org/project/098400 | 0.9.8        | 0.10.0       |     
                           zsh |  DISTRO  | https://release-monitoring.org/project/005307 | 5.9          | 5.9.2        |     
                     zxing-cpp |  DISTRO  | https://release-monitoring.org/project/101246 | 2.3.0        | 3.1.1        |     

Packages having CVEs
====================

CVEs for the 'master' branch
----------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                         avahi | CVE-2025-59529   | https://security-tracker.debian.org/tracker/CVE-2025-59529  
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
           binutils-bare-metal | CVE-2026-90828   | https://security-tracker.debian.org/tracker/CVE-2026-90828  
           binutils-bare-metal | CVE-2026-90803   | https://security-tracker.debian.org/tracker/CVE-2026-90803  
           binutils-bare-metal | CVE-2026-90804   | https://security-tracker.debian.org/tracker/CVE-2026-90804  
           binutils-bare-metal | CVE-2026-90829   | https://security-tracker.debian.org/tracker/CVE-2026-90829  
           binutils-bare-metal | CVE-2026-90801   | https://security-tracker.debian.org/tracker/CVE-2026-90801  
           binutils-bare-metal | CVE-2026-90802   | https://security-tracker.debian.org/tracker/CVE-2026-90802  
           binutils-bare-metal | CVE-2026-90830   | https://security-tracker.debian.org/tracker/CVE-2026-90830  
           binutils-bare-metal | CVE-2026-90831   | https://security-tracker.debian.org/tracker/CVE-2026-90831  
           binutils-bare-metal | CVE-2026-91782   | https://security-tracker.debian.org/tracker/CVE-2026-91782  
           binutils-bare-metal | CVE-2026-91781   | https://security-tracker.debian.org/tracker/CVE-2026-91781  
           binutils-bare-metal | CVE-2026-91779   | https://security-tracker.debian.org/tracker/CVE-2026-91779  
           binutils-bare-metal | CVE-2026-91780   | https://security-tracker.debian.org/tracker/CVE-2026-91780  
                         bison | CVE-2026-56390   | https://security-tracker.debian.org/tracker/CVE-2026-56390  
                         bison | CVE-2026-56389   | https://security-tracker.debian.org/tracker/CVE-2026-56389  
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                         botan | CVE-2026-44378   | https://security-tracker.debian.org/tracker/CVE-2026-44378  
                       busybox | CVE-2026-38755   | https://security-tracker.debian.org/tracker/CVE-2026-38755  
                       busybox | CVE-2026-38754   | https://security-tracker.debian.org/tracker/CVE-2026-38754  
                       busybox | CVE-2026-38753   | https://security-tracker.debian.org/tracker/CVE-2026-38753  
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                      civetweb | CVE-2026-5789    | https://security-tracker.debian.org/tracker/CVE-2026-5789   
                         cjson | CVE-2026-67216   | https://security-tracker.debian.org/tracker/CVE-2026-67216  
                         cjson | CVE-2026-67217   | https://security-tracker.debian.org/tracker/CVE-2026-67217  
                         cjson | CVE-2026-67215   | https://security-tracker.debian.org/tracker/CVE-2026-67215  
                         cjson | CVE-2026-16554   | https://security-tracker.debian.org/tracker/CVE-2026-16554  
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                      composer | CVE-2025-67746   | https://security-tracker.debian.org/tracker/CVE-2025-67746  
                      composer | CVE-2026-40261   | https://security-tracker.debian.org/tracker/CVE-2026-40261  
                      composer | CVE-2026-40176   | https://security-tracker.debian.org/tracker/CVE-2026-40176  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                          crun | CVE-2026-30892   | https://security-tracker.debian.org/tracker/CVE-2026-30892  
               cryptodev-linux | CVE-2026-28529   | https://security-tracker.debian.org/tracker/CVE-2026-28529  
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                          cups | CVE-2026-107885  | https://security-tracker.debian.org/tracker/CVE-2026-107885 
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                 docker-engine | CVE-2026-41568   | https://security-tracker.debian.org/tracker/CVE-2026-41568  
                 docker-engine | CVE-2026-42306   | https://security-tracker.debian.org/tracker/CVE-2026-42306  
                        drogon | CVE-2023-26138   | https://security-tracker.debian.org/tracker/CVE-2023-26138  
                        drogon | CVE-2023-26137   | https://security-tracker.debian.org/tracker/CVE-2023-26137  
                      easy-rsa | CVE-2024-13454   | https://security-tracker.debian.org/tracker/CVE-2024-13454  
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                         emlog | CVE-2024-12842   | https://security-tracker.debian.org/tracker/CVE-2024-12842  
                         emlog | CVE-2024-12846   | https://security-tracker.debian.org/tracker/CVE-2024-12846  
                         emlog | CVE-2024-12843   | https://security-tracker.debian.org/tracker/CVE-2024-12843  
                         emlog | CVE-2024-12841   | https://security-tracker.debian.org/tracker/CVE-2024-12841  
                         emlog | CVE-2024-12845   | https://security-tracker.debian.org/tracker/CVE-2024-12845  
                         emlog | CVE-2024-12844   | https://security-tracker.debian.org/tracker/CVE-2024-12844  
                         emlog | CVE-2024-46540   | https://security-tracker.debian.org/tracker/CVE-2024-46540  
                         emlog | CVE-2024-50655   | https://security-tracker.debian.org/tracker/CVE-2024-50655  
                         emlog | CVE-2025-53926   | https://security-tracker.debian.org/tracker/CVE-2025-53926  
                         emlog | CVE-2025-53923   | https://security-tracker.debian.org/tracker/CVE-2025-53923  
                         emlog | CVE-2025-53924   | https://security-tracker.debian.org/tracker/CVE-2025-53924  
                         emlog | CVE-2025-53925   | https://security-tracker.debian.org/tracker/CVE-2025-53925  
                         emlog | CVE-2025-61930   | https://security-tracker.debian.org/tracker/CVE-2025-61930  
                         emlog | CVE-2025-61769   | https://security-tracker.debian.org/tracker/CVE-2025-61769  
                         emlog | CVE-2025-47787   | https://security-tracker.debian.org/tracker/CVE-2025-47787  
                         emlog | CVE-2025-47785   | https://security-tracker.debian.org/tracker/CVE-2025-47785  
                         emlog | CVE-2025-47784   | https://security-tracker.debian.org/tracker/CVE-2025-47784  
                         emlog | CVE-2025-61597   | https://security-tracker.debian.org/tracker/CVE-2025-61597  
                         emlog | CVE-2025-61599   | https://security-tracker.debian.org/tracker/CVE-2025-61599  
                         emlog | CVE-2025-30372   | https://security-tracker.debian.org/tracker/CVE-2025-30372  
                         emlog | CVE-2025-9296    | https://security-tracker.debian.org/tracker/CVE-2025-9296   
                         emlog | CVE-2025-5886    | https://security-tracker.debian.org/tracker/CVE-2025-5886   
                         emlog | CVE-2026-22799   | https://security-tracker.debian.org/tracker/CVE-2026-22799  
                         emlog | CVE-2026-34229   | https://security-tracker.debian.org/tracker/CVE-2026-34229  
                         emlog | CVE-2026-34228   | https://security-tracker.debian.org/tracker/CVE-2026-34228  
                         emlog | CVE-2026-34607   | https://security-tracker.debian.org/tracker/CVE-2026-34607  
                         emlog | CVE-2026-21433   | https://security-tracker.debian.org/tracker/CVE-2026-21433  
                         emlog | CVE-2026-31954   | https://security-tracker.debian.org/tracker/CVE-2026-31954  
                         emlog | CVE-2026-34788   | https://security-tracker.debian.org/tracker/CVE-2026-34788  
                         emlog | CVE-2026-34787   | https://security-tracker.debian.org/tracker/CVE-2026-34787  
                        erlang | CVE-2026-48860   | https://security-tracker.debian.org/tracker/CVE-2026-48860  
                        erlang | CVE-2026-48856   | https://security-tracker.debian.org/tracker/CVE-2026-48856  
                        erlang | CVE-2026-48858   | https://security-tracker.debian.org/tracker/CVE-2026-48858  
                        erlang | CVE-2026-48855   | https://security-tracker.debian.org/tracker/CVE-2026-48855  
                        erlang | CVE-2026-42792   | https://security-tracker.debian.org/tracker/CVE-2026-42792  
                        erlang | CVE-2026-53422   | https://security-tracker.debian.org/tracker/CVE-2026-53422  
                        erlang | CVE-2026-55952   | https://security-tracker.debian.org/tracker/CVE-2026-55952  
                        erlang | CVE-2026-55950   | https://security-tracker.debian.org/tracker/CVE-2026-55950  
                        erlang | CVE-2026-55953   | https://security-tracker.debian.org/tracker/CVE-2026-55953  
                        erlang | CVE-2026-49760   | https://security-tracker.debian.org/tracker/CVE-2026-49760  
                        erlang | CVE-2026-49759   | https://security-tracker.debian.org/tracker/CVE-2026-49759  
                        erlang | CVE-2026-58227   | https://security-tracker.debian.org/tracker/CVE-2026-58227  
                        erlang | CVE-2026-55737   | https://security-tracker.debian.org/tracker/CVE-2026-55737  
                        erlang | CVE-2026-54887   | https://security-tracker.debian.org/tracker/CVE-2026-54887  
                        erlang | CVE-2026-54886   | https://security-tracker.debian.org/tracker/CVE-2026-54886  
                        erlang | CVE-2026-54891   | https://security-tracker.debian.org/tracker/CVE-2026-54891  
                        erlang | CVE-2026-59251   | https://security-tracker.debian.org/tracker/CVE-2026-59251  
                        ffmpeg | CVE-2023-51796   | https://security-tracker.debian.org/tracker/CVE-2023-51796  
                        ffmpeg | CVE-2023-51791   | https://security-tracker.debian.org/tracker/CVE-2023-51791  
                        ffmpeg | CVE-2023-51798   | https://security-tracker.debian.org/tracker/CVE-2023-51798  
                        ffmpeg | CVE-2023-51795   | https://security-tracker.debian.org/tracker/CVE-2023-51795  
                        ffmpeg | CVE-2023-51794   | https://security-tracker.debian.org/tracker/CVE-2023-51794  
                        ffmpeg | CVE-2023-51793   | https://security-tracker.debian.org/tracker/CVE-2023-51793  
                        ffmpeg | CVE-2023-51797   | https://security-tracker.debian.org/tracker/CVE-2023-51797  
                        ffmpeg | CVE-2025-12343   | https://security-tracker.debian.org/tracker/CVE-2025-12343  
                        ffmpeg | CVE-2025-1373    | https://security-tracker.debian.org/tracker/CVE-2025-1373   
                        ffmpeg | CVE-2025-10256   | https://security-tracker.debian.org/tracker/CVE-2025-10256  
                        ffmpeg | CVE-2025-22921   | https://security-tracker.debian.org/tracker/CVE-2025-22921  
                        ffmpeg | CVE-2025-1594    | https://security-tracker.debian.org/tracker/CVE-2025-1594   
                        ffmpeg | CVE-2025-25469   | https://security-tracker.debian.org/tracker/CVE-2025-25469  
                        ffmpeg | CVE-2025-25468   | https://security-tracker.debian.org/tracker/CVE-2025-25468  
                        ffmpeg | CVE-2026-64834   | https://security-tracker.debian.org/tracker/CVE-2026-64834  
                        ffmpeg | CVE-2026-64835   | https://security-tracker.debian.org/tracker/CVE-2026-64835  
                        ffmpeg | CVE-2026-64832   | https://security-tracker.debian.org/tracker/CVE-2026-64832  
                        ffmpeg | CVE-2026-64833   | https://security-tracker.debian.org/tracker/CVE-2026-64833  
                        ffmpeg | CVE-2026-64830   | https://security-tracker.debian.org/tracker/CVE-2026-64830  
                        ffmpeg | CVE-2026-30754   | https://security-tracker.debian.org/tracker/CVE-2026-30754  
                        ffmpeg | CVE-2026-96611   | https://security-tracker.debian.org/tracker/CVE-2026-96611  
                        ffmpeg | CVE-2026-65706   | https://security-tracker.debian.org/tracker/CVE-2026-65706  
                        ffmpeg | CVE-2026-65704   | https://security-tracker.debian.org/tracker/CVE-2026-65704  
                        ffmpeg | CVE-2026-65703   | https://security-tracker.debian.org/tracker/CVE-2026-65703  
                        ffmpeg | CVE-2026-65705   | https://security-tracker.debian.org/tracker/CVE-2026-65705  
                        ffmpeg | CVE-2026-52297   | https://security-tracker.debian.org/tracker/CVE-2026-52297  
                        ffmpeg | CVE-2026-52296   | https://security-tracker.debian.org/tracker/CVE-2026-52296  
                        ffmpeg | CVE-2026-52295   | https://security-tracker.debian.org/tracker/CVE-2026-52295  
                        ffmpeg | CVE-2026-66037   | https://security-tracker.debian.org/tracker/CVE-2026-66037  
                        ffmpeg | CVE-2026-66039   | https://security-tracker.debian.org/tracker/CVE-2026-66039  
                        ffmpeg | CVE-2026-66040   | https://security-tracker.debian.org/tracker/CVE-2026-66040  
                        ffmpeg | CVE-2026-66036   | https://security-tracker.debian.org/tracker/CVE-2026-66036  
                        ffmpeg | CVE-2026-66038   | https://security-tracker.debian.org/tracker/CVE-2026-66038  
                        ffmpeg | CVE-2026-66041   | https://security-tracker.debian.org/tracker/CVE-2026-66041  
                        ffmpeg | CVE-2026-40962   | https://security-tracker.debian.org/tracker/CVE-2026-40962  
                        ffmpeg | CVE-2026-107696  | https://security-tracker.debian.org/tracker/CVE-2026-107696 
                        ffmpeg | CVE-2026-107675  | https://security-tracker.debian.org/tracker/CVE-2026-107675 
                        ffmpeg | CVE-2026-107698  | https://security-tracker.debian.org/tracker/CVE-2026-107698 
                        ffmpeg | CVE-2026-107676  | https://security-tracker.debian.org/tracker/CVE-2026-107676 
                        ffmpeg | CVE-2026-107695  | https://security-tracker.debian.org/tracker/CVE-2026-107695 
                        ffmpeg | CVE-2026-107678  | https://security-tracker.debian.org/tracker/CVE-2026-107678 
                        ffmpeg | CVE-2026-107677  | https://security-tracker.debian.org/tracker/CVE-2026-107677 
                        ffmpeg | CVE-2026-107660  | https://security-tracker.debian.org/tracker/CVE-2026-107660 
                        ffmpeg | CVE-2026-107697  | https://security-tracker.debian.org/tracker/CVE-2026-107697 
                        ffmpeg | CVE-2026-70631   | https://security-tracker.debian.org/tracker/CVE-2026-70631  
                        ffmpeg | CVE-2026-70628   | https://security-tracker.debian.org/tracker/CVE-2026-70628  
                        ffmpeg | CVE-2026-70630   | https://security-tracker.debian.org/tracker/CVE-2026-70630  
                        ffmpeg | CVE-2026-70629   | https://security-tracker.debian.org/tracker/CVE-2026-70629  
                        ffmpeg | CVE-2026-70632   | https://security-tracker.debian.org/tracker/CVE-2026-70632  
                        ffmpeg | CVE-2026-30998   | https://security-tracker.debian.org/tracker/CVE-2026-30998  
                        ffmpeg | CVE-2026-30997   | https://security-tracker.debian.org/tracker/CVE-2026-30997  
                        ffmpeg | CVE-2026-30999   | https://security-tracker.debian.org/tracker/CVE-2026-30999  
                       flannel | CVE-2026-32241   | https://security-tracker.debian.org/tracker/CVE-2026-32241  
                       freerdp | CVE-2026-55648   | https://security-tracker.debian.org/tracker/CVE-2026-55648  
                       freerdp | CVE-2026-27951   | https://security-tracker.debian.org/tracker/CVE-2026-27951  
                       freerdp | CVE-2026-27950   | https://security-tracker.debian.org/tracker/CVE-2026-27950  
                       freerdp | CVE-2026-91962   | https://security-tracker.debian.org/tracker/CVE-2026-91962  
                       freerdp | CVE-2026-91960   | https://security-tracker.debian.org/tracker/CVE-2026-91960  
                       freerdp | CVE-2026-91954   | https://security-tracker.debian.org/tracker/CVE-2026-91954  
                       freerdp | CVE-2026-91961   | https://security-tracker.debian.org/tracker/CVE-2026-91961  
                       freerdp | CVE-2026-91946   | https://security-tracker.debian.org/tracker/CVE-2026-91946  
                       freerdp | CVE-2026-91957   | https://security-tracker.debian.org/tracker/CVE-2026-91957  
                       freerdp | CVE-2026-91959   | https://security-tracker.debian.org/tracker/CVE-2026-91959  
                       freerdp | CVE-2026-91956   | https://security-tracker.debian.org/tracker/CVE-2026-91956  
                       freerdp | CVE-2026-91955   | https://security-tracker.debian.org/tracker/CVE-2026-91955  
                       freerdp | CVE-2026-91950   | https://security-tracker.debian.org/tracker/CVE-2026-91950  
                       freerdp | CVE-2026-91963   | https://security-tracker.debian.org/tracker/CVE-2026-91963  
                       freerdp | CVE-2026-91953   | https://security-tracker.debian.org/tracker/CVE-2026-91953  
                       freerdp | CVE-2026-22854   | https://security-tracker.debian.org/tracker/CVE-2026-22854  
                       freerdp | CVE-2026-22851   | https://security-tracker.debian.org/tracker/CVE-2026-22851  
                       freerdp | CVE-2026-22859   | https://security-tracker.debian.org/tracker/CVE-2026-22859  
                       freerdp | CVE-2026-22857   | https://security-tracker.debian.org/tracker/CVE-2026-22857  
                       freerdp | CVE-2026-22858   | https://security-tracker.debian.org/tracker/CVE-2026-22858  
                       freerdp | CVE-2026-22853   | https://security-tracker.debian.org/tracker/CVE-2026-22853  
                       freerdp | CVE-2026-22855   | https://security-tracker.debian.org/tracker/CVE-2026-22855  
                       freerdp | CVE-2026-22856   | https://security-tracker.debian.org/tracker/CVE-2026-22856  
                       freerdp | CVE-2026-22852   | https://security-tracker.debian.org/tracker/CVE-2026-22852  
                       freerdp | CVE-2026-68579   | https://security-tracker.debian.org/tracker/CVE-2026-68579  
                       freerdp | CVE-2026-68580   | https://security-tracker.debian.org/tracker/CVE-2026-68580  
                       freerdp | CVE-2026-110832  | https://security-tracker.debian.org/tracker/CVE-2026-110832 
                       freerdp | CVE-2026-110837  | https://security-tracker.debian.org/tracker/CVE-2026-110837 
                       freerdp | CVE-2026-110834  | https://security-tracker.debian.org/tracker/CVE-2026-110834 
                       freerdp | CVE-2026-110830  | https://security-tracker.debian.org/tracker/CVE-2026-110830 
                       freerdp | CVE-2026-67288   | https://security-tracker.debian.org/tracker/CVE-2026-67288  
                       freerdp | CVE-2026-67290   | https://security-tracker.debian.org/tracker/CVE-2026-67290  
                       freerdp | CVE-2026-67294   | https://security-tracker.debian.org/tracker/CVE-2026-67294  
                       freerdp | CVE-2026-67289   | https://security-tracker.debian.org/tracker/CVE-2026-67289  
                       freerdp | CVE-2026-67293   | https://security-tracker.debian.org/tracker/CVE-2026-67293  
                       freerdp | CVE-2026-67296   | https://security-tracker.debian.org/tracker/CVE-2026-67296  
                       freerdp | CVE-2026-67299   | https://security-tracker.debian.org/tracker/CVE-2026-67299  
                       freerdp | CVE-2026-67291   | https://security-tracker.debian.org/tracker/CVE-2026-67291  
                       freerdp | CVE-2026-67297   | https://security-tracker.debian.org/tracker/CVE-2026-67297  
                       freerdp | CVE-2026-67292   | https://security-tracker.debian.org/tracker/CVE-2026-67292  
                       freerdp | CVE-2026-29775   | https://security-tracker.debian.org/tracker/CVE-2026-29775  
                       freerdp | CVE-2026-29776   | https://security-tracker.debian.org/tracker/CVE-2026-29776  
                       freerdp | CVE-2026-29774   | https://security-tracker.debian.org/tracker/CVE-2026-29774  
                       freerdp | CVE-2026-64624   | https://security-tracker.debian.org/tracker/CVE-2026-64624  
                       freerdp | CVE-2026-64620   | https://security-tracker.debian.org/tracker/CVE-2026-64620  
                       freerdp | CVE-2026-31897   | https://security-tracker.debian.org/tracker/CVE-2026-31897  
                       freerdp | CVE-2026-31885   | https://security-tracker.debian.org/tracker/CVE-2026-31885  
                       freerdp | CVE-2026-31883   | https://security-tracker.debian.org/tracker/CVE-2026-31883  
                       freerdp | CVE-2026-31806   | https://security-tracker.debian.org/tracker/CVE-2026-31806  
                       freerdp | CVE-2026-31884   | https://security-tracker.debian.org/tracker/CVE-2026-31884  
                       freerdp | CVE-2026-27015   | https://security-tracker.debian.org/tracker/CVE-2026-27015  
                       freerdp | CVE-2026-33995   | https://security-tracker.debian.org/tracker/CVE-2026-33995  
                       freerdp | CVE-2026-33986   | https://security-tracker.debian.org/tracker/CVE-2026-33986  
                       freerdp | CVE-2026-33983   | https://security-tracker.debian.org/tracker/CVE-2026-33983  
                       freerdp | CVE-2026-33985   | https://security-tracker.debian.org/tracker/CVE-2026-33985  
                       freerdp | CVE-2026-33987   | https://security-tracker.debian.org/tracker/CVE-2026-33987  
                       freerdp | CVE-2026-33977   | https://security-tracker.debian.org/tracker/CVE-2026-33977  
                       freerdp | CVE-2026-33984   | https://security-tracker.debian.org/tracker/CVE-2026-33984  
                       freerdp | CVE-2026-33952   | https://security-tracker.debian.org/tracker/CVE-2026-33952  
                       freerdp | CVE-2026-33982   | https://security-tracker.debian.org/tracker/CVE-2026-33982  
                       freerdp | CVE-2026-40254   | https://security-tracker.debian.org/tracker/CVE-2026-40254  
                       freerdp | CVE-2026-55191   | https://security-tracker.debian.org/tracker/CVE-2026-55191  
                       freerdp | CVE-2026-55192   | https://security-tracker.debian.org/tracker/CVE-2026-55192  
                       freerdp | CVE-2026-55193   | https://security-tracker.debian.org/tracker/CVE-2026-55193  
                       freerdp | CVE-2026-55194   | https://security-tracker.debian.org/tracker/CVE-2026-55194  
                       freerdp | CVE-2026-26271   | https://security-tracker.debian.org/tracker/CVE-2026-26271  
                       freerdp | CVE-2026-24491   | https://security-tracker.debian.org/tracker/CVE-2026-24491  
                       freerdp | CVE-2026-57157   | https://security-tracker.debian.org/tracker/CVE-2026-57157  
                       freerdp | CVE-2026-57156   | https://security-tracker.debian.org/tracker/CVE-2026-57156  
                       freerdp | CVE-2026-40033   | https://security-tracker.debian.org/tracker/CVE-2026-40033  
                       freerdp | CVE-2026-26986   | https://security-tracker.debian.org/tracker/CVE-2026-26986  
                       freerdp | CVE-2026-26965   | https://security-tracker.debian.org/tracker/CVE-2026-26965  
                       freerdp | CVE-2026-26955   | https://security-tracker.debian.org/tracker/CVE-2026-26955  
                       freerdp | CVE-2026-56297   | https://security-tracker.debian.org/tracker/CVE-2026-56297  
                       freerdp | CVE-2026-24677   | https://security-tracker.debian.org/tracker/CVE-2026-24677  
                       freerdp | CVE-2026-24678   | https://security-tracker.debian.org/tracker/CVE-2026-24678  
                       freerdp | CVE-2026-24680   | https://security-tracker.debian.org/tracker/CVE-2026-24680  
                       freerdp | CVE-2026-45700   | https://security-tracker.debian.org/tracker/CVE-2026-45700  
                       freerdp | CVE-2026-111373  | https://security-tracker.debian.org/tracker/CVE-2026-111373 
                       freerdp | CVE-2026-111382  | https://security-tracker.debian.org/tracker/CVE-2026-111382 
                       freerdp | CVE-2026-111381  | https://security-tracker.debian.org/tracker/CVE-2026-111381 
                       freerdp | CVE-2026-111379  | https://security-tracker.debian.org/tracker/CVE-2026-111379 
                       freerdp | CVE-2026-111377  | https://security-tracker.debian.org/tracker/CVE-2026-111377 
                       freerdp | CVE-2026-67306   | https://security-tracker.debian.org/tracker/CVE-2026-67306  
                       freerdp | CVE-2026-67303   | https://security-tracker.debian.org/tracker/CVE-2026-67303  
                       freerdp | CVE-2026-67301   | https://security-tracker.debian.org/tracker/CVE-2026-67301  
                       freerdp | CVE-2026-67304   | https://security-tracker.debian.org/tracker/CVE-2026-67304  
                       freerdp | CVE-2026-67305   | https://security-tracker.debian.org/tracker/CVE-2026-67305  
                       freerdp | CVE-2026-67302   | https://security-tracker.debian.org/tracker/CVE-2026-67302  
                       freerdp | CVE-2026-85090   | https://security-tracker.debian.org/tracker/CVE-2026-85090  
                       freerdp | CVE-2026-55827   | https://security-tracker.debian.org/tracker/CVE-2026-55827  
                       freerdp | CVE-2026-23883   | https://security-tracker.debian.org/tracker/CVE-2026-23883  
                       freerdp | CVE-2026-23884   | https://security-tracker.debian.org/tracker/CVE-2026-23884  
                       freerdp | CVE-2026-44422   | https://security-tracker.debian.org/tracker/CVE-2026-44422  
                       freerdp | CVE-2026-44420   | https://security-tracker.debian.org/tracker/CVE-2026-44420  
                       freerdp | CVE-2026-44421   | https://security-tracker.debian.org/tracker/CVE-2026-44421  
                       freerdp | CVE-2026-23732   | https://security-tracker.debian.org/tracker/CVE-2026-23732  
                       freerdp | CVE-2026-73242   | https://security-tracker.debian.org/tracker/CVE-2026-73242  
                       freerdp | CVE-2026-73241   | https://security-tracker.debian.org/tracker/CVE-2026-73241  
                       freerdp | CVE-2026-63633   | https://security-tracker.debian.org/tracker/CVE-2026-63633  
                       freerdp | CVE-2026-63652   | https://security-tracker.debian.org/tracker/CVE-2026-63652  
                       freerdp | CVE-2026-63117   | https://security-tracker.debian.org/tracker/CVE-2026-63117  
                       freerdp | CVE-2026-66401   | https://security-tracker.debian.org/tracker/CVE-2026-66401  
                       freerdp | CVE-2026-66402   | https://security-tracker.debian.org/tracker/CVE-2026-66402  
                       freerdp | CVE-2026-55564   | https://security-tracker.debian.org/tracker/CVE-2026-55564  
                       freerdp | CVE-2026-25959   | https://security-tracker.debian.org/tracker/CVE-2026-25959  
                       freerdp | CVE-2026-25954   | https://security-tracker.debian.org/tracker/CVE-2026-25954  
                       freerdp | CVE-2026-25952   | https://security-tracker.debian.org/tracker/CVE-2026-25952  
                       freerdp | CVE-2026-25942   | https://security-tracker.debian.org/tracker/CVE-2026-25942  
                       freerdp | CVE-2026-25955   | https://security-tracker.debian.org/tracker/CVE-2026-25955  
                       freerdp | CVE-2026-25997   | https://security-tracker.debian.org/tracker/CVE-2026-25997  
                       freerdp | CVE-2026-25953   | https://security-tracker.debian.org/tracker/CVE-2026-25953  
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                          gdal | CVE-2026-49014   | https://security-tracker.debian.org/tracker/CVE-2026-49014  
                          gdal | CVE-2026-8088    | https://security-tracker.debian.org/tracker/CVE-2026-8088   
                          gdal | CVE-2026-8087    | https://security-tracker.debian.org/tracker/CVE-2026-8087   
                          gdal | CVE-2026-8084    | https://security-tracker.debian.org/tracker/CVE-2026-8084   
                          gdal | CVE-2026-8086    | https://security-tracker.debian.org/tracker/CVE-2026-8086   
                          gdal | CVE-2026-8212    | https://security-tracker.debian.org/tracker/CVE-2026-8212   
                          gdal | CVE-2026-8213    | https://security-tracker.debian.org/tracker/CVE-2026-8213   
                         glibc | CVE-2026-5435    | https://security-tracker.debian.org/tracker/CVE-2026-5435   
                         glibc | CVE-2026-6238    | https://security-tracker.debian.org/tracker/CVE-2026-6238   
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                         gnupg | CVE-2025-30258   | https://security-tracker.debian.org/tracker/CVE-2025-30258  
                         gnupg | CVE-2025-68973   | https://security-tracker.debian.org/tracker/CVE-2025-68973  
                         gnupg | CVE-2025-68972   | https://security-tracker.debian.org/tracker/CVE-2025-68972  
             gst1-plugins-good | CVE-2026-46470   | https://security-tracker.debian.org/tracker/CVE-2026-46470  
             gst1-plugins-good | CVE-2026-46469   | https://security-tracker.debian.org/tracker/CVE-2026-46469  
                    gstreamer1 | CVE-2025-47183   | https://security-tracker.debian.org/tracker/CVE-2025-47183  
                    gstreamer1 | CVE-2025-3887    | https://security-tracker.debian.org/tracker/CVE-2025-3887   
                    gstreamer1 | CVE-2025-47219   | https://security-tracker.debian.org/tracker/CVE-2025-47219  
                    gstreamer1 | CVE-2025-2759    | https://security-tracker.debian.org/tracker/CVE-2025-2759   
                    gstreamer1 | CVE-2025-47808   | https://security-tracker.debian.org/tracker/CVE-2025-47808  
                    gstreamer1 | CVE-2025-47806   | https://security-tracker.debian.org/tracker/CVE-2025-47806  
                    gstreamer1 | CVE-2025-47807   | https://security-tracker.debian.org/tracker/CVE-2025-47807  
                    gstreamer1 | CVE-2026-73433   | https://security-tracker.debian.org/tracker/CVE-2026-73433  
                    gstreamer1 | CVE-2026-73434   | https://security-tracker.debian.org/tracker/CVE-2026-73434  
                    gstreamer1 | CVE-2026-1940    | https://security-tracker.debian.org/tracker/CVE-2026-1940   
                    gstreamer1 | CVE-2026-2921    | https://security-tracker.debian.org/tracker/CVE-2026-2921   
                    gstreamer1 | CVE-2026-2923    | https://security-tracker.debian.org/tracker/CVE-2026-2923   
                    gstreamer1 | CVE-2026-2920    | https://security-tracker.debian.org/tracker/CVE-2026-2920   
                    gstreamer1 | CVE-2026-2922    | https://security-tracker.debian.org/tracker/CVE-2026-2922   
                    gstreamer1 | CVE-2026-18299   | https://security-tracker.debian.org/tracker/CVE-2026-18299  
                    gstreamer1 | CVE-2026-18297   | https://security-tracker.debian.org/tracker/CVE-2026-18297  
                    gstreamer1 | CVE-2026-18296   | https://security-tracker.debian.org/tracker/CVE-2026-18296  
                    gstreamer1 | CVE-2026-18298   | https://security-tracker.debian.org/tracker/CVE-2026-18298  
                    gstreamer1 | CVE-2026-18295   | https://security-tracker.debian.org/tracker/CVE-2026-18295  
                    gstreamer1 | CVE-2026-3081    | https://security-tracker.debian.org/tracker/CVE-2026-3081   
                    gstreamer1 | CVE-2026-3084    | https://security-tracker.debian.org/tracker/CVE-2026-3084   
                    gstreamer1 | CVE-2026-3085    | https://security-tracker.debian.org/tracker/CVE-2026-3085   
                    gstreamer1 | CVE-2026-3083    | https://security-tracker.debian.org/tracker/CVE-2026-3083   
                    gstreamer1 | CVE-2026-3086    | https://security-tracker.debian.org/tracker/CVE-2026-3086   
                    gstreamer1 | CVE-2026-3082    | https://security-tracker.debian.org/tracker/CVE-2026-3082   
                         hplip | CVE-2025-43023   | https://security-tracker.debian.org/tracker/CVE-2025-43023  
                         hplip | CVE-2026-91101   | https://security-tracker.debian.org/tracker/CVE-2026-91101  
                         hplip | CVE-2026-91102   | https://security-tracker.debian.org/tracker/CVE-2026-91102  
                         hplip | CVE-2026-91105   | https://security-tracker.debian.org/tracker/CVE-2026-91105  
                         hplip | CVE-2026-91106   | https://security-tracker.debian.org/tracker/CVE-2026-91106  
                         hplip | CVE-2026-91103   | https://security-tracker.debian.org/tracker/CVE-2026-91103  
                         hplip | CVE-2026-91104   | https://security-tracker.debian.org/tracker/CVE-2026-91104  
                         hplip | CVE-2026-91100   | https://security-tracker.debian.org/tracker/CVE-2026-91100  
                         hplip | CVE-2026-91099   | https://security-tracker.debian.org/tracker/CVE-2026-91099  
                         hplip | CVE-2026-91098   | https://security-tracker.debian.org/tracker/CVE-2026-91098  
                         hplip | CVE-2026-91097   | https://security-tracker.debian.org/tracker/CVE-2026-91097  
                         hplip | CVE-2026-8632    | https://security-tracker.debian.org/tracker/CVE-2026-8632   
                         hplip | CVE-2026-8631    | https://security-tracker.debian.org/tracker/CVE-2026-8631   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2026-93590   | https://security-tracker.debian.org/tracker/CVE-2026-93590  
                   imagemagick | CVE-2026-93586   | https://security-tracker.debian.org/tracker/CVE-2026-93586  
                   imagemagick | CVE-2026-93587   | https://security-tracker.debian.org/tracker/CVE-2026-93587  
                   imagemagick | CVE-2026-93589   | https://security-tracker.debian.org/tracker/CVE-2026-93589  
                   imagemagick | CVE-2026-93588   | https://security-tracker.debian.org/tracker/CVE-2026-93588  
                   imagemagick | CVE-2026-86425   | https://security-tracker.debian.org/tracker/CVE-2026-86425  
                   imagemagick | CVE-2026-86424   | https://security-tracker.debian.org/tracker/CVE-2026-86424  
                   imagemagick | CVE-2026-86420   | https://security-tracker.debian.org/tracker/CVE-2026-86420  
                   imagemagick | CVE-2026-86423   | https://security-tracker.debian.org/tracker/CVE-2026-86423  
                   imagemagick | CVE-2026-86421   | https://security-tracker.debian.org/tracker/CVE-2026-86421  
                   imagemagick | CVE-2026-86422   | https://security-tracker.debian.org/tracker/CVE-2026-86422  
                   imagemagick | CVE-2026-62946   | https://security-tracker.debian.org/tracker/CVE-2026-62946  
                   imagemagick | CVE-2026-64685   | https://security-tracker.debian.org/tracker/CVE-2026-64685  
                   imagemagick | CVE-2026-107209  | https://security-tracker.debian.org/tracker/CVE-2026-107209 
                   imagemagick | CVE-2026-107208  | https://security-tracker.debian.org/tracker/CVE-2026-107208 
                   imagemagick | CVE-2026-107210  | https://security-tracker.debian.org/tracker/CVE-2026-107210 
                   imagemagick | CVE-2026-105083  | https://security-tracker.debian.org/tracker/CVE-2026-105083 
                   imagemagick | CVE-2026-106569  | https://security-tracker.debian.org/tracker/CVE-2026-106569 
                   imagemagick | CVE-2026-106574  | https://security-tracker.debian.org/tracker/CVE-2026-106574 
                   imagemagick | CVE-2026-106566  | https://security-tracker.debian.org/tracker/CVE-2026-106566 
                   imagemagick | CVE-2026-106580  | https://security-tracker.debian.org/tracker/CVE-2026-106580 
                   imagemagick | CVE-2026-106567  | https://security-tracker.debian.org/tracker/CVE-2026-106567 
                   imagemagick | CVE-2026-106568  | https://security-tracker.debian.org/tracker/CVE-2026-106568 
                   imagemagick | CVE-2026-106578  | https://security-tracker.debian.org/tracker/CVE-2026-106578 
                   imagemagick | CVE-2026-106571  | https://security-tracker.debian.org/tracker/CVE-2026-106571 
                   imagemagick | CVE-2026-106565  | https://security-tracker.debian.org/tracker/CVE-2026-106565 
                   imagemagick | CVE-2026-106572  | https://security-tracker.debian.org/tracker/CVE-2026-106572 
                   imagemagick | CVE-2026-106575  | https://security-tracker.debian.org/tracker/CVE-2026-106575 
                   imagemagick | CVE-2026-106564  | https://security-tracker.debian.org/tracker/CVE-2026-106564 
                   imagemagick | CVE-2026-106576  | https://security-tracker.debian.org/tracker/CVE-2026-106576 
                   imagemagick | CVE-2026-106570  | https://security-tracker.debian.org/tracker/CVE-2026-106570 
                   imagemagick | CVE-2026-106573  | https://security-tracker.debian.org/tracker/CVE-2026-106573 
                   imagemagick | CVE-2026-106577  | https://security-tracker.debian.org/tracker/CVE-2026-106577 
                   imagemagick | CVE-2026-106579  | https://security-tracker.debian.org/tracker/CVE-2026-106579 
                   imagemagick | CVE-2026-66011   | https://security-tracker.debian.org/tracker/CVE-2026-66011  
                   imagemagick | CVE-2026-102635  | https://security-tracker.debian.org/tracker/CVE-2026-102635 
                   imagemagick | CVE-2026-62363   | https://security-tracker.debian.org/tracker/CVE-2026-62363  
                         jhead | CVE-2025-44906   | https://security-tracker.debian.org/tracker/CVE-2025-44906  
                            jq | CVE-2026-44777   | https://security-tracker.debian.org/tracker/CVE-2026-44777  
                            jq | CVE-2026-39979   | https://security-tracker.debian.org/tracker/CVE-2026-39979  
                        libidn | CVE-2026-57053   | https://security-tracker.debian.org/tracker/CVE-2026-57053  
                      libkcapi | CVE-2026-71225   | https://security-tracker.debian.org/tracker/CVE-2026-71225  
                      libkcapi | CVE-2026-71226   | https://security-tracker.debian.org/tracker/CVE-2026-71226  
                      libkcapi | CVE-2026-71227   | https://security-tracker.debian.org/tracker/CVE-2026-71227  
                       libkrb5 | CVE-2026-40355   | https://security-tracker.debian.org/tracker/CVE-2026-40355  
                       libkrb5 | CVE-2026-40356   | https://security-tracker.debian.org/tracker/CVE-2026-40356  
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libpjsip | CVE-2026-57163   | https://security-tracker.debian.org/tracker/CVE-2026-57163  
                      libpjsip | CVE-2026-57162   | https://security-tracker.debian.org/tracker/CVE-2026-57162  
                      libpjsip | CVE-2026-57160   | https://security-tracker.debian.org/tracker/CVE-2026-57160  
                      libpjsip | CVE-2026-57164   | https://security-tracker.debian.org/tracker/CVE-2026-57164  
                      libpjsip | CVE-2026-57161   | https://security-tracker.debian.org/tracker/CVE-2026-57161  
                      libpjsip | CVE-2026-57166   | https://security-tracker.debian.org/tracker/CVE-2026-57166  
                      libpjsip | CVE-2026-57159   | https://security-tracker.debian.org/tracker/CVE-2026-57159  
                      libpjsip | CVE-2026-57165   | https://security-tracker.debian.org/tracker/CVE-2026-57165  
                      libpjsip | CVE-2026-84975   | https://security-tracker.debian.org/tracker/CVE-2026-84975  
                      libpjsip | CVE-2026-77396   | https://security-tracker.debian.org/tracker/CVE-2026-77396  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                        libraw | CVE-2026-5342    | https://security-tracker.debian.org/tracker/CVE-2026-5342   
                        libraw | CVE-2026-5318    | https://security-tracker.debian.org/tracker/CVE-2026-5318   
                    libsndfile | CVE-2024-50613   | https://security-tracker.debian.org/tracker/CVE-2024-50613  
                    libsndfile | CVE-2025-52194   | https://security-tracker.debian.org/tracker/CVE-2025-52194  
                    libsndfile | CVE-2025-56226   | https://security-tracker.debian.org/tracker/CVE-2025-56226  
                    libsndfile | CVE-2026-37555   | https://security-tracker.debian.org/tracker/CVE-2026-37555  
                       libsolv | CVE-2026-9150    | https://security-tracker.debian.org/tracker/CVE-2026-9150   
                       libsolv | CVE-2026-9149    | https://security-tracker.debian.org/tracker/CVE-2026-9149   
                       libsoup | CVE-2026-102560  | https://security-tracker.debian.org/tracker/CVE-2026-102560 
                       libsoup | CVE-2026-102558  | https://security-tracker.debian.org/tracker/CVE-2026-102558 
                       libsoup | CVE-2026-102555  | https://security-tracker.debian.org/tracker/CVE-2026-102555 
                       libsoup | CVE-2026-102556  | https://security-tracker.debian.org/tracker/CVE-2026-102556 
                       libsoup | CVE-2026-102559  | https://security-tracker.debian.org/tracker/CVE-2026-102559 
                       libsoup | CVE-2026-102557  | https://security-tracker.debian.org/tracker/CVE-2026-102557 
                       libssh2 | CVE-2026-58051   | https://security-tracker.debian.org/tracker/CVE-2026-58051  
                       libssh2 | CVE-2026-58050   | https://security-tracker.debian.org/tracker/CVE-2026-58050  
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                        libucl | CVE-2025-6499    | https://security-tracker.debian.org/tracker/CVE-2025-6499   
                        libucl | CVE-2026-0708    | https://security-tracker.debian.org/tracker/CVE-2026-0708   
                       libvips | CVE-2026-35590   | https://security-tracker.debian.org/tracker/CVE-2026-35590  
                       libvips | CVE-2026-35591   | https://security-tracker.debian.org/tracker/CVE-2026-35591  
                       libvips | CVE-2026-3146    | https://security-tracker.debian.org/tracker/CVE-2026-3146   
                       libvips | CVE-2026-3147    | https://security-tracker.debian.org/tracker/CVE-2026-3147   
                       libvips | CVE-2026-3145    | https://security-tracker.debian.org/tracker/CVE-2026-3145   
                       libvips | CVE-2026-33328   | https://security-tracker.debian.org/tracker/CVE-2026-33328  
                       libvips | CVE-2026-33327   | https://security-tracker.debian.org/tracker/CVE-2026-33327  
                       libvips | CVE-2026-2913    | https://security-tracker.debian.org/tracker/CVE-2026-2913   
                       libvirt | CVE-2024-2496    | https://security-tracker.debian.org/tracker/CVE-2024-2496   
                         lrzip | CVE-2025-9396    | https://security-tracker.debian.org/tracker/CVE-2025-9396   
                         lrzip | CVE-2025-15570   | https://security-tracker.debian.org/tracker/CVE-2025-15570  
                         lrzip | CVE-2025-15571   | https://security-tracker.debian.org/tracker/CVE-2025-15571  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                           lxc | CVE-2026-39402   | https://security-tracker.debian.org/tracker/CVE-2026-39402  
                       mariadb | CVE-2026-97380   | https://security-tracker.debian.org/tracker/CVE-2026-97380  
                       mariadb | CVE-2026-92262   | https://security-tracker.debian.org/tracker/CVE-2026-92262  
                       mariadb | CVE-2026-35549   | https://security-tracker.debian.org/tracker/CVE-2026-35549  
                       mariadb | CVE-2026-85745   | https://security-tracker.debian.org/tracker/CVE-2026-85745  
                       mariadb | CVE-2026-85746   | https://security-tracker.debian.org/tracker/CVE-2026-85746  
                       mariadb | CVE-2026-85985   | https://security-tracker.debian.org/tracker/CVE-2026-85985  
                       mariadb | CVE-2026-86047   | https://security-tracker.debian.org/tracker/CVE-2026-86047  
                       mariadb | CVE-2026-107822  | https://security-tracker.debian.org/tracker/CVE-2026-107822 
                       mariadb | CVE-2026-107823  | https://security-tracker.debian.org/tracker/CVE-2026-107823 
                       mariadb | CVE-2026-107814  | https://security-tracker.debian.org/tracker/CVE-2026-107814 
                       mariadb | CVE-2026-107816  | https://security-tracker.debian.org/tracker/CVE-2026-107816 
                       mariadb | CVE-2026-107818  | https://security-tracker.debian.org/tracker/CVE-2026-107818 
                       mariadb | CVE-2026-107817  | https://security-tracker.debian.org/tracker/CVE-2026-107817 
                       mariadb | CVE-2026-107815  | https://security-tracker.debian.org/tracker/CVE-2026-107815 
                       mariadb | CVE-2026-107821  | https://security-tracker.debian.org/tracker/CVE-2026-107821 
                      minetest | CVE-2026-41196   | https://security-tracker.debian.org/tracker/CVE-2026-41196  
                      minidlna | CVE-2023-47430   | https://security-tracker.debian.org/tracker/CVE-2023-47430  
                  modsecurity2 | CVE-2026-52747   | https://security-tracker.debian.org/tracker/CVE-2026-52747  
                  modsecurity2 | CVE-2026-30923   | https://security-tracker.debian.org/tracker/CVE-2026-30923  
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mupdf | CVE-2025-71382   | https://security-tracker.debian.org/tracker/CVE-2025-71382  
                         mupdf | CVE-2025-46206   | https://security-tracker.debian.org/tracker/CVE-2025-46206  
                         mupdf | CVE-2026-7233    | https://security-tracker.debian.org/tracker/CVE-2026-7233   
                         mupdf | CVE-2026-40505   | https://security-tracker.debian.org/tracker/CVE-2026-40505  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                       netdata | CVE-2025-71385   | https://security-tracker.debian.org/tracker/CVE-2025-71385  
                          ogre | CVE-2025-11017   | https://security-tracker.debian.org/tracker/CVE-2025-11017  
                          ogre | CVE-2025-11014   | https://security-tracker.debian.org/tracker/CVE-2025-11014  
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                      opendoas | CVE-2023-28339   | https://security-tracker.debian.org/tracker/CVE-2023-28339  
                openfpgaloader | CVE-2026-35170   | https://security-tracker.debian.org/tracker/CVE-2026-35170  
                openfpgaloader | CVE-2026-35176   | https://security-tracker.debian.org/tracker/CVE-2026-35176  
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                        parsec | CVE-2018-6651    | https://security-tracker.debian.org/tracker/CVE-2018-6651   
                        parsec | CVE-2023-37250   | https://security-tracker.debian.org/tracker/CVE-2023-37250  
                         patch | CVE-2026-56289   | https://security-tracker.debian.org/tracker/CVE-2026-56289  
                         patch | CVE-2026-56288   | https://security-tracker.debian.org/tracker/CVE-2026-56288  
                          perl | CVE-2026-8376    | https://security-tracker.debian.org/tracker/CVE-2026-8376   
                          perl | CVE-2026-57432   | https://security-tracker.debian.org/tracker/CVE-2026-57432  
                          perl | CVE-2026-13221   | https://security-tracker.debian.org/tracker/CVE-2026-13221  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                        podman | CVE-2022-2989    | https://security-tracker.debian.org/tracker/CVE-2022-2989   
                        podman | CVE-2026-57231   | https://security-tracker.debian.org/tracker/CVE-2026-57231  
                        podman | CVE-2026-55686   | https://security-tracker.debian.org/tracker/CVE-2026-55686  
                       proftpd | CVE-2026-53994   | https://security-tracker.debian.org/tracker/CVE-2026-53994  
                       prosody | CVE-2026-43506   | https://security-tracker.debian.org/tracker/CVE-2026-43506  
                       prosody | CVE-2026-43504   | https://security-tracker.debian.org/tracker/CVE-2026-43504  
                       prosody | CVE-2026-43505   | https://security-tracker.debian.org/tracker/CVE-2026-43505  
                       prosody | CVE-2026-43507   | https://security-tracker.debian.org/tracker/CVE-2026-43507  
                proxychains-ng | CVE-2025-34451   | https://security-tracker.debian.org/tracker/CVE-2025-34451  
                 python-django | CVE-2026-15920   | https://security-tracker.debian.org/tracker/CVE-2026-15920  
                 python-django | CVE-2026-48588   | https://security-tracker.debian.org/tracker/CVE-2026-48588  
                 python-django | CVE-2026-15830   | https://security-tracker.debian.org/tracker/CVE-2026-15830  
                 python-django | CVE-2026-15307   | https://security-tracker.debian.org/tracker/CVE-2026-15307  
                 python-django | CVE-2026-15337   | https://security-tracker.debian.org/tracker/CVE-2026-15337  
                 python-django | CVE-2026-53878   | https://security-tracker.debian.org/tracker/CVE-2026-53878  
                 python-django | CVE-2026-53877   | https://security-tracker.debian.org/tracker/CVE-2026-53877  
                 python-pillow | CVE-2026-112390  | https://security-tracker.debian.org/tracker/CVE-2026-112390 
                 python-pillow | CVE-2026-112391  | https://security-tracker.debian.org/tracker/CVE-2026-112391 
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                       qt5base | CVE-2025-30348   | https://security-tracker.debian.org/tracker/CVE-2025-30348  
                        ranger | CVE-2024-55532   | https://security-tracker.debian.org/tracker/CVE-2024-55532  
                        ranger | CVE-2025-59059   | https://security-tracker.debian.org/tracker/CVE-2025-59059  
                        ranger | CVE-2025-59060   | https://security-tracker.debian.org/tracker/CVE-2025-59060  
                        ranger | CVE-2026-65948   | https://security-tracker.debian.org/tracker/CVE-2026-65948  
                        ranger | CVE-2026-65945   | https://security-tracker.debian.org/tracker/CVE-2026-65945  
                        ranger | CVE-2026-65942   | https://security-tracker.debian.org/tracker/CVE-2026-65942  
                        ranger | CVE-2026-28672   | https://security-tracker.debian.org/tracker/CVE-2026-28672  
                        ranger | CVE-2026-42537   | https://security-tracker.debian.org/tracker/CVE-2026-42537  
                        ranger | CVE-2026-40920   | https://security-tracker.debian.org/tracker/CVE-2026-40920  
                        ranger | CVE-2026-55799   | https://security-tracker.debian.org/tracker/CVE-2026-55799  
                        ranger | CVE-2026-55814   | https://security-tracker.debian.org/tracker/CVE-2026-55814  
                        ranger | CVE-2026-44416   | https://security-tracker.debian.org/tracker/CVE-2026-44416  
                        ranger | CVE-2026-32227   | https://security-tracker.debian.org/tracker/CVE-2026-32227  
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2026-2340    | https://security-tracker.debian.org/tracker/CVE-2026-2340   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                    sdl2_image | CVE-2026-35444   | https://security-tracker.debian.org/tracker/CVE-2026-35444  
                     sdl_image | CVE-2026-35444   | https://security-tracker.debian.org/tracker/CVE-2026-35444  
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                    strongswan | CVE-2026-78132   | https://security-tracker.debian.org/tracker/CVE-2026-78132  
                    strongswan | CVE-2026-78126   | https://security-tracker.debian.org/tracker/CVE-2026-78126  
                    strongswan | CVE-2026-78131   | https://security-tracker.debian.org/tracker/CVE-2026-78131  
                    strongswan | CVE-2026-78133   | https://security-tracker.debian.org/tracker/CVE-2026-78133  
                    strongswan | CVE-2026-78123   | https://security-tracker.debian.org/tracker/CVE-2026-78123  
                    strongswan | CVE-2026-78135   | https://security-tracker.debian.org/tracker/CVE-2026-78135  
                    strongswan | CVE-2026-78134   | https://security-tracker.debian.org/tracker/CVE-2026-78134  
                    strongswan | CVE-2026-78124   | https://security-tracker.debian.org/tracker/CVE-2026-78124  
                    strongswan | CVE-2026-78127   | https://security-tracker.debian.org/tracker/CVE-2026-78127  
                    strongswan | CVE-2026-78130   | https://security-tracker.debian.org/tracker/CVE-2026-78130  
                    strongswan | CVE-2026-78129   | https://security-tracker.debian.org/tracker/CVE-2026-78129  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                       systemd | CVE-2026-40223   | https://security-tracker.debian.org/tracker/CVE-2026-40223  
                           tar | CVE-2026-18508   | https://security-tracker.debian.org/tracker/CVE-2026-18508  
                           tar | CVE-2026-18477   | https://security-tracker.debian.org/tracker/CVE-2026-18477  
                   timescaledb | CVE-2026-70633   | https://security-tracker.debian.org/tracker/CVE-2026-70633  
                   timescaledb | CVE-2026-70635   | https://security-tracker.debian.org/tracker/CVE-2026-70635  
                   timescaledb | CVE-2026-70634   | https://security-tracker.debian.org/tracker/CVE-2026-70634  
                     tinyproxy | CVE-2026-31842   | https://security-tracker.debian.org/tracker/CVE-2026-31842  
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                           upx | CVE-2023-23456   | https://security-tracker.debian.org/tracker/CVE-2023-23456  
                           upx | CVE-2023-23457   | https://security-tracker.debian.org/tracker/CVE-2023-23457  
                           upx | CVE-2024-3209    | https://security-tracker.debian.org/tracker/CVE-2024-3209   
                           upx | CVE-2025-2849    | https://security-tracker.debian.org/tracker/CVE-2025-2849   
                    util-linux | CVE-2026-13595   | https://security-tracker.debian.org/tracker/CVE-2026-13595  
               util-linux-libs | CVE-2026-13595   | https://security-tracker.debian.org/tracker/CVE-2026-13595  
                          wget | CVE-2026-58472   | https://security-tracker.debian.org/tracker/CVE-2026-58472  
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2023-46839   | https://security-tracker.debian.org/tracker/CVE-2023-46839  
                           xen | CVE-2023-46842   | https://security-tracker.debian.org/tracker/CVE-2023-46842  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                           xen | CVE-2023-46840   | https://security-tracker.debian.org/tracker/CVE-2023-46840  
                           xen | CVE-2023-46841   | https://security-tracker.debian.org/tracker/CVE-2023-46841  
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2024-31143   | https://security-tracker.debian.org/tracker/CVE-2024-31143  
                           xen | CVE-2024-31145   | https://security-tracker.debian.org/tracker/CVE-2024-31145  
                           xen | CVE-2024-45817   | https://security-tracker.debian.org/tracker/CVE-2024-45817  
                           xen | CVE-2024-45819   | https://security-tracker.debian.org/tracker/CVE-2024-45819  
                           xen | CVE-2025-27465   | https://security-tracker.debian.org/tracker/CVE-2025-27465  
                           xen | CVE-2025-58147   | https://security-tracker.debian.org/tracker/CVE-2025-58147  
                           xen | CVE-2025-58148   | https://security-tracker.debian.org/tracker/CVE-2025-58148  
                           xen | CVE-2025-58149   | https://security-tracker.debian.org/tracker/CVE-2025-58149  
                           xen | CVE-2025-1713    | https://security-tracker.debian.org/tracker/CVE-2025-1713   
                           xen | CVE-2026-23555   | https://security-tracker.debian.org/tracker/CVE-2026-23555  
                           xen | CVE-2026-23554   | https://security-tracker.debian.org/tracker/CVE-2026-23554  
                           xen | CVE-2026-23558   | https://security-tracker.debian.org/tracker/CVE-2026-23558  
                           xen | CVE-2026-23553   | https://security-tracker.debian.org/tracker/CVE-2026-23553  
                           xen | CVE-2026-23557   | https://security-tracker.debian.org/tracker/CVE-2026-23557  
           xserver_xorg-server | CVE-2023-5574    | https://security-tracker.debian.org/tracker/CVE-2023-5574   
           xserver_xorg-server | CVE-2026-56000   | https://security-tracker.debian.org/tracker/CVE-2026-56000  
           xserver_xorg-server | CVE-2026-55999   | https://security-tracker.debian.org/tracker/CVE-2026-55999  
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2023-51258   | https://security-tracker.debian.org/tracker/CVE-2023-51258  
                          yasm | CVE-2023-31973   | https://security-tracker.debian.org/tracker/CVE-2023-31973  
                          yasm | CVE-2023-31974   | https://security-tracker.debian.org/tracker/CVE-2023-31974  
                          yasm | CVE-2023-31972   | https://security-tracker.debian.org/tracker/CVE-2023-31972  

CVEs for the '2026.08.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                         avahi | CVE-2025-59529   | https://security-tracker.debian.org/tracker/CVE-2025-59529  
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2025-69649   | https://security-tracker.debian.org/tracker/CVE-2025-69649  
                      binutils | CVE-2025-69647   | https://security-tracker.debian.org/tracker/CVE-2025-69647  
                      binutils | CVE-2025-69648   | https://security-tracker.debian.org/tracker/CVE-2025-69648  
                      binutils | CVE-2025-69651   | https://security-tracker.debian.org/tracker/CVE-2025-69651  
                      binutils | CVE-2025-69652   | https://security-tracker.debian.org/tracker/CVE-2025-69652  
                      binutils | CVE-2025-69650   | https://security-tracker.debian.org/tracker/CVE-2025-69650  
                      binutils | CVE-2025-69644   | https://security-tracker.debian.org/tracker/CVE-2025-69644  
                      binutils | CVE-2026-6846    | https://security-tracker.debian.org/tracker/CVE-2026-6846   
           binutils-bare-metal | CVE-2026-90828   | https://security-tracker.debian.org/tracker/CVE-2026-90828  
           binutils-bare-metal | CVE-2026-90803   | https://security-tracker.debian.org/tracker/CVE-2026-90803  
           binutils-bare-metal | CVE-2026-90804   | https://security-tracker.debian.org/tracker/CVE-2026-90804  
           binutils-bare-metal | CVE-2026-90829   | https://security-tracker.debian.org/tracker/CVE-2026-90829  
           binutils-bare-metal | CVE-2026-90801   | https://security-tracker.debian.org/tracker/CVE-2026-90801  
           binutils-bare-metal | CVE-2026-90802   | https://security-tracker.debian.org/tracker/CVE-2026-90802  
           binutils-bare-metal | CVE-2026-90830   | https://security-tracker.debian.org/tracker/CVE-2026-90830  
           binutils-bare-metal | CVE-2026-90831   | https://security-tracker.debian.org/tracker/CVE-2026-90831  
           binutils-bare-metal | CVE-2026-91782   | https://security-tracker.debian.org/tracker/CVE-2026-91782  
           binutils-bare-metal | CVE-2026-91781   | https://security-tracker.debian.org/tracker/CVE-2026-91781  
           binutils-bare-metal | CVE-2026-91779   | https://security-tracker.debian.org/tracker/CVE-2026-91779  
           binutils-bare-metal | CVE-2026-91780   | https://security-tracker.debian.org/tracker/CVE-2026-91780  
                         bison | CVE-2026-56390   | https://security-tracker.debian.org/tracker/CVE-2026-56390  
                         bison | CVE-2026-56389   | https://security-tracker.debian.org/tracker/CVE-2026-56389  
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                         botan | CVE-2026-44378   | https://security-tracker.debian.org/tracker/CVE-2026-44378  
                       busybox | CVE-2026-38755   | https://security-tracker.debian.org/tracker/CVE-2026-38755  
                       busybox | CVE-2026-38754   | https://security-tracker.debian.org/tracker/CVE-2026-38754  
                       busybox | CVE-2026-38753   | https://security-tracker.debian.org/tracker/CVE-2026-38753  
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                      civetweb | CVE-2026-5789    | https://security-tracker.debian.org/tracker/CVE-2026-5789   
                         cjson | CVE-2026-67216   | https://security-tracker.debian.org/tracker/CVE-2026-67216  
                         cjson | CVE-2026-67217   | https://security-tracker.debian.org/tracker/CVE-2026-67217  
                         cjson | CVE-2026-67215   | https://security-tracker.debian.org/tracker/CVE-2026-67215  
                         cjson | CVE-2026-16554   | https://security-tracker.debian.org/tracker/CVE-2026-16554  
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                      composer | CVE-2025-67746   | https://security-tracker.debian.org/tracker/CVE-2025-67746  
                      composer | CVE-2026-40261   | https://security-tracker.debian.org/tracker/CVE-2026-40261  
                      composer | CVE-2026-40176   | https://security-tracker.debian.org/tracker/CVE-2026-40176  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                     coreutils | CVE-2026-56391   | https://security-tracker.debian.org/tracker/CVE-2026-56391  
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                          crun | CVE-2026-30892   | https://security-tracker.debian.org/tracker/CVE-2026-30892  
               cryptodev-linux | CVE-2026-28529   | https://security-tracker.debian.org/tracker/CVE-2026-28529  
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                          cups | CVE-2026-55480   | https://security-tracker.debian.org/tracker/CVE-2026-55480  
                          cups | CVE-2026-55453   | https://security-tracker.debian.org/tracker/CVE-2026-55453  
                          cups | CVE-2026-55467   | https://security-tracker.debian.org/tracker/CVE-2026-55467  
                          cups | CVE-2026-61702   | https://security-tracker.debian.org/tracker/CVE-2026-61702  
                          cups | CVE-2026-107885  | https://security-tracker.debian.org/tracker/CVE-2026-107885 
                          cups | CVE-2026-107890  | https://security-tracker.debian.org/tracker/CVE-2026-107890 
                          cups | CVE-2026-107886  | https://security-tracker.debian.org/tracker/CVE-2026-107886 
                          cups | CVE-2026-107888  | https://security-tracker.debian.org/tracker/CVE-2026-107888 
                        dhcpcd | CVE-2026-56113   | https://security-tracker.debian.org/tracker/CVE-2026-56113  
                        dhcpcd | CVE-2026-56114   | https://security-tracker.debian.org/tracker/CVE-2026-56114  
                        dhcpcd | CVE-2026-56116   | https://security-tracker.debian.org/tracker/CVE-2026-56116  
                        dhcpcd | CVE-2026-56117   | https://security-tracker.debian.org/tracker/CVE-2026-56117  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                 docker-engine | CVE-2026-41568   | https://security-tracker.debian.org/tracker/CVE-2026-41568  
                 docker-engine | CVE-2026-42306   | https://security-tracker.debian.org/tracker/CVE-2026-42306  
                      domoticz | CVE-2026-1001    | https://security-tracker.debian.org/tracker/CVE-2026-1001   
                       dovecot | CVE-2025-59032   | https://security-tracker.debian.org/tracker/CVE-2025-59032  
                       dovecot | CVE-2025-59028   | https://security-tracker.debian.org/tracker/CVE-2025-59028  
                       dovecot | CVE-2025-59031   | https://security-tracker.debian.org/tracker/CVE-2025-59031  
                       dovecot | CVE-2026-33603   | https://security-tracker.debian.org/tracker/CVE-2026-33603  
                       dovecot | CVE-2026-0394    | https://security-tracker.debian.org/tracker/CVE-2026-0394   
                       dovecot | CVE-2026-40016   | https://security-tracker.debian.org/tracker/CVE-2026-40016  
                       dovecot | CVE-2026-40020   | https://security-tracker.debian.org/tracker/CVE-2026-40020  
                       dovecot | CVE-2026-42006   | https://security-tracker.debian.org/tracker/CVE-2026-42006  
                       dovecot | CVE-2026-24031   | https://security-tracker.debian.org/tracker/CVE-2026-24031  
                       dovecot | CVE-2026-27857   | https://security-tracker.debian.org/tracker/CVE-2026-27857  
                       dovecot | CVE-2026-27855   | https://security-tracker.debian.org/tracker/CVE-2026-27855  
                       dovecot | CVE-2026-27858   | https://security-tracker.debian.org/tracker/CVE-2026-27858  
                       dovecot | CVE-2026-27856   | https://security-tracker.debian.org/tracker/CVE-2026-27856  
                       dovecot | CVE-2026-27860   | https://security-tracker.debian.org/tracker/CVE-2026-27860  
                       dovecot | CVE-2026-27851   | https://security-tracker.debian.org/tracker/CVE-2026-27851  
                       dovecot | CVE-2026-27859   | https://security-tracker.debian.org/tracker/CVE-2026-27859  
                        drogon | CVE-2023-26138   | https://security-tracker.debian.org/tracker/CVE-2023-26138  
                        drogon | CVE-2023-26137   | https://security-tracker.debian.org/tracker/CVE-2023-26137  
                      easy-rsa | CVE-2024-13454   | https://security-tracker.debian.org/tracker/CVE-2024-13454  
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                         emlog | CVE-2024-12842   | https://security-tracker.debian.org/tracker/CVE-2024-12842  
                         emlog | CVE-2024-12846   | https://security-tracker.debian.org/tracker/CVE-2024-12846  
                         emlog | CVE-2024-12843   | https://security-tracker.debian.org/tracker/CVE-2024-12843  
                         emlog | CVE-2024-12841   | https://security-tracker.debian.org/tracker/CVE-2024-12841  
                         emlog | CVE-2024-12845   | https://security-tracker.debian.org/tracker/CVE-2024-12845  
                         emlog | CVE-2024-12844   | https://security-tracker.debian.org/tracker/CVE-2024-12844  
                         emlog | CVE-2024-46540   | https://security-tracker.debian.org/tracker/CVE-2024-46540  
                         emlog | CVE-2024-50655   | https://security-tracker.debian.org/tracker/CVE-2024-50655  
                         emlog | CVE-2025-53926   | https://security-tracker.debian.org/tracker/CVE-2025-53926  
                         emlog | CVE-2025-53923   | https://security-tracker.debian.org/tracker/CVE-2025-53923  
                         emlog | CVE-2025-53924   | https://security-tracker.debian.org/tracker/CVE-2025-53924  
                         emlog | CVE-2025-53925   | https://security-tracker.debian.org/tracker/CVE-2025-53925  
                         emlog | CVE-2025-61930   | https://security-tracker.debian.org/tracker/CVE-2025-61930  
                         emlog | CVE-2025-61769   | https://security-tracker.debian.org/tracker/CVE-2025-61769  
                         emlog | CVE-2025-47787   | https://security-tracker.debian.org/tracker/CVE-2025-47787  
                         emlog | CVE-2025-47785   | https://security-tracker.debian.org/tracker/CVE-2025-47785  
                         emlog | CVE-2025-47784   | https://security-tracker.debian.org/tracker/CVE-2025-47784  
                         emlog | CVE-2025-61597   | https://security-tracker.debian.org/tracker/CVE-2025-61597  
                         emlog | CVE-2025-61599   | https://security-tracker.debian.org/tracker/CVE-2025-61599  
                         emlog | CVE-2025-30372   | https://security-tracker.debian.org/tracker/CVE-2025-30372  
                         emlog | CVE-2025-9296    | https://security-tracker.debian.org/tracker/CVE-2025-9296   
                         emlog | CVE-2025-5886    | https://security-tracker.debian.org/tracker/CVE-2025-5886   
                         emlog | CVE-2026-22799   | https://security-tracker.debian.org/tracker/CVE-2026-22799  
                         emlog | CVE-2026-34229   | https://security-tracker.debian.org/tracker/CVE-2026-34229  
                         emlog | CVE-2026-34228   | https://security-tracker.debian.org/tracker/CVE-2026-34228  
                         emlog | CVE-2026-34607   | https://security-tracker.debian.org/tracker/CVE-2026-34607  
                         emlog | CVE-2026-21433   | https://security-tracker.debian.org/tracker/CVE-2026-21433  
                         emlog | CVE-2026-31954   | https://security-tracker.debian.org/tracker/CVE-2026-31954  
                         emlog | CVE-2026-34788   | https://security-tracker.debian.org/tracker/CVE-2026-34788  
                         emlog | CVE-2026-34787   | https://security-tracker.debian.org/tracker/CVE-2026-34787  
                        erlang | CVE-2026-48860   | https://security-tracker.debian.org/tracker/CVE-2026-48860  
                        erlang | CVE-2026-48856   | https://security-tracker.debian.org/tracker/CVE-2026-48856  
                        erlang | CVE-2026-48858   | https://security-tracker.debian.org/tracker/CVE-2026-48858  
                        erlang | CVE-2026-48855   | https://security-tracker.debian.org/tracker/CVE-2026-48855  
                        erlang | CVE-2026-42792   | https://security-tracker.debian.org/tracker/CVE-2026-42792  
                        erlang | CVE-2026-53422   | https://security-tracker.debian.org/tracker/CVE-2026-53422  
                        erlang | CVE-2026-55952   | https://security-tracker.debian.org/tracker/CVE-2026-55952  
                        erlang | CVE-2026-55950   | https://security-tracker.debian.org/tracker/CVE-2026-55950  
                        erlang | CVE-2026-55953   | https://security-tracker.debian.org/tracker/CVE-2026-55953  
                        erlang | CVE-2026-49760   | https://security-tracker.debian.org/tracker/CVE-2026-49760  
                        erlang | CVE-2026-49759   | https://security-tracker.debian.org/tracker/CVE-2026-49759  
                        erlang | CVE-2026-58227   | https://security-tracker.debian.org/tracker/CVE-2026-58227  
                        erlang | CVE-2026-55737   | https://security-tracker.debian.org/tracker/CVE-2026-55737  
                        erlang | CVE-2026-54887   | https://security-tracker.debian.org/tracker/CVE-2026-54887  
                        erlang | CVE-2026-54886   | https://security-tracker.debian.org/tracker/CVE-2026-54886  
                        erlang | CVE-2026-54891   | https://security-tracker.debian.org/tracker/CVE-2026-54891  
                        erlang | CVE-2026-59251   | https://security-tracker.debian.org/tracker/CVE-2026-59251  
                        ffmpeg | CVE-2023-50007   | https://security-tracker.debian.org/tracker/CVE-2023-50007  
                        ffmpeg | CVE-2023-50008   | https://security-tracker.debian.org/tracker/CVE-2023-50008  
                        ffmpeg | CVE-2023-50009   | https://security-tracker.debian.org/tracker/CVE-2023-50009  
                        ffmpeg | CVE-2023-50010   | https://security-tracker.debian.org/tracker/CVE-2023-50010  
                        ffmpeg | CVE-2023-49502   | https://security-tracker.debian.org/tracker/CVE-2023-49502  
                        ffmpeg | CVE-2024-31585   | https://security-tracker.debian.org/tracker/CVE-2024-31585  
                        ffmpeg | CVE-2024-31582   | https://security-tracker.debian.org/tracker/CVE-2024-31582  
                        ffmpeg | CVE-2024-31578   | https://security-tracker.debian.org/tracker/CVE-2024-31578  
                        ffmpeg | CVE-2025-12343   | https://security-tracker.debian.org/tracker/CVE-2025-12343  
                        ffmpeg | CVE-2025-1373    | https://security-tracker.debian.org/tracker/CVE-2025-1373   
                        ffmpeg | CVE-2025-10256   | https://security-tracker.debian.org/tracker/CVE-2025-10256  
                        ffmpeg | CVE-2025-1594    | https://security-tracker.debian.org/tracker/CVE-2025-1594   
                        ffmpeg | CVE-2025-25469   | https://security-tracker.debian.org/tracker/CVE-2025-25469  
                        ffmpeg | CVE-2025-25468   | https://security-tracker.debian.org/tracker/CVE-2025-25468  
                        ffmpeg | CVE-2026-64834   | https://security-tracker.debian.org/tracker/CVE-2026-64834  
                        ffmpeg | CVE-2026-64835   | https://security-tracker.debian.org/tracker/CVE-2026-64835  
                        ffmpeg | CVE-2026-64832   | https://security-tracker.debian.org/tracker/CVE-2026-64832  
                        ffmpeg | CVE-2026-64833   | https://security-tracker.debian.org/tracker/CVE-2026-64833  
                        ffmpeg | CVE-2026-64830   | https://security-tracker.debian.org/tracker/CVE-2026-64830  
                        ffmpeg | CVE-2026-30754   | https://security-tracker.debian.org/tracker/CVE-2026-30754  
                        ffmpeg | CVE-2026-96611   | https://security-tracker.debian.org/tracker/CVE-2026-96611  
                        ffmpeg | CVE-2026-65706   | https://security-tracker.debian.org/tracker/CVE-2026-65706  
                        ffmpeg | CVE-2026-65704   | https://security-tracker.debian.org/tracker/CVE-2026-65704  
                        ffmpeg | CVE-2026-65703   | https://security-tracker.debian.org/tracker/CVE-2026-65703  
                        ffmpeg | CVE-2026-65705   | https://security-tracker.debian.org/tracker/CVE-2026-65705  
                        ffmpeg | CVE-2026-52297   | https://security-tracker.debian.org/tracker/CVE-2026-52297  
                        ffmpeg | CVE-2026-52296   | https://security-tracker.debian.org/tracker/CVE-2026-52296  
                        ffmpeg | CVE-2026-52295   | https://security-tracker.debian.org/tracker/CVE-2026-52295  
                        ffmpeg | CVE-2026-66037   | https://security-tracker.debian.org/tracker/CVE-2026-66037  
                        ffmpeg | CVE-2026-66039   | https://security-tracker.debian.org/tracker/CVE-2026-66039  
                        ffmpeg | CVE-2026-66040   | https://security-tracker.debian.org/tracker/CVE-2026-66040  
                        ffmpeg | CVE-2026-66036   | https://security-tracker.debian.org/tracker/CVE-2026-66036  
                        ffmpeg | CVE-2026-66038   | https://security-tracker.debian.org/tracker/CVE-2026-66038  
                        ffmpeg | CVE-2026-40962   | https://security-tracker.debian.org/tracker/CVE-2026-40962  
                        ffmpeg | CVE-2026-107696  | https://security-tracker.debian.org/tracker/CVE-2026-107696 
                        ffmpeg | CVE-2026-107675  | https://security-tracker.debian.org/tracker/CVE-2026-107675 
                        ffmpeg | CVE-2026-107698  | https://security-tracker.debian.org/tracker/CVE-2026-107698 
                        ffmpeg | CVE-2026-107676  | https://security-tracker.debian.org/tracker/CVE-2026-107676 
                        ffmpeg | CVE-2026-107695  | https://security-tracker.debian.org/tracker/CVE-2026-107695 
                        ffmpeg | CVE-2026-107678  | https://security-tracker.debian.org/tracker/CVE-2026-107678 
                        ffmpeg | CVE-2026-107677  | https://security-tracker.debian.org/tracker/CVE-2026-107677 
                        ffmpeg | CVE-2026-107660  | https://security-tracker.debian.org/tracker/CVE-2026-107660 
                        ffmpeg | CVE-2026-107697  | https://security-tracker.debian.org/tracker/CVE-2026-107697 
                        ffmpeg | CVE-2026-70631   | https://security-tracker.debian.org/tracker/CVE-2026-70631  
                        ffmpeg | CVE-2026-70628   | https://security-tracker.debian.org/tracker/CVE-2026-70628  
                        ffmpeg | CVE-2026-70630   | https://security-tracker.debian.org/tracker/CVE-2026-70630  
                        ffmpeg | CVE-2026-70629   | https://security-tracker.debian.org/tracker/CVE-2026-70629  
                        ffmpeg | CVE-2026-70632   | https://security-tracker.debian.org/tracker/CVE-2026-70632  
                        ffmpeg | CVE-2026-30998   | https://security-tracker.debian.org/tracker/CVE-2026-30998  
                        ffmpeg | CVE-2026-30997   | https://security-tracker.debian.org/tracker/CVE-2026-30997  
                        ffmpeg | CVE-2026-30999   | https://security-tracker.debian.org/tracker/CVE-2026-30999  
                       flannel | CVE-2026-32241   | https://security-tracker.debian.org/tracker/CVE-2026-32241  
                       freerdp | CVE-2026-55648   | https://security-tracker.debian.org/tracker/CVE-2026-55648  
                       freerdp | CVE-2026-27951   | https://security-tracker.debian.org/tracker/CVE-2026-27951  
                       freerdp | CVE-2026-27950   | https://security-tracker.debian.org/tracker/CVE-2026-27950  
                       freerdp | CVE-2026-91962   | https://security-tracker.debian.org/tracker/CVE-2026-91962  
                       freerdp | CVE-2026-91960   | https://security-tracker.debian.org/tracker/CVE-2026-91960  
                       freerdp | CVE-2026-91954   | https://security-tracker.debian.org/tracker/CVE-2026-91954  
                       freerdp | CVE-2026-91961   | https://security-tracker.debian.org/tracker/CVE-2026-91961  
                       freerdp | CVE-2026-91946   | https://security-tracker.debian.org/tracker/CVE-2026-91946  
                       freerdp | CVE-2026-91957   | https://security-tracker.debian.org/tracker/CVE-2026-91957  
                       freerdp | CVE-2026-91959   | https://security-tracker.debian.org/tracker/CVE-2026-91959  
                       freerdp | CVE-2026-91956   | https://security-tracker.debian.org/tracker/CVE-2026-91956  
                       freerdp | CVE-2026-91955   | https://security-tracker.debian.org/tracker/CVE-2026-91955  
                       freerdp | CVE-2026-91950   | https://security-tracker.debian.org/tracker/CVE-2026-91950  
                       freerdp | CVE-2026-91963   | https://security-tracker.debian.org/tracker/CVE-2026-91963  
                       freerdp | CVE-2026-91953   | https://security-tracker.debian.org/tracker/CVE-2026-91953  
                       freerdp | CVE-2026-22854   | https://security-tracker.debian.org/tracker/CVE-2026-22854  
                       freerdp | CVE-2026-22851   | https://security-tracker.debian.org/tracker/CVE-2026-22851  
                       freerdp | CVE-2026-22859   | https://security-tracker.debian.org/tracker/CVE-2026-22859  
                       freerdp | CVE-2026-22857   | https://security-tracker.debian.org/tracker/CVE-2026-22857  
                       freerdp | CVE-2026-22858   | https://security-tracker.debian.org/tracker/CVE-2026-22858  
                       freerdp | CVE-2026-22853   | https://security-tracker.debian.org/tracker/CVE-2026-22853  
                       freerdp | CVE-2026-22855   | https://security-tracker.debian.org/tracker/CVE-2026-22855  
                       freerdp | CVE-2026-22856   | https://security-tracker.debian.org/tracker/CVE-2026-22856  
                       freerdp | CVE-2026-22852   | https://security-tracker.debian.org/tracker/CVE-2026-22852  
                       freerdp | CVE-2026-68579   | https://security-tracker.debian.org/tracker/CVE-2026-68579  
                       freerdp | CVE-2026-68580   | https://security-tracker.debian.org/tracker/CVE-2026-68580  
                       freerdp | CVE-2026-110832  | https://security-tracker.debian.org/tracker/CVE-2026-110832 
                       freerdp | CVE-2026-110837  | https://security-tracker.debian.org/tracker/CVE-2026-110837 
                       freerdp | CVE-2026-110834  | https://security-tracker.debian.org/tracker/CVE-2026-110834 
                       freerdp | CVE-2026-110830  | https://security-tracker.debian.org/tracker/CVE-2026-110830 
                       freerdp | CVE-2026-67288   | https://security-tracker.debian.org/tracker/CVE-2026-67288  
                       freerdp | CVE-2026-67290   | https://security-tracker.debian.org/tracker/CVE-2026-67290  
                       freerdp | CVE-2026-67294   | https://security-tracker.debian.org/tracker/CVE-2026-67294  
                       freerdp | CVE-2026-67289   | https://security-tracker.debian.org/tracker/CVE-2026-67289  
                       freerdp | CVE-2026-67293   | https://security-tracker.debian.org/tracker/CVE-2026-67293  
                       freerdp | CVE-2026-67296   | https://security-tracker.debian.org/tracker/CVE-2026-67296  
                       freerdp | CVE-2026-67299   | https://security-tracker.debian.org/tracker/CVE-2026-67299  
                       freerdp | CVE-2026-67291   | https://security-tracker.debian.org/tracker/CVE-2026-67291  
                       freerdp | CVE-2026-67297   | https://security-tracker.debian.org/tracker/CVE-2026-67297  
                       freerdp | CVE-2026-67292   | https://security-tracker.debian.org/tracker/CVE-2026-67292  
                       freerdp | CVE-2026-29775   | https://security-tracker.debian.org/tracker/CVE-2026-29775  
                       freerdp | CVE-2026-29776   | https://security-tracker.debian.org/tracker/CVE-2026-29776  
                       freerdp | CVE-2026-29774   | https://security-tracker.debian.org/tracker/CVE-2026-29774  
                       freerdp | CVE-2026-64624   | https://security-tracker.debian.org/tracker/CVE-2026-64624  
                       freerdp | CVE-2026-64620   | https://security-tracker.debian.org/tracker/CVE-2026-64620  
                       freerdp | CVE-2026-31897   | https://security-tracker.debian.org/tracker/CVE-2026-31897  
                       freerdp | CVE-2026-31885   | https://security-tracker.debian.org/tracker/CVE-2026-31885  
                       freerdp | CVE-2026-31883   | https://security-tracker.debian.org/tracker/CVE-2026-31883  
                       freerdp | CVE-2026-31806   | https://security-tracker.debian.org/tracker/CVE-2026-31806  
                       freerdp | CVE-2026-31884   | https://security-tracker.debian.org/tracker/CVE-2026-31884  
                       freerdp | CVE-2026-27015   | https://security-tracker.debian.org/tracker/CVE-2026-27015  
                       freerdp | CVE-2026-33995   | https://security-tracker.debian.org/tracker/CVE-2026-33995  
                       freerdp | CVE-2026-33986   | https://security-tracker.debian.org/tracker/CVE-2026-33986  
                       freerdp | CVE-2026-33983   | https://security-tracker.debian.org/tracker/CVE-2026-33983  
                       freerdp | CVE-2026-33985   | https://security-tracker.debian.org/tracker/CVE-2026-33985  
                       freerdp | CVE-2026-33987   | https://security-tracker.debian.org/tracker/CVE-2026-33987  
                       freerdp | CVE-2026-33977   | https://security-tracker.debian.org/tracker/CVE-2026-33977  
                       freerdp | CVE-2026-33984   | https://security-tracker.debian.org/tracker/CVE-2026-33984  
                       freerdp | CVE-2026-33952   | https://security-tracker.debian.org/tracker/CVE-2026-33952  
                       freerdp | CVE-2026-33982   | https://security-tracker.debian.org/tracker/CVE-2026-33982  
                       freerdp | CVE-2026-40254   | https://security-tracker.debian.org/tracker/CVE-2026-40254  
                       freerdp | CVE-2026-55191   | https://security-tracker.debian.org/tracker/CVE-2026-55191  
                       freerdp | CVE-2026-55192   | https://security-tracker.debian.org/tracker/CVE-2026-55192  
                       freerdp | CVE-2026-55193   | https://security-tracker.debian.org/tracker/CVE-2026-55193  
                       freerdp | CVE-2026-55194   | https://security-tracker.debian.org/tracker/CVE-2026-55194  
                       freerdp | CVE-2026-26271   | https://security-tracker.debian.org/tracker/CVE-2026-26271  
                       freerdp | CVE-2026-24491   | https://security-tracker.debian.org/tracker/CVE-2026-24491  
                       freerdp | CVE-2026-57157   | https://security-tracker.debian.org/tracker/CVE-2026-57157  
                       freerdp | CVE-2026-57156   | https://security-tracker.debian.org/tracker/CVE-2026-57156  
                       freerdp | CVE-2026-40033   | https://security-tracker.debian.org/tracker/CVE-2026-40033  
                       freerdp | CVE-2026-26986   | https://security-tracker.debian.org/tracker/CVE-2026-26986  
                       freerdp | CVE-2026-26965   | https://security-tracker.debian.org/tracker/CVE-2026-26965  
                       freerdp | CVE-2026-26955   | https://security-tracker.debian.org/tracker/CVE-2026-26955  
                       freerdp | CVE-2026-56297   | https://security-tracker.debian.org/tracker/CVE-2026-56297  
                       freerdp | CVE-2026-24677   | https://security-tracker.debian.org/tracker/CVE-2026-24677  
                       freerdp | CVE-2026-24678   | https://security-tracker.debian.org/tracker/CVE-2026-24678  
                       freerdp | CVE-2026-24680   | https://security-tracker.debian.org/tracker/CVE-2026-24680  
                       freerdp | CVE-2026-45700   | https://security-tracker.debian.org/tracker/CVE-2026-45700  
                       freerdp | CVE-2026-111373  | https://security-tracker.debian.org/tracker/CVE-2026-111373 
                       freerdp | CVE-2026-111382  | https://security-tracker.debian.org/tracker/CVE-2026-111382 
                       freerdp | CVE-2026-111381  | https://security-tracker.debian.org/tracker/CVE-2026-111381 
                       freerdp | CVE-2026-111379  | https://security-tracker.debian.org/tracker/CVE-2026-111379 
                       freerdp | CVE-2026-111377  | https://security-tracker.debian.org/tracker/CVE-2026-111377 
                       freerdp | CVE-2026-67306   | https://security-tracker.debian.org/tracker/CVE-2026-67306  
                       freerdp | CVE-2026-67303   | https://security-tracker.debian.org/tracker/CVE-2026-67303  
                       freerdp | CVE-2026-67301   | https://security-tracker.debian.org/tracker/CVE-2026-67301  
                       freerdp | CVE-2026-67304   | https://security-tracker.debian.org/tracker/CVE-2026-67304  
                       freerdp | CVE-2026-67305   | https://security-tracker.debian.org/tracker/CVE-2026-67305  
                       freerdp | CVE-2026-67302   | https://security-tracker.debian.org/tracker/CVE-2026-67302  
                       freerdp | CVE-2026-85090   | https://security-tracker.debian.org/tracker/CVE-2026-85090  
                       freerdp | CVE-2026-55827   | https://security-tracker.debian.org/tracker/CVE-2026-55827  
                       freerdp | CVE-2026-23883   | https://security-tracker.debian.org/tracker/CVE-2026-23883  
                       freerdp | CVE-2026-23884   | https://security-tracker.debian.org/tracker/CVE-2026-23884  
                       freerdp | CVE-2026-44422   | https://security-tracker.debian.org/tracker/CVE-2026-44422  
                       freerdp | CVE-2026-44420   | https://security-tracker.debian.org/tracker/CVE-2026-44420  
                       freerdp | CVE-2026-44421   | https://security-tracker.debian.org/tracker/CVE-2026-44421  
                       freerdp | CVE-2026-23732   | https://security-tracker.debian.org/tracker/CVE-2026-23732  
                       freerdp | CVE-2026-73242   | https://security-tracker.debian.org/tracker/CVE-2026-73242  
                       freerdp | CVE-2026-73241   | https://security-tracker.debian.org/tracker/CVE-2026-73241  
                       freerdp | CVE-2026-63633   | https://security-tracker.debian.org/tracker/CVE-2026-63633  
                       freerdp | CVE-2026-63652   | https://security-tracker.debian.org/tracker/CVE-2026-63652  
                       freerdp | CVE-2026-63117   | https://security-tracker.debian.org/tracker/CVE-2026-63117  
                       freerdp | CVE-2026-66401   | https://security-tracker.debian.org/tracker/CVE-2026-66401  
                       freerdp | CVE-2026-66402   | https://security-tracker.debian.org/tracker/CVE-2026-66402  
                       freerdp | CVE-2026-55564   | https://security-tracker.debian.org/tracker/CVE-2026-55564  
                       freerdp | CVE-2026-25959   | https://security-tracker.debian.org/tracker/CVE-2026-25959  
                       freerdp | CVE-2026-25954   | https://security-tracker.debian.org/tracker/CVE-2026-25954  
                       freerdp | CVE-2026-25952   | https://security-tracker.debian.org/tracker/CVE-2026-25952  
                       freerdp | CVE-2026-25942   | https://security-tracker.debian.org/tracker/CVE-2026-25942  
                       freerdp | CVE-2026-25955   | https://security-tracker.debian.org/tracker/CVE-2026-25955  
                       freerdp | CVE-2026-25997   | https://security-tracker.debian.org/tracker/CVE-2026-25997  
                       freerdp | CVE-2026-25953   | https://security-tracker.debian.org/tracker/CVE-2026-25953  
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                          gdal | CVE-2026-49014   | https://security-tracker.debian.org/tracker/CVE-2026-49014  
                          gdal | CVE-2026-8088    | https://security-tracker.debian.org/tracker/CVE-2026-8088   
                          gdal | CVE-2026-8087    | https://security-tracker.debian.org/tracker/CVE-2026-8087   
                          gdal | CVE-2026-8084    | https://security-tracker.debian.org/tracker/CVE-2026-8084   
                          gdal | CVE-2026-8086    | https://security-tracker.debian.org/tracker/CVE-2026-8086   
                          gdal | CVE-2026-8212    | https://security-tracker.debian.org/tracker/CVE-2026-8212   
                          gdal | CVE-2026-8213    | https://security-tracker.debian.org/tracker/CVE-2026-8213   
                         glibc | CVE-2026-5435    | https://security-tracker.debian.org/tracker/CVE-2026-5435   
                         glibc | CVE-2026-6238    | https://security-tracker.debian.org/tracker/CVE-2026-6238   
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                         gnupg | CVE-2025-30258   | https://security-tracker.debian.org/tracker/CVE-2025-30258  
                         gnupg | CVE-2025-68973   | https://security-tracker.debian.org/tracker/CVE-2025-68973  
                         gnupg | CVE-2025-68972   | https://security-tracker.debian.org/tracker/CVE-2025-68972  
                         grub2 | CVE-2025-61662   | https://security-tracker.debian.org/tracker/CVE-2025-61662  
             gst1-plugins-good | CVE-2026-46470   | https://security-tracker.debian.org/tracker/CVE-2026-46470  
             gst1-plugins-good | CVE-2026-46469   | https://security-tracker.debian.org/tracker/CVE-2026-46469  
                    gstreamer1 | CVE-2025-47183   | https://security-tracker.debian.org/tracker/CVE-2025-47183  
                    gstreamer1 | CVE-2025-3887    | https://security-tracker.debian.org/tracker/CVE-2025-3887   
                    gstreamer1 | CVE-2025-47219   | https://security-tracker.debian.org/tracker/CVE-2025-47219  
                    gstreamer1 | CVE-2025-2759    | https://security-tracker.debian.org/tracker/CVE-2025-2759   
                    gstreamer1 | CVE-2025-47808   | https://security-tracker.debian.org/tracker/CVE-2025-47808  
                    gstreamer1 | CVE-2025-47806   | https://security-tracker.debian.org/tracker/CVE-2025-47806  
                    gstreamer1 | CVE-2025-47807   | https://security-tracker.debian.org/tracker/CVE-2025-47807  
                    gstreamer1 | CVE-2026-73433   | https://security-tracker.debian.org/tracker/CVE-2026-73433  
                    gstreamer1 | CVE-2026-73434   | https://security-tracker.debian.org/tracker/CVE-2026-73434  
                    gstreamer1 | CVE-2026-1940    | https://security-tracker.debian.org/tracker/CVE-2026-1940   
                    gstreamer1 | CVE-2026-2921    | https://security-tracker.debian.org/tracker/CVE-2026-2921   
                    gstreamer1 | CVE-2026-2923    | https://security-tracker.debian.org/tracker/CVE-2026-2923   
                    gstreamer1 | CVE-2026-2920    | https://security-tracker.debian.org/tracker/CVE-2026-2920   
                    gstreamer1 | CVE-2026-2922    | https://security-tracker.debian.org/tracker/CVE-2026-2922   
                    gstreamer1 | CVE-2026-18299   | https://security-tracker.debian.org/tracker/CVE-2026-18299  
                    gstreamer1 | CVE-2026-18297   | https://security-tracker.debian.org/tracker/CVE-2026-18297  
                    gstreamer1 | CVE-2026-18296   | https://security-tracker.debian.org/tracker/CVE-2026-18296  
                    gstreamer1 | CVE-2026-18298   | https://security-tracker.debian.org/tracker/CVE-2026-18298  
                    gstreamer1 | CVE-2026-18295   | https://security-tracker.debian.org/tracker/CVE-2026-18295  
                    gstreamer1 | CVE-2026-3081    | https://security-tracker.debian.org/tracker/CVE-2026-3081   
                    gstreamer1 | CVE-2026-3084    | https://security-tracker.debian.org/tracker/CVE-2026-3084   
                    gstreamer1 | CVE-2026-3085    | https://security-tracker.debian.org/tracker/CVE-2026-3085   
                    gstreamer1 | CVE-2026-3083    | https://security-tracker.debian.org/tracker/CVE-2026-3083   
                    gstreamer1 | CVE-2026-3086    | https://security-tracker.debian.org/tracker/CVE-2026-3086   
                    gstreamer1 | CVE-2026-3082    | https://security-tracker.debian.org/tracker/CVE-2026-3082   
                          gzip | CVE-2026-41991   | https://security-tracker.debian.org/tracker/CVE-2026-41991  
                          gzip | CVE-2026-41992   | https://security-tracker.debian.org/tracker/CVE-2026-41992  
                       haproxy | CVE-2026-33555   | https://security-tracker.debian.org/tracker/CVE-2026-33555  
                         hplip | CVE-2025-43023   | https://security-tracker.debian.org/tracker/CVE-2025-43023  
                         hplip | CVE-2026-91101   | https://security-tracker.debian.org/tracker/CVE-2026-91101  
                         hplip | CVE-2026-91102   | https://security-tracker.debian.org/tracker/CVE-2026-91102  
                         hplip | CVE-2026-91105   | https://security-tracker.debian.org/tracker/CVE-2026-91105  
                         hplip | CVE-2026-91106   | https://security-tracker.debian.org/tracker/CVE-2026-91106  
                         hplip | CVE-2026-91103   | https://security-tracker.debian.org/tracker/CVE-2026-91103  
                         hplip | CVE-2026-91104   | https://security-tracker.debian.org/tracker/CVE-2026-91104  
                         hplip | CVE-2026-91100   | https://security-tracker.debian.org/tracker/CVE-2026-91100  
                         hplip | CVE-2026-91099   | https://security-tracker.debian.org/tracker/CVE-2026-91099  
                         hplip | CVE-2026-91098   | https://security-tracker.debian.org/tracker/CVE-2026-91098  
                         hplip | CVE-2026-91097   | https://security-tracker.debian.org/tracker/CVE-2026-91097  
                         hplip | CVE-2026-8632    | https://security-tracker.debian.org/tracker/CVE-2026-8632   
                         hplip | CVE-2026-8631    | https://security-tracker.debian.org/tracker/CVE-2026-8631   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2026-93590   | https://security-tracker.debian.org/tracker/CVE-2026-93590  
                   imagemagick | CVE-2026-93586   | https://security-tracker.debian.org/tracker/CVE-2026-93586  
                   imagemagick | CVE-2026-93587   | https://security-tracker.debian.org/tracker/CVE-2026-93587  
                   imagemagick | CVE-2026-93589   | https://security-tracker.debian.org/tracker/CVE-2026-93589  
                   imagemagick | CVE-2026-93588   | https://security-tracker.debian.org/tracker/CVE-2026-93588  
                   imagemagick | CVE-2026-86425   | https://security-tracker.debian.org/tracker/CVE-2026-86425  
                   imagemagick | CVE-2026-86424   | https://security-tracker.debian.org/tracker/CVE-2026-86424  
                   imagemagick | CVE-2026-86420   | https://security-tracker.debian.org/tracker/CVE-2026-86420  
                   imagemagick | CVE-2026-86423   | https://security-tracker.debian.org/tracker/CVE-2026-86423  
                   imagemagick | CVE-2026-86421   | https://security-tracker.debian.org/tracker/CVE-2026-86421  
                   imagemagick | CVE-2026-86422   | https://security-tracker.debian.org/tracker/CVE-2026-86422  
                   imagemagick | CVE-2026-62946   | https://security-tracker.debian.org/tracker/CVE-2026-62946  
                   imagemagick | CVE-2026-64685   | https://security-tracker.debian.org/tracker/CVE-2026-64685  
                   imagemagick | CVE-2026-107209  | https://security-tracker.debian.org/tracker/CVE-2026-107209 
                   imagemagick | CVE-2026-107208  | https://security-tracker.debian.org/tracker/CVE-2026-107208 
                   imagemagick | CVE-2026-107210  | https://security-tracker.debian.org/tracker/CVE-2026-107210 
                   imagemagick | CVE-2026-105083  | https://security-tracker.debian.org/tracker/CVE-2026-105083 
                   imagemagick | CVE-2026-106569  | https://security-tracker.debian.org/tracker/CVE-2026-106569 
                   imagemagick | CVE-2026-106574  | https://security-tracker.debian.org/tracker/CVE-2026-106574 
                   imagemagick | CVE-2026-106566  | https://security-tracker.debian.org/tracker/CVE-2026-106566 
                   imagemagick | CVE-2026-106580  | https://security-tracker.debian.org/tracker/CVE-2026-106580 
                   imagemagick | CVE-2026-106567  | https://security-tracker.debian.org/tracker/CVE-2026-106567 
                   imagemagick | CVE-2026-106568  | https://security-tracker.debian.org/tracker/CVE-2026-106568 
                   imagemagick | CVE-2026-106578  | https://security-tracker.debian.org/tracker/CVE-2026-106578 
                   imagemagick | CVE-2026-106571  | https://security-tracker.debian.org/tracker/CVE-2026-106571 
                   imagemagick | CVE-2026-106565  | https://security-tracker.debian.org/tracker/CVE-2026-106565 
                   imagemagick | CVE-2026-106572  | https://security-tracker.debian.org/tracker/CVE-2026-106572 
                   imagemagick | CVE-2026-106575  | https://security-tracker.debian.org/tracker/CVE-2026-106575 
                   imagemagick | CVE-2026-106564  | https://security-tracker.debian.org/tracker/CVE-2026-106564 
                   imagemagick | CVE-2026-106576  | https://security-tracker.debian.org/tracker/CVE-2026-106576 
                   imagemagick | CVE-2026-106570  | https://security-tracker.debian.org/tracker/CVE-2026-106570 
                   imagemagick | CVE-2026-106573  | https://security-tracker.debian.org/tracker/CVE-2026-106573 
                   imagemagick | CVE-2026-106577  | https://security-tracker.debian.org/tracker/CVE-2026-106577 
                   imagemagick | CVE-2026-106579  | https://security-tracker.debian.org/tracker/CVE-2026-106579 
                   imagemagick | CVE-2026-66011   | https://security-tracker.debian.org/tracker/CVE-2026-66011  
                   imagemagick | CVE-2026-102635  | https://security-tracker.debian.org/tracker/CVE-2026-102635 
                   imagemagick | CVE-2026-62363   | https://security-tracker.debian.org/tracker/CVE-2026-62363  
                         jhead | CVE-2025-44906   | https://security-tracker.debian.org/tracker/CVE-2025-44906  
                            jq | CVE-2026-44777   | https://security-tracker.debian.org/tracker/CVE-2026-44777  
                            jq | CVE-2026-39979   | https://security-tracker.debian.org/tracker/CVE-2026-39979  
                        libidn | CVE-2026-57053   | https://security-tracker.debian.org/tracker/CVE-2026-57053  
                      libkcapi | CVE-2026-71225   | https://security-tracker.debian.org/tracker/CVE-2026-71225  
                      libkcapi | CVE-2026-71226   | https://security-tracker.debian.org/tracker/CVE-2026-71226  
                      libkcapi | CVE-2026-71227   | https://security-tracker.debian.org/tracker/CVE-2026-71227  
                       libkrb5 | CVE-2026-40355   | https://security-tracker.debian.org/tracker/CVE-2026-40355  
                       libkrb5 | CVE-2026-40356   | https://security-tracker.debian.org/tracker/CVE-2026-40356  
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libpjsip | CVE-2026-57163   | https://security-tracker.debian.org/tracker/CVE-2026-57163  
                      libpjsip | CVE-2026-57162   | https://security-tracker.debian.org/tracker/CVE-2026-57162  
                      libpjsip | CVE-2026-57160   | https://security-tracker.debian.org/tracker/CVE-2026-57160  
                      libpjsip | CVE-2026-57164   | https://security-tracker.debian.org/tracker/CVE-2026-57164  
                      libpjsip | CVE-2026-57161   | https://security-tracker.debian.org/tracker/CVE-2026-57161  
                      libpjsip | CVE-2026-57166   | https://security-tracker.debian.org/tracker/CVE-2026-57166  
                      libpjsip | CVE-2026-57159   | https://security-tracker.debian.org/tracker/CVE-2026-57159  
                      libpjsip | CVE-2026-57165   | https://security-tracker.debian.org/tracker/CVE-2026-57165  
                      libpjsip | CVE-2026-84975   | https://security-tracker.debian.org/tracker/CVE-2026-84975  
                      libpjsip | CVE-2026-77396   | https://security-tracker.debian.org/tracker/CVE-2026-77396  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                        libraw | CVE-2026-5342    | https://security-tracker.debian.org/tracker/CVE-2026-5342   
                        libraw | CVE-2026-5318    | https://security-tracker.debian.org/tracker/CVE-2026-5318   
                    libsndfile | CVE-2024-50613   | https://security-tracker.debian.org/tracker/CVE-2024-50613  
                    libsndfile | CVE-2025-52194   | https://security-tracker.debian.org/tracker/CVE-2025-52194  
                    libsndfile | CVE-2025-56226   | https://security-tracker.debian.org/tracker/CVE-2025-56226  
                    libsndfile | CVE-2026-37555   | https://security-tracker.debian.org/tracker/CVE-2026-37555  
                       libsolv | CVE-2026-9150    | https://security-tracker.debian.org/tracker/CVE-2026-9150   
                       libsolv | CVE-2026-9149    | https://security-tracker.debian.org/tracker/CVE-2026-9149   
                       libsoup | CVE-2026-102560  | https://security-tracker.debian.org/tracker/CVE-2026-102560 
                       libsoup | CVE-2026-102558  | https://security-tracker.debian.org/tracker/CVE-2026-102558 
                       libsoup | CVE-2026-102555  | https://security-tracker.debian.org/tracker/CVE-2026-102555 
                       libsoup | CVE-2026-102556  | https://security-tracker.debian.org/tracker/CVE-2026-102556 
                       libsoup | CVE-2026-102559  | https://security-tracker.debian.org/tracker/CVE-2026-102559 
                       libsoup | CVE-2026-102557  | https://security-tracker.debian.org/tracker/CVE-2026-102557 
                       libssh2 | CVE-2026-58051   | https://security-tracker.debian.org/tracker/CVE-2026-58051  
                       libssh2 | CVE-2026-58050   | https://security-tracker.debian.org/tracker/CVE-2026-58050  
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                        libucl | CVE-2025-6499    | https://security-tracker.debian.org/tracker/CVE-2025-6499   
                        libucl | CVE-2026-0708    | https://security-tracker.debian.org/tracker/CVE-2026-0708   
                       libvips | CVE-2026-35590   | https://security-tracker.debian.org/tracker/CVE-2026-35590  
                       libvips | CVE-2026-35591   | https://security-tracker.debian.org/tracker/CVE-2026-35591  
                       libvips | CVE-2026-3146    | https://security-tracker.debian.org/tracker/CVE-2026-3146   
                       libvips | CVE-2026-3147    | https://security-tracker.debian.org/tracker/CVE-2026-3147   
                       libvips | CVE-2026-3145    | https://security-tracker.debian.org/tracker/CVE-2026-3145   
                       libvips | CVE-2026-33328   | https://security-tracker.debian.org/tracker/CVE-2026-33328  
                       libvips | CVE-2026-33327   | https://security-tracker.debian.org/tracker/CVE-2026-33327  
                       libvips | CVE-2026-2913    | https://security-tracker.debian.org/tracker/CVE-2026-2913   
                       libvirt | CVE-2024-2496    | https://security-tracker.debian.org/tracker/CVE-2024-2496   
                     llama-cpp | CVE-2026-27940   | https://security-tracker.debian.org/tracker/CVE-2026-27940  
                     llama-cpp | CVE-2026-43631   | https://security-tracker.debian.org/tracker/CVE-2026-43631  
                     llama-cpp | CVE-2026-43628   | https://security-tracker.debian.org/tracker/CVE-2026-43628  
                     llama-cpp | CVE-2026-43632   | https://security-tracker.debian.org/tracker/CVE-2026-43632  
                     llama-cpp | CVE-2026-43629   | https://security-tracker.debian.org/tracker/CVE-2026-43629  
                     llama-cpp | CVE-2026-43627   | https://security-tracker.debian.org/tracker/CVE-2026-43627  
                     llama-cpp | CVE-2026-34159   | https://security-tracker.debian.org/tracker/CVE-2026-34159  
                         lrzip | CVE-2025-9396    | https://security-tracker.debian.org/tracker/CVE-2025-9396   
                         lrzip | CVE-2025-15570   | https://security-tracker.debian.org/tracker/CVE-2025-15570  
                         lrzip | CVE-2025-15571   | https://security-tracker.debian.org/tracker/CVE-2025-15571  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                           lxc | CVE-2026-39402   | https://security-tracker.debian.org/tracker/CVE-2026-39402  
                       mariadb | CVE-2026-97380   | https://security-tracker.debian.org/tracker/CVE-2026-97380  
                       mariadb | CVE-2026-92262   | https://security-tracker.debian.org/tracker/CVE-2026-92262  
                       mariadb | CVE-2026-35549   | https://security-tracker.debian.org/tracker/CVE-2026-35549  
                       mariadb | CVE-2026-85745   | https://security-tracker.debian.org/tracker/CVE-2026-85745  
                       mariadb | CVE-2026-85746   | https://security-tracker.debian.org/tracker/CVE-2026-85746  
                       mariadb | CVE-2026-85985   | https://security-tracker.debian.org/tracker/CVE-2026-85985  
                       mariadb | CVE-2026-86047   | https://security-tracker.debian.org/tracker/CVE-2026-86047  
                       mariadb | CVE-2026-107822  | https://security-tracker.debian.org/tracker/CVE-2026-107822 
                       mariadb | CVE-2026-107823  | https://security-tracker.debian.org/tracker/CVE-2026-107823 
                       mariadb | CVE-2026-107814  | https://security-tracker.debian.org/tracker/CVE-2026-107814 
                       mariadb | CVE-2026-107816  | https://security-tracker.debian.org/tracker/CVE-2026-107816 
                       mariadb | CVE-2026-107818  | https://security-tracker.debian.org/tracker/CVE-2026-107818 
                       mariadb | CVE-2026-107817  | https://security-tracker.debian.org/tracker/CVE-2026-107817 
                       mariadb | CVE-2026-107815  | https://security-tracker.debian.org/tracker/CVE-2026-107815 
                       mariadb | CVE-2026-107821  | https://security-tracker.debian.org/tracker/CVE-2026-107821 
                      minetest | CVE-2026-41196   | https://security-tracker.debian.org/tracker/CVE-2026-41196  
                      minidlna | CVE-2023-47430   | https://security-tracker.debian.org/tracker/CVE-2023-47430  
                  modsecurity2 | CVE-2026-52747   | https://security-tracker.debian.org/tracker/CVE-2026-52747  
                  modsecurity2 | CVE-2026-30923   | https://security-tracker.debian.org/tracker/CVE-2026-30923  
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mupdf | CVE-2025-71382   | https://security-tracker.debian.org/tracker/CVE-2025-71382  
                         mupdf | CVE-2025-46206   | https://security-tracker.debian.org/tracker/CVE-2025-46206  
                         mupdf | CVE-2026-7233    | https://security-tracker.debian.org/tracker/CVE-2026-7233   
                         mupdf | CVE-2026-40505   | https://security-tracker.debian.org/tracker/CVE-2026-40505  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                       netdata | CVE-2025-71385   | https://security-tracker.debian.org/tracker/CVE-2025-71385  
                       nghttp2 | CVE-2026-58055   | https://security-tracker.debian.org/tracker/CVE-2026-58055  
                          nmap | CVE-2026-58058   | https://security-tracker.debian.org/tracker/CVE-2026-58058  
                          ogre | CVE-2025-11017   | https://security-tracker.debian.org/tracker/CVE-2025-11017  
                          ogre | CVE-2025-11014   | https://security-tracker.debian.org/tracker/CVE-2025-11014  
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                      opendoas | CVE-2023-28339   | https://security-tracker.debian.org/tracker/CVE-2023-28339  
                openfpgaloader | CVE-2026-35170   | https://security-tracker.debian.org/tracker/CVE-2026-35170  
                openfpgaloader | CVE-2026-35176   | https://security-tracker.debian.org/tracker/CVE-2026-35176  
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                   openvmtools | CVE-2023-20900   | https://security-tracker.debian.org/tracker/CVE-2023-20900  
                   openvmtools | CVE-2023-34057   | https://security-tracker.debian.org/tracker/CVE-2023-34057  
                   openvmtools | CVE-2023-34058   | https://security-tracker.debian.org/tracker/CVE-2023-34058  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                        parsec | CVE-2018-6651    | https://security-tracker.debian.org/tracker/CVE-2018-6651   
                        parsec | CVE-2023-37250   | https://security-tracker.debian.org/tracker/CVE-2023-37250  
                         patch | CVE-2026-56289   | https://security-tracker.debian.org/tracker/CVE-2026-56289  
                         patch | CVE-2026-56288   | https://security-tracker.debian.org/tracker/CVE-2026-56288  
                          perl | CVE-2026-8376    | https://security-tracker.debian.org/tracker/CVE-2026-8376   
                          perl | CVE-2026-57432   | https://security-tracker.debian.org/tracker/CVE-2026-57432  
                          perl | CVE-2026-13221   | https://security-tracker.debian.org/tracker/CVE-2026-13221  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                        podman | CVE-2022-2989    | https://security-tracker.debian.org/tracker/CVE-2022-2989   
                        podman | CVE-2026-57231   | https://security-tracker.debian.org/tracker/CVE-2026-57231  
                        podman | CVE-2026-55686   | https://security-tracker.debian.org/tracker/CVE-2026-55686  
                       proftpd | CVE-2026-53994   | https://security-tracker.debian.org/tracker/CVE-2026-53994  
                       prosody | CVE-2026-43506   | https://security-tracker.debian.org/tracker/CVE-2026-43506  
                       prosody | CVE-2026-43504   | https://security-tracker.debian.org/tracker/CVE-2026-43504  
                       prosody | CVE-2026-43505   | https://security-tracker.debian.org/tracker/CVE-2026-43505  
                       prosody | CVE-2026-43507   | https://security-tracker.debian.org/tracker/CVE-2026-43507  
                proxychains-ng | CVE-2025-34451   | https://security-tracker.debian.org/tracker/CVE-2025-34451  
                python-aiohttp | CVE-2026-47265   | https://security-tracker.debian.org/tracker/CVE-2026-47265  
                python-aiohttp | CVE-2026-54280   | https://security-tracker.debian.org/tracker/CVE-2026-54280  
                python-aiohttp | CVE-2026-54274   | https://security-tracker.debian.org/tracker/CVE-2026-54274  
                python-aiohttp | CVE-2026-54273   | https://security-tracker.debian.org/tracker/CVE-2026-54273  
                python-aiohttp | CVE-2026-54279   | https://security-tracker.debian.org/tracker/CVE-2026-54279  
                python-aiohttp | CVE-2026-54277   | https://security-tracker.debian.org/tracker/CVE-2026-54277  
                python-aiohttp | CVE-2026-54275   | https://security-tracker.debian.org/tracker/CVE-2026-54275  
                python-aiohttp | CVE-2026-54276   | https://security-tracker.debian.org/tracker/CVE-2026-54276  
                python-aiohttp | CVE-2026-54278   | https://security-tracker.debian.org/tracker/CVE-2026-54278  
                python-aiohttp | CVE-2026-34993   | https://security-tracker.debian.org/tracker/CVE-2026-34993  
                python-aiohttp | CVE-2026-50269   | https://security-tracker.debian.org/tracker/CVE-2026-50269  
               python-asyncssh | CVE-2026-45309   | https://security-tracker.debian.org/tracker/CVE-2026-45309  
                 python-django | CVE-2026-15920   | https://security-tracker.debian.org/tracker/CVE-2026-15920  
                 python-django | CVE-2026-48588   | https://security-tracker.debian.org/tracker/CVE-2026-48588  
                 python-django | CVE-2026-15830   | https://security-tracker.debian.org/tracker/CVE-2026-15830  
                 python-django | CVE-2026-15307   | https://security-tracker.debian.org/tracker/CVE-2026-15307  
                 python-django | CVE-2026-15337   | https://security-tracker.debian.org/tracker/CVE-2026-15337  
                 python-django | CVE-2026-53878   | https://security-tracker.debian.org/tracker/CVE-2026-53878  
                 python-django | CVE-2026-53877   | https://security-tracker.debian.org/tracker/CVE-2026-53877  
                 python-dotenv | CVE-2026-28684   | https://security-tracker.debian.org/tracker/CVE-2026-28684  
                  python-ecdsa | CVE-2026-33936   | https://security-tracker.debian.org/tracker/CVE-2026-33936  
               python-httplib2 | CVE-2026-59939   | https://security-tracker.debian.org/tracker/CVE-2026-59939  
                   python-lxml | CVE-2026-41066   | https://security-tracker.debian.org/tracker/CVE-2026-41066  
              python-multipart | CVE-2026-53538   | https://security-tracker.debian.org/tracker/CVE-2026-53538  
              python-multipart | CVE-2026-53540   | https://security-tracker.debian.org/tracker/CVE-2026-53540  
              python-multipart | CVE-2026-53539   | https://security-tracker.debian.org/tracker/CVE-2026-53539  
              python-multipart | CVE-2026-53537   | https://security-tracker.debian.org/tracker/CVE-2026-53537  
              python-multipart | CVE-2026-40347   | https://security-tracker.debian.org/tracker/CVE-2026-40347  
                 python-pillow | CVE-2026-54059   | https://security-tracker.debian.org/tracker/CVE-2026-54059  
                 python-pillow | CVE-2026-54058   | https://security-tracker.debian.org/tracker/CVE-2026-54058  
                 python-pillow | CVE-2026-54060   | https://security-tracker.debian.org/tracker/CVE-2026-54060  
                 python-pillow | CVE-2026-55379   | https://security-tracker.debian.org/tracker/CVE-2026-55379  
                 python-pillow | CVE-2026-55380   | https://security-tracker.debian.org/tracker/CVE-2026-55380  
                 python-pillow | CVE-2026-112390  | https://security-tracker.debian.org/tracker/CVE-2026-112390 
                 python-pillow | CVE-2026-112391  | https://security-tracker.debian.org/tracker/CVE-2026-112391 
                 python-pillow | CVE-2026-59199   | https://security-tracker.debian.org/tracker/CVE-2026-59199  
                 python-pillow | CVE-2026-59198   | https://security-tracker.debian.org/tracker/CVE-2026-59198  
                 python-pillow | CVE-2026-59197   | https://security-tracker.debian.org/tracker/CVE-2026-59197  
                 python-pillow | CVE-2026-40192   | https://security-tracker.debian.org/tracker/CVE-2026-40192  
                 python-pillow | CVE-2026-55798   | https://security-tracker.debian.org/tracker/CVE-2026-55798  
                 python-pillow | CVE-2026-42311   | https://security-tracker.debian.org/tracker/CVE-2026-42311  
                 python-pillow | CVE-2026-42310   | https://security-tracker.debian.org/tracker/CVE-2026-42310  
                 python-pillow | CVE-2026-42309   | https://security-tracker.debian.org/tracker/CVE-2026-42309  
                 python-pillow | CVE-2026-42308   | https://security-tracker.debian.org/tracker/CVE-2026-42308  
                 python-pillow | CVE-2026-25990   | https://security-tracker.debian.org/tracker/CVE-2026-25990  
                 python-pillow | CVE-2026-59200   | https://security-tracker.debian.org/tracker/CVE-2026-59200  
                 python-pillow | CVE-2026-59203   | https://security-tracker.debian.org/tracker/CVE-2026-59203  
                 python-pillow | CVE-2026-59205   | https://security-tracker.debian.org/tracker/CVE-2026-59205  
                 python-pillow | CVE-2026-59204   | https://security-tracker.debian.org/tracker/CVE-2026-59204  
                    python-pip | CVE-2026-8643    | https://security-tracker.debian.org/tracker/CVE-2026-8643   
                    python-pip | CVE-2026-13346   | https://security-tracker.debian.org/tracker/CVE-2026-13346  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                  python-pyjwt | CVE-2026-102275  | https://security-tracker.debian.org/tracker/CVE-2026-102275 
                  python-pyjwt | CVE-2026-102271  | https://security-tracker.debian.org/tracker/CVE-2026-102271 
                  python-pyjwt | CVE-2026-102274  | https://security-tracker.debian.org/tracker/CVE-2026-102274 
                  python-pyjwt | CVE-2026-102269  | https://security-tracker.debian.org/tracker/CVE-2026-102269 
                  python-pyjwt | CVE-2026-102268  | https://security-tracker.debian.org/tracker/CVE-2026-102268 
                  python-pyjwt | CVE-2026-102267  | https://security-tracker.debian.org/tracker/CVE-2026-102267 
                  python-pyjwt | CVE-2026-102270  | https://security-tracker.debian.org/tracker/CVE-2026-102270 
                  python-pyjwt | CVE-2026-48522   | https://security-tracker.debian.org/tracker/CVE-2026-48522  
                  python-pyjwt | CVE-2026-48524   | https://security-tracker.debian.org/tracker/CVE-2026-48524  
                  python-pyjwt | CVE-2026-48526   | https://security-tracker.debian.org/tracker/CVE-2026-48526  
                  python-pyjwt | CVE-2026-48525   | https://security-tracker.debian.org/tracker/CVE-2026-48525  
                  python-pyjwt | CVE-2026-48523   | https://security-tracker.debian.org/tracker/CVE-2026-48523  
                  python-pyjwt | CVE-2026-103001  | https://security-tracker.debian.org/tracker/CVE-2026-103001 
                  python-pyjwt | CVE-2026-101917  | https://security-tracker.debian.org/tracker/CVE-2026-101917 
                  python-pyjwt | CVE-2026-101918  | https://security-tracker.debian.org/tracker/CVE-2026-101918 
             python-setuptools | CVE-2026-59890   | https://security-tracker.debian.org/tracker/CVE-2026-59890  
              python-starlette | CVE-2026-54282   | https://security-tracker.debian.org/tracker/CVE-2026-54282  
              python-starlette | CVE-2026-54283   | https://security-tracker.debian.org/tracker/CVE-2026-54283  
                python-urllib3 | CVE-2026-97688   | https://security-tracker.debian.org/tracker/CVE-2026-97688  
                python-urllib3 | CVE-2026-97689   | https://security-tracker.debian.org/tracker/CVE-2026-97689  
                python-urllib3 | CVE-2026-97687   | https://security-tracker.debian.org/tracker/CVE-2026-97687  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                       qt5base | CVE-2025-30348   | https://security-tracker.debian.org/tracker/CVE-2025-30348  
                        ranger | CVE-2024-55532   | https://security-tracker.debian.org/tracker/CVE-2024-55532  
                        ranger | CVE-2025-59059   | https://security-tracker.debian.org/tracker/CVE-2025-59059  
                        ranger | CVE-2025-59060   | https://security-tracker.debian.org/tracker/CVE-2025-59060  
                        ranger | CVE-2026-65948   | https://security-tracker.debian.org/tracker/CVE-2026-65948  
                        ranger | CVE-2026-65945   | https://security-tracker.debian.org/tracker/CVE-2026-65945  
                        ranger | CVE-2026-65942   | https://security-tracker.debian.org/tracker/CVE-2026-65942  
                        ranger | CVE-2026-28672   | https://security-tracker.debian.org/tracker/CVE-2026-28672  
                        ranger | CVE-2026-42537   | https://security-tracker.debian.org/tracker/CVE-2026-42537  
                        ranger | CVE-2026-40920   | https://security-tracker.debian.org/tracker/CVE-2026-40920  
                        ranger | CVE-2026-55799   | https://security-tracker.debian.org/tracker/CVE-2026-55799  
                        ranger | CVE-2026-55814   | https://security-tracker.debian.org/tracker/CVE-2026-55814  
                        ranger | CVE-2026-44416   | https://security-tracker.debian.org/tracker/CVE-2026-44416  
                        ranger | CVE-2026-32227   | https://security-tracker.debian.org/tracker/CVE-2026-32227  
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2026-2340    | https://security-tracker.debian.org/tracker/CVE-2026-2340   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                    sdl2_image | CVE-2026-35444   | https://security-tracker.debian.org/tracker/CVE-2026-35444  
                     sdl_image | CVE-2026-35444   | https://security-tracker.debian.org/tracker/CVE-2026-35444  
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                    strongswan | CVE-2026-78132   | https://security-tracker.debian.org/tracker/CVE-2026-78132  
                    strongswan | CVE-2026-78126   | https://security-tracker.debian.org/tracker/CVE-2026-78126  
                    strongswan | CVE-2026-78131   | https://security-tracker.debian.org/tracker/CVE-2026-78131  
                    strongswan | CVE-2026-78133   | https://security-tracker.debian.org/tracker/CVE-2026-78133  
                    strongswan | CVE-2026-78123   | https://security-tracker.debian.org/tracker/CVE-2026-78123  
                    strongswan | CVE-2026-78135   | https://security-tracker.debian.org/tracker/CVE-2026-78135  
                    strongswan | CVE-2026-78134   | https://security-tracker.debian.org/tracker/CVE-2026-78134  
                    strongswan | CVE-2026-78124   | https://security-tracker.debian.org/tracker/CVE-2026-78124  
                    strongswan | CVE-2026-78127   | https://security-tracker.debian.org/tracker/CVE-2026-78127  
                    strongswan | CVE-2026-78130   | https://security-tracker.debian.org/tracker/CVE-2026-78130  
                    strongswan | CVE-2026-78129   | https://security-tracker.debian.org/tracker/CVE-2026-78129  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                       systemd | CVE-2026-40223   | https://security-tracker.debian.org/tracker/CVE-2026-40223  
                           tar | CVE-2026-18508   | https://security-tracker.debian.org/tracker/CVE-2026-18508  
                           tar | CVE-2026-18477   | https://security-tracker.debian.org/tracker/CVE-2026-18477  
                   timescaledb | CVE-2026-70633   | https://security-tracker.debian.org/tracker/CVE-2026-70633  
                   timescaledb | CVE-2026-70635   | https://security-tracker.debian.org/tracker/CVE-2026-70635  
                   timescaledb | CVE-2026-70634   | https://security-tracker.debian.org/tracker/CVE-2026-70634  
                     tinyproxy | CVE-2026-31842   | https://security-tracker.debian.org/tracker/CVE-2026-31842  
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                           upx | CVE-2023-23456   | https://security-tracker.debian.org/tracker/CVE-2023-23456  
                           upx | CVE-2023-23457   | https://security-tracker.debian.org/tracker/CVE-2023-23457  
                           upx | CVE-2024-3209    | https://security-tracker.debian.org/tracker/CVE-2024-3209   
                           upx | CVE-2025-2849    | https://security-tracker.debian.org/tracker/CVE-2025-2849   
                    util-linux | CVE-2026-13595   | https://security-tracker.debian.org/tracker/CVE-2026-13595  
               util-linux-libs | CVE-2026-13595   | https://security-tracker.debian.org/tracker/CVE-2026-13595  
                          wget | CVE-2026-58472   | https://security-tracker.debian.org/tracker/CVE-2026-58472  
                         wget2 | CVE-2026-1858    | https://security-tracker.debian.org/tracker/CVE-2026-1858   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2023-46839   | https://security-tracker.debian.org/tracker/CVE-2023-46839  
                           xen | CVE-2023-46842   | https://security-tracker.debian.org/tracker/CVE-2023-46842  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                           xen | CVE-2023-46840   | https://security-tracker.debian.org/tracker/CVE-2023-46840  
                           xen | CVE-2023-46841   | https://security-tracker.debian.org/tracker/CVE-2023-46841  
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2024-31143   | https://security-tracker.debian.org/tracker/CVE-2024-31143  
                           xen | CVE-2024-31145   | https://security-tracker.debian.org/tracker/CVE-2024-31145  
                           xen | CVE-2024-45817   | https://security-tracker.debian.org/tracker/CVE-2024-45817  
                           xen | CVE-2024-45819   | https://security-tracker.debian.org/tracker/CVE-2024-45819  
                           xen | CVE-2025-27465   | https://security-tracker.debian.org/tracker/CVE-2025-27465  
                           xen | CVE-2025-58147   | https://security-tracker.debian.org/tracker/CVE-2025-58147  
                           xen | CVE-2025-58148   | https://security-tracker.debian.org/tracker/CVE-2025-58148  
                           xen | CVE-2025-58149   | https://security-tracker.debian.org/tracker/CVE-2025-58149  
                           xen | CVE-2025-1713    | https://security-tracker.debian.org/tracker/CVE-2025-1713   
                           xen | CVE-2026-23555   | https://security-tracker.debian.org/tracker/CVE-2026-23555  
                           xen | CVE-2026-23554   | https://security-tracker.debian.org/tracker/CVE-2026-23554  
                           xen | CVE-2026-23558   | https://security-tracker.debian.org/tracker/CVE-2026-23558  
                           xen | CVE-2026-23553   | https://security-tracker.debian.org/tracker/CVE-2026-23553  
                           xen | CVE-2026-23557   | https://security-tracker.debian.org/tracker/CVE-2026-23557  
           xserver_xorg-server | CVE-2023-5574    | https://security-tracker.debian.org/tracker/CVE-2023-5574   
           xserver_xorg-server | CVE-2026-56000   | https://security-tracker.debian.org/tracker/CVE-2026-56000  
           xserver_xorg-server | CVE-2026-55999   | https://security-tracker.debian.org/tracker/CVE-2026-55999  
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2023-51258   | https://security-tracker.debian.org/tracker/CVE-2023-51258  
                          yasm | CVE-2023-31973   | https://security-tracker.debian.org/tracker/CVE-2023-31973  
                          yasm | CVE-2023-31974   | https://security-tracker.debian.org/tracker/CVE-2023-31974  
                          yasm | CVE-2023-31972   | https://security-tracker.debian.org/tracker/CVE-2023-31972  

CVEs for the '2026.05.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-2026-93546   | https://security-tracker.debian.org/tracker/CVE-2026-93546  
                        apache | CVE-2026-56449   | https://security-tracker.debian.org/tracker/CVE-2026-56449  
                        apache | CVE-2026-63292   | https://security-tracker.debian.org/tracker/CVE-2026-63292  
                        apache | CVE-2026-59797   | https://security-tracker.debian.org/tracker/CVE-2026-59797  
                        apache | CVE-2026-47360   | https://security-tracker.debian.org/tracker/CVE-2026-47360  
                        apache | CVE-2026-73637   | https://security-tracker.debian.org/tracker/CVE-2026-73637  
                        apache | CVE-2026-73636   | https://security-tracker.debian.org/tracker/CVE-2026-73636  
                        apache | CVE-2026-42528   | https://security-tracker.debian.org/tracker/CVE-2026-42528  
                        apache | CVE-2026-56154   | https://security-tracker.debian.org/tracker/CVE-2026-56154  
                        apache | CVE-2026-56153   | https://security-tracker.debian.org/tracker/CVE-2026-56153  
                        apache | CVE-2026-57941   | https://security-tracker.debian.org/tracker/CVE-2026-57941  
                        apache | CVE-2026-59685   | https://security-tracker.debian.org/tracker/CVE-2026-59685  
                        apache | CVE-2026-79768   | https://security-tracker.debian.org/tracker/CVE-2026-79768  
                        apache | CVE-2026-58415   | https://security-tracker.debian.org/tracker/CVE-2026-58415  
                        apache | CVE-2026-63686   | https://security-tracker.debian.org/tracker/CVE-2026-63686  
                        apache | CVE-2026-48005   | https://security-tracker.debian.org/tracker/CVE-2026-48005  
                        apache | CVE-2026-46729   | https://security-tracker.debian.org/tracker/CVE-2026-46729  
                        apache | CVE-2026-63045   | https://security-tracker.debian.org/tracker/CVE-2026-63045  
                        apache | CVE-2026-42356   | https://security-tracker.debian.org/tracker/CVE-2026-42356  
                        apache | CVE-2026-63718   | https://security-tracker.debian.org/tracker/CVE-2026-63718  
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                        assimp | CVE-2025-11275   | https://security-tracker.debian.org/tracker/CVE-2025-11275  
                        assimp | CVE-2025-11277   | https://security-tracker.debian.org/tracker/CVE-2025-11277  
                        assimp | CVE-2025-11274   | https://security-tracker.debian.org/tracker/CVE-2025-11274  
                        assimp | CVE-2025-15538   | https://security-tracker.debian.org/tracker/CVE-2025-15538  
                         avahi | CVE-2025-59529   | https://security-tracker.debian.org/tracker/CVE-2025-59529  
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2025-69649   | https://security-tracker.debian.org/tracker/CVE-2025-69649  
                      binutils | CVE-2025-69647   | https://security-tracker.debian.org/tracker/CVE-2025-69647  
                      binutils | CVE-2025-69648   | https://security-tracker.debian.org/tracker/CVE-2025-69648  
                      binutils | CVE-2025-69651   | https://security-tracker.debian.org/tracker/CVE-2025-69651  
                      binutils | CVE-2025-69652   | https://security-tracker.debian.org/tracker/CVE-2025-69652  
                      binutils | CVE-2025-69650   | https://security-tracker.debian.org/tracker/CVE-2025-69650  
                      binutils | CVE-2025-69644   | https://security-tracker.debian.org/tracker/CVE-2025-69644  
                      binutils | CVE-2026-6846    | https://security-tracker.debian.org/tracker/CVE-2026-6846   
                         bison | CVE-2026-56390   | https://security-tracker.debian.org/tracker/CVE-2026-56390  
                         bison | CVE-2026-56389   | https://security-tracker.debian.org/tracker/CVE-2026-56389  
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                         botan | CVE-2026-44378   | https://security-tracker.debian.org/tracker/CVE-2026-44378  
                       busybox | CVE-2026-38755   | https://security-tracker.debian.org/tracker/CVE-2026-38755  
                       busybox | CVE-2026-38754   | https://security-tracker.debian.org/tracker/CVE-2026-38754  
                       busybox | CVE-2026-38753   | https://security-tracker.debian.org/tracker/CVE-2026-38753  
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                      civetweb | CVE-2026-5789    | https://security-tracker.debian.org/tracker/CVE-2026-5789   
                         cjson | CVE-2026-67216   | https://security-tracker.debian.org/tracker/CVE-2026-67216  
                         cjson | CVE-2026-67217   | https://security-tracker.debian.org/tracker/CVE-2026-67217  
                         cjson | CVE-2026-67215   | https://security-tracker.debian.org/tracker/CVE-2026-67215  
                         cjson | CVE-2026-16554   | https://security-tracker.debian.org/tracker/CVE-2026-16554  
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                      composer | CVE-2025-67746   | https://security-tracker.debian.org/tracker/CVE-2025-67746  
                      composer | CVE-2026-40261   | https://security-tracker.debian.org/tracker/CVE-2026-40261  
                      composer | CVE-2026-40176   | https://security-tracker.debian.org/tracker/CVE-2026-40176  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                     coreutils | CVE-2026-56391   | https://security-tracker.debian.org/tracker/CVE-2026-56391  
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                          crun | CVE-2026-30892   | https://security-tracker.debian.org/tracker/CVE-2026-30892  
               cryptodev-linux | CVE-2026-28529   | https://security-tracker.debian.org/tracker/CVE-2026-28529  
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                          cups | CVE-2026-55480   | https://security-tracker.debian.org/tracker/CVE-2026-55480  
                          cups | CVE-2026-55453   | https://security-tracker.debian.org/tracker/CVE-2026-55453  
                          cups | CVE-2026-55467   | https://security-tracker.debian.org/tracker/CVE-2026-55467  
                          cups | CVE-2026-61702   | https://security-tracker.debian.org/tracker/CVE-2026-61702  
                          cups | CVE-2026-107885  | https://security-tracker.debian.org/tracker/CVE-2026-107885 
                          cups | CVE-2026-107890  | https://security-tracker.debian.org/tracker/CVE-2026-107890 
                          cups | CVE-2026-107886  | https://security-tracker.debian.org/tracker/CVE-2026-107886 
                          cups | CVE-2026-107888  | https://security-tracker.debian.org/tracker/CVE-2026-107888 
                        dhcpcd | CVE-2026-56113   | https://security-tracker.debian.org/tracker/CVE-2026-56113  
                        dhcpcd | CVE-2026-56114   | https://security-tracker.debian.org/tracker/CVE-2026-56114  
                        dhcpcd | CVE-2026-56116   | https://security-tracker.debian.org/tracker/CVE-2026-56116  
                        dhcpcd | CVE-2026-56117   | https://security-tracker.debian.org/tracker/CVE-2026-56117  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                 docker-engine | CVE-2026-41568   | https://security-tracker.debian.org/tracker/CVE-2026-41568  
                 docker-engine | CVE-2026-42306   | https://security-tracker.debian.org/tracker/CVE-2026-42306  
                      domoticz | CVE-2026-1001    | https://security-tracker.debian.org/tracker/CVE-2026-1001   
                       dovecot | CVE-2025-59032   | https://security-tracker.debian.org/tracker/CVE-2025-59032  
                       dovecot | CVE-2025-59028   | https://security-tracker.debian.org/tracker/CVE-2025-59028  
                       dovecot | CVE-2025-59031   | https://security-tracker.debian.org/tracker/CVE-2025-59031  
                       dovecot | CVE-2026-33603   | https://security-tracker.debian.org/tracker/CVE-2026-33603  
                       dovecot | CVE-2026-0394    | https://security-tracker.debian.org/tracker/CVE-2026-0394   
                       dovecot | CVE-2026-40016   | https://security-tracker.debian.org/tracker/CVE-2026-40016  
                       dovecot | CVE-2026-40020   | https://security-tracker.debian.org/tracker/CVE-2026-40020  
                       dovecot | CVE-2026-42006   | https://security-tracker.debian.org/tracker/CVE-2026-42006  
                       dovecot | CVE-2026-24031   | https://security-tracker.debian.org/tracker/CVE-2026-24031  
                       dovecot | CVE-2026-27857   | https://security-tracker.debian.org/tracker/CVE-2026-27857  
                       dovecot | CVE-2026-27855   | https://security-tracker.debian.org/tracker/CVE-2026-27855  
                       dovecot | CVE-2026-27858   | https://security-tracker.debian.org/tracker/CVE-2026-27858  
                       dovecot | CVE-2026-27856   | https://security-tracker.debian.org/tracker/CVE-2026-27856  
                       dovecot | CVE-2026-27860   | https://security-tracker.debian.org/tracker/CVE-2026-27860  
                       dovecot | CVE-2026-27851   | https://security-tracker.debian.org/tracker/CVE-2026-27851  
                       dovecot | CVE-2026-27859   | https://security-tracker.debian.org/tracker/CVE-2026-27859  
                      easy-rsa | CVE-2024-13454   | https://security-tracker.debian.org/tracker/CVE-2024-13454  
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                         emlog | CVE-2024-12842   | https://security-tracker.debian.org/tracker/CVE-2024-12842  
                         emlog | CVE-2024-12846   | https://security-tracker.debian.org/tracker/CVE-2024-12846  
                         emlog | CVE-2024-12843   | https://security-tracker.debian.org/tracker/CVE-2024-12843  
                         emlog | CVE-2024-12841   | https://security-tracker.debian.org/tracker/CVE-2024-12841  
                         emlog | CVE-2024-12845   | https://security-tracker.debian.org/tracker/CVE-2024-12845  
                         emlog | CVE-2024-12844   | https://security-tracker.debian.org/tracker/CVE-2024-12844  
                         emlog | CVE-2024-46540   | https://security-tracker.debian.org/tracker/CVE-2024-46540  
                         emlog | CVE-2024-50655   | https://security-tracker.debian.org/tracker/CVE-2024-50655  
                         emlog | CVE-2025-53926   | https://security-tracker.debian.org/tracker/CVE-2025-53926  
                         emlog | CVE-2025-53923   | https://security-tracker.debian.org/tracker/CVE-2025-53923  
                         emlog | CVE-2025-53924   | https://security-tracker.debian.org/tracker/CVE-2025-53924  
                         emlog | CVE-2025-53925   | https://security-tracker.debian.org/tracker/CVE-2025-53925  
                         emlog | CVE-2025-61930   | https://security-tracker.debian.org/tracker/CVE-2025-61930  
                         emlog | CVE-2025-61769   | https://security-tracker.debian.org/tracker/CVE-2025-61769  
                         emlog | CVE-2025-47787   | https://security-tracker.debian.org/tracker/CVE-2025-47787  
                         emlog | CVE-2025-47785   | https://security-tracker.debian.org/tracker/CVE-2025-47785  
                         emlog | CVE-2025-47784   | https://security-tracker.debian.org/tracker/CVE-2025-47784  
                         emlog | CVE-2025-61597   | https://security-tracker.debian.org/tracker/CVE-2025-61597  
                         emlog | CVE-2025-61599   | https://security-tracker.debian.org/tracker/CVE-2025-61599  
                         emlog | CVE-2025-30372   | https://security-tracker.debian.org/tracker/CVE-2025-30372  
                         emlog | CVE-2025-9296    | https://security-tracker.debian.org/tracker/CVE-2025-9296   
                         emlog | CVE-2025-5886    | https://security-tracker.debian.org/tracker/CVE-2025-5886   
                         emlog | CVE-2026-22799   | https://security-tracker.debian.org/tracker/CVE-2026-22799  
                         emlog | CVE-2026-34229   | https://security-tracker.debian.org/tracker/CVE-2026-34229  
                         emlog | CVE-2026-34228   | https://security-tracker.debian.org/tracker/CVE-2026-34228  
                         emlog | CVE-2026-34607   | https://security-tracker.debian.org/tracker/CVE-2026-34607  
                         emlog | CVE-2026-21433   | https://security-tracker.debian.org/tracker/CVE-2026-21433  
                         emlog | CVE-2026-31954   | https://security-tracker.debian.org/tracker/CVE-2026-31954  
                         emlog | CVE-2026-34788   | https://security-tracker.debian.org/tracker/CVE-2026-34788  
                         emlog | CVE-2026-34787   | https://security-tracker.debian.org/tracker/CVE-2026-34787  
                        erlang | CVE-2026-48860   | https://security-tracker.debian.org/tracker/CVE-2026-48860  
                        erlang | CVE-2026-48856   | https://security-tracker.debian.org/tracker/CVE-2026-48856  
                        erlang | CVE-2026-48858   | https://security-tracker.debian.org/tracker/CVE-2026-48858  
                        erlang | CVE-2026-48855   | https://security-tracker.debian.org/tracker/CVE-2026-48855  
                        erlang | CVE-2026-42792   | https://security-tracker.debian.org/tracker/CVE-2026-42792  
                        erlang | CVE-2026-53422   | https://security-tracker.debian.org/tracker/CVE-2026-53422  
                        erlang | CVE-2026-55952   | https://security-tracker.debian.org/tracker/CVE-2026-55952  
                        erlang | CVE-2026-55950   | https://security-tracker.debian.org/tracker/CVE-2026-55950  
                        erlang | CVE-2026-55953   | https://security-tracker.debian.org/tracker/CVE-2026-55953  
                        erlang | CVE-2026-49760   | https://security-tracker.debian.org/tracker/CVE-2026-49760  
                        erlang | CVE-2026-49759   | https://security-tracker.debian.org/tracker/CVE-2026-49759  
                        erlang | CVE-2026-58227   | https://security-tracker.debian.org/tracker/CVE-2026-58227  
                        erlang | CVE-2026-55737   | https://security-tracker.debian.org/tracker/CVE-2026-55737  
                        erlang | CVE-2026-54887   | https://security-tracker.debian.org/tracker/CVE-2026-54887  
                        erlang | CVE-2026-54886   | https://security-tracker.debian.org/tracker/CVE-2026-54886  
                        erlang | CVE-2026-54891   | https://security-tracker.debian.org/tracker/CVE-2026-54891  
                        erlang | CVE-2026-59251   | https://security-tracker.debian.org/tracker/CVE-2026-59251  
                          exim | CVE-2026-94057   | https://security-tracker.debian.org/tracker/CVE-2026-94057  
                          exim | CVE-2026-94056   | https://security-tracker.debian.org/tracker/CVE-2026-94056  
                          exim | CVE-2026-94054   | https://security-tracker.debian.org/tracker/CVE-2026-94054  
                          exim | CVE-2026-94055   | https://security-tracker.debian.org/tracker/CVE-2026-94055  
                        ffmpeg | CVE-2023-50007   | https://security-tracker.debian.org/tracker/CVE-2023-50007  
                        ffmpeg | CVE-2023-50008   | https://security-tracker.debian.org/tracker/CVE-2023-50008  
                        ffmpeg | CVE-2023-50009   | https://security-tracker.debian.org/tracker/CVE-2023-50009  
                        ffmpeg | CVE-2023-50010   | https://security-tracker.debian.org/tracker/CVE-2023-50010  
                        ffmpeg | CVE-2023-49502   | https://security-tracker.debian.org/tracker/CVE-2023-49502  
                        ffmpeg | CVE-2024-31585   | https://security-tracker.debian.org/tracker/CVE-2024-31585  
                        ffmpeg | CVE-2024-31582   | https://security-tracker.debian.org/tracker/CVE-2024-31582  
                        ffmpeg | CVE-2024-31578   | https://security-tracker.debian.org/tracker/CVE-2024-31578  
                        ffmpeg | CVE-2025-12343   | https://security-tracker.debian.org/tracker/CVE-2025-12343  
                        ffmpeg | CVE-2025-1373    | https://security-tracker.debian.org/tracker/CVE-2025-1373   
                        ffmpeg | CVE-2025-10256   | https://security-tracker.debian.org/tracker/CVE-2025-10256  
                        ffmpeg | CVE-2025-1594    | https://security-tracker.debian.org/tracker/CVE-2025-1594   
                        ffmpeg | CVE-2025-25469   | https://security-tracker.debian.org/tracker/CVE-2025-25469  
                        ffmpeg | CVE-2025-25468   | https://security-tracker.debian.org/tracker/CVE-2025-25468  
                        ffmpeg | CVE-2026-64834   | https://security-tracker.debian.org/tracker/CVE-2026-64834  
                        ffmpeg | CVE-2026-64835   | https://security-tracker.debian.org/tracker/CVE-2026-64835  
                        ffmpeg | CVE-2026-64832   | https://security-tracker.debian.org/tracker/CVE-2026-64832  
                        ffmpeg | CVE-2026-64833   | https://security-tracker.debian.org/tracker/CVE-2026-64833  
                        ffmpeg | CVE-2026-64830   | https://security-tracker.debian.org/tracker/CVE-2026-64830  
                        ffmpeg | CVE-2026-30754   | https://security-tracker.debian.org/tracker/CVE-2026-30754  
                        ffmpeg | CVE-2026-96611   | https://security-tracker.debian.org/tracker/CVE-2026-96611  
                        ffmpeg | CVE-2026-65706   | https://security-tracker.debian.org/tracker/CVE-2026-65706  
                        ffmpeg | CVE-2026-65704   | https://security-tracker.debian.org/tracker/CVE-2026-65704  
                        ffmpeg | CVE-2026-65703   | https://security-tracker.debian.org/tracker/CVE-2026-65703  
                        ffmpeg | CVE-2026-65705   | https://security-tracker.debian.org/tracker/CVE-2026-65705  
                        ffmpeg | CVE-2026-52297   | https://security-tracker.debian.org/tracker/CVE-2026-52297  
                        ffmpeg | CVE-2026-52296   | https://security-tracker.debian.org/tracker/CVE-2026-52296  
                        ffmpeg | CVE-2026-52295   | https://security-tracker.debian.org/tracker/CVE-2026-52295  
                        ffmpeg | CVE-2026-66037   | https://security-tracker.debian.org/tracker/CVE-2026-66037  
                        ffmpeg | CVE-2026-66039   | https://security-tracker.debian.org/tracker/CVE-2026-66039  
                        ffmpeg | CVE-2026-66040   | https://security-tracker.debian.org/tracker/CVE-2026-66040  
                        ffmpeg | CVE-2026-66036   | https://security-tracker.debian.org/tracker/CVE-2026-66036  
                        ffmpeg | CVE-2026-66038   | https://security-tracker.debian.org/tracker/CVE-2026-66038  
                        ffmpeg | CVE-2026-40962   | https://security-tracker.debian.org/tracker/CVE-2026-40962  
                        ffmpeg | CVE-2026-107696  | https://security-tracker.debian.org/tracker/CVE-2026-107696 
                        ffmpeg | CVE-2026-107675  | https://security-tracker.debian.org/tracker/CVE-2026-107675 
                        ffmpeg | CVE-2026-107698  | https://security-tracker.debian.org/tracker/CVE-2026-107698 
                        ffmpeg | CVE-2026-107676  | https://security-tracker.debian.org/tracker/CVE-2026-107676 
                        ffmpeg | CVE-2026-107695  | https://security-tracker.debian.org/tracker/CVE-2026-107695 
                        ffmpeg | CVE-2026-107678  | https://security-tracker.debian.org/tracker/CVE-2026-107678 
                        ffmpeg | CVE-2026-107677  | https://security-tracker.debian.org/tracker/CVE-2026-107677 
                        ffmpeg | CVE-2026-107660  | https://security-tracker.debian.org/tracker/CVE-2026-107660 
                        ffmpeg | CVE-2026-107697  | https://security-tracker.debian.org/tracker/CVE-2026-107697 
                        ffmpeg | CVE-2026-70631   | https://security-tracker.debian.org/tracker/CVE-2026-70631  
                        ffmpeg | CVE-2026-70628   | https://security-tracker.debian.org/tracker/CVE-2026-70628  
                        ffmpeg | CVE-2026-70630   | https://security-tracker.debian.org/tracker/CVE-2026-70630  
                        ffmpeg | CVE-2026-70629   | https://security-tracker.debian.org/tracker/CVE-2026-70629  
                        ffmpeg | CVE-2026-70632   | https://security-tracker.debian.org/tracker/CVE-2026-70632  
                        ffmpeg | CVE-2026-30998   | https://security-tracker.debian.org/tracker/CVE-2026-30998  
                        ffmpeg | CVE-2026-30997   | https://security-tracker.debian.org/tracker/CVE-2026-30997  
                        ffmpeg | CVE-2026-30999   | https://security-tracker.debian.org/tracker/CVE-2026-30999  
                     firewalld | CVE-2026-4948    | https://security-tracker.debian.org/tracker/CVE-2026-4948   
                       flannel | CVE-2026-32241   | https://security-tracker.debian.org/tracker/CVE-2026-32241  
                       freerdp | CVE-2026-55648   | https://security-tracker.debian.org/tracker/CVE-2026-55648  
                       freerdp | CVE-2026-27951   | https://security-tracker.debian.org/tracker/CVE-2026-27951  
                       freerdp | CVE-2026-27950   | https://security-tracker.debian.org/tracker/CVE-2026-27950  
                       freerdp | CVE-2026-91962   | https://security-tracker.debian.org/tracker/CVE-2026-91962  
                       freerdp | CVE-2026-91960   | https://security-tracker.debian.org/tracker/CVE-2026-91960  
                       freerdp | CVE-2026-91954   | https://security-tracker.debian.org/tracker/CVE-2026-91954  
                       freerdp | CVE-2026-91961   | https://security-tracker.debian.org/tracker/CVE-2026-91961  
                       freerdp | CVE-2026-91946   | https://security-tracker.debian.org/tracker/CVE-2026-91946  
                       freerdp | CVE-2026-91957   | https://security-tracker.debian.org/tracker/CVE-2026-91957  
                       freerdp | CVE-2026-91959   | https://security-tracker.debian.org/tracker/CVE-2026-91959  
                       freerdp | CVE-2026-91956   | https://security-tracker.debian.org/tracker/CVE-2026-91956  
                       freerdp | CVE-2026-91955   | https://security-tracker.debian.org/tracker/CVE-2026-91955  
                       freerdp | CVE-2026-91950   | https://security-tracker.debian.org/tracker/CVE-2026-91950  
                       freerdp | CVE-2026-91963   | https://security-tracker.debian.org/tracker/CVE-2026-91963  
                       freerdp | CVE-2026-91953   | https://security-tracker.debian.org/tracker/CVE-2026-91953  
                       freerdp | CVE-2026-22854   | https://security-tracker.debian.org/tracker/CVE-2026-22854  
                       freerdp | CVE-2026-22851   | https://security-tracker.debian.org/tracker/CVE-2026-22851  
                       freerdp | CVE-2026-22859   | https://security-tracker.debian.org/tracker/CVE-2026-22859  
                       freerdp | CVE-2026-22857   | https://security-tracker.debian.org/tracker/CVE-2026-22857  
                       freerdp | CVE-2026-22858   | https://security-tracker.debian.org/tracker/CVE-2026-22858  
                       freerdp | CVE-2026-22853   | https://security-tracker.debian.org/tracker/CVE-2026-22853  
                       freerdp | CVE-2026-22855   | https://security-tracker.debian.org/tracker/CVE-2026-22855  
                       freerdp | CVE-2026-22856   | https://security-tracker.debian.org/tracker/CVE-2026-22856  
                       freerdp | CVE-2026-22852   | https://security-tracker.debian.org/tracker/CVE-2026-22852  
                       freerdp | CVE-2026-68579   | https://security-tracker.debian.org/tracker/CVE-2026-68579  
                       freerdp | CVE-2026-68580   | https://security-tracker.debian.org/tracker/CVE-2026-68580  
                       freerdp | CVE-2026-110832  | https://security-tracker.debian.org/tracker/CVE-2026-110832 
                       freerdp | CVE-2026-110837  | https://security-tracker.debian.org/tracker/CVE-2026-110837 
                       freerdp | CVE-2026-110834  | https://security-tracker.debian.org/tracker/CVE-2026-110834 
                       freerdp | CVE-2026-110830  | https://security-tracker.debian.org/tracker/CVE-2026-110830 
                       freerdp | CVE-2026-67288   | https://security-tracker.debian.org/tracker/CVE-2026-67288  
                       freerdp | CVE-2026-67290   | https://security-tracker.debian.org/tracker/CVE-2026-67290  
                       freerdp | CVE-2026-67294   | https://security-tracker.debian.org/tracker/CVE-2026-67294  
                       freerdp | CVE-2026-67289   | https://security-tracker.debian.org/tracker/CVE-2026-67289  
                       freerdp | CVE-2026-67293   | https://security-tracker.debian.org/tracker/CVE-2026-67293  
                       freerdp | CVE-2026-67296   | https://security-tracker.debian.org/tracker/CVE-2026-67296  
                       freerdp | CVE-2026-67299   | https://security-tracker.debian.org/tracker/CVE-2026-67299  
                       freerdp | CVE-2026-67291   | https://security-tracker.debian.org/tracker/CVE-2026-67291  
                       freerdp | CVE-2026-67297   | https://security-tracker.debian.org/tracker/CVE-2026-67297  
                       freerdp | CVE-2026-67292   | https://security-tracker.debian.org/tracker/CVE-2026-67292  
                       freerdp | CVE-2026-29775   | https://security-tracker.debian.org/tracker/CVE-2026-29775  
                       freerdp | CVE-2026-29776   | https://security-tracker.debian.org/tracker/CVE-2026-29776  
                       freerdp | CVE-2026-29774   | https://security-tracker.debian.org/tracker/CVE-2026-29774  
                       freerdp | CVE-2026-64624   | https://security-tracker.debian.org/tracker/CVE-2026-64624  
                       freerdp | CVE-2026-64620   | https://security-tracker.debian.org/tracker/CVE-2026-64620  
                       freerdp | CVE-2026-31897   | https://security-tracker.debian.org/tracker/CVE-2026-31897  
                       freerdp | CVE-2026-31885   | https://security-tracker.debian.org/tracker/CVE-2026-31885  
                       freerdp | CVE-2026-31883   | https://security-tracker.debian.org/tracker/CVE-2026-31883  
                       freerdp | CVE-2026-31806   | https://security-tracker.debian.org/tracker/CVE-2026-31806  
                       freerdp | CVE-2026-31884   | https://security-tracker.debian.org/tracker/CVE-2026-31884  
                       freerdp | CVE-2026-27015   | https://security-tracker.debian.org/tracker/CVE-2026-27015  
                       freerdp | CVE-2026-33995   | https://security-tracker.debian.org/tracker/CVE-2026-33995  
                       freerdp | CVE-2026-33986   | https://security-tracker.debian.org/tracker/CVE-2026-33986  
                       freerdp | CVE-2026-33983   | https://security-tracker.debian.org/tracker/CVE-2026-33983  
                       freerdp | CVE-2026-33985   | https://security-tracker.debian.org/tracker/CVE-2026-33985  
                       freerdp | CVE-2026-33987   | https://security-tracker.debian.org/tracker/CVE-2026-33987  
                       freerdp | CVE-2026-33977   | https://security-tracker.debian.org/tracker/CVE-2026-33977  
                       freerdp | CVE-2026-33984   | https://security-tracker.debian.org/tracker/CVE-2026-33984  
                       freerdp | CVE-2026-33952   | https://security-tracker.debian.org/tracker/CVE-2026-33952  
                       freerdp | CVE-2026-33982   | https://security-tracker.debian.org/tracker/CVE-2026-33982  
                       freerdp | CVE-2026-40254   | https://security-tracker.debian.org/tracker/CVE-2026-40254  
                       freerdp | CVE-2026-55191   | https://security-tracker.debian.org/tracker/CVE-2026-55191  
                       freerdp | CVE-2026-55192   | https://security-tracker.debian.org/tracker/CVE-2026-55192  
                       freerdp | CVE-2026-55193   | https://security-tracker.debian.org/tracker/CVE-2026-55193  
                       freerdp | CVE-2026-55194   | https://security-tracker.debian.org/tracker/CVE-2026-55194  
                       freerdp | CVE-2026-26271   | https://security-tracker.debian.org/tracker/CVE-2026-26271  
                       freerdp | CVE-2026-24491   | https://security-tracker.debian.org/tracker/CVE-2026-24491  
                       freerdp | CVE-2026-57157   | https://security-tracker.debian.org/tracker/CVE-2026-57157  
                       freerdp | CVE-2026-57156   | https://security-tracker.debian.org/tracker/CVE-2026-57156  
                       freerdp | CVE-2026-40033   | https://security-tracker.debian.org/tracker/CVE-2026-40033  
                       freerdp | CVE-2026-26986   | https://security-tracker.debian.org/tracker/CVE-2026-26986  
                       freerdp | CVE-2026-26965   | https://security-tracker.debian.org/tracker/CVE-2026-26965  
                       freerdp | CVE-2026-26955   | https://security-tracker.debian.org/tracker/CVE-2026-26955  
                       freerdp | CVE-2026-56297   | https://security-tracker.debian.org/tracker/CVE-2026-56297  
                       freerdp | CVE-2026-24677   | https://security-tracker.debian.org/tracker/CVE-2026-24677  
                       freerdp | CVE-2026-24678   | https://security-tracker.debian.org/tracker/CVE-2026-24678  
                       freerdp | CVE-2026-24680   | https://security-tracker.debian.org/tracker/CVE-2026-24680  
                       freerdp | CVE-2026-45700   | https://security-tracker.debian.org/tracker/CVE-2026-45700  
                       freerdp | CVE-2026-111373  | https://security-tracker.debian.org/tracker/CVE-2026-111373 
                       freerdp | CVE-2026-111382  | https://security-tracker.debian.org/tracker/CVE-2026-111382 
                       freerdp | CVE-2026-111381  | https://security-tracker.debian.org/tracker/CVE-2026-111381 
                       freerdp | CVE-2026-111379  | https://security-tracker.debian.org/tracker/CVE-2026-111379 
                       freerdp | CVE-2026-111377  | https://security-tracker.debian.org/tracker/CVE-2026-111377 
                       freerdp | CVE-2026-67306   | https://security-tracker.debian.org/tracker/CVE-2026-67306  
                       freerdp | CVE-2026-67303   | https://security-tracker.debian.org/tracker/CVE-2026-67303  
                       freerdp | CVE-2026-67301   | https://security-tracker.debian.org/tracker/CVE-2026-67301  
                       freerdp | CVE-2026-67304   | https://security-tracker.debian.org/tracker/CVE-2026-67304  
                       freerdp | CVE-2026-67305   | https://security-tracker.debian.org/tracker/CVE-2026-67305  
                       freerdp | CVE-2026-67302   | https://security-tracker.debian.org/tracker/CVE-2026-67302  
                       freerdp | CVE-2026-85090   | https://security-tracker.debian.org/tracker/CVE-2026-85090  
                       freerdp | CVE-2026-55827   | https://security-tracker.debian.org/tracker/CVE-2026-55827  
                       freerdp | CVE-2026-23883   | https://security-tracker.debian.org/tracker/CVE-2026-23883  
                       freerdp | CVE-2026-23884   | https://security-tracker.debian.org/tracker/CVE-2026-23884  
                       freerdp | CVE-2026-44422   | https://security-tracker.debian.org/tracker/CVE-2026-44422  
                       freerdp | CVE-2026-44420   | https://security-tracker.debian.org/tracker/CVE-2026-44420  
                       freerdp | CVE-2026-44421   | https://security-tracker.debian.org/tracker/CVE-2026-44421  
                       freerdp | CVE-2026-23732   | https://security-tracker.debian.org/tracker/CVE-2026-23732  
                       freerdp | CVE-2026-73242   | https://security-tracker.debian.org/tracker/CVE-2026-73242  
                       freerdp | CVE-2026-73241   | https://security-tracker.debian.org/tracker/CVE-2026-73241  
                       freerdp | CVE-2026-63633   | https://security-tracker.debian.org/tracker/CVE-2026-63633  
                       freerdp | CVE-2026-63652   | https://security-tracker.debian.org/tracker/CVE-2026-63652  
                       freerdp | CVE-2026-63117   | https://security-tracker.debian.org/tracker/CVE-2026-63117  
                       freerdp | CVE-2026-66401   | https://security-tracker.debian.org/tracker/CVE-2026-66401  
                       freerdp | CVE-2026-66402   | https://security-tracker.debian.org/tracker/CVE-2026-66402  
                       freerdp | CVE-2026-55564   | https://security-tracker.debian.org/tracker/CVE-2026-55564  
                       freerdp | CVE-2026-25959   | https://security-tracker.debian.org/tracker/CVE-2026-25959  
                       freerdp | CVE-2026-25954   | https://security-tracker.debian.org/tracker/CVE-2026-25954  
                       freerdp | CVE-2026-25952   | https://security-tracker.debian.org/tracker/CVE-2026-25952  
                       freerdp | CVE-2026-25942   | https://security-tracker.debian.org/tracker/CVE-2026-25942  
                       freerdp | CVE-2026-25955   | https://security-tracker.debian.org/tracker/CVE-2026-25955  
                       freerdp | CVE-2026-25997   | https://security-tracker.debian.org/tracker/CVE-2026-25997  
                       freerdp | CVE-2026-25953   | https://security-tracker.debian.org/tracker/CVE-2026-25953  
                           frr | CVE-2026-37458   | https://security-tracker.debian.org/tracker/CVE-2026-37458  
                          gawk | CVE-2026-40553   | https://security-tracker.debian.org/tracker/CVE-2026-40553  
                          gawk | CVE-2026-40468   | https://security-tracker.debian.org/tracker/CVE-2026-40468  
                          gawk | CVE-2026-40469   | https://security-tracker.debian.org/tracker/CVE-2026-40469  
                          gawk | CVE-2026-40467   | https://security-tracker.debian.org/tracker/CVE-2026-40467  
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                          gdal | CVE-2026-49014   | https://security-tracker.debian.org/tracker/CVE-2026-49014  
                          gdal | CVE-2026-8088    | https://security-tracker.debian.org/tracker/CVE-2026-8088   
                          gdal | CVE-2026-8087    | https://security-tracker.debian.org/tracker/CVE-2026-8087   
                          gdal | CVE-2026-8084    | https://security-tracker.debian.org/tracker/CVE-2026-8084   
                          gdal | CVE-2026-8086    | https://security-tracker.debian.org/tracker/CVE-2026-8086   
                          gdal | CVE-2026-8212    | https://security-tracker.debian.org/tracker/CVE-2026-8212   
                          gdal | CVE-2026-8213    | https://security-tracker.debian.org/tracker/CVE-2026-8213   
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                         gnupg | CVE-2025-30258   | https://security-tracker.debian.org/tracker/CVE-2025-30258  
                         gnupg | CVE-2025-68973   | https://security-tracker.debian.org/tracker/CVE-2025-68973  
                         gnupg | CVE-2025-68972   | https://security-tracker.debian.org/tracker/CVE-2025-68972  
                          gpsd | CVE-2026-58459   | https://security-tracker.debian.org/tracker/CVE-2026-58459  
                         grub2 | CVE-2024-2312    | https://security-tracker.debian.org/tracker/CVE-2024-2312   
                         grub2 | CVE-2025-61662   | https://security-tracker.debian.org/tracker/CVE-2025-61662  
             gst1-plugins-good | CVE-2026-46470   | https://security-tracker.debian.org/tracker/CVE-2026-46470  
             gst1-plugins-good | CVE-2026-46469   | https://security-tracker.debian.org/tracker/CVE-2026-46469  
                    gstreamer1 | CVE-2025-47183   | https://security-tracker.debian.org/tracker/CVE-2025-47183  
                    gstreamer1 | CVE-2025-3887    | https://security-tracker.debian.org/tracker/CVE-2025-3887   
                    gstreamer1 | CVE-2025-47219   | https://security-tracker.debian.org/tracker/CVE-2025-47219  
                    gstreamer1 | CVE-2025-2759    | https://security-tracker.debian.org/tracker/CVE-2025-2759   
                    gstreamer1 | CVE-2025-47808   | https://security-tracker.debian.org/tracker/CVE-2025-47808  
                    gstreamer1 | CVE-2025-47806   | https://security-tracker.debian.org/tracker/CVE-2025-47806  
                    gstreamer1 | CVE-2025-47807   | https://security-tracker.debian.org/tracker/CVE-2025-47807  
                    gstreamer1 | CVE-2026-73433   | https://security-tracker.debian.org/tracker/CVE-2026-73433  
                    gstreamer1 | CVE-2026-73434   | https://security-tracker.debian.org/tracker/CVE-2026-73434  
                    gstreamer1 | CVE-2026-1940    | https://security-tracker.debian.org/tracker/CVE-2026-1940   
                    gstreamer1 | CVE-2026-2921    | https://security-tracker.debian.org/tracker/CVE-2026-2921   
                    gstreamer1 | CVE-2026-2923    | https://security-tracker.debian.org/tracker/CVE-2026-2923   
                    gstreamer1 | CVE-2026-2920    | https://security-tracker.debian.org/tracker/CVE-2026-2920   
                    gstreamer1 | CVE-2026-2922    | https://security-tracker.debian.org/tracker/CVE-2026-2922   
                    gstreamer1 | CVE-2026-18299   | https://security-tracker.debian.org/tracker/CVE-2026-18299  
                    gstreamer1 | CVE-2026-18297   | https://security-tracker.debian.org/tracker/CVE-2026-18297  
                    gstreamer1 | CVE-2026-18296   | https://security-tracker.debian.org/tracker/CVE-2026-18296  
                    gstreamer1 | CVE-2026-18298   | https://security-tracker.debian.org/tracker/CVE-2026-18298  
                    gstreamer1 | CVE-2026-18295   | https://security-tracker.debian.org/tracker/CVE-2026-18295  
                    gstreamer1 | CVE-2026-3081    | https://security-tracker.debian.org/tracker/CVE-2026-3081   
                    gstreamer1 | CVE-2026-3084    | https://security-tracker.debian.org/tracker/CVE-2026-3084   
                    gstreamer1 | CVE-2026-3085    | https://security-tracker.debian.org/tracker/CVE-2026-3085   
                    gstreamer1 | CVE-2026-3083    | https://security-tracker.debian.org/tracker/CVE-2026-3083   
                    gstreamer1 | CVE-2026-3086    | https://security-tracker.debian.org/tracker/CVE-2026-3086   
                    gstreamer1 | CVE-2026-3082    | https://security-tracker.debian.org/tracker/CVE-2026-3082   
                          gzip | CVE-2026-41991   | https://security-tracker.debian.org/tracker/CVE-2026-41991  
                          gzip | CVE-2026-41992   | https://security-tracker.debian.org/tracker/CVE-2026-41992  
                       haproxy | CVE-2026-33555   | https://security-tracker.debian.org/tracker/CVE-2026-33555  
                         hplip | CVE-2025-43023   | https://security-tracker.debian.org/tracker/CVE-2025-43023  
                         hplip | CVE-2026-91101   | https://security-tracker.debian.org/tracker/CVE-2026-91101  
                         hplip | CVE-2026-91102   | https://security-tracker.debian.org/tracker/CVE-2026-91102  
                         hplip | CVE-2026-91105   | https://security-tracker.debian.org/tracker/CVE-2026-91105  
                         hplip | CVE-2026-91106   | https://security-tracker.debian.org/tracker/CVE-2026-91106  
                         hplip | CVE-2026-91103   | https://security-tracker.debian.org/tracker/CVE-2026-91103  
                         hplip | CVE-2026-91104   | https://security-tracker.debian.org/tracker/CVE-2026-91104  
                         hplip | CVE-2026-91100   | https://security-tracker.debian.org/tracker/CVE-2026-91100  
                         hplip | CVE-2026-91099   | https://security-tracker.debian.org/tracker/CVE-2026-91099  
                         hplip | CVE-2026-91098   | https://security-tracker.debian.org/tracker/CVE-2026-91098  
                         hplip | CVE-2026-91097   | https://security-tracker.debian.org/tracker/CVE-2026-91097  
                         hplip | CVE-2026-8632    | https://security-tracker.debian.org/tracker/CVE-2026-8632   
                         hplip | CVE-2026-8631    | https://security-tracker.debian.org/tracker/CVE-2026-8631   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2026-93590   | https://security-tracker.debian.org/tracker/CVE-2026-93590  
                   imagemagick | CVE-2026-93586   | https://security-tracker.debian.org/tracker/CVE-2026-93586  
                   imagemagick | CVE-2026-93587   | https://security-tracker.debian.org/tracker/CVE-2026-93587  
                   imagemagick | CVE-2026-93589   | https://security-tracker.debian.org/tracker/CVE-2026-93589  
                   imagemagick | CVE-2026-93588   | https://security-tracker.debian.org/tracker/CVE-2026-93588  
                   imagemagick | CVE-2026-86425   | https://security-tracker.debian.org/tracker/CVE-2026-86425  
                   imagemagick | CVE-2026-86424   | https://security-tracker.debian.org/tracker/CVE-2026-86424  
                   imagemagick | CVE-2026-86420   | https://security-tracker.debian.org/tracker/CVE-2026-86420  
                   imagemagick | CVE-2026-86423   | https://security-tracker.debian.org/tracker/CVE-2026-86423  
                   imagemagick | CVE-2026-86421   | https://security-tracker.debian.org/tracker/CVE-2026-86421  
                   imagemagick | CVE-2026-86422   | https://security-tracker.debian.org/tracker/CVE-2026-86422  
                   imagemagick | CVE-2026-62946   | https://security-tracker.debian.org/tracker/CVE-2026-62946  
                   imagemagick | CVE-2026-64685   | https://security-tracker.debian.org/tracker/CVE-2026-64685  
                   imagemagick | CVE-2026-107209  | https://security-tracker.debian.org/tracker/CVE-2026-107209 
                   imagemagick | CVE-2026-107208  | https://security-tracker.debian.org/tracker/CVE-2026-107208 
                   imagemagick | CVE-2026-107210  | https://security-tracker.debian.org/tracker/CVE-2026-107210 
                   imagemagick | CVE-2026-105083  | https://security-tracker.debian.org/tracker/CVE-2026-105083 
                   imagemagick | CVE-2026-106569  | https://security-tracker.debian.org/tracker/CVE-2026-106569 
                   imagemagick | CVE-2026-106574  | https://security-tracker.debian.org/tracker/CVE-2026-106574 
                   imagemagick | CVE-2026-106566  | https://security-tracker.debian.org/tracker/CVE-2026-106566 
                   imagemagick | CVE-2026-106580  | https://security-tracker.debian.org/tracker/CVE-2026-106580 
                   imagemagick | CVE-2026-106567  | https://security-tracker.debian.org/tracker/CVE-2026-106567 
                   imagemagick | CVE-2026-106568  | https://security-tracker.debian.org/tracker/CVE-2026-106568 
                   imagemagick | CVE-2026-106578  | https://security-tracker.debian.org/tracker/CVE-2026-106578 
                   imagemagick | CVE-2026-106571  | https://security-tracker.debian.org/tracker/CVE-2026-106571 
                   imagemagick | CVE-2026-106565  | https://security-tracker.debian.org/tracker/CVE-2026-106565 
                   imagemagick | CVE-2026-106572  | https://security-tracker.debian.org/tracker/CVE-2026-106572 
                   imagemagick | CVE-2026-106575  | https://security-tracker.debian.org/tracker/CVE-2026-106575 
                   imagemagick | CVE-2026-106564  | https://security-tracker.debian.org/tracker/CVE-2026-106564 
                   imagemagick | CVE-2026-106576  | https://security-tracker.debian.org/tracker/CVE-2026-106576 
                   imagemagick | CVE-2026-106570  | https://security-tracker.debian.org/tracker/CVE-2026-106570 
                   imagemagick | CVE-2026-106573  | https://security-tracker.debian.org/tracker/CVE-2026-106573 
                   imagemagick | CVE-2026-106577  | https://security-tracker.debian.org/tracker/CVE-2026-106577 
                   imagemagick | CVE-2026-106579  | https://security-tracker.debian.org/tracker/CVE-2026-106579 
                   imagemagick | CVE-2026-66011   | https://security-tracker.debian.org/tracker/CVE-2026-66011  
                   imagemagick | CVE-2026-102635  | https://security-tracker.debian.org/tracker/CVE-2026-102635 
                   imagemagick | CVE-2026-62363   | https://security-tracker.debian.org/tracker/CVE-2026-62363  
                         jhead | CVE-2025-44906   | https://security-tracker.debian.org/tracker/CVE-2025-44906  
                            jq | CVE-2026-44777   | https://security-tracker.debian.org/tracker/CVE-2026-44777  
                            jq | CVE-2026-39979   | https://security-tracker.debian.org/tracker/CVE-2026-39979  
                       libcoap | CVE-2026-29013   | https://security-tracker.debian.org/tracker/CVE-2026-29013  
                        libidn | CVE-2026-57053   | https://security-tracker.debian.org/tracker/CVE-2026-57053  
                      libkcapi | CVE-2026-71225   | https://security-tracker.debian.org/tracker/CVE-2026-71225  
                      libkcapi | CVE-2026-71226   | https://security-tracker.debian.org/tracker/CVE-2026-71226  
                      libkcapi | CVE-2026-71227   | https://security-tracker.debian.org/tracker/CVE-2026-71227  
                       libkrb5 | CVE-2026-40355   | https://security-tracker.debian.org/tracker/CVE-2026-40355  
                       libkrb5 | CVE-2026-40356   | https://security-tracker.debian.org/tracker/CVE-2026-40356  
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                    libopenssl | CVE-2026-42772   | https://security-tracker.debian.org/tracker/CVE-2026-42772  
                    libopenssl | CVE-2026-84784   | https://security-tracker.debian.org/tracker/CVE-2026-84784  
                    libopenssl | CVE-2026-84782   | https://security-tracker.debian.org/tracker/CVE-2026-84782  
                    libopenssl | CVE-2026-72897   | https://security-tracker.debian.org/tracker/CVE-2026-72897  
                    libopenssl | CVE-2026-35189   | https://security-tracker.debian.org/tracker/CVE-2026-35189  
                    libopenssl | CVE-2026-35191   | https://security-tracker.debian.org/tracker/CVE-2026-35191  
                    libopenssl | CVE-2026-75806   | https://security-tracker.debian.org/tracker/CVE-2026-75806  
                    libopenssl | CVE-2026-75804   | https://security-tracker.debian.org/tracker/CVE-2026-75804  
                    libopenssl | CVE-2026-75805   | https://security-tracker.debian.org/tracker/CVE-2026-75805  
                    libopenssl | CVE-2026-54875   | https://security-tracker.debian.org/tracker/CVE-2026-54875  
                    libopenssl | CVE-2026-54872   | https://security-tracker.debian.org/tracker/CVE-2026-54872  
                    libopenssl | CVE-2026-54873   | https://security-tracker.debian.org/tracker/CVE-2026-54873  
                    libopenssl | CVE-2026-77696   | https://security-tracker.debian.org/tracker/CVE-2026-77696  
                      libpjsip | CVE-2026-57163   | https://security-tracker.debian.org/tracker/CVE-2026-57163  
                      libpjsip | CVE-2026-57162   | https://security-tracker.debian.org/tracker/CVE-2026-57162  
                      libpjsip | CVE-2026-57160   | https://security-tracker.debian.org/tracker/CVE-2026-57160  
                      libpjsip | CVE-2026-57164   | https://security-tracker.debian.org/tracker/CVE-2026-57164  
                      libpjsip | CVE-2026-57161   | https://security-tracker.debian.org/tracker/CVE-2026-57161  
                      libpjsip | CVE-2026-57166   | https://security-tracker.debian.org/tracker/CVE-2026-57166  
                      libpjsip | CVE-2026-57159   | https://security-tracker.debian.org/tracker/CVE-2026-57159  
                      libpjsip | CVE-2026-57165   | https://security-tracker.debian.org/tracker/CVE-2026-57165  
                      libpjsip | CVE-2026-84975   | https://security-tracker.debian.org/tracker/CVE-2026-84975  
                      libpjsip | CVE-2026-77396   | https://security-tracker.debian.org/tracker/CVE-2026-77396  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                        libraw | CVE-2026-5342    | https://security-tracker.debian.org/tracker/CVE-2026-5342   
                        libraw | CVE-2026-5318    | https://security-tracker.debian.org/tracker/CVE-2026-5318   
                    libsndfile | CVE-2024-50613   | https://security-tracker.debian.org/tracker/CVE-2024-50613  
                    libsndfile | CVE-2025-52194   | https://security-tracker.debian.org/tracker/CVE-2025-52194  
                    libsndfile | CVE-2025-56226   | https://security-tracker.debian.org/tracker/CVE-2025-56226  
                    libsndfile | CVE-2026-37555   | https://security-tracker.debian.org/tracker/CVE-2026-37555  
                       libsolv | CVE-2026-9150    | https://security-tracker.debian.org/tracker/CVE-2026-9150   
                       libsolv | CVE-2026-9149    | https://security-tracker.debian.org/tracker/CVE-2026-9149   
                       libsoup | CVE-2026-102560  | https://security-tracker.debian.org/tracker/CVE-2026-102560 
                       libsoup | CVE-2026-102558  | https://security-tracker.debian.org/tracker/CVE-2026-102558 
                       libsoup | CVE-2026-102555  | https://security-tracker.debian.org/tracker/CVE-2026-102555 
                       libsoup | CVE-2026-102556  | https://security-tracker.debian.org/tracker/CVE-2026-102556 
                       libsoup | CVE-2026-102559  | https://security-tracker.debian.org/tracker/CVE-2026-102559 
                       libsoup | CVE-2026-102557  | https://security-tracker.debian.org/tracker/CVE-2026-102557 
                        libssh | CVE-2025-14821   | https://security-tracker.debian.org/tracker/CVE-2025-14821  
                       libssh2 | CVE-2026-58051   | https://security-tracker.debian.org/tracker/CVE-2026-58051  
                       libssh2 | CVE-2026-58050   | https://security-tracker.debian.org/tracker/CVE-2026-58050  
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                        libucl | CVE-2025-6499    | https://security-tracker.debian.org/tracker/CVE-2025-6499   
                        libucl | CVE-2026-0708    | https://security-tracker.debian.org/tracker/CVE-2026-0708   
                       libvips | CVE-2026-35590   | https://security-tracker.debian.org/tracker/CVE-2026-35590  
                       libvips | CVE-2026-35591   | https://security-tracker.debian.org/tracker/CVE-2026-35591  
                       libvips | CVE-2026-3146    | https://security-tracker.debian.org/tracker/CVE-2026-3146   
                       libvips | CVE-2026-3147    | https://security-tracker.debian.org/tracker/CVE-2026-3147   
                       libvips | CVE-2026-3145    | https://security-tracker.debian.org/tracker/CVE-2026-3145   
                       libvips | CVE-2026-33328   | https://security-tracker.debian.org/tracker/CVE-2026-33328  
                       libvips | CVE-2026-33327   | https://security-tracker.debian.org/tracker/CVE-2026-33327  
                       libvips | CVE-2026-2913    | https://security-tracker.debian.org/tracker/CVE-2026-2913   
                       libvirt | CVE-2024-2496    | https://security-tracker.debian.org/tracker/CVE-2024-2496   
                     llama-cpp | CVE-2026-27940   | https://security-tracker.debian.org/tracker/CVE-2026-27940  
                     llama-cpp | CVE-2026-43631   | https://security-tracker.debian.org/tracker/CVE-2026-43631  
                     llama-cpp | CVE-2026-43628   | https://security-tracker.debian.org/tracker/CVE-2026-43628  
                     llama-cpp | CVE-2026-43632   | https://security-tracker.debian.org/tracker/CVE-2026-43632  
                     llama-cpp | CVE-2026-43629   | https://security-tracker.debian.org/tracker/CVE-2026-43629  
                     llama-cpp | CVE-2026-43627   | https://security-tracker.debian.org/tracker/CVE-2026-43627  
                     llama-cpp | CVE-2026-34159   | https://security-tracker.debian.org/tracker/CVE-2026-34159  
                         lldpd | CVE-2026-46433   | https://security-tracker.debian.org/tracker/CVE-2026-46433  
                         lrzip | CVE-2025-9396    | https://security-tracker.debian.org/tracker/CVE-2025-9396   
                         lrzip | CVE-2025-15570   | https://security-tracker.debian.org/tracker/CVE-2025-15570  
                         lrzip | CVE-2025-15571   | https://security-tracker.debian.org/tracker/CVE-2025-15571  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                           lxc | CVE-2026-39402   | https://security-tracker.debian.org/tracker/CVE-2026-39402  
                       mariadb | CVE-2026-97380   | https://security-tracker.debian.org/tracker/CVE-2026-97380  
                       mariadb | CVE-2026-92262   | https://security-tracker.debian.org/tracker/CVE-2026-92262  
                       mariadb | CVE-2026-35549   | https://security-tracker.debian.org/tracker/CVE-2026-35549  
                       mariadb | CVE-2026-85745   | https://security-tracker.debian.org/tracker/CVE-2026-85745  
                       mariadb | CVE-2026-85746   | https://security-tracker.debian.org/tracker/CVE-2026-85746  
                       mariadb | CVE-2026-85985   | https://security-tracker.debian.org/tracker/CVE-2026-85985  
                       mariadb | CVE-2026-86047   | https://security-tracker.debian.org/tracker/CVE-2026-86047  
                       mariadb | CVE-2026-107822  | https://security-tracker.debian.org/tracker/CVE-2026-107822 
                       mariadb | CVE-2026-107823  | https://security-tracker.debian.org/tracker/CVE-2026-107823 
                       mariadb | CVE-2026-107814  | https://security-tracker.debian.org/tracker/CVE-2026-107814 
                       mariadb | CVE-2026-107816  | https://security-tracker.debian.org/tracker/CVE-2026-107816 
                       mariadb | CVE-2026-107818  | https://security-tracker.debian.org/tracker/CVE-2026-107818 
                       mariadb | CVE-2026-107817  | https://security-tracker.debian.org/tracker/CVE-2026-107817 
                       mariadb | CVE-2026-107815  | https://security-tracker.debian.org/tracker/CVE-2026-107815 
                       mariadb | CVE-2026-107821  | https://security-tracker.debian.org/tracker/CVE-2026-107821 
                   micropython | CVE-2026-1998    | https://security-tracker.debian.org/tracker/CVE-2026-1998   
                      minetest | CVE-2026-41196   | https://security-tracker.debian.org/tracker/CVE-2026-41196  
                      minidlna | CVE-2023-47430   | https://security-tracker.debian.org/tracker/CVE-2023-47430  
                  modsecurity2 | CVE-2026-52747   | https://security-tracker.debian.org/tracker/CVE-2026-52747  
                  modsecurity2 | CVE-2026-30923   | https://security-tracker.debian.org/tracker/CVE-2026-30923  
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mupdf | CVE-2025-71382   | https://security-tracker.debian.org/tracker/CVE-2025-71382  
                         mupdf | CVE-2025-46206   | https://security-tracker.debian.org/tracker/CVE-2025-46206  
                         mupdf | CVE-2026-7233    | https://security-tracker.debian.org/tracker/CVE-2026-7233   
                         mupdf | CVE-2026-40505   | https://security-tracker.debian.org/tracker/CVE-2026-40505  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                       netdata | CVE-2025-71385   | https://security-tracker.debian.org/tracker/CVE-2025-71385  
                       nghttp2 | CVE-2026-58055   | https://security-tracker.debian.org/tracker/CVE-2026-58055  
                          nmap | CVE-2026-58058   | https://security-tracker.debian.org/tracker/CVE-2026-58058  
                          ogre | CVE-2025-11017   | https://security-tracker.debian.org/tracker/CVE-2025-11017  
                          ogre | CVE-2025-11014   | https://security-tracker.debian.org/tracker/CVE-2025-11014  
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                      opendoas | CVE-2023-28339   | https://security-tracker.debian.org/tracker/CVE-2023-28339  
                openfpgaloader | CVE-2026-35170   | https://security-tracker.debian.org/tracker/CVE-2026-35170  
                openfpgaloader | CVE-2026-35176   | https://security-tracker.debian.org/tracker/CVE-2026-35176  
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                       openssh | CVE-2026-106587  | https://security-tracker.debian.org/tracker/CVE-2026-106587 
                       openssh | CVE-2026-106583  | https://security-tracker.debian.org/tracker/CVE-2026-106583 
                       openssh | CVE-2026-106582  | https://security-tracker.debian.org/tracker/CVE-2026-106582 
                       openssh | CVE-2026-106584  | https://security-tracker.debian.org/tracker/CVE-2026-106584 
                       openssh | CVE-2026-106553  | https://security-tracker.debian.org/tracker/CVE-2026-106553 
                       openssh | CVE-2026-106555  | https://security-tracker.debian.org/tracker/CVE-2026-106555 
                       openssh | CVE-2026-106585  | https://security-tracker.debian.org/tracker/CVE-2026-106585 
                       openssh | CVE-2026-106552  | https://security-tracker.debian.org/tracker/CVE-2026-106552 
                       openssh | CVE-2026-106586  | https://security-tracker.debian.org/tracker/CVE-2026-106586 
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                   openvmtools | CVE-2023-20900   | https://security-tracker.debian.org/tracker/CVE-2023-20900  
                   openvmtools | CVE-2023-34057   | https://security-tracker.debian.org/tracker/CVE-2023-34057  
                   openvmtools | CVE-2023-34058   | https://security-tracker.debian.org/tracker/CVE-2023-34058  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                        parsec | CVE-2018-6651    | https://security-tracker.debian.org/tracker/CVE-2018-6651   
                        parsec | CVE-2023-37250   | https://security-tracker.debian.org/tracker/CVE-2023-37250  
                         patch | CVE-2026-56289   | https://security-tracker.debian.org/tracker/CVE-2026-56289  
                         patch | CVE-2026-56288   | https://security-tracker.debian.org/tracker/CVE-2026-56288  
                         pcre2 | CVE-2026-89158   | https://security-tracker.debian.org/tracker/CVE-2026-89158  
                         pcre2 | CVE-2026-89162   | https://security-tracker.debian.org/tracker/CVE-2026-89162  
                         pcre2 | CVE-2026-89161   | https://security-tracker.debian.org/tracker/CVE-2026-89161  
                         pcre2 | CVE-2026-89160   | https://security-tracker.debian.org/tracker/CVE-2026-89160  
                         pcre2 | CVE-2026-89157   | https://security-tracker.debian.org/tracker/CVE-2026-89157  
                         pcre2 | CVE-2026-89156   | https://security-tracker.debian.org/tracker/CVE-2026-89156  
                          perl | CVE-2026-8376    | https://security-tracker.debian.org/tracker/CVE-2026-8376   
                          perl | CVE-2026-57432   | https://security-tracker.debian.org/tracker/CVE-2026-57432  
                          perl | CVE-2026-13221   | https://security-tracker.debian.org/tracker/CVE-2026-13221  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2025-1218    | https://security-tracker.debian.org/tracker/CVE-2025-1218   
                           php | CVE-2025-14181   | https://security-tracker.debian.org/tracker/CVE-2025-14181  
                           php | CVE-2026-109619  | https://security-tracker.debian.org/tracker/CVE-2026-109619 
                           php | CVE-2026-109618  | https://security-tracker.debian.org/tracker/CVE-2026-109618 
                           php | CVE-2026-6103    | https://security-tracker.debian.org/tracker/CVE-2026-6103   
                           php | CVE-2026-93682   | https://security-tracker.debian.org/tracker/CVE-2026-93682  
                           php | CVE-2026-91765   | https://security-tracker.debian.org/tracker/CVE-2026-91765  
                           php | CVE-2026-91766   | https://security-tracker.debian.org/tracker/CVE-2026-91766  
                           php | CVE-2026-91769   | https://security-tracker.debian.org/tracker/CVE-2026-91769  
                           php | CVE-2026-17545   | https://security-tracker.debian.org/tracker/CVE-2026-17545  
                        podman | CVE-2022-2989    | https://security-tracker.debian.org/tracker/CVE-2022-2989   
                        podman | CVE-2026-57231   | https://security-tracker.debian.org/tracker/CVE-2026-57231  
                        podman | CVE-2026-55686   | https://security-tracker.debian.org/tracker/CVE-2026-55686  
                       proftpd | CVE-2026-53994   | https://security-tracker.debian.org/tracker/CVE-2026-53994  
                       prosody | CVE-2026-43506   | https://security-tracker.debian.org/tracker/CVE-2026-43506  
                       prosody | CVE-2026-43504   | https://security-tracker.debian.org/tracker/CVE-2026-43504  
                       prosody | CVE-2026-43505   | https://security-tracker.debian.org/tracker/CVE-2026-43505  
                       prosody | CVE-2026-43507   | https://security-tracker.debian.org/tracker/CVE-2026-43507  
                proxychains-ng | CVE-2025-34451   | https://security-tracker.debian.org/tracker/CVE-2025-34451  
                python-aiohttp | CVE-2026-47265   | https://security-tracker.debian.org/tracker/CVE-2026-47265  
                python-aiohttp | CVE-2026-54280   | https://security-tracker.debian.org/tracker/CVE-2026-54280  
                python-aiohttp | CVE-2026-54274   | https://security-tracker.debian.org/tracker/CVE-2026-54274  
                python-aiohttp | CVE-2026-54273   | https://security-tracker.debian.org/tracker/CVE-2026-54273  
                python-aiohttp | CVE-2026-54279   | https://security-tracker.debian.org/tracker/CVE-2026-54279  
                python-aiohttp | CVE-2026-54277   | https://security-tracker.debian.org/tracker/CVE-2026-54277  
                python-aiohttp | CVE-2026-54275   | https://security-tracker.debian.org/tracker/CVE-2026-54275  
                python-aiohttp | CVE-2026-54276   | https://security-tracker.debian.org/tracker/CVE-2026-54276  
                python-aiohttp | CVE-2026-54278   | https://security-tracker.debian.org/tracker/CVE-2026-54278  
                python-aiohttp | CVE-2026-34993   | https://security-tracker.debian.org/tracker/CVE-2026-34993  
                python-aiohttp | CVE-2026-50269   | https://security-tracker.debian.org/tracker/CVE-2026-50269  
               python-asyncssh | CVE-2026-45309   | https://security-tracker.debian.org/tracker/CVE-2026-45309  
                 python-django | CVE-2026-15920   | https://security-tracker.debian.org/tracker/CVE-2026-15920  
                 python-django | CVE-2026-48588   | https://security-tracker.debian.org/tracker/CVE-2026-48588  
                 python-django | CVE-2026-15830   | https://security-tracker.debian.org/tracker/CVE-2026-15830  
                 python-django | CVE-2026-15307   | https://security-tracker.debian.org/tracker/CVE-2026-15307  
                 python-django | CVE-2026-15337   | https://security-tracker.debian.org/tracker/CVE-2026-15337  
                 python-django | CVE-2026-53878   | https://security-tracker.debian.org/tracker/CVE-2026-53878  
                 python-django | CVE-2026-53877   | https://security-tracker.debian.org/tracker/CVE-2026-53877  
                 python-dotenv | CVE-2026-28684   | https://security-tracker.debian.org/tracker/CVE-2026-28684  
                  python-ecdsa | CVE-2026-33936   | https://security-tracker.debian.org/tracker/CVE-2026-33936  
               python-httplib2 | CVE-2026-59939   | https://security-tracker.debian.org/tracker/CVE-2026-59939  
                   python-lxml | CVE-2026-41066   | https://security-tracker.debian.org/tracker/CVE-2026-41066  
              python-multipart | CVE-2026-53538   | https://security-tracker.debian.org/tracker/CVE-2026-53538  
              python-multipart | CVE-2026-53540   | https://security-tracker.debian.org/tracker/CVE-2026-53540  
              python-multipart | CVE-2026-53539   | https://security-tracker.debian.org/tracker/CVE-2026-53539  
              python-multipart | CVE-2026-53537   | https://security-tracker.debian.org/tracker/CVE-2026-53537  
              python-multipart | CVE-2026-40347   | https://security-tracker.debian.org/tracker/CVE-2026-40347  
                 python-pillow | CVE-2026-54059   | https://security-tracker.debian.org/tracker/CVE-2026-54059  
                 python-pillow | CVE-2026-54058   | https://security-tracker.debian.org/tracker/CVE-2026-54058  
                 python-pillow | CVE-2026-54060   | https://security-tracker.debian.org/tracker/CVE-2026-54060  
                 python-pillow | CVE-2026-55379   | https://security-tracker.debian.org/tracker/CVE-2026-55379  
                 python-pillow | CVE-2026-55380   | https://security-tracker.debian.org/tracker/CVE-2026-55380  
                 python-pillow | CVE-2026-112390  | https://security-tracker.debian.org/tracker/CVE-2026-112390 
                 python-pillow | CVE-2026-112391  | https://security-tracker.debian.org/tracker/CVE-2026-112391 
                 python-pillow | CVE-2026-59199   | https://security-tracker.debian.org/tracker/CVE-2026-59199  
                 python-pillow | CVE-2026-59198   | https://security-tracker.debian.org/tracker/CVE-2026-59198  
                 python-pillow | CVE-2026-59197   | https://security-tracker.debian.org/tracker/CVE-2026-59197  
                 python-pillow | CVE-2026-40192   | https://security-tracker.debian.org/tracker/CVE-2026-40192  
                 python-pillow | CVE-2026-55798   | https://security-tracker.debian.org/tracker/CVE-2026-55798  
                 python-pillow | CVE-2026-42311   | https://security-tracker.debian.org/tracker/CVE-2026-42311  
                 python-pillow | CVE-2026-42310   | https://security-tracker.debian.org/tracker/CVE-2026-42310  
                 python-pillow | CVE-2026-42309   | https://security-tracker.debian.org/tracker/CVE-2026-42309  
                 python-pillow | CVE-2026-42308   | https://security-tracker.debian.org/tracker/CVE-2026-42308  
                 python-pillow | CVE-2026-25990   | https://security-tracker.debian.org/tracker/CVE-2026-25990  
                 python-pillow | CVE-2026-59200   | https://security-tracker.debian.org/tracker/CVE-2026-59200  
                 python-pillow | CVE-2026-59203   | https://security-tracker.debian.org/tracker/CVE-2026-59203  
                 python-pillow | CVE-2026-59205   | https://security-tracker.debian.org/tracker/CVE-2026-59205  
                 python-pillow | CVE-2026-59204   | https://security-tracker.debian.org/tracker/CVE-2026-59204  
                    python-pip | CVE-2026-8643    | https://security-tracker.debian.org/tracker/CVE-2026-8643   
                    python-pip | CVE-2026-13346   | https://security-tracker.debian.org/tracker/CVE-2026-13346  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                  python-pyjwt | CVE-2026-102275  | https://security-tracker.debian.org/tracker/CVE-2026-102275 
                  python-pyjwt | CVE-2026-102271  | https://security-tracker.debian.org/tracker/CVE-2026-102271 
                  python-pyjwt | CVE-2026-102274  | https://security-tracker.debian.org/tracker/CVE-2026-102274 
                  python-pyjwt | CVE-2026-102269  | https://security-tracker.debian.org/tracker/CVE-2026-102269 
                  python-pyjwt | CVE-2026-102268  | https://security-tracker.debian.org/tracker/CVE-2026-102268 
                  python-pyjwt | CVE-2026-102267  | https://security-tracker.debian.org/tracker/CVE-2026-102267 
                  python-pyjwt | CVE-2026-102270  | https://security-tracker.debian.org/tracker/CVE-2026-102270 
                  python-pyjwt | CVE-2026-48522   | https://security-tracker.debian.org/tracker/CVE-2026-48522  
                  python-pyjwt | CVE-2026-48524   | https://security-tracker.debian.org/tracker/CVE-2026-48524  
                  python-pyjwt | CVE-2026-48526   | https://security-tracker.debian.org/tracker/CVE-2026-48526  
                  python-pyjwt | CVE-2026-48525   | https://security-tracker.debian.org/tracker/CVE-2026-48525  
                  python-pyjwt | CVE-2026-48523   | https://security-tracker.debian.org/tracker/CVE-2026-48523  
                  python-pyjwt | CVE-2026-103001  | https://security-tracker.debian.org/tracker/CVE-2026-103001 
                  python-pyjwt | CVE-2026-101917  | https://security-tracker.debian.org/tracker/CVE-2026-101917 
                  python-pyjwt | CVE-2026-101918  | https://security-tracker.debian.org/tracker/CVE-2026-101918 
             python-setuptools | CVE-2026-59890   | https://security-tracker.debian.org/tracker/CVE-2026-59890  
              python-starlette | CVE-2026-48818   | https://security-tracker.debian.org/tracker/CVE-2026-48818  
              python-starlette | CVE-2026-48817   | https://security-tracker.debian.org/tracker/CVE-2026-48817  
              python-starlette | CVE-2026-54282   | https://security-tracker.debian.org/tracker/CVE-2026-54282  
              python-starlette | CVE-2026-54283   | https://security-tracker.debian.org/tracker/CVE-2026-54283  
              python-starlette | CVE-2026-48710   | https://security-tracker.debian.org/tracker/CVE-2026-48710  
                python-twisted | CVE-2026-42304   | https://security-tracker.debian.org/tracker/CVE-2026-42304  
                python-urllib3 | CVE-2026-97688   | https://security-tracker.debian.org/tracker/CVE-2026-97688  
                python-urllib3 | CVE-2026-97689   | https://security-tracker.debian.org/tracker/CVE-2026-97689  
                python-urllib3 | CVE-2026-97687   | https://security-tracker.debian.org/tracker/CVE-2026-97687  
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                       qt5base | CVE-2023-32763   | https://security-tracker.debian.org/tracker/CVE-2023-32763  
                       qt5base | CVE-2023-38197   | https://security-tracker.debian.org/tracker/CVE-2023-38197  
                       qt5base | CVE-2023-51714   | https://security-tracker.debian.org/tracker/CVE-2023-51714  
                       qt5base | CVE-2023-37369   | https://security-tracker.debian.org/tracker/CVE-2023-37369  
                       qt5base | CVE-2023-34410   | https://security-tracker.debian.org/tracker/CVE-2023-34410  
                       qt5base | CVE-2023-43114   | https://security-tracker.debian.org/tracker/CVE-2023-43114  
                       qt5base | CVE-2024-25580   | https://security-tracker.debian.org/tracker/CVE-2024-25580  
                       qt5base | CVE-2024-39936   | https://security-tracker.debian.org/tracker/CVE-2024-39936  
                       qt5base | CVE-2024-36048   | https://security-tracker.debian.org/tracker/CVE-2024-36048  
                       qt5base | CVE-2025-30348   | https://security-tracker.debian.org/tracker/CVE-2025-30348  
                        ranger | CVE-2024-55532   | https://security-tracker.debian.org/tracker/CVE-2024-55532  
                        ranger | CVE-2025-59059   | https://security-tracker.debian.org/tracker/CVE-2025-59059  
                        ranger | CVE-2025-59060   | https://security-tracker.debian.org/tracker/CVE-2025-59060  
                        ranger | CVE-2026-65948   | https://security-tracker.debian.org/tracker/CVE-2026-65948  
                        ranger | CVE-2026-65945   | https://security-tracker.debian.org/tracker/CVE-2026-65945  
                        ranger | CVE-2026-65942   | https://security-tracker.debian.org/tracker/CVE-2026-65942  
                        ranger | CVE-2026-28672   | https://security-tracker.debian.org/tracker/CVE-2026-28672  
                        ranger | CVE-2026-42537   | https://security-tracker.debian.org/tracker/CVE-2026-42537  
                        ranger | CVE-2026-40920   | https://security-tracker.debian.org/tracker/CVE-2026-40920  
                        ranger | CVE-2026-55799   | https://security-tracker.debian.org/tracker/CVE-2026-55799  
                        ranger | CVE-2026-55814   | https://security-tracker.debian.org/tracker/CVE-2026-55814  
                        ranger | CVE-2026-44416   | https://security-tracker.debian.org/tracker/CVE-2026-44416  
                        ranger | CVE-2026-32227   | https://security-tracker.debian.org/tracker/CVE-2026-32227  
                          runc | CVE-2026-41579   | https://security-tracker.debian.org/tracker/CVE-2026-41579  
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2026-2340    | https://security-tracker.debian.org/tracker/CVE-2026-2340   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                    sdl2_image | CVE-2026-35444   | https://security-tracker.debian.org/tracker/CVE-2026-35444  
                     sdl_image | CVE-2026-35444   | https://security-tracker.debian.org/tracker/CVE-2026-35444  
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                    strongswan | CVE-2026-78132   | https://security-tracker.debian.org/tracker/CVE-2026-78132  
                    strongswan | CVE-2026-78126   | https://security-tracker.debian.org/tracker/CVE-2026-78126  
                    strongswan | CVE-2026-78131   | https://security-tracker.debian.org/tracker/CVE-2026-78131  
                    strongswan | CVE-2026-78133   | https://security-tracker.debian.org/tracker/CVE-2026-78133  
                    strongswan | CVE-2026-78123   | https://security-tracker.debian.org/tracker/CVE-2026-78123  
                    strongswan | CVE-2026-78135   | https://security-tracker.debian.org/tracker/CVE-2026-78135  
                    strongswan | CVE-2026-78134   | https://security-tracker.debian.org/tracker/CVE-2026-78134  
                    strongswan | CVE-2026-78124   | https://security-tracker.debian.org/tracker/CVE-2026-78124  
                    strongswan | CVE-2026-78127   | https://security-tracker.debian.org/tracker/CVE-2026-78127  
                    strongswan | CVE-2026-78130   | https://security-tracker.debian.org/tracker/CVE-2026-78130  
                    strongswan | CVE-2026-78129   | https://security-tracker.debian.org/tracker/CVE-2026-78129  
                      suricata | CVE-2026-57225   | https://security-tracker.debian.org/tracker/CVE-2026-57225  
                      suricata | CVE-2026-57223   | https://security-tracker.debian.org/tracker/CVE-2026-57223  
                      suricata | CVE-2026-57222   | https://security-tracker.debian.org/tracker/CVE-2026-57222  
                      suricata | CVE-2026-57224   | https://security-tracker.debian.org/tracker/CVE-2026-57224  
                      suricata | CVE-2026-57226   | https://security-tracker.debian.org/tracker/CVE-2026-57226  
                      suricata | CVE-2026-57229   | https://security-tracker.debian.org/tracker/CVE-2026-57229  
                      suricata | CVE-2026-57227   | https://security-tracker.debian.org/tracker/CVE-2026-57227  
                      suricata | CVE-2026-94083   | https://security-tracker.debian.org/tracker/CVE-2026-94083  
                      suricata | CVE-2026-94084   | https://security-tracker.debian.org/tracker/CVE-2026-94084  
                      suricata | CVE-2026-46387   | https://security-tracker.debian.org/tracker/CVE-2026-46387  
                      suricata | CVE-2026-46352   | https://security-tracker.debian.org/tracker/CVE-2026-46352  
                      suricata | CVE-2026-63446   | https://security-tracker.debian.org/tracker/CVE-2026-63446  
                      suricata | CVE-2026-63449   | https://security-tracker.debian.org/tracker/CVE-2026-63449  
                      suricata | CVE-2026-63450   | https://security-tracker.debian.org/tracker/CVE-2026-63450  
                      suricata | CVE-2026-63451   | https://security-tracker.debian.org/tracker/CVE-2026-63451  
                      suricata | CVE-2026-63448   | https://security-tracker.debian.org/tracker/CVE-2026-63448  
                      suricata | CVE-2026-63452   | https://security-tracker.debian.org/tracker/CVE-2026-63452  
                      suricata | CVE-2026-45759   | https://security-tracker.debian.org/tracker/CVE-2026-45759  
                      suricata | CVE-2026-45764   | https://security-tracker.debian.org/tracker/CVE-2026-45764  
                      suricata | CVE-2026-45751   | https://security-tracker.debian.org/tracker/CVE-2026-45751  
                      suricata | CVE-2026-45766   | https://security-tracker.debian.org/tracker/CVE-2026-45766  
                      suricata | CVE-2026-45752   | https://security-tracker.debian.org/tracker/CVE-2026-45752  
                      suricata | CVE-2026-45763   | https://security-tracker.debian.org/tracker/CVE-2026-45763  
                      suricata | CVE-2026-45762   | https://security-tracker.debian.org/tracker/CVE-2026-45762  
                      suricata | CVE-2026-45767   | https://security-tracker.debian.org/tracker/CVE-2026-45767  
                      suricata | CVE-2026-45761   | https://security-tracker.debian.org/tracker/CVE-2026-45761  
                      suricata | CVE-2026-45770   | https://security-tracker.debian.org/tracker/CVE-2026-45770  
                      suricata | CVE-2026-45768   | https://security-tracker.debian.org/tracker/CVE-2026-45768  
                      suricata | CVE-2026-45765   | https://security-tracker.debian.org/tracker/CVE-2026-45765  
                      suricata | CVE-2026-45769   | https://security-tracker.debian.org/tracker/CVE-2026-45769  
                      suricata | CVE-2026-71855   | https://security-tracker.debian.org/tracker/CVE-2026-71855  
                      suricata | CVE-2026-71418   | https://security-tracker.debian.org/tracker/CVE-2026-71418  
                      swupdate | CVE-2026-28525   | https://security-tracker.debian.org/tracker/CVE-2026-28525  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                       systemd | CVE-2026-40223   | https://security-tracker.debian.org/tracker/CVE-2026-40223  
                           tar | CVE-2026-18508   | https://security-tracker.debian.org/tracker/CVE-2026-18508  
                           tar | CVE-2026-18477   | https://security-tracker.debian.org/tracker/CVE-2026-18477  
                        thrift | CVE-2026-41608   | https://security-tracker.debian.org/tracker/CVE-2026-41608  
                        thrift | CVE-2026-58023   | https://security-tracker.debian.org/tracker/CVE-2026-58023  
                        thrift | CVE-2026-49158   | https://security-tracker.debian.org/tracker/CVE-2026-49158  
                        thrift | CVE-2026-48586   | https://security-tracker.debian.org/tracker/CVE-2026-48586  
                        thrift | CVE-2026-45112   | https://security-tracker.debian.org/tracker/CVE-2026-45112  
                        thrift | CVE-2026-43871   | https://security-tracker.debian.org/tracker/CVE-2026-43871  
                        thrift | CVE-2026-55968   | https://security-tracker.debian.org/tracker/CVE-2026-55968  
                        thrift | CVE-2026-55970   | https://security-tracker.debian.org/tracker/CVE-2026-55970  
                        thrift | CVE-2026-55969   | https://security-tracker.debian.org/tracker/CVE-2026-55969  
                        thrift | CVE-2026-55971   | https://security-tracker.debian.org/tracker/CVE-2026-55971  
                        thrift | CVE-2026-58389   | https://security-tracker.debian.org/tracker/CVE-2026-58389  
                        thrift | CVE-2026-66053   | https://security-tracker.debian.org/tracker/CVE-2026-66053  
                        thrift | CVE-2026-58662   | https://security-tracker.debian.org/tracker/CVE-2026-58662  
                        thrift | CVE-2026-48145   | https://security-tracker.debian.org/tracker/CVE-2026-48145  
                        thrift | CVE-2026-48144   | https://security-tracker.debian.org/tracker/CVE-2026-48144  
                   timescaledb | CVE-2026-29089   | https://security-tracker.debian.org/tracker/CVE-2026-29089  
                   timescaledb | CVE-2026-70633   | https://security-tracker.debian.org/tracker/CVE-2026-70633  
                   timescaledb | CVE-2026-70635   | https://security-tracker.debian.org/tracker/CVE-2026-70635  
                   timescaledb | CVE-2026-70634   | https://security-tracker.debian.org/tracker/CVE-2026-70634  
                     tinyproxy | CVE-2026-31842   | https://security-tracker.debian.org/tracker/CVE-2026-31842  
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                       unbound | CVE-2026-81634   | https://security-tracker.debian.org/tracker/CVE-2026-81634  
                       unbound | CVE-2026-81642   | https://security-tracker.debian.org/tracker/CVE-2026-81642  
                       unbound | CVE-2026-80225   | https://security-tracker.debian.org/tracker/CVE-2026-80225  
                       unbound | CVE-2026-78227   | https://security-tracker.debian.org/tracker/CVE-2026-78227  
                       unbound | CVE-2026-82720   | https://security-tracker.debian.org/tracker/CVE-2026-82720  
                       unbound | CVE-2026-82717   | https://security-tracker.debian.org/tracker/CVE-2026-82717  
                       unbound | CVE-2026-77955   | https://security-tracker.debian.org/tracker/CVE-2026-77955  
                       unbound | CVE-2026-85501   | https://security-tracker.debian.org/tracker/CVE-2026-85501  
                       unbound | CVE-2026-77860   | https://security-tracker.debian.org/tracker/CVE-2026-77860  
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                           upx | CVE-2023-23456   | https://security-tracker.debian.org/tracker/CVE-2023-23456  
                           upx | CVE-2023-23457   | https://security-tracker.debian.org/tracker/CVE-2023-23457  
                           upx | CVE-2024-3209    | https://security-tracker.debian.org/tracker/CVE-2024-3209   
                           upx | CVE-2025-2849    | https://security-tracker.debian.org/tracker/CVE-2025-2849   
                    util-linux | CVE-2026-13595   | https://security-tracker.debian.org/tracker/CVE-2026-13595  
               util-linux-libs | CVE-2026-13595   | https://security-tracker.debian.org/tracker/CVE-2026-13595  
                          wget | CVE-2026-58472   | https://security-tracker.debian.org/tracker/CVE-2026-58472  
                     wireshark | CVE-2026-96421   | https://security-tracker.debian.org/tracker/CVE-2026-96421  
                     wireshark | CVE-2026-96422   | https://security-tracker.debian.org/tracker/CVE-2026-96422  
                     wireshark | CVE-2026-96415   | https://security-tracker.debian.org/tracker/CVE-2026-96415  
                     wireshark | CVE-2026-96416   | https://security-tracker.debian.org/tracker/CVE-2026-96416  
                     wireshark | CVE-2026-96418   | https://security-tracker.debian.org/tracker/CVE-2026-96418  
                     wireshark | CVE-2026-96419   | https://security-tracker.debian.org/tracker/CVE-2026-96419  
                     wireshark | CVE-2026-96423   | https://security-tracker.debian.org/tracker/CVE-2026-96423  
                     wireshark | CVE-2026-96420   | https://security-tracker.debian.org/tracker/CVE-2026-96420  
                     wireshark | CVE-2026-96417   | https://security-tracker.debian.org/tracker/CVE-2026-96417  
                     wireshark | CVE-2026-95392   | https://security-tracker.debian.org/tracker/CVE-2026-95392  
                     wireshark | CVE-2026-95395   | https://security-tracker.debian.org/tracker/CVE-2026-95395  
                     wireshark | CVE-2026-95389   | https://security-tracker.debian.org/tracker/CVE-2026-95389  
                     wireshark | CVE-2026-95393   | https://security-tracker.debian.org/tracker/CVE-2026-95393  
                     wireshark | CVE-2026-95388   | https://security-tracker.debian.org/tracker/CVE-2026-95388  
                     wireshark | CVE-2026-95387   | https://security-tracker.debian.org/tracker/CVE-2026-95387  
                     wireshark | CVE-2026-95394   | https://security-tracker.debian.org/tracker/CVE-2026-95394  
                       wolfssl | CVE-2026-89134   | https://security-tracker.debian.org/tracker/CVE-2026-89134  
                       wolfssl | CVE-2026-89102   | https://security-tracker.debian.org/tracker/CVE-2026-89102  
                       wolfssl | CVE-2026-89133   | https://security-tracker.debian.org/tracker/CVE-2026-89133  
                       wolfssl | CVE-2026-89135   | https://security-tracker.debian.org/tracker/CVE-2026-89135  
                       wolfssl | CVE-2026-15442   | https://security-tracker.debian.org/tracker/CVE-2026-15442  
                       wolfssl | CVE-2026-94418   | https://security-tracker.debian.org/tracker/CVE-2026-94418  
                       wolfssl | CVE-2026-94417   | https://security-tracker.debian.org/tracker/CVE-2026-94417  
                       wolfssl | CVE-2026-94419   | https://security-tracker.debian.org/tracker/CVE-2026-94419  
                       wolfssl | CVE-2026-93302   | https://security-tracker.debian.org/tracker/CVE-2026-93302  
                       wolfssl | CVE-2026-93304   | https://security-tracker.debian.org/tracker/CVE-2026-93304  
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2023-46839   | https://security-tracker.debian.org/tracker/CVE-2023-46839  
                           xen | CVE-2023-46842   | https://security-tracker.debian.org/tracker/CVE-2023-46842  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                           xen | CVE-2023-46840   | https://security-tracker.debian.org/tracker/CVE-2023-46840  
                           xen | CVE-2023-46841   | https://security-tracker.debian.org/tracker/CVE-2023-46841  
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2024-31143   | https://security-tracker.debian.org/tracker/CVE-2024-31143  
                           xen | CVE-2024-31145   | https://security-tracker.debian.org/tracker/CVE-2024-31145  
                           xen | CVE-2024-45817   | https://security-tracker.debian.org/tracker/CVE-2024-45817  
                           xen | CVE-2024-45819   | https://security-tracker.debian.org/tracker/CVE-2024-45819  
                           xen | CVE-2024-45818   | https://security-tracker.debian.org/tracker/CVE-2024-45818  
                           xen | CVE-2025-27465   | https://security-tracker.debian.org/tracker/CVE-2025-27465  
                           xen | CVE-2025-58147   | https://security-tracker.debian.org/tracker/CVE-2025-58147  
                           xen | CVE-2025-58148   | https://security-tracker.debian.org/tracker/CVE-2025-58148  
                           xen | CVE-2025-58149   | https://security-tracker.debian.org/tracker/CVE-2025-58149  
                           xen | CVE-2025-1713    | https://security-tracker.debian.org/tracker/CVE-2025-1713   
                           xen | CVE-2026-23555   | https://security-tracker.debian.org/tracker/CVE-2026-23555  
                           xen | CVE-2026-23554   | https://security-tracker.debian.org/tracker/CVE-2026-23554  
                           xen | CVE-2026-23558   | https://security-tracker.debian.org/tracker/CVE-2026-23558  
                           xen | CVE-2026-23553   | https://security-tracker.debian.org/tracker/CVE-2026-23553  
                           xen | CVE-2026-23557   | https://security-tracker.debian.org/tracker/CVE-2026-23557  
           xserver_xorg-server | CVE-2023-5574    | https://security-tracker.debian.org/tracker/CVE-2023-5574   
           xserver_xorg-server | CVE-2026-56000   | https://security-tracker.debian.org/tracker/CVE-2026-56000  
           xserver_xorg-server | CVE-2026-55999   | https://security-tracker.debian.org/tracker/CVE-2026-55999  
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2023-51258   | https://security-tracker.debian.org/tracker/CVE-2023-51258  
                          yasm | CVE-2023-31973   | https://security-tracker.debian.org/tracker/CVE-2023-31973  
                          yasm | CVE-2023-31974   | https://security-tracker.debian.org/tracker/CVE-2023-31974  
                          yasm | CVE-2023-31972   | https://security-tracker.debian.org/tracker/CVE-2023-31972  
                        zabbix | CVE-2026-23920   | https://security-tracker.debian.org/tracker/CVE-2026-23920  
                        zabbix | CVE-2026-23921   | https://security-tracker.debian.org/tracker/CVE-2026-23921  

CVEs for the '2025.02.x' branch
-------------------------------

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                         asn1c | CVE-2020-23911   | https://security-tracker.debian.org/tracker/CVE-2020-23911  
                         asn1c | CVE-2020-23910   | https://security-tracker.debian.org/tracker/CVE-2020-23910  
                        assimp | CVE-2025-11275   | https://security-tracker.debian.org/tracker/CVE-2025-11275  
                        assimp | CVE-2025-11277   | https://security-tracker.debian.org/tracker/CVE-2025-11277  
                        assimp | CVE-2025-11274   | https://security-tracker.debian.org/tracker/CVE-2025-11274  
                        assimp | CVE-2025-15538   | https://security-tracker.debian.org/tracker/CVE-2025-15538  
                         avahi | CVE-2025-59529   | https://security-tracker.debian.org/tracker/CVE-2025-59529  
                    berkeleydb | CVE-2017-3610    | https://security-tracker.debian.org/tracker/CVE-2017-3610   
                    berkeleydb | CVE-2017-3616    | https://security-tracker.debian.org/tracker/CVE-2017-3616   
                    berkeleydb | CVE-2017-3608    | https://security-tracker.debian.org/tracker/CVE-2017-3608   
                    berkeleydb | CVE-2017-3604    | https://security-tracker.debian.org/tracker/CVE-2017-3604   
                    berkeleydb | CVE-2017-3614    | https://security-tracker.debian.org/tracker/CVE-2017-3614   
                    berkeleydb | CVE-2017-3617    | https://security-tracker.debian.org/tracker/CVE-2017-3617   
                    berkeleydb | CVE-2017-3606    | https://security-tracker.debian.org/tracker/CVE-2017-3606   
                    berkeleydb | CVE-2017-3607    | https://security-tracker.debian.org/tracker/CVE-2017-3607   
                    berkeleydb | CVE-2017-3609    | https://security-tracker.debian.org/tracker/CVE-2017-3609   
                    berkeleydb | CVE-2017-3611    | https://security-tracker.debian.org/tracker/CVE-2017-3611   
                    berkeleydb | CVE-2017-3613    | https://security-tracker.debian.org/tracker/CVE-2017-3613   
                    berkeleydb | CVE-2017-3605    | https://security-tracker.debian.org/tracker/CVE-2017-3605   
                    berkeleydb | CVE-2017-3612    | https://security-tracker.debian.org/tracker/CVE-2017-3612   
                    berkeleydb | CVE-2017-3615    | https://security-tracker.debian.org/tracker/CVE-2017-3615   
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                      binutils | CVE-2025-5245    | https://security-tracker.debian.org/tracker/CVE-2025-5245   
                      binutils | CVE-2025-5244    | https://security-tracker.debian.org/tracker/CVE-2025-5244   
                      binutils | CVE-2025-0840    | https://security-tracker.debian.org/tracker/CVE-2025-0840   
                      binutils | CVE-2025-69649   | https://security-tracker.debian.org/tracker/CVE-2025-69649  
                      binutils | CVE-2025-69647   | https://security-tracker.debian.org/tracker/CVE-2025-69647  
                      binutils | CVE-2025-69648   | https://security-tracker.debian.org/tracker/CVE-2025-69648  
                      binutils | CVE-2025-69651   | https://security-tracker.debian.org/tracker/CVE-2025-69651  
                      binutils | CVE-2025-69652   | https://security-tracker.debian.org/tracker/CVE-2025-69652  
                      binutils | CVE-2025-69650   | https://security-tracker.debian.org/tracker/CVE-2025-69650  
                      binutils | CVE-2025-69644   | https://security-tracker.debian.org/tracker/CVE-2025-69644  
                      binutils | CVE-2026-6846    | https://security-tracker.debian.org/tracker/CVE-2026-6846   
           binutils-bare-metal | CVE-2025-8225    | https://security-tracker.debian.org/tracker/CVE-2025-8225   
           binutils-bare-metal | CVE-2025-8224    | https://security-tracker.debian.org/tracker/CVE-2025-8224   
           binutils-bare-metal | CVE-2025-5245    | https://security-tracker.debian.org/tracker/CVE-2025-5245   
           binutils-bare-metal | CVE-2025-5244    | https://security-tracker.debian.org/tracker/CVE-2025-5244   
           binutils-bare-metal | CVE-2025-1153    | https://security-tracker.debian.org/tracker/CVE-2025-1153   
           binutils-bare-metal | CVE-2025-3198    | https://security-tracker.debian.org/tracker/CVE-2025-3198   
           binutils-bare-metal | CVE-2025-69646   | https://security-tracker.debian.org/tracker/CVE-2025-69646  
           binutils-bare-metal | CVE-2025-69649   | https://security-tracker.debian.org/tracker/CVE-2025-69649  
           binutils-bare-metal | CVE-2025-69647   | https://security-tracker.debian.org/tracker/CVE-2025-69647  
           binutils-bare-metal | CVE-2025-69645   | https://security-tracker.debian.org/tracker/CVE-2025-69645  
           binutils-bare-metal | CVE-2025-69648   | https://security-tracker.debian.org/tracker/CVE-2025-69648  
           binutils-bare-metal | CVE-2025-69651   | https://security-tracker.debian.org/tracker/CVE-2025-69651  
           binutils-bare-metal | CVE-2025-69652   | https://security-tracker.debian.org/tracker/CVE-2025-69652  
           binutils-bare-metal | CVE-2025-69650   | https://security-tracker.debian.org/tracker/CVE-2025-69650  
           binutils-bare-metal | CVE-2025-69644   | https://security-tracker.debian.org/tracker/CVE-2025-69644  
           binutils-bare-metal | CVE-2026-6846    | https://security-tracker.debian.org/tracker/CVE-2026-6846   
                         bison | CVE-2026-56390   | https://security-tracker.debian.org/tracker/CVE-2026-56390  
                         bison | CVE-2026-56389   | https://security-tracker.debian.org/tracker/CVE-2026-56389  
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                       bitcoin | CVE-2025-54605   | https://security-tracker.debian.org/tracker/CVE-2025-54605  
                       bitcoin | CVE-2025-54604   | https://security-tracker.debian.org/tracker/CVE-2025-54604  
                         botan | CVE-2026-44378   | https://security-tracker.debian.org/tracker/CVE-2026-44378  
                      bpftrace | CVE-2024-2313    | https://security-tracker.debian.org/tracker/CVE-2024-2313   
                        bwm-ng | CVE-2023-26129   | https://security-tracker.debian.org/tracker/CVE-2023-26129  
                      civetweb | CVE-2026-5789    | https://security-tracker.debian.org/tracker/CVE-2026-5789   
                         cjson | CVE-2026-67216   | https://security-tracker.debian.org/tracker/CVE-2026-67216  
                         cjson | CVE-2026-67217   | https://security-tracker.debian.org/tracker/CVE-2026-67217  
                         cjson | CVE-2026-67215   | https://security-tracker.debian.org/tracker/CVE-2026-67215  
                         cjson | CVE-2026-16554   | https://security-tracker.debian.org/tracker/CVE-2026-16554  
                      composer | CVE-2023-43655   | https://security-tracker.debian.org/tracker/CVE-2023-43655  
                      composer | CVE-2024-24821   | https://security-tracker.debian.org/tracker/CVE-2024-24821  
                      composer | CVE-2025-67746   | https://security-tracker.debian.org/tracker/CVE-2025-67746  
                      composer | CVE-2026-40261   | https://security-tracker.debian.org/tracker/CVE-2026-40261  
                      composer | CVE-2026-40176   | https://security-tracker.debian.org/tracker/CVE-2026-40176  
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                     coreutils | CVE-2026-56391   | https://security-tracker.debian.org/tracker/CVE-2026-56391  
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
               cryptodev-linux | CVE-2026-28529   | https://security-tracker.debian.org/tracker/CVE-2026-28529  
                      cryptopp | CVE-2023-50981   | https://security-tracker.debian.org/tracker/CVE-2023-50981  
                      cryptopp | CVE-2023-50979   | https://security-tracker.debian.org/tracker/CVE-2023-50979  
                      cryptopp | CVE-2023-50980   | https://security-tracker.debian.org/tracker/CVE-2023-50980  
                          cups | CVE-2026-55480   | https://security-tracker.debian.org/tracker/CVE-2026-55480  
                          cups | CVE-2026-55453   | https://security-tracker.debian.org/tracker/CVE-2026-55453  
                          cups | CVE-2026-55467   | https://security-tracker.debian.org/tracker/CVE-2026-55467  
                          cups | CVE-2026-61702   | https://security-tracker.debian.org/tracker/CVE-2026-61702  
                          cups | CVE-2026-107885  | https://security-tracker.debian.org/tracker/CVE-2026-107885 
                          cups | CVE-2026-107890  | https://security-tracker.debian.org/tracker/CVE-2026-107890 
                          cups | CVE-2026-107886  | https://security-tracker.debian.org/tracker/CVE-2026-107886 
                          cups | CVE-2026-107888  | https://security-tracker.debian.org/tracker/CVE-2026-107888 
                        dhcpcd | CVE-2026-56113   | https://security-tracker.debian.org/tracker/CVE-2026-56113  
                        dhcpcd | CVE-2026-56114   | https://security-tracker.debian.org/tracker/CVE-2026-56114  
                        dhcpcd | CVE-2026-56116   | https://security-tracker.debian.org/tracker/CVE-2026-56116  
                        dhcpcd | CVE-2026-56117   | https://security-tracker.debian.org/tracker/CVE-2026-56117  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-33183   | https://security-tracker.debian.org/tracker/CVE-2021-33183  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                        docker | CVE-2022-25365   | https://security-tracker.debian.org/tracker/CVE-2022-25365  
                 docker-engine | CVE-2026-41568   | https://security-tracker.debian.org/tracker/CVE-2026-41568  
                 docker-engine | CVE-2026-42306   | https://security-tracker.debian.org/tracker/CVE-2026-42306  
                      domoticz | CVE-2026-1001    | https://security-tracker.debian.org/tracker/CVE-2026-1001   
                       dovecot | CVE-2025-59032   | https://security-tracker.debian.org/tracker/CVE-2025-59032  
                       dovecot | CVE-2025-59028   | https://security-tracker.debian.org/tracker/CVE-2025-59028  
                       dovecot | CVE-2025-59031   | https://security-tracker.debian.org/tracker/CVE-2025-59031  
                       dovecot | CVE-2026-33603   | https://security-tracker.debian.org/tracker/CVE-2026-33603  
                       dovecot | CVE-2026-0394    | https://security-tracker.debian.org/tracker/CVE-2026-0394   
                       dovecot | CVE-2026-40016   | https://security-tracker.debian.org/tracker/CVE-2026-40016  
                       dovecot | CVE-2026-40020   | https://security-tracker.debian.org/tracker/CVE-2026-40020  
                       dovecot | CVE-2026-42006   | https://security-tracker.debian.org/tracker/CVE-2026-42006  
                       dovecot | CVE-2026-24031   | https://security-tracker.debian.org/tracker/CVE-2026-24031  
                       dovecot | CVE-2026-27857   | https://security-tracker.debian.org/tracker/CVE-2026-27857  
                       dovecot | CVE-2026-27855   | https://security-tracker.debian.org/tracker/CVE-2026-27855  
                       dovecot | CVE-2026-27858   | https://security-tracker.debian.org/tracker/CVE-2026-27858  
                       dovecot | CVE-2026-27856   | https://security-tracker.debian.org/tracker/CVE-2026-27856  
                       dovecot | CVE-2026-27860   | https://security-tracker.debian.org/tracker/CVE-2026-27860  
                       dovecot | CVE-2026-27851   | https://security-tracker.debian.org/tracker/CVE-2026-27851  
                       dovecot | CVE-2026-27859   | https://security-tracker.debian.org/tracker/CVE-2026-27859  
                      easy-rsa | CVE-2024-13454   | https://security-tracker.debian.org/tracker/CVE-2024-13454  
                          edk2 | CVE-2014-8271    | https://security-tracker.debian.org/tracker/CVE-2014-8271   
                         emlog | CVE-2021-44584   | https://security-tracker.debian.org/tracker/CVE-2021-44584  
                         emlog | CVE-2022-1526    | https://security-tracker.debian.org/tracker/CVE-2022-1526   
                         emlog | CVE-2022-3968    | https://security-tracker.debian.org/tracker/CVE-2022-3968   
                         emlog | CVE-2023-43291   | https://security-tracker.debian.org/tracker/CVE-2023-43291  
                         emlog | CVE-2024-12842   | https://security-tracker.debian.org/tracker/CVE-2024-12842  
                         emlog | CVE-2024-12846   | https://security-tracker.debian.org/tracker/CVE-2024-12846  
                         emlog | CVE-2024-12843   | https://security-tracker.debian.org/tracker/CVE-2024-12843  
                         emlog | CVE-2024-12841   | https://security-tracker.debian.org/tracker/CVE-2024-12841  
                         emlog | CVE-2024-12845   | https://security-tracker.debian.org/tracker/CVE-2024-12845  
                         emlog | CVE-2024-12844   | https://security-tracker.debian.org/tracker/CVE-2024-12844  
                         emlog | CVE-2024-46540   | https://security-tracker.debian.org/tracker/CVE-2024-46540  
                         emlog | CVE-2024-50655   | https://security-tracker.debian.org/tracker/CVE-2024-50655  
                         emlog | CVE-2025-53926   | https://security-tracker.debian.org/tracker/CVE-2025-53926  
                         emlog | CVE-2025-53923   | https://security-tracker.debian.org/tracker/CVE-2025-53923  
                         emlog | CVE-2025-53924   | https://security-tracker.debian.org/tracker/CVE-2025-53924  
                         emlog | CVE-2025-53925   | https://security-tracker.debian.org/tracker/CVE-2025-53925  
                         emlog | CVE-2025-61930   | https://security-tracker.debian.org/tracker/CVE-2025-61930  
                         emlog | CVE-2025-61769   | https://security-tracker.debian.org/tracker/CVE-2025-61769  
                         emlog | CVE-2025-47787   | https://security-tracker.debian.org/tracker/CVE-2025-47787  
                         emlog | CVE-2025-47785   | https://security-tracker.debian.org/tracker/CVE-2025-47785  
                         emlog | CVE-2025-47784   | https://security-tracker.debian.org/tracker/CVE-2025-47784  
                         emlog | CVE-2025-61597   | https://security-tracker.debian.org/tracker/CVE-2025-61597  
                         emlog | CVE-2025-61599   | https://security-tracker.debian.org/tracker/CVE-2025-61599  
                         emlog | CVE-2025-30372   | https://security-tracker.debian.org/tracker/CVE-2025-30372  
                         emlog | CVE-2025-9296    | https://security-tracker.debian.org/tracker/CVE-2025-9296   
                         emlog | CVE-2025-5886    | https://security-tracker.debian.org/tracker/CVE-2025-5886   
                         emlog | CVE-2026-22799   | https://security-tracker.debian.org/tracker/CVE-2026-22799  
                         emlog | CVE-2026-34229   | https://security-tracker.debian.org/tracker/CVE-2026-34229  
                         emlog | CVE-2026-34228   | https://security-tracker.debian.org/tracker/CVE-2026-34228  
                         emlog | CVE-2026-34607   | https://security-tracker.debian.org/tracker/CVE-2026-34607  
                         emlog | CVE-2026-21433   | https://security-tracker.debian.org/tracker/CVE-2026-21433  
                         emlog | CVE-2026-31954   | https://security-tracker.debian.org/tracker/CVE-2026-31954  
                         emlog | CVE-2026-34788   | https://security-tracker.debian.org/tracker/CVE-2026-34788  
                         emlog | CVE-2026-34787   | https://security-tracker.debian.org/tracker/CVE-2026-34787  
                        erlang | CVE-2026-48860   | https://security-tracker.debian.org/tracker/CVE-2026-48860  
                        erlang | CVE-2026-48856   | https://security-tracker.debian.org/tracker/CVE-2026-48856  
                        erlang | CVE-2026-48858   | https://security-tracker.debian.org/tracker/CVE-2026-48858  
                        erlang | CVE-2026-48855   | https://security-tracker.debian.org/tracker/CVE-2026-48855  
                        erlang | CVE-2026-42792   | https://security-tracker.debian.org/tracker/CVE-2026-42792  
                        erlang | CVE-2026-53422   | https://security-tracker.debian.org/tracker/CVE-2026-53422  
                        erlang | CVE-2026-55952   | https://security-tracker.debian.org/tracker/CVE-2026-55952  
                        erlang | CVE-2026-55950   | https://security-tracker.debian.org/tracker/CVE-2026-55950  
                        erlang | CVE-2026-55953   | https://security-tracker.debian.org/tracker/CVE-2026-55953  
                        erlang | CVE-2026-49760   | https://security-tracker.debian.org/tracker/CVE-2026-49760  
                        erlang | CVE-2026-49759   | https://security-tracker.debian.org/tracker/CVE-2026-49759  
                        erlang | CVE-2026-58227   | https://security-tracker.debian.org/tracker/CVE-2026-58227  
                        erlang | CVE-2026-55737   | https://security-tracker.debian.org/tracker/CVE-2026-55737  
                        erlang | CVE-2026-54887   | https://security-tracker.debian.org/tracker/CVE-2026-54887  
                        erlang | CVE-2026-54886   | https://security-tracker.debian.org/tracker/CVE-2026-54886  
                        erlang | CVE-2026-54891   | https://security-tracker.debian.org/tracker/CVE-2026-54891  
                        erlang | CVE-2026-59251   | https://security-tracker.debian.org/tracker/CVE-2026-59251  
                        ffmpeg | CVE-2023-50007   | https://security-tracker.debian.org/tracker/CVE-2023-50007  
                        ffmpeg | CVE-2023-50008   | https://security-tracker.debian.org/tracker/CVE-2023-50008  
                        ffmpeg | CVE-2023-50009   | https://security-tracker.debian.org/tracker/CVE-2023-50009  
                        ffmpeg | CVE-2023-50010   | https://security-tracker.debian.org/tracker/CVE-2023-50010  
                        ffmpeg | CVE-2023-49502   | https://security-tracker.debian.org/tracker/CVE-2023-49502  
                        ffmpeg | CVE-2024-31585   | https://security-tracker.debian.org/tracker/CVE-2024-31585  
                        ffmpeg | CVE-2024-31582   | https://security-tracker.debian.org/tracker/CVE-2024-31582  
                        ffmpeg | CVE-2024-31578   | https://security-tracker.debian.org/tracker/CVE-2024-31578  
                        ffmpeg | CVE-2025-12343   | https://security-tracker.debian.org/tracker/CVE-2025-12343  
                        ffmpeg | CVE-2025-1373    | https://security-tracker.debian.org/tracker/CVE-2025-1373   
                        ffmpeg | CVE-2025-10256   | https://security-tracker.debian.org/tracker/CVE-2025-10256  
                        ffmpeg | CVE-2025-1594    | https://security-tracker.debian.org/tracker/CVE-2025-1594   
                        ffmpeg | CVE-2025-25469   | https://security-tracker.debian.org/tracker/CVE-2025-25469  
                        ffmpeg | CVE-2025-25468   | https://security-tracker.debian.org/tracker/CVE-2025-25468  
                        ffmpeg | CVE-2026-64834   | https://security-tracker.debian.org/tracker/CVE-2026-64834  
                        ffmpeg | CVE-2026-64835   | https://security-tracker.debian.org/tracker/CVE-2026-64835  
                        ffmpeg | CVE-2026-64832   | https://security-tracker.debian.org/tracker/CVE-2026-64832  
                        ffmpeg | CVE-2026-64833   | https://security-tracker.debian.org/tracker/CVE-2026-64833  
                        ffmpeg | CVE-2026-64830   | https://security-tracker.debian.org/tracker/CVE-2026-64830  
                        ffmpeg | CVE-2026-30754   | https://security-tracker.debian.org/tracker/CVE-2026-30754  
                        ffmpeg | CVE-2026-96611   | https://security-tracker.debian.org/tracker/CVE-2026-96611  
                        ffmpeg | CVE-2026-65706   | https://security-tracker.debian.org/tracker/CVE-2026-65706  
                        ffmpeg | CVE-2026-65704   | https://security-tracker.debian.org/tracker/CVE-2026-65704  
                        ffmpeg | CVE-2026-65703   | https://security-tracker.debian.org/tracker/CVE-2026-65703  
                        ffmpeg | CVE-2026-65705   | https://security-tracker.debian.org/tracker/CVE-2026-65705  
                        ffmpeg | CVE-2026-52297   | https://security-tracker.debian.org/tracker/CVE-2026-52297  
                        ffmpeg | CVE-2026-52296   | https://security-tracker.debian.org/tracker/CVE-2026-52296  
                        ffmpeg | CVE-2026-52295   | https://security-tracker.debian.org/tracker/CVE-2026-52295  
                        ffmpeg | CVE-2026-66037   | https://security-tracker.debian.org/tracker/CVE-2026-66037  
                        ffmpeg | CVE-2026-66039   | https://security-tracker.debian.org/tracker/CVE-2026-66039  
                        ffmpeg | CVE-2026-66040   | https://security-tracker.debian.org/tracker/CVE-2026-66040  
                        ffmpeg | CVE-2026-66036   | https://security-tracker.debian.org/tracker/CVE-2026-66036  
                        ffmpeg | CVE-2026-66038   | https://security-tracker.debian.org/tracker/CVE-2026-66038  
                        ffmpeg | CVE-2026-40962   | https://security-tracker.debian.org/tracker/CVE-2026-40962  
                        ffmpeg | CVE-2026-107696  | https://security-tracker.debian.org/tracker/CVE-2026-107696 
                        ffmpeg | CVE-2026-107675  | https://security-tracker.debian.org/tracker/CVE-2026-107675 
                        ffmpeg | CVE-2026-107698  | https://security-tracker.debian.org/tracker/CVE-2026-107698 
                        ffmpeg | CVE-2026-107676  | https://security-tracker.debian.org/tracker/CVE-2026-107676 
                        ffmpeg | CVE-2026-107695  | https://security-tracker.debian.org/tracker/CVE-2026-107695 
                        ffmpeg | CVE-2026-107678  | https://security-tracker.debian.org/tracker/CVE-2026-107678 
                        ffmpeg | CVE-2026-107677  | https://security-tracker.debian.org/tracker/CVE-2026-107677 
                        ffmpeg | CVE-2026-107660  | https://security-tracker.debian.org/tracker/CVE-2026-107660 
                        ffmpeg | CVE-2026-107697  | https://security-tracker.debian.org/tracker/CVE-2026-107697 
                        ffmpeg | CVE-2026-70631   | https://security-tracker.debian.org/tracker/CVE-2026-70631  
                        ffmpeg | CVE-2026-70628   | https://security-tracker.debian.org/tracker/CVE-2026-70628  
                        ffmpeg | CVE-2026-70630   | https://security-tracker.debian.org/tracker/CVE-2026-70630  
                        ffmpeg | CVE-2026-70629   | https://security-tracker.debian.org/tracker/CVE-2026-70629  
                        ffmpeg | CVE-2026-70632   | https://security-tracker.debian.org/tracker/CVE-2026-70632  
                        ffmpeg | CVE-2026-30998   | https://security-tracker.debian.org/tracker/CVE-2026-30998  
                        ffmpeg | CVE-2026-30997   | https://security-tracker.debian.org/tracker/CVE-2026-30997  
                        ffmpeg | CVE-2026-30999   | https://security-tracker.debian.org/tracker/CVE-2026-30999  
                       flannel | CVE-2026-32241   | https://security-tracker.debian.org/tracker/CVE-2026-32241  
                         forge | CVE-2025-66030   | https://security-tracker.debian.org/tracker/CVE-2025-66030  
                         forge | CVE-2025-66031   | https://security-tracker.debian.org/tracker/CVE-2025-66031  
                         forge | CVE-2025-12816   | https://security-tracker.debian.org/tracker/CVE-2025-12816  
                         forge | CVE-2026-33891   | https://security-tracker.debian.org/tracker/CVE-2026-33891  
                         forge | CVE-2026-33896   | https://security-tracker.debian.org/tracker/CVE-2026-33896  
                         forge | CVE-2026-33895   | https://security-tracker.debian.org/tracker/CVE-2026-33895  
                         forge | CVE-2026-33894   | https://security-tracker.debian.org/tracker/CVE-2026-33894  
                       freerdp | CVE-2026-55648   | https://security-tracker.debian.org/tracker/CVE-2026-55648  
                       freerdp | CVE-2026-27951   | https://security-tracker.debian.org/tracker/CVE-2026-27951  
                       freerdp | CVE-2026-27950   | https://security-tracker.debian.org/tracker/CVE-2026-27950  
                       freerdp | CVE-2026-91962   | https://security-tracker.debian.org/tracker/CVE-2026-91962  
                       freerdp | CVE-2026-91960   | https://security-tracker.debian.org/tracker/CVE-2026-91960  
                       freerdp | CVE-2026-91954   | https://security-tracker.debian.org/tracker/CVE-2026-91954  
                       freerdp | CVE-2026-91961   | https://security-tracker.debian.org/tracker/CVE-2026-91961  
                       freerdp | CVE-2026-91946   | https://security-tracker.debian.org/tracker/CVE-2026-91946  
                       freerdp | CVE-2026-91957   | https://security-tracker.debian.org/tracker/CVE-2026-91957  
                       freerdp | CVE-2026-91959   | https://security-tracker.debian.org/tracker/CVE-2026-91959  
                       freerdp | CVE-2026-91956   | https://security-tracker.debian.org/tracker/CVE-2026-91956  
                       freerdp | CVE-2026-91955   | https://security-tracker.debian.org/tracker/CVE-2026-91955  
                       freerdp | CVE-2026-91950   | https://security-tracker.debian.org/tracker/CVE-2026-91950  
                       freerdp | CVE-2026-91963   | https://security-tracker.debian.org/tracker/CVE-2026-91963  
                       freerdp | CVE-2026-91953   | https://security-tracker.debian.org/tracker/CVE-2026-91953  
                       freerdp | CVE-2026-22854   | https://security-tracker.debian.org/tracker/CVE-2026-22854  
                       freerdp | CVE-2026-22851   | https://security-tracker.debian.org/tracker/CVE-2026-22851  
                       freerdp | CVE-2026-22859   | https://security-tracker.debian.org/tracker/CVE-2026-22859  
                       freerdp | CVE-2026-22857   | https://security-tracker.debian.org/tracker/CVE-2026-22857  
                       freerdp | CVE-2026-22858   | https://security-tracker.debian.org/tracker/CVE-2026-22858  
                       freerdp | CVE-2026-22853   | https://security-tracker.debian.org/tracker/CVE-2026-22853  
                       freerdp | CVE-2026-22855   | https://security-tracker.debian.org/tracker/CVE-2026-22855  
                       freerdp | CVE-2026-22856   | https://security-tracker.debian.org/tracker/CVE-2026-22856  
                       freerdp | CVE-2026-22852   | https://security-tracker.debian.org/tracker/CVE-2026-22852  
                       freerdp | CVE-2026-68579   | https://security-tracker.debian.org/tracker/CVE-2026-68579  
                       freerdp | CVE-2026-68580   | https://security-tracker.debian.org/tracker/CVE-2026-68580  
                       freerdp | CVE-2026-110832  | https://security-tracker.debian.org/tracker/CVE-2026-110832 
                       freerdp | CVE-2026-110837  | https://security-tracker.debian.org/tracker/CVE-2026-110837 
                       freerdp | CVE-2026-110834  | https://security-tracker.debian.org/tracker/CVE-2026-110834 
                       freerdp | CVE-2026-110830  | https://security-tracker.debian.org/tracker/CVE-2026-110830 
                       freerdp | CVE-2026-67288   | https://security-tracker.debian.org/tracker/CVE-2026-67288  
                       freerdp | CVE-2026-67290   | https://security-tracker.debian.org/tracker/CVE-2026-67290  
                       freerdp | CVE-2026-67294   | https://security-tracker.debian.org/tracker/CVE-2026-67294  
                       freerdp | CVE-2026-67289   | https://security-tracker.debian.org/tracker/CVE-2026-67289  
                       freerdp | CVE-2026-67293   | https://security-tracker.debian.org/tracker/CVE-2026-67293  
                       freerdp | CVE-2026-67296   | https://security-tracker.debian.org/tracker/CVE-2026-67296  
                       freerdp | CVE-2026-67299   | https://security-tracker.debian.org/tracker/CVE-2026-67299  
                       freerdp | CVE-2026-67291   | https://security-tracker.debian.org/tracker/CVE-2026-67291  
                       freerdp | CVE-2026-67297   | https://security-tracker.debian.org/tracker/CVE-2026-67297  
                       freerdp | CVE-2026-67292   | https://security-tracker.debian.org/tracker/CVE-2026-67292  
                       freerdp | CVE-2026-29775   | https://security-tracker.debian.org/tracker/CVE-2026-29775  
                       freerdp | CVE-2026-29776   | https://security-tracker.debian.org/tracker/CVE-2026-29776  
                       freerdp | CVE-2026-29774   | https://security-tracker.debian.org/tracker/CVE-2026-29774  
                       freerdp | CVE-2026-64624   | https://security-tracker.debian.org/tracker/CVE-2026-64624  
                       freerdp | CVE-2026-64620   | https://security-tracker.debian.org/tracker/CVE-2026-64620  
                       freerdp | CVE-2026-31897   | https://security-tracker.debian.org/tracker/CVE-2026-31897  
                       freerdp | CVE-2026-31885   | https://security-tracker.debian.org/tracker/CVE-2026-31885  
                       freerdp | CVE-2026-31883   | https://security-tracker.debian.org/tracker/CVE-2026-31883  
                       freerdp | CVE-2026-31806   | https://security-tracker.debian.org/tracker/CVE-2026-31806  
                       freerdp | CVE-2026-31884   | https://security-tracker.debian.org/tracker/CVE-2026-31884  
                       freerdp | CVE-2026-27015   | https://security-tracker.debian.org/tracker/CVE-2026-27015  
                       freerdp | CVE-2026-33995   | https://security-tracker.debian.org/tracker/CVE-2026-33995  
                       freerdp | CVE-2026-33986   | https://security-tracker.debian.org/tracker/CVE-2026-33986  
                       freerdp | CVE-2026-33983   | https://security-tracker.debian.org/tracker/CVE-2026-33983  
                       freerdp | CVE-2026-33985   | https://security-tracker.debian.org/tracker/CVE-2026-33985  
                       freerdp | CVE-2026-33987   | https://security-tracker.debian.org/tracker/CVE-2026-33987  
                       freerdp | CVE-2026-33977   | https://security-tracker.debian.org/tracker/CVE-2026-33977  
                       freerdp | CVE-2026-33984   | https://security-tracker.debian.org/tracker/CVE-2026-33984  
                       freerdp | CVE-2026-33952   | https://security-tracker.debian.org/tracker/CVE-2026-33952  
                       freerdp | CVE-2026-33982   | https://security-tracker.debian.org/tracker/CVE-2026-33982  
                       freerdp | CVE-2026-40254   | https://security-tracker.debian.org/tracker/CVE-2026-40254  
                       freerdp | CVE-2026-55191   | https://security-tracker.debian.org/tracker/CVE-2026-55191  
                       freerdp | CVE-2026-55192   | https://security-tracker.debian.org/tracker/CVE-2026-55192  
                       freerdp | CVE-2026-55193   | https://security-tracker.debian.org/tracker/CVE-2026-55193  
                       freerdp | CVE-2026-55194   | https://security-tracker.debian.org/tracker/CVE-2026-55194  
                       freerdp | CVE-2026-26271   | https://security-tracker.debian.org/tracker/CVE-2026-26271  
                       freerdp | CVE-2026-24491   | https://security-tracker.debian.org/tracker/CVE-2026-24491  
                       freerdp | CVE-2026-57157   | https://security-tracker.debian.org/tracker/CVE-2026-57157  
                       freerdp | CVE-2026-57156   | https://security-tracker.debian.org/tracker/CVE-2026-57156  
                       freerdp | CVE-2026-40033   | https://security-tracker.debian.org/tracker/CVE-2026-40033  
                       freerdp | CVE-2026-26986   | https://security-tracker.debian.org/tracker/CVE-2026-26986  
                       freerdp | CVE-2026-26965   | https://security-tracker.debian.org/tracker/CVE-2026-26965  
                       freerdp | CVE-2026-26955   | https://security-tracker.debian.org/tracker/CVE-2026-26955  
                       freerdp | CVE-2026-56297   | https://security-tracker.debian.org/tracker/CVE-2026-56297  
                       freerdp | CVE-2026-24677   | https://security-tracker.debian.org/tracker/CVE-2026-24677  
                       freerdp | CVE-2026-24678   | https://security-tracker.debian.org/tracker/CVE-2026-24678  
                       freerdp | CVE-2026-24680   | https://security-tracker.debian.org/tracker/CVE-2026-24680  
                       freerdp | CVE-2026-45700   | https://security-tracker.debian.org/tracker/CVE-2026-45700  
                       freerdp | CVE-2026-111373  | https://security-tracker.debian.org/tracker/CVE-2026-111373 
                       freerdp | CVE-2026-111382  | https://security-tracker.debian.org/tracker/CVE-2026-111382 
                       freerdp | CVE-2026-111381  | https://security-tracker.debian.org/tracker/CVE-2026-111381 
                       freerdp | CVE-2026-111379  | https://security-tracker.debian.org/tracker/CVE-2026-111379 
                       freerdp | CVE-2026-111377  | https://security-tracker.debian.org/tracker/CVE-2026-111377 
                       freerdp | CVE-2026-67306   | https://security-tracker.debian.org/tracker/CVE-2026-67306  
                       freerdp | CVE-2026-67303   | https://security-tracker.debian.org/tracker/CVE-2026-67303  
                       freerdp | CVE-2026-67301   | https://security-tracker.debian.org/tracker/CVE-2026-67301  
                       freerdp | CVE-2026-67304   | https://security-tracker.debian.org/tracker/CVE-2026-67304  
                       freerdp | CVE-2026-67305   | https://security-tracker.debian.org/tracker/CVE-2026-67305  
                       freerdp | CVE-2026-67302   | https://security-tracker.debian.org/tracker/CVE-2026-67302  
                       freerdp | CVE-2026-85090   | https://security-tracker.debian.org/tracker/CVE-2026-85090  
                       freerdp | CVE-2026-55827   | https://security-tracker.debian.org/tracker/CVE-2026-55827  
                       freerdp | CVE-2026-23883   | https://security-tracker.debian.org/tracker/CVE-2026-23883  
                       freerdp | CVE-2026-23884   | https://security-tracker.debian.org/tracker/CVE-2026-23884  
                       freerdp | CVE-2026-44422   | https://security-tracker.debian.org/tracker/CVE-2026-44422  
                       freerdp | CVE-2026-44420   | https://security-tracker.debian.org/tracker/CVE-2026-44420  
                       freerdp | CVE-2026-44421   | https://security-tracker.debian.org/tracker/CVE-2026-44421  
                       freerdp | CVE-2026-23732   | https://security-tracker.debian.org/tracker/CVE-2026-23732  
                       freerdp | CVE-2026-73242   | https://security-tracker.debian.org/tracker/CVE-2026-73242  
                       freerdp | CVE-2026-73241   | https://security-tracker.debian.org/tracker/CVE-2026-73241  
                       freerdp | CVE-2026-63633   | https://security-tracker.debian.org/tracker/CVE-2026-63633  
                       freerdp | CVE-2026-63652   | https://security-tracker.debian.org/tracker/CVE-2026-63652  
                       freerdp | CVE-2026-63117   | https://security-tracker.debian.org/tracker/CVE-2026-63117  
                       freerdp | CVE-2026-66401   | https://security-tracker.debian.org/tracker/CVE-2026-66401  
                       freerdp | CVE-2026-66402   | https://security-tracker.debian.org/tracker/CVE-2026-66402  
                       freerdp | CVE-2026-55564   | https://security-tracker.debian.org/tracker/CVE-2026-55564  
                       freerdp | CVE-2026-25959   | https://security-tracker.debian.org/tracker/CVE-2026-25959  
                       freerdp | CVE-2026-25954   | https://security-tracker.debian.org/tracker/CVE-2026-25954  
                       freerdp | CVE-2026-25952   | https://security-tracker.debian.org/tracker/CVE-2026-25952  
                       freerdp | CVE-2026-25942   | https://security-tracker.debian.org/tracker/CVE-2026-25942  
                       freerdp | CVE-2026-25955   | https://security-tracker.debian.org/tracker/CVE-2026-25955  
                       freerdp | CVE-2026-25997   | https://security-tracker.debian.org/tracker/CVE-2026-25997  
                       freerdp | CVE-2026-25953   | https://security-tracker.debian.org/tracker/CVE-2026-25953  
                    freeswitch | CVE-2026-49847   | https://security-tracker.debian.org/tracker/CVE-2026-49847  
                    freeswitch | CVE-2026-49843   | https://security-tracker.debian.org/tracker/CVE-2026-49843  
                    freeswitch | CVE-2026-49840   | https://security-tracker.debian.org/tracker/CVE-2026-49840  
                    freeswitch | CVE-2026-49841   | https://security-tracker.debian.org/tracker/CVE-2026-49841  
                    freeswitch | CVE-2026-49842   | https://security-tracker.debian.org/tracker/CVE-2026-49842  
                    freeswitch | CVE-2026-49848   | https://security-tracker.debian.org/tracker/CVE-2026-49848  
                    freeswitch | CVE-2026-49472   | https://security-tracker.debian.org/tracker/CVE-2026-49472  
                    freeswitch | CVE-2026-49475   | https://security-tracker.debian.org/tracker/CVE-2026-49475  
                    freeswitch | CVE-2026-45771   | https://security-tracker.debian.org/tracker/CVE-2026-45771  
                           frr | CVE-2025-61101   | https://security-tracker.debian.org/tracker/CVE-2025-61101  
                           frr | CVE-2025-61107   | https://security-tracker.debian.org/tracker/CVE-2025-61107  
                           frr | CVE-2025-61105   | https://security-tracker.debian.org/tracker/CVE-2025-61105  
                           frr | CVE-2025-61106   | https://security-tracker.debian.org/tracker/CVE-2025-61106  
                           frr | CVE-2025-61103   | https://security-tracker.debian.org/tracker/CVE-2025-61103  
                           frr | CVE-2025-61104   | https://security-tracker.debian.org/tracker/CVE-2025-61104  
                           frr | CVE-2025-61100   | https://security-tracker.debian.org/tracker/CVE-2025-61100  
                           frr | CVE-2025-61102   | https://security-tracker.debian.org/tracker/CVE-2025-61102  
                           frr | CVE-2025-61099   | https://security-tracker.debian.org/tracker/CVE-2025-61099  
                           frr | CVE-2026-28532   | https://security-tracker.debian.org/tracker/CVE-2026-28532  
                           frr | CVE-2026-37458   | https://security-tracker.debian.org/tracker/CVE-2026-37458  
                gcc-bare-metal | CVE-2023-4039    | https://security-tracker.debian.org/tracker/CVE-2023-4039   
                          gdal | CVE-2026-49014   | https://security-tracker.debian.org/tracker/CVE-2026-49014  
                          gdal | CVE-2026-8088    | https://security-tracker.debian.org/tracker/CVE-2026-8088   
                          gdal | CVE-2026-8087    | https://security-tracker.debian.org/tracker/CVE-2026-8087   
                          gdal | CVE-2026-8084    | https://security-tracker.debian.org/tracker/CVE-2026-8084   
                          gdal | CVE-2026-8086    | https://security-tracker.debian.org/tracker/CVE-2026-8086   
                          gdal | CVE-2026-8212    | https://security-tracker.debian.org/tracker/CVE-2026-8212   
                          gdal | CVE-2026-8213    | https://security-tracker.debian.org/tracker/CVE-2026-8213   
                        giflib | CVE-2024-45993   | https://security-tracker.debian.org/tracker/CVE-2024-45993  
                        giflib | CVE-2026-26740   | https://security-tracker.debian.org/tracker/CVE-2026-26740  
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                         gnupg | CVE-2022-34903   | https://security-tracker.debian.org/tracker/CVE-2022-34903  
                         gnupg | CVE-2025-30258   | https://security-tracker.debian.org/tracker/CVE-2025-30258  
                         gnupg | CVE-2025-68973   | https://security-tracker.debian.org/tracker/CVE-2025-68973  
                         gnupg | CVE-2025-68972   | https://security-tracker.debian.org/tracker/CVE-2025-68972  
                          grpc | CVE-2026-33186   | https://security-tracker.debian.org/tracker/CVE-2026-33186  
                         grub2 | CVE-2024-2312    | https://security-tracker.debian.org/tracker/CVE-2024-2312   
                         grub2 | CVE-2025-61662   | https://security-tracker.debian.org/tracker/CVE-2025-61662  
             gst1-plugins-good | CVE-2026-46470   | https://security-tracker.debian.org/tracker/CVE-2026-46470  
             gst1-plugins-good | CVE-2026-46469   | https://security-tracker.debian.org/tracker/CVE-2026-46469  
                    gstreamer1 | CVE-2025-47183   | https://security-tracker.debian.org/tracker/CVE-2025-47183  
                    gstreamer1 | CVE-2025-3887    | https://security-tracker.debian.org/tracker/CVE-2025-3887   
                    gstreamer1 | CVE-2025-47219   | https://security-tracker.debian.org/tracker/CVE-2025-47219  
                    gstreamer1 | CVE-2025-2759    | https://security-tracker.debian.org/tracker/CVE-2025-2759   
                    gstreamer1 | CVE-2025-47808   | https://security-tracker.debian.org/tracker/CVE-2025-47808  
                    gstreamer1 | CVE-2025-47806   | https://security-tracker.debian.org/tracker/CVE-2025-47806  
                    gstreamer1 | CVE-2025-47807   | https://security-tracker.debian.org/tracker/CVE-2025-47807  
                    gstreamer1 | CVE-2026-73433   | https://security-tracker.debian.org/tracker/CVE-2026-73433  
                    gstreamer1 | CVE-2026-73434   | https://security-tracker.debian.org/tracker/CVE-2026-73434  
                    gstreamer1 | CVE-2026-1940    | https://security-tracker.debian.org/tracker/CVE-2026-1940   
                    gstreamer1 | CVE-2026-2921    | https://security-tracker.debian.org/tracker/CVE-2026-2921   
                    gstreamer1 | CVE-2026-2923    | https://security-tracker.debian.org/tracker/CVE-2026-2923   
                    gstreamer1 | CVE-2026-2920    | https://security-tracker.debian.org/tracker/CVE-2026-2920   
                    gstreamer1 | CVE-2026-2922    | https://security-tracker.debian.org/tracker/CVE-2026-2922   
                    gstreamer1 | CVE-2026-18299   | https://security-tracker.debian.org/tracker/CVE-2026-18299  
                    gstreamer1 | CVE-2026-18297   | https://security-tracker.debian.org/tracker/CVE-2026-18297  
                    gstreamer1 | CVE-2026-18296   | https://security-tracker.debian.org/tracker/CVE-2026-18296  
                    gstreamer1 | CVE-2026-18298   | https://security-tracker.debian.org/tracker/CVE-2026-18298  
                    gstreamer1 | CVE-2026-18295   | https://security-tracker.debian.org/tracker/CVE-2026-18295  
                    gstreamer1 | CVE-2026-3081    | https://security-tracker.debian.org/tracker/CVE-2026-3081   
                    gstreamer1 | CVE-2026-3084    | https://security-tracker.debian.org/tracker/CVE-2026-3084   
                    gstreamer1 | CVE-2026-3085    | https://security-tracker.debian.org/tracker/CVE-2026-3085   
                    gstreamer1 | CVE-2026-3083    | https://security-tracker.debian.org/tracker/CVE-2026-3083   
                    gstreamer1 | CVE-2026-3086    | https://security-tracker.debian.org/tracker/CVE-2026-3086   
                    gstreamer1 | CVE-2026-3082    | https://security-tracker.debian.org/tracker/CVE-2026-3082   
                          gzip | CVE-2026-41991   | https://security-tracker.debian.org/tracker/CVE-2026-41991  
                          gzip | CVE-2026-41992   | https://security-tracker.debian.org/tracker/CVE-2026-41992  
                       haproxy | CVE-2026-33555   | https://security-tracker.debian.org/tracker/CVE-2026-33555  
                      harfbuzz | CVE-2026-22693   | https://security-tracker.debian.org/tracker/CVE-2026-22693  
                         hplip | CVE-2025-43023   | https://security-tracker.debian.org/tracker/CVE-2025-43023  
                         hplip | CVE-2026-91101   | https://security-tracker.debian.org/tracker/CVE-2026-91101  
                         hplip | CVE-2026-91102   | https://security-tracker.debian.org/tracker/CVE-2026-91102  
                         hplip | CVE-2026-91105   | https://security-tracker.debian.org/tracker/CVE-2026-91105  
                         hplip | CVE-2026-91106   | https://security-tracker.debian.org/tracker/CVE-2026-91106  
                         hplip | CVE-2026-91103   | https://security-tracker.debian.org/tracker/CVE-2026-91103  
                         hplip | CVE-2026-91104   | https://security-tracker.debian.org/tracker/CVE-2026-91104  
                         hplip | CVE-2026-91100   | https://security-tracker.debian.org/tracker/CVE-2026-91100  
                         hplip | CVE-2026-91099   | https://security-tracker.debian.org/tracker/CVE-2026-91099  
                         hplip | CVE-2026-91098   | https://security-tracker.debian.org/tracker/CVE-2026-91098  
                         hplip | CVE-2026-91097   | https://security-tracker.debian.org/tracker/CVE-2026-91097  
                         hplip | CVE-2026-8632    | https://security-tracker.debian.org/tracker/CVE-2026-8632   
                         hplip | CVE-2026-8631    | https://security-tracker.debian.org/tracker/CVE-2026-8631   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2026-93590   | https://security-tracker.debian.org/tracker/CVE-2026-93590  
                   imagemagick | CVE-2026-93586   | https://security-tracker.debian.org/tracker/CVE-2026-93586  
                   imagemagick | CVE-2026-93587   | https://security-tracker.debian.org/tracker/CVE-2026-93587  
                   imagemagick | CVE-2026-93589   | https://security-tracker.debian.org/tracker/CVE-2026-93589  
                   imagemagick | CVE-2026-93588   | https://security-tracker.debian.org/tracker/CVE-2026-93588  
                   imagemagick | CVE-2026-86425   | https://security-tracker.debian.org/tracker/CVE-2026-86425  
                   imagemagick | CVE-2026-86424   | https://security-tracker.debian.org/tracker/CVE-2026-86424  
                   imagemagick | CVE-2026-86420   | https://security-tracker.debian.org/tracker/CVE-2026-86420  
                   imagemagick | CVE-2026-86423   | https://security-tracker.debian.org/tracker/CVE-2026-86423  
                   imagemagick | CVE-2026-86421   | https://security-tracker.debian.org/tracker/CVE-2026-86421  
                   imagemagick | CVE-2026-86422   | https://security-tracker.debian.org/tracker/CVE-2026-86422  
                   imagemagick | CVE-2026-62946   | https://security-tracker.debian.org/tracker/CVE-2026-62946  
                   imagemagick | CVE-2026-64685   | https://security-tracker.debian.org/tracker/CVE-2026-64685  
                   imagemagick | CVE-2026-107209  | https://security-tracker.debian.org/tracker/CVE-2026-107209 
                   imagemagick | CVE-2026-107208  | https://security-tracker.debian.org/tracker/CVE-2026-107208 
                   imagemagick | CVE-2026-107210  | https://security-tracker.debian.org/tracker/CVE-2026-107210 
                   imagemagick | CVE-2026-105083  | https://security-tracker.debian.org/tracker/CVE-2026-105083 
                   imagemagick | CVE-2026-106569  | https://security-tracker.debian.org/tracker/CVE-2026-106569 
                   imagemagick | CVE-2026-106574  | https://security-tracker.debian.org/tracker/CVE-2026-106574 
                   imagemagick | CVE-2026-106566  | https://security-tracker.debian.org/tracker/CVE-2026-106566 
                   imagemagick | CVE-2026-106580  | https://security-tracker.debian.org/tracker/CVE-2026-106580 
                   imagemagick | CVE-2026-106567  | https://security-tracker.debian.org/tracker/CVE-2026-106567 
                   imagemagick | CVE-2026-106568  | https://security-tracker.debian.org/tracker/CVE-2026-106568 
                   imagemagick | CVE-2026-106578  | https://security-tracker.debian.org/tracker/CVE-2026-106578 
                   imagemagick | CVE-2026-106571  | https://security-tracker.debian.org/tracker/CVE-2026-106571 
                   imagemagick | CVE-2026-106565  | https://security-tracker.debian.org/tracker/CVE-2026-106565 
                   imagemagick | CVE-2026-106572  | https://security-tracker.debian.org/tracker/CVE-2026-106572 
                   imagemagick | CVE-2026-106575  | https://security-tracker.debian.org/tracker/CVE-2026-106575 
                   imagemagick | CVE-2026-106564  | https://security-tracker.debian.org/tracker/CVE-2026-106564 
                   imagemagick | CVE-2026-106576  | https://security-tracker.debian.org/tracker/CVE-2026-106576 
                   imagemagick | CVE-2026-106570  | https://security-tracker.debian.org/tracker/CVE-2026-106570 
                   imagemagick | CVE-2026-106573  | https://security-tracker.debian.org/tracker/CVE-2026-106573 
                   imagemagick | CVE-2026-106577  | https://security-tracker.debian.org/tracker/CVE-2026-106577 
                   imagemagick | CVE-2026-106579  | https://security-tracker.debian.org/tracker/CVE-2026-106579 
                   imagemagick | CVE-2026-66011   | https://security-tracker.debian.org/tracker/CVE-2026-66011  
                   imagemagick | CVE-2026-102635  | https://security-tracker.debian.org/tracker/CVE-2026-102635 
                   imagemagick | CVE-2026-62363   | https://security-tracker.debian.org/tracker/CVE-2026-62363  
                         janet | CVE-2026-2240    | https://security-tracker.debian.org/tracker/CVE-2026-2240   
                         janet | CVE-2026-2242    | https://security-tracker.debian.org/tracker/CVE-2026-2242   
                         janet | CVE-2026-2241    | https://security-tracker.debian.org/tracker/CVE-2026-2241   
                         janet | CVE-2026-2869    | https://security-tracker.debian.org/tracker/CVE-2026-2869   
                         jhead | CVE-2025-44906   | https://security-tracker.debian.org/tracker/CVE-2025-44906  
                            jq | CVE-2026-43895   | https://security-tracker.debian.org/tracker/CVE-2026-43895  
                            jq | CVE-2026-47770   | https://security-tracker.debian.org/tracker/CVE-2026-47770  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                       libbson | CVE-2024-6381    | https://security-tracker.debian.org/tracker/CVE-2024-6381   
                       libbson | CVE-2025-0755    | https://security-tracker.debian.org/tracker/CVE-2025-0755   
                       libcdio | CVE-2024-36600   | https://security-tracker.debian.org/tracker/CVE-2024-36600  
                       libcoap | CVE-2026-29013   | https://security-tracker.debian.org/tracker/CVE-2026-29013  
                  libfreeimage | CVE-2019-12212   | https://security-tracker.debian.org/tracker/CVE-2019-12212  
                  libfreeimage | CVE-2019-12214   | https://security-tracker.debian.org/tracker/CVE-2019-12214  
                  libfreeimage | CVE-2020-21428   | https://security-tracker.debian.org/tracker/CVE-2020-21428  
                  libfreeimage | CVE-2020-21427   | https://security-tracker.debian.org/tracker/CVE-2020-21427  
                  libfreeimage | CVE-2020-21426   | https://security-tracker.debian.org/tracker/CVE-2020-21426  
                  libfreeimage | CVE-2023-47993   | https://security-tracker.debian.org/tracker/CVE-2023-47993  
                  libfreeimage | CVE-2023-47996   | https://security-tracker.debian.org/tracker/CVE-2023-47996  
                  libfreeimage | CVE-2023-47992   | https://security-tracker.debian.org/tracker/CVE-2023-47992  
                  libfreeimage | CVE-2023-47994   | https://security-tracker.debian.org/tracker/CVE-2023-47994  
                  libfreeimage | CVE-2024-31570   | https://security-tracker.debian.org/tracker/CVE-2024-31570  
                  libfreeimage | CVE-2025-70968   | https://security-tracker.debian.org/tracker/CVE-2025-70968  
                  libfreeimage | CVE-2025-65803   | https://security-tracker.debian.org/tracker/CVE-2025-65803  
                      libglib2 | CVE-2025-14512   | https://security-tracker.debian.org/tracker/CVE-2025-14512  
                      libglib2 | CVE-2025-13601   | https://security-tracker.debian.org/tracker/CVE-2025-13601  
                      libglib2 | CVE-2025-4056    | https://security-tracker.debian.org/tracker/CVE-2025-4056   
                      libglib2 | CVE-2026-58012   | https://security-tracker.debian.org/tracker/CVE-2026-58012  
                      libglib2 | CVE-2026-58011   | https://security-tracker.debian.org/tracker/CVE-2026-58011  
                      libglib2 | CVE-2026-58010   | https://security-tracker.debian.org/tracker/CVE-2026-58010  
                      libglib2 | CVE-2026-58015   | https://security-tracker.debian.org/tracker/CVE-2026-58015  
                      libglib2 | CVE-2026-58013   | https://security-tracker.debian.org/tracker/CVE-2026-58013  
                      libglib2 | CVE-2026-58014   | https://security-tracker.debian.org/tracker/CVE-2026-58014  
            libglib2-bootstrap | CVE-2025-14512   | https://security-tracker.debian.org/tracker/CVE-2025-14512  
            libglib2-bootstrap | CVE-2025-13601   | https://security-tracker.debian.org/tracker/CVE-2025-13601  
            libglib2-bootstrap | CVE-2025-14087   | https://security-tracker.debian.org/tracker/CVE-2025-14087  
            libglib2-bootstrap | CVE-2025-6052    | https://security-tracker.debian.org/tracker/CVE-2025-6052   
            libglib2-bootstrap | CVE-2025-4056    | https://security-tracker.debian.org/tracker/CVE-2025-4056   
            libglib2-bootstrap | CVE-2026-58012   | https://security-tracker.debian.org/tracker/CVE-2026-58012  
            libglib2-bootstrap | CVE-2026-58011   | https://security-tracker.debian.org/tracker/CVE-2026-58011  
            libglib2-bootstrap | CVE-2026-58010   | https://security-tracker.debian.org/tracker/CVE-2026-58010  
            libglib2-bootstrap | CVE-2026-58015   | https://security-tracker.debian.org/tracker/CVE-2026-58015  
            libglib2-bootstrap | CVE-2026-58016   | https://security-tracker.debian.org/tracker/CVE-2026-58016  
            libglib2-bootstrap | CVE-2026-58013   | https://security-tracker.debian.org/tracker/CVE-2026-58013  
            libglib2-bootstrap | CVE-2026-58014   | https://security-tracker.debian.org/tracker/CVE-2026-58014  
                       libgtk2 | CVE-2014-1949    | https://security-tracker.debian.org/tracker/CVE-2014-1949   
                        libidn | CVE-2026-57053   | https://security-tracker.debian.org/tracker/CVE-2026-57053  
                      libkcapi | CVE-2026-71225   | https://security-tracker.debian.org/tracker/CVE-2026-71225  
                      libkcapi | CVE-2026-71226   | https://security-tracker.debian.org/tracker/CVE-2026-71226  
                      libkcapi | CVE-2026-71227   | https://security-tracker.debian.org/tracker/CVE-2026-71227  
                       libkrb5 | CVE-2026-40355   | https://security-tracker.debian.org/tracker/CVE-2026-40355  
                       libkrb5 | CVE-2026-40356   | https://security-tracker.debian.org/tracker/CVE-2026-40356  
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                      libpjsip | CVE-2026-57163   | https://security-tracker.debian.org/tracker/CVE-2026-57163  
                      libpjsip | CVE-2026-57162   | https://security-tracker.debian.org/tracker/CVE-2026-57162  
                      libpjsip | CVE-2026-57160   | https://security-tracker.debian.org/tracker/CVE-2026-57160  
                      libpjsip | CVE-2026-57164   | https://security-tracker.debian.org/tracker/CVE-2026-57164  
                      libpjsip | CVE-2026-57161   | https://security-tracker.debian.org/tracker/CVE-2026-57161  
                      libpjsip | CVE-2026-57166   | https://security-tracker.debian.org/tracker/CVE-2026-57166  
                      libpjsip | CVE-2026-57159   | https://security-tracker.debian.org/tracker/CVE-2026-57159  
                      libpjsip | CVE-2026-57165   | https://security-tracker.debian.org/tracker/CVE-2026-57165  
                      libpjsip | CVE-2026-84975   | https://security-tracker.debian.org/tracker/CVE-2026-84975  
                      libpjsip | CVE-2026-77396   | https://security-tracker.debian.org/tracker/CVE-2026-77396  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                        libraw | CVE-2026-5342    | https://security-tracker.debian.org/tracker/CVE-2026-5342   
                        libraw | CVE-2026-5318    | https://security-tracker.debian.org/tracker/CVE-2026-5318   
                    libsndfile | CVE-2024-50613   | https://security-tracker.debian.org/tracker/CVE-2024-50613  
                    libsndfile | CVE-2025-52194   | https://security-tracker.debian.org/tracker/CVE-2025-52194  
                    libsndfile | CVE-2025-56226   | https://security-tracker.debian.org/tracker/CVE-2025-56226  
                    libsndfile | CVE-2026-37555   | https://security-tracker.debian.org/tracker/CVE-2026-37555  
                       libsolv | CVE-2026-9150    | https://security-tracker.debian.org/tracker/CVE-2026-9150   
                       libsolv | CVE-2026-9149    | https://security-tracker.debian.org/tracker/CVE-2026-9149   
                       libsoup | CVE-2026-102560  | https://security-tracker.debian.org/tracker/CVE-2026-102560 
                       libsoup | CVE-2026-102558  | https://security-tracker.debian.org/tracker/CVE-2026-102558 
                       libsoup | CVE-2026-102555  | https://security-tracker.debian.org/tracker/CVE-2026-102555 
                       libsoup | CVE-2026-102556  | https://security-tracker.debian.org/tracker/CVE-2026-102556 
                       libsoup | CVE-2026-102559  | https://security-tracker.debian.org/tracker/CVE-2026-102559 
                       libsoup | CVE-2026-102557  | https://security-tracker.debian.org/tracker/CVE-2026-102557 
                        libssh | CVE-2025-14821   | https://security-tracker.debian.org/tracker/CVE-2025-14821  
                       libssh2 | CVE-2026-58051   | https://security-tracker.debian.org/tracker/CVE-2026-58051  
                       libssh2 | CVE-2026-58050   | https://security-tracker.debian.org/tracker/CVE-2026-58050  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                        libucl | CVE-2025-6499    | https://security-tracker.debian.org/tracker/CVE-2025-6499   
                        libucl | CVE-2026-0708    | https://security-tracker.debian.org/tracker/CVE-2026-0708   
                       libvips | CVE-2026-35590   | https://security-tracker.debian.org/tracker/CVE-2026-35590  
                       libvips | CVE-2026-35591   | https://security-tracker.debian.org/tracker/CVE-2026-35591  
                       libvips | CVE-2026-3146    | https://security-tracker.debian.org/tracker/CVE-2026-3146   
                       libvips | CVE-2026-3147    | https://security-tracker.debian.org/tracker/CVE-2026-3147   
                       libvips | CVE-2026-3145    | https://security-tracker.debian.org/tracker/CVE-2026-3145   
                       libvips | CVE-2026-33328   | https://security-tracker.debian.org/tracker/CVE-2026-33328  
                       libvips | CVE-2026-33327   | https://security-tracker.debian.org/tracker/CVE-2026-33327  
                       libvips | CVE-2026-2913    | https://security-tracker.debian.org/tracker/CVE-2026-2913   
                       libvirt | CVE-2024-2496    | https://security-tracker.debian.org/tracker/CVE-2024-2496   
                         lrzip | CVE-2025-9396    | https://security-tracker.debian.org/tracker/CVE-2025-9396   
                         lrzip | CVE-2025-15570   | https://security-tracker.debian.org/tracker/CVE-2025-15570  
                         lrzip | CVE-2025-15571   | https://security-tracker.debian.org/tracker/CVE-2025-15571  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2021-43519   | https://security-tracker.debian.org/tracker/CVE-2021-43519  
                           lxc | CVE-2026-39402   | https://security-tracker.debian.org/tracker/CVE-2026-39402  
                       mariadb | CVE-2026-97380   | https://security-tracker.debian.org/tracker/CVE-2026-97380  
                       mariadb | CVE-2026-92262   | https://security-tracker.debian.org/tracker/CVE-2026-92262  
                       mariadb | CVE-2026-35549   | https://security-tracker.debian.org/tracker/CVE-2026-35549  
                       mariadb | CVE-2026-85745   | https://security-tracker.debian.org/tracker/CVE-2026-85745  
                       mariadb | CVE-2026-85746   | https://security-tracker.debian.org/tracker/CVE-2026-85746  
                       mariadb | CVE-2026-85985   | https://security-tracker.debian.org/tracker/CVE-2026-85985  
                       mariadb | CVE-2026-86047   | https://security-tracker.debian.org/tracker/CVE-2026-86047  
                       mariadb | CVE-2026-107822  | https://security-tracker.debian.org/tracker/CVE-2026-107822 
                       mariadb | CVE-2026-107823  | https://security-tracker.debian.org/tracker/CVE-2026-107823 
                       mariadb | CVE-2026-107814  | https://security-tracker.debian.org/tracker/CVE-2026-107814 
                       mariadb | CVE-2026-107816  | https://security-tracker.debian.org/tracker/CVE-2026-107816 
                       mariadb | CVE-2026-107818  | https://security-tracker.debian.org/tracker/CVE-2026-107818 
                       mariadb | CVE-2026-107817  | https://security-tracker.debian.org/tracker/CVE-2026-107817 
                       mariadb | CVE-2026-107815  | https://security-tracker.debian.org/tracker/CVE-2026-107815 
                       mariadb | CVE-2026-107821  | https://security-tracker.debian.org/tracker/CVE-2026-107821 
                mesa3d-headers | CVE-2026-40393   | https://security-tracker.debian.org/tracker/CVE-2026-40393  
                   micropython | CVE-2024-8947    | https://security-tracker.debian.org/tracker/CVE-2024-8947   
                   micropython | CVE-2026-1998    | https://security-tracker.debian.org/tracker/CVE-2026-1998   
                      minetest | CVE-2026-41196   | https://security-tracker.debian.org/tracker/CVE-2026-41196  
                      minidlna | CVE-2023-47430   | https://security-tracker.debian.org/tracker/CVE-2023-47430  
                  modsecurity2 | CVE-2026-52747   | https://security-tracker.debian.org/tracker/CVE-2026-52747  
                  modsecurity2 | CVE-2026-30923   | https://security-tracker.debian.org/tracker/CVE-2026-30923  
                         mp4v2 | CVE-2023-33719   | https://security-tracker.debian.org/tracker/CVE-2023-33719  
                         mp4v2 | CVE-2023-33716   | https://security-tracker.debian.org/tracker/CVE-2023-33716  
                         mupdf | CVE-2025-71382   | https://security-tracker.debian.org/tracker/CVE-2025-71382  
                         mupdf | CVE-2025-46206   | https://security-tracker.debian.org/tracker/CVE-2025-46206  
                         mupdf | CVE-2026-7233    | https://security-tracker.debian.org/tracker/CVE-2026-7233   
                         mupdf | CVE-2026-40505   | https://security-tracker.debian.org/tracker/CVE-2026-40505  
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                       netdata | CVE-2025-71385   | https://security-tracker.debian.org/tracker/CVE-2025-71385  
                       nghttp2 | CVE-2026-58055   | https://security-tracker.debian.org/tracker/CVE-2026-58055  
                          nmap | CVE-2026-58058   | https://security-tracker.debian.org/tracker/CVE-2026-58058  
                          ogre | CVE-2025-11017   | https://security-tracker.debian.org/tracker/CVE-2025-11017  
                          ogre | CVE-2025-11014   | https://security-tracker.debian.org/tracker/CVE-2025-11014  
                    open-iscsi | CVE-2020-13987   | https://security-tracker.debian.org/tracker/CVE-2020-13987  
                       opencv3 | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                       opencv3 | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       opencv3 | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                openfpgaloader | CVE-2026-35170   | https://security-tracker.debian.org/tracker/CVE-2026-35170  
                openfpgaloader | CVE-2026-35176   | https://security-tracker.debian.org/tracker/CVE-2026-35176  
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2023-51767   | https://security-tracker.debian.org/tracker/CVE-2023-51767  
                       openssh | CVE-2026-106587  | https://security-tracker.debian.org/tracker/CVE-2026-106587 
                       openssh | CVE-2026-106583  | https://security-tracker.debian.org/tracker/CVE-2026-106583 
                       openssh | CVE-2026-106582  | https://security-tracker.debian.org/tracker/CVE-2026-106582 
                       openssh | CVE-2026-106584  | https://security-tracker.debian.org/tracker/CVE-2026-106584 
                       openssh | CVE-2026-106553  | https://security-tracker.debian.org/tracker/CVE-2026-106553 
                       openssh | CVE-2026-106555  | https://security-tracker.debian.org/tracker/CVE-2026-106555 
                       openssh | CVE-2026-106585  | https://security-tracker.debian.org/tracker/CVE-2026-106585 
                       openssh | CVE-2026-106552  | https://security-tracker.debian.org/tracker/CVE-2026-106552 
                       openssh | CVE-2026-106586  | https://security-tracker.debian.org/tracker/CVE-2026-106586 
                       openssh | CVE-2026-73282   | https://security-tracker.debian.org/tracker/CVE-2026-73282  
                       openssh | CVE-2026-73281   | https://security-tracker.debian.org/tracker/CVE-2026-73281  
                       openssh | CVE-2026-73283   | https://security-tracker.debian.org/tracker/CVE-2026-73283  
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                   openvmtools | CVE-2014-4199    | https://security-tracker.debian.org/tracker/CVE-2014-4199   
                   openvmtools | CVE-2014-4200    | https://security-tracker.debian.org/tracker/CVE-2014-4200   
                   openvmtools | CVE-2022-31693   | https://security-tracker.debian.org/tracker/CVE-2022-31693  
                   openvmtools | CVE-2022-22943   | https://security-tracker.debian.org/tracker/CVE-2022-22943  
                   openvmtools | CVE-2023-20867   | https://security-tracker.debian.org/tracker/CVE-2023-20867  
                   openvmtools | CVE-2023-20900   | https://security-tracker.debian.org/tracker/CVE-2023-20900  
                   openvmtools | CVE-2023-34057   | https://security-tracker.debian.org/tracker/CVE-2023-34057  
                   openvmtools | CVE-2023-34058   | https://security-tracker.debian.org/tracker/CVE-2023-34058  
                         p7zip | CVE-2017-17969   | https://security-tracker.debian.org/tracker/CVE-2017-17969  
                         p7zip | CVE-2018-5996    | https://security-tracker.debian.org/tracker/CVE-2018-5996   
                        parsec | CVE-2018-6651    | https://security-tracker.debian.org/tracker/CVE-2018-6651   
                        parsec | CVE-2023-37250   | https://security-tracker.debian.org/tracker/CVE-2023-37250  
                         patch | CVE-2026-56289   | https://security-tracker.debian.org/tracker/CVE-2026-56289  
                         patch | CVE-2026-56288   | https://security-tracker.debian.org/tracker/CVE-2026-56288  
                          perl | CVE-2026-8376    | https://security-tracker.debian.org/tracker/CVE-2026-8376   
                          perl | CVE-2026-57432   | https://security-tracker.debian.org/tracker/CVE-2026-57432  
                          perl | CVE-2026-13221   | https://security-tracker.debian.org/tracker/CVE-2026-13221  
       perl-lwp-protocol-https | CVE-2014-3230    | https://security-tracker.debian.org/tracker/CVE-2014-3230   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                       proftpd | CVE-2026-53994   | https://security-tracker.debian.org/tracker/CVE-2026-53994  
                       proftpd | CVE-2026-35025   | https://security-tracker.debian.org/tracker/CVE-2026-35025  
                       proftpd | CVE-2026-63091   | https://security-tracker.debian.org/tracker/CVE-2026-63091  
                       proftpd | CVE-2026-63090   | https://security-tracker.debian.org/tracker/CVE-2026-63090  
                       prosody | CVE-2026-43506   | https://security-tracker.debian.org/tracker/CVE-2026-43506  
                       prosody | CVE-2026-43504   | https://security-tracker.debian.org/tracker/CVE-2026-43504  
                       prosody | CVE-2026-43505   | https://security-tracker.debian.org/tracker/CVE-2026-43505  
                       prosody | CVE-2026-43507   | https://security-tracker.debian.org/tracker/CVE-2026-43507  
                      protobuf | CVE-2026-0994    | https://security-tracker.debian.org/tracker/CVE-2026-0994   
                proxychains-ng | CVE-2025-34451   | https://security-tracker.debian.org/tracker/CVE-2025-34451  
                python-aiohttp | CVE-2025-69228   | https://security-tracker.debian.org/tracker/CVE-2025-69228  
                python-aiohttp | CVE-2025-69230   | https://security-tracker.debian.org/tracker/CVE-2025-69230  
                python-aiohttp | CVE-2025-69227   | https://security-tracker.debian.org/tracker/CVE-2025-69227  
                python-aiohttp | CVE-2025-69229   | https://security-tracker.debian.org/tracker/CVE-2025-69229  
                python-aiohttp | CVE-2025-69226   | https://security-tracker.debian.org/tracker/CVE-2025-69226  
                python-aiohttp | CVE-2025-69223   | https://security-tracker.debian.org/tracker/CVE-2025-69223  
                python-aiohttp | CVE-2025-69224   | https://security-tracker.debian.org/tracker/CVE-2025-69224  
                python-aiohttp | CVE-2025-69225   | https://security-tracker.debian.org/tracker/CVE-2025-69225  
                python-aiohttp | CVE-2026-47265   | https://security-tracker.debian.org/tracker/CVE-2026-47265  
                python-aiohttp | CVE-2026-22815   | https://security-tracker.debian.org/tracker/CVE-2026-22815  
                python-aiohttp | CVE-2026-54280   | https://security-tracker.debian.org/tracker/CVE-2026-54280  
                python-aiohttp | CVE-2026-54274   | https://security-tracker.debian.org/tracker/CVE-2026-54274  
                python-aiohttp | CVE-2026-54273   | https://security-tracker.debian.org/tracker/CVE-2026-54273  
                python-aiohttp | CVE-2026-54279   | https://security-tracker.debian.org/tracker/CVE-2026-54279  
                python-aiohttp | CVE-2026-54277   | https://security-tracker.debian.org/tracker/CVE-2026-54277  
                python-aiohttp | CVE-2026-54275   | https://security-tracker.debian.org/tracker/CVE-2026-54275  
                python-aiohttp | CVE-2026-54276   | https://security-tracker.debian.org/tracker/CVE-2026-54276  
                python-aiohttp | CVE-2026-54278   | https://security-tracker.debian.org/tracker/CVE-2026-54278  
                python-aiohttp | CVE-2026-34516   | https://security-tracker.debian.org/tracker/CVE-2026-34516  
                python-aiohttp | CVE-2026-34514   | https://security-tracker.debian.org/tracker/CVE-2026-34514  
                python-aiohttp | CVE-2026-34519   | https://security-tracker.debian.org/tracker/CVE-2026-34519  
                python-aiohttp | CVE-2026-34520   | https://security-tracker.debian.org/tracker/CVE-2026-34520  
                python-aiohttp | CVE-2026-34513   | https://security-tracker.debian.org/tracker/CVE-2026-34513  
                python-aiohttp | CVE-2026-34517   | https://security-tracker.debian.org/tracker/CVE-2026-34517  
                python-aiohttp | CVE-2026-34525   | https://security-tracker.debian.org/tracker/CVE-2026-34525  
                python-aiohttp | CVE-2026-34518   | https://security-tracker.debian.org/tracker/CVE-2026-34518  
                python-aiohttp | CVE-2026-34515   | https://security-tracker.debian.org/tracker/CVE-2026-34515  
                python-aiohttp | CVE-2026-34993   | https://security-tracker.debian.org/tracker/CVE-2026-34993  
                python-aiohttp | CVE-2026-50269   | https://security-tracker.debian.org/tracker/CVE-2026-50269  
               python-asyncssh | CVE-2026-45309   | https://security-tracker.debian.org/tracker/CVE-2026-45309  
           python-cryptography | CVE-2026-26007   | https://security-tracker.debian.org/tracker/CVE-2026-26007  
           python-cryptography | CVE-2026-34073   | https://security-tracker.debian.org/tracker/CVE-2026-34073  
                 python-django | CVE-2026-15920   | https://security-tracker.debian.org/tracker/CVE-2026-15920  
                 python-django | CVE-2026-48588   | https://security-tracker.debian.org/tracker/CVE-2026-48588  
                 python-django | CVE-2026-15830   | https://security-tracker.debian.org/tracker/CVE-2026-15830  
                 python-django | CVE-2026-15307   | https://security-tracker.debian.org/tracker/CVE-2026-15307  
                 python-django | CVE-2026-15337   | https://security-tracker.debian.org/tracker/CVE-2026-15337  
                 python-django | CVE-2026-53878   | https://security-tracker.debian.org/tracker/CVE-2026-53878  
                 python-django | CVE-2026-53877   | https://security-tracker.debian.org/tracker/CVE-2026-53877  
                 python-dotenv | CVE-2026-28684   | https://security-tracker.debian.org/tracker/CVE-2026-28684  
                  python-ecdsa | CVE-2026-33936   | https://security-tracker.debian.org/tracker/CVE-2026-33936  
               python-httplib2 | CVE-2026-59939   | https://security-tracker.debian.org/tracker/CVE-2026-59939  
                   python-lxml | CVE-2026-41066   | https://security-tracker.debian.org/tracker/CVE-2026-41066  
                   python-mako | CVE-2026-41205   | https://security-tracker.debian.org/tracker/CVE-2026-41205  
              python-multipart | CVE-2026-53538   | https://security-tracker.debian.org/tracker/CVE-2026-53538  
              python-multipart | CVE-2026-53540   | https://security-tracker.debian.org/tracker/CVE-2026-53540  
              python-multipart | CVE-2026-53539   | https://security-tracker.debian.org/tracker/CVE-2026-53539  
              python-multipart | CVE-2026-53537   | https://security-tracker.debian.org/tracker/CVE-2026-53537  
              python-multipart | CVE-2026-40347   | https://security-tracker.debian.org/tracker/CVE-2026-40347  
                 python-pillow | CVE-2026-54059   | https://security-tracker.debian.org/tracker/CVE-2026-54059  
                 python-pillow | CVE-2026-54058   | https://security-tracker.debian.org/tracker/CVE-2026-54058  
                 python-pillow | CVE-2026-54060   | https://security-tracker.debian.org/tracker/CVE-2026-54060  
                 python-pillow | CVE-2026-55379   | https://security-tracker.debian.org/tracker/CVE-2026-55379  
                 python-pillow | CVE-2026-55380   | https://security-tracker.debian.org/tracker/CVE-2026-55380  
                 python-pillow | CVE-2026-112390  | https://security-tracker.debian.org/tracker/CVE-2026-112390 
                 python-pillow | CVE-2026-112391  | https://security-tracker.debian.org/tracker/CVE-2026-112391 
                 python-pillow | CVE-2026-59199   | https://security-tracker.debian.org/tracker/CVE-2026-59199  
                 python-pillow | CVE-2026-59198   | https://security-tracker.debian.org/tracker/CVE-2026-59198  
                 python-pillow | CVE-2026-59197   | https://security-tracker.debian.org/tracker/CVE-2026-59197  
                 python-pillow | CVE-2026-40192   | https://security-tracker.debian.org/tracker/CVE-2026-40192  
                 python-pillow | CVE-2026-55798   | https://security-tracker.debian.org/tracker/CVE-2026-55798  
                 python-pillow | CVE-2026-42311   | https://security-tracker.debian.org/tracker/CVE-2026-42311  
                 python-pillow | CVE-2026-42310   | https://security-tracker.debian.org/tracker/CVE-2026-42310  
                 python-pillow | CVE-2026-42308   | https://security-tracker.debian.org/tracker/CVE-2026-42308  
                 python-pillow | CVE-2026-25990   | https://security-tracker.debian.org/tracker/CVE-2026-25990  
                 python-pillow | CVE-2026-59200   | https://security-tracker.debian.org/tracker/CVE-2026-59200  
                 python-pillow | CVE-2026-59205   | https://security-tracker.debian.org/tracker/CVE-2026-59205  
                 python-pillow | CVE-2026-59204   | https://security-tracker.debian.org/tracker/CVE-2026-59204  
                    python-pip | CVE-2026-8643    | https://security-tracker.debian.org/tracker/CVE-2026-8643   
                    python-pip | CVE-2026-13346   | https://security-tracker.debian.org/tracker/CVE-2026-13346  
                     python-py | CVE-2022-42969   | https://security-tracker.debian.org/tracker/CVE-2022-42969  
                  python-pyjwt | CVE-2026-102275  | https://security-tracker.debian.org/tracker/CVE-2026-102275 
                  python-pyjwt | CVE-2026-102271  | https://security-tracker.debian.org/tracker/CVE-2026-102271 
                  python-pyjwt | CVE-2026-102274  | https://security-tracker.debian.org/tracker/CVE-2026-102274 
                  python-pyjwt | CVE-2026-102269  | https://security-tracker.debian.org/tracker/CVE-2026-102269 
                  python-pyjwt | CVE-2026-102268  | https://security-tracker.debian.org/tracker/CVE-2026-102268 
                  python-pyjwt | CVE-2026-102267  | https://security-tracker.debian.org/tracker/CVE-2026-102267 
                  python-pyjwt | CVE-2026-102270  | https://security-tracker.debian.org/tracker/CVE-2026-102270 
                  python-pyjwt | CVE-2026-48522   | https://security-tracker.debian.org/tracker/CVE-2026-48522  
                  python-pyjwt | CVE-2026-48524   | https://security-tracker.debian.org/tracker/CVE-2026-48524  
                  python-pyjwt | CVE-2026-48526   | https://security-tracker.debian.org/tracker/CVE-2026-48526  
                  python-pyjwt | CVE-2026-48525   | https://security-tracker.debian.org/tracker/CVE-2026-48525  
                  python-pyjwt | CVE-2026-48523   | https://security-tracker.debian.org/tracker/CVE-2026-48523  
                  python-pyjwt | CVE-2026-103001  | https://security-tracker.debian.org/tracker/CVE-2026-103001 
                  python-pyjwt | CVE-2026-101917  | https://security-tracker.debian.org/tracker/CVE-2026-101917 
                  python-pyjwt | CVE-2026-101918  | https://security-tracker.debian.org/tracker/CVE-2026-101918 
             python-setuptools | CVE-2026-59890   | https://security-tracker.debian.org/tracker/CVE-2026-59890  
              python-starlette | CVE-2026-48818   | https://security-tracker.debian.org/tracker/CVE-2026-48818  
              python-starlette | CVE-2026-48817   | https://security-tracker.debian.org/tracker/CVE-2026-48817  
              python-starlette | CVE-2026-54282   | https://security-tracker.debian.org/tracker/CVE-2026-54282  
              python-starlette | CVE-2026-54283   | https://security-tracker.debian.org/tracker/CVE-2026-54283  
              python-starlette | CVE-2026-48710   | https://security-tracker.debian.org/tracker/CVE-2026-48710  
                python-tornado | CVE-2026-35536   | https://security-tracker.debian.org/tracker/CVE-2026-35536  
                python-tornado | CVE-2026-31958   | https://security-tracker.debian.org/tracker/CVE-2026-31958  
                python-urllib3 | CVE-2026-97688   | https://security-tracker.debian.org/tracker/CVE-2026-97688  
                python-urllib3 | CVE-2026-97689   | https://security-tracker.debian.org/tracker/CVE-2026-97689  
                python-urllib3 | CVE-2026-97687   | https://security-tracker.debian.org/tracker/CVE-2026-97687  
               python-werkzeug | CVE-2025-66221   | https://security-tracker.debian.org/tracker/CVE-2025-66221  
               python-werkzeug | CVE-2026-21860   | https://security-tracker.debian.org/tracker/CVE-2026-21860  
               python-werkzeug | CVE-2026-27199   | https://security-tracker.debian.org/tracker/CVE-2026-27199  
                       python3 | CVE-2025-13837   | https://security-tracker.debian.org/tracker/CVE-2025-13837  
                       python3 | CVE-2025-12781   | https://security-tracker.debian.org/tracker/CVE-2025-12781  
                       python3 | CVE-2025-13462   | https://security-tracker.debian.org/tracker/CVE-2025-13462  
                       python3 | CVE-2025-12084   | https://security-tracker.debian.org/tracker/CVE-2025-12084  
                       python3 | CVE-2026-7210    | https://security-tracker.debian.org/tracker/CVE-2026-7210   
                       python3 | CVE-2026-6019    | https://security-tracker.debian.org/tracker/CVE-2026-6019   
                       python3 | CVE-2026-3644    | https://security-tracker.debian.org/tracker/CVE-2026-3644   
                       python3 | CVE-2026-4519    | https://security-tracker.debian.org/tracker/CVE-2026-4519   
                       python3 | CVE-2026-3087    | https://security-tracker.debian.org/tracker/CVE-2026-3087   
                          qemu | CVE-2021-20255   | https://security-tracker.debian.org/tracker/CVE-2021-20255  
                          qemu | CVE-2023-1386    | https://security-tracker.debian.org/tracker/CVE-2023-1386   
                          qemu | CVE-2025-54566   | https://security-tracker.debian.org/tracker/CVE-2025-54566  
                          qemu | CVE-2025-54567   | https://security-tracker.debian.org/tracker/CVE-2025-54567  
                       qt5base | CVE-2025-30348   | https://security-tracker.debian.org/tracker/CVE-2025-30348  
                       qt6base | CVE-2025-5683    | https://security-tracker.debian.org/tracker/CVE-2025-5683   
                qt6declarative | CVE-2025-14576   | https://security-tracker.debian.org/tracker/CVE-2025-14576  
                        ranger | CVE-2024-55532   | https://security-tracker.debian.org/tracker/CVE-2024-55532  
                        ranger | CVE-2025-59059   | https://security-tracker.debian.org/tracker/CVE-2025-59059  
                        ranger | CVE-2025-59060   | https://security-tracker.debian.org/tracker/CVE-2025-59060  
                        ranger | CVE-2026-65948   | https://security-tracker.debian.org/tracker/CVE-2026-65948  
                        ranger | CVE-2026-65945   | https://security-tracker.debian.org/tracker/CVE-2026-65945  
                        ranger | CVE-2026-65942   | https://security-tracker.debian.org/tracker/CVE-2026-65942  
                        ranger | CVE-2026-28672   | https://security-tracker.debian.org/tracker/CVE-2026-28672  
                        ranger | CVE-2026-42537   | https://security-tracker.debian.org/tracker/CVE-2026-42537  
                        ranger | CVE-2026-40920   | https://security-tracker.debian.org/tracker/CVE-2026-40920  
                        ranger | CVE-2026-55799   | https://security-tracker.debian.org/tracker/CVE-2026-55799  
                        ranger | CVE-2026-55814   | https://security-tracker.debian.org/tracker/CVE-2026-55814  
                        ranger | CVE-2026-44416   | https://security-tracker.debian.org/tracker/CVE-2026-44416  
                        ranger | CVE-2026-32227   | https://security-tracker.debian.org/tracker/CVE-2026-32227  
                         redis | CVE-2026-23479   | https://security-tracker.debian.org/tracker/CVE-2026-23479  
                         redis | CVE-2026-25243   | https://security-tracker.debian.org/tracker/CVE-2026-25243  
                         redis | CVE-2026-23631   | https://security-tracker.debian.org/tracker/CVE-2026-23631  
                          runc | CVE-2026-41579   | https://security-tracker.debian.org/tracker/CVE-2026-41579  
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2026-2340    | https://security-tracker.debian.org/tracker/CVE-2026-2340   
                           sdl | CVE-2019-7575    | https://security-tracker.debian.org/tracker/CVE-2019-7575   
                           sdl | CVE-2019-7573    | https://security-tracker.debian.org/tracker/CVE-2019-7573   
                           sdl | CVE-2019-7574    | https://security-tracker.debian.org/tracker/CVE-2019-7574   
                           sdl | CVE-2019-7576    | https://security-tracker.debian.org/tracker/CVE-2019-7576   
                           sdl | CVE-2019-7578    | https://security-tracker.debian.org/tracker/CVE-2019-7578   
                           sdl | CVE-2019-7572    | https://security-tracker.debian.org/tracker/CVE-2019-7572   
                           sdl | CVE-2019-7577    | https://security-tracker.debian.org/tracker/CVE-2019-7577   
                           sdl | CVE-2019-7637    | https://security-tracker.debian.org/tracker/CVE-2019-7637   
                           sdl | CVE-2019-7636    | https://security-tracker.debian.org/tracker/CVE-2019-7636   
                           sdl | CVE-2019-7635    | https://security-tracker.debian.org/tracker/CVE-2019-7635   
                           sdl | CVE-2019-7638    | https://security-tracker.debian.org/tracker/CVE-2019-7638   
                           sdl | CVE-2019-14906   | https://security-tracker.debian.org/tracker/CVE-2019-14906  
                           sdl | CVE-2019-13616   | https://security-tracker.debian.org/tracker/CVE-2019-13616  
                    sdl2_image | CVE-2026-35444   | https://security-tracker.debian.org/tracker/CVE-2026-35444  
                     sdl_image | CVE-2026-35444   | https://security-tracker.debian.org/tracker/CVE-2026-35444  
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         squid | CVE-2026-32748   | https://security-tracker.debian.org/tracker/CVE-2026-32748  
                    strongswan | CVE-2026-78132   | https://security-tracker.debian.org/tracker/CVE-2026-78132  
                    strongswan | CVE-2026-78126   | https://security-tracker.debian.org/tracker/CVE-2026-78126  
                    strongswan | CVE-2026-78131   | https://security-tracker.debian.org/tracker/CVE-2026-78131  
                    strongswan | CVE-2026-78123   | https://security-tracker.debian.org/tracker/CVE-2026-78123  
                    strongswan | CVE-2026-78135   | https://security-tracker.debian.org/tracker/CVE-2026-78135  
                    strongswan | CVE-2026-78134   | https://security-tracker.debian.org/tracker/CVE-2026-78134  
                    strongswan | CVE-2026-78124   | https://security-tracker.debian.org/tracker/CVE-2026-78124  
                    strongswan | CVE-2026-78127   | https://security-tracker.debian.org/tracker/CVE-2026-78127  
                    strongswan | CVE-2026-78130   | https://security-tracker.debian.org/tracker/CVE-2026-78130  
                    strongswan | CVE-2026-78129   | https://security-tracker.debian.org/tracker/CVE-2026-78129  
                      suricata | CVE-2024-47187   | https://security-tracker.debian.org/tracker/CVE-2024-47187  
                      suricata | CVE-2024-47188   | https://security-tracker.debian.org/tracker/CVE-2024-47188  
                      suricata | CVE-2024-45795   | https://security-tracker.debian.org/tracker/CVE-2024-45795  
                      suricata | CVE-2024-45796   | https://security-tracker.debian.org/tracker/CVE-2024-45796  
                      suricata | CVE-2024-55629   | https://security-tracker.debian.org/tracker/CVE-2024-55629  
                      suricata | CVE-2024-55605   | https://security-tracker.debian.org/tracker/CVE-2024-55605  
                      suricata | CVE-2024-55626   | https://security-tracker.debian.org/tracker/CVE-2024-55626  
                      suricata | CVE-2024-55627   | https://security-tracker.debian.org/tracker/CVE-2024-55627  
                      suricata | CVE-2024-55628   | https://security-tracker.debian.org/tracker/CVE-2024-55628  
                      suricata | CVE-2024-47522   | https://security-tracker.debian.org/tracker/CVE-2024-47522  
                      suricata | CVE-2024-38536   | https://security-tracker.debian.org/tracker/CVE-2024-38536  
                      suricata | CVE-2024-38534   | https://security-tracker.debian.org/tracker/CVE-2024-38534  
                      suricata | CVE-2025-53538   | https://security-tracker.debian.org/tracker/CVE-2025-53538  
                      suricata | CVE-2025-29915   | https://security-tracker.debian.org/tracker/CVE-2025-29915  
                      suricata | CVE-2025-29918   | https://security-tracker.debian.org/tracker/CVE-2025-29918  
                      suricata | CVE-2025-29916   | https://security-tracker.debian.org/tracker/CVE-2025-29916  
                      suricata | CVE-2025-29917   | https://security-tracker.debian.org/tracker/CVE-2025-29917  
                      suricata | CVE-2025-64344   | https://security-tracker.debian.org/tracker/CVE-2025-64344  
                      suricata | CVE-2025-64332   | https://security-tracker.debian.org/tracker/CVE-2025-64332  
                      suricata | CVE-2025-64333   | https://security-tracker.debian.org/tracker/CVE-2025-64333  
                      suricata | CVE-2025-64330   | https://security-tracker.debian.org/tracker/CVE-2025-64330  
                      suricata | CVE-2025-64331   | https://security-tracker.debian.org/tracker/CVE-2025-64331  
                      suricata | CVE-2025-59147   | https://security-tracker.debian.org/tracker/CVE-2025-59147  
                      suricata | CVE-2026-57223   | https://security-tracker.debian.org/tracker/CVE-2026-57223  
                      suricata | CVE-2026-57222   | https://security-tracker.debian.org/tracker/CVE-2026-57222  
                      suricata | CVE-2026-57226   | https://security-tracker.debian.org/tracker/CVE-2026-57226  
                      suricata | CVE-2026-22264   | https://security-tracker.debian.org/tracker/CVE-2026-22264  
                      suricata | CVE-2026-22259   | https://security-tracker.debian.org/tracker/CVE-2026-22259  
                      suricata | CVE-2026-22262   | https://security-tracker.debian.org/tracker/CVE-2026-22262  
                      suricata | CVE-2026-22258   | https://security-tracker.debian.org/tracker/CVE-2026-22258  
                      suricata | CVE-2026-22261   | https://security-tracker.debian.org/tracker/CVE-2026-22261  
                      suricata | CVE-2026-94083   | https://security-tracker.debian.org/tracker/CVE-2026-94083  
                      suricata | CVE-2026-94084   | https://security-tracker.debian.org/tracker/CVE-2026-94084  
                      suricata | CVE-2026-46387   | https://security-tracker.debian.org/tracker/CVE-2026-46387  
                      suricata | CVE-2026-63450   | https://security-tracker.debian.org/tracker/CVE-2026-63450  
                      suricata | CVE-2026-63448   | https://security-tracker.debian.org/tracker/CVE-2026-63448  
                      suricata | CVE-2026-45747   | https://security-tracker.debian.org/tracker/CVE-2026-45747  
                      suricata | CVE-2026-45751   | https://security-tracker.debian.org/tracker/CVE-2026-45751  
                      suricata | CVE-2026-45762   | https://security-tracker.debian.org/tracker/CVE-2026-45762  
                      suricata | CVE-2026-71855   | https://security-tracker.debian.org/tracker/CVE-2026-71855  
                      suricata | CVE-2026-31932   | https://security-tracker.debian.org/tracker/CVE-2026-31932  
                      suricata | CVE-2026-31935   | https://security-tracker.debian.org/tracker/CVE-2026-31935  
                      suricata | CVE-2026-31937   | https://security-tracker.debian.org/tracker/CVE-2026-31937  
                      suricata | CVE-2026-31933   | https://security-tracker.debian.org/tracker/CVE-2026-31933  
                     syslog-ng | CVE-2022-38725   | https://security-tracker.debian.org/tracker/CVE-2022-38725  
                       systemd | CVE-2026-40226   | https://security-tracker.debian.org/tracker/CVE-2026-40226  
                       systemd | CVE-2026-40225   | https://security-tracker.debian.org/tracker/CVE-2026-40225  
                       systemd | CVE-2026-29111   | https://security-tracker.debian.org/tracker/CVE-2026-29111  
                           tar | CVE-2026-18508   | https://security-tracker.debian.org/tracker/CVE-2026-18508  
                           tar | CVE-2026-18477   | https://security-tracker.debian.org/tracker/CVE-2026-18477  
                   timescaledb | CVE-2026-70633   | https://security-tracker.debian.org/tracker/CVE-2026-70633  
                   timescaledb | CVE-2026-70635   | https://security-tracker.debian.org/tracker/CVE-2026-70635  
                   timescaledb | CVE-2026-70634   | https://security-tracker.debian.org/tracker/CVE-2026-70634  
                     tinyproxy | CVE-2026-31842   | https://security-tracker.debian.org/tracker/CVE-2026-31842  
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                   uboot-tools | CVE-2022-2347    | https://security-tracker.debian.org/tracker/CVE-2022-2347   
                   uboot-tools | CVE-2022-30767   | https://security-tracker.debian.org/tracker/CVE-2022-30767  
                   uboot-tools | CVE-2022-33103   | https://security-tracker.debian.org/tracker/CVE-2022-33103  
                   uboot-tools | CVE-2022-34835   | https://security-tracker.debian.org/tracker/CVE-2022-34835  
                   uboot-tools | CVE-2024-42040   | https://security-tracker.debian.org/tracker/CVE-2024-42040  
                   uboot-tools | CVE-2024-57259   | https://security-tracker.debian.org/tracker/CVE-2024-57259  
                   uboot-tools | CVE-2024-57254   | https://security-tracker.debian.org/tracker/CVE-2024-57254  
                   uboot-tools | CVE-2024-57257   | https://security-tracker.debian.org/tracker/CVE-2024-57257  
                   uboot-tools | CVE-2024-57258   | https://security-tracker.debian.org/tracker/CVE-2024-57258  
                   uboot-tools | CVE-2024-57255   | https://security-tracker.debian.org/tracker/CVE-2024-57255  
                   uboot-tools | CVE-2024-57256   | https://security-tracker.debian.org/tracker/CVE-2024-57256  
                   uboot-tools | CVE-2026-29009   | https://security-tracker.debian.org/tracker/CVE-2026-29009  
                   uboot-tools | CVE-2026-29008   | https://security-tracker.debian.org/tracker/CVE-2026-29008  
                   uboot-tools | CVE-2026-29007   | https://security-tracker.debian.org/tracker/CVE-2026-29007  
                   uboot-tools | CVE-2026-46728   | https://security-tracker.debian.org/tracker/CVE-2026-46728  
                         unrar | CVE-2022-30333   | https://security-tracker.debian.org/tracker/CVE-2022-30333  
                           upx | CVE-2023-23456   | https://security-tracker.debian.org/tracker/CVE-2023-23456  
                           upx | CVE-2023-23457   | https://security-tracker.debian.org/tracker/CVE-2023-23457  
                           upx | CVE-2024-3209    | https://security-tracker.debian.org/tracker/CVE-2024-3209   
                           upx | CVE-2025-2849    | https://security-tracker.debian.org/tracker/CVE-2025-2849   
               util-linux-libs | CVE-2026-13595   | https://security-tracker.debian.org/tracker/CVE-2026-13595  
               util-linux-libs | CVE-2026-27456   | https://security-tracker.debian.org/tracker/CVE-2026-27456  
                          wget | CVE-2026-58472   | https://security-tracker.debian.org/tracker/CVE-2026-58472  
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2021-28697   | https://security-tracker.debian.org/tracker/CVE-2021-28697  
                           xen | CVE-2021-28696   | https://security-tracker.debian.org/tracker/CVE-2021-28696  
                           xen | CVE-2021-28695   | https://security-tracker.debian.org/tracker/CVE-2021-28695  
                           xen | CVE-2021-28693   | https://security-tracker.debian.org/tracker/CVE-2021-28693  
                           xen | CVE-2021-28698   | https://security-tracker.debian.org/tracker/CVE-2021-28698  
                           xen | CVE-2021-28699   | https://security-tracker.debian.org/tracker/CVE-2021-28699  
                           xen | CVE-2021-28694   | https://security-tracker.debian.org/tracker/CVE-2021-28694  
                           xen | CVE-2021-28690   | https://security-tracker.debian.org/tracker/CVE-2021-28690  
                           xen | CVE-2021-28687   | https://security-tracker.debian.org/tracker/CVE-2021-28687  
                           xen | CVE-2021-28692   | https://security-tracker.debian.org/tracker/CVE-2021-28692  
                           xen | CVE-2021-28707   | https://security-tracker.debian.org/tracker/CVE-2021-28707  
                           xen | CVE-2021-28700   | https://security-tracker.debian.org/tracker/CVE-2021-28700  
                           xen | CVE-2021-28708   | https://security-tracker.debian.org/tracker/CVE-2021-28708  
                           xen | CVE-2021-28701   | https://security-tracker.debian.org/tracker/CVE-2021-28701  
                           xen | CVE-2021-28704   | https://security-tracker.debian.org/tracker/CVE-2021-28704  
                           xen | CVE-2021-28703   | https://security-tracker.debian.org/tracker/CVE-2021-28703  
                           xen | CVE-2021-28702   | https://security-tracker.debian.org/tracker/CVE-2021-28702  
                           xen | CVE-2021-26313   | https://security-tracker.debian.org/tracker/CVE-2021-26313  
                           xen | CVE-2021-26314   | https://security-tracker.debian.org/tracker/CVE-2021-26314  
                           xen | CVE-2022-26357   | https://security-tracker.debian.org/tracker/CVE-2022-26357  
                           xen | CVE-2022-26363   | https://security-tracker.debian.org/tracker/CVE-2022-26363  
                           xen | CVE-2022-26364   | https://security-tracker.debian.org/tracker/CVE-2022-26364  
                           xen | CVE-2022-26362   | https://security-tracker.debian.org/tracker/CVE-2022-26362  
                           xen | CVE-2022-23033   | https://security-tracker.debian.org/tracker/CVE-2022-23033  
                           xen | CVE-2022-23035   | https://security-tracker.debian.org/tracker/CVE-2022-23035  
                           xen | CVE-2022-21125   | https://security-tracker.debian.org/tracker/CVE-2022-21125  
                           xen | CVE-2022-21166   | https://security-tracker.debian.org/tracker/CVE-2022-21166  
                           xen | CVE-2022-21123   | https://security-tracker.debian.org/tracker/CVE-2022-21123  
                           xen | CVE-2022-21127   | https://security-tracker.debian.org/tracker/CVE-2022-21127  
                           xen | CVE-2022-42332   | https://security-tracker.debian.org/tracker/CVE-2022-42332  
                           xen | CVE-2022-42324   | https://security-tracker.debian.org/tracker/CVE-2022-42324  
                           xen | CVE-2022-42319   | https://security-tracker.debian.org/tracker/CVE-2022-42319  
                           xen | CVE-2022-42325   | https://security-tracker.debian.org/tracker/CVE-2022-42325  
                           xen | CVE-2022-42331   | https://security-tracker.debian.org/tracker/CVE-2022-42331  
                           xen | CVE-2022-42326   | https://security-tracker.debian.org/tracker/CVE-2022-42326  
                           xen | CVE-2022-42333   | https://security-tracker.debian.org/tracker/CVE-2022-42333  
                           xen | CVE-2022-42334   | https://security-tracker.debian.org/tracker/CVE-2022-42334  
                           xen | CVE-2022-33746   | https://security-tracker.debian.org/tracker/CVE-2022-33746  
                           xen | CVE-2022-33747   | https://security-tracker.debian.org/tracker/CVE-2022-33747  
                           xen | CVE-2022-33745   | https://security-tracker.debian.org/tracker/CVE-2022-33745  
                           xen | CVE-2022-33748   | https://security-tracker.debian.org/tracker/CVE-2022-33748  
                           xen | CVE-2023-46839   | https://security-tracker.debian.org/tracker/CVE-2023-46839  
                           xen | CVE-2023-46842   | https://security-tracker.debian.org/tracker/CVE-2023-46842  
                           xen | CVE-2023-46836   | https://security-tracker.debian.org/tracker/CVE-2023-46836  
                           xen | CVE-2023-46841   | https://security-tracker.debian.org/tracker/CVE-2023-46841  
                           xen | CVE-2023-46835   | https://security-tracker.debian.org/tracker/CVE-2023-46835  
                           xen | CVE-2023-46837   | https://security-tracker.debian.org/tracker/CVE-2023-46837  
                           xen | CVE-2023-34322   | https://security-tracker.debian.org/tracker/CVE-2023-34322  
                           xen | CVE-2023-34325   | https://security-tracker.debian.org/tracker/CVE-2023-34325  
                           xen | CVE-2023-34320   | https://security-tracker.debian.org/tracker/CVE-2023-34320  
                           xen | CVE-2023-34319   | https://security-tracker.debian.org/tracker/CVE-2023-34319  
                           xen | CVE-2023-34323   | https://security-tracker.debian.org/tracker/CVE-2023-34323  
                           xen | CVE-2023-34326   | https://security-tracker.debian.org/tracker/CVE-2023-34326  
                           xen | CVE-2023-34327   | https://security-tracker.debian.org/tracker/CVE-2023-34327  
                           xen | CVE-2023-34321   | https://security-tracker.debian.org/tracker/CVE-2023-34321  
                           xen | CVE-2024-31142   | https://security-tracker.debian.org/tracker/CVE-2024-31142  
                           xen | CVE-2024-31143   | https://security-tracker.debian.org/tracker/CVE-2024-31143  
                           xen | CVE-2024-31145   | https://security-tracker.debian.org/tracker/CVE-2024-31145  
                           xen | CVE-2024-45817   | https://security-tracker.debian.org/tracker/CVE-2024-45817  
                           xen | CVE-2024-45819   | https://security-tracker.debian.org/tracker/CVE-2024-45819  
                           xen | CVE-2024-45818   | https://security-tracker.debian.org/tracker/CVE-2024-45818  
                           xen | CVE-2025-27465   | https://security-tracker.debian.org/tracker/CVE-2025-27465  
                           xen | CVE-2025-27466   | https://security-tracker.debian.org/tracker/CVE-2025-27466  
                           xen | CVE-2025-58143   | https://security-tracker.debian.org/tracker/CVE-2025-58143  
                           xen | CVE-2025-58145   | https://security-tracker.debian.org/tracker/CVE-2025-58145  
                           xen | CVE-2025-58142   | https://security-tracker.debian.org/tracker/CVE-2025-58142  
                           xen | CVE-2025-58144   | https://security-tracker.debian.org/tracker/CVE-2025-58144  
                           xen | CVE-2025-58149   | https://security-tracker.debian.org/tracker/CVE-2025-58149  
                           xen | CVE-2025-1713    | https://security-tracker.debian.org/tracker/CVE-2025-1713   
                           xen | CVE-2026-23558   | https://security-tracker.debian.org/tracker/CVE-2026-23558  
                           xen | CVE-2026-23553   | https://security-tracker.debian.org/tracker/CVE-2026-23553  
                           xen | CVE-2026-23557   | https://security-tracker.debian.org/tracker/CVE-2026-23557  
           xserver_xorg-server | CVE-2023-5574    | https://security-tracker.debian.org/tracker/CVE-2023-5574   
           xserver_xorg-server | CVE-2026-56000   | https://security-tracker.debian.org/tracker/CVE-2026-56000  
           xserver_xorg-server | CVE-2026-55999   | https://security-tracker.debian.org/tracker/CVE-2026-55999  
                          yajl | CVE-2023-33460   | https://security-tracker.debian.org/tracker/CVE-2023-33460  
                          yasm | CVE-2021-33464   | https://security-tracker.debian.org/tracker/CVE-2021-33464  
                          yasm | CVE-2021-33467   | https://security-tracker.debian.org/tracker/CVE-2021-33467  
                          yasm | CVE-2021-33455   | https://security-tracker.debian.org/tracker/CVE-2021-33455  
                          yasm | CVE-2021-33458   | https://security-tracker.debian.org/tracker/CVE-2021-33458  
                          yasm | CVE-2021-33461   | https://security-tracker.debian.org/tracker/CVE-2021-33461  
                          yasm | CVE-2021-33457   | https://security-tracker.debian.org/tracker/CVE-2021-33457  
                          yasm | CVE-2021-33465   | https://security-tracker.debian.org/tracker/CVE-2021-33465  
                          yasm | CVE-2021-33460   | https://security-tracker.debian.org/tracker/CVE-2021-33460  
                          yasm | CVE-2021-33462   | https://security-tracker.debian.org/tracker/CVE-2021-33462  
                          yasm | CVE-2021-33463   | https://security-tracker.debian.org/tracker/CVE-2021-33463  
                          yasm | CVE-2021-33466   | https://security-tracker.debian.org/tracker/CVE-2021-33466  
                          yasm | CVE-2021-33468   | https://security-tracker.debian.org/tracker/CVE-2021-33468  
                          yasm | CVE-2021-33456   | https://security-tracker.debian.org/tracker/CVE-2021-33456  
                          yasm | CVE-2021-33459   | https://security-tracker.debian.org/tracker/CVE-2021-33459  
                          yasm | CVE-2023-51258   | https://security-tracker.debian.org/tracker/CVE-2023-51258  
                          yasm | CVE-2023-31973   | https://security-tracker.debian.org/tracker/CVE-2023-31973  
                          yasm | CVE-2023-31974   | https://security-tracker.debian.org/tracker/CVE-2023-31974  
                          yasm | CVE-2023-31972   | https://security-tracker.debian.org/tracker/CVE-2023-31972  
                          zeek | CVE-2026-60109   | https://security-tracker.debian.org/tracker/CVE-2026-60109  
                          zeek | CVE-2026-60108   | https://security-tracker.debian.org/tracker/CVE-2026-60108  


-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
