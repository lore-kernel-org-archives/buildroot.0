Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5938BC98304
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 03:22:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7EFA605D3;
	Thu, 24 Sep 2026 03:22:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LNDX7qUTz_Z3; Thu, 24 Sep 2026 03:22:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 719DB6086D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790220167;
	b=khM1ulnXuftL61H3whNqh8EuWjozHzGnIwRCzR0HoDtVcZtRRqqWpWh1CoTwij1DFpYG
	 cP0U5rNpE5EtQE+7a3Ql3gO/n71XMP5uofe74Yyohkc040p41EpGmFYPghidkuVJCufHt
	 TwZfjw8FFGgxSy6/CqnIebWHLwjch+lMZnS5fzwHBVLzlhKU7aoiYjtd02T//mYKjTqQf
	 B/VxRGpZ8LelBlxT3YTiiVnIfC9uPkWfmoQ0xeXp+XsQtgxIMYFVDEwcs/utweE4P5GyJ
	 ovWmeK+/IlHXFQxphalgF4FYYfN2I0aqgPj9CVlQMxG/qRy72yLP4H3XS8TaJ1euzbA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790220167;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=TLSndUw3q8IEKlt6MnjtbfNiKD6nQ3yRv8AcJTE4cN4=;
	b=P/tFkjViLQKcBhLNC0SxNYhwm65+wN1s9ZaTQ3OSUu5WDRGgfV8MCrKauI79zKb4fW2M
	 pyzeklclaOukPXGZc/JTLoIF6JZsyZPMJU4xcAz2HoEC3Tcnsl0HxCSiSOfbt0aCsM4PE
	 0VuDuiA8W469R6XY/K4UkQ5dY15gYyc4FvnhHXl+Q5YPGRL3fsfpdMDCxXH7SLNXvs8Kv
	 m7Cc/KZa8PyPErz5qU7j2A9VyoOfocgHiw+wwVgilJmD8EItkBUV7CPt3rhvDpkqJMAwu
	 sy2t3Gvc3xLp3OjL0pl+QmfyevX+0p5bvEb3ZXirR2e/XnGBDqfBBQRIL/IW4t9CjlA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790220167;
	bh=TLSndUw3q8IEKlt6MnjtbfNiKD6nQ3yRv8AcJTE4cN4=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HUhKBG554VqYDHPnQgIiAwfatuFzW8ziAcKn8mgNKKl76bpm2Rp4sHTTRDbMWM8fV
	 75k9ZLqmDRr/jjPNDcPIneY3x0lRPZGlBPmXCF90WPDSjOtGnLuNd718Tp+V3VwFaX
	 GMFai899LHb6FoJpLTz+68FwwxyjR0rojT9yms8f93xIrdKlawTaMG+RccQAUiB1Qn
	 eewBVL0s9fQyC+JCsfK1QlpmQltD7XLxwscwXMAzHxpahHcMBDU2LcTSplAd05V5jN
	 8+Swy++1eDbHt/dtHn+P2hBc6PKH/PJHolBYbvGAQOzhyW2JvlteATDDkAPYe5gtjK
	 JedCjhJLbbuEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 719DB6086D;
	Thu, 24 Sep 2026 03:22:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 15C37392
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 03:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EFD4A40A86
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 03:22:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z5K63mCZ9rnU for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 03:22:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6D69F40A83
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790220164;
 b=adPYrjxZV6iqzFetTXI2v2gxNP7ocfz7Z0uOMHZ2w+mKm36FK5rnlGE3+LwWGYBEIfj+
 wqMFWDxl3iLzlSLojnVTvUUKS8AEEqTqeIv9apGjSbuwaAkujdngbMPhdJWYiDY5nJQTO
 4+a4oqOMaoNuxrrhQBxmqZWqno3Kkg9o2f8wNZVrqGuNTwF22KnlZeTeM4XymkQa6QX3m
 A5LbkRatS9Z9y63KusfxwnXeU7mqwYYGTr59M3dspQaj5123I2LbL90i2VohRWy1fxfE/
 mfnNADJ/LNS961Qrn9N+5dhMyvE5btpHC9Bguti96RlSGFgdDbAYowCHUA8tpc8a7xw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790220164;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:From:
 Date; bh=sbATCQzvsGAhdwOK3NdAangGXEuwSaRzhX28di8Jihw=;
 b=QO8RLL/7sW7d5Fx3pk0yfsSKk/E9bo3325iaMSpnWbluoIEoww4YQZlKDiaBGOSoxSkq
 saCHcNzXebwKR5d5qWeCR2LwUbm2ysuJ5FRm8x4sih9L2YE9KUN8R5Pkt9Kou3ZUMNj4v
 oocnwJH1ldIEc9VYyDP9MhMdNX9nserWUqsxkt953u8biPHGOIY6g9B6oSVFDLEmZ65GI
 Eki1JcfbLVgU8UEwkXwkRaOdBA3Sy3T7BqRFKlRLCawNP9BVe8nxAMhISebcH+8ZsBHHP
 S61fIMc7Jefarb8/E0RdO9NHHlgNMj8ZgxIBwAHDmsBPgRs3t9wSlRSJaY3My4hz/uA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="pa/mtTk5"; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:30::10; helo=mail-wr2-x10.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=pa/mtTk5
Received: from mail-wr2-x10.google.com (mail-wr2-x10.google.com
 [IPv6:2a00:1450:4864:30::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6D69F40A83
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 03:22:43 +0000 (UTC)
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-485ac898fa4so1435913f8f.0
 for <buildroot@buildroot.org>; Wed, 23 Sep 2026 20:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790220162; x=1790824962; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=sbATCQzvsGAhdwOK3NdAangGXEuwSaRzhX28di8Jihw=;
 b=pa/mtTk5S5363hwkTRHkNUUcOHI3bFT16o4TbGRMAxfV0lgdbvYueH9xzmuxykSSXE
 oM0Z4xIPYX9RDNod+VtLsrLW8vxNb+b+zTXxaGyrM47xWHngwsz/hzOhNhWBgQ7Ds2IP
 BAimmAukYiY0+chFdgM//SDogvoSP7M8fClQgGuTKz2HIzzXnq0m4lBHy+hHverAf2eN
 nJtsfvjuj8v9B89Vi/j2JJ1gq+QhA9UvI8BVwhu/l6TYALiejeCgnrCHkVhpDQHMlq8O
 UXKc+vMMez8SruEzs5UgOD5RhqpntccaT5Qr7pqQ2TjWwEWwuGp+EmEX4GYQIO73lIVd
 EoEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790220162; x=1790824962;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=sbATCQzvsGAhdwOK3NdAangGXEuwSaRzhX28di8Jihw=;
 b=cGkqXVFyrE+Q1s987cs9xfBvyRslkj5n0eUT9Y/0VS0m16SSBcE35054NSkG2Wh/LY
 lIlrPL40C0eoF0ZCeyMB+1O81d01NVg9F2Zf3xhR1Xwoyvm6SmrUhXPZ4CQa8tpiZTyx
 BJYW+IS6pdE7+bBiHb5l9uQnKKIXOV3vk4YZfi/etVMRA2iuL/kTV9zg0Iifm23o7FKm
 ZSnuLp/2Uq4yqFlQFHawEW+CQ/zCiD/T3tDvPgdrWx+aJP3bx7n7VmWfpC/qRgsHW1hc
 TBIeDiFDmpLaBH58VCSdvqo3auB2z20fxDHMsS1VT4KXrgCBNKMmQnyJQi7GdMug6M9c
 KGKg==
X-Gm-Message-State: AFuF++kgGGIKRagHHtqGhSxkzyjcc6Mvg9CLV0qv+LHJJlx3+BXWSOU3
 MGxL8ExeI+ZIt9aOwHfkxQCcHE5jyBpT+48uKmQJ/O5k+GF/lYq0krlA0Wo+bjrm
X-Gm-Gg: AYBFou3Opz/+pE3rUxKBlAJVzkx2edLUDgyEOyPa3xTGqEueAbvv5MdQ8bwmLqQ0VkR
 GP0ulOLz2TELTc3gmgVf/cnNsGzQsgCIXFCHdJBpbpfxbTUDcUqhmyCX6D+s46JiFPUd7Uli8pu
 h2zOHjop9pvkjuN9mJ31M/PaUeBF6dXDQyBkVsSe9lfDIIW+TCH+uTjmdB+ph4s1xtZEzAEzN1E
 4m3l2az+xzNtHBci53k1mfxbg12img/f9bGJgYOtoWaHbSrcKLk1lHMW/kNu5VkAVWkAjLvf3Jx
 CuV/AbTplhrjDIGmHsj7Xn+55VgGWYoeF6xIM0psBOsTy6Nm13YXXQTBqOLIn9I80qp3lnqbqsa
 1Ok1Pa6xp+GgGCGRX8/m52UaCWwxgEezWXh8mcsyR0ziCWJ/TsbEvcv3fc5BA1Z+HJrm/jnBfJQ
 bmpRM7OkjlmoD8qAeY7UZfDngescwB71cw0JTuijjRNwJ9oaV71nd2Kxj0ael0orMja+PHWyKy+
 SqD5ZeH60eb
X-Received: by 2002:a05:6000:41c5:b0:487:489:7af0 with SMTP id
 ffacd0b85a97d-48871725703mr1464538f8f.17.1790220161574; 
 Wed, 23 Sep 2026 20:22:41 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4886877a2d5sm10840153f8f.27.2026.09.23.20.22.40
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 20:22:41 -0700 (PDT)
Message-ID: <6ab49781.aec4f0e4.1af20a.8b4f@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 24 Sep 2026 03:22:40 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-09-23
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Autobuild statistics for 2026-09-23
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  |  3  |  0  |  5  |
  2026.05.x  |  0  |  2  |  0  |  2  |
  2026.08.x  |  1  |  2  |  0  |  3  |
    master   | 24  | 37  |  0  | 61  |

Classification of failures by reason for master
-----------------------------------------------

                 libclc-23.1.1 | 5 
            igd2-for-linux-2.2 | 2 
                   perl-5.42.3 | 2 
                    attr-2.6.0 | 1 
                   audit-3.1.5 | 1 
                  boinc-8.2.11 | 1 
             bubblewrap-0.12.0 | 1 
                    ccid-1.5.2 | 1 
                   ccrypt-1.11 | 1 
              cryptsetup-2.8.8 | 1 
             dahdi-linux-3.3.0 | 1 
        edk2-edk2-stable202602 | 1 
                  ffmpeg-6.1.5 | 1 
                      fio-3.42 | 1 
      freeradius-server-3.2.10 | 1 
                 haproxy-3.4.4 | 1 
            host-mfgtools-0.02 | 1 
          host-xfsprogs-6.19.0 | 1 
           igh-ethercat-1.6.12 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
                   libidn-1.43 | 1 
                   linux-7.2.7 | 1 
               linux-pam-1.7.2 | 1 
                   linux-tools | 1 
               openblas-0.3.34 | 1 
   openvmtools-11.3.5-18557794 | 1 
                    php-8.5.10 | 1 
qt5base-bebdfd54917e25d1c10... | 1 
rtl8188eu-cca7c28087db740d7... | 1 
              tailscale-1.78.1 | 1 
          usb_modeswitch-2.6.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/c77426ccf076a9c45321a5c1a18b8b604caf4775 |     
  aarch64    |          audit-3.1.5           | NOK | https://autobuild.buildroot.org/results/005c49122cdc9af7d0979a19e8c489d4f54ba136 | ORPH
    i686     |          boinc-8.2.11          | NOK | https://autobuild.buildroot.org/results/4fb2ed45372ede7645521447baa2bd881876bbd2 |     
    i686     |       bubblewrap-0.12.0        | NOK | https://autobuild.buildroot.org/results/2eb2d222daaadc2eb16b42fa2ec102ab0689f038 |     
    i686     |           ccid-1.5.2           | NOK | https://autobuild.buildroot.org/results/6609a3e797f0130f1d9151f6c0c081dfe43e9c30 | ORPH
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/7a5a14c537d2aac07b7afcd55434af7dabf5f58c | ORPH
    i686     |        cryptsetup-2.8.8        | NOK | https://autobuild.buildroot.org/results/e6159cee14f84569c85a61f77824b2b58d68a4bc |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/f577292634b8e0e574a0930bc16fd303521e809e | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/3f53dbcc4734d5e6e192667a36da240009199f7b |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/d3d0680b2340fa69f228c00019c7ea0e0426656a |     
    i686     |            fio-3.42            | NOK | https://autobuild.buildroot.org/results/f75d90c2858df67ebf6ca15484428b9e0dd1885e |     
  aarch64    |    freeradius-server-3.2.10    | NOK | https://autobuild.buildroot.org/results/64244ad6ff213f42c4c508aa4c0a17b99565b926 |     
    i686     |         haproxy-3.4.4          | NOK | https://autobuild.buildroot.org/results/c52bea7f067a68395865ff826d6d2e696e33ffcd |     
    arm      |       host-mfgtools-0.02       | NOK | https://autobuild.buildroot.org/results/94f08159f2f3ace505de4af917d02a4043c04eef |     
powerpc64le  |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/bfa58922632ec1da924d0c0dab942758db99f03a | ORPH
   mipsel    |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/1a0a9e670b5a2ac8e41f367137a8919c739f00e7 |     
  mips64el   |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/cc7d481c20b7d50787801c2db58dcd13cd75e33f |     
    i686     |      igh-ethercat-1.6.12       | NOK | https://autobuild.buildroot.org/results/923c5dac8894e90f46a7ae315c2d9834d1eebdbe |     
    arm      |         libclc-23.1.1          | NOK | https://autobuild.buildroot.org/results/ebe4a4178419808b46083489328837da3f01a2b1 |     
    i686     |         libclc-23.1.1          | NOK | https://autobuild.buildroot.org/results/f1156a68f0f8c4d9225f4d18c2ee34b3ff7b3c9c |     
    i686     |         libclc-23.1.1          | NOK | https://autobuild.buildroot.org/results/3ebbde4b2b260fcfcb7487f7a6d2b098e767659f |     
    i686     |         libclc-23.1.1          | NOK | https://autobuild.buildroot.org/results/06dc94aff4922ef08d3a52351c0cd0829482d886 |     
  riscv64    |         libclc-23.1.1          | NOK | https://autobuild.buildroot.org/results/cb469f6104c7fbb90441cbb00d4fef02623985a1 |     
   x86_64    | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/e34ae27a2cee32d04a0e155b0d7c02cc78bfab15 | ORPH
   armeb     |          libidn-1.43           | NOK | https://autobuild.buildroot.org/results/5bac464a60fa5c5da9032f0fb71f060facdc5c0f |     
    i686     |          linux-7.2.7           | NOK | https://autobuild.buildroot.org/results/9e67989db9b4b94030ac3fd8fa076e38968c7112 | ORPH
    i586     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/2195272ed597fdaa5e4d8a2d474d66cbe3f2003f | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/679f55b1656e0b06e687d536e7a3c935b31bb585 | ORPH
  riscv64    |        openblas-0.3.34         | NOK | https://autobuild.buildroot.org/results/0b0947e922a4fc89367b46387aaf0f075a729f0a |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/d716ca887aee787f437e6db87f6458d1adda223a |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/81030ae68e33b41bc2d25e21af90f121529a1b80 |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/027478c83cb30b4150315268e669af382317b5f6 |     
    hppa     |           php-8.5.10           | NOK | https://autobuild.buildroot.org/results/ad77f8241b767af2dd8f67b87a48fe3149e79a06 |     
    i686     | qt5base-bebdfd54917e25d1c10... | NOK | https://autobuild.buildroot.org/results/8fb089232b0050feaaf3906759177a8f1e823d1e |     
    i686     | rtl8188eu-cca7c28087db740d7... | NOK | https://autobuild.buildroot.org/results/429169380ef6baab5ae964dbe54640571f0e449f |     
    i686     |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/23c41c000e6cbae225d6a21be5dae8d508a68f79 |     
    i686     |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/e2dc930447df422ab7d9c360f910233de5e7fe37 | ORPH


Classification of failures by reason for 2026.08.x
--------------------------------------------------

                 hidapi-0.15.0 | 1 
           virglrenderer-1.3.0 | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |         hidapi-0.15.0          | NOK | https://autobuild.buildroot.org/results/9393ce57ef313301814fad2bd4be9637ac340ffc | ORPH
    i686     |      virglrenderer-1.3.0       | NOK | https://autobuild.buildroot.org/results/032989cf27db65e933c3f650af754a468f5850fb |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

            jpeg-turbo-3.1.4.1 | 1 
                       unknown | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/e58f2e3cf4b6a85ca6b49160c3dd01ee09457e03 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/53323d2d1d46750afa972711e6be63420ed53316 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                  libsepol-3.7 | 1 
                   linux-tools | 1 
                 openmpi-4.1.5 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |          libsepol-3.7          | NOK | https://autobuild.buildroot.org/results/19a251923952000312281537dcc1416fe7d1f415 |     
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/9a80a17c8388e300a05fc4c23f655a3854f6d59a | ORPH
    i686     |         openmpi-4.1.5          | NOK | https://autobuild.buildroot.org/results/27f71f79429b7727dcc6340cdd9d5b80b2f2e844 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
