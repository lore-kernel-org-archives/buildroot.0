Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29608606A320
	for <buildroot@archiver.kernel.org>; Sun, 22 Nov 2026 04:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=S5fJa178;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nakW2p2n
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECD4B80AAE;
	Sun, 22 Nov 2026 04:24:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Q6QzRrzMrRp; Sun, 22 Nov 2026 04:24:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A964180A89
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795321462;
	b=ZUSSY3TCkwGXct5ONygp7h0dheXGyjH6QmaT8i788p1Tlni2ja/xvdcZijhZ460UjmbL
	 cEn3CinompEB2Q0kSBKJ4Z7K2xWfxeoul5u4cGcl0oLRYgo6ccb7FQl8LmxZ9dam/OIGE
	 MmCYTOVhGXBToT71XR34Kk5Z8sGaeTsR2WBTN9VL5NQNA+fWpednWGYK65uuEAphdCIp+
	 SPivPfpL5QJ50tEMZfqKX0M31A0dqth3+CSAd/EeTsRav4xFByhV9BaAaH5OJa1dvVXwZ
	 aJgHgOjiKX4pF7PfMRXdnGsyybbf3dRdcZoWi39zAYfeOSNMyjEcyN8o+KNA2Za3y6Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795321462;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=/YgH03faHoNxv9NJMXLO/1M8+3dcGb3BaN+78K4fG+o=;
	b=b9Xd8SqKXbsS0UjROsMpbWlLX2KzT4oDw/Q8VJBRPYol4TufFSBdX5gFcGHH5xs7bNBy
	 WUU+XMi1imUTFsyZmBLANcIC+xr0zDO7JStLC0iA54ujtsgr5zl9dLui0mzkwPA24ciWK
	 uJQ8dHgrvG0LVwU1sxCvISK6m8MLIPw6RMIaZxN8sNMpRz2tX6SjKE00p4A2rJPUUmerV
	 g9ZjlyOKi9g4BARYRkmqXuijsoqgQuptTGrfwA7gRwisqHIYOMVx0c1PIXAWRuEZIi+Rg
	 8nFtm1yiiZUfv1VAySnaYJlt8Ai0SIsv9CxiFwcIUyKbsniRG5JfQ92EsZq6yvmDe1A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795321462;
	bh=/YgH03faHoNxv9NJMXLO/1M8+3dcGb3BaN+78K4fG+o=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=S5fJa178h6ymxobtBa5QkTpNRDBGT6mhvOnQ6+41bffK3xr0GpbzzUClLajItw3X8
	 iJAzTuzgOTFGLDVod4yH7hUVIvRfXUO+bngdDMxBFkQxnGRBit/Cu171oWewjx2Pve
	 WnTZ9SfmkvqRGmokAzSoOK3xy+GKx5L+n33lTfZoVwv2G7lZlC9BdJna3/t704n0Cr
	 pI2lryVYp1CWx5LmPgpm83IBwXH4aNg2yb7vS0zQAbE82E5p37jD9FFo1FZnIhYwAu
	 oxtUTzlX6sUOIx6Hee0TB5nGRppdyAVH7nf20bZlW1yapKTz6juWZyeAaCnZEv6nkV
	 SccQ4kncRLbJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A964180A89;
	Sun, 22 Nov 2026 04:24:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 71E4879D
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 04:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58731403AE
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 04:24:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AelAmKMeO0O6 for <buildroot@buildroot.org>;
 Sun, 22 Nov 2026 04:24:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A841F4035C
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::436"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=nakW2p2n
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A841F4035C
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 04:24:18 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-492fcbfaa88so1330329f8f.3
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 20:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795321457; x=1795926257; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=UQyCyO0rXku2DWVVf4UBSlZh1AEHzzJwJK3CTUPyvNw=;
 b=nakW2p2n1Wl2JGHnQhzYsn0zUejbAuPg4U+Ivid3PTZo/Gy+JVNjrun4n36eGIafvM
 d6cXK6Wq3p0knMVcWxddWvbGLEMbPm0VnNrJ6wxrKD9O+UBagdtnLAuCmhCYA5K1YJsR
 OMniDoeqOY1wrEtWWGpnImOpv2BdGH2cIZkJ0PdNhkLRgKs301IHfjw/T3I8bruWcuUV
 yKf7+VccLRalmoCA+gM/k+EJeCFEYaibu/X0GTXOsHrbVYhReKNDTX0PulISaK+fHIGd
 QMIp75rXI6K+NeDDwXfWegF6bQ46eqZ/yn9YvbgZqNq+dhdTrGe7jZtUftK6rw7kXEqT
 75+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795321457; x=1795926257;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=UQyCyO0rXku2DWVVf4UBSlZh1AEHzzJwJK3CTUPyvNw=;
 b=bvAxkPdvorZzrNjsforEbUH4KlMETOs7aSVGpyftsnX+01MIabQ2dqYxTuuFf0Wr5H
 /LDna3Gvn1NIVJlNDiBwc8XUh2+lzexPxLKJrA+bvz6g4tXf21kolMqM3A9tzmPtRfUs
 3oRyPaOvezs4TTQ3vvVDw9TIbXxhE76s3zEjtL0Vhm4H5MMOZpbjNqwAcKKDHpCgEY7r
 xnYbjNOXyJDSXqAdnX7+axNCUWVg82CBMHljB45d8qjVJ6LFJudiLcuUWnfvzKj4oPcd
 ooidLFkgIe13Y/ajMlCkD3dqUWHmUe/Tu9oYpc7qWKm7undCL4lzwFxqQByhjmE5aWrL
 YuoA==
X-Gm-Message-State: APuU4Z/K0advX5dwUq+LsA/GWMaJpGEWOV+znsmQ2OBAa/9fQriWaWch
 Th427CSYzuR+j4strbONdTkIH/Oce1bqt5RPHSnk8v74NZG96OI65rdo06BRAnYb
X-Gm-Gg: AZFdTZdxruhLWawO702UwnkDHgWNunHpCMKUqMKC4qsE2Ymv92AZZhpenXX+q7DS8rk
 xY0b39NJvEL5/sUqYldUwQgdFUC0DU+x+FYRvBQ55jlbCmtczQ9mOz5HjkLQvQFwYxPpdk3ofkD
 it/Gsn1cp0/drLZ8pAfffeG5z6KFxLrphz6KjXHkGcnjq+M8skQVXWxxc59rQ41wdJdNJbGvKKu
 q4HXrrUvBGaFTYNRq9q0hzQHh19E0UzvCujFht6+QRDi6umYqUWib/J1YjlgcQPQyqdLwk+xmEP
 ShOgnDtrvJBMxABxxByR9cVj99Ns2CS27RKBcwLGMuQEPAq6fNdYD0MDC0MbwuGbl2tNSL723wg
 7hPkMSzS3FOasAyzKBhdiZ6bIceQNvEYXAfaqqjf1oOUiKXwtuLjaHYjZkngVqu9mzd8XQwn0l2
 j+hM9c8/TemDCYMBnaG2wOb4Mhwbg5v7g+2IMbOzxcoUL4nkjQ5opZXBVamTHNWRVWodqHOgPjh
 pPATrSkFmWK0gjzI9Mu46VAFLZUka0Jjt1nl+w+9ppQVIiB5uRXbyQZ5P8fDMWITb3FExnlWyjm
 KQT8Z5Rf05sajQJlasZHBAGYVkDGbQu3
X-Received: by 2002:a05:600c:3b9e:b0:4a1:cf60:dcc3 with SMTP id
 5b1f17b1804b1-4bb88820687mr190434555e9.29.1795321456920; 
 Sat, 21 Nov 2026 20:24:16 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb853b2437sm366544095e9.13.2026.11.21.20.24.16
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2026 20:24:16 -0800 (PST)
Message-ID: <6b026e70.9ab8ba52.16d534.b01e@mx.google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 22 Nov 2026 04:24:16 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-11-21
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

Autobuild statistics for 2026-11-21
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  7  | 11  |  0  | 18  |
  2026.08.x  |  3  |  3  |  0  |  6  |
    master   | 35  | 51  |  0  | 86  |
     next    |  2  |  5  |  0  |  7  |

Classification of failures by reason for master
-----------------------------------------------

             host-libbpf-1.6.2 | 7 
            dt-utils-2023.11.0 | 3 
                   perl-5.42.3 | 3 
                       unknown | 3 
                 glibmm-2.76.0 | 2 
                 haproxy-3.4.8 | 2 
             open62541-v1.5.10 | 2 
                 rtl_433-25.12 | 2 
                  boinc-8.2.11 | 1 
                  botan-3.11.1 | 1 
                  chawan-0.5.1 | 1 
cpuinfo-8a1772a0c5c447df2d1... | 1 
glibc-2.44-77-g438677ef4985... | 1 
                  guile-3.0.11 | 1 
host-mxsldr-2793a657ab7a224... | 1 
          host-xfsprogs-6.19.0 | 1 
           libzenoh-pico-1.2.1 | 1 
          linux-6.12.114-cip34 | 1 
                 linux-6.6.162 | 1 
               linux-pam-1.7.2 | 1 
               madplay-0.15.2b | 1 
          ncurses-6.6-20251231 | 1 
                    opus-1.6.1 | 1 
                 pixman-0.46.4 | 1 
raw2rgbpnm-f28b903ca63b4c22... | 1 
                rdma-core-62.0 | 1 
                   rsync-3.5.2 | 1 
     s6-portable-utils-2.3.0.4 | 1 
                    sbctl-0.18 | 1 
                 systemd-262.2 | 1 
               tcf-agent-1.8.0 | 1 
                 uclibc-1.0.59 | 1 
          usb_modeswitch-2.6.2 | 1 
        wireless_tools-30.pre9 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          boinc-8.2.11          | NOK | https://autobuild.buildroot.org/results/c9938e0914cc5f8273f37958c6f603ecb8d5d61d |     
    arm      |          botan-3.11.1          | NOK | https://autobuild.buildroot.org/results/b2a953907731354c26ba86acbea114a5fb5d8c06 | ORPH
powerpc64le  |          chawan-0.5.1          | NOK | https://autobuild.buildroot.org/results/6f4858bbf6c739512b9ee82d79895abb574e9e24 |     
  aarch64    | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/303d5a727dac25cd3ccfb17adc65b10475a4e6ef |     
  mips64el   |       dt-utils-2023.11.0       | NOK | https://autobuild.buildroot.org/results/f0b096ef31976af37b65a1bb831f8ff2cc18095e |     
  aarch64    |       dt-utils-2023.11.0       | NOK | https://autobuild.buildroot.org/results/3d4290b54bea50188922899e68dfa6f93568c4df |     
  mips64el   |       dt-utils-2023.11.0       | NOK | https://autobuild.buildroot.org/results/8042c399cb7a8afb0e2c017aa4f191e532cac8ad |     
loongarch64  | glibc-2.44-77-g438677ef4985... | NOK | https://autobuild.buildroot.org/results/10aa942ce1dd575e6037e135ec24a3cf5d9712df |     
powerpc64le  |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/44ef6c6f60532fe6936c2bb6464b637abe5a4380 |     
powerpc64le  |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/32729fd5e8fceb867c14bf3ecae19a1b18744263 |     
    arm      |          guile-3.0.11          | NOK | https://autobuild.buildroot.org/results/7f5304c518f83683da3173275c9c2fb0e7328a80 |     
  mips64el   |         haproxy-3.4.8          | NOK | https://autobuild.buildroot.org/results/971bee9e63b53d0b5e092114c9d9e71e48e88ee6 |     
    mips     |         haproxy-3.4.8          | NOK | https://autobuild.buildroot.org/results/c4e7cd5168f80d010616f3e40a96361e2f808d39 |     
   x86_64    |       host-libbpf-1.6.2        | NOK | https://autobuild.buildroot.org/results/fed139499caf968560f09bc64b8dfc578ac00aba |     
powerpc64le  |       host-libbpf-1.6.2        | NOK | https://autobuild.buildroot.org/results/4174c76839e1de3ad21c5510d7cc56b7ca4e5251 |     
  sparc64    |       host-libbpf-1.6.2        | NOK | https://autobuild.buildroot.org/results/b9ebd377308cfd37ea5bb5461f4af970b152abc7 |     
  mips64el   |       host-libbpf-1.6.2        | NOK | https://autobuild.buildroot.org/results/a6dcb1e2a7750d8f69888af36d2da17d1b56939e |     
   x86_64    |       host-libbpf-1.6.2        | NOK | https://autobuild.buildroot.org/results/349c6311bd1057036c5f495d6c6eb194b342ca3a |     
    arm      |       host-libbpf-1.6.2        | NOK | https://autobuild.buildroot.org/results/2b0dce9275894bded36d4a576399482acc58d1c0 |     
   x86_64    |       host-libbpf-1.6.2        | NOK | https://autobuild.buildroot.org/results/aed610e8f47a4e49407755ae7b5fdb2aa0fbd0db |     
    arm      | host-mxsldr-2793a657ab7a224... | NOK | https://autobuild.buildroot.org/results/7027fc30f9c198f39758062eba91af690811a617 |     
  sparc64    |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/a0608b87c69fb37ec3fd6c7199302f56da425411 | ORPH
    arm      |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/daf0a85b833cafe4861c71453b4351095fd6d472 |     
    arm      |      linux-6.12.114-cip34      | NOK | https://autobuild.buildroot.org/results/8179b126c30bbe4cab27fe241b5f6c2208afee6d | ORPH
   x86_64    |         linux-6.6.162          | NOK | https://autobuild.buildroot.org/results/ad6e7cc11b627e2015ba0310574d7c8b613fd9bb | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/31e800a382c23eeeba130032c75d2ab9a348fc94 | ORPH
  aarch64    |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/212aa29920c350c3f30e2ec4d04c3c1a575aca75 | ORPH
    arm      |      ncurses-6.6-20251231      | NOK | https://autobuild.buildroot.org/results/3838f7405fc937ec35e80bc0c2c33411c59f00d2 | ORPH
    hppa     |       open62541-v1.5.10        | NOK | https://autobuild.buildroot.org/results/48aec5b6e4ddbb6de46a33b633ecf70eac0d1984 | ORPH
    arm      |       open62541-v1.5.10        | NOK | https://autobuild.buildroot.org/results/d5b722a47774ac09a3f78753c715d93520c04f64 | ORPH
    arm      |           opus-1.6.1           | NOK | https://autobuild.buildroot.org/results/e32890e3e503f552efbcd77628fd9b3665ddfa34 |     
  aarch64    |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/b100f0efcd3d828c5be1368a0bb7559095bf1053 |     
   x86_64    |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/83fc598d62643f4917a7b0d32b151a24abab47f2 |     
    arm      |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/066e591fe10da7c2e1d5011a207e16e10888f2e7 |     
  riscv64    |         pixman-0.46.4          | NOK | https://autobuild.buildroot.org/results/2c0d51cfb2b0898476d1868327240349512cceed | ORPH
  mips64el   | raw2rgbpnm-f28b903ca63b4c22... | NOK | https://autobuild.buildroot.org/results/399d98f1c96d542d20b4a571a36d2839539e9bbe |     
    hppa     |         rdma-core-62.0         | NOK | https://autobuild.buildroot.org/results/0c2ff09a13b2f2707eb875825905deaf8ceeeb4e |     
   x86_64    |          rsync-3.5.2           | NOK | https://autobuild.buildroot.org/results/ade00f356c7fe191c1b12efe3229b91dc7ab6e59 |     
  mips64el   |         rtl_433-25.12          | NOK | https://autobuild.buildroot.org/results/8efa0aeaf5892126598d90379e9ee7502489be81 |     
  mips64el   |         rtl_433-25.12          | NOK | https://autobuild.buildroot.org/results/79b9a0caae483009deeec86cb43acccb80ae661e |     
powerpc64le  |   s6-portable-utils-2.3.0.4    | NOK | https://autobuild.buildroot.org/results/154c7c5ee7921d04255492559d8ef7fdd7c88ac1 |     
  mips64el   |           sbctl-0.18           | NOK | https://autobuild.buildroot.org/results/fff0c3c9c52351a929865f095e54b29d98f42a78 | ORPH
    arm      |         systemd-262.2          | NOK | https://autobuild.buildroot.org/results/a56865c4903e334f581997314184fc20364ca5c1 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/8e7c4c4231ce4577203cbebfccc09ac24e6afb77 |     
    arc      |         uclibc-1.0.59          | NOK | https://autobuild.buildroot.org/results/c1fb9cf3cc3d86118babe00b868a809f9c56111c |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/62341f7a4752baf3a81af9e32f5ddb528103ab73 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/0fad2481a8dd33a9af99ed16598e79b53c8e42ee |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/bf1aa189b02bc836b47fb882ac1e3cb33c98d7ba |     
  aarch64    |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/84679d48385b29d619933e9af5627a8846854928 | ORPH
    i686     |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/4739f86e0a6a7daf16f4f1b5eb8b45ab7bc320cc |     
  aarch64    |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/70973ec698bf034f9606131ff283ffcda8c7962a |     


Classification of failures by reason for next
---------------------------------------------

              erlang-26.2.5.21 | 1 
            gdk-pixbuf-2.42.12 | 1 
                  grout-0.20.1 | 1 
               tcf-agent-1.8.0 | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |        erlang-26.2.5.21        | NOK | https://autobuild.buildroot.org/results/e52d684c6a206b2fef6954efc5637fa193dbcb31 |     
  mips64el   |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/410ed6a38f9b886c3433870c41749c8b70d14d59 | ORPH
  aarch64    |          grout-0.20.1          | NOK | https://autobuild.buildroot.org/results/4406afbd083df2577e6cf60df017d1c93a454fbd |     
 aarch64_be  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/f8814d37c2325982e5065389819a282ccda24022 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/3d1033724adaf00d92f49024ef02d5823e0a6c88 |     


Classification of failures by reason for 2026.08.x
--------------------------------------------------

                opencv4-4.13.0 | 1 
               pcsc-lite-2.1.0 | 1 
          python-django-6.0.10 | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |         opencv4-4.13.0         | NOK | https://autobuild.buildroot.org/results/6a0810d0a16816c5c88420130422c6d92cd53d3b |     
  mips64el   |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/31636f9940b56a0a94f3649253faf90cea82d012 | ORPH
   x86_64    |      python-django-6.0.10      | NOK | https://autobuild.buildroot.org/results/15bcdc7b166f06384383cfb9ae5186778b77b9ae |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

             dahdi-linux-3.3.0 | 1 
               libnpupnp-4.2.2 | 1 
               linknx-0.0.1.38 | 1 
        ltp-testsuite-20250130 | 1 
           oath-toolkit-2.6.12 | 1 
               pcsc-lite-2.1.0 | 1 
       riemann-c-client-1.10.5 | 1 
rtl8192eu-6755ce9c15bbcb5dc... | 1 
rtmpdump-6f6bb1353fc84f4cc3... | 1 
                       unknown | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/8c716709b7d450e302f68a8b120179cfed1fb558 | ORPH
   x86_64    |        libnpupnp-4.2.2         | NOK | https://autobuild.buildroot.org/results/fa76a96751030577e20107bc8353c1f23ac21919 |     
powerpc64le  |        linknx-0.0.1.38         | NOK | https://autobuild.buildroot.org/results/0dc87729d22e85adb7503d1545e50c18f21546fc | ORPH
   x86_64    |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/2811940905e1109d1b33fd7c6b1ca77791873134 |     
powerpc64le  |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/520d530a5c6af0ecd223e064e0f0b171ec9d182e |     
  mips64el   |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/e9941922efc0e9cb9f2d7a49102af45b33364947 | ORPH
powerpc64le  |    riemann-c-client-1.10.5     | NOK | https://autobuild.buildroot.org/results/ec842636f6638e204ee7fddbab09b6a92b57c895 | ORPH
    i686     | rtl8192eu-6755ce9c15bbcb5dc... | NOK | https://autobuild.buildroot.org/results/f423967b781f06b88836e25aec5cff1b8ea64565 |     
  aarch64    | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/9dbe2fc703768fbfbb8a41aebd943314b719481a |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/7e214fec274633c857f9a28611ee54030066590a |     
    i686     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/470d9a198f9da12abf3a97c3a02f9b41417fbade |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
