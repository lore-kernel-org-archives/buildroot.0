Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5D2606A326
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 04:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qPafcdTy;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=swxkn/8w
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A99581335;
	Sat,  7 Nov 2026 04:30:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aEKVEXkuEDzE; Sat,  7 Nov 2026 04:29:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 67F2D81336
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794025797;
	b=slzY0y2ukGrrFutlui6y34f7hy21C580MDpMcJylhvDRxFcluGK3ULGIsVybxjWaDQOD
	 Bn6ExsXhX0AD7cU+JT06An2seMK+bQxGqpNqUovjJ/A7Jz40Xlk5/VlbO1u2mHUbXE0Of
	 Z7+POz2omqTQqGvGtzcCw66tWP6hQvxulvFez5QyitqqBcNRMRVTtelFdJIHrG9WvOwtu
	 ILVRngYocbpmJ+n0kl6MqBSy4R2mz/pqJQZ8gkPsHkBMmNQLKbT42fjepWnyXCrq2DRL1
	 rbbbJz6/lv8dfq9MgB8J9XPanMeJEzirWVYwY7MpeTHm7q9QrIloAARHlCBl16o8Yyw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794025797;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=pz7wvkO6jHj4xfO/HsOfoh1cTmb/e/dT0TglCqNEP6Q=;
	b=GxRq8trrfq2kgaU++V9Y+pdDaYpr9DKrjZ/rizTzZ4y6jXO1DkeACERUgXOD4fe3pK4H
	 3GlZkCBgy4MqLGVRnJqm1I8bwHrhJWkTCYvJO7onsa8V7+U/p947MoKfTCMEHG2J+/wED
	 M6rKr9qyIi9i5jZD3Hi7GrrGtZp7PFI9YrqFELQyZRBKHL8/XQKNxZtNoJ/cwrY4cBHh3
	 BWL4engOmfGSrEMElU8LQXfHHvs6tqdjN+k320wWbBt2z4XtftIxt78sW2+mec2hPS/Bp
	 3PsElDAcuv+zfMUYU/8UB+skfB9YXQZV6HBY0CZhqfgQMkwWKTmvxZGNUDWxTSxLgbQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794025797;
	bh=pz7wvkO6jHj4xfO/HsOfoh1cTmb/e/dT0TglCqNEP6Q=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qPafcdTypwkDghjpUHutnT6MWm/BF0x5+1jPsK5z6irLTEYhJYJHvz318RMxBM2r+
	 a5qYxdaDTQBoQcwJSRC+v6y0+CmRYxW1BkDh5mX0bTPs8EIijvqHXdb1x71cyGdWdq
	 yudPxVnYa00SlPeEZpbV5taDsrstQYO1qRqsIkiNDvcy3/xyBb4nSYyIwLUOJK1NIw
	 Ux0dSyKEcaznN0y43r8bLkdGRcclLGW+RrjaooBfDxUJXoQYt4p6bp4asIrLoLtwkb
	 kp9PlJujzEw/xeTpOVA93X9BUYabQAmPcHnaCH32zaKU5mfNatCO/sdlUbRwzsRi7v
	 XRj3x0rcuAIRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67F2D81336;
	Sat,  7 Nov 2026 04:29:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3213332A
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 04:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17BB540699
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 04:29:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 45CZFkN7JovK for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 04:29:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 995654062F
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::333"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=swxkn/8w
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 995654062F
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 04:29:52 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4a140e7405dso12585475e9.3
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 20:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794025791; x=1794630591; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=5q6FlOCyLGqYaqOIFs7nHOIVs3a3CpXjT5zmFc0RLAE=;
 b=swxkn/8wYmCD0EyijxVFgswv8jK8s6Yd/FZyz3JKyKt6WdTbi4t5hJPAneclNbdG2T
 fvRBPK5P8nMIB3NEbN0TepImZoBtisDHG1gIxVR6Skiu0YZnguJb/ZB92REkCXg86gEw
 zeE64ym0VUDepB+AML20wd6bAAneVq0k3g1cmW/3+mIz4v4xMPUEydewXEn4MsLh1C4f
 tGlDOIcL8DwGbpW/bDHYPhhW2by0dJJp0qSDgrju5snEQ8UHQYzzQSDgOJdkgKf4qbTW
 nj2+I8xYSA4FRiGCCRrKB1llyZfqb1/iev1cufZRI0i8i3utQGC2UbhGgCVXsz6EV8NZ
 jrhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794025791; x=1794630591;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=5q6FlOCyLGqYaqOIFs7nHOIVs3a3CpXjT5zmFc0RLAE=;
 b=j97wpu+ZdlVhCShSSwowqaGrsjVQddnlPWUzxdL6VJ44K6nUjsd6gIxQ+OsGxwNT0G
 k2slRev2YkPo3HtILKFOt+wx8Dnab6CeeOmhgAJfp4BpQGC/7eEmsh6oKhoq7x6FIb5J
 U+BRizbgfTZGRuChalmouVQ0wIwEpZ4hvo8fngAbposNtwE+4IZYeQMdrt7V4YbTNjZE
 lYIgWaHHTjh5m+T61v3WVr+3XubZu0NQzu4e2tprsfOElezlKV2P/Ro5i2l8rKJpRWkT
 wxmhyioVQ3D7AmEgR0Ua9tTRD2Zj9nrv4lnL+IFAZxehjz2I6Xa12ZvhthraHn2h5xsf
 r8+A==
X-Gm-Message-State: APuU4Z/lB7S3ogFxI7gvBfwyZw3PixYKO7DmippvSDhMKTExXc/AievS
 uH1NsATWWs1cW03t78ae82bDvJQZ+/a6FBNjpayoapWvWTe79308kyFY+I3nypLO
X-Gm-Gg: AYBFou2ijcwVO676fmsIBBe2em8zG3L+v+LdmTAwLIrzGADpC/Eo9w8j+o7COnfq1kt
 0MIFWQj1/T1zUON9AX3V/iMJ0Qej2IvMJPtsQkb4u1OloMxEy+/XzNKymtOTYVmmiLI5BNwuirU
 kxUYIYbk9U8BOSB7T+CzArYE2nYq2ZJaq1iyKEaxREgH5UFH384rluVPT+5NRTiVbJxXxz5/r5P
 uZiP7MgFmsZAgSktuo/T1XZ81ToaEynS4P5s7dm+j5q3JCRhlqZH9IvWcm9HZEs2SEBvHVSh/4M
 bvzczy3IcTFDlrEcY5AeFBT1ZnQ9B6FZK/Huz9z+cq0QmeO/LmoiYBIXp6l+krmyy0a5/CJZK2p
 33d1rYUEmTMGiMVXRdDXeVS0acwqhxhUjDf8J+02EAaJa482d9e/z9UcwzFkOpXAri55cD9RPui
 egykGnuEBlL04vcE33pHXyE4BVsqnXzCLi7AJt7oiZ8flZf/+huL+gmTQvptjjhEOSzeqOWB1Q9
 swDhRUTN3EGvSpt04DU/gkqZ8d0riWxYq1AkQu6i7mOtFdeWy/glPPUOgrhsHzJm5O1brub65av
 NT9fEPIjlA17DNuDBwma+FJTpGYrHS9spg27
X-Received: by 2002:a05:600c:5294:b0:4a7:a309:6b73 with SMTP id
 5b1f17b1804b1-4b6db0d0823mr72288245e9.1.1794025790313; 
 Fri, 06 Nov 2026 20:29:50 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b7e6eca30asm33855575e9.7.2026.11.06.20.29.49
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 20:29:49 -0800 (PST)
Message-ID: <6aeea93d.0f9a9df6.29d1aa.4d06@mx.google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 07 Nov 2026 04:29:49 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-11-06
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

Autobuild statistics for 2026-11-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  9  | 10  |  0  | 19  |
  2026.05.x  |  2  |  8  |  0  | 10  |
  2026.08.x  |  2  |  4  |  0  |  6  |
    master   | 70  | 177 |  0  | 247 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 16
                   bird-2.15.1 | 8 
                 glibmm-2.76.0 | 7 
                   perl-5.42.3 | 7 
                  ffmpeg-7.0.3 | 4 
                cryptopp-8.9.0 | 3 
             dahdi-linux-3.3.0 | 3 
             fswebcam-20200725 | 3 
             glibmm2_66-2.66.8 | 3 
               harfbuzz-15.0.0 | 3 
    host-mender-artifact-4.4.2 | 3 
                host-odb-2.4.0 | 3 
               libglib2-2.90.1 | 3 
                    lua-ev-1.5 | 3 
 qcom-db410c-firmware-1034.2.1 | 3 
                 xenomai-3.2.5 | 3 
                    attr-2.6.0 | 2 
                        chawan | 2 
                  chawan-0.5.1 | 2 
        edk2-edk2-stable202608 | 2 
firmware-utils-c42a3bc53da8... | 2 
                 host-gdb-15.2 | 2 
      host-uboot-tools-2026.07 | 2 
kvmtool-7ad32e5514aca2b6d19... | 2 
             librdkafka-2.16.0 | 2 
               linux-pam-1.7.2 | 2 
                      mksh-59c | 2 
                    musl-1.2.6 | 2 
                    opus-1.6.1 | 2 
             parsec-tool-0.7.0 | 2 
raw2rgbpnm-f28b903ca63b4c22... | 2 
rtmpdump-6f6bb1353fc84f4cc3... | 2 
              skalibs-2.14.3.0 | 2 
               tcf-agent-1.8.0 | 2 
           uboot-tools-2026.07 | 2 
                 uclibc-1.0.59 | 2 
am33x-cm3-fb484c5e54f2e31cf... | 1 
                 apache-2.4.69 | 1 
                apr-util-1.6.5 | 1 
                  boinc-8.2.11 | 1 
                bpftool-v7.5.0 | 1 
                 cdrkit-1.1.11 | 1 
              containerd-2.3.7 | 1 
cpuinfo-8a1772a0c5c447df2d1... | 1 
                 dovecot-2.4.5 | 1 
            dt-utils-2023.11.0 | 1 
                     ed-1.22.5 | 1 
                    fmt-12.2.0 | 1 
fs/btrfs/btrfs.mk:55: /home... | 1 
fs/cloop/cloop.mk:33: /home... | 1 
fs/cloop/cloop.mk:33: /home... | 1 
            gdk-pixbuf-2.42.12 | 1 
hare-dbus-e9a89f8bc5ce783fa... | 1 
              host-bison-3.8.2 | 1 
       host-gcc-initial-15.3.0 | 1 
            host-go-src-1.27.3 | 1 
          host-mosquitto-2.1.2 | 1 
              host-rust-1.99.1 | 1 
          host-xfsprogs-6.19.0 | 1 
            igd2-for-linux-2.2 | 1 
libdill-32d0e8b733416208e04... | 1 
               libdvbcsa-1.1.0 | 1 
               libecoli-0.11.3 | 1 
libfutils-c326ce0cc2a735438... | 1 
                libmad-0.15.1b | 1 
                libressl-4.3.4 | 1 
               libtalloc-2.4.4 | 1 
               libunwind-1.8.3 | 1 
           libwebsockets-5.1.0 | 1 
           libzenoh-pico-1.2.1 | 1 
                 linux-6.18.60 | 1 
                   linux-tools | 1 
                  lldpd-1.0.22 | 1 
                     lua-5.1.5 | 1 
               madplay-0.15.2b | 1 
                 mbedtls-3.6.7 | 1 
                     mc-4.8.33 | 1 
               mosquitto-2.1.2 | 1 
                      ndctl-85 | 1 
                  ndisc6-1.0.7 | 1 
             open62541-v1.5.10 | 1 
              openconnect-9.21 | 1 
                opencv4-4.14.0 | 1 
      passt-2026_07_28.f8df3f1 | 1 
                  pdmenu-1.3.6 | 1 
               pulseaudio-17.0 | 1 
            python-iwlib-1.7.0 | 1 
                rdma-core-62.0 | 1 
        riemann-c-client-2.2.2 | 1 
rtl8723bu-8292ef94965fb61d3... | 1 
                 rtl_433-25.12 | 1 
                    sbctl-0.18 | 1 
       sp-oops-extract-0.0.7-1 | 1 
    start-stop-daemon-1.20.7.1 | 1 
                  uftrace-0.14 | 1 
                     unzip-6.0 | 1 
           virglrenderer-1.3.0 | 1 
                  xxhash-0.8.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/db0343c9d7f4461efa30535fd718bb741a11c395 | ORPH
powerpc64le  |         apache-2.4.69          | NOK | https://autobuild.buildroot.org/results/832dfb3f5334ff5539740d0cb91741d721737d47 |     
    arm      |         apr-util-1.6.5         | NOK | https://autobuild.buildroot.org/results/a18165183a70d79f93daa842a1c731d8bad3347b |     
   x86_64    |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/181a96dbf45a58abf970c4428f39e4e75bcf858d |     
    arm      |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/335f847bc6ccc5cb2f665087c6c45ed5b6832696 |     
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/24a1ecba656073890130918230a6b2366891797a |     
  aarch64    |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/c0ad128e249893d66fcf795e480d7c89ec90fd2e |     
   x86_64    |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/c208a5107db3fcd89a229615075bc6e4384e824b |     
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/078bc074f25e94cf050792c31d6398ab73205c5a |     
  riscv64    |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/2d190f78e3dc0cecdf60c715e1f3eda8a22e56eb |     
 aarch64_be  |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/9065984316e2ca41b2bde846b0807c05d7e98a54 |     
    arm      |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/fd3dfc8f83f599a917b5826f00e28cea09c4db6a |     
powerpc64le  |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/cc08bd77d2f13df815d2ca00aec16fa20d077d79 |     
  mips64el   |          boinc-8.2.11          | NOK | https://autobuild.buildroot.org/results/7159f084cfbb2238fd0dd93d8f492d10f0497f54 |     
 aarch64_be  |         bpftool-v7.5.0         | NOK | https://autobuild.buildroot.org/results/0045fda1fac6addcce4d08bebc5a8b188726d73b |     
  riscv64    |         cdrkit-1.1.11          | NOK | https://autobuild.buildroot.org/results/4f6167e7a33d39e21e18f825b9686fcf348d20eb |     
  mips64el   |             chawan             | NOK | https://autobuild.buildroot.org/results/b04f82cb15696511f8123517acaedccea3b0a3b5 |     
  mips64el   |             chawan             | NOK | https://autobuild.buildroot.org/results/ad0ed97864cf6f2d0d9d9c139ee86daf0eae6a80 |     
  mips64el   |          chawan-0.5.1          | NOK | https://autobuild.buildroot.org/results/357225ea23bba6d969d6e82795150ffa92be2065 |     
  mips64el   |          chawan-0.5.1          | NOK | https://autobuild.buildroot.org/results/6cc870dd697eb4db582ad4c8f95d76d8c46a1e4c |     
   x86_64    |        containerd-2.3.7        | NOK | https://autobuild.buildroot.org/results/cefdbad2ca28ab0ad4e733f3dd83f03e9956fa1d |     
    arm      | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/4e82b01786d81f4d58ab72253ef29e0cef409d70 |     
   x86_64    |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/72d78429b54fbd493d332d89375dbc98f39b287b |     
  aarch64    |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/e8464a132ce09dd4d22a8dacd6ca9f7e7b306e7f |     
  mips64el   |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/88a590b951b9f07195c3fcaba5f181f6893f82d0 |     
   x86_64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/0061863937c8915eac77fede444f6daa633672f3 | ORPH
  mips64el   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/371ecb4f7398d0aa1ccf36cfa2d93c64fd9a1dc1 | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/fc3680c8b184a93ec4835d2865205a1ba25493e5 | ORPH
powerpc64le  |         dovecot-2.4.5          | NOK | https://autobuild.buildroot.org/results/a0391250d2172c0b0541a249811e70c5fc326e06 |     
powerpc64le  |       dt-utils-2023.11.0       | NOK | https://autobuild.buildroot.org/results/af303fd8c55690b2ae7d75a46297dfc38f3d9ae7 |     
powerpc64le  |           ed-1.22.5            | NOK | https://autobuild.buildroot.org/results/ba895186d3b68dbfd16276eaf7cfc3a2423fd9d2 | ORPH
   x86_64    |     edk2-edk2-stable202608     | NOK | https://autobuild.buildroot.org/results/f3dceb3f5f8748f63c021bea8b2e6cdd721e4a42 |     
    i686     |     edk2-edk2-stable202608     | NOK | https://autobuild.buildroot.org/results/cdbc4ed21870ba802c6c377fa23e79b30474b016 |     
    arm      |          ffmpeg-7.0.3          | NOK | https://autobuild.buildroot.org/results/6baf4657908c85edc190e603209fe586e410337a |     
    i686     |          ffmpeg-7.0.3          | NOK | https://autobuild.buildroot.org/results/34ef0cbf5e96b72332c2abdef856bcd0d3f91c3b |     
powerpc64le  |          ffmpeg-7.0.3          | NOK | https://autobuild.buildroot.org/results/2488cea5555ca7ed1842984a49bb46c0dcea52a5 |     
 powerpc64   |          ffmpeg-7.0.3          | NOK | https://autobuild.buildroot.org/results/1a84fb4636fe4062662031886939acbfd0cde479 |     
  aarch64    | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/e06f48393af282019a8eef3ca5055d74e49fd689 |     
  aarch64    | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/30edd5d59c3f981554b701d85b65961f6ac21a53 |     
    m68k     |           fmt-12.2.0           | NOK | https://autobuild.buildroot.org/results/1fdee8035aac1bf227343f63cb56d4e9b08b04e6 |     
   x86_64    | fs/btrfs/btrfs.mk:55: /home... | NOK | https://autobuild.buildroot.org/results/02771f98f2f6030c9e96bf367c854a0e0be73ca7 |     
  mips64el   | fs/cloop/cloop.mk:33: /home... | NOK | https://autobuild.buildroot.org/results/568bb8fcae66cf359e7b1879c698dada880fe427 |     
  aarch64    | fs/cloop/cloop.mk:33: /home... | NOK | https://autobuild.buildroot.org/results/34a4205026e812aea63aec82df09af3becb74c64 |     
    arm      |       fswebcam-20200725        | NOK | https://autobuild.buildroot.org/results/223e38dc3d71ad54791962a6fd018d174d294c2d |     
  mips64el   |       fswebcam-20200725        | NOK | https://autobuild.buildroot.org/results/1c43a0f6ab31306399727ef0363d08d99651485b |     
  mips64el   |       fswebcam-20200725        | NOK | https://autobuild.buildroot.org/results/7ffbff878ad8cf3e407d0932af3b33cb188a2da5 |     
powerpc64le  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/4c33d4ca8ba94be581609d4e5b438080e8d56c42 | ORPH
   x86_64    |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/bd055b40f818ce7557dcf103cacb7f1f32879d51 |     
   x86_64    |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/bb13aea351e6c64cfbb2c4f2ce2be2ca2ea30964 |     
  aarch64    |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/b4c0014a5c815f210cd94b4f6ff569d135a58832 |     
   x86_64    |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/3a39ebbea5009ed28ce5f4340d5ba39ced90ad29 |     
    arm      |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/a44b45be3dd0243d01cb3b02481d0fb965de8c33 |     
  mips64el   |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/4778cc3dd6597e06379326fe7690b205b7ead898 |     
powerpc64le  |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/217ca6cb6fe7cd264c2bcfe33109a903c20521a4 |     
    i686     |       glibmm2_66-2.66.8        | NOK | https://autobuild.buildroot.org/results/b47fd2b88d8f3090664e9dad63d2e2fa5f7523bb |     
powerpc64le  |       glibmm2_66-2.66.8        | NOK | https://autobuild.buildroot.org/results/635e232facb7e62789a57e65d58434adb752c2d3 |     
    i686     |       glibmm2_66-2.66.8        | NOK | https://autobuild.buildroot.org/results/3b5739587d7c94d8a2ea11ba72844f12c9dd6c53 |     
   x86_64    | hare-dbus-e9a89f8bc5ce783fa... | NOK | https://autobuild.buildroot.org/results/7fd7c7c2fb371148f478e679232ae540e486dde1 |     
    arm      |        harfbuzz-15.0.0         | NOK | https://autobuild.buildroot.org/results/c6b5486b0a7ca660dd7965c45febcc50c412cc3a |     
powerpc64le  |        harfbuzz-15.0.0         | NOK | https://autobuild.buildroot.org/results/2812308bc84d9f052657b4f5b3a1c9f530ded447 |     
  aarch64    |        harfbuzz-15.0.0         | NOK | https://autobuild.buildroot.org/results/e9c38a0153cc3c461566fe9929b853baeef4cd59 |     
  aarch64    |        host-bison-3.8.2        | NOK | https://autobuild.buildroot.org/results/efcbf347dd2c738ec1b5701aab6fdd6da6aec26c | ORPH
    arm      |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/45c29fc2fe2c036cbb945042c6ceea06e513e21d |     
  mips64el   |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/5c0700734d819149413afcb918532adeab365fef | ORPH
  mips64el   |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/61e150574c3308279cc5ed6657ba90985b52f086 | ORPH
    arm      |       host-go-src-1.27.3       | NOK | https://autobuild.buildroot.org/results/793deec8798ee222a9662dc9cd3a5028c8a0e0b7 |     
  mips64el   |   host-mender-artifact-4.4.2   | NOK | https://autobuild.buildroot.org/results/4999bf9fa6186e8059f22cc6e8176407bdf7c403 |     
  mips64el   |   host-mender-artifact-4.4.2   | NOK | https://autobuild.buildroot.org/results/3f02e06f79bfe3b2260195cdd5a1670321a75fc8 |     
  mips64el   |   host-mender-artifact-4.4.2   | NOK | https://autobuild.buildroot.org/results/bb177ae42e5b1d6decb7db41e6b4abb1f9df4e5e |     
    i686     |      host-mosquitto-2.1.2      | NOK | https://autobuild.buildroot.org/results/3a6f95987f5a0958eb21a213ccd45bbfdeea4197 |     
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/b4da7d81c3518a977252f2b3071432ec7d8181da | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/1126e419aeb013cdd117a8e9ec3b0bf0cdcdda47 | ORPH
   x86_64    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/c5b96c407dce2094856a24d1f4446f457d663a47 | ORPH
   x86_64    |        host-rust-1.99.1        | NOK | https://autobuild.buildroot.org/results/3d4e3ca0cb37f308735155989ad84c5b5623ab3b |     
  mips64el   |    host-uboot-tools-2026.07    | NOK | https://autobuild.buildroot.org/results/f2590cd4ff064007c128c87c73b4eafd9d82fdf4 | ORPH
 microblaze  |    host-uboot-tools-2026.07    | NOK | https://autobuild.buildroot.org/results/fe7d9a12727df0d4db991b857d913bc530a7370e | ORPH
    i686     |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/9e32dd46f61f6126ee4bad3a9110836bc89c00c4 | ORPH
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/b82c339f1963442d0d856c40277b6348a10e61db |     
    arm      | kvmtool-7ad32e5514aca2b6d19... | NOK | https://autobuild.buildroot.org/results/d79dbecf41fbe6028d0cf0689e47f094654015f4 | ORPH
    arm      | kvmtool-7ad32e5514aca2b6d19... | NOK | https://autobuild.buildroot.org/results/022ee674227883ad26cb8f97433a9be44baae488 | ORPH
    i686     | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/645adda26d9d146ecae186dcbfaa4abdda65d9da |     
    arm      |        libdvbcsa-1.1.0         | NOK | https://autobuild.buildroot.org/results/5ffc2b61c6974d92c435bf0eb70eb5db143e7738 |     
powerpc64le  |        libecoli-0.11.3         | NOK | https://autobuild.buildroot.org/results/78f7d48048416ef85edd6bbb494f6d41b909cd40 |     
  mips64el   | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/9229e01183415b06b955ccd146e4f0525021f554 |     
   x86_64    |        libglib2-2.90.1         | NOK | https://autobuild.buildroot.org/results/e30bfa0f4a5432cd89d9476cdd584e39a4f5aa7c |     
   x86_64    |        libglib2-2.90.1         | NOK | https://autobuild.buildroot.org/results/c76039cb4c5fbe529a9b8e11c72da5d2841c5c3b |     
   x86_64    |        libglib2-2.90.1         | NOK | https://autobuild.buildroot.org/results/701cde7f7f5d2bc7718b46003d76525fa2ce284c |     
    arm      |         libmad-0.15.1b         | NOK | https://autobuild.buildroot.org/results/318463336541aa4f08f7b75679d7ed44f8a3f8ce | ORPH
  aarch64    |       librdkafka-2.16.0        | NOK | https://autobuild.buildroot.org/results/ab2ce40c7a01f03e86b7c47b5e85b87913e146b6 |     
  mips64el   |       librdkafka-2.16.0        | NOK | https://autobuild.buildroot.org/results/5d3724c2d8f00a01fc65d4df7457c4b78e3a1c2e |     
    arm      |         libressl-4.3.4         | NOK | https://autobuild.buildroot.org/results/6c0d5dd55603ede180dfb53be2989d0f77ac03e5 | ORPH
   x86_64    |        libtalloc-2.4.4         | NOK | https://autobuild.buildroot.org/results/609f9e7c54350e892583e22f363c1d65571bb53c |     
  mips64el   |        libunwind-1.8.3         | NOK | https://autobuild.buildroot.org/results/a4c05b8773abdf6e22cc96087ae32698ffb6c08d | ORPH
  mips64el   |      libwebsockets-5.1.0       | NOK | https://autobuild.buildroot.org/results/27b2c7d838df4a350480d157efba477de586d849 |     
   x86_64    |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/584e07c6e34e43992a554b75a80df18b33457a43 |     
   x86_64    |         linux-6.18.60          | NOK | https://autobuild.buildroot.org/results/02e2914d9048d4835125025aacc93ae536743c86 | ORPH
  mips64el   |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/2c527925ef3548b94dd523dd71ccf4c917e29215 | ORPH
   x86_64    |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/8dbf4e8602a9fa52787c7074dedd3ce2c7e324b0 | ORPH
  mips64el   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/106321c910ac4cf55826d144affaba8f32ca2356 | ORPH
   x86_64    |          lldpd-1.0.22          | NOK | https://autobuild.buildroot.org/results/8203ba97d3de851f042cc60cd63bde27e5a6dba6 | ORPH
powerpc64le  |           lua-5.1.5            | NOK | https://autobuild.buildroot.org/results/f3052fab74ff1448cdb9f08a617a893808e6e669 |     
  mips64el   |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/d32b9e75a4505521e7b4df6a4f99ffeed514b9c5 |     
    i686     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/355631821f501bb657d23899543e91c82f71a0f3 |     
   x86_64    |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/fffce49c0ab1e637ee9936b7a6cd42dabb738d9c |     
    arm      |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/4dc5cec39d6087d68cfe78e49f7bb70b6411ca42 | ORPH
    arm      |         mbedtls-3.6.7          | NOK | https://autobuild.buildroot.org/results/84879abb3f995cb0f1b4345816da7f2297d98fbe |     
   x86_64    |           mc-4.8.33            | NOK | https://autobuild.buildroot.org/results/2479539d828e6a80b3fbfd6165ce06cb981eed20 |     
powerpc64le  |            mksh-59c            | NOK | https://autobuild.buildroot.org/results/68be11e9f35cc8f7341fa4536492b9942785a379 |     
   x86_64    |            mksh-59c            | NOK | https://autobuild.buildroot.org/results/2b0c3567ec13715036ba9b9ff9a9e3593371e3bc |     
   x86_64    |        mosquitto-2.1.2         | NOK | https://autobuild.buildroot.org/results/04668718cbc1f0956c32a03351bb492390d6d460 |     
powerpc64le  |           musl-1.2.6           | NOK | https://autobuild.buildroot.org/results/a81d9e1d56c0e0e54b0ff7c1152a8c4894793592 |     
powerpc64le  |           musl-1.2.6           | NOK | https://autobuild.buildroot.org/results/cf19101bb07b74f32c1b9e2d43529f58804810ea |     
microblazeel |            ndctl-85            | NOK | https://autobuild.buildroot.org/results/2e698b5d818ba6af65f1b3c3c5246ffa6ae7ad8b |     
   x86_64    |          ndisc6-1.0.7          | NOK | https://autobuild.buildroot.org/results/70f445ab390ebe430b4013bb0d9d8b78c1c9ed7e | ORPH
  mips64el   |       open62541-v1.5.10        | NOK | https://autobuild.buildroot.org/results/0c5856839bdc7c6e19ba55cbfb909d9028195747 | ORPH
    i686     |        openconnect-9.21        | NOK | https://autobuild.buildroot.org/results/8542321ef7d7cac6269c4c7d6049826f448a395e |     
    arm      |         opencv4-4.14.0         | NOK | https://autobuild.buildroot.org/results/9953f43e5d3f1ddf0b0b4933ffa14864766e5fdd |     
    arm      |           opus-1.6.1           | NOK | https://autobuild.buildroot.org/results/26ed204f228799ed5a3d130a334e9ae11eee5196 |     
    arm      |           opus-1.6.1           | NOK | https://autobuild.buildroot.org/results/dc07321df4d19f5f14bb9902c74826d78935ecf2 |     
powerpc64le  |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/18cc71e3454c6557ef8b1a356664ea90ad9ceff0 |     
powerpc64le  |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/0c324bee00e09b48e787b37500f22a9a041f62d8 |     
    i686     |    passt-2026_07_28.f8df3f1    | NOK | https://autobuild.buildroot.org/results/bc32aa1f9c1ef7400eb8414e23dd61f46e80f2fc | ORPH
  mips64el   |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/2daea08fb802e3d8b97ed0339b9323026d17599b |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/5aafcd44b72eacd2116489ebfe1af4e04c22b148 |     
  mips64el   |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/72be7dd430fd75c35c65220d7dac98ffee03245a |     
  mips64el   |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/7c2d9b6af4d783b571838105e992b3cadc174f05 |     
    arm      |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/41e82e9c24cd9ff3201fed377f89dd9f70a42bae |     
  riscv64    |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/1be3dace9b3c131df30f672a75e3a8c6c7640e52 |     
   x86_64    |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/2608f4e7fb72f7ee58d3f59d3ef2be9b1fb1ea36 |     
powerpc64le  |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/249af6430780424143dbaf58925d2adfcc916f74 |     
 microblaze  |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/0f819959fb3d115d105cfee6f324d255a9e2353a | ORPH
   x86_64    |       python-iwlib-1.7.0       | NOK | https://autobuild.buildroot.org/results/12567cadc1ab46a9aa342c8c8496b383c8672218 |     
 powerpc64   | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/cda346df77e9e269947a7675fc36544f4886d54f |     
  mips64el   | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/309fb307922f55f8114cb32d89a45dc9bab26018 |     
    hppa     | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/b0756e680888dca666584eaca5e8bcd048470ddb |     
  mips64el   | raw2rgbpnm-f28b903ca63b4c22... | NOK | https://autobuild.buildroot.org/results/5e2b915807bd829075ef895c3515d6b4446d4c71 |     
    arm      | raw2rgbpnm-f28b903ca63b4c22... | NOK | https://autobuild.buildroot.org/results/96ec34b5ea81b5e61f044117dcbfd1c4c676e371 |     
    i686     |         rdma-core-62.0         | NOK | https://autobuild.buildroot.org/results/1787def4668fd0b91aa75cf6b00ede14faf06aee |     
 aarch64_be  |     riemann-c-client-2.2.2     | NOK | https://autobuild.buildroot.org/results/dedab1091745cb6d8ff57994220c8ea36e0b0315 | ORPH
    arm      | rtl8723bu-8292ef94965fb61d3... | NOK | https://autobuild.buildroot.org/results/9959ba1c5dd7bfbd88fd283099d933e5859fc809 |     
  mips64el   |         rtl_433-25.12          | NOK | https://autobuild.buildroot.org/results/d148cbd72dc0f30c68ce6b1881f254c495cfd3a8 |     
   x86_64    | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/99ebe2240739410d54909f157adc8f84577d3017 |     
   x86_64    | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/dd37b29cd6a6991f87e8c1980d71c66d38fba9a5 |     
  mips64el   |           sbctl-0.18           | NOK | https://autobuild.buildroot.org/results/ff859699e37ce48178c56c93d43f7594d53d48d0 | ORPH
  mips64el   |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/ee68a355733dcdddbaf517d9a9f6ceb3ba2b1065 |     
  mips64el   |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/78c33fee9cba5bb90111b6cc71e2b77f7450aecf |     
  mips64el   |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/906b763d872ac51a91426fa50851b3b04960cbe6 |     
  mips64el   |   start-stop-daemon-1.20.7.1   | NOK | https://autobuild.buildroot.org/results/638377effc7c2e5466437b939e460d84d513243a | ORPH
powerpc64le  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/44359eba17a7e6e59a0e6be9377e4ecc77432788 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/fd9c7d91f441c59d6d4a0d1e35af179e51d0fd60 |     
    i686     |      uboot-tools-2026.07       | NOK | https://autobuild.buildroot.org/results/8539a64e82124b101f8cb5a7f0e2c31b474929b4 | ORPH
  aarch64    |      uboot-tools-2026.07       | NOK | https://autobuild.buildroot.org/results/d8a4507b1e6e855c24e3712fa3f936595c682417 | ORPH
    arc      |         uclibc-1.0.59          | NOK | https://autobuild.buildroot.org/results/b9cfa681e2f21e80c6304c26e630c5287c3da716 |     
    or1k     |         uclibc-1.0.59          | NOK | https://autobuild.buildroot.org/results/ff5ee0fb3394d5424340d6381ba905995ba29fd0 |     
   x86_64    |          uftrace-0.14          | NOK | https://autobuild.buildroot.org/results/57a6612c94e7a44777bdae93db89db2883ed18ac | ORPH
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/4466da51d668e1d36f936083cbf2fcb0e0be8b3c |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/171e6b7c6d283acd83faa429053a6380b5c69441 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/7aa99febb36568e0f6a9afaa4022dd284e0cbf44 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/bb6025212a65dddbfc72264bf39757afc3cb9e02 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/57cf75f11a9e8497a79cd93891b9f084cc5d7197 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/ae2d49880f509812551b0896f03451b569dca9e0 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/40ed84ac9d6f04a719638cf4918631de5219903e |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/8faeac0f444bb5c4d1250b8a78cac77adc4ec5da |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/06381c86036d87c145f8ee3346ed9ec51f2fcf43 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/a399175e911bf8a8c5db915ea2c9536d553de233 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/706f3efc3944f1e9ba44b2340fbdd7a11572a557 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/898fbeacd482e822352ad67b3c8dd7152d3a1046 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/2ddd2caaa92b24c24f5b43c8aed16c2e363a5eda |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/2e2d2591ebb848e255793591eed20561814b7554 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/60d8a93102c082f355f3d58268dfd27d044bf242 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/0445dfe3d5df1a0df9028e8e6186fafeeb429a80 |     
    i686     |           unzip-6.0            | NOK | https://autobuild.buildroot.org/results/7d1fbe53cf2e93bc6423244b933d09983364197d |     
    arm      |      virglrenderer-1.3.0       | NOK | https://autobuild.buildroot.org/results/72c81920e6d1fbc36de8930f4ad2f70f88c4cf29 |     
    i686     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/7c02e0950f8a9061e5ddd1f8edc311a61a5db57c |     
   x86_64    |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/afc440ab2dfd610984c794317b2ddd57c4f15135 |     
    i686     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/83af839a528a93d2abe6c418b42a2e6c975f139e |     
  aarch64    |          xxhash-0.8.4          | NOK | https://autobuild.buildroot.org/results/e30ce8283333d3b9c9243cd06669226fd00c7af5 | ORPH


Classification of failures by reason for 2026.08.x
--------------------------------------------------

            dt-utils-2023.11.0 | 1 
           host-drogon-v1.9.13 | 1 
                 libsepol-3.10 | 1 
                  pdmenu-1.3.6 | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       dt-utils-2023.11.0       | NOK | https://autobuild.buildroot.org/results/9d8f2b87de512275c108aeeba8d068cf874d2429 |     
  mips64el   |      host-drogon-v1.9.13       | NOK | https://autobuild.buildroot.org/results/f9c7621f544b2d90dfeaa8e6deed100ce92d91a6 |     
  mips64el   |         libsepol-3.10          | NOK | https://autobuild.buildroot.org/results/604bc2606adf47f5707c9c31001af429f1c27b54 |     
powerpc64le  |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/7e8160bf8dd2af7a07947c0436d20fe0647a4815 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

azmq-v1.0.3-54-g819b24035cf... | 1 
            dt-utils-2023.11.0 | 1 
        edk2-edk2-stable202602 | 1 
    host-mender-artifact-4.2.0 | 1 
            jpeg-turbo-3.1.4.1 | 1 
   openvmtools-11.3.5-18557794 | 1 
                 systemd-258.7 | 1 
                       unknown | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/3c5ed4e5d528090da16a1843580e5c7c8808aa2b |     
    i686     |       dt-utils-2023.11.0       | NOK | https://autobuild.buildroot.org/results/9ab875922717fc2d609af210be3db12321769ae0 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/c6159875a576438dff5e12ca10c3adb410a8daa4 |     
  aarch64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/fd433124e88f80b1792512ac473f78a2a98e4ef8 |     
    i686     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/1730df022b3752f71669a008a1e6d039fb85865b |     
   x86_64    |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/bd43aa090fb481da5fdee95e5f3feb32fed59499 |     
    arm      |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/5707428197d43e5f1d3ba7f36957ff383ae88760 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/a335b6a0cc8b6721551650e6fcd48baaf59ac319 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

           host-libselinux-3.7 | 1 
    host-mender-artifact-4.0.0 | 1 
        host-python-lxml-5.3.0 | 1 
              host-rust-1.82.0 | 1 
              libmodbus-3.1.11 | 1 
                libsoup3-3.6.6 | 1 
                  liburing-2.6 | 1 
                linux-6.12.114 | 1 
                memtest86-7.20 | 1 
               tcf-agent-1.8.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/23de0baad5483bc2d91f66b29e258a91a8460281 |     
    arm      |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/06a091e9349dcc23b7077d0cb2810d9cb9a52c57 |     
powerpc64le  |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/a2818fa75ce2bb5735ad34ba46c51c5f1113e398 |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/e9740716feaa05b66a4c37f968590eac5ca953ab |     
    arm      |        libmodbus-3.1.11        | NOK | https://autobuild.buildroot.org/results/54fca88658e8bccae9a9f1c39633858d79607e0e |     
  mips64el   |         libsoup3-3.6.6         | NOK | https://autobuild.buildroot.org/results/809ba39dffd4f92d5f7e6923e837beceac4756c1 |     
   x86_64    |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/06680421471c49283be2e9b259ca0eeb94feb1ad |     
   x86_64    |         linux-6.12.114         | NOK | https://autobuild.buildroot.org/results/d8d5dc42937810a7b1df9aa1e80c5e003672ee39 | ORPH
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/c99e4801d44ab188babad10bcd25c5d8e16d608f |     
powerpc64le  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/984aca95f5ebfe2398fdde9153c82b1ffe62488f |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
