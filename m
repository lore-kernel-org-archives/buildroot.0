Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A140606A323
	for <buildroot@archiver.kernel.org>; Sat, 14 Nov 2026 04:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=PvGH8K3Q;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uuLzWdW5
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C70481B60;
	Sat, 14 Nov 2026 04:30:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KiBElCiG0Jal; Sat, 14 Nov 2026 04:30:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A7BF481B14
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794630641;
	b=VGd7/t2iWhB+HaICzStmZ+Y/u0JN5iYmX3wL00u4GvxYXhNICzBQt6G7ih0VP3Ya2V+1
	 Y2sDFKM5Rcm76WLXBIPJ8h9lxREzioO7xCeq1c3HoqiPD/t50F+zT5tyC7gRSrF+VzK5w
	 bgnpimGE0aug8wSkFDeLFpJQRNRDzSq8pqBqDRcVS87sOPvW+vcW/7/Tn7m9AjDcRaKt2
	 TORyuH0lZOkU4OzkhOs0rGMflffnC39G2biI5X1A/NaDHExqmJbHPN/iahUKCAbfIwHrB
	 H0F/zMfd1hBWln1y8n2ejKc5ykSzeCRZpiATNlwHbMU8qqfp5WKuQxIsNzdaeSZAqhQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794630641;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=RV/wAU30hMUgv3SPX++0ciOjl1GV/rAz9xn5OlJYdrM=;
	b=I/zEvccM0vix3HU8RaDhbrRc8+qI8aZzwKAte8VR32cIfpltrHzk6HVpFG6YdmZ9gBuq
	 dgMHGoE4Kbg18jkKP1AVczbZ+EagSZd8tWTgJ93DsUgy8mJB5IO35dSeGOrltOxcjN5Ax
	 KH1OG7DbAf3Wg9ZJS6Gd/9sAA7Gn7m2dxR1De9FDWU7y+89vtEnW5m4uf2ZJcly6WxfAt
	 RvcNFBqOSAjYuxU+R5eCjK+EJmIK0y2eMdHm/eJXNIOTIFC6rFoW0Rz73/wQM4ozVjKMD
	 h1MoPqMn364avSVWyN8KqqnyTyfL71HSadfKogbb2DRxRmBTHcMY1w4e527VwTUR2mA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794630641;
	bh=RV/wAU30hMUgv3SPX++0ciOjl1GV/rAz9xn5OlJYdrM=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PvGH8K3QkSmk191aidnfsxFSytGSlrpEP6JoqKC/5RD9HAQwxscDopyVJk6gjsTxP
	 kVRO+e188SETJDYMstNQqLomXkMA2QAd7EXfr/zRILa+nSluGaiSiHJz4ijjtnLho2
	 DfQiJhEP0qSLJA/roTYtq3qU60YJfPCUi/FMRlhqFN856S/FtVuerU29Ofa55Js3xT
	 hLK80fx62DA92SCpuXZfJ2DyxYUgUaTqWQF92u8p0FWqIiTfUjjKDh6SG/7mf6n8aY
	 OLfYHdRkiObXTjksfE1DPo3OGcjaO6eqxu6YBmOARqT3/mPMqnr0ioWGHhfNrULoLa
	 gybiN+riBFapQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7BF481B14;
	Sat, 14 Nov 2026 04:30:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E2E3F169
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 04:30:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D49844032F
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 04:30:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rA-hp6uqcS4W for <buildroot@buildroot.org>;
 Sat, 14 Nov 2026 04:30:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 3DCE9400B1
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::334"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=uuLzWdW5
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3DCE9400B1
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 04:30:38 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4b7252a32c8so23554915e9.0
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 20:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794630636; x=1795235436; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=LiGqJjSeucZOn+0pWPB1Tp7h9bjYAZQtwEMLqTFje+s=;
 b=uuLzWdW5dIEe/zR6AmcyvPvRzjlp6k5KeZBbbGNV8BKM/h2fPdwS0dxg68Qk+gKBm5
 XDL/6AMugDeEwATGGB6GRY5jA1sYjkrfcomLvuiBO49HIWUyaTCvodWhriJ3OuwRadA6
 NyShn9HtMCA8NDn4jCKjMA9TC6RX3DRlEW8Eh/LxMq0m4zaeaK6jGgNAq2CmX9QVtpiD
 xiKqZysNioMJiNllHMLl/4WGYgaOK2A9/qYka9jjKg1qMGu5QQHWOkWZITgxcWI3Vv++
 GsKgIRIsNphWJEEND2LscYj3E8tm8IVxX0L+0jBd/qiMylIh3XXSbaedZMfp73OktQPG
 K3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794630636; x=1795235436;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=LiGqJjSeucZOn+0pWPB1Tp7h9bjYAZQtwEMLqTFje+s=;
 b=ZplM8rRLFz3uvr4fVP7YMYAIyizhSDXmI5g+kM41Pt7rp2cnozl1TQzwuqWFjyKABr
 y1qCB18+T6tLirZQUC+fcat3cPnttyetvBykmk4RBKH3oUjaKoST2ZGyxmuJZ/Qzl/t+
 A7XMSfgJmawCfpykRBHxHwm2yn9p6MnOv4dkCu2+5uxYF53+6u2jvvDUyCl2AkSunDQN
 xotMDpS0GheXBN6Kqy6Zn2Dg3HtNEGGeSQzgerZsjkc/XcfZ/fXBBjafffJIaZB3aE2O
 mJpUofcyI/3RonkK0seizA6Zp+rP3P63yvJB+qNa7pvBN1hpjzBELjYxaj2SACcIWzBT
 28Hw==
X-Gm-Message-State: APuU4Z88Nmps6HQGwe0Jptm2fovcWjokROopWBN4AuYRUseZGH/jHx2Z
 K8KPL+HjcSBDKSuv2F2aclGEIWaf2lIEoMLtoFpgKacwQZKwB0rVKEdDJ8hwedRW
X-Gm-Gg: AYBFou0U8NEQNj7HZXIhan9TLDpP8SvP5fOaFWB8WPnfOtj9KisrLRD++jBYMs2JJzS
 ZnIKoB6kLWLVhqoF5yu8gQxzuMDB5yrurSa6y9XhN45z06P/NJMqHoz5GdD8VuGsQUzFfXGa/HX
 Iu1vrqA8uhvik1Pch+4q8Y+lQBpQfuwZYtgALEXxO9n3QVC9JmT2IHt1NEr7xoeGAtHmlmecd+K
 v0wm/Jpj1rgYUlX/7hxz+DBDgc6sfu064CKb1oVxVOZra2oumQh14RtOqCfNa3yY6jZ//Z3W1Os
 1Y9uBcUeLX0ZGEcZYXNJ4w7AhbOqnSM7egxCi4sMN2GoZP3onrJUNrM/ssm2zqglyofDjEUYElu
 K3mPOJ4pYTKpReBGpLXOiAEC9J+nfhz5awP/sFjdKYWzDDO2oudanten7V3qJODUSx7SIJd66kZ
 EXGAqfYwmzSbEWFierm+MpsDFQWUlDb48M7DRLe9NBhs1g4PCfIWlioTaaNtfUhtBDLVCHiFz8/
 hGvsDhucmY5SU0r9Z7Td2vrm9m5dNhqqxG9JGXOrrVJk/4N5a9OOAZCpQQV8/RXoSQizBSQmC/y
 1rf5WvhQnkaNCLB3lzlrJVAT+X2vG4Y95Q==
X-Received: by 2002:a05:600c:c167:b0:4a1:fe55:88ef with SMTP id
 5b1f17b1804b1-4bb55a92fa1mr99225845e9.20.1794630636439; 
 Fri, 13 Nov 2026 20:30:36 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c6d079a2asm7740790f8f.16.2026.11.13.20.30.35
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 20:30:35 -0800 (PST)
Message-ID: <6af7e3eb.4499076d.af18a.0127@mx.google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 14 Nov 2026 04:30:35 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-11-13
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

Autobuild statistics for 2026-11-13
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  |  5  |  0  |  9  |
  2026.05.x  |  1  |  6  |  0  |  7  |
  2026.08.x  |  0  |  5  |  0  |  5  |
    master   | 40  | 44  |  0  | 84  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 6 
raw2rgbpnm-f28b903ca63b4c22... | 3 
    host-mender-artifact-4.4.2 | 2 
                    attr-2.6.0 | 1 
             batman-adv-2025.4 | 1 
                   bird-2.15.1 | 1 
                        chawan | 1 
                  dpdk-25.11.2 | 1 
                  dpdk-25.11.4 | 1 
            dt-utils-2023.11.0 | 1 
                  ffmpeg-9.0.2 | 1 
            gdk-pixbuf-2.42.12 | 1 
                 glibmm-2.76.0 | 1 
               gst1-imx-0.13.1 | 1 
                 haproxy-3.4.4 | 1 
              host-rust-1.99.1 | 1 
          host-xfsprogs-6.19.0 | 1 
                    lftp-4.9.3 | 1 
               libglib2-2.90.1 | 1 
                  lldpd-1.0.22 | 1 
                   lmdb-0.9.35 | 1 
                    ne10-1.2.1 | 1 
             open62541-v1.5.10 | 1 
              openconnect-9.21 | 1 
                openntpd-6.8p1 | 1 
                    opus-1.6.1 | 1 
                   perl-5.42.3 | 1 
                 pixman-0.46.4 | 1 
            qpid-proton-0.40.0 | 1 
                 rtl_433-25.12 | 1 
     s6-portable-utils-2.3.0.4 | 1 
              syslog-ng-4.12.0 | 1 
                tpm2-tss-4.1.3 | 1 
                 uclibc-1.0.59 | 1 
                 xenomai-3.2.5 | 1 
                  xxhash-0.8.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/2bab3708d41f09d16b9b052d7e711b055ebb31b6 |     
   x86_64    |       batman-adv-2025.4        | NOK | https://autobuild.buildroot.org/results/73a60112e6efe9eb3970997cebe6b8377d68b3a0 |     
powerpc64le  |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/8e342cf47069d4d60ef63c8a01e57f35e3a408df |     
  mips64el   |             chawan             | NOK | https://autobuild.buildroot.org/results/433335494a5a1d3961f32a1b59a4b523bdf570b1 |     
  aarch64    |          dpdk-25.11.2          | NOK | https://autobuild.buildroot.org/results/cfbc18ffdd8d5c6af6a974259de46e54d5800f4b |     
  aarch64    |          dpdk-25.11.4          | NOK | https://autobuild.buildroot.org/results/62ddae38ca9f4d1f481068f488a06e202fa4ed41 |     
powerpc64le  |       dt-utils-2023.11.0       | NOK | https://autobuild.buildroot.org/results/6ebe018215e8203d647393dd0b1dce726159f61e |     
    i686     |          ffmpeg-9.0.2          | NOK | https://autobuild.buildroot.org/results/b22dbc414ce20b67112b79f7437a8982d56e5f11 |     
  powerpc    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/703183b74818fab3448e2abf45cf81c8a0d96289 | ORPH
    sh4      |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/6217e51bbd945a0cf39da749d886b5acf651a997 |     
    arm      |        gst1-imx-0.13.1         | NOK | https://autobuild.buildroot.org/results/ced2c9a4a654431973b85007cf8cbcf72a285208 |     
  mips64el   |         haproxy-3.4.4          | NOK | https://autobuild.buildroot.org/results/e9433b611a2ea9803c971578b13c322975b3fb11 |     
  mips64el   |   host-mender-artifact-4.4.2   | NOK | https://autobuild.buildroot.org/results/aedcc1b22bea591a7d90ecb488954d66cb4aa21a |     
  mips64el   |   host-mender-artifact-4.4.2   | NOK | https://autobuild.buildroot.org/results/38261b32ca3186fbb9cdccbceaa278a842c69e72 |     
   x86_64    |        host-rust-1.99.1        | NOK | https://autobuild.buildroot.org/results/5170766af6b6765474797acd01233e56d2b99938 |     
  riscv64    |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/cb8588fe9b266ecd1430afbc75a5c310472a5631 | ORPH
    i686     |           lftp-4.9.3           | NOK | https://autobuild.buildroot.org/results/a5624ed0afa0dc99f297220da4d2fb5b3967eafb |     
   x86_64    |        libglib2-2.90.1         | NOK | https://autobuild.buildroot.org/results/5e6e4ca6db0fc919403971f1526888df75c5c673 |     
  aarch64    |          lldpd-1.0.22          | NOK | https://autobuild.buildroot.org/results/05b0bb8401d4925f8f403bc5be017631d91d730a | ORPH
  aarch64    |          lmdb-0.9.35           | NOK | https://autobuild.buildroot.org/results/4affaaff9ece54078a344a2e3879b6d21140f3f8 | ORPH
  aarch64    |           ne10-1.2.1           | NOK | https://autobuild.buildroot.org/results/491638d787e2a0c0b3416ac921453f249194b72a |     
    arm      |       open62541-v1.5.10        | NOK | https://autobuild.buildroot.org/results/53bd33a3c6ae48f04d8d67d6d16c33aca5b92c4c | ORPH
powerpc64le  |        openconnect-9.21        | NOK | https://autobuild.buildroot.org/results/9b56848182566ca418f26c6a757a3359aedcb576 |     
powerpc64le  |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/19e4115686a82246860c2304457e1010b39e2d91 | ORPH
    arm      |           opus-1.6.1           | NOK | https://autobuild.buildroot.org/results/4c21a09ca4f3b75772f4774d7c2549b079231b66 |     
   x86_64    |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/c000c3c99611a31f8a0230c528da873f1272e610 |     
    arm      |         pixman-0.46.4          | NOK | https://autobuild.buildroot.org/results/16814d4294a6f521f821917638bc5e007348372e | ORPH
    arm      |       qpid-proton-0.40.0       | NOK | https://autobuild.buildroot.org/results/76220036936238c8c1159c4989ea3e284e40b831 |     
   xtensa    | raw2rgbpnm-f28b903ca63b4c22... | NOK | https://autobuild.buildroot.org/results/2170d16a304dbe1eee73b0849f5661e7423ad8b8 |     
   mipsel    | raw2rgbpnm-f28b903ca63b4c22... | NOK | https://autobuild.buildroot.org/results/b5c465c0217e1ad090bd593ce368fb4d83fc1412 |     
    arm      | raw2rgbpnm-f28b903ca63b4c22... | NOK | https://autobuild.buildroot.org/results/52293c6f0a121b1c8a2dd20726ff544321364c1d |     
   x86_64    |         rtl_433-25.12          | NOK | https://autobuild.buildroot.org/results/26b99fd061945ac144a1216aea59c5b4b07358dd |     
powerpc64le  |   s6-portable-utils-2.3.0.4    | NOK | https://autobuild.buildroot.org/results/fa848372f5b34f5a1f7eecdde488edb777c6a08d |     
  mips64el   |        syslog-ng-4.12.0        | NOK | https://autobuild.buildroot.org/results/832745c2e8ac4a3e12b6f5f0e1d9d2f8949a656d |     
  mips64el   |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/7b89babc1548ebe87e36cf674e05d522b4adc687 | ORPH
    arc      |         uclibc-1.0.59          | NOK | https://autobuild.buildroot.org/results/b0fd8493486d1bced27766d592a19d11f14e7aaf |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/7df1f0c514ed4f7564979d0bf179b9e1e85c6250 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/bf9af3db889697c7687e375899a4357b40a25082 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/b1b2bcae97a9d30838cc46f05bfc956ebf0abeee |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/62a8a5252b279a109d72d577853cfba3c710472b |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/c7315777e363d7f36d340fa8bf22d5d11b0394d5 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/0ee9c6ccdf38d8b46eeaa8f077ef1ee4233c7c4d |     
  mips64el   |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/5ee78484a1edd32039e848b07a38a9072a4ce129 |     
    i686     |          xxhash-0.8.4          | NOK | https://autobuild.buildroot.org/results/18b9435aac861b678e8750110d07d4b9941b3711 | ORPH


Classification of failures by reason for 2026.08.x
--------------------------------------------------

libfutils-c326ce0cc2a735438... | 1 
             libopenh264-2.6.0 | 1 
                libsoup3-3.6.6 | 1 
                      poke-3.0 | 1 
rtl8821cu-7f63a9da2e8ed8340... | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/d233c0e57a4210ceb469f5f3060d28e75f621182 |     
    i686     |       libopenh264-2.6.0        | NOK | https://autobuild.buildroot.org/results/b7830981ded51824fde30f07ad141161f1532639 |     
    m68k     |         libsoup3-3.6.6         | NOK | https://autobuild.buildroot.org/results/96c8757d131543c5b970b3267709bcc51904fa6c |     
  riscv64    |            poke-3.0            | NOK | https://autobuild.buildroot.org/results/427c8ba34eb6d0db403bd22b30fcd0f1eadb2ceb | ORPH
    arm      | rtl8821cu-7f63a9da2e8ed8340... | NOK | https://autobuild.buildroot.org/results/5bb7aa85dcd4394995aea312bb5d956f08596cc4 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

                cryptopp-8.9.0 | 1 
                      gdb-15.2 | 1 
  gobject-introspection-1.84.0 | 1 
            igd2-for-linux-2.2 | 1 
      passt-2025_06_11.0293c6f | 1 
               pcsc-lite-2.1.0 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/de9de3c268b0be3628a03ceb49c9af3db1bc5dc9 |     
    i686     |            gdb-15.2            | NOK | https://autobuild.buildroot.org/results/b97bbc083df6f6629dc2315daff25d9d59b44fce | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/f4cca6ff36a2c24806c05b3f10c33e39c796a149 | ORPH
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/aa508b3701692f1223d208e935bc0f582a4ddf4e |     
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/de9620b853a78d2e7bb607f6c6bf5900ff6e889c | ORPH
    i686     |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/cafb9e93c9446d3c8a60ab6014131e0d5a04a48f | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

               host-4th-3.64.1 | 1 
      host-uboot-tools-2021.07 | 1 
              libmodbus-3.1.11 | 1 
                       unknown | 1 
           xapp_xlsfonts-1.0.7 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        host-4th-3.64.1         | NOK | https://autobuild.buildroot.org/results/5e9931d48407203efce5d9a9528d34cbc9dd27a0 |     
  aarch64    |    host-uboot-tools-2021.07    | NOK | https://autobuild.buildroot.org/results/261c0c82294899b2d0da46c3aa4f48d9c381a15e | ORPH
   x86_64    |        libmodbus-3.1.11        | NOK | https://autobuild.buildroot.org/results/6093bbe21ff0ba7ecb3d4f503941b4d6ae099593 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/a414e0ff7be8eedf7071dd1505d0f36a3aa8c916 |     
  mips64el   |      xapp_xlsfonts-1.0.7       | NOK | https://autobuild.buildroot.org/results/932bee2f6dce7d604993120f26e0557b1b134005 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
