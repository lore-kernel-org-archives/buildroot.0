Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC59606A31B
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 03:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=TR7Zxcw3;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TRw5PkOe
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8243607F6;
	Tue, 20 Oct 2026 03:23:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9L6bIfMPlGd2; Tue, 20 Oct 2026 03:23:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 736B0607E9
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792466621;
	b=mK8aUd4agIb3q1iME+QJHXvlP1cBDz81DbPN4uF9e9kS10vDkuQFdkBFWC9dxxZIWUW8
	 8XZwY0pMp/pjDURoxk6eycZe1Zozm5uDboAKCBuugWKKHlFffJWtRDXkODznGHSJKbKey
	 BC4LU0w45Thx0azf07QVWX93xYaYMfuDh7i48yMBxUZjGCFOQE9laGTR1g+k2QXRMjhuH
	 zuDkIAkEbvHuy8vLuTrwAcx7bmuUO+jQ3VKrNMNA6O/FhCKqipN8Jbl/98H5VuGVArgfD
	 gqhyKv/hhw8/cJ2W4PSWRXgnmdCV8pQFwsv6/8SwxE2r0Y5fF0TZn3Qwq2FqxnDipMw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792466621;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=MHgtLeD8Z1JJiVaYHGtRm5Z3mmOlszRkK/Kyl+2OH00=;
	b=eSpI4nLU5a4cbp4ea9zWPUoyAZjbwk84tCoJ0XfP1IJDEO0pAuwgwFsBQWHoPwDeWoFx
	 GnGCP3ohOpxbGu8CL8AwmC8btX6kRKhbEZVFnfjo1diU/mWAIqp2A+0zZDcDxiqWRlbQ1
	 /4vBmWtcp4k98F4SOlXgjhwDcb308Osw50hEUsyfmXi/Q9fPbdIqpv/hb2aXp+hIYJpay
	 BWOUXlPbHaYuUVLMzsBsO3qbifRFgERhNa+btmSzCkrSccTCZzz0ElZJoc5Px47vcrGmQ
	 utRsEu05p0u5YfIz48K3PgIftSW+3WNPbfgM3ckyn+AXnF8AjYdjmaO35h6pgTLngjA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TRw5PkOe;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792466621;
	bh=MHgtLeD8Z1JJiVaYHGtRm5Z3mmOlszRkK/Kyl+2OH00=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TR7Zxcw3ZeQaGMp3552BCs4n0BT8NglIrq2Q5Mza+bllY5KeENVJc0wpBwfHk8U4n
	 231oMu++0LnzaFI5+pj32hrMBjgh4a+uFDCAHfcp3mImf7DUsyN1NUjl6y4gf/gKxL
	 vVghndYzXoybagIk+K56y3W6YplbQhXrCKikEYe2FnOGXmj7jcX1xGllBxRnd3Y9zz
	 gXGjXHgLCzfOn2o8C7twiC1C7SYfnpm0MpoBzthf8fB85hB+P1dtbq6lYQHXDJGAmr
	 9slrVSW1ndwjS7r0uhm6CAT1WUcVBri3vyNxscS50h5RJDbBS9oWHsaHnmLTP0H+dt
	 ZPpCLe4GjmeJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 736B0607E9;
	Tue, 20 Oct 2026 03:23:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 91BDB465
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 03:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83CB0607E9
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 03:23:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cpyClE2QIm05 for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 03:23:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org F294860773
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::336"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792466619;
 b=RhU290rgmnn1f3r5PE07l7KGcVCvJRSfAobhwKcwcswvBrowU8dleztWfZAsLxhfNCSY
 oYymNdVt+pslGwgJDt/XBUfmIk2TV/bV26NLGhQImz7mgdVTPIrKAaMee2R8XhT/fMYxV
 iONK/Q+mMVFEn9aRK6NiRWQi4HR1qpkYiz/RLzQDpD043s/lNlIK9U6yO3jm5uDOzPGvE
 Vk8HmGs3YoJZAUV2f0dFBm3tZrV/urMn13aVhk8Frog/TLEmJmVn65qjgjhd6Zyg2ogn2
 0AuPQmNq8u+ln0wr7ZUSJPn0qU7E0tgtUtCYYkadcCc8/eaO3fM8QhR6WDo37D7hIgQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792466619;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:From:
 Date; bh=njnXXIW4cM9nq3Wk9ivcOpZCl8h2jYVfpoYPnLSGXZg=;
 b=sL6+QQiA3CV0Qx9WOHuxT/dd8o2r8JigTToaRItJqiLyNdRlTW/3NVMQwAPm1X6S5bIZ
 +jU4HqR1kbASHKkXxnfwVcSRUkJIrkIL2Ooccb2UzhR2ldrnZdHCvASVcF5I44MmOMZb7
 ezvNf6ub+WmNGKS86q+147pIR7yVefzONSlcjYOO13oN7A3OaKMXrbsoQUbNvdmb+Q9DT
 QJOpmLmsSaZyUX5W1KdZO2yNSY5kK1xDj4ebPEAKlJcTVJjRkgKC4dXyA9ehdecxYYEsM
 rcSTgAusGgicxEOnnbyNxftMUlLlpIXTq0g6JziM8BgidRPKnb9HD7P+blPJG80GHVQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=TRw5PkOe; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=TRw5PkOe
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F294860773
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 03:23:38 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4a1635f7c89so25990645e9.2
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 20:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792466616; x=1793071416; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=njnXXIW4cM9nq3Wk9ivcOpZCl8h2jYVfpoYPnLSGXZg=;
 b=TRw5PkOek0vz6oNPsjOZ3Ry7HaT+GCScFe4kxclOh1iqQ6ORKbyW5If/adFoLdXr32
 i/+I6sE4jXyW/qLqPKCqJ2fbCwn3clsNJ6bqouVuDhnZATv6EWU48U6zH/IDV/MSKIKW
 MY3JcCIJd3Av2YRf1Y6Uwo/emvcWktkhAj5zIN+AtZRDCtk+XRuKBH6ZlfbJcMnNn1Ml
 s0u0DJAR5osUP84iwiGrZ7WuVNdpDzkVF8o809EvnTQTRNgEioE+NXsj4H5X41ZUatNU
 gpHNfk+DqEuVOgB2kMkakBoBISmHTOPHeqVORJNrP3ENRS5RmGvSn3F+4w18bw47/8cw
 pySg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792466616; x=1793071416;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=njnXXIW4cM9nq3Wk9ivcOpZCl8h2jYVfpoYPnLSGXZg=;
 b=e1macuS/5lugEwFxnNj9lDMvLGhMBioP+8lta7C8fAx2n3J+3wCrSuNK0NS8zA+G2+
 i8hs6CgAuBFaYA2JlI0KN+jV7nF+PHOjBMNXgbAnOpVFe5Nyh6DsIwH+4WeZSDAaEHJr
 VUzeWJeo7E8zc0Mroaz+eyjg8Z2OUWmzKHNyHmzmyVZQkPAHgZCXxMt3gRTdU03Lvfw9
 BDUkC4CS827rnd61WcLFhlqmbCACR5jdO4X5Xo6zXYQ7/gFgkI3drjmvQPV5fd5BB9Xc
 htTjC5bVwyxlPNsHicdpR+/k/hdJo9ygRniB2sBNALy0dpptr9IephNkdooA8cGqLMS5
 j+vw==
X-Gm-Message-State: AFq9FYK7ymVf3m+22tTZVs5/+H8d4P77oIedeVqLpwdJWAJlBeL5UFWB
 VLZvpqZo4miEI+0P8u0Ggc/3pcAKO/UaLu5E41/z49JlPfic0Eq1o3OeFkmB6CYU
X-Gm-Gg: AYBFou0KCWaEnmzru2ncqwz5nX6R9vPbSZg1qs4lEE/JEq4JdUMa84qlVXzblKEjK5v
 27uAqkOlnlWSz2yCjlpIJOfsZIBcv2xpTsQYG9FjSGbrkP26lQKbwRMnkmzP0YFkiSztvZ4P0TA
 7AQWMtTnT4wz+pKa/WlzWPUXNS0Eb6hPcrtjFNNQdDo4UpiWvIk8zTgwoehm0Tpcyea/UUVoQK9
 ZDE4g121Qeb9FwOyyH5+7BSB2sosocoTvpKs4fjZyJISP7ATh9ZFbZ4N2lYBGqDe5Pe5hQcb0I4
 sZoyy7MpnTDTegASGR73Tm2ShfthJ47jfTTZvEoKY1MtWluk/bY/PWb1tNhx/HWM53jnyn7GC5o
 nrhrR/hyuqWV+/kEpWAGH28Nn7Z7t+G2qYDyT+iHHEw1kscpTFzjRwPtgdYS4gfzahcE433vgAZ
 aghz0mZ+gpufaM00EA2YDtkg7qs9+LgpPJ/RG9AtuPxmS/czWAwZpyRVRY523N2Jk70ZwFUh8ep
 A==
X-Received: by 2002:a05:600c:1392:b0:4a1:62b8:9aa1 with SMTP id
 5b1f17b1804b1-4a1d75aa87cmr220695065e9.2.1792466616306; 
 Mon, 19 Oct 2026 20:23:36 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e1d82dfd5sm2826885f8f.47.2026.10.19.20.23.35
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 20:23:35 -0700 (PDT)
Message-ID: <6ad6deb7.144d266d.23d9ac.22f2@mx.google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 20 Oct 2026 03:23:35 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-10-19
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

Autobuild statistics for 2026-10-19
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  5  |  8  |  0  | 13  |
  2026.05.x  |  2  |  7  |  0  |  9  |
  2026.08.x  |  3  |  3  |  0  |  6  |
    master   | 25  | 46  |  0  | 71  |

Classification of failures by reason for master
-----------------------------------------------

              libmodbus-3.1.12 | 9 
              host-rust-1.98.1 | 2 
               linux-pam-1.7.2 | 2 
   openvmtools-13.1.0-25218885 | 2 
                   perl-5.42.3 | 2 
raw2rgbpnm-f28b903ca63b4c22... | 2 
am33x-cm3-fb484c5e54f2e31cf... | 1 
              asterisk-22.11.0 | 1 
                    attr-2.6.0 | 1 
                    ccid-1.5.2 | 1 
                   ccrypt-1.11 | 1 
             dahdi-linux-3.3.0 | 1 
                 dovecot-2.4.5 | 1 
              e2fsprogs-1.47.4 | 1 
              erlang-26.2.5.21 | 1 
                 highway-1.3.0 | 1 
                   iperf3-3.22 | 1 
                libaio-0.3.113 | 1 
                 libclc-23.1.3 | 1 
               libecoli-0.11.3 | 1 
          libmicrohttpd-1.0.10 | 1 
          linux-5.10.254-cip72 | 1 
                linux-5.15.223 | 1 
        ltp-testsuite-20260529 | 1 
                     lxc-6.0.6 | 1 
                        mg-4.4 | 1 
                  newt-0.52.25 | 1 
package/ffmpeg/ffmpeg.mk:63... | 1 
               pulseaudio-17.0 | 1 
                 rtl_433-25.02 | 1 
               tcf-agent-1.8.0 | 1 
           uboot-tools-2026.07 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/5855b999742386e13634b519d095ccde2aec0b18 | ORPH
  aarch64    |        asterisk-22.11.0        | NOK | https://autobuild.buildroot.org/results/502b17c4d9c30f36028cf759a7884a32c8b732c5 |     
 microblaze  |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/017e932c6979f5f9ddbf02be924305e1cd5ab5f7 |     
    i686     |           ccid-1.5.2           | NOK | https://autobuild.buildroot.org/results/d79dbbb8e02d06ef939da0e48d867b66c6e4d93b | ORPH
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/d5e58830cda23b0f71840a70c11c0be3f2de9926 | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/7724ebafadd3e949dc56678dcbd63de61a5465bf | ORPH
    i686     |         dovecot-2.4.5          | NOK | https://autobuild.buildroot.org/results/b2aa9fa8ac9cf2f3d3171c86b9663360244896e4 |     
  mips64el   |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/9f65c64d880cf33bdb58a6cad43d0ca953a77918 | ORPH
    i686     |        erlang-26.2.5.21        | NOK | https://autobuild.buildroot.org/results/9a5f0343cc8ac084961824edcb0e8d4b7b043c7d |     
  aarch64    |         highway-1.3.0          | NOK | https://autobuild.buildroot.org/results/7debcd062d2627714f7ce81e88a8ff9e425ff9fa |     
  aarch64    |        host-rust-1.98.1        | NOK | https://autobuild.buildroot.org/results/2039d74546f3c1c39de6b9d38bde4b05390fc1de |     
   x86_64    |        host-rust-1.98.1        | NOK | https://autobuild.buildroot.org/results/06c458ba2023fb54a105d1f8148fcfa49f47309e |     
    i686     |          iperf3-3.22           | NOK | https://autobuild.buildroot.org/results/6ed8f60f56f7fcd11eaa1ba160837275b8113e1a | ORPH
 aarch64_be  |         libaio-0.3.113         | NOK | https://autobuild.buildroot.org/results/0019c80cc07db35d11241c516c04a0ad3e00ca57 | ORPH
    arm      |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/e1455813986e61992b2c78be8fef00c71e3b6c5a |     
    hppa     |        libecoli-0.11.3         | NOK | https://autobuild.buildroot.org/results/6415a11aa7ec78d9f7850e8d3ec33378e1433e94 |     
   x86_64    |      libmicrohttpd-1.0.10      | NOK | https://autobuild.buildroot.org/results/fe4221b8492e8709944f35cfb2c3fd597b2f01ea |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/4bf74fb55a8bc6ab765e077f3b6078f8845328c1 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/5ed412200897d4977abef32918fcf35ef0567751 |     
  aarch64    |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/bd92d087d774a78aa483973adcd4db7f806b722a |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/9ef4610b9ddb3e0232037ff186a57b5ba3199061 |     
  riscv64    |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/c141228e44335eb5b0996c86fc8830e506f6e09e |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/cb56bf40c2b0fc37473b666e5040c12b94386b3e |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/dfc1569338f0031ecea6323b607938ea8aa77bb9 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/fa98fe120d40b14d96be5bfaf6163bdf7f1d54df |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/9d290570ca1ba95fff49a414f13852ed893da6d0 |     
    i686     |      linux-5.10.254-cip72      | NOK | https://autobuild.buildroot.org/results/f0ee86dd2e2b22bfe1343bc51a0153a5d7397064 | ORPH
    i686     |         linux-5.15.223         | NOK | https://autobuild.buildroot.org/results/7a7aff1fb99f9efc1bbc2889fcd77d6c74522154 | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/976974e36cf6c3f26933b3df2ebad296973804ae | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/4d8f24e402c6229ad181604522df488b03a4027e | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/ae98720752e6d531c56e0f96d45acb2dc89058d6 |     
 aarch64_be  |           lxc-6.0.6            | NOK | https://autobuild.buildroot.org/results/9be1bf98c1f3b7f252443e15f14c455242d935f0 |     
  aarch64    |             mg-4.4             | NOK | https://autobuild.buildroot.org/results/9d55c1b27627118c4279d9aade9f65b45db57e52 |     
    i686     |          newt-0.52.25          | NOK | https://autobuild.buildroot.org/results/4265b15881d21bd961780398477d059255ec5202 | ORPH
    i686     |  openvmtools-13.1.0-25218885   | NOK | https://autobuild.buildroot.org/results/69f36b9475c838d5028b4ecd8176389f8ee80ab1 |     
    i686     |  openvmtools-13.1.0-25218885   | NOK | https://autobuild.buildroot.org/results/d3b6ed5b5d5526af746ff86065e226cd55b0f64b |     
    i686     | package/ffmpeg/ffmpeg.mk:63... | NOK | https://autobuild.buildroot.org/results/9b4ed5a68fb1f844ffbb4cc6e51b297cd77e3dab |     
microblazeel |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/216dff9b09670943de6e71cf6655c23ce344b68a |     
    arm      |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/675ee3e0b1b0f5f3db4b1b4e8b7e3eef9e6a53bd |     
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/1d47ef6a8a636e548b0d2ab65a083e7e1f7b6006 | ORPH
    i686     | raw2rgbpnm-f28b903ca63b4c22... | NOK | https://autobuild.buildroot.org/results/b5826e3772cf12cf73cc49128a9c5d1e4bbf2c46 |     
    i686     | raw2rgbpnm-f28b903ca63b4c22... | NOK | https://autobuild.buildroot.org/results/913e58213d4ff2a0ee8e9e39fce0f5639eab4480 |     
    i686     |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/9297f04268c9980e14ed95aeb7f4192e9086ac2b |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/dc574b6e314c2aff1552db9ec6cb2524357a8bae |     
    i686     |      uboot-tools-2026.07       | NOK | https://autobuild.buildroot.org/results/8ef838717470f1ed870e13a4a767a45c6aaf312b | ORPH
    i586     |            unknown             | NOK | https://autobuild.buildroot.org/results/00fcf7c3e990abfab253e1f42401a565e2f3e6cd |     


Classification of failures by reason for 2026.08.x
--------------------------------------------------

              libmodbus-3.1.12 | 1 
   openvmtools-11.3.5-18557794 | 1 
                       unknown | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/c0bd0b221314cbcd8708a3f8c4ac2bda7b7f7905 |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/71edde57299bf0292bbf109b23db7e5152dd1839 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/1da51c0992f595aca138002664e5d59789c12d93 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

            jpeg-turbo-3.1.4.1 | 2 
              erlang-26.2.5.21 | 1 
                 mesa3d-26.1.2 | 1 
                   perl-5.42.3 | 1 
                pipewire-1.2.8 | 1 
                       unknown | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |        erlang-26.2.5.21        | NOK | https://autobuild.buildroot.org/results/d9450e9294b6ed61f4dfded834b901ead9072e59 |     
    i686     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/688594e1d01060374d6fa69bc284ee4281bccfd3 |     
    i686     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/e3fb0ebf0f08a578a66c49f394c16340b547c90b |     
    i686     |         mesa3d-26.1.2          | NOK | https://autobuild.buildroot.org/results/7b119c1ec61c52d330f0ec018fa49ef0e67f1509 |     
powerpc64le  |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/845fd8480c9ba4d73f7bb1a5ff22c8bffc0edc68 |     
    i686     |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/95e1a393a69aff2f481d60b111bc1bd504e2df03 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/5d07aa667cff19afc38ed5f53d814ed8295dc2c8 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

              fmlib-LSDK-21.08 | 1 
            host-go-src-1.27.2 | 1 
        host-python-lxml-5.3.0 | 1 
            host-skopeo-1.18.0 | 1 
                  libnl-3.11.0 | 1 
        ltp-testsuite-20250130 | 1 
                   perl-5.40.5 | 1 
                      x265-3.5 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |        fmlib-LSDK-21.08        | NOK | https://autobuild.buildroot.org/results/ad1991898f282ebba9f018f08500a441e0b74855 | ORPH
    i686     |       host-go-src-1.27.2       | NOK | https://autobuild.buildroot.org/results/07703906fad2ef8aeb5667795d408b5372a1244c |     
    i686     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/97f71d242428832278ea2680ffecea0b249a15c2 |     
    i686     |       host-skopeo-1.18.0       | NOK | https://autobuild.buildroot.org/results/8ddc0f0971fb1e9cbf8aa531c57f41dbc490e75e |     
powerpc64le  |          libnl-3.11.0          | NOK | https://autobuild.buildroot.org/results/33c956c0ec62521e4913ec8f938e5fcb04470059 | ORPH
   arceb     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/a7e3d4d718637c06ea3ffbf9a70240fbd7e604ad |     
   arceb     |          perl-5.40.5           | NOK | https://autobuild.buildroot.org/results/601117aacdd197018fe60f93da101397f3945edb |     
    i686     |            x265-3.5            | NOK | https://autobuild.buildroot.org/results/356a593981189107b8c62f41a9eb85cc738f4632 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
