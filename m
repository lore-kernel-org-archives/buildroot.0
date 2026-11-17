Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E25D606A31C
	for <buildroot@archiver.kernel.org>; Tue, 17 Nov 2026 04:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=S8TDCl69;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QaYRU2lB
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52BC081025;
	Tue, 17 Nov 2026 04:32:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RQumuRHhmb80; Tue, 17 Nov 2026 04:32:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6B6948100A
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794889929;
	b=CkrSOORWdAsBiLo3Plxbq1k+i0iS0xKvMRigNZpfplxP1INPPa0JX2wplKH4zaVEZ8o0
	 G4prK9FuyQK8v8uuU7L2TQCZ+S9O3+9qSOy8z3vgjLjbWX+p3BQK45opGOobc/upNN9AJ
	 T/5SIsMjkhCCvPB+XZKyY9L5U7FDBMqoYe6IFg84Bzmc3A6Mk4G+qt8IYhW/IBkOvluV6
	 f4BB5Gb2U71Dn1AP9iOSLuj4IvIFkZi0JTNPOSJ28J4bDdmQcpz6146Km/kqOobCkRPXl
	 T2J2zxOSiJFq2JI9hTp+/M1a7o9pev2jpS0X49zcuo8Y3cKV1TsYc+bnm3gmbjR//Pg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794889929;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=HMoLBX/rZ4eWk+FCpCtJmBGDOojpVCqu4gqj8GV/7mQ=;
	b=otwMrCCE7SWZxTRPLi3zC1M/1L1L9p080yLxTHBlSOLD9tTP+3Lah4zVpTfivX0V+yVI
	 dd3ThBYnRzkjGaHhnog5/YGaZCzBb6zNjDxkKnGRJtm/PyI/S8PM9r3jV4pumPn/m6f8X
	 5jU/n7utFGLrgya6Uf8ZbZWZSbDPqmwSxXxXVqo/MsWDhjMjZOD24BI0Nax3/sMJiUvBC
	 2njC3R0LSrJaMtaoKAQ0dT4hF5SobMt3Uu3ZqWvaEA453Unb0qwR5L3t9Mc2lsAWGD0CM
	 iu12/lDIDBi2ZRwt/fTFqHvCeu/tbnYrKeiXVzBS11uoolZJkXYKQoROTdC3uuyNjdA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794889929;
	bh=HMoLBX/rZ4eWk+FCpCtJmBGDOojpVCqu4gqj8GV/7mQ=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=S8TDCl69eVzrDIEEjRal0LztxbBIzphm1IzBddsrXnactmJiMyKqiOdPuuhlGL+B9
	 D0dTBToG+NOUlfNYkLPs2c0PfmWm2nX3fR26ow/9SGrkzp4L4fUYxQmF+EV5hoXUnQ
	 7R5RMdzoS88WnxWnA/H37CeqQndRUPNfio/sahsFY+/QwZVG1culDQVrabZnViPZxz
	 7NX7pJX7W/P3KmGkdJmD7jYgGPCtkLcrqsnkSvC5rQ0ZhHKgYBTwAKA6V+aFil74GK
	 ufxCGEBie9+TKxoPRKcY7RomUyNp/o+3FMFnw8f/gzb+rPA09Kn39s1rK9sOyitVfZ
	 O12aB23oso72A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B6948100A;
	Tue, 17 Nov 2026 04:32:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EDC1328C
 for <buildroot@buildroot.org>; Tue, 17 Nov 2026 04:32:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D7182405B1
 for <buildroot@buildroot.org>; Tue, 17 Nov 2026 04:32:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j7bZ6i6nWLUZ for <buildroot@buildroot.org>;
 Tue, 17 Nov 2026 04:32:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4E35D40753
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=QaYRU2lB
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4E35D40753
 for <buildroot@buildroot.org>; Tue, 17 Nov 2026 04:32:05 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-490c3ae81d3so2325614f8f.2
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 20:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794889924; x=1795494724; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=a7KbEa9PupdvQ5t2ATXA/yWNMfrUbFcnW2rhvb4s4H8=;
 b=QaYRU2lBvr7e9Z4YZsg3QaRCmjVVrOCwfAq/T+YB/SyXCx1YsV4Iv2mIneEuREXknE
 aeNHIwZmKkfK4j6qu9FJXzHqBGDSKhuFP5OKfT2lub1pNlKXPuZrnFxNMRtoI5BjojIS
 QFgGFON3yw1sHVn7BPcIpzdsYsZfBc4mdk6CvM4VsPgNsLEfx976+fVqJWMHsUywRLzO
 0iZeMiPLxw1V2a6JVpf+MX4mXS40bwgZ9wNB2+u6ZnPxTdObnTXLgyHo77x3zkdvTZLd
 3W7jqRL0dGX7JQSJ6rYcBEFLBFibsV/1jY+LmhoXDAeUWjQ6GH3NBwdKn0XP26NJntR/
 NOSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794889924; x=1795494724;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=a7KbEa9PupdvQ5t2ATXA/yWNMfrUbFcnW2rhvb4s4H8=;
 b=nBL+7YyrBrkS8B/GLvlBoxoT2SxwFfqX3JHFysi15Qi+VGqEHlaBRpb0Z5Yjolg+h4
 vH4ByZ9JRLpEyHu+tQ9yvjKYcNUoxyqBycfcGrLGy92Zp3cdTx0aKDfRtLBVeSMuS8yd
 vxKXrlLBIqYFekC57TpW/gvlNlWkv7PrXnhiRPKvt8rvdAXWuD/6PR4l16rgX1/PQc/u
 AO7+UXMxUTkLCbZUBBTxPkDSWx0at5amL15AQ4Jm1v+Oxed1siYbILPvOcCeNwZJGf7G
 NISgIbCeutwVRRNH8czIu54QSaUuLe7CfxdJP+vN3Sn83dgj1kmlYbQf71xzXuF7sTZA
 nxcQ==
X-Gm-Message-State: APuU4Z9QlDtzrKrMrmkv3fEtepB/9dbk7Fvzz5W3Mi8Wol0WUAgCsON3
 qPeRDqoGoWd7b76yUDLp5MzArHPkMpJxUw04IswdlPQ68MfYNbEpsvpIfvGGkdRx
X-Gm-Gg: AYBFou2cw7IAFlHD9zWAjHwk8irZlxJmoC/kMJbIkeGmH/fIQ8FuZXZqPaOnJ/WoXDk
 MJxDWz/wnK0F8SBQhy2Hg8ozkJ9HYgBzVQJxXWBjBvq5WVicomZB+eaciKG3yh/m7M6Mc8AIB6w
 kpqlj0JjQY8ErymZDhRqcMmQF1GsOzZg3ljzvwhuGTV/B27aDA4NWKNB9Kg0cbLYpOda9EuOeKh
 iMPeW21SFzT0Unjw2Ob8i9frWbLRZnbmpV+mhLoMEaLheiG8jpM7vBBTRfW+SYRbnJt4KMPBDVL
 OJbflbWSXrSy8du/qQWdspvVBuxNt78VmJGo5lSBGXuewh5LGT/5PvMMvmtGfU482/PYWFVXZ1W
 0UtjM/MQNMOkuvjj1Au61z9TTLJOZWo4tz13I9MkEHnefsHd/c1UEoigZQXXNNjTq3TTbU/aP9+
 sg+jOnyY9bYHNf7pSEzppJGrgzC3zMLaP2a9ypBDTwU/7ftCZVKwQ5xplQe8ZIbPiK5vSuJXEmy
 o42jXLkrkp+5jLP3/mQb7zTgGDIH9JZzqD1iv+KEVK6DB3mNpEaLogyonv/QFH0VZ2RO30eRuoo
 XaUfgxFgVWD//wtXcaFRHiY2HKcx019i
X-Received: by 2002:a05:600d:82c7:b0:4bb:69f2:87f7 with SMTP id
 5b1f17b1804b1-4bb69f28901mr158896245e9.18.1794889923526; 
 Mon, 16 Nov 2026 20:32:03 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb784e9073sm37440735e9.6.2026.11.16.20.32.03
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 20:32:03 -0800 (PST)
Message-ID: <6afbd8c3.99075faf.352764.9841@mx.google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 17 Nov 2026 04:32:03 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-11-16
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

Autobuild statistics for 2026-11-16
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  3  | 12  |  0  | 15  |
  2026.08.x  |  0  |  2  |  0  |  2  |
    master   | 43  | 45  |  0  | 88  |
     next    |  0  |  6  |  0  |  6  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 8 
               madplay-0.15.2b | 3 
                   perl-5.42.3 | 3 
                    attr-2.6.0 | 2 
                 glibmm-2.76.0 | 2 
             open62541-v1.5.10 | 2 
                tpm2-tss-4.1.3 | 2 
          aardvark-dns-v1.17.1 | 1 
am33x-cm3-fb484c5e54f2e31cf... | 1 
        balena-engine-20.10.26 | 1 
             dahdi-linux-3.3.0 | 1 
              fftw-quad-3.3.10 | 1 
             glibmm2_66-2.66.8 | 1 
    host-mender-artifact-4.4.2 | 1 
              host-rust-1.99.1 | 1 
 ibm-sw-tpm2-rev183-2026-08-26 | 1 
                      icu-78.2 | 1 
                  libbpf-1.6.2 | 1 
               libglib2-2.90.1 | 1 
            libxkbcommon-1.9.2 | 1 
        ltp-testsuite-20260529 | 1 
          ncurses-6.6-20251231 | 1 
                    ne10-1.2.1 | 1 
         nvidia-driver-390.151 | 1 
                openntpd-6.8p1 | 1 
               procps-ng-4.0.6 | 1 
rtl8188eu-db2131b227dd43958... | 1 
         s6-networking-2.7.0.4 | 1 
                    sbctl-0.18 | 1 
               tcf-agent-1.8.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |      aardvark-dns-v1.17.1      | NOK | https://autobuild.buildroot.org/results/d94c661ccf375cdbd40f22a2bd694d70858f769b | ORPH
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/cafd90e33a521af7d92264654b456cdaeb40b375 | ORPH
    arm      |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/d710d17a321bd4108cea3ce680a6ca8371461b06 |     
  mips64el   |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/76866e91eafe1d48af8d78ed76ee70b719ebf970 |     
  riscv64    |     balena-engine-20.10.26     | NOK | https://autobuild.buildroot.org/results/4c70d9294c31ba4d0bcc84829f8ff7294e03e3dc |     
   x86_64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/80f27e126fa7545c2f9d38a22bdca0fb91d635ca | ORPH
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/f46528b5a7a0579fdc7a3f4a6890c6e50a7799b7 | ORPH
  aarch64    |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/33c6ba41a737d97417910f26518b6a70306df0c7 |     
    i686     |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/b66ced0c49067b9f41f6632d752b548c31cfef1d |     
powerpc64le  |       glibmm2_66-2.66.8        | NOK | https://autobuild.buildroot.org/results/dc8c8e33b6bac83b4a95cad4aaa4e2dfc7ac0e37 |     
  mips64el   |   host-mender-artifact-4.4.2   | NOK | https://autobuild.buildroot.org/results/9e83a3c6960069dc89988b77059b0df400080eb5 |     
  aarch64    |        host-rust-1.99.1        | NOK | https://autobuild.buildroot.org/results/dfc9c79cee9ea13ead362411d1524099bd85d4e8 |     
    i686     | ibm-sw-tpm2-rev183-2026-08-26  | NOK | https://autobuild.buildroot.org/results/cf0f8c79292b3eef9742746a3ed34c27170cd6dd |     
powerpc64le  |            icu-78.2            | NOK | https://autobuild.buildroot.org/results/9faff81c30cae5baa3a447a69529e1e51f493ae3 | ORPH
  aarch64    |          libbpf-1.6.2          | NOK | https://autobuild.buildroot.org/results/b52cb4edd121a576f5571a29aa35572ab3463596 |     
   x86_64    |        libglib2-2.90.1         | NOK | https://autobuild.buildroot.org/results/313a4f8121362e8697d5f6cc52d2049a8ec4bcab |     
  riscv64    |       libxkbcommon-1.9.2       | NOK | https://autobuild.buildroot.org/results/d9ad85e2e637bbf8036e82aafb0f313c34e2070e |     
    arm      |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/c6cf1c80c6e79eb8af03936fabc70a16b58770a8 |     
  aarch64    |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/4fbc2f28d78576dc70ceed2c2331a6cbfe516d06 | ORPH
  riscv64    |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/2d96756a674ff0f392e34fdf976bf193c7d5caf0 | ORPH
  mips64el   |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/521e55b30fdc5b8252ddb55f8a849b2c66a0830a | ORPH
    arm      |      ncurses-6.6-20251231      | NOK | https://autobuild.buildroot.org/results/f42285d1bc8d32b7b86185820eed306b596fe7ea | ORPH
  aarch64    |           ne10-1.2.1           | NOK | https://autobuild.buildroot.org/results/889ce93590d10b987a46a6b5efb3921be54bc745 |     
    i686     |     nvidia-driver-390.151      | NOK | https://autobuild.buildroot.org/results/5d9a5a7660b6537e85432ae419002877cd5e3cdd | ORPH
  aarch64    |       open62541-v1.5.10        | NOK | https://autobuild.buildroot.org/results/635043b07ec4a213eb45e8603471359ac271e63d | ORPH
   x86_64    |       open62541-v1.5.10        | NOK | https://autobuild.buildroot.org/results/325814dcf3e83d29d2989ddaa7491243af8427b2 | ORPH
    i686     |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/85353661e0790e50707239d33f71a1b77741091f | ORPH
   x86_64    |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/b3085b25c6bc3639933d9dfde1a4268feb34bfd7 |     
   x86_64    |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/a0f2f75bbe42a6f2d4080b3b237aa7fd5957324f |     
  aarch64    |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/fe8a24c7d753d1587dd638c8baef802aa4c7f93d |     
  mips64el   |        procps-ng-4.0.6         | NOK | https://autobuild.buildroot.org/results/3eac945f76c1bd369232541e7140211cb4e801f1 | ORPH
  mips64el   | rtl8188eu-db2131b227dd43958... | NOK | https://autobuild.buildroot.org/results/6c1f9024b049d74e556e1a6790be40c620c2b8b4 |     
    arm      |     s6-networking-2.7.0.4      | NOK | https://autobuild.buildroot.org/results/34df2a688fe7d84b66a9d462ea9e80bb3fe9fa8b |     
    i686     |           sbctl-0.18           | NOK | https://autobuild.buildroot.org/results/a325fa0e26721f5565abb41e87d116fb56706bf8 | ORPH
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/c4b2804b9468ba7ff1182e0c85d394bf756f6022 |     
  aarch64    |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/8cc06ecdfd633621f4f76c69762bd44a614a50a3 | ORPH
    arm      |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/f3af9f3bd1165d2e9f98b8eb056043643a800bf2 | ORPH
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/1ac9e6c9005a5229e495f936633abcafaec33bda |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/4b9128f5244ac7564ab4dad5d22c978aa89ef3b5 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/b334c14b27840f22cd308068f2e72e6e1a544ccd |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/a77b702ff1dc6e6b8321790da08a52332bbb2127 |     
    hppa     |            unknown             | NOK | https://autobuild.buildroot.org/results/36928b6bfde420715aeb8aa1464a1e0fa49c1834 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/45197516f0ada9ed13e760d7d89ef3decac9520a |     
    hppa     |            unknown             | NOK | https://autobuild.buildroot.org/results/5894e7ad7a07c9ec93f175b73cb0dedf2a31a1c3 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/87803e9edd8266711356be92c56c36fc5c248776 |     


Classification of failures by reason for next
---------------------------------------------

           host-cryptopp-8.9.0 | 1 
              host-rust-1.99.1 | 1 
              syslog-ng-4.12.0 | 1 
                 systemd-262.2 | 1 
               tcf-agent-1.8.0 | 1 
                  xvisor-0.3.2 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      host-cryptopp-8.9.0       | NOK | https://autobuild.buildroot.org/results/cb276ae0cab51bdc37fd9ba233cd52dfb74d5779 |     
   x86_64    |        host-rust-1.99.1        | NOK | https://autobuild.buildroot.org/results/070e09f9e9cdbe3309b4ebe8769dfc9a6632e621 |     
  mips64el   |        syslog-ng-4.12.0        | NOK | https://autobuild.buildroot.org/results/b1d28fd4c55f42360626144df11e60c6fbf0a172 |     
  aarch64    |         systemd-262.2          | NOK | https://autobuild.buildroot.org/results/b132bf212ed5a021894dd3e9fbe65e1e40658d3c |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/d4885793fbdd4e3110c31299258ac0579697d657 |     
  aarch64    |          xvisor-0.3.2          | NOK | https://autobuild.buildroot.org/results/7ece9528c43814eb0de25579a26efbcbdf029432 |     


Classification of failures by reason for 2026.08.x
--------------------------------------------------

          openfpgaloader-1.1.1 | 1 
                    sbctl-0.18 | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      openfpgaloader-1.1.1      | NOK | https://autobuild.buildroot.org/results/f8f69f7dd407e94c6fee73e0a759bf0a2e5cff72 |     
  mips64el   |           sbctl-0.18           | NOK | https://autobuild.buildroot.org/results/a754bb63aa92da0aefe511fba7689bb1e6505a57 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

              libmodbus-3.1.11 | 3 
                  bcusdk-0.0.5 | 1 
    host-mender-artifact-4.0.0 | 1 
        host-python-lxml-5.3.0 | 1 
      host-uboot-tools-2021.07 | 1 
     libphidget-2.1.9.20190409 | 1 
                  mender-3.5.3 | 1 
                   perl-5.40.5 | 1 
          python-django-5.2.18 | 1 
python-remi-2022.7.27-37-g1... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/8f94bdf2ac17a77bb35f6f82c17e496703437c2e |     
  mips64el   |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/7f6695b5450b0fe00d80a2a119475ef07ec74be5 |     
   x86_64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/26292cf1604304deb01e2476d0d63b85eb93ae4a |     
   arceb     |    host-uboot-tools-2021.07    | NOK | https://autobuild.buildroot.org/results/6079e727ef8e91614f6c005899f1bab037632fb0 | ORPH
powerpc64le  |        libmodbus-3.1.11        | NOK | https://autobuild.buildroot.org/results/55d4672f81baa912e308fab80d737b78ca80cadd |     
   x86_64    |        libmodbus-3.1.11        | NOK | https://autobuild.buildroot.org/results/e31d95e8aab13f712287c39e47aaa43225d66de2 |     
  aarch64    |        libmodbus-3.1.11        | NOK | https://autobuild.buildroot.org/results/6edeafd2ba72806f80d8ce1e11aae30396c26320 |     
   x86_64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/a04209793551f2508fd8b5dacab316e301a89a9e |     
  aarch64    |          mender-3.5.3          | NOK | https://autobuild.buildroot.org/results/9062de6d60b0c6941d29459db479f6691ed2b4a3 |     
   x86_64    |          perl-5.40.5           | NOK | https://autobuild.buildroot.org/results/159b0c7fa7c980786e65a96f62b6182a3a754fd6 |     
    arm      |      python-django-5.2.18      | NOK | https://autobuild.buildroot.org/results/b874fdd5376aab6aaa7be395934bd72192eda378 |     
powerpc64le  | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/c13d4629ca959207137b3d556c08c976c4550ddc |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
