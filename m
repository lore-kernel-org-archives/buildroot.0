Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB01606A320
	for <buildroot@archiver.kernel.org>; Thu, 19 Nov 2026 04:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FEx38EXH;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kkMyiVDk
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4087340856;
	Thu, 19 Nov 2026 04:33:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id al1SVsTFjLQl; Thu, 19 Nov 2026 04:33:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C331340871
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795062796;
	b=lqSC1M7nREJr9lVkcKeaXuczQrFowS2U6ljtRlC8Ln5KeMaqLCfaXtyU/waJrAX0QAxb
	 oOH9XNF4ntOXAdT+UAtYCktFZswnxJLndYZhbBNADto5F75MxpvcxkIx+tmVO4hG81R4/
	 i6D3nKYl52wk63aOKcSKltDgtIoDFaFsXMcaw2lcNQgZV91Vfkd6CjEC/l0kg0375+LU0
	 f4yDSpjDqZLdD1Rl2NXV5+iteIWsCRUwt+uTc7g3pftdtYKiWqK1l4CifTBr7iFgaP0t+
	 1DjquUt9N1PsjOyh+mw65HnI+Xy/wxVPW3MdIEMIGHNauydQsigBrwbJlNr71Lgf8Eg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795062796;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=G7c/ZyYrTb25BqPlqrsqjw1wMUN4gn6l0rhKoG+bi/Q=;
	b=EvKNBJlMFN9GZ3g6WPiRgnq3ouM+25tHZePxVFOP6bm0WEWYWBMSP6mSzrmFY+tQ5GFC
	 valw6x4PdX4GBRwR8iYiBdLnazpxLWuIGJkRKtIRN2nzyWRIUo9N10cSu8nSJjDKx7amU
	 4Ujdhfza0AAvtTVZrfUCYaWa5A2sxvZl1GwU37KyQXd9YUbqaq+AytIPyHoMrJDsjgysQ
	 E04IT6wqzWz0zU98ucQEHwOZwf/Y8qGnrsW6uzsvu8Y6dimieyuvHW4FlUMh1SmcNpQa5
	 msMJpNxH4enGd8+ppLZ9ZL1oY2KshxFw9FhEdJp6ch1g2c0KvEH6g6jwlMhlBh6pvQQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795062796;
	bh=G7c/ZyYrTb25BqPlqrsqjw1wMUN4gn6l0rhKoG+bi/Q=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FEx38EXHmGFHpdSteXMmum0VRRKnRrzG6glp0hAHIs9wuAoT5VV4vIktylj+uRWU/
	 lLbXkX3oP5HWFX7KbktIyMYs3ibvjlHk2gLgQbxjfB8pq2jE6A40y0glkAIxO/1OQ9
	 pIr4QGHXghcXNp3jcsM/Q4fIX1D7qRsGvq0TD8hd/4yGjvLRXqTplOCkv3X5j2nyek
	 x+38yXN6t/QX0+Z2+ADVv48+mvcjjoAdHzLSdLrAuQIGs0RF1xNr119c0H5J7yzbAf
	 OtrBp4sGm3jyHt/dNDakukdgD8pPLdjJIqxRYGjfspJFT+LNEBJ0eahcmTK/K42//q
	 wb6gux4MIKutA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C331340871;
	Thu, 19 Nov 2026 04:33:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BB391C9
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 04:33:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8DA8180AB5
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 04:33:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ciVbh2tPY3qp for <buildroot@buildroot.org>;
 Thu, 19 Nov 2026 04:33:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EC9A880A48
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::331"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=kkMyiVDk
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC9A880A48
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 04:33:12 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4a214c5c4c0so18334825e9.3
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 20:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795062791; x=1795667591; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=1+XRHj05+qG7eXRe56SqwsQYUwdk+ngw+NRz2eD1Fec=;
 b=kkMyiVDkAdp0mcxSt+sHKSCMi+YqXPF2diMJy2k9XmxPUqDj9eTu+Ryxa2MqSr6gb7
 IGbwrooMakuVvGCk6Z55OQruQMOfURmaURXwfgAED0eIstgUI4vuAH/PMdVxY4ff+qKh
 DjZc8eXpmjTscWg5SXvAQ4mLgUGntKxWL+h7Kn4Cn9elO1LpibUaXmcUGFl9gM7XTKyw
 8QwLszT49KiWFpMAQ85kCaOb/tMnu8Ony9RT977ifBFqrNGJIHh3RmKmzbty1kR3KRQI
 Nc+AEAyCLzlE6+U/VrF1Or3i6pEoPjg+dIlY8TxtL+QaDa2wGpfbk9MUEPQ63xn5/XBp
 eaTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795062791; x=1795667591;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=1+XRHj05+qG7eXRe56SqwsQYUwdk+ngw+NRz2eD1Fec=;
 b=lx/+kkhTw6csxsb5gUbJ2H1NJykKRu5DctVu1bcYl/13LrXetivTn3bQ+ZixkS33Dj
 5e28utIXD43hL8Q8xOqkaCKut4V/C4D4gsm5rY4EPqoKXETWxr1aQeG9PjkT2DhdRZr6
 pvGQsSYdLzYZ52l2SwJP/acReaaqvt4s1HLKqs5PsYlv/vdMGSU09bjqPrdxE3eq91L8
 2KFwOszI017+BDnU3DVa7snK2SMk432YAAw1nbAvMagjbLM+Rd35kD2pWRd/PhqzHW+N
 hFR/cp5Nf8vWAy0QmfLDuG+w/whnUBpbsZIpqnZBJsN64Oqt4vrEtEdbaxclshDpoK4P
 4ePA==
X-Gm-Message-State: APuU4Z/Tnu387BmsxdahCXxbBwue7GEAego8CS8vVVKeLLd4L5jG/bFx
 c+izpPud7VFzNLrtHQuQXC/mISvBADNSovuoTsO6EmU9V5V84TKt64XMtgTC8gkw
X-Gm-Gg: AYBFou0e2x4fxX8Ww//KSBB/z+7NNMxN+V4pJA+mc4YP4CD5Kvnqzdt5fuXOJ/xIuvH
 n9SOw44J0Hxh7CSqfimKpd2plv4F5qXae4r6ElyTjkfJK0V4SyV2UtTx4ADGFZEmBD09rpS1HCe
 8rsnM/JTC5vIkdreJlXDTedpirrchyoNl2aeW31ZV41XSILpZN40BBbizTNvlxqJW+WkDQexqAZ
 KslssRg7KXBT7SHhn5i3xGaLfmYEDbiw9/GwzytwLsqr/BN6bQ5MVZ40iEIKM9KBwaBY8rrlREv
 1i+cugi1lfYqJMYzOUSqqNQe5mo2ri80a+3YCzCS2KV7vh+T3u4RAoqzLhw+OB2+L8UxIxgAxRW
 vfzgUXAWJkz+EkjTgYWR2TgceGp7meUowhYeYGhlTQLgvUOxuobpF550nJ4S3IzyJnSRr4zKlO8
 ztDBGAducP6fCVouPY/JErrqiNbhA9hxMamsqZLt2dhCgWXtFsfpLCjL9fUQiTmzJ2OofcMowFE
 FHQP/I27bzXQWHgOxc2btj/nvjhkAkTriO+1RfkmwoVlOrkD+m6/48r6ce0iXZHXQ9wRe4/oMmB
 Zknc6iOFFCZnmG8C4dU7OppFEPLRjlVd
X-Received: by 2002:a05:600c:1d1f:b0:4bb:6a5a:7839 with SMTP id
 5b1f17b1804b1-4bb7da4d216mr90733635e9.34.1795062790755; 
 Wed, 18 Nov 2026 20:33:10 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb8526541fsm11378385e9.0.2026.11.18.20.33.10
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2026 20:33:10 -0800 (PST)
Message-ID: <6afe7c06.4216ec83.2dbef6.4314@mx.google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 19 Nov 2026 04:33:10 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-11-18
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

Autobuild statistics for 2026-11-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  | 10  |  0  | 12  |
  2026.08.x  |  7  |  2  |  0  |  9  |
    master   | 30  | 48  |  1  | 79  |
     next    |  2  |  3  |  0  |  5  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 9 
               harfbuzz-15.0.0 | 2 
kvmtool-7ad32e5514aca2b6d19... | 2 
        ltp-testsuite-20260529 | 2 
             open62541-v1.5.10 | 2 
python-remi-2022.7.27-37-g1... | 2 
               tcf-agent-1.8.0 | 2 
                    attr-2.6.0 | 1 
             batman-adv-2025.4 | 1 
                bpftool-v7.5.0 | 1 
                  chawan-0.5.1 | 1 
            dt-utils-2023.11.0 | 1 
        edk2-edk2-stable202608 | 1 
              fftw-quad-3.3.10 | 1 
                      gd-2.3.3 | 1 
                 glibmm-2.76.0 | 1 
                 haproxy-3.4.4 | 1 
hare-dbus-e9a89f8bc5ce783fa... | 1 
host-mxsldr-2793a657ab7a224... | 1 
              host-rust-1.99.1 | 1 
            igd2-for-linux-2.2 | 1 
                   iotools-1.8 | 1 
                    jpeg-turbo | 1 
                 libv4l-1.32.0 | 1 
                    lua-ev-1.5 | 1 
                 mdevd-0.1.6.5 | 1 
                    mraa-2.2.0 | 1 
            optee-client-4.9.0 | 1 
      passt-2026_07_28.f8df3f1 | 1 
                   perl-5.42.3 | 1 
 qcom-db410c-firmware-1034.2.1 | 1 
     s6-portable-utils-2.3.0.4 | 1 
              shellinabox-2.20 | 1 
uclibc-ng-test-132c6134d691... | 1 
        wireless_tools-30.pre9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/b642947f263ab822acf8036213b471cd4a399a55 |     
   x86_64    |       batman-adv-2025.4        | NOK | https://autobuild.buildroot.org/results/81b22f6cfdb850c27ac041c0612e1362e02f3d31 |     
  aarch64    |         bpftool-v7.5.0         | NOK | https://autobuild.buildroot.org/results/17a789a1ec66dab086b3cd05ac4f8ac0ebbd43ce |     
    i686     |          chawan-0.5.1          | NOK | https://autobuild.buildroot.org/results/85e9837a2a8cb98cc7062611c8af231fe7c3a2ef |     
    arm      |       dt-utils-2023.11.0       | NOK | https://autobuild.buildroot.org/results/93b7d5b626ecf1ac27e83e815a2ac83df98b7e2e |     
    i686     |     edk2-edk2-stable202608     | NOK | https://autobuild.buildroot.org/results/9998695b080e9e956cd1571b2c081ec7870b097d |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/249740cfe874b6ef86dcd573046863fbb3343e25 | ORPH
    arm      |            gd-2.3.3            | NOK | https://autobuild.buildroot.org/results/713077327702dc2b8bb127fa8ad5c8e62f23a58a | ORPH
powerpc64le  |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/c5741dd1b03502a7d1d90da571dfc6b7b6061558 |     
  mips64el   |         haproxy-3.4.4          | NOK | https://autobuild.buildroot.org/results/cdabb492ae91e6864f6b9ee0c65a9160fca0d8f5 |     
   x86_64    | hare-dbus-e9a89f8bc5ce783fa... | NOK | https://autobuild.buildroot.org/results/2640a41a1b1d86dd652d7be7f8901b5688f98aaf |     
  aarch64    |        harfbuzz-15.0.0         | NOK | https://autobuild.buildroot.org/results/f6c579f5dc9240676d2b4beb41a6bd381560c218 |     
  aarch64    |        harfbuzz-15.0.0         | NOK | https://autobuild.buildroot.org/results/ed0f293cccbc66c167dd3b895e82aeb5c0ca7fe9 |     
    arm      | host-mxsldr-2793a657ab7a224... | NOK | https://autobuild.buildroot.org/results/f35f51e5c26446a56b1773d8f22fe81a45e29f45 |     
   x86_64    |        host-rust-1.99.1        | NOK | https://autobuild.buildroot.org/results/c4f47024a4a110605077a035d91303cb66334f5c |     
  mips64el   |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/68b250fa9ef10b9f7a395e31db7623bf7b605042 |     
powerpc64le  |          iotools-1.8           | NOK | https://autobuild.buildroot.org/results/a20267e877a5365ff58a890b25ce591e6a9c0a93 |     
  mips64el   |           jpeg-turbo           | TIM | https://autobuild.buildroot.org/results/f3300b2c933a21d973ee58f015edb6fe660c528f |     
  aarch64    | kvmtool-7ad32e5514aca2b6d19... | NOK | https://autobuild.buildroot.org/results/953575ddfc1a9680889393df1bf08898563a79d6 | ORPH
    arm      | kvmtool-7ad32e5514aca2b6d19... | NOK | https://autobuild.buildroot.org/results/3b3b64d1131439a2dc7752724dd2c79d184130b7 | ORPH
  aarch64    |         libv4l-1.32.0          | NOK | https://autobuild.buildroot.org/results/2dd53f168d1027ab777337f7dbe56b021e36473a |     
   x86_64    |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/c209ff73b2e11fe9b021b6b9cc33fb6bc171d8bf |     
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/a306638c6c25bd1db8dddb255f0d92ebc1d1c31e |     
   x86_64    |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/594df3858e2aba11cdefc6c7397546e1ceb7b144 |     
    arm      |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/07e8a0c72959aad949714c1033b613d535c74af2 |     
  aarch64    |           mraa-2.2.0           | NOK | https://autobuild.buildroot.org/results/f1550458fd9ad0724d092b5e9c6f65eb8cb77d42 |     
    arm      |       open62541-v1.5.10        | NOK | https://autobuild.buildroot.org/results/12f7c384f4461781258e6cf05e5f95ae85a0af2d | ORPH
powerpc64le  |       open62541-v1.5.10        | NOK | https://autobuild.buildroot.org/results/81e9c8bfad3758ee1b8bc64f38143d5076115f3a | ORPH
    arm      |       optee-client-4.9.0       | NOK | https://autobuild.buildroot.org/results/a1776b9fb064aea72e37965e9c04d44ab1743b2c |     
    i686     |    passt-2026_07_28.f8df3f1    | NOK | https://autobuild.buildroot.org/results/7fcbbeabcda195129043cad52c0b349532aab9be | ORPH
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/cde64e5d269fd8408439127e6c6df0d8a865c0c9 |     
  sparc64    | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/aedd39bdaa3ae222df1c18ff4189e9101233b223 |     
  aarch64    | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/89fcba678fd854fa91c53e7a51a2fada1122c89f |     
    arm      | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/c7993e7f4cc18015bfca1a816f75d29eb943d749 |     
powerpc64le  |   s6-portable-utils-2.3.0.4    | NOK | https://autobuild.buildroot.org/results/cabd770453ebc8f0910ca4cc68e2deb84b7318c2 |     
  aarch64    |        shellinabox-2.20        | NOK | https://autobuild.buildroot.org/results/5cba7080214ec7af98417db0fb61879d57e313a8 |     
  aarch64    |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/593138e0014c61856743d913fa4d482fcb441511 |     
    arm      |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/607caa306aa6129a346424bb37c621282fbe15a8 |     
   x86_64    | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/75ce549ba96a1d7e22e6d7d57a1a7ac2967e36f5 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/45a148b9da655a22a0a9350489fae0c7116431e7 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/6ab475e22ece12dbf4c8888b4fb7a627f6fbbb7f |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/340d6cf2a2447161ea6f4379ff414c95832fa782 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/9fb61e367a184b88b02dc58333c5851493d27689 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/660849d32fbf1b8e408b9e0098b8041517b4313d |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/d1199a39135f1940ff3ea09f90a5345d352da3df |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/1ba379dff2ca8cbe23a144b0ad139020de51ddb0 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/f44f94cfbc1f44a1a60715ea3aa501ec60498391 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/c8536b7459cc238919a465ebea1e12bc049acec4 |     
    i686     |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/5bcdd69062289430bd310e5e22f969e724a50a7e |     


Classification of failures by reason for next
---------------------------------------------

       host-gcc-initial-15.3.0 | 1 
        ltp-testsuite-20260529 | 1 
rtl8821cu-7f63a9da2e8ed8340... | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/62b4473eb9e54e4d42bfddd211eea547a4e895b5 |     
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/f7c73621f2555b72580afcf3ffae0a62f8ca6c94 |     
   mips64    | rtl8821cu-7f63a9da2e8ed8340... | NOK | https://autobuild.buildroot.org/results/b05909cafa8db84812a526c576fef0c02ea8ddb2 |     


Classification of failures by reason for 2026.08.x
--------------------------------------------------

                    ccid-1.5.2 | 1 
               libecoli-0.11.3 | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |           ccid-1.5.2           | NOK | https://autobuild.buildroot.org/results/adde74dda855bb779fce5a1c862d2b48e0c83ceb | ORPH
   x86_64    |        libecoli-0.11.3         | NOK | https://autobuild.buildroot.org/results/454356ec90f0631a8d0b2179e60535025b551896 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                   perl-5.40.5 | 2 
              fftw-quad-3.3.10 | 1 
           host-cryptopp-8.9.0 | 1 
host-netsurf-buildsystem-75... | 1 
        host-python-lxml-5.3.0 | 1 
     libphidget-2.1.9.20190409 | 1 
        ltp-testsuite-20250130 | 1 
             python-webpy-0.70 | 1 
                    qemu-9.2.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/38f7881ea444d3bd4a88ab587eae62abd22cde48 | ORPH
    arm      |      host-cryptopp-8.9.0       | NOK | https://autobuild.buildroot.org/results/51b2046d0afd592047bdd01a91dbbacd6dd6413f |     
  mips64el   | host-netsurf-buildsystem-75... | NOK | https://autobuild.buildroot.org/results/fbfee495cecc00cf389cbbce200e8b664b3a1686 | ORPH
  aarch64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/d73da52b3a978767d0cf58afa41fe21223f8875c |     
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/a99ca019d3ad577d3d2ac52a683848ded34cf1a6 |     
  aarch64    |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/765fec1a07c9e756cd4ded39a61c8bedfae0f652 |     
powerpc64le  |          perl-5.40.5           | NOK | https://autobuild.buildroot.org/results/e7ffeebe87e05123769e1fb9a7cc392bc2075c81 |     
   arceb     |          perl-5.40.5           | NOK | https://autobuild.buildroot.org/results/06abb7e0f48fe5ec9aaff390ab6ff80b7810d8df |     
    i686     |       python-webpy-0.70        | NOK | https://autobuild.buildroot.org/results/1d6d35c63b21bf37158fab4370f92b3ead1aa09e |     
powerpc64le  |           qemu-9.2.0           | NOK | https://autobuild.buildroot.org/results/e5cce74498e94bdf92789eda7e59918371c2a23c |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
