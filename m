Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67681606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 04:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=m5zWfOFj;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CXx1FBOb
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DFAF40677;
	Sun,  1 Nov 2026 04:28:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W7fXPYXKzSWP; Sun,  1 Nov 2026 04:28:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9893340623
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793507302;
	b=HvxqlAFXDIRPnkMmvTaqDb0C4TzLRdbUZhVcdwhvQwygE8D83oJ+sKN9k3pGN6l0jN2A
	 0Y5CnXDCqsdP0WkcykAPMPNvQqnRcbFvv2L7uIQSIDvDI/CA4dt+rn8OEd/w16m7ydnZI
	 HbT8FoaWG69ejnxdqlPaiLnReWyZvmjQhvUZ9pLUzeWYDzbaOCLhgA0G8q/LtxTy4fS8u
	 3Sh8yCU3JhDIq7o1mKodQ+DG/3DbGltyll/bna7/d0pcYwe/ddgcsRxmICGpyjBqCUmHQ
	 x0P9xKQ2Q+aGq/zR5ZWQLU/iaf+gyU+eVU2Rf1Wpjr1aVK8MT6UbdK8W2V+AcGrmPcQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793507302;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Ec0PqMuNd3SpdQJZ1wy3TSjgNs6zho7GROgPJoyME+Y=;
	b=mFYc9JZh9RDD8yMZVR1UarIFOqJIeeBp2JUplVPZTWEKSp3kIpmvxkW1rFvnUxuwtrUI
	 zFvIMZAc7ik0360y5HK/7offFGLPEpAuMNG73cJDPxOVgUA2onFhmpiUJ/WQ2ORx+XWJh
	 8EH+CD22NtLRJbdQDFRH3mvxnszznbSq8eYwtnoOLfzMbww6lnQy5YV1Dml/2xnYxugTk
	 DDpuCjOqic1l+n2Wo66HRaMWoSctmZ95H2UKYFMvaXjQVKD3ITOQQv5yHSBe73THv73Nz
	 BOE+VtQEUuy+VY73v8/LKYByxqL3DnDN1yEfRvITSpXMwtEzL5TUDf931fmsd9T1/qg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793507302;
	bh=Ec0PqMuNd3SpdQJZ1wy3TSjgNs6zho7GROgPJoyME+Y=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=m5zWfOFjxNEuHdgef9lDOjTtebab+QbyXaskOv7ekJcQHnyM78HMqqEJnfCo05H5U
	 IF3jIvrrPQNo4hgmBbillY2OJNstHtODz8ceepOvNNXdU7oCmIvMmrSn4014R+d4VA
	 u/mrCCOzH2NHTIvqAuuzmbJUZiLkQldIqGh6+2wUPTCbYpPozKW+SAy1gnMP2+W1qz
	 J0ZEeo5tOvIXy6fXdcz/kqpS7loX0nGNUa7y2TpiDKJ+NB9/t4s2P63ZLfSoZJiYQ4
	 aYqRBqVAIqxSaQVn+ThBojf5A/KN1ZgnqM4Z/xTSLWv2QAaB4J1wsxa1G1Av3yatW9
	 nqAEnDzpi3mfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9893340623;
	Sun,  1 Nov 2026 04:28:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 12C1C380
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 04:28:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0FC4080E1D
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 04:28:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fjl3TaUveqYc for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 04:28:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6618380E01
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793507299;
 b=kkMTJQ0hUYv3g/gaQ7IM4kb7tp0BbnuJDOA2sE+d05dFyZ2k8S3V5x6TAhIzTR+I0otX
 3Qv3LAwjKyGTXAZrTyIgi3tgg+j9Ri5FNrdEEzDO9l3QsBo/eWR4pig6Dp/WdOelwX0xw
 gms7Mg3SAAAzJDzrmVpMwt3Oobr2H1MS4fXTjnYKHUBQO57rKBOx18OKp8NRFvaiS9KNG
 Tz96BsrQPt8NWOmSPMNt1gV5f1P1UE5/7rS654I6/UayqTL3CXiFZVKKNZkaDCindr5dZ
 Qo68AnirKGlL/IL1iVxyARHRyIstHZVhXkiCKE6Na9bg2tek0cuaCLtxBVOlIXZ0YOQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793507299;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:From:
 Date; bh=GGs7fdQGDo6NHPQPXHf50IWLU/yJhPqGr7agsmrLh9s=;
 b=tFerj9+fYceouXlVtnFQaXup6s/+mfe/sq23LcveB/da31HgtrR/8FzNDs1X3Sl9cPpt
 8i2wV1UGeGviV0MFH9Ne2x38JXmCPF1ZdHmb79kmD1Du/9fdJ4pXYnux6TUUzlWuKXhJi
 FlpeIN/5/ZgnhQIo0MlBhYCHO4j0JzaJbKqp3W3Vam8bMBmXoLHDeXgxmXVU1XXhI9GW0
 W2030GUNMbnzTzaSHHxXTMh7yqYTPgDFA8uC4dY9MV9EFuX2bpBFvBhyA7IhYwWOXr76E
 XiZaji1NaqEzLjTXtwDv/iDhmQXQh4xehwvoz7Piu4IozC4+jThGWpze6f0fdhQIcAQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=CXx1FBOb; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=CXx1FBOb
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6618380E01
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 04:28:18 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4a2000d5fb1so12037625e9.1
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 21:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793507297; x=1794112097; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=GGs7fdQGDo6NHPQPXHf50IWLU/yJhPqGr7agsmrLh9s=;
 b=CXx1FBOb4VDMpmsr1miQS8WCx+CHpz6Txgqbng6Kfc+XYqTsLkXa4foD80Xon5igfO
 w6W8Cj1tCqjN31cz8JxJ///ULWHAmA1aRxHqKMGrtXbBLLD5U5ngEyHFMNMe6gXU3lHt
 Mr8Q6m7dbcC4FUPS2OEleraXqP4whJQ3VdI9TKLSBraFCFUyCdI/7yhVMMIcOzT0txcY
 0Em9T1SNMHes67/6k7kt8+lGgG4nSwan3PJndvmJ8NB2OBV5VnM1JR+2oetxo8ZqywSZ
 Ss3+qCdmtkwuZSgmEJzEJrx1FpgghcE/ix830QikiA9TZ1J5HIhkrt/yTFej+ABkrxi6
 6L1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793507297; x=1794112097;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=GGs7fdQGDo6NHPQPXHf50IWLU/yJhPqGr7agsmrLh9s=;
 b=btThtphlJKKl5SnjI2dEZYKANMmgrmS1XyfK0RFGsH4aZleuKmUAkUrSHZQ7oxDI6y
 18CR3BBlbg/MiQsHtjxAa9SNZWgk41Vo9vRTri7vqyXfMGunaHFLNG8RDLC834puk4MD
 kvJ3gM8/vif4upgRDHcqishAprBDWtDRgzVqFbpahrXF7tCcPEryTFAchM0W5pfgnW8m
 zTDyb0pny52pV6aG3E77FPUwFHsfNBnlStaS8aZrO7ktcbfCvjOKEGPpJBHiDRZQqxNl
 YONtLWYGwPzYAutQFtWhHG6qLkbwVaS0AEXtt2uG3q/3g6AOx8urdSrj70hky9WfRscq
 9T9A==
X-Gm-Message-State: APuU4Z9Arhpa0nr0M6WfGULK1wmS/bNPBOX0Cgqs2ykbzQTocAe0IKHD
 6XfUWor96MDQoh/48qG/b8kgyx+cGRIdoPQCdTE/ehGnHrzZNMWfec9TSIxyrWTk
X-Gm-Gg: AYBFou324RgQ1M3UQ0SRZYR88UxLoy9IWX0YDvHH55D5ma0KYdDZsQ8/wKHaRGcV9wZ
 dIUwq3ztT1JcnLwZU2iM534CX0f2BJ4MqUHb4VV1god7VUyM5S5z1R4IMCxqe8P9nPeOQs5ryEq
 rmnETYVc9jLSgejE2ngSSzZi9fUnfGovcAumxW9zEhko3jpDur6LUBG45WgctGwqweK0W7eFSIP
 ZnNz2AraJA7UYGgiWqmBXgwp4j/qLqCCXcpJin+fgqbULPkFAM3KzVJ26oUcBUWle6YW9QzhGMh
 +6ss4gZVjgGpWuo5MPSBkx/SN2tbs6UVgp0JdHYYDnspbfyLQ8y+rUmzcKLDO7gBvrkXe4Q3oLp
 W/MbAxsBCg5k/N8hL8Uy8F0+DhwzTPsvN7aMyTKvAcEHIURj32VVMgsO18oIEw8ST7aLPi01Ftq
 f+dXprBiJ9xCbGuq4mEfC3fWqnLiz4dEHla4sSU8KlTrTkPflvvyPHVJZNvuQUf0pTuxPoPf7dq
 /0sj30wfEIljMp5wWf16RD0MU/Jdpgj/xFKkNXcOoYmwhsnrIJXETH3gVsr+y54SC4PkqTDBPSx
 wkAyhjyjiN4yBYAdcP1jBzo7MlWqV+dpRv42
X-Received: by 2002:a05:6000:46da:b0:48e:5571:e0d5 with SMTP id
 ffacd0b85a97d-48e6e30744dmr9856069f8f.32.1793507296583; 
 Sat, 31 Oct 2026 21:28:16 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71baa1b3sm11615197f8f.56.2026.10.31.21.28.15
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 21:28:16 -0700 (PDT)
Message-ID: <6ae6bfe0.09deb475.1b92d3.fd64@mx.google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 01 Nov 2026 04:28:15 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-10-31
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

Autobuild statistics for 2026-10-31
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  3  | 20  |  0  | 23  |
  2026.05.x  |  1  |  5  |  0  |  6  |
  2026.08.x  |  0  |  5  |  0  |  5  |
    master   | 35  | 49  |  0  | 84  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 4 
        edk2-edk2-stable202608 | 3 
    host-mender-artifact-4.4.2 | 2 
              host-rust-1.99.1 | 2 
               linux-pam-1.7.2 | 2 
                    ne10-1.2.1 | 2 
                    sbctl-0.18 | 2 
                systemd-258.12 | 2 
             batman-adv-2025.4 | 1 
                 binutils-2.47 | 1 
                   bird-2.15.1 | 1 
             dahdi-linux-3.3.0 | 1 
                  delve-1.22.1 | 1 
                 dovecot-2.4.5 | 1 
             fswebcam-20200725 | 1 
hare-dbus-e9a89f8bc5ce783fa... | 1 
               harfbuzz-15.0.0 | 1 
                 highway-1.3.0 | 1 
          host-xfsprogs-6.19.0 | 1 
 ibm-sw-tpm2-rev183-2026-08-26 | 1 
jailhouse-e57d1eff6d55aeed5... | 1 
                libaio-0.3.113 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
     linux-5.10.254-cip72-rt32 | 1 
                 linux-6.6.161 | 1 
                    lua-ev-1.5 | 1 
               madplay-0.15.2b | 1 
         nvidia-driver-390.151 | 1 
                 openmpi-4.1.8 | 1 
                 pixman-0.46.4 | 1 
 qcom-db410c-firmware-1034.2.1 | 1 
              sigsum-go-v1.0.0 | 1 
              skalibs-2.14.3.0 | 1 
               tcf-agent-1.8.0 | 1 
           uboot-tools-2026.07 | 1 
                 wolfssl-5.9.4 | 1 
                 xenomai-3.2.5 | 1 
                  xxhash-0.8.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |       batman-adv-2025.4        | NOK | https://autobuild.buildroot.org/results/7d9f336f58d106b5b551d8dcf1fa51ae72ad6bc4 |     
  aarch64    |         binutils-2.47          | NOK | https://autobuild.buildroot.org/results/90ec09aa2dfdd00dd469e6b3fe05b915567aead1 |     
  mips64el   |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/6c8200ad2dee9f8527aad20dc5b6109543d47fa5 |     
   x86_64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/46f7b3cbf59417bd2ea01fd46a34e3eda9f78501 | ORPH
    i686     |          delve-1.22.1          | NOK | https://autobuild.buildroot.org/results/6584edc26c3652386b1e4f1a79061873b5fd47c1 |     
    i686     |         dovecot-2.4.5          | NOK | https://autobuild.buildroot.org/results/55174cea9d743d277d044a8703be5edaf5afa0de |     
    i686     |     edk2-edk2-stable202608     | NOK | https://autobuild.buildroot.org/results/f580ef6146caeda2cbfeafda026fb3233dbe74ca |     
   x86_64    |     edk2-edk2-stable202608     | NOK | https://autobuild.buildroot.org/results/93b622b577cb3ad01aa7792ae36431c07bfaff07 |     
   x86_64    |     edk2-edk2-stable202608     | NOK | https://autobuild.buildroot.org/results/0ffbb0e47b43432e2d432ee5f332594c4c8fcefe |     
  mips64el   |       fswebcam-20200725        | NOK | https://autobuild.buildroot.org/results/6f60856ce4aec1e2988f9e212cccfdea21dcb8fc |     
   x86_64    | hare-dbus-e9a89f8bc5ce783fa... | NOK | https://autobuild.buildroot.org/results/5c8ff61150301296d790fbbfc85a77fa4e050a69 |     
powerpc64le  |        harfbuzz-15.0.0         | NOK | https://autobuild.buildroot.org/results/0708a56841576c5c87c9a556705a39474af20584 |     
  aarch64    |         highway-1.3.0          | NOK | https://autobuild.buildroot.org/results/338caa49551fe1af663f8a5a404b0b62dbdfcfd6 |     
  mips64el   |   host-mender-artifact-4.4.2   | NOK | https://autobuild.buildroot.org/results/4c4bfa2f35bcb1a6023fc9c879479afe8cdba870 |     
  mips64el   |   host-mender-artifact-4.4.2   | NOK | https://autobuild.buildroot.org/results/ccd151fdb585b1f71ad5351586fb94b0715decef |     
   x86_64    |        host-rust-1.99.1        | NOK | https://autobuild.buildroot.org/results/ceff3b2194c19047eeb81e5beb4011fe4693367d |     
   x86_64    |        host-rust-1.99.1        | NOK | https://autobuild.buildroot.org/results/f6fb5c251b44cd1af7ca5fa1b9933efe35bd8463 |     
 aarch64_be  |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/05a77ef30f8f70604597d26d78d9261e65f0f731 | ORPH
  aarch64    | ibm-sw-tpm2-rev183-2026-08-26  | NOK | https://autobuild.buildroot.org/results/ef7b1faaac0ace19b2cb8e4475e9227d87a706fd |     
   x86_64    | jailhouse-e57d1eff6d55aeed5... | NOK | https://autobuild.buildroot.org/results/d75bdbd334bc5111ad938f594954eb9f9e067f7f |     
   x86_64    |         libaio-0.3.113         | NOK | https://autobuild.buildroot.org/results/f15ded5bfb166af7627d12ff28b764e09bd7c3fb | ORPH
  mips64el   | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/a040c8f3f26460fd2e851580c257991d77f32086 | ORPH
powerpc64le  |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/6dc9363c4480ffa93f5566e234d145b92c13f6bf | ORPH
powerpc64le  |         linux-6.6.161          | NOK | https://autobuild.buildroot.org/results/800854f679cacdb2f5311dae62f7cd4db4efefa2 | ORPH
powerpc64le  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/9b28d6545c8a8bf8b16d45124d555bf1f6dc77d5 | ORPH
powerpc64le  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/bfd6181e7226bd8cdbd708f97e3d7295199be962 | ORPH
  aarch64    |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/25d08cc3fbe8b28fbda4b2e73d2ce4053e1503ae |     
  mips64el   |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/f2615a37b8916f07be82ea363be7b623f9e74b6f | ORPH
  aarch64    |           ne10-1.2.1           | NOK | https://autobuild.buildroot.org/results/f7a82ed8cfeb993b3b2dd2057b555e9291912be9 |     
  aarch64    |           ne10-1.2.1           | NOK | https://autobuild.buildroot.org/results/89f5d0c5243daa94cb3de48f2b4fa3cb8b88eddc |     
    i686     |     nvidia-driver-390.151      | NOK | https://autobuild.buildroot.org/results/05fd8c57a6e992cadbe4e8a0a7c0440ac117ddd5 | ORPH
  mips64el   |         openmpi-4.1.8          | NOK | https://autobuild.buildroot.org/results/344c0ba6344dba83e58d455c25a02cad1c7e8748 |     
    arm      |         pixman-0.46.4          | NOK | https://autobuild.buildroot.org/results/2534e57586bc40b2a4347ac008cd7af97af302f3 | ORPH
powerpc64le  | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/aa401e730c477fd2302d79b071b11cd98c926f9b |     
  mips64el   |           sbctl-0.18           | NOK | https://autobuild.buildroot.org/results/eb33a97359cfa261e669de5450c47918a647655b | ORPH
  mips64el   |           sbctl-0.18           | NOK | https://autobuild.buildroot.org/results/c2b437c26b4e63145f88cf96491803b84215c158 | ORPH
    arm      |        sigsum-go-v1.0.0        | NOK | https://autobuild.buildroot.org/results/929b9f2b6a3fdc2eb3353883e2b410766e35eb7b |     
   x86_64    |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/c4a7362d8dbd240fa6ba8ea5b673048bc2eef514 |     
    i686     |         systemd-258.12         | NOK | https://autobuild.buildroot.org/results/c9bfc2b8e5a72c05d29f4b1669fc78ec0b353d37 |     
powerpc64le  |         systemd-258.12         | NOK | https://autobuild.buildroot.org/results/6745303bdeb4238fbe829bf546dadd951f4aacd2 |     
  aarch64    |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/7b8760118d922c2a35cdaa9a4d836f86ce824081 |     
   x86_64    |      uboot-tools-2026.07       | NOK | https://autobuild.buildroot.org/results/c90d37b675a0a1881561683301903413ce3860e2 | ORPH
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/4f4058b8297b2f6827ba39654637d9e5a56ef916 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/e556f47808b10e93f6920a78d51a0e0d6cfe8610 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/fe4136cd69c4167747e185c18e39f8b702194d4f |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/ff5d1f99383d334307ab855036a8b4f7613d43a8 |     
  mips64el   |         wolfssl-5.9.4          | NOK | https://autobuild.buildroot.org/results/10c901b8c57f6322b127f1b14c78f73dbb7f28b2 |     
  mips64el   |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/ca315f148f0b18e001a63886371237bfb2564152 |     
    i686     |          xxhash-0.8.4          | NOK | https://autobuild.buildroot.org/results/5c6a3735bab867b8cad6c0f27c382fc778ee97ee | ORPH


Classification of failures by reason for 2026.08.x
--------------------------------------------------

     linux-5.10.254-cip72-rt32 | 1 
               linux-pam-1.7.2 | 1 
                 rtptools-1.22 | 1 
                 systemd-258.7 | 1 
               valgrind-3.26.0 | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/52a4874744310ac9a88656a83beec23260f0937a | ORPH
powerpc64le  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/e1a62d4b3af98815cdd83ed27d252283a56b7a9a | ORPH
  mips64el   |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/f49bf8005a2a67f177003d06bd103139a3e42aa3 | ORPH
  mips64el   |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/a0d59f9edcccf468006424c22a3f6fc5adcd89c0 |     
  mips64el   |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/af4669b1f15e25e7e84da68547332d0a55fce59f | ORPH


Classification of failures by reason for 2026.05.x
--------------------------------------------------

            jpeg-turbo-3.1.4.1 | 3 
                  iozone-3.508 | 1 
                 wolfssl-5.9.2 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/eff1c1f5e423589ec7807bc86a5c95229353ebef |     
    i686     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/466b541bc45137834dc457ae14454cf8175c480d |     
powerpc64le  |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/23f9c061652b65b3a087713014c75f13e09cb0b5 |     
    i686     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/2c3a365d65eeecd1f36f9cedb922ea6b49b0978f |     
  mips64el   |         wolfssl-5.9.2          | NOK | https://autobuild.buildroot.org/results/55929b891f0a31275845351afe0bbf6f703bd4df |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                libselinux-3.7 | 3 
           host-libselinux-3.7 | 2 
 qcom-db410c-firmware-1034.2.1 | 2 
                       unknown | 2 
                  brotli-1.1.1 | 1 
cpuinfo-8a1772a0c5c447df2d1... | 1 
                 fwts-25.03.00 | 1 
            host-go-src-1.27.3 | 1 
        host-python-lxml-5.3.0 | 1 
 host-softether-4.30-9700-beta | 1 
                libaio-0.3.113 | 1 
            minizip-zlib-1.3.1 | 1 
                  ntp-4.2.8p18 | 1 
                 openssh-9.9p2 | 1 
                   perl-5.40.5 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          brotli-1.1.1          | NOK | https://autobuild.buildroot.org/results/59f2b98d6a5b21b7c55a19840b37fa03a390587f |     
    arm      | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/c961c61b63d78cbe82bd03f2cc5feca45469317f |     
   x86_64    |         fwts-25.03.00          | NOK | https://autobuild.buildroot.org/results/533e7485c164bd0a811739098bf304828b6cfee4 | ORPH
    arm      |       host-go-src-1.27.3       | NOK | https://autobuild.buildroot.org/results/7fcd901849a5f2e9d6316ff36c2d3f29f5886dba |     
   arceb     |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/a906a7c735145e3af3b4d73c8500a63d1e047d76 |     
   x86_64    |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/21747fe4d9460cff6920e6b21a33553b3d5e7e95 |     
  mips64el   |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/c9189aec425e1cd9ee917f6fb8cae4df08922327 |     
powerpc64le  | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/7355e0a543854bd0c0d88ffb386a643dc8cba28b |     
  mips64el   |         libaio-0.3.113         | NOK | https://autobuild.buildroot.org/results/56ee0b13ec6bd804fec0efe9c19b552652553004 | ORPH
  aarch64    |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/6b893f3b01c51079af618e43893c6f46ec866378 |     
  mips64el   |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/97763e9901c121e7b851adc3090b78cb767b5a36 |     
    arm      |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/ca1f8707e6d2d584d43e447a04d7bfa422d0af5a |     
  mips64el   |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/97e00e923359d3bd139c6e03cab8fe64ffea28ef |     
   x86_64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/3a08ff88f3de06a8e56befa4af6410ba7abf7574 |     
  aarch64    |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/b994397c0af4a8555b91c0fd4e84f3d69a67ec37 | ORPH
  mips64el   |          perl-5.40.5           | NOK | https://autobuild.buildroot.org/results/da791223af59d06f10f05d91305b499c2a311684 |     
    i686     | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/6dd08bccb4accf21520558ed7086a9f43cc3be12 |     
powerpc64le  | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/46f6e6903564f01b5af91e38d9242432ba866070 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/19403f4a1353e2f6834723b152aa1d0a71849ca0 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/30fbb0f32e9ac55d5641d2dc82000e3aa8a234bf |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
