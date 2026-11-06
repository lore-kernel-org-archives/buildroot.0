Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CDF606A31B
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 04:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=acf5OX2e;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eriK2+EF
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D37AB81201;
	Fri,  6 Nov 2026 04:29:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vSk4pArUBqio; Fri,  6 Nov 2026 04:29:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5B957811F8
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793939381;
	b=ZeFh6z7K/6LiPpavINlwQTfHHuKW+DHxnDftb3C/dC4KUnJrPT5r5OHOYMwbNAW2HJcA
	 kay5e+be8PJ2oE7XGvfMFzkvqgCiEXOT4oUekgcZH5ReTkeE/9qSx1g3F2AcyAPwx0CoA
	 5KrqCSAGWfhQ1mxOtxxZxQUltcP+YTlyL2lOHuaymFep2c+uAM0EuAb3WzhVgyTkHckO6
	 Zk8nW3cN2EPmIZx53Z1OSMIkhEy2RPuaO5M7e7TUrOUT2zI4ts9aOVImQETZxOR8MR1FE
	 uzTofK/HoL96XUKwpMd+ROVYfMoCMoTy8dckKniNGb1nudxRZH8fzi7ThQzdTkl6Yjw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793939381;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=w0f/IGJdaiQaEKbFk990beGRgu/KMP/bBHZ37Jh0yOc=;
	b=IW4xj4rYTv0RTKQuex5aOoKrbSBK1dZi4Y9NlwIU1J9kJnw6f5jgEvU4tWouYFjtct8r
	 Wx/UUQfRV8zh3Lwl8jRCubQy37JQur6Kaimr4C3I0LryPKV1mDxf1m0dLjZAJFLWPdTrm
	 0iL3n93GAaHzTcy2KxFMrzR3YO+niZ8jUSbcojRMjXOTazA2YdKaiiaRtOZ+3qms5oUk7
	 +MFYQMZJpXwMchGcf83Ki7BjFRMQ+tT6ywbehiV4RJTGHSuR2X5HXoN8HXoB9T1zPMljK
	 m5gQx12cRZbwdHy79m6JGaZZXVVyldTR6EXgFiIjD0bDoyqxHXawW6RtKLyt/j/wA8g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793939381;
	bh=w0f/IGJdaiQaEKbFk990beGRgu/KMP/bBHZ37Jh0yOc=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=acf5OX2eF/rIGXW5aIF+tWIzUpscpqkMEC5Lcb0/PpZ2RhWhPBPnhqQkueQI0pA3L
	 k4U3yRPpFi+ujrVpycDFcOKGu1rslnMlkiAKlRFYFeUxCTAZQbW5NQmvoA5WVvZe6n
	 +CXVVy7MCJJpNaq1HdVphKJbo3xp8KKo4YJrxmzbtQvaBAr6MiuVDgCXw75N89ZPNI
	 3OJ5a59v90A5HOC3XCZx6Yk4uiZ9+5ZEBgV1Swr4+Q20FwPnUz2Fri1UxgPP331pmo
	 L3tSe2WDuNYicloEf5VEa1E2U7Zfkje4l8wBb4TuczTH5+p9l03t/g84rrC47LiIYE
	 imPCW6ycfPONA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B957811F8;
	Fri,  6 Nov 2026 04:29:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F3B3211
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 04:29:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66D1240070
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 04:29:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wHXsuVonMZgP for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 04:29:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 095814016D
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::436"
Received-SPF: Temperror (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=eriK2+EF
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 095814016D
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 04:28:30 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-490c1d337d8so110995f8f.2
 for <buildroot@buildroot.org>; Thu, 05 Nov 2026 20:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793939306; x=1794544106; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=PL+cKSTULG2lpLF3XYJ1ECP6XSH6oa8yDjwt+DBYB8w=;
 b=eriK2+EFLZOr7OfOl48fAD9Qo2tW8MMayaP2F5cgzxCMN+O54ULQY5l9dxiooCF0tE
 LtdxKgUXD21yQy4jscsAZ/2bMHdbcTlFzwaiMgfGRuOzODc5smqaLpoVRYx1UmZlE169
 8tZSv1YLSEPTBAJ3aT0MubAZ5A8V3kxWwjN2GfIPvK8pM1BmN7DFUZ4f2zTjY/HWGCY8
 nMH3IRgCSfcLR5ADkyoH36wyveayChwkhV2rTYc+akMbPEmGPRNoBLZQ1dD8TIc3brIg
 5FZbOnIM5rweQkcaASgiO/qASRgiG/ScjKCoNuaxeQriLmhZ7sg6LDbzlZc/tY7ciY8B
 /Wew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793939306; x=1794544106;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=PL+cKSTULG2lpLF3XYJ1ECP6XSH6oa8yDjwt+DBYB8w=;
 b=U/G+grHkq/HttI7A4ZAVN0AbDJZTPalsC/J5MFfaKjrJg1ExoUtfimp9VPx6w7aQlj
 jcTHbMJnWTEihawuNtLBnvxEVebgTDR5iYA+ZvwRmdYriBD9/c4EpR5Vyxg/yM6WM8xm
 hj78/bQdVDYJiy5Ekhl6Zl027dT/LFsl60LM4DRFFRctR/o7wRJMjJ1e7MGkLkgiRCnH
 si4T7Vk+pXM/0YW9edcIN7sd+ZF2mAIBwrlvBimyANdp5xaGCY80vBEIXZuhBTMowQ1F
 oJ6ZMn8ELZJRauqz7XrzlzYWLxRnfat4yP8aP094/URpFaB9i8ZjezaWN0+1eqU/u2n4
 A3Xw==
X-Gm-Message-State: APuU4Z8f3CP56M4amp13/6dnmTke1ZZyyUbVtExWU30yk+ZO91Y9ACKG
 WKb4SqIvr/1KvuZ4E2meBxMzLR5IQkU0ZeDfrUZZc4cR2ovriICl2iRM7USfDOyz
X-Gm-Gg: AYBFou1q3VGZEifqp4Xr/7oKxeiir7KT7Vg5z2/JOc+5ma+GC3I9IYUh9aY+QTVhvx4
 ZXjxJniEIwdwmrDPwWH0CGO7rEp3jcdHDTDsuBngVGLhtwE1EPNJxKluko8NYl9m5lO640IQVtl
 uxfvZJinNWj8zRkxPzNZKka0JFgl1u2REotJXyt1Abj77WikGugyK5371Mb+pvjsihuSiZS0P1+
 AzsqY8VPwZoMdoCVBmJtxDKgIKBQ8nCGBiWV0IC1+oWOWMoTWOHSZJziEfOUJR4SdWGT2D1zk08
 ggma9QUTa5sLjvi0/bQrz4Z3ONj8Z6C4BiNquqRimoL3RjfGfwzzStc7qyKFT8KBMb5g7B9ZS/Z
 N6QnLMTlHulfZGA8r/13NPygIKUun92hCTXqkHEHvVAl+bmvY6FAayD7/pwYtK8260ank+5kTYj
 NxOQX6Vx6tBv/j8/9As0CDApZsigAc44XE230LtnAgHpmDUURiQOt1J9jrY75j+uFvOrYDfZMWs
 UNM9SZ9TYcwFacggSArMM3w9hbNPm77xjultRZpxv1MdxmpFH17qMzr16+JR1mc22AUXzHtbSYC
 Ut0QxbThifpniHSct2XZBysofSYoxlmay/3p
X-Received: by 2002:a05:6000:4b0f:b0:48e:7a41:d78e with SMTP id
 ffacd0b85a97d-4927e553be3mr2420009f8f.19.1793939306229; 
 Thu, 05 Nov 2026 20:28:26 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-492d723310fsm1228289f8f.32.2026.11.05.20.28.25
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 20:28:25 -0800 (PST)
Message-ID: <6aed5769.c70771d4.1798c3.7e18@mx.google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 06 Nov 2026 04:28:25 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-11-05
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
	SPF_HELO_NONE,T_SPF_TEMPERROR autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

Autobuild statistics for 2026-11-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  |  7  |  0  | 11  |
  2026.05.x  |  2  |  4  |  0  |  6  |
  2026.08.x  |  2  |  5  |  0  |  7  |
    master   | 73  | 192 |  0  | 265 |

Classification of failures by reason for master
-----------------------------------------------

                host-odb-2.4.0 | 11
                       unknown | 11
                    attr-2.6.0 | 4 
                 glibmm-2.76.0 | 4 
host-google-breakpad-f49c2f... | 4 
    host-mender-artifact-4.4.2 | 4 
      host-uboot-tools-2026.07 | 4 
               linux-pam-1.7.2 | 4 
                  xxhash-0.8.4 | 4 
                   bird-2.15.1 | 3 
                 dovecot-2.4.5 | 3 
             fswebcam-20200725 | 3 
                   perl-5.42.3 | 3 
rtmpdump-6f6bb1353fc84f4cc3... | 3 
               trousers-0.3.15 | 3 
                     apr-1.7.6 | 2 
                  chawan-0.5.1 | 2 
              erlang-26.2.5.21 | 2 
              fftw-quad-3.3.10 | 2 
                 haproxy-3.4.4 | 2 
hare-dbus-e9a89f8bc5ce783fa... | 2 
host-am335x-pru-package-5f3... | 2 
            host-cdrkit-1.1.11 | 2 
          host-mosquitto-2.1.2 | 2 
              host-rust-1.99.1 | 2 
          host-xfsprogs-6.19.0 | 2 
kvmtool-7ad32e5514aca2b6d19... | 2 
                 lcdproc-0.5.9 | 2 
               libecoli-0.11.3 | 2 
libesmtp-v1.1.0-14-g335ee8d... | 2 
               libglib2-2.90.1 | 2 
           libtraceevent-1.9.1 | 2 
                   lmdb-0.9.35 | 2 
                      mksh-59c | 2 
                    opus-1.6.1 | 2 
                  prboom-2.5.0 | 2 
rtl8723ds-122a574f780da32bb... | 2 
                 rtl_433-25.12 | 2 
                    sbctl-0.18 | 2 
           uboot-tools-2026.07 | 2 
                 uclibc-1.0.59 | 2 
           virglrenderer-1.3.0 | 2 
                 apache-2.4.69 | 1 
                 augeas-1.14.1 | 1 
             batman-adv-2025.4 | 1 
                  boinc-8.2.11 | 1 
casync-0efa7abffe5fffbde8c4... | 1 
                 cdrkit-1.1.11 | 1 
                        chawan | 1 
cpuinfo-8a1772a0c5c447df2d1... | 1 
                cryptopp-8.9.0 | 1 
             dahdi-linux-3.3.0 | 1 
            dt-utils-2023.11.0 | 1 
                  ffmpeg-7.0.3 | 1 
flashbench-2e30b1968a661474... | 1 
             fontconfig-2.17.1 | 1 
               freetype-2.14.3 | 1 
                     gdbm-1.26 | 1 
            gdk-pixbuf-2.42.12 | 1 
             glibmm2_66-2.66.8 | 1 
 glslsandbox-player-2023.04.05 | 1 
google-breakpad-f49c2f1a202... | 1 
            gstreamer1-1.24.13 | 1 
               harfbuzz-15.0.0 | 1 
             host-asn1c-0.9.28 | 1 
             host-delve-1.22.1 | 1 
             host-expat-2.10.0 | 1 
       host-gcc-initial-15.3.0 | 1 
       host-gettext-tiny-0.3.3 | 1 
        host-libarchive-3.8.10 | 1 
          host-libglib2-2.90.1 | 1 
            host-mfgtools-0.02 | 1 
         host-ti-cgt-pru-2.3.3 | 1 
               host-zstd-1.5.7 | 1 
 ibm-sw-tpm2-rev183-2026-08-26 | 1 
            igd2-for-linux-2.2 | 1 
                   k3conf-v0.4 | 1 
kismet-52bcb902e36b2df1562c... | 1 
                  libavl-0.3.5 | 1 
                  libbpf-1.6.2 | 1 
             libfribidi-1.0.18 | 1 
              liblockfile-1.17 | 1 
                libmad-0.15.1b | 1 
                 libsepol-3.10 | 1 
               libtalloc-2.4.4 | 1 
                libupnpp-1.0.3 | 1 
           libusb-compat-0.1.9 | 1 
               libvorbis-1.3.7 | 1 
           libwebsockets-5.1.0 | 1 
                 libzlib-1.3.2 | 1 
                 linux-6.1.191 | 1 
        ltp-testsuite-20260529 | 1 
               madplay-0.15.2b | 1 
                     mc-4.8.33 | 1 
                  ndisc6-1.0.7 | 1 
             open62541-v1.5.10 | 1 
      passt-2026_07_28.f8df3f1 | 1 
                 pixman-0.46.4 | 1 
                    pppd-2.5.5 | 1 
python-remi-2022.7.27-37-g1... | 1 
raw2rgbpnm-f28b903ca63b4c22... | 1 
                rdma-core-62.0 | 1 
rtl8812au-aircrack-ng-c3fb8... | 1 
rtl8821au-bb26b6b06c47b79c1... | 1 
                   s6-2.13.1.0 | 1 
           sane-backends-1.4.0 | 1 
       sp-oops-extract-0.0.7-1 | 1 
               tcf-agent-1.8.0 | 1 
             util-linux-2.41.5 | 1 
                 xenomai-3.2.5 | 1 
             xlib_libFS-1.0.10 | 1 
                      xz-5.8.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |         apache-2.4.69          | NOK | https://autobuild.buildroot.org/results/2fdbe8657e27a50110aef12f1e3e6452c043f031 |     
  aarch64    |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/351eabbf1ba99ae40e2be9a0c09f6536c6389a7a |     
  mips64el   |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/cc7dbb852a6d4876052c2b3ead549b614462b771 |     
    arm      |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/2dbc0defbb6d6dfc137a736ec1f5b18a1f057b71 |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/de24247da105d08f2be6021e4df14a1c1fd9d6cc |     
    arm      |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/e84dbe1a96dfc6f47d254f14da7629f2879a7d50 |     
    arm      |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/20c980dff9a2b47f61f01dbd20b64a0a0e13b06f |     
    i686     |         augeas-1.14.1          | NOK | https://autobuild.buildroot.org/results/c9e4ed6745f31685aa3471280deea84c21e1883a | ORPH
   x86_64    |       batman-adv-2025.4        | NOK | https://autobuild.buildroot.org/results/72bfa33733abd212f9a25b9ab7f024aea2b9741c |     
  mips64el   |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/225c2770245591a5d8face28e1f7a88bb8d031b0 |     
  riscv64    |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/9116d1eca20f63085cda50666926904778bf87ca |     
    arm      |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/190ca27e4de13ae9872f49ede4790836cd8e5e5f |     
  mips64el   |          boinc-8.2.11          | NOK | https://autobuild.buildroot.org/results/14e7675cb564748f8b0c496e81685906db2ebd00 |     
    arm      | casync-0efa7abffe5fffbde8c4... | NOK | https://autobuild.buildroot.org/results/d1da58fe2d731e4d803fcfd6a260268ca7f43e83 |     
powerpc64le  |         cdrkit-1.1.11          | NOK | https://autobuild.buildroot.org/results/96fead26bc182306598a2ea23e1cd76e94ca15fe |     
  mips64el   |             chawan             | NOK | https://autobuild.buildroot.org/results/4d12ca31c0b06d8f975204039f0c621dbc22e4e3 |     
   armeb     |          chawan-0.5.1          | NOK | https://autobuild.buildroot.org/results/85879254dac757ccc4380cf2617f435ff7ba379d |     
    arm      |          chawan-0.5.1          | NOK | https://autobuild.buildroot.org/results/2ed6cd01c914a8463b78099124b14bcad44711aa |     
    arm      | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/6cb27fbc93d0fd70d969d659ee6242dbe74611e6 |     
  aarch64    |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/95eaf78dbbe9c798b543f97639e967532838c806 |     
   x86_64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/4a4480f2ab437af6ed285c9a2bc9a945bdc2d175 | ORPH
powerpc64le  |         dovecot-2.4.5          | NOK | https://autobuild.buildroot.org/results/d88f4596a62f2fdac855a4e286b5030f97475a8e |     
  mips64el   |         dovecot-2.4.5          | NOK | https://autobuild.buildroot.org/results/848f62035017e83f7bbab24bca63196fdb853674 |     
  aarch64    |         dovecot-2.4.5          | NOK | https://autobuild.buildroot.org/results/1aea20d55e5189f145a0f971b5e3dbccb0e7ae61 |     
powerpc64le  |       dt-utils-2023.11.0       | NOK | https://autobuild.buildroot.org/results/7543b6c4c42e8dd5d3eaaf689405669d7fbdc378 |     
    i686     |        erlang-26.2.5.21        | NOK | https://autobuild.buildroot.org/results/d247e969fa0a81e8c402d1498b0923f4267b6a37 |     
    i686     |        erlang-26.2.5.21        | NOK | https://autobuild.buildroot.org/results/bd30f5a41faca849b516e02ce150166e3e25cdf7 |     
  aarch64    |          ffmpeg-7.0.3          | NOK | https://autobuild.buildroot.org/results/c390b7694d8b9df384cb2c19404d133d7c636c80 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/5caaf0ea3bb5cd5bfb9c7295bd97d2d8ffcf76cd | ORPH
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/3c3da5c0e6dd33bffeae7db8004d564279dda7c8 | ORPH
  aarch64    | flashbench-2e30b1968a661474... | NOK | https://autobuild.buildroot.org/results/a3f3875b45e72c56fa57e0e9ebb93f7a66f0dcdf | ORPH
  aarch64    |       fontconfig-2.17.1        | NOK | https://autobuild.buildroot.org/results/fd50be6e8b0fafe5377a5f32ea63e41db5b69b79 | ORPH
  mips64el   |        freetype-2.14.3         | NOK | https://autobuild.buildroot.org/results/9e62c797d8b5cd0a5e356f1edf7209f37d3059c8 |     
  aarch64    |       fswebcam-20200725        | NOK | https://autobuild.buildroot.org/results/7aa5c1b6164091ad19412d4fb7fd9343eed1607a |     
powerpc64le  |       fswebcam-20200725        | NOK | https://autobuild.buildroot.org/results/cc6db66fa5a5e340a3f45b0bf4da5597a7ed96b6 |     
   x86_64    |       fswebcam-20200725        | NOK | https://autobuild.buildroot.org/results/dbdde8040df0cf8045fa17f283c644365526c4a8 |     
  mips64el   |           gdbm-1.26            | NOK | https://autobuild.buildroot.org/results/cb25edb26b1c6c160c926dc67f12aec7fccb5a0a | ORPH
   x86_64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/1f2ece2845f92ace7c15169e854f2fd347c1d645 | ORPH
    i686     |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/8e730ff2352cc4a60f03a49e922cf05017242f0d |     
  aarch64    |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/a0c180f577e6dcdb0471aede28ad2b6058d39086 |     
powerpc64le  |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/a8d52504bdf06f5bcc92178efc957492ac675447 |     
  aarch64    |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/1e3ba8542c4ed7da676ae588426f506827af9125 |     
  aarch64    |       glibmm2_66-2.66.8        | NOK | https://autobuild.buildroot.org/results/05063fc9c3812244e2e0f9c7a7a31c3e15829412 |     
  aarch64    | glslsandbox-player-2023.04.05  | NOK | https://autobuild.buildroot.org/results/e52ea387c35634b1b96f455a0f8eefef571b45f3 |     
    arm      | google-breakpad-f49c2f1a202... | NOK | https://autobuild.buildroot.org/results/78a1fa3b76aeac236162a809c6760b051442ea2c |     
powerpc64le  |       gstreamer1-1.24.13       | NOK | https://autobuild.buildroot.org/results/28a88f79de0c4f166df22e50308b0a8665b644b0 | ORPH
  riscv64    |         haproxy-3.4.4          | NOK | https://autobuild.buildroot.org/results/190bc6cd073a5aeb7ed48c3c1acc396300baf5c4 |     
   mips64    |         haproxy-3.4.4          | NOK | https://autobuild.buildroot.org/results/c99e2e27d1f8e9b44233e76d0f0caadc4ef238c5 |     
  aarch64    | hare-dbus-e9a89f8bc5ce783fa... | NOK | https://autobuild.buildroot.org/results/4d92058cba0310e1f50ceed78a657e07652d778d |     
   x86_64    | hare-dbus-e9a89f8bc5ce783fa... | NOK | https://autobuild.buildroot.org/results/8f60d12a004f4972557682d0d1897e451f089877 |     
   x86_64    |        harfbuzz-15.0.0         | NOK | https://autobuild.buildroot.org/results/0824e95fb8eb2c06c84853c65b308abf28f5d664 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/f9688c11b4c8488c8ebde171fbdd415a449aa51e |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/5563ea3a404032661ce906d73abec15279aef1be |     
   x86_64    |       host-asn1c-0.9.28        | NOK | https://autobuild.buildroot.org/results/d593e5b2bbe20c004ce21ba0c8ad5353b9bce506 |     
    i686     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/b5db87685371179ca7519f424e1b91ce93ec6515 |     
    i686     |       host-cdrkit-1.1.11       | NOK | https://autobuild.buildroot.org/results/81531b1625bb3ae11b81c4a5380126c7c7d61005 |     
 aarch64_be  |       host-delve-1.22.1        | NOK | https://autobuild.buildroot.org/results/84befb18096631fa4f28d96b63da8ffe192b3192 |     
    arm      |       host-expat-2.10.0        | NOK | https://autobuild.buildroot.org/results/df1f3f0021722120039fcb45b637e1535f04d41e |     
    arm      |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/9550a56b94294fc0cda85497fb03b266a2365e88 |     
   x86_64    |    host-gettext-tiny-0.3.3     | NOK | https://autobuild.buildroot.org/results/2c49223febc6b2665151f2de9303d097fcf18c28 |     
   x86_64    | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/b5d74f5b7c9f0a0ecb2e00b485f3ec6c623b2f67 |     
  aarch64    | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/8e38aaf2cb3ebca168db43de425ae3ad9078698c |     
    arm      | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/83f970285dd5fe644488aa00ba14cd55fdd4cb41 |     
   x86_64    | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/48d83f0b65da91227acb267591a197e954a032f9 |     
   mips64    |     host-libarchive-3.8.10     | NOK | https://autobuild.buildroot.org/results/58e5537a219917717e0352e13f1b116f637fdc71 |     
   x86_64    |      host-libglib2-2.90.1      | NOK | https://autobuild.buildroot.org/results/f3f05250c9b914ac09dc8006f300a66b1122e709 |     
  mips64el   |   host-mender-artifact-4.4.2   | NOK | https://autobuild.buildroot.org/results/334a68639a3399f9ecfd710ad3d26c43d1624a67 |     
  aarch64    |   host-mender-artifact-4.4.2   | NOK | https://autobuild.buildroot.org/results/c043bf70866df6938348da9c3d93b265091d1246 |     
  aarch64    |   host-mender-artifact-4.4.2   | NOK | https://autobuild.buildroot.org/results/a94b728fdaf347488b949802f3c43271be559b30 |     
  mips64el   |   host-mender-artifact-4.4.2   | NOK | https://autobuild.buildroot.org/results/7902b0749c4bcffe9c917477fa44e9de65c95e75 |     
    arm      |       host-mfgtools-0.02       | NOK | https://autobuild.buildroot.org/results/a531245bc5964dddd3bd74822e74598e76d3f832 |     
   x86_64    |      host-mosquitto-2.1.2      | NOK | https://autobuild.buildroot.org/results/e08245e82fe6644c693e9d3073094b1065757eeb |     
    or1k     |      host-mosquitto-2.1.2      | NOK | https://autobuild.buildroot.org/results/2bafe8a6c36dca28de63915d03f581a125205fad |     
  mips64el   |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/823fc28d12570c3517c076ed2445c52d7130791a | ORPH
 microblaze  |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/14636a196973bef275f8247f5982c9436ab253df | ORPH
    arm      |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/96da58f6ee80e989a6d5602dfe9c9d37f99cfcf1 | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/22f5285789f269cd608a434d2052cb4d6a25808a | ORPH
   s390x     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/e597282f2b1d282ae9e0564d7d2b6afd100bc34b | ORPH
  mips64el   |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/abe701f535624480aafb04c469a66389cc2e15b0 | ORPH
    arm      |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/46396c53134ebd675c100ba3b018ba65efaadde5 | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/740f894e1bbf67f78f157659355c1b59c9220379 | ORPH
   x86_64    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/b423f1bf1d5eb3a5701f0c940554096a2ee29059 | ORPH
  mips64el   |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/20c97f74103fedd15d1c8da00aaea77ad87dcdf0 | ORPH
   x86_64    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/d2dbcd1d9b4dbe7593bca4f6967186a11398390b | ORPH
  aarch64    |        host-rust-1.99.1        | NOK | https://autobuild.buildroot.org/results/ab65558ebbf14021fdf0d03e0ffe1be2435d8f4c |     
    arm      |        host-rust-1.99.1        | NOK | https://autobuild.buildroot.org/results/60c81b9a77b3c515178a5e4db41472945e1fe4d4 |     
    arm      |     host-ti-cgt-pru-2.3.3      | NOK | https://autobuild.buildroot.org/results/8f24a192b1d377466e41e46f603ea927878b3d3f |     
  mips64el   |    host-uboot-tools-2026.07    | NOK | https://autobuild.buildroot.org/results/db198283e319a4cb997c1567180290a79663e3ad | ORPH
  mips64el   |    host-uboot-tools-2026.07    | NOK | https://autobuild.buildroot.org/results/e3d668a18cb02c80e84449fbb3ab50784c9f53d8 | ORPH
 microblaze  |    host-uboot-tools-2026.07    | NOK | https://autobuild.buildroot.org/results/8abfdfc893b7dfbed14ed75031994e7ef9aaafb5 | ORPH
  aarch64    |    host-uboot-tools-2026.07    | NOK | https://autobuild.buildroot.org/results/03606ff89389735899129925dc6005c9247c366b | ORPH
powerpc64le  |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/161b460552ba9bce8e8d36421a39533260533ae1 | ORPH
    i686     |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/4345ea4fae2531ff659847fa3db7ee0ce90b08cb | ORPH
    arm      |        host-zstd-1.5.7         | NOK | https://autobuild.buildroot.org/results/d03a93907ba719933a5e51adad8f258a688c4874 |     
  aarch64    | ibm-sw-tpm2-rev183-2026-08-26  | NOK | https://autobuild.buildroot.org/results/7f44514b7791736dd6746178304acab12062a96e |     
   x86_64    |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/62accbea2d3be32618b1ebeeb78ef504ce5823c9 |     
  aarch64    |          k3conf-v0.4           | NOK | https://autobuild.buildroot.org/results/df630d33764a8381af016d14bb4bb4c374969f2f |     
  mips64el   | kismet-52bcb902e36b2df1562c... | NOK | https://autobuild.buildroot.org/results/b08745aab27185f9d410341acfc005bc4cd17ba7 | ORPH
  aarch64    | kvmtool-7ad32e5514aca2b6d19... | NOK | https://autobuild.buildroot.org/results/19903415f9d9da87eb9bab8a0e91b4ffd86bd2a6 | ORPH
  aarch64    | kvmtool-7ad32e5514aca2b6d19... | NOK | https://autobuild.buildroot.org/results/047408decdd4f9e49d5e94b31b4fb32def3af975 | ORPH
    arm      |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/756efe176812427091958621d0bf7db381d443b0 | ORPH
  aarch64    |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/f6ad57ffa62be9413b09be064035a7ff40b74fd7 | ORPH
    hppa     |          libavl-0.3.5          | NOK | https://autobuild.buildroot.org/results/ea8211a8ca7cfc5f3f7f8a3495bf3ba086477d59 |     
  aarch64    |          libbpf-1.6.2          | NOK | https://autobuild.buildroot.org/results/5d75696d75695e3694b73495920c28725ea1505b |     
    i686     |        libecoli-0.11.3         | NOK | https://autobuild.buildroot.org/results/60a5a2aed4b163fe4de60306242ba9ec16669c16 |     
   x86_64    |        libecoli-0.11.3         | NOK | https://autobuild.buildroot.org/results/34690ba9076d2a3e3946d31211a8b17563f0d2b5 |     
   x86_64    | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/8a90ca43db0027b4bdb61b3733fb37a5bc06bb64 | ORPH
    arm      | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/73740b16647cda8250eb37f05e9a7f88b9098a4d | ORPH
    arm      |       libfribidi-1.0.18        | NOK | https://autobuild.buildroot.org/results/d7100631d7bc0313a0a0ff762f25301e23e05ad5 |     
   x86_64    |        libglib2-2.90.1         | NOK | https://autobuild.buildroot.org/results/4438f4d71c7ab5ad2ca4bec5f6d013649aad2fe1 |     
   x86_64    |        libglib2-2.90.1         | NOK | https://autobuild.buildroot.org/results/e9d05e52190afe7bc92edb88829927475fcad885 |     
   x86_64    |        liblockfile-1.17        | NOK | https://autobuild.buildroot.org/results/669a7442b4f306a85b861c7d196f07003073af83 |     
   x86_64    |         libmad-0.15.1b         | NOK | https://autobuild.buildroot.org/results/a6fe7d360fc096270a737fd57e494538e6954fc3 | ORPH
    arm      |         libsepol-3.10          | NOK | https://autobuild.buildroot.org/results/18f5d880166aa3a0df7a8da86775d5064291776d |     
  mips64el   |        libtalloc-2.4.4         | NOK | https://autobuild.buildroot.org/results/2366223debc3a4194e9f0b3508ae9330bd7d0ce2 |     
  aarch64    |      libtraceevent-1.9.1       | NOK | https://autobuild.buildroot.org/results/d39ffed23178bce51a19fdfb8072bf313c2a9a43 |     
    i686     |      libtraceevent-1.9.1       | NOK | https://autobuild.buildroot.org/results/b59e79ae4168687dc0b111a254bc871ac087766e |     
powerpc64le  |         libupnpp-1.0.3         | NOK | https://autobuild.buildroot.org/results/9f805378f3e170420256da4bac4c6cf8cdb5f5f7 | ORPH
  aarch64    |      libusb-compat-0.1.9       | NOK | https://autobuild.buildroot.org/results/9ac78fcce9ee649c55222e786d996279c01a7ec8 |     
powerpc64le  |        libvorbis-1.3.7         | NOK | https://autobuild.buildroot.org/results/0d662ee0c93b94d68c911aac0e861fdee827c9ed |     
    arm      |      libwebsockets-5.1.0       | NOK | https://autobuild.buildroot.org/results/b05ce330be76f6ef1a5e5688c043b031270d13a3 |     
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/3495a796294d6007d23a65440a7a2bed1e6272c3 | ORPH
loongarch64  |         linux-6.1.191          | NOK | https://autobuild.buildroot.org/results/da68cb6f0e399763c891e27ebe1e6f55957cf2ec | ORPH
  mips64el   |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/dbeb00412bdfe44f4df4e6219fb5d316c62e9beb | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/bc5d67ed221b5664dc386db80edf7c83211558f9 | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/8791d56d77e19d9a7655a990eba360d2824c3a45 | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/efb6cca4da81c50fb591e7f1e9e136e1f281f01c | ORPH
    i686     |          lmdb-0.9.35           | NOK | https://autobuild.buildroot.org/results/1e0fd7d21a6fc6b53fe378b0dbe05fe2f6b0ba9e | ORPH
  mips64el   |          lmdb-0.9.35           | NOK | https://autobuild.buildroot.org/results/59918217c0431f780c60bdf0038d343832f931ef | ORPH
   x86_64    |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/2958e65c33126abb433696155c8fdd997632651f |     
    i686     |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/d0dd03b04200af0a232e13462096a865197ea251 | ORPH
  mips64el   |           mc-4.8.33            | NOK | https://autobuild.buildroot.org/results/65821c11fd4ba913a5d084a11a9c48512e5e27a7 |     
  aarch64    |            mksh-59c            | NOK | https://autobuild.buildroot.org/results/5c0deca749433c9c4a9239a2a5a5442c8ab3df3f |     
 aarch64_be  |            mksh-59c            | NOK | https://autobuild.buildroot.org/results/0278ef9fd26b4b51f998135602d4527aa49c1413 |     
    arm      |          ndisc6-1.0.7          | NOK | https://autobuild.buildroot.org/results/b241d0ec6ea80682193838096d44d4591dc5d817 | ORPH
  mips64el   |       open62541-v1.5.10        | NOK | https://autobuild.buildroot.org/results/0815dc8fc3bd7bc70b2ccb08a1b847b43e372ace | ORPH
    arm      |           opus-1.6.1           | NOK | https://autobuild.buildroot.org/results/821e402b103138a44c9ce2a2c6c6b2c7a8efa14a |     
  mips64el   |           opus-1.6.1           | NOK | https://autobuild.buildroot.org/results/1c0fb7d1d9def0425b0a90ab6280d2d64613010b |     
    arc      |    passt-2026_07_28.f8df3f1    | NOK | https://autobuild.buildroot.org/results/73419e24006187c2ae2c1ecd9a660bac3461c401 | ORPH
   x86_64    |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/2ba9ca1b7bc09bc29b94c51b0466389691cf4139 |     
  mips64el   |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/0b758d557366595257a164cc5a2bc61e04e3cdcb |     
    arm      |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/cbdce2dc32bc0da704362ff70400385305c3da73 |     
  riscv64    |         pixman-0.46.4          | NOK | https://autobuild.buildroot.org/results/94446a116c6b686e7156c031a9b6f78de2def06c | ORPH
  mips64el   |           pppd-2.5.5           | NOK | https://autobuild.buildroot.org/results/8f69004dc0fabe676c39dcc607e913b5fa03e7b9 |     
    i686     |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/92f26dc6864aff31cf33d95be207042eda265de6 | ORPH
powerpc64le  |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/411a2b14f72ee89b5b535ddc42fbc7ee9d6b2e79 | ORPH
  mips64el   | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/7c1e8d1cf545f500a50046c329e884d12123519b |     
  mips64el   | raw2rgbpnm-f28b903ca63b4c22... | NOK | https://autobuild.buildroot.org/results/1007a5fbd0d1bd7670c36cdf010734da0eb34be1 |     
  mips64el   |         rdma-core-62.0         | NOK | https://autobuild.buildroot.org/results/269b2a85f1b0379eb9ccfd9000e65d99bb6f356b |     
  mips64el   | rtl8723ds-122a574f780da32bb... | NOK | https://autobuild.buildroot.org/results/30b4aa510854c7c9249cb16081dd8ba6d4bc7fac |     
powerpc64le  | rtl8723ds-122a574f780da32bb... | NOK | https://autobuild.buildroot.org/results/e8557b60e05dadf9a2dd6828a42529a8618093e5 |     
powerpc64le  | rtl8812au-aircrack-ng-c3fb8... | NOK | https://autobuild.buildroot.org/results/3fadf3e2191df31e29fd525f6291907fb6488674 |     
    sh4      | rtl8821au-bb26b6b06c47b79c1... | NOK | https://autobuild.buildroot.org/results/5264ce72fae125c8ffb2939d06b82283fd15d87d |     
powerpc64le  |         rtl_433-25.12          | NOK | https://autobuild.buildroot.org/results/c79ba0704d8c4c2ac0b133f04e5a1dea62f773c9 |     
  mips64el   |         rtl_433-25.12          | NOK | https://autobuild.buildroot.org/results/572a164359c9ab5046e974076d6b2131b5bf08dc |     
  mips64el   | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/2d843c9530fd5d9cfadfe2b841080c68eec20a3a |     
powerpc64le  | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/9ddd15043ccc7a3a53d06313b9acc2a16ee94288 |     
powerpc64le  | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/0a16f4c2bb1f94598f54fe1914250532ccf927d2 |     
    i686     |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/9a6c6040f5667f03418462bb9904e7429ae5d085 |     
    i586     |      sane-backends-1.4.0       | NOK | https://autobuild.buildroot.org/results/483349bbe9148797e9004e458f055b8663c5c343 |     
  mips64el   |           sbctl-0.18           | NOK | https://autobuild.buildroot.org/results/de330f725b9bd78704b1fc8c2e5df2bf961b4019 | ORPH
  mips64el   |           sbctl-0.18           | NOK | https://autobuild.buildroot.org/results/1c67ce2534275e606d275df213e526adf058d198 | ORPH
    i686     |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/cca8a9de6a8d7dc3feeed199b746617a090c473c |     
powerpc64le  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/8950cb8a477f51732d630cc76c4c0f4a8bd5472a |     
    i686     |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/18bb3018c09d60ad75e95bd0e4218d10a386b8f6 |     
    arm      |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/57785c734c842827426f80cdcb0678bb403345ce |     
  aarch64    |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/637a87f23eb58fdaace1fb1a92cb367a2b596d1a |     
   x86_64    |      uboot-tools-2026.07       | NOK | https://autobuild.buildroot.org/results/492bb29e9f3add038f667747ab6b8ec29bfcb23f | ORPH
  mips64el   |      uboot-tools-2026.07       | NOK | https://autobuild.buildroot.org/results/0c01a2e554be471349fe923c39e59707a65f3cec | ORPH
    or1k     |         uclibc-1.0.59          | NOK | https://autobuild.buildroot.org/results/c274062f91c11c3adccc69fc6f24d8d4dbcd130e |     
    arc      |         uclibc-1.0.59          | NOK | https://autobuild.buildroot.org/results/bb3f5c6e61cf0ecec5e3aa88b1cccaa0e4659e45 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/35c167cf5fc6e1c0ca26428353fdf78262d38a60 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/b833301e6ca87a5d6de87506e7df812f9c576b72 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/34f4bd1dd54eb1086d86c2ba163b506c216f0894 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/e879f23e5586a2093e83e42f14b77b4685d892da |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/7f9a87dd25f1d60b6da368a07f74f03570628aa3 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/c424255256d0edf87abbe1d3acd8f478f4fc7110 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/919df7706dd34c279dd2c17fe77136b44af30d3d |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/f22adbdaabc7310e681cd295072776a885262c29 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/52c9db6c17953b4418ed998c1dec0dfb22cdd00a |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/785eb0875b66b15fd3af7f2ad04213f875b28259 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/dd58208c150387cdaddd4fa05187f680d554feec |     
    i686     |       util-linux-2.41.5        | NOK | https://autobuild.buildroot.org/results/ecdf84cb871c251561967fc8903d7cf1ae326f88 |     
  mips64el   |      virglrenderer-1.3.0       | NOK | https://autobuild.buildroot.org/results/5cb2ed73389be8082fce1f48fe1c494e3a85fb52 |     
powerpc64le  |      virglrenderer-1.3.0       | NOK | https://autobuild.buildroot.org/results/136aa8459a7dc9ed9ba74b7327c1d70b31690958 |     
  mips64el   |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/0b70a99c5e3ebeae0af32a1ba6bfa462c8330334 |     
powerpc64le  |       xlib_libFS-1.0.10        | NOK | https://autobuild.buildroot.org/results/fb7dd2bc9df41de95af603e4e19a66be1279c26f | ORPH
powerpc64le  |          xxhash-0.8.4          | NOK | https://autobuild.buildroot.org/results/c3318f67d09936035eed29c9d1365b250d54a57d | ORPH
powerpc64le  |          xxhash-0.8.4          | NOK | https://autobuild.buildroot.org/results/673d2fc7cf966eb60e3d6e93c3d07c8d43ac3d1d | ORPH
   x86_64    |          xxhash-0.8.4          | NOK | https://autobuild.buildroot.org/results/0e7b01602a033e0374424def6467ac7327edf61f | ORPH
  aarch64    |          xxhash-0.8.4          | NOK | https://autobuild.buildroot.org/results/75b55e84f1f968e0d8a1112ea2f46a62cf18d2b6 | ORPH
    hppa     |            xz-5.8.4            | NOK | https://autobuild.buildroot.org/results/d543e6c0456a491ddefa44f1ad613bc70c120b26 | ORPH


Classification of failures by reason for 2026.08.x
--------------------------------------------------

                       unknown | 2 
              host-rust-1.97.1 | 1 
                   linux-tools | 1 
                  pdmenu-1.3.6 | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        host-rust-1.97.1        | NOK | https://autobuild.buildroot.org/results/e88e4a9e2e40a0edeb9fe32455976ef478d578e4 |     
  mips64el   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/9c52a62dcfa9e6a5fdeee1d09e9dc006fc98d5c6 | ORPH
    i686     |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/061ecf034b0a4528cd4e88ddd631685533639170 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/36a522fdbc270a5224291e30091d1ba014185be1 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/455abb86c3e950426648ff0118e2544695eb3710 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

                  botan-3.11.1 | 1 
           gumbo-parser-0.13.2 | 1 
            jpeg-turbo-3.1.4.1 | 1 
             superiotool-24.05 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          botan-3.11.1          | NOK | https://autobuild.buildroot.org/results/90fbfec173aa0e6fc7d6b69ecaca9076544a9196 | ORPH
    i686     |      gumbo-parser-0.13.2       | NOK | https://autobuild.buildroot.org/results/4e2a9e05910a1224a85e39370a00f06345d9ee7a |     
    i586     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/84ec38f3675b04281ab02a6b29afc8de03a120cc |     
    i686     |       superiotool-24.05        | NOK | https://autobuild.buildroot.org/results/41f8fffbceda24e94d35f368cde59a39174d514f |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                   perl-5.40.5 | 2 
              host-rust-1.82.0 | 1 
               iproute2-6.14.0 | 1 
               libconfig-1.7.3 | 1 
                linux-6.12.114 | 1 
xilinx-prebuilt-xilinx_v202... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/b325fbe98775ce840229354e1e76e38e494f93ff |     
   arceb     |        iproute2-6.14.0         | NOK | https://autobuild.buildroot.org/results/bec5b65af0785f5244185391590b018ef5d1035f |     
   x86_64    |        libconfig-1.7.3         | NOK | https://autobuild.buildroot.org/results/0d835e7f0857e65da38207c866493496c08dc352 |     
    arm      |         linux-6.12.114         | NOK | https://autobuild.buildroot.org/results/b399777961cbecb9bed1c0bacbd77890c89bef43 | ORPH
    arm      |          perl-5.40.5           | NOK | https://autobuild.buildroot.org/results/910424895fda6aacc55e6bf81f40113d4f50719d |     
  mips64el   |          perl-5.40.5           | NOK | https://autobuild.buildroot.org/results/deac4f8b7f95020816122e8272651d927b4c30c9 |     
  aarch64    | xilinx-prebuilt-xilinx_v202... | NOK | https://autobuild.buildroot.org/results/676356634cabcc36169f387397d7e252e37812db |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
