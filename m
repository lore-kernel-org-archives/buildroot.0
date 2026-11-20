Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43410606A326
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 04:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Dv6AtqEa;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zizM1UO9
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1248B60706;
	Fri, 20 Nov 2026 04:28:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MCk4nJC6sQyc; Fri, 20 Nov 2026 04:28:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1675E6072A
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795148930;
	b=LRZQye2C1LrDvltQyGdGPh7eKuL5F2uAp2ZRiVAJbtbbPJOnp9gKI7FmXrBWSLTzr3kn
	 wUnby52BTHtJ7jCcPlJO4ngwdHzY6epc3kKnqre4nvqq4g3/PM+0ogdgZLbSOl88ks+Vq
	 7nZohhPNXVmkTWyW82AmV7XUXeTUWPafHJ/36kMGYMY0H/zrPaBaXHzVPSW7oP+puPleo
	 cvLlPtk3X8i3epgkIzCUzuCkmrlKM4zCpoIexjCrao0q2OTQWf3ddzS9xOxlzE3xzfdnz
	 IDA3ITbUKwnGLm+lgdAEkpYVNEMLYnrD4Yra4Q7Ux8ZqoLPm5LODlYcuyaS8OGeOXeg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795148930;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=nH2eHm5EdfQIvkx8wF3Lc1Zi4kgvCmkfgFOd5ACqD+I=;
	b=K2e+BKi9bL6+Sk9BdMQo+lrPWtjZvkjtbZ4eDBqCPRUQbIhZGqoPyUmzyXw3UTQOWdRQ
	 9Gg9t8glQcPCz3ujDqZvDU1zCXu+VRVLV9ttway7SvBu7u7Ly7Z02bPpygDTCjGPBLB1I
	 KoFeyoZHQP9MASL9u9HpsAf7zFq9S89iFBs5rRZGvcsKDq/vB3KPwDUzU4xxrpRXptp4q
	 z6YFMLLVYVkE4srqF18/Ik3H7XToLo2hjKQS3aaZqDULLzCjlhM7gw9MyU8zaiJKY+ZX/
	 MbWHxDaBDAkkrQMZNrsP/s7Ek+RvLzbTSONdf+atywRNp0Ryj8OZcxB2qDJoI8TNf7A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795148930;
	bh=nH2eHm5EdfQIvkx8wF3Lc1Zi4kgvCmkfgFOd5ACqD+I=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Dv6AtqEa44NqDbsk4wXpcnTqquiwVZxX8JSLkf+3OB15UdcgMD6BPICSrLifU/6C5
	 PZpsEHfrxzPGsdn845rR3ksXZC82fr294o8scBmvIzzGcuLhNnjjmKRCJBIzSJpjUy
	 nxt6RotFAyeQHZSKa4r2EZtyNF3k8uzdjlSPbxwmuUPLPDgfWPb0uEvjHiw/9Ra/zQ
	 sOQa3o6+1W+kQvhcJRhTTZ6u9ZbIRGTjN0L23A8eopqQU94LU2P34Z853pYo53eMX6
	 HqQ1KDBFsj/NLYqpEdDiLPmkUwxKwNozYadkyl7v1WqJAj/uHmOmbb2liFHgnZjCBg
	 Umk2wUfAL7hxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1675E6072A;
	Fri, 20 Nov 2026 04:28:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BE9D81E7
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 04:28:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A441740DBE
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 04:28:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7miiu29V10c2 for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 04:28:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 746B540DB6
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=zizM1UO9
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 746B540DB6
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 04:28:45 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4bb85e07aadso4638295e9.1
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 20:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795148924; x=1795753724; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=yGvxNlXCrEjpvf6D94IoYWF1ML895ttanAsLEjdKZjk=;
 b=zizM1UO9SoXFDDlQvmkmMpK8eNF583Z8AA8MdzVGpCbXeedM5lnInIqxofYy+xOwMq
 48P9abeUAS3bDnQ62/2FPsGJgRyApq9fJDqnf1rs4CYpCjqG2eeCNz8q8meHu03tuhVo
 H+AkWISmpPFUad9DaUoMDrLwv5X9DI41AFP4G7z60ajJ2OQ0mnCaPLjxw98pmTTzf1vR
 UlxeqwhcJLsx+htFCF0IiTXtMm1+YFDSZCKFx7HQ7+VcpsODesgrNQWId5fluHcqGu0q
 UV0gk5AAsR4FdRHpN9yj5e5ya0wd4QeVvBvuO004Cnaro3mEBX/NFdlm+S1PJl0ljsWb
 ITew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795148924; x=1795753724;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=yGvxNlXCrEjpvf6D94IoYWF1ML895ttanAsLEjdKZjk=;
 b=eTLUGNk0yqfBpQbCsUz/Yk6HUX+CSmut98FVfemsQmDGZW7xtaBbN+SgHa1xQ5gduN
 BJRz7xwNhPbP3ZYcW4Ll1WV8yBPqPEjc8pouAVUlm1XezCoxs4uAqzfyWGFtYjwoinYs
 ry/WQTjFqABR4c7ek0JrMmtyE2bJKdAZNiYmxgGhxE7IxusW+K7kuROkd8wmWDt3oyL4
 QtcDlWvOEnLilXiPX84m6ZIOWzijWqcbB45fdolR8fg5qm+HUZHT3mDRqLvXcj5NeNGp
 TS+VB6XHa3qCryhJXSDbV8YBp4aSo9Evu6IeToq6m8scGch3e+0z5mAvZXJt5YVYA9UN
 A35w==
X-Gm-Message-State: APuU4Z8eojRYT3yibvBvGl/UTISLgalRlOeQlX4wINdq5HswxFUVYX50
 bPzznooTBZdd79RoVW37T8DEe/7vjQOLIQFCR2k9KxMlEVDs+5n9WCQFwkmW7sbZ
X-Gm-Gg: AYBFou1Q8s7elGxH9tF42Dv8+RkaDFP3SMzcopLpLJ+RuBfUqEBE6WcHw1vbrVB3Wme
 j5njDkEPeMCRm0yUjbCEy+RsAuCrfGwIbwNakA0+20q4QdXeW9A05ATjrLsR4zOICeCfhLxT4Vx
 DuazmkWsRck7eXIbM0OhqAvGyFYg7bPjJ/lLRHG0nXQvZKF3/6cWI42xV1bP6s0kyB+c+VxyfQw
 wCVk/q5MxQtNBFUWoBqOmobar0+KdPAC+5+WYRHvLkZaF/GmvK2WfyCl9L0g+5vq98f+s47g9S3
 fE2ttzpc0iFeesDIcUN1Ub/+hNVH2pO8SZ/X6bGssjlUWpr7tubWfg7P2tLAoxCbK+ppL/vMMVe
 MIh7TwkxPZkvprlpFkwN/bSFdNx6b8UrOYO5fQSzVLUxF3KRh/UMvUuj9jxVOKsArfHgAbRvo0s
 dIbtPaRBbDdNnuPBe3VtimaceiwsXFZwAFKGzZCEdFjY0dMj8/jYYOpdidZ4I4qJupN6tWalfmb
 1DixzX22QHnMpu8rqjoDjO83hAqs/P8GRQdjIlCE5yCwHldzy11XoSbIPc8ykxv4hjhis9p2voI
 wxScuHXGa0Fs4gl1d5QJuBa0+F9qAFRg
X-Received: by 2002:a05:600c:638f:b0:4aa:2339:a375 with SMTP id
 5b1f17b1804b1-4bb8880607cmr31471555e9.13.1795148923558; 
 Thu, 19 Nov 2026 20:28:43 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb895eec06sm12200155e9.2.2026.11.19.20.28.42
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2026 20:28:43 -0800 (PST)
Message-ID: <6affcc7b.f3d30393.2b0010.a8b5@mx.google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 20 Nov 2026 04:28:42 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-11-19
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

Autobuild statistics for 2026-11-19
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  |  5  |  0  |  9  |
  2026.08.x  |  2  |  4  |  0  |  6  |
    master   | 53  | 126 |  0  | 179 |
     next    |  3  |  5  |  0  |  8  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 13
                 glibmm-2.76.0 | 8 
                    attr-2.6.0 | 3 
             glibmm2_66-2.66.8 | 3 
    host-mender-artifact-4.4.2 | 3 
                host-odb-2.4.0 | 3 
              host-rust-1.99.1 | 3 
                    lua-ev-1.5 | 3 
               madplay-0.15.2b | 3 
                  ndisc6-1.0.7 | 3 
                   perl-5.42.3 | 3 
                 rtptools-1.22 | 3 
       sp-oops-extract-0.0.7-1 | 3 
        edk2-edk2-stable202608 | 2 
              fftw-quad-3.3.10 | 2 
      host-uboot-tools-2026.07 | 2 
 ibm-sw-tpm2-rev183-2026-08-26 | 2 
            igd2-for-linux-2.2 | 2 
libfutils-c326ce0cc2a735438... | 2 
               linux-pam-1.7.2 | 2 
raw2rgbpnm-f28b903ca63b4c22... | 2 
rtmpdump-6f6bb1353fc84f4cc3... | 2 
             batman-adv-2025.4 | 1 
                  bcusdk-0.0.5 | 1 
                   bird-2.15.1 | 1 
                        chawan | 1 
                  chawan-0.5.1 | 1 
             dahdi-linux-3.3.0 | 1 
                  dpdk-25.11.4 | 1 
            dt-utils-2023.11.0 | 1 
                   eigen-5.0.1 | 1 
                  ffmpeg-9.0.2 | 1 
                      fio-3.42 | 1 
firmware-utils-c42a3bc53da8... | 1 
fs/ext2/ext2.mk:65: /home/a... | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
fs/yaffs2/yaffs2.mk:32: /ho... | 1 
             fswebcam-20200725 | 1 
               harfbuzz-15.0.0 | 1 
                 host-gdb-15.2 | 1 
            host-mfgtools-0.02 | 1 
          host-mosquitto-2.1.2 | 1 
host-mxsldr-2793a657ab7a224... | 1 
          host-xfsprogs-6.19.0 | 1 
                   iotools-1.8 | 1 
kvmtool-7ad32e5514aca2b6d19... | 1 
                 lcdproc-0.5.9 | 1 
                  libbpf-1.6.2 | 1 
               libcgroup-2.0.3 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
             librdkafka-2.16.0 | 1 
               libunwind-1.8.3 | 1 
                 libv4l-1.32.0 | 1 
           libwebsockets-5.1.0 | 1 
             libxmlsec1-1.3.13 | 1 
                linux-5.15.225 | 1 
       linux-firmware-20261019 | 1 
        ltp-testsuite-20260529 | 1 
             matchbox-lib-1.14 | 1 
                     mtd-2.3.1 | 1 
           oath-toolkit-2.6.14 | 1 
             open62541-v1.5.10 | 1 
python-remi-2022.7.27-37-g1... | 1 
               ratpoison-1.4.9 | 1 
                    sbctl-0.18 | 1 
              shellinabox-2.20 | 1 
                   speex-1.2.1 | 1 
             superiotool-24.05 | 1 
                  swipl-10.0.2 | 1 
               tcf-agent-1.8.0 | 1 
                tpm2-tss-4.1.3 | 1 
uclibc-ng-test-132c6134d691... | 1 
             util-linux-2.41.5 | 1 
        ux500-firmware-1.1.3-6 | 1 
        wireless_tools-30.pre9 | 1 
                  xxhash-0.8.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/4a82162700b8251d34a1067b37984d88a6e5b75e |     
  aarch64    |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/3372bea8cdd35382ccbbd59848651a6cc8122bc2 |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/78c82acbe4a6e0b33f78831877a6e6174c0e632f |     
  mips64el   |       batman-adv-2025.4        | NOK | https://autobuild.buildroot.org/results/62a4dc00c37efe0188af125edbf71cf7328b136a |     
   x86_64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/1dbd084594783221b964f025b2706a21792f4e05 |     
  mips64el   |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/a10e0a5bcb38990c2d2d31d4ef018212fa0a4d0d |     
    arm      |             chawan             | NOK | https://autobuild.buildroot.org/results/ae2e47700290269ef7c007aaf28bb51cc8d1571c |     
powerpc64le  |          chawan-0.5.1          | NOK | https://autobuild.buildroot.org/results/d75778b8bf98d157f88fd6119c923e90d5d7cd9b |     
  mips64el   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/cc509f9d1fb745b1ab33fec0224a56467480a0d7 | ORPH
  aarch64    |          dpdk-25.11.4          | NOK | https://autobuild.buildroot.org/results/826eae87ef94e22c55d460f1490859a644e6b925 |     
    arm      |       dt-utils-2023.11.0       | NOK | https://autobuild.buildroot.org/results/0b512fee272a196344d7801d3da4cd7686e53f7f |     
    i686     |     edk2-edk2-stable202608     | NOK | https://autobuild.buildroot.org/results/b92ef446cdab572ee58212b6593bd6f371994757 |     
   x86_64    |     edk2-edk2-stable202608     | NOK | https://autobuild.buildroot.org/results/4d11543d7165f9665764281f41989b6353c3a7ef |     
  aarch64    |          eigen-5.0.1           | NOK | https://autobuild.buildroot.org/results/087b7219d841c4d7d7007659ffe434b05cdd12e6 | ORPH
powerpc64le  |          ffmpeg-9.0.2          | NOK | https://autobuild.buildroot.org/results/53aafb7af74daf7fe5f4f37a4bd049a48ed7d429 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/af34a9b1f04b6e8c23b9f23961b2e720c7288f08 | ORPH
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/10726c34989a55793823e0792a70b17a2e6daad8 | ORPH
   x86_64    |            fio-3.42            | NOK | https://autobuild.buildroot.org/results/88e9ebf268e48f2f47b3164565b201ccb984a3ce |     
  riscv64    | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/2e71c986fa7909b24d9792fffbdd891421d97f6c |     
   x86_64    | fs/ext2/ext2.mk:65: /home/a... | NOK | https://autobuild.buildroot.org/results/96274c92fa1663848321cbb30039d9d833b8f29f |     
   x86_64    | fs/jffs2/jffs2.mk:71: /home... | NOK | https://autobuild.buildroot.org/results/33f8675ede6eb902a9212704fb7af71ac9b4fb80 |     
   x86_64    | fs/yaffs2/yaffs2.mk:32: /ho... | NOK | https://autobuild.buildroot.org/results/b6aa744c257b3d6b6990dd3c5e698a816d90f78d |     
    arm      |       fswebcam-20200725        | NOK | https://autobuild.buildroot.org/results/7daa7301977f58ebe004ef0e87fd3cd71f825657 |     
powerpc64le  |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/4e34676e44d00086a0b5662ef66b16c825fb5e02 |     
    arm      |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/28fdb83426c6e971690f3fbaf2d9765a6e1323cd |     
    i686     |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/a578378893f1030c1b750d60c1b744ef5dad7323 |     
    arm      |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/d5dbbb98bc761b25f1100bbb43df180dbf517de4 |     
    i686     |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/43a91e57c7d73f9fb051b9eafe6a9b82f5e57d29 |     
    arm      |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/cb10eb0152f9d63286403ba0f7f7233af29d7ebd |     
  aarch64    |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/d97cb8713c2c955294439118f86247530efe262e |     
  mips64el   |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/de2986180eb8a6db786a7268315487311851967e |     
    i686     |       glibmm2_66-2.66.8        | NOK | https://autobuild.buildroot.org/results/7a2ef55e9ad00ec22ff29b67d6a36d0a4cb193f4 |     
   x86_64    |       glibmm2_66-2.66.8        | NOK | https://autobuild.buildroot.org/results/4e7f7d244e401835d774f6a1aee2edff08cc1338 |     
    i686     |       glibmm2_66-2.66.8        | NOK | https://autobuild.buildroot.org/results/4121826beafc5219a30b6e620f104e5d55fdcc70 |     
    arm      |        harfbuzz-15.0.0         | NOK | https://autobuild.buildroot.org/results/75bf61a321191c1ecaba8f848a92304b2933f32d |     
  mips64el   |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/af9aba85f6ed6a068c0699b277c4f7f6ea18b082 | ORPH
  mips64el   |   host-mender-artifact-4.4.2   | NOK | https://autobuild.buildroot.org/results/04ec71e1e98337b8b7db3decd7d98dc63a02b0f2 |     
  mips64el   |   host-mender-artifact-4.4.2   | NOK | https://autobuild.buildroot.org/results/8d8666d83ebf3631d380925928b2938dc7b6c98f |     
  mips64el   |   host-mender-artifact-4.4.2   | NOK | https://autobuild.buildroot.org/results/ee9810cc89d2854d1bbbc4a0d91506ddbbaaeda7 |     
    arm      |       host-mfgtools-0.02       | NOK | https://autobuild.buildroot.org/results/66ff833adb486dd249e668429bb75947c5a4eed2 |     
    i686     |      host-mosquitto-2.1.2      | NOK | https://autobuild.buildroot.org/results/8deab396b73e169ffb8a31b7a81802f606e59862 |     
    arm      | host-mxsldr-2793a657ab7a224... | NOK | https://autobuild.buildroot.org/results/177faaecc9170ff427e01a4c8fa757ec4d156010 |     
  mips64el   |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/df62c49bcce3ffc7f3470d561aec3f6b8e97fe9f | ORPH
  mips64el   |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/9f03eb65dbfa1d0ee35a67941c727f0059b7425b | ORPH
  mips64el   |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/4656393d9aae3c7d8ef8378add49c50ef24dcf85 | ORPH
   x86_64    |        host-rust-1.99.1        | NOK | https://autobuild.buildroot.org/results/894df5a41b56527cacd762cec3f83d8720616b7e |     
   x86_64    |        host-rust-1.99.1        | NOK | https://autobuild.buildroot.org/results/3f14e998b6896de944c70135b09fd89912844835 |     
   x86_64    |        host-rust-1.99.1        | NOK | https://autobuild.buildroot.org/results/882723507b5cdab59bdf4d6ef5a9627c413f3f68 |     
    sh4      |    host-uboot-tools-2026.07    | NOK | https://autobuild.buildroot.org/results/4c5f398db4695aa84aec0aaea7f1681e8074c863 | ORPH
  mips64el   |    host-uboot-tools-2026.07    | NOK | https://autobuild.buildroot.org/results/f86b68461aa6fe7a64fad6dee9952ad1a101a68f | ORPH
   x86_64    |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/8b406fefc734b9f15a67659a1d59cca42c1b8d90 | ORPH
powerpc64le  | ibm-sw-tpm2-rev183-2026-08-26  | NOK | https://autobuild.buildroot.org/results/59091b6b9d82adc62982daa46835950568e155a9 |     
powerpc64le  | ibm-sw-tpm2-rev183-2026-08-26  | NOK | https://autobuild.buildroot.org/results/69a210ac744de969c88402117681ca044a65b0f8 |     
    arm      |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/de10dc4017f419465a2606200c566581a33389fa |     
    arm      |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/39d9939c09edf3d70906c860d3823d3a5f153eac |     
powerpc64le  |          iotools-1.8           | NOK | https://autobuild.buildroot.org/results/028d25d2be21488189bde83ec47e07861bf9a87a |     
    arm      | kvmtool-7ad32e5514aca2b6d19... | NOK | https://autobuild.buildroot.org/results/05f0cb0cdf245874fbd413e7bfb835c8bb95af0c | ORPH
  aarch64    |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/47c7ecb3a322374295d1aa9a2cf3cd8f3c4f3105 | ORPH
  aarch64    |          libbpf-1.6.2          | NOK | https://autobuild.buildroot.org/results/88b5359e57e40db27e45854992709a54f474d834 |     
powerpc64le  |        libcgroup-2.0.3         | NOK | https://autobuild.buildroot.org/results/098a663c775237971936a77b64e114c5f8df1326 | ORPH
powerpc64le  | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/97c9ec86f18b33a58a0cb8d597fe37da118637e2 | ORPH
powerpc64le  | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/f0c2cbf6b12fe912f39b47448d8758bb81ae3419 |     
  mips64el   | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/38279efa92a39885eef22cf7b09a85a519e18e37 |     
  mips64el   |       librdkafka-2.16.0        | NOK | https://autobuild.buildroot.org/results/5225d73ae35fc3dfd94f3793e4827493e4d8167c |     
  mips64el   |        libunwind-1.8.3         | NOK | https://autobuild.buildroot.org/results/fa6a0cc68946cf75f56417d8bfe831366985fe55 | ORPH
    arm      |         libv4l-1.32.0          | NOK | https://autobuild.buildroot.org/results/e7c487dba7e0fbe2628cecf337425ef5c190943b |     
  mips64el   |      libwebsockets-5.1.0       | NOK | https://autobuild.buildroot.org/results/ea1570be487a776d9621f135879de9f8c9506613 |     
   x86_64    |       libxmlsec1-1.3.13        | NOK | https://autobuild.buildroot.org/results/f149119e344e6555a658679a8b9ef5fb9d19c187 |     
   x86_64    |         linux-5.15.225         | NOK | https://autobuild.buildroot.org/results/ad96c5750049f7946fb501468bb0bde9df28339c | ORPH
  aarch64    |    linux-firmware-20261019     | NOK | https://autobuild.buildroot.org/results/9b2c7548f73d0a0c6491b7dc7325c406d5c1ab2a |     
   x86_64    |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/b508bc8b900d45afeae4b4327830aec0bd7e262d | ORPH
powerpc64le  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/7a052e6ae65202ca4fec9b425e35c7493288dfe3 | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/83ed095195876e74b118f0b6a771b4fb577b0c09 |     
  mips64el   |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/e1dda656b57a8ea49e38ca0fba013538707aaee5 |     
powerpc64le  |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/b040c11854278af856a0f7fa67edf3449e7b3df1 |     
  mips64el   |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/ea2baf571a42c47945bd5f7c76e9a36120b7203f |     
  mips64el   |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/db9e518b2453d8a6f2693bf0cc89b654b26481d0 | ORPH
   x86_64    |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/b8c6993c58d9ec7ce15c4af3078386ddf1d02b1f | ORPH
  aarch64    |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/a48cbfdc9f7cd428d243cb0d9e4c119978d9f5b3 | ORPH
  aarch64    |       matchbox-lib-1.14        | NOK | https://autobuild.buildroot.org/results/68d77c822ab6dc6a9e5bcc496658202435eea393 | ORPH
  powerpc    |           mtd-2.3.1            | NOK | https://autobuild.buildroot.org/results/8950e2dce91df8de100b569138addfce2490b31f |     
powerpc64le  |          ndisc6-1.0.7          | NOK | https://autobuild.buildroot.org/results/419b3be1ca8054fd643a4fa3f8cf49a8a7246119 | ORPH
    i686     |          ndisc6-1.0.7          | NOK | https://autobuild.buildroot.org/results/14419159e79bce23cd9d585d21b97a1d6f3bc602 | ORPH
   x86_64    |          ndisc6-1.0.7          | NOK | https://autobuild.buildroot.org/results/be537613353b13f9f7af306470400830e5e780f1 | ORPH
   x86_64    |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/a769331884c81f5c30485a18c4df697d7e289643 |     
    i686     |       open62541-v1.5.10        | NOK | https://autobuild.buildroot.org/results/ec0da50d90135c69821fcd3321dea273f8c3d4a9 | ORPH
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/c8f888241829e86b223e94fc13452abf277a60ba |     
microblazeel |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/034338028cb6708517d559fa948ef0fc02d49062 |     
    arm      |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/229d8a48d59bb33dc5b601330a3129c8f7a0d113 |     
    arm      | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/48cb7e93bc411ebe0815cafe5ee77b950ad06905 |     
powerpc64le  |        ratpoison-1.4.9         | NOK | https://autobuild.buildroot.org/results/368d6300fb094c90df7f85f0b42a231769d3f4bb |     
    arm      | raw2rgbpnm-f28b903ca63b4c22... | NOK | https://autobuild.buildroot.org/results/080641f41667ef3f7d675463c5263e5d659ca38d |     
    arm      | raw2rgbpnm-f28b903ca63b4c22... | NOK | https://autobuild.buildroot.org/results/f2509ec17842d60fb7403555822eeeda925ae2ff |     
   x86_64    | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/ddf13a432cb6d72d7c433112bf46e3e42e941b65 |     
    hppa     | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/1cddf65ae5da488810af2fd1dd7da1e40a741ac4 |     
    arm      |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/cf120c8e92a19ef3714d79b35a2ec4d751426da2 | ORPH
  mips64el   |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/fa7c48e3394be0b339a746eb5b06d8fdefb0d972 | ORPH
  mips64el   |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/e65ff869529d227e6592de44301ca432b3d74da8 | ORPH
  mips64el   |           sbctl-0.18           | NOK | https://autobuild.buildroot.org/results/db7e865f4075d2deb28d99fabd77909e06bc367b | ORPH
  riscv64    |        shellinabox-2.20        | NOK | https://autobuild.buildroot.org/results/cb157af48f92c2d206c7550040ea0c66d2658a1f |     
  aarch64    |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/1e3d658cdfea9939b44bc568fe3fafe57c4c515d |     
    i686     |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/17aa2e05bd49bbbf6b1acbb788358db4b965b9da |     
   x86_64    |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/d32468e3b6609ab56a2380d17977439c7d668b21 |     
    arm      |          speex-1.2.1           | NOK | https://autobuild.buildroot.org/results/263cda1009f17bbce32a2af6a5c4618cf9f69ee1 | ORPH
   x86_64    |       superiotool-24.05        | NOK | https://autobuild.buildroot.org/results/2d5a77ef25785bd26a75a342dc7b68daf8b843ec |     
    arm      |          swipl-10.0.2          | NOK | https://autobuild.buildroot.org/results/877a7ec0ac3081f6159fd93db4430b5aefdb8498 |     
  aarch64    |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/d756cff71134c9ccd4a8e87350b35c9015b5a198 |     
  mips64el   |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/b4a6485c749ab0ca49df6844709e32fbceb4b27e | ORPH
  aarch64    | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/26f71dafb06b9388c0d5acb6e5c5a464f5d04210 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/f568ae23c20e431c314c6c359b8c62ab9296c11e |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/a40108ad22d94ac29dd0214bfa6f574ff7f57026 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/c2ea0c7b7ca5ccd8a276378306d6c3db16ae330c |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/5bc956c3842f63ec292f2d6fc169625e93a16289 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/584b152d4bed19f168e7bcbcfdf9635a2be80812 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/f47c563657d997540af0632e75e71f474f69197d |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/62223881d8d0054b204134bb57d140f33550a7b5 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/5ce319983722f9d3798626020adaa2bd7afe7ee3 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/12eb8e8e6f91d4b8498b1d22a5a50da751d8df72 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/6ee2174475d052b3dfec59b4b81780da25c70043 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/7fd823859ee03c793c289569084db659f8fd2a2c |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/64811f1f007598628b0311501f6547c98b8455c5 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/28afb3ce9befe35d18b364a357744e5b44602ae4 |     
    i686     |       util-linux-2.41.5        | NOK | https://autobuild.buildroot.org/results/38df082e135c1cfb326d7ef311a87bbdd605a26d |     
    i686     |     ux500-firmware-1.1.3-6     | NOK | https://autobuild.buildroot.org/results/5e58b1dcdb613194e9422039ca30c78b9452ae89 | ORPH
  mips64el   |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/c02efd8aaf85ea43b5f1634aace9f0cbfda5c316 |     
   x86_64    |          xxhash-0.8.4          | NOK | https://autobuild.buildroot.org/results/b2b61ddb7a01458b42e474f6d4ff52b65732bc27 | ORPH


Classification of failures by reason for next
---------------------------------------------

kvmtool-7ad32e5514aca2b6d19... | 1 
                  libbpf-1.6.2 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
               madplay-0.15.2b | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | kvmtool-7ad32e5514aca2b6d19... | NOK | https://autobuild.buildroot.org/results/f989d928991bb1b02b6f582e140d308d4bf0bf5f | ORPH
  aarch64    |          libbpf-1.6.2          | NOK | https://autobuild.buildroot.org/results/8bea2bfd066c6c2b52f10ffc06bde6254717844a |     
    i686     | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/df1fddaa0f4a1d372e212de69e65215be7afdded | ORPH
powerpc64le  |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/085c8713eb386fd6106a8c0424cfa79566afce91 | ORPH
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/2901f66c65762da335dc89ab6f35c6dca8c2290b |     


Classification of failures by reason for 2026.08.x
--------------------------------------------------

             fswebcam-20200725 | 1 
                  grout-0.16.2 | 1 
    host-mender-artifact-4.4.1 | 1 
            libargon2-20190702 | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |       fswebcam-20200725        | NOK | https://autobuild.buildroot.org/results/a7e1b609294b7bd4ef23c18ec7052395062af3ad |     
   x86_64    |          grout-0.16.2          | NOK | https://autobuild.buildroot.org/results/56ace5a5ce7bd6e99358094d8892e7ead3933a19 |     
  mips64el   |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/4356f5f133fcfe79f5715ad81a908bf54c1f3a67 |     
loongarch64  |       libargon2-20190702       | NOK | https://autobuild.buildroot.org/results/06d54f10e22c09b77d0ebb5cdd5669ba2b72efc4 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

               acpica-20241212 | 1 
                flannel-0.26.0 | 1 
host-netsurf-buildsystem-75... | 1 
                memtest86-7.20 | 1 
ulog-0389d243352255f6182326... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |        acpica-20241212         | NOK | https://autobuild.buildroot.org/results/3fefcb6157011209cc89246df5d426bd6922f840 | ORPH
   x86_64    |         flannel-0.26.0         | NOK | https://autobuild.buildroot.org/results/feaa12608c58b97c82932ec69d55d452c42b4f0b |     
powerpc64le  | host-netsurf-buildsystem-75... | NOK | https://autobuild.buildroot.org/results/a2cdedb8846fa1dcb78e4bb1f89731a12af099a8 | ORPH
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/bc32fe4e5924680893a31f0cf83416e90e9b35a2 |     
    i686     | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/acb2f521fccbdd1a4ec9a21c7c13ed425fd1e8f5 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
