Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF27606A323
	for <buildroot@archiver.kernel.org>; Fri, 13 Nov 2026 04:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gUgcU/r3;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jQjvkRdF
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B88D409AE;
	Fri, 13 Nov 2026 04:24:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xj4zbZ_yGyZt; Fri, 13 Nov 2026 04:24:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DD8BA409B2
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794543872;
	b=CrBtbIi5cCRNEeLH5Z+lHGPCRYS43cEUm7LgxN6p8Dz04ZgqBc7w+HgqHsG14kMqFp5H
	 XMlmtSW5LP0zNEy57BDelLTgJUqyDQDA/hK46CHouCa3VT6u5BgnevAitP7++n9AcrVvl
	 7S+XtdUjHjtlkkHYN3X+R78EOng9QICkXLVHiNVnn+qOmSQ3t2X48SBAFgCk6/GbhoPzP
	 D7Ltm9h8zk85MZ+RtItjsMlrQVESvoIBuG1PFE+qKvrJiX+JDpeTq77mx/ydTZwesaKx0
	 Dum3+6HDBk30ZfooG3XJh2HH7rhPPL9ewvybgK24rLWQTfMJ0XgPWGhRut1LdVYUnZA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794543872;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=oBuPNoKTX5adiNEPg0xSIMewLMj5scUZPV1XYEmIygg=;
	b=TcDz3fF4kd8jsNot0pzIgKnNwaeV8vNRiFZhY1kbOwcX2qBad+ChT4I09TyCZ5XWz1ry
	 HJpiVk0AllyUtkwtjLQHlZ+OQr97Nj7iCDeQxT3wwYN5xeSr9X9LzCrsqVHYD5HineOTu
	 4mSZNHk7bMk4nqFXsKA2bNH54ubzAQbo8D4DQ8cucW3YgZIENXnjs8EvJQjjTH1nU5UBb
	 gEH8bayK/kYaqOrwOKxDLBwm9j97Oy08IR/hWj1vao0V/4MwwmpUb+1EgIKiYolkS6y7v
	 dgr4m4iSqnTL0D2qdIGjMxI/ZailAeiGSnqAzWV0ThDAwS1WHTq2KRDeM6/GTl9TDJw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jQjvkRdF;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794543872;
	bh=oBuPNoKTX5adiNEPg0xSIMewLMj5scUZPV1XYEmIygg=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gUgcU/r3Syhwk35xRQliKmMlJ3yCudxIBNrD+F3mvKqujNpnCBDSZ+cmLEu0bEYM3
	 Rk8TppIheC4GeNEXIX9Kd6jUhCksAzEwVhzYYtmEbjeExpeVJYvYGPk1gENIDBUx2T
	 cYH5kb5khhy4QfUe0go4sxStyTTB//NUa9od4qO7kmwQDWD3KhrfVKhigu1e6+sqol
	 cay496iYVs0oKKnncnkRFph22cMmy3tudJpa2wLXaiPuaDlYevdoPWw9gh3059PhgM
	 YGeoBZLiZYI/GwEmOOmnWDXblzafIdfTQYG/zFHXQQ0ONTiaPOGvQhtNkvu+KNlND/
	 XvlaDwOml8elw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD8BA409B2;
	Fri, 13 Nov 2026 04:24:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7195D1370
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 04:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63AA8409AA
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 04:24:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ufJrp-advzUj for <buildroot@buildroot.org>;
 Fri, 13 Nov 2026 04:24:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C3C27409AB
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=jQjvkRdF
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C3C27409AB
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 04:24:26 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4b79502c27aso3248105e9.1
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 20:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794543864; x=1795148664; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=IvFkXKDhFPQbrNk9zuH6/WuexCg05W4IIv1wf1nzojI=;
 b=jQjvkRdFi2eQUiz74QPy1pMiKpAz8vme8j9ZZWztcWk6R/KbD5mt9QXu+Atr8wLHRO
 Ux8UvVu1CXSiV7UG6NMdxSFG277H3Nk8vbLn5Zt99rk5R0GkneDf2e2PsfBxGcfbZQwr
 tUPhg2x5dMbM5RYO56q/vCX7ayhKGXkp7uJ6igOCdwuC8pMmF19480tJJeGUi4BYRoj0
 fRhd/vHyrTLEf/FW+skxXXNZ78V8LIPWHVvlFVziwvoCJgPo8BJvO7bYw4IHmWjnW92p
 3fZ8QqpTT7v6lySQ8ISHH7/v2sgX4tJWMKGjCZVefUKlrywXowM0HFrqpwGyljkAlXlg
 3cjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794543864; x=1795148664;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=IvFkXKDhFPQbrNk9zuH6/WuexCg05W4IIv1wf1nzojI=;
 b=hSy7wyastXA05/05939x4aF/5ROmjlRy0eskKXde4Fw+3hyMfFqWGOhlNycnX0QQSQ
 W5gYlaA9N5SFczdlMi5n0TMnzl/+CzoU8D+wOR/F7v3/5Q5TZQbGPrXV5bJcRtiUce3d
 xmriExvaS3wCCHRIRNNmkjX7fS96OeaT0iEO6ZAiRzq1NnkbRWx2oYUi3WZ3dyhbXW1E
 7RgQL6NoVffk2Ktf4fYF7RALY3t6j8aeHrGk9XbPDNtbLhMkPAM+MqNWaJTfuTUEzsu9
 wGrhQNvagHR+YRqr2rxWGANWLRKx8/afoYRL4lCbjdKn89vDxCqenKxLK5pUb3bF3vdw
 SsDQ==
X-Gm-Message-State: APuU4Z9PNnZSUImgOqWThrYQP7Y1tMflqgybp6IvqAG6F0CgX3jsagmn
 ZFkfML2e3HC3sbPrxwdcB1x7AE2CK1SQOsAcMS0x1atoWuCq4kEzjGoBVaakBE6a
X-Gm-Gg: AYBFou0WFtkibJiMOF6c47skHzssmi0TP+2oLnwIkfvJC0IqdBFrq4jAWdeBqxWcG7i
 +lvg/jY1ca3OEubNaafSckJ/yFABCmDcsCSeljuqJcZeVW33KkQk0qY10K8Ss2E3q4w/yKo0uLJ
 P6LWdvpdKvTSij0hT/gQEr4BHeJahF7DCxJYMMP1R5h5ibSI3YwHxrmE9tAVhU/dbl11hXaLAKX
 nqo2Ru2S6DoJzA2igSQzbmSYZCYch/iZafZQNBxXl+EALyhaaNtzzqXy/ukmmOQNXRKM1cRvVp2
 ugnNeY7IdxNR9qLTXfB6ObHnsjFJhyJZMeOt2EXfdZ6vSjfEAD1e8k1Rbe6YzDcVJOhMScC9/xt
 YG1dQDQN/4c47eHKSPZIOp7CxLwOMAwLAFww4c8yCrf7QRRkqRF4b5ypxRN3HwsC1aSdasixuKP
 3XyUXN/wMlC8obhNj7zpX4bsofcO8KeMvh3ZbsU8M1HEmh6aS5xtIU1WjZYiubTKkZpJSwvaH93
 VGG7Qj/eG0Rzzfuc4CMp+kD7IO2oVRc+0qXrjYfsEmIW2yU++VJpR/tuIToPu1Hr1IwWj5aURdE
 WR15rOhEY5UF1aLo/D2VdRUwvZE4ts8YkjfQMh/ux8fp/gg+p2I8Sg==
X-Received: by 2002:a05:600d:8654:10b0:49f:ce78:3562 with SMTP id
 5b1f17b1804b1-4bb55a8c859mr19354065e9.19.1794543863931; 
 Thu, 12 Nov 2026 20:24:23 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb55af2901sm28107605e9.13.2026.11.12.20.24.23
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2026 20:24:23 -0800 (PST)
Message-ID: <6af690f7.6be28edc.104409.d4a3@mx.google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 13 Nov 2026 04:24:23 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-11-12
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

Autobuild statistics for 2026-11-12
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  |  6  |  0  | 10  |
  2026.05.x  |  3  |  9  |  0  | 12  |
  2026.08.x  |  2  |  5  |  0  |  7  |
    master   | 25  | 49  |  1  | 75  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 4 
    host-mender-artifact-4.4.2 | 3 
                    attr-2.6.0 | 2 
                 glibmm-2.76.0 | 2 
                 lcdproc-0.5.9 | 2 
        ltp-testsuite-20260529 | 2 
            quickjs-2026-06-04 | 2 
                  chawan-0.5.1 | 1 
                  delve-1.22.1 | 1 
                 dovecot-2.4.5 | 1 
        edk2-edk2-stable202608 | 1 
                  ffmpeg-9.0.2 | 1 
                      fio-3.42 | 1 
                           gmp | 1 
               gocryptfs-2.3.2 | 1 
            host-go-src-1.27.3 | 1 
host-google-breakpad-f49c2f... | 1 
host-mxsldr-2793a657ab7a224... | 1 
               host-runc-1.5.2 | 1 
              host-rust-1.99.1 | 1 
 ibm-sw-tpm2-rev183-2026-08-26 | 1 
               libglib2-2.90.1 | 1 
                libressl-4.3.4 | 1 
                 libv4l-1.32.0 | 1 
               linux-pam-1.7.2 | 1 
                   linux-tools | 1 
                     lua-5.3.6 | 1 
               madplay-0.15.2b | 1 
                 mbedtls-3.6.7 | 1 
                moarvm-2024.12 | 1 
                    musl-1.2.6 | 1 
                    opus-1.6.1 | 1 
                   perl-5.42.3 | 1 
qt5base-fbed962c3195ab3952f... | 1 
raw2rgbpnm-f28b903ca63b4c22... | 1 
rtl8812au-aircrack-ng-c3fb8... | 1 
              shellinabox-2.20 | 1 
       sp-oops-extract-0.0.7-1 | 1 
sunxi-cedarx-b8f52d913f7372... | 1 
               tcf-agent-1.8.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/178da0f2e3a7d42a4404df8f8aca152c4104a1e5 |     
   x86_64    |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/7a03730f98db56cf71c38946198f120905681122 |     
  mips64el   |          chawan-0.5.1          | NOK | https://autobuild.buildroot.org/results/4002bf2f63087b0cb7acf7a047d719c771c6948e |     
    i686     |          delve-1.22.1          | NOK | https://autobuild.buildroot.org/results/e3a343ecfe4e2bed68f9de73b37e38f4087e8620 |     
  aarch64    |         dovecot-2.4.5          | NOK | https://autobuild.buildroot.org/results/7568bcb14d208802e3f17c9ae570ab7b5945450f |     
   x86_64    |     edk2-edk2-stable202608     | NOK | https://autobuild.buildroot.org/results/308e4a4b27ad19c81a5bad618aa44e61d4b09111 |     
  mips64el   |          ffmpeg-9.0.2          | NOK | https://autobuild.buildroot.org/results/4ea2e8c87a3c34faed9db4302a274368d87e20d4 |     
  aarch64    |            fio-3.42            | NOK | https://autobuild.buildroot.org/results/826e62b9e09179a469cd9a48bc4d294201b78eeb |     
    arm      |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/e6572103d34559aafc7f050dc00d4e023df341d7 |     
powerpc64le  |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/691920f6c88b165e68e614773d5c6a1e7417f567 |     
  mips64el   |              gmp               | TIM | https://autobuild.buildroot.org/results/3380dabd524dae31a39e46336dbca230d7b53bc8 |     
    i686     |        gocryptfs-2.3.2         | NOK | https://autobuild.buildroot.org/results/8aab2e0cde896070d32b2130849008250df8f88f |     
    i686     |       host-go-src-1.27.3       | NOK | https://autobuild.buildroot.org/results/fae75a36be46301c47334a4f177aa39a5bdd2013 |     
  aarch64    | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/1559319b4e5cdbd3d0886b0893cb543ff1322182 |     
  mips64el   |   host-mender-artifact-4.4.2   | NOK | https://autobuild.buildroot.org/results/66157029109847208537f3d52aca606cc06959d0 |     
  aarch64    |   host-mender-artifact-4.4.2   | NOK | https://autobuild.buildroot.org/results/8c1ab066e8be28d79de9eb387bcdd7f81d1968ff |     
  aarch64    |   host-mender-artifact-4.4.2   | NOK | https://autobuild.buildroot.org/results/54e558270fb87d35bc36b3176f45d67fba6d94d2 |     
    arm      | host-mxsldr-2793a657ab7a224... | NOK | https://autobuild.buildroot.org/results/6d477df2a3a2fb88f24e7acf1c0c0875a045677b |     
    arm      |        host-runc-1.5.2         | NOK | https://autobuild.buildroot.org/results/aa304f6f64e736a76bc09136f9e3ee6a1562de4d |     
  aarch64    |        host-rust-1.99.1        | NOK | https://autobuild.buildroot.org/results/fd6f59bc5efb941ab156affb58effe95a795c81f |     
    i686     | ibm-sw-tpm2-rev183-2026-08-26  | NOK | https://autobuild.buildroot.org/results/fb3e23cd0c42c6cd395fe315d5a3beba0063df39 |     
  riscv64    |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/6ce9298db6a8e359e557302e15492aa915898303 | ORPH
  mips64el   |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/ec5da7d78d5b0d1d2ff1a84727a4b7fb106e9645 | ORPH
   x86_64    |        libglib2-2.90.1         | NOK | https://autobuild.buildroot.org/results/52b93804524f58bb1ed42d089392e10d5c9aa658 |     
    arm      |         libressl-4.3.4         | NOK | https://autobuild.buildroot.org/results/d60e36e5a8a09372f1dc0829e6e51f72c7c1ed6d | ORPH
   x86_64    |         libv4l-1.32.0          | NOK | https://autobuild.buildroot.org/results/985c6b91080e253fbaac4f034819d21158a131f2 |     
   mipsel    |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/75ead576eb8b70364ad15aacd61ed793a163b743 | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/35ac56776b76dc0e8c48094988d372f4c92fdcdc | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/64d8665c1c10cf72b8851d21a3f1179b705d280a |     
  mips64el   |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/4faa0163681b378ccdf872e644ca5bbcb8ef9ef7 |     
    arm      |           lua-5.3.6            | NOK | https://autobuild.buildroot.org/results/14477ad9112e724ada377b6ee3b37876a9b800b7 |     
  aarch64    |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/ce0a34bb3933326e43ed839346fad73769d98a14 | ORPH
    arm      |         mbedtls-3.6.7          | NOK | https://autobuild.buildroot.org/results/7ee534b70dc5f9912e0eaec8e11f4a1ee04450e5 |     
  powerpc    |         moarvm-2024.12         | NOK | https://autobuild.buildroot.org/results/3dcfa50c2a149ad4a7277601065914362e562fe9 |     
powerpc64le  |           musl-1.2.6           | NOK | https://autobuild.buildroot.org/results/1342da7c9258a93eada96f92f53a643e316ce7f6 |     
    arm      |           opus-1.6.1           | NOK | https://autobuild.buildroot.org/results/10a38f8dfa006f0f19c719dd5a47fda4f97aeea5 |     
    arm      |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/49e5f40ce959b85f3211eee77a01a97947b01cb9 |     
    i686     | qt5base-fbed962c3195ab3952f... | NOK | https://autobuild.buildroot.org/results/22393389fd98fc0b8a4064845a56fcf7722302f2 |     
   x86_64    |       quickjs-2026-06-04       | NOK | https://autobuild.buildroot.org/results/219cfb177e703308c865037065d670f9f83423dc |     
  mips64el   |       quickjs-2026-06-04       | NOK | https://autobuild.buildroot.org/results/2bff55a980b6381fc788c684486747d3a7859b49 |     
    i686     | raw2rgbpnm-f28b903ca63b4c22... | NOK | https://autobuild.buildroot.org/results/949cd46e020ea7e52d39ea6067d769867176c8f9 |     
   x86_64    | rtl8812au-aircrack-ng-c3fb8... | NOK | https://autobuild.buildroot.org/results/1b7d154dc904eca59aad9c0d465d1a3f6df8c349 |     
powerpc64le  |        shellinabox-2.20        | NOK | https://autobuild.buildroot.org/results/d59acf7c9bab0c4b1cf1ae492f388cf914c0017f |     
powerpc64le  |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/cad925b48c8793720d4f1ec4c151f50e8ccb6c75 |     
    arm      | sunxi-cedarx-b8f52d913f7372... | NOK | https://autobuild.buildroot.org/results/cc00a514bbaa756960ca5c9c30e3b3a7602df823 | ORPH
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/55c462f55fd7f83feabb9eea31053c3ac4402866 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/e1a693829168b98ad29a3750fa8bfad53c384c7f |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/e24973bfb34273c5497f39524bbc758625a256d5 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/31dd85aacdb528c07ebd18422ffaac6f5a7c285d |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/74f322b71c875373fb0d60abed322dd6fa8ab7a8 |     


Classification of failures by reason for 2026.08.x
--------------------------------------------------

                 duktape-2.7.0 | 1 
               firewalld-2.4.3 | 1 
                  mender-3.5.3 | 1 
                     mtd-2.3.1 | 1 
                       unknown | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |         duktape-2.7.0          | NOK | https://autobuild.buildroot.org/results/34f6aa09b3c3b6e495e4504123b47cb03b98d6a9 |     
  aarch64    |        firewalld-2.4.3         | NOK | https://autobuild.buildroot.org/results/b9fd99c0f8eb69062d26fe9c07272a42f0e6e100 |     
  aarch64    |          mender-3.5.3          | NOK | https://autobuild.buildroot.org/results/b0e039c86f894ebcffae3b2bdec3245ba26f304f |     
    arm      |           mtd-2.3.1            | NOK | https://autobuild.buildroot.org/results/e00f9fa9852321e60ab48f788a31c7ef9ef4c8ff |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/5d49867e4b2b675fde144e80f8f367c58c0a2fdc |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

            jpeg-turbo-3.1.4.1 | 4 
             alsa-lib-1.2.15.3 | 1 
                   exim-4.99.5 | 1 
               nushell-0.108.0 | 1 
                rocksdb-6.20.3 | 1 
               tcf-agent-1.8.0 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       alsa-lib-1.2.15.3        | NOK | https://autobuild.buildroot.org/results/ce449e82d73f746ee3303bcbc58692908662bfcc |     
powerpc64le  |          exim-4.99.5           | NOK | https://autobuild.buildroot.org/results/96760cb162acc9b904d1f27f3ed083a1d5f32a19 |     
    i686     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/aac669f5fd8cf7f675c34948197505ed7715f21b |     
    i686     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/fb72970f4518b05111605cdab026925e8449f4c9 |     
    i686     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/002b04291dc203e0236ead037f31d3dbff022b8a |     
    i686     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/56383e26ffb5526bfc847e2f5adcca4eca963155 |     
    i586     |        nushell-0.108.0         | NOK | https://autobuild.buildroot.org/results/217c516a7876563fe3f3dd3224b97479081f653f | ORPH
    i686     |         rocksdb-6.20.3         | NOK | https://autobuild.buildroot.org/results/08dca2f5b874304846b1546a2096501ee8b7c139 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/2a6f60a42db7b681c44432f62431da824cd44f2f |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                 fwts-25.03.00 | 1 
               harfbuzz-10.3.0 | 1 
            host-libzlib-1.3.2 | 1 
        ltp-testsuite-20250130 | 1 
                openswan-3.0.0 | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |         fwts-25.03.00          | NOK | https://autobuild.buildroot.org/results/a449565368ad24d342f3ec348049149512ff9eaf | ORPH
    or1k     |        harfbuzz-10.3.0         | NOK | https://autobuild.buildroot.org/results/2059edeb5016d338ae216a6d408b967a8bbd8941 |     
    arm      |       host-libzlib-1.3.2       | NOK | https://autobuild.buildroot.org/results/7edfe42f9baf0b1578661439ffe33f6e2f7d8664 | ORPH
   x86_64    |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/bc17eeadd9726b350fda70809bd5c5a3235f7fa8 |     
  mips64el   |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/ed6368e5b71742aea4e601a5da436ddf04ca6934 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/c3a008594e8f733ba059fffc39d8fbed5db0f2b0 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
