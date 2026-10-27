Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6E1606A31A
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 04:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=d8OKd4+Y;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KQoRRpJv
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96C084057C;
	Tue, 27 Oct 2026 04:32:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Kuy1beFY9fs; Tue, 27 Oct 2026 04:32:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E69C940574
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793075563;
	b=YQIZHb4K7BPToF4TmZdidk6dgpP8c2++WGJz9ub091O7M90IC8AI/pANqHRm7lQ43/uc
	 /upW9zxF1AWTBQLQj7bfV4MGuenbKDKyVrfg1NCNn2Hxnvdq+CzOwrBKhHLv7P/IKznc5
	 BbACsYuGea1GsuQolyTBgHGJ4WAVuD5VjCn0LVF5BZKCVHeDtEcPfKgMCORLB+sPySlQC
	 zUtMUgve5ndzuSrtxaVqkCNS8ddb2kBnK+L07b4x0xeS+teArQ9K5vMP4pDR8g4Cxzyur
	 13474kbUaoRgLXS9HGIBO14yhmC6b5dxQWIkPCAU5cOVpdYeTd+R0ivEv0wdLtVa8hQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793075563;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=sIt+SHa9HpduvRXB3oFkdBCLnKKuZt0lFnaGTmeMLYY=;
	b=BeKAvbpC5BAt9vrGJ+2EhVAeomkCoKXmoiGNwgcok8fFLSeJRJt+CmoGI+1yrANDGA9O
	 yXgKeYXVy8OfYQ+SE1rEGkv3YvU6Tc4HI1lWlAm0B5XEzf2PW4x8t9aH1b4CFxDWxb1UF
	 E3Zm5pBWYXY2PTh4/U73PoaMokM9PNE9g76ITkKU1WH4CbzQElPnHm2jIff9xYCAupvK5
	 Sj9pX6QzWlve0Lm+Nj0/IBKB0YcE054nN+klBett5HwwYXeNCSH1d5x7H3uQ2o1kwugOh
	 +PQJay/S0/gn5FMrnrkm9PeIwb1rninWbw/liO+tPPUGekaULGL20AGPPLWT1H8Wp8g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KQoRRpJv;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793075563;
	bh=sIt+SHa9HpduvRXB3oFkdBCLnKKuZt0lFnaGTmeMLYY=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=d8OKd4+YDiaoZEcLdoOCH2srwzTbyv9BVQ6H4IHm8nOFwZxPokoU7BRwtLhjRoI7s
	 zjgkAvdg0RUVbWD3DG13yApGbYDjLFSqvBH6htelUfEc/2bZnorgXNXXRJMk74FZyy
	 zrm3SeVzOdV5HnOCt6Xnq6dX4FVVzr92OBo+K1xFkcaWQbfpSh+7Mz5F/dRqHXfHP7
	 klRon76IFVLBNAERCJsQbCnvLo5MWxhrlNP1i5snabC6qBpAeMA6tMKZ7RosK34N7H
	 hbeVUuNx0p/klGYuWVvFlsqX0tWQHDfaGd8vd2kAPh1lMBCKuOowY8jYlWFAK0e8Mu
	 7LLjOUIg0YYjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E69C940574;
	Tue, 27 Oct 2026 04:32:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F2784BC
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 04:32:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04D1C40575
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 04:32:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3m7kNyshuebc for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 04:32:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 26B6F4051D
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::433"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793075559;
 b=Fgt3MyQWGWG1e/d/yW72Qo5C5pv823e4TozYKHK7hbYmiI5kWNtdqGIeb066m8l6GhcZ
 vjs52xSlJ5gFQ8vvsDjlZ5xfJIRPIK3fzRZAY62T6p9++ANmzT+K7bBKZMwWPisSkutRp
 Yu7NKS7dA/Kw9HR8RGTyCPNv5n6H80CKoy1goj02qzK9eRqJlPqRb5ATOIb+rMIGNPRhm
 WcW2pHXIWTj4hDcnYf8Waoe8SxHIsON0G0QbedmijfjHGuUWVUkaD058+kjn9tPp4D7hO
 kaYlPEla1QhrwkcH+bQ3l7P8UElfa2PXeSoHQ047UzaRZguFFOpl1A9koex514/Zf3g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793075559;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:From:
 Date; bh=73rCssmx+sAcGlkrhdgExjCvQu37nu4jyPzX8nuXbTU=;
 b=N9LVJrjEqcrUabwMPTZWGDYBxQBkGSu1qO09O3x+E9Ptq43zWdz/SOtFIR0IDr6Rjobi
 nReJ9zm3pdZc0WGgpM2o2FmJ4HAB1ZLvOXJx/G0Rb7gj+5/bSKsFCrmCYL58VsoiVc3yO
 rhOymMU0wU0GpXxodJ+i0Abiglcoj1Pv8ovSsJoHcgA5lh6LxfiClz9Ov5W7d95UI3A0L
 xLZ/bOPnGFJ9dNNwFxk14LuG2WhnoAgiuLeQJOptgKFHWl0ApuHv5lXZ/xEJ3QIWBS0U1
 M6nPyslKKKv2bXFTHqIF2uDoPgsRN9zihHVkhxHgSdvq3mChmddXX5HuFjJ8Slawxsw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=KQoRRpJv; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::433"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=KQoRRpJv
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 26B6F4051D
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 04:32:38 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-48dfdd0678dso2676781f8f.0
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 21:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1793075557; x=1793680357; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=73rCssmx+sAcGlkrhdgExjCvQu37nu4jyPzX8nuXbTU=;
 b=KQoRRpJvol+yLUe5Jb+fHGPeQKugAtZX+CYBX8tWmdBAbsNEGctJFQVxiUS2tlVb6i
 Z7G5yQFxE8gyshZnbtRLf4LbKXwQi1XaWk7KMudjwj0GfhfhTWjkAadRhJqqj9tzL5L+
 qsDvzhfdh0fadXkw/708XFh7njlLBnzBza7g2Vo3iwKq0tTpRg7A6P4hHTeb/TbUVeoi
 ZjX8X6hHWKy9diidIiN66f6SiVFdfMKEgZrgCoxUVTZDai543VilHp/l+eBQTwVZBUx4
 OAmvXD1Ec7rWp3xwBbFiUi4zTkD92EbFtRmQHQTF/brBLifznZ9YFV0mszsoCyZG1Lvy
 6Jig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793075557; x=1793680357;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=73rCssmx+sAcGlkrhdgExjCvQu37nu4jyPzX8nuXbTU=;
 b=LJ3oWGYwhqK5bZ+2hi9FlJI2CqhmgwOhpgORp+Kl8y92F2nE+TV6olMBASQNv6jVJ4
 bgdbdxnSbQsNG8LVM5NB9UuKqBZFZxJC2+e1Utd+Wuc9DY/wbiVMq+kUZP65Amcr1pAt
 0CbX4VdH8iT6dXjjwuJaDjOd4u6wFf/95541c94dwPMgocpU2lXK2Uz8g05ZMPiMzjf7
 XK+5LeR7BorxnHiXJ/be4ZBJRB8pUHfgcmSBZxoqgrFurIYU4m8rvgoS4pwh484rjUxN
 xqj6ALfJmudA8EWK8pK00u9ZJ5LCip2zxPIpshft6XR1QkH3MRs/iTiR4fB0Opl3YFo/
 ygpQ==
X-Gm-Message-State: AFq9FYIW+I8CqjwNFD9LkY1WoiKVCQsqFpNdi5mV/FbJj0PuG9l0+aqY
 CLi1GVTCFCtu+GeCHWPKz3C5NFKUDZG9OFtDbggg1aBY/sWwlCV2EZ1nLkzCpu/W
X-Gm-Gg: AYBFou1ZD6ApDRXikMHNwT1mKfCyzGwp7sDR3VPA/KKsJYA3vSBQkt3weS32DQst5WG
 u+sck9PapQ4Kihf6gnzNHi8khoh+D0qoc/3ZTURjU7okgD8ShuqvFOJHSVmBgETGQqOM0hy0k/E
 vwLWsxYrvKgISgasf+GrYNYl3AU2Pgxck20VaFKURUmfR85ggUUAk+NuTMvMqX2Buueorl4y0M3
 wiVqbvtfmY5PUwe6Rk7RmFNJlNcjqSDMv0VH8B37RVefLOQhvsDt/PthkpyQ/T+SBrHi7Jryr5b
 Wwp8c9zbAPglDNWvDpfQpgfERgaP1JfQttY2xmOoU5w+TiX1LltWc5uhBHVvXjGtYDHhHwXe/9u
 nmaFpIlcuzk1f8MWe/zhXnXxpWq5QH3vVo/xBezfkh3RmIdRFJzlhqb8xHYJGUgrWBk01XTaSOX
 kDpcVToC6KHhfTZ8w0qH6RQzPqitcgWldytJLmIB2sMwKbM3frVIBs0lDQiSL3Dy5EEXGLE30ZU
 im6xNNHc2OYN2xtapQEfjC8MstRTw1Y+iLXDuKfKohH3wmelASO9RkDyvMsl4I=
X-Received: by 2002:a05:6000:160a:b0:48e:20f9:8d75 with SMTP id
 ffacd0b85a97d-48e3ebb68aamr11501543f8f.48.1793075556222; 
 Mon, 26 Oct 2026 21:32:36 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebcb8e0sm19552338f8f.29.2026.10.26.21.32.35
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2026 21:32:35 -0700 (PDT)
Message-ID: <6ae02963.b157ee68.2ffab0.0810@mx.google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 27 Oct 2026 04:32:35 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-10-26
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

Autobuild statistics for 2026-10-26
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  3  | 12  |  0  | 15  |
  2026.05.x  |  2  |  2  |  0  |  4  |
  2026.08.x  |  4  |  5  |  0  |  9  |
    master   | 39  | 86  |  9  | 134 |

Classification of failures by reason for master
-----------------------------------------------

                     host-rust | 9 
    host-mender-artifact-4.4.1 | 5 
                    attr-2.6.0 | 4 
python-charset-normalizer-3... | 4 
               tcf-agent-1.8.0 | 4 
                       unknown | 4 
                   ccrypt-1.11 | 2 
                   dante-1.4.4 | 2 
google-breakpad-f49c2f1a202... | 2 
kvmtool-7ad32e5514aca2b6d19... | 2 
     linux-5.10.254-cip72-rt32 | 2 
               linux-pam-1.7.2 | 2 
                  ndisc6-1.0.7 | 2 
   openvmtools-13.1.0-25218885 | 2 
                   perl-5.42.3 | 2 
raw2rgbpnm-f28b903ca63b4c22... | 2 
                    sbctl-0.18 | 2 
                 uclibc-1.0.59 | 2 
            18xx-ti-utils-R8.8 | 1 
                 aichat-0.30.0 | 1 
azmq-v1.0.3-54-g819b24035cf... | 1 
                   bird-2.15.1 | 1 
                        chawan | 1 
                  chawan-0.4.4 | 1 
                  chawan-0.5.1 | 1 
             containerd-2.0.14 | 1 
                cryptopp-8.9.0 | 1 
                  delve-1.22.1 | 1 
            dt-utils-2023.11.0 | 1 
              esp-hosted-1.0.6 | 1 
                    fcft-3.3.2 | 1 
                  ffmpeg-7.0.3 | 1 
              fftw-quad-3.3.10 | 1 
host-am335x-pru-package-5f3... | 1 
host-google-breakpad-f49c2f... | 1 
            host-mfgtools-0.02 | 1 
              host-rust-1.99.1 | 1 
          host-xfsprogs-6.19.0 | 1 
 ibm-sw-tpm2-rev183-2026-08-26 | 1 
libfutils-c326ce0cc2a735438... | 1 
           libwebsockets-4.5.8 | 1 
                linux-5.10.272 | 1 
                linux-5.15.223 | 1 
                 linux-6.1.190 | 1 
                 linux-6.18.58 | 1 
                   lmdb-0.9.35 | 1 
               madplay-0.15.2b | 1 
                 mdevd-0.1.6.5 | 1 
                  mender-3.5.3 | 1 
                 openmpi-4.1.8 | 1 
package/mender-update-modul... | 1 
          pkcs11-helper-1.31.0 | 1 
rtl8192eu-9664b2bfc4bcba55c... | 1 
       sp-oops-extract-0.0.7-1 | 1 
                statserial-1.1 | 1 
                 systemd-258.7 | 1 
vexpress-firmware-901f81977... | 1 
           virglrenderer-1.3.0 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/3b164f973dcf0ef4a5490d333b1ab65324586ae0 |     
   armeb     |         aichat-0.30.0          | NOK | https://autobuild.buildroot.org/results/1d0a9b159715c9cdbeb1a19c5bc0b0b08a8cae2a |     
   x86_64    |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/240b11190a4d602fb5120a2c584169f1d47f935a |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/896747e9dd366d9ca1d63e9ce175e3536ce6f345 |     
  aarch64    |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/037154619613e2ab31ecfc098e2efec8499bcc9b |     
powerpc64le  |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/721ac7f31f85ed9662b4588d2979f46f4a06a940 |     
    i686     | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/742afbbec029c704fb1a9d1849cb69d32da85c1c |     
   x86_64    |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/4406a09011725469abee4c3b83729a457a244aa6 |     
  aarch64    |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/248bd422c2b63a1fb2651fed873f083305e7fdda | ORPH
  aarch64    |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/c6461c01fbaffbbe6937a93dbc7b286acb1bd5a1 | ORPH
  mips64el   |             chawan             | NOK | https://autobuild.buildroot.org/results/4f191b1d25d3282323ef4e5bb332cc0a599ed3e4 |     
  aarch64    |          chawan-0.4.4          | NOK | https://autobuild.buildroot.org/results/2262182fe8c3acc639539924d235cb4b6db013fe |     
   x86_64    |          chawan-0.5.1          | NOK | https://autobuild.buildroot.org/results/7bc3be0f70e0acf7af8cb29a2b791417b855a865 |     
    i686     |       containerd-2.0.14        | NOK | https://autobuild.buildroot.org/results/799b10b31bf93dc138ef77689908d667272e2b23 |     
    i686     |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/a50d355d113cb177dd21d71755bdf29732e58d7d |     
    arm      |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/8e6f329546f928545e930126ae31e4a4a9b020d4 | ORPH
  mips64el   |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/afe8af03f320104a7bfaab78df850acf4948b26a | ORPH
   x86_64    |          delve-1.22.1          | NOK | https://autobuild.buildroot.org/results/4dfe6753dab5d7b016210cbc11f0e137ecba09f9 |     
    i686     |       dt-utils-2023.11.0       | NOK | https://autobuild.buildroot.org/results/27df4eabdd01f3d8ae05dd0e916266e6ab092c16 |     
powerpc64le  |        esp-hosted-1.0.6        | NOK | https://autobuild.buildroot.org/results/5f8bc52502a3455f462cf32ee9850fc68d62facc |     
    m68k     |           fcft-3.3.2           | NOK | https://autobuild.buildroot.org/results/4a638afd027374579435f3dd102e68d258e8f414 | ORPH
    i686     |          ffmpeg-7.0.3          | NOK | https://autobuild.buildroot.org/results/a33a589873d44e341cf5ac993c519a438da82fd4 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/714cba4a00d5a00e4e5f9b83710775e9fa5ecea0 | ORPH
    i686     | google-breakpad-f49c2f1a202... | NOK | https://autobuild.buildroot.org/results/9cc66c914e3d701c4e0a297089c3ce0b0dcde5b1 |     
    i686     | google-breakpad-f49c2f1a202... | NOK | https://autobuild.buildroot.org/results/6dec10fb616250613105a93e15e6b8d3bea049a2 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/73d1077cd39668c682c6fcd666e1667da633e53d |     
  aarch64    | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/8975bdb9eb04232b742b653a4bdbd69d16d79011 |     
  mips64el   |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/d511440bc2b27a1b4f14ef4746475ae8d9d5b5ab |     
   x86_64    |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/358e3b5f674b4d3ee2d98c9a847692adde2998b8 |     
  mips64el   |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/bb9fcaf7022e94ffa9ee73bb8b9515adee304fb3 |     
  mips64el   |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/6408efd31fa9f4a39527eed8fbefc5fc25b3d4d3 |     
  mips64el   |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/fbb73cf474ada9ed5290d17ef9253e813ac4ce93 |     
    arm      |       host-mfgtools-0.02       | NOK | https://autobuild.buildroot.org/results/70d85da3394f57b7b772051fc6abdfc54508e752 |     
  aarch64    |           host-rust            | TIM | https://autobuild.buildroot.org/results/e6f3b9c0aa103fc791189537039ce43b7fdf9f53 |     
  aarch64    |           host-rust            | TIM | https://autobuild.buildroot.org/results/011fc3a9d64c850c15a1ce9d5821af45cbffeb98 |     
powerpc64le  |           host-rust            | TIM | https://autobuild.buildroot.org/results/467814fb7b45c048694839da52539126f75e4d2c |     
powerpc64le  |           host-rust            | TIM | https://autobuild.buildroot.org/results/b01e880451e972cc3458c70c2b1fa9066001de76 |     
   x86_64    |           host-rust            | TIM | https://autobuild.buildroot.org/results/eb08c58b89423410c268862f6df035c9a6ffb2ab |     
    i686     |           host-rust            | TIM | https://autobuild.buildroot.org/results/9923d5f6ccabf1f80b2367760f2892de70f7f9fc |     
  aarch64    |           host-rust            | TIM | https://autobuild.buildroot.org/results/8ff117e26e9daa4c57d39faddd3f2e540e13c029 |     
powerpc64le  |           host-rust            | TIM | https://autobuild.buildroot.org/results/db94a96c2820f6b6ed379f2744fcbd0030745d98 |     
  aarch64    |           host-rust            | TIM | https://autobuild.buildroot.org/results/70735a37fbeaf9e58caadf2668efdb9b154a306f |     
   x86_64    |        host-rust-1.99.1        | NOK | https://autobuild.buildroot.org/results/38281cb20fd58e4d0e8e815a2825ed645e6b695c |     
  mips64el   |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/d878ee1376548407146283d53558ac8950dfaea2 | ORPH
powerpc64le  | ibm-sw-tpm2-rev183-2026-08-26  | NOK | https://autobuild.buildroot.org/results/916e3abcbaa8474ac6fac5416a12ff9df5c8190d |     
  aarch64    | kvmtool-7ad32e5514aca2b6d19... | NOK | https://autobuild.buildroot.org/results/1e43839ba6badba9e82c2e1f8759abda67e74e56 | ORPH
    arm      | kvmtool-7ad32e5514aca2b6d19... | NOK | https://autobuild.buildroot.org/results/e96247db986e3573bd6e896eb637c4afb96d4a38 | ORPH
  aarch64    | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/b1d24de29b7e30157efe21030d555637cdc6f94f |     
    arm      |      libwebsockets-4.5.8       | NOK | https://autobuild.buildroot.org/results/863c30265623973e15a25c2d38c0e1631a39b7e8 |     
    i686     |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/58df7dda671f3333d3ec7c82fcbc769d08a1a5e5 | ORPH
powerpc64le  |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/123b0a6bfed34bf6829201ddb9b2e908813123fb | ORPH
  powerpc    |         linux-5.10.272         | NOK | https://autobuild.buildroot.org/results/ac6958b6725b309aedc0e5e2ef3215af1dd9196e | ORPH
powerpc64le  |         linux-5.15.223         | NOK | https://autobuild.buildroot.org/results/7195508073e95dda1e33308fe0ba153d96710045 | ORPH
  riscv64    |         linux-6.1.190          | NOK | https://autobuild.buildroot.org/results/08e637ddedfcf91cd2d367a510fc944c82a7cc49 | ORPH
    arm      |         linux-6.18.58          | NOK | https://autobuild.buildroot.org/results/940a9563cdf744970d1f445d7f52c7afa87020fc | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/21e3050955f6075e79ea2505440884b989086729 | ORPH
    arm      |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/60413bb34400331db3c554b01eeb4e3efb73f353 | ORPH
   x86_64    |          lmdb-0.9.35           | NOK | https://autobuild.buildroot.org/results/fd9185487dcb2a7341333ba51dfbc65cccd81a18 | ORPH
    arm      |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/93e2d17224b5e7100d211f5c426502f1571d70f1 | ORPH
  mips64el   |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/22c49423d418b196ee37617e8bc71b1dda27e429 |     
  aarch64    |          mender-3.5.3          | NOK | https://autobuild.buildroot.org/results/2d570c4bc7ff63723627a0bca5605a4337e2049c |     
  mips64el   |          ndisc6-1.0.7          | NOK | https://autobuild.buildroot.org/results/2e2dbe4f51b22effdb790bced96889a9188d0ca5 | ORPH
    i686     |          ndisc6-1.0.7          | NOK | https://autobuild.buildroot.org/results/12216a77e28d1dc140ad1df9766fe0a4344883e4 | ORPH
  mips64el   |         openmpi-4.1.8          | NOK | https://autobuild.buildroot.org/results/c831c22b218c9d89d610e35900fc3d6fdc96822d |     
    i686     |  openvmtools-13.1.0-25218885   | NOK | https://autobuild.buildroot.org/results/cdc854801f915dce980020d169f25993fce13844 |     
  aarch64    |  openvmtools-13.1.0-25218885   | NOK | https://autobuild.buildroot.org/results/bf239e66d2886f470c75bf18100f221facf0f1fd |     
powerpc64le  | package/mender-update-modul... | NOK | https://autobuild.buildroot.org/results/f3652274a8f87a8f5d3e3b1f52149c166e4dfedc |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/63f508299eed8dd5b7d1fafe3cf7dd83ac4dfdd1 |     
   x86_64    |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/c0b3102da636df1c72294be6cfd493c9148c09ec |     
  mips64el   |      pkcs11-helper-1.31.0      | NOK | https://autobuild.buildroot.org/results/1dc6e2f6a926176474475fc0dc22abdd724f992f | ORPH
  mips64el   | python-charset-normalizer-3... | NOK | https://autobuild.buildroot.org/results/44632751c4f4984c5783e5a7a084dfaa9fab1562 |     
   x86_64    | python-charset-normalizer-3... | NOK | https://autobuild.buildroot.org/results/e9d489cc70759e298b8d571df9aa4d8d010d75cf |     
    i686     | python-charset-normalizer-3... | NOK | https://autobuild.buildroot.org/results/30d37f9369fb07112623ed747f8e496d7ca8bf4c |     
powerpc64le  | python-charset-normalizer-3... | NOK | https://autobuild.buildroot.org/results/7aee2659abe6e08b7605c6fea49b7eb6968de909 |     
    i686     | raw2rgbpnm-f28b903ca63b4c22... | NOK | https://autobuild.buildroot.org/results/acdc71b118f3e41e7701cd0e72481b412c70d9be |     
    i686     | raw2rgbpnm-f28b903ca63b4c22... | NOK | https://autobuild.buildroot.org/results/933df1d9b62364f4cf7b1d289319e07b81b62e6e |     
  mips64el   | rtl8192eu-9664b2bfc4bcba55c... | NOK | https://autobuild.buildroot.org/results/772d3c85a05336b8702ba12094ebe70457d87469 |     
    arm      |           sbctl-0.18           | NOK | https://autobuild.buildroot.org/results/ffb27ee6331110567a8a471a47ac14e1affdcc24 | ORPH
  mips64el   |           sbctl-0.18           | NOK | https://autobuild.buildroot.org/results/2450534772d392f555774517228aefdfa2a93f77 | ORPH
    hppa     |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/2b0802af1a57a5de37bd4c3c8e437f599c32ec47 |     
   x86_64    |         statserial-1.1         | NOK | https://autobuild.buildroot.org/results/5a2bbd6ff85a2dca7c097ce58ec8e60fd5bb235a | ORPH
  aarch64    |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/f80d0412e8498bb599d072ee535366927ee04b3e |     
powerpc64le  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/37e1cda37d6cf8e775f6e729d979914b5e9430f9 |     
   x86_64    |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/0ab8bfeb9a5a58648aa0d2b3187031ffa855e121 |     
   x86_64    |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/309e65af442ebe4609643d7bb23bd2c8b850cbf2 |     
   x86_64    |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/d403a59929bb70397ca87c63474a62d8b967ca51 |     
    or1k     |         uclibc-1.0.59          | NOK | https://autobuild.buildroot.org/results/c62a2b7d2158828293a83f5df012f7eca520951f |     
    arc      |         uclibc-1.0.59          | NOK | https://autobuild.buildroot.org/results/a6cd0b6464adddc5db79b1380d0561496e009644 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/5a144100e6d806e67e8273300333df8e267d523a |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/959fa0a8a2b5556fa1f606a8b053d9d4f57af1fd |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/780b0e1435195bba3feb97deee38efc2b87e4646 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/8f53e581c749af3a71de683b688c2f4c5f0f261f |     
  aarch64    | vexpress-firmware-901f81977... | NOK | https://autobuild.buildroot.org/results/ea095e406022d91294db67b1bdb9158c312ca864 | ORPH
  mips64el   |      virglrenderer-1.3.0       | NOK | https://autobuild.buildroot.org/results/3fd755dc63379c49731838a3f9fe8a0aed6c615c |     
    arm      |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/0019d85022e5b97861a51de3ef60d13c158fd3d2 |     


Classification of failures by reason for 2026.08.x
--------------------------------------------------

am33x-cm3-fb484c5e54f2e31cf... | 1 
    host-mender-artifact-4.4.1 | 1 
               libepoxy-1.5.10 | 1 
              libmodbus-3.1.12 | 1 
               linux-pam-1.7.2 | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/c78d665549d7e31650b0b1f6ddf9a690c356d376 | ORPH
  mips64el   |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/af38e6fa08b24fcddea87290b3c7a2cae68cc4d6 |     
  aarch64    |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/0085511e48eda11618e3c869a00aeee4e1f03f22 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/ad27f3530b01debe6c9cf8508c85b4a6cc3eb8d0 |     
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/fcded47551baa9c387164abb46fa7a6b1b8e26fa | ORPH


Classification of failures by reason for 2026.05.x
--------------------------------------------------

                  linux-7.0.14 | 1 
                   perl-5.42.3 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          linux-7.0.14          | NOK | https://autobuild.buildroot.org/results/d7a1a771799ca3674b90d3990205a8722dc84aa9 | ORPH
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/4611a8b4725f59b30222233cf9a3c5b57c743b07 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                       unknown | 2 
                   dante-1.4.4 | 1 
                freerdp-2.11.8 | 1 
        host-python-lxml-5.3.0 | 1 
               libepoxy-1.5.10 | 1 
              libmodbus-3.1.11 | 1 
         mxs-bootlets-10.12.01 | 1 
package/linux-headers/linux... | 1 
               pulseaudio-17.0 | 1 
python-remi-2022.7.27-37-g1... | 1 
 qcom-db410c-firmware-1034.2.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/d17819775e67ee0a2dcbccb4a4156366a9ff039a | ORPH
    mips     |         freerdp-2.11.8         | NOK | https://autobuild.buildroot.org/results/4925a73bc117157c7d57b5613f3066c5727a64d4 | ORPH
    i686     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/f47fb4b7fcf39d361906197f73f42f9a5ebad014 |     
   arceb     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/b603edfee52652b46cabfb93d432399d96219a67 |     
powerpc64le  |        libmodbus-3.1.11        | NOK | https://autobuild.buildroot.org/results/d1e57fdfb16333108e5dede5fc79307a528a4b8a |     
    arm      |     mxs-bootlets-10.12.01      | NOK | https://autobuild.buildroot.org/results/104e0b87d1c0af0c6edddeaf82d74c95fb34276a | ORPH
   arceb     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/5c1711649e9ad7e13184c653342871dcb38bec7e |     
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/70bfe7c32945f4163e880d9a920382803e573896 | ORPH
    i686     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/d7c51a7d0ff80949becfbc2e70d5b2966d364edc |     
   xtensa    | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/fe741ff5b0ce1af08632abd60ca3e2281816497f |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/2a1d429620915b99057feac55a4b903dd87f6c78 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/1ee988ef650a7a4a96c4ccb6700d29b3b08e41e4 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
