Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0A7606A31C
	for <buildroot@archiver.kernel.org>; Wed, 18 Nov 2026 04:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Noy8JVLk;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yOzd77Fe
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13C10606BB;
	Wed, 18 Nov 2026 04:23:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sust4okbdA-B; Wed, 18 Nov 2026 04:23:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9572760743
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794975811;
	b=cmYmSXPRPG2LA8nSNtnNaH5V3MOhd5CQXVd2rAZ8uWmizQQpmjN0nhbpyjSvMdqSWGyT
	 p32UYpewMzZnRlEg4Vha9QLWxrG8z0TnacNhgkjCUVnSu/LKz2UU80Yv4QAwQ/ba1q99U
	 EXFfYoPKaQOcchkLyenMIHZNNk/4h9Kz6uk9ujeVCpQeAIeslhWG8bo6om7egeEIRR1PG
	 nxp3wcGOEevo3oF8VahPDDIjP39hQTLkBxvzkYT6PCsCJCToxVFgjXbpvphzIdoOlXo+k
	 2yK3YTaKG3bBrt55qdReMyCzEPgAY8xBIt2lM+E8GV4I73HAvGoVZ2dvL4Qz4oHVMvQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794975811;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=4gIqapss2KQMCXcM9wXrk/rDKHmhqePwjNxRU25Mqwk=;
	b=AMeAqhQrSajYAcclc6g62jlXZcRa9vSVkdVaLs8+Oohmt/q6rb3rq3HBitxn1I9FY2gE
	 wixa7lpCkzbTGe1KqeSA/F7UiA/bVd9OZBjKvIYkEbkJ+kogNpSsE0zciRcrwVKtQpr5V
	 vPeXA1sJHCnCwo6p0XuOAgrZafwQRxkt3Q0ZXk370yYTmLf8Hc5RSgLSlkjV6brx94zN8
	 HGbEPjJ0XHuAoh6nddiJQnKsAfk34bCXmKpAeSPR5TuU0OfxNfiDR1V8ZcYWA2KMNWH3+
	 2T79/k/Zf6aYuj9opKhbh02NXrNmUcvXiQK/SBnJyL/Srgp1hYyMP8JV5GrEABZVpYA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794975811;
	bh=4gIqapss2KQMCXcM9wXrk/rDKHmhqePwjNxRU25Mqwk=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Noy8JVLkyZOyF/38n03P3Gv3O7dhWBt2KVTBmY8RjUn9gGsXXi8XlL/sSjbJby3XR
	 0mnRNKhizO5jZEluvBD602icsA8cwgsWqQW8HqdwePUwlgDzb1/VRN2Ub0ABIDM1VL
	 Nc9XxTtxCzUVsSbqvhwUe9a36tF1UHr/WtSqZXvR/t88zwM7qmr6fphG8c2kgVfpMj
	 pOSIS+aQawlztwtAd2cbeBuUhTJRQxjsAzwUF/jlzo88swuvbTxBfLHp0zWLn7oBle
	 X8Ua9+GAUbFqCfBWy6ASweLj7Yum5It75tLO2xQEqiRmyInJ/XbEh54BIEgiOX7Tqh
	 H2pm4BnXEL0ew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9572760743;
	Wed, 18 Nov 2026 04:23:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AD9A21E7
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 04:23:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9343140807
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 04:23:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FFSTUAEEkIpm for <buildroot@buildroot.org>;
 Wed, 18 Nov 2026 04:23:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EED1A40800
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=yOzd77Fe
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EED1A40800
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 04:23:28 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4b467581b98so6054115e9.0
 for <buildroot@buildroot.org>; Tue, 17 Nov 2026 20:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794975807; x=1795580607; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=YHkQANEt2lvMqtsMhNlr/q4kFW7/vBi+EDZS+t3fqmA=;
 b=yOzd77Fe7vr+mcY979AQ7OB96czHiHNCv2eSvU4ns+1JDu8GxLm3b82E5MPDE8uKsl
 xJoLTsWj25CP0V0NTwqcbVZ2FORfmvWOAT7TA3Ayv3KQWkgj2pnU6o/9VWnNXQbveSEz
 SXuRGkvVVP4PR/V4KkVHzCElik7YzI3I5DRZp+W77V1BWUGhzVMLLwe7Ijw/3Eu5E8jL
 Bt+YIltk6Wd3D9Lh9IYM9XORCOdzOU21JIJgHxn9VONTiLApZWDvNltmGh7xCrTE/0o2
 lHmdTkuwhCwocqMp25OON1P+In+HxNhx02D1LLwWbJI3bVq28rf6FMeMUjSrYbwnT/u7
 RVgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794975807; x=1795580607;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=YHkQANEt2lvMqtsMhNlr/q4kFW7/vBi+EDZS+t3fqmA=;
 b=ESDMVUX3DHzeWFac34XXERrUh6NnAp3BmjJAmJIWq13w+9sIiQUz9acdZXTca9axSl
 icxw+b5p8Wuo/Vafr3QAR5oX+RmSb8q8zRhQIHgatD8suDTVrOkyERY+axD5J7rr1vqY
 XghOqjCHeoY2VBIY1EPyVj6OnIpqVGGXjYdx9qXhsFk7SoCxYAG2ufGZSPKnj1m6oHWE
 hgNynhmdVSvbFVhw1zwFanjK0K52DiiCadn8/6GFD786mPUG6/4/qeu2aPWi1Uu5DmO0
 0vPMPgHCmo03eBKFcMSFo/YN+klWgZQ04qyCn+0frBg+EB0ISrRU8OnbOrL8/V760HqI
 YMiQ==
X-Gm-Message-State: APuU4Z8BlIyNQxGxvnrfVKRNwW9+qmCXKgPbN703doyoGN2p+kA8eOAw
 +z77tB9fptm7SXDOCJDL3R9cAYS1olRiHhI1IH/YpFTWbHS8dohSpnOSLeCPnaf9
X-Gm-Gg: AYBFou1BTweBpgzQrBfrYUIzd7+8CRA0tpaklix9YmMUMBwV131ZM9o8+3ymrtjps8V
 aiahXk61nM8YzbggLxH2PNd/syqURAknqtFx0Y/jwPydsXlOg8HSRuL+saNlxgHtFvRdTPWC/K7
 mTE3cEZSwJBvJstKfY9QegiMkjdI2LCnKAj3BodaCPTOamhhnpJ3G9dDRD21AMw7UT6IDszJHuz
 JJTZ/X7J1w0eh20isjMTQPb90B9Qdkr3lv53x7xZbY28yozwrTTdwjMts0ssMWhAgfTzTpUExjc
 YaA+LGv5FNcTvfX7VhaueChw9XmueKUJTvZSN/W5ppPD+Ca3n/Npu4EJg82rtQCeHb/BfbZnzDo
 MyDX4GPuNAWCjdLdjqkcViEFOTXni8il5DXdvTM2fSHYB+pQY7TO1A6UZxIO3At3cZRLXUd+kFs
 AgB+dQ6VtnSSzNPtQfFHE54F5fi7uPnXIxtzQXlUmrrweoslqSSV4iATArvr7INTZpWOv5oK0eA
 0xby0f0TD/73hDOPMXK0xRZOSijRrmq4C7UDkhjGSQjj/peiv/KhRHTp+YFXwvHS30TjHXYuK6z
 SGJdQeFrtQCAHd0XFrAKRetMdksHrrpI
X-Received: by 2002:a05:600c:524a:b0:4a1:cd83:b23e with SMTP id
 5b1f17b1804b1-4bb7d57f5ccmr25873275e9.0.1794975806521; 
 Tue, 17 Nov 2026 20:23:26 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4a656c1145esm2229953f8f.52.2026.11.17.20.23.26
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2026 20:23:26 -0800 (PST)
Message-ID: <6afd283e.b6bed76c.101536.b0ad@mx.google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 18 Nov 2026 04:23:26 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-11-17
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

Autobuild statistics for 2026-11-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  5  | 13  |  0  | 18  |
  2026.08.x  |  3  |  5  |  0  |  8  |
    master   | 36  | 41  |  0  | 77  |
     next    |  2  |  2  |  0  |  4  |

Classification of failures by reason for master
-----------------------------------------------

    host-mender-artifact-4.4.2 | 3 
                       unknown | 3 
              containerd-2.3.7 | 2 
          host-xfsprogs-6.19.0 | 2 
               libglib2-2.90.1 | 2 
             open62541-v1.5.10 | 2 
               tcf-agent-1.8.0 | 2 
                    attr-2.6.0 | 1 
             dahdi-linux-3.3.0 | 1 
        edk2-edk2-stable202608 | 1 
             fswebcam-20200725 | 1 
              gcc-final-15.3.0 | 1 
                 glibmm-2.76.0 | 1 
             glibmm2_66-2.66.8 | 1 
                 haproxy-3.4.4 | 1 
            host-mfgtools-0.02 | 1 
                libmad-0.15.1b | 1 
                linux-5.15.225 | 1 
                 linux-6.1.192 | 1 
                   linux-7.3.4 | 1 
               linux-pam-1.7.2 | 1 
                   lmdb-0.9.35 | 1 
                  ltrace-0.8.1 | 1 
                   openrc-0.56 | 1 
                    opus-1.6.1 | 1 
                   perl-5.42.3 | 1 
raw2rgbpnm-f28b903ca63b4c22... | 1 
                   s6-2.13.1.0 | 1 
                tpm2-tss-4.1.3 | 1 
               trousers-0.3.15 | 1 
                  uftrace-0.14 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/f2eb5300490c9d559b5002f84ac2459e11380049 |     
    i686     |        containerd-2.3.7        | NOK | https://autobuild.buildroot.org/results/6e670b90efa913ca67833c721784176c3aa8e89f |     
    i686     |        containerd-2.3.7        | NOK | https://autobuild.buildroot.org/results/2464a884ec16109a72079d9728c2eeb614998754 |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/4ced147f6f4ad14faa91607e364bf3d371b8cb69 | ORPH
   x86_64    |     edk2-edk2-stable202608     | NOK | https://autobuild.buildroot.org/results/304e94aafb51d70782ce633954f5ed5d8a79132c |     
  mips64el   |       fswebcam-20200725        | NOK | https://autobuild.buildroot.org/results/6d6812829c4714c0b71449f365d864fbf58932f0 |     
    arm      |        gcc-final-15.3.0        | NOK | https://autobuild.buildroot.org/results/37e8834aaa9e2d4b1d0afd25e3cad858ee47d289 |     
  riscv64    |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/50dc0b5f3389075b9d02e153f49eb961df1ec804 |     
  mips64el   |       glibmm2_66-2.66.8        | NOK | https://autobuild.buildroot.org/results/787e066f8a133d6b70e2cdd0662e24dc7585cdc1 |     
  mips64el   |         haproxy-3.4.4          | NOK | https://autobuild.buildroot.org/results/17c5c0b679c0c5e4e6f13d88d61826a47d4cd269 |     
   x86_64    |   host-mender-artifact-4.4.2   | NOK | https://autobuild.buildroot.org/results/457cd4a9e626c5c28972397b6a2decf588e5111d |     
  mips64el   |   host-mender-artifact-4.4.2   | NOK | https://autobuild.buildroot.org/results/9ba5d550cca5f3e49e1ab029c7d3d1ee56d20dba |     
  mips64el   |   host-mender-artifact-4.4.2   | NOK | https://autobuild.buildroot.org/results/51f476da9e9146e7be8dac068880d1d1a60dc354 |     
    arm      |       host-mfgtools-0.02       | NOK | https://autobuild.buildroot.org/results/78388a890641753487b7899d36175176d65ad1d7 |     
   x86_64    |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/e8989c6b9959a297664433a5ce1bacf0a407e74b | ORPH
   x86_64    |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/62c6b6b5ea96ea4a42b153986a162d71c10ad9a0 | ORPH
   x86_64    |        libglib2-2.90.1         | NOK | https://autobuild.buildroot.org/results/5cd192e91f909899798686f69312e50dae6c6d85 |     
   x86_64    |        libglib2-2.90.1         | NOK | https://autobuild.buildroot.org/results/59948efb8b56bb070652eca383c8767c9108764c |     
    arm      |         libmad-0.15.1b         | NOK | https://autobuild.buildroot.org/results/29d2da38f2ee6cdef7dabbecd91b9eb762697d8f | ORPH
powerpc64le  |         linux-5.15.225         | NOK | https://autobuild.buildroot.org/results/72d1eaf5319b4f5227f4a6bcba5818564faa4d35 | ORPH
powerpc64le  |         linux-6.1.192          | NOK | https://autobuild.buildroot.org/results/dab10ea06a9645ec43fc19601e0706dd24c52bb9 | ORPH
powerpc64le  |          linux-7.3.4           | NOK | https://autobuild.buildroot.org/results/47861fba9a614b0a362aa7ce22b60ef7ddc85dd0 | ORPH
powerpc64le  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/38fdcf7b1f5f901b6b16736664389359cd884a4f | ORPH
   x86_64    |          lmdb-0.9.35           | NOK | https://autobuild.buildroot.org/results/f415612f01da25fddc437b30e9163b1aa69bc6df | ORPH
    i686     |          ltrace-0.8.1          | NOK | https://autobuild.buildroot.org/results/ed80a103298df4c168f634bbda6b324102e24294 | ORPH
  mips64el   |       open62541-v1.5.10        | NOK | https://autobuild.buildroot.org/results/13d78df461be02a8e8e08114782938ba50fc6c06 | ORPH
    arm      |       open62541-v1.5.10        | NOK | https://autobuild.buildroot.org/results/f7848e5a9992b07c8860c07d0a58d087d34bd326 | ORPH
powerpc64le  |          openrc-0.56           | NOK | https://autobuild.buildroot.org/results/dd25c5ebeed137150ca5f6d162296b0b17581cd9 |     
    arm      |           opus-1.6.1           | NOK | https://autobuild.buildroot.org/results/f6a4f591e27c396b517a9150aac0a3c28be6b9ce |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/8e06cff80e1145e3737f9b4891160f437d3c91db |     
  mips64el   | raw2rgbpnm-f28b903ca63b4c22... | NOK | https://autobuild.buildroot.org/results/2820e2d9a87a1eafc220419a41b0173ae8f95eab |     
  mips64el   |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/9a449c0e96eb5d425ebd78a29de0db46da49d773 |     
    arm      |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/821c5805710ee0c925033b48b1283320266bd6f2 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/fd1b9f89b3e9d7c584f8dc32dae95de1d7bd5db1 |     
powerpc64le  |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/be0367fef9cc7e0dcfbfa1108a27d6254cb02a6b | ORPH
powerpc64le  |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/db67dca73f54be0e002b88a7f70ad6656197a885 |     
   x86_64    |          uftrace-0.14          | NOK | https://autobuild.buildroot.org/results/791c3b45b9c6184c6fc6183c8040486792fa75a3 | ORPH
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/962054ac9a1cdd3741877697f1211f35346b9ad1 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/09332dc462b8dc607b0f78c897555e469cb6994c |     
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/b4a7e2299a3a1a025e2515fcc1758dfd77f28b16 |     
powerpc64le  |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/1c4e9be7bd0b27ecedefdfcb29560279c53688c9 |     


Classification of failures by reason for next
---------------------------------------------

                       unknown | 2 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/be7a9d84fd06dbdd7e08a3fd4a3bdb918e4a5437 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/1a45e4213684dfa748c092f4cb319b1195f110fa |     


Classification of failures by reason for 2026.08.x
--------------------------------------------------

              host-rust-1.97.1 | 2 
fs/cpio/cpio.mk:131: /home/... | 1 
                    ne10-1.2.1 | 1 
 qcom-db410c-firmware-1034.2.1 | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    hppa     | fs/cpio/cpio.mk:131: /home/... | NOK | https://autobuild.buildroot.org/results/3faa15fee2e9ba343aefd2fbe0b3048deb752d3a |     
   x86_64    |        host-rust-1.97.1        | NOK | https://autobuild.buildroot.org/results/15536396522b4645a8a131bd5b78d87af9d6bbe4 |     
   x86_64    |        host-rust-1.97.1        | NOK | https://autobuild.buildroot.org/results/f2e52acc9c020f3736d1b0857b08e4699625d0c1 |     
  aarch64    |           ne10-1.2.1           | NOK | https://autobuild.buildroot.org/results/da86bea9f3583c3dfc1509193b98e99bb9f79b15 |     
  mips64el   | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/e9973d204e3835610f080376e04f8900c85817c7 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

              minizip-zlib-1.4 | 3 
    host-mender-artifact-4.0.0 | 2 
                       unknown | 2 
              fftw-quad-3.3.10 | 1 
host-netsurf-buildsystem-75... | 1 
                  libbpf-1.5.0 | 1 
                  libva-2.22.0 | 1 
               procps-ng-4.0.5 | 1 
  wireguard-tools-1.0.20210914 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/a80bb3983c9290d17205300ad4b34b966ef607d0 | ORPH
  mips64el   |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/e2be1b7032464c056fcb23612e4014fd3160e1b1 |     
  aarch64    |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/84b97a30fc26a52e3c82a39d92002fbe1f7a9554 |     
  mips64el   | host-netsurf-buildsystem-75... | NOK | https://autobuild.buildroot.org/results/fc75a17c321665e6e552b0faa9b35a3a00798b4c | ORPH
    or1k     |          libbpf-1.5.0          | NOK | https://autobuild.buildroot.org/results/91259198e5514dce649676f7b4ecc9c5f54ef62e |     
  aarch64    |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/4a037f71511b1fd1735ba179a1637a5a4dedb509 |     
   arceb     |        minizip-zlib-1.4        | NOK | https://autobuild.buildroot.org/results/aea097c94ec4a38a596b7d2d59b0097f256a011f |     
    arm      |        minizip-zlib-1.4        | NOK | https://autobuild.buildroot.org/results/bf25600c83cd4910396d69cf54460b55fd387146 |     
    i686     |        minizip-zlib-1.4        | NOK | https://autobuild.buildroot.org/results/94672578b27a11b18705ee8c4f1ba321e0473d2f |     
  aarch64    |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/4f1c8583edf351a8d92ce57366a89b58726677fd | ORPH
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/bbfa257699fbf42da6d9fe060d0b0ed9145b80d4 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/cdcd15bfe59dc3d58a5d551786c9ad3fcfb34f24 |     
  mips64el   |  wireguard-tools-1.0.20210914  | NOK | https://autobuild.buildroot.org/results/7daf04f012db7ba258b61366fd3a93b038cfdee0 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
