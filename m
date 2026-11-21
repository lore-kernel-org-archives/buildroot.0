Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6267E606A696
	for <buildroot@archiver.kernel.org>; Sat, 21 Nov 2026 04:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=RG/LhJ4j;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PM5+MH0p
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DF2580F30;
	Sat, 21 Nov 2026 04:38:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pcTLcWP68FQ6; Sat, 21 Nov 2026 04:38:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D1CD080F6C
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795235928;
	b=IqBp1e1ekZBgguMTSrnHlFtl9GRLZlcEVpNVaWvKDDDXTiO8NWpbm0XRAHxUeaMCDKdZ
	 IQSABRjIavmhTU8N11/IyqybNOQJcr8XWyeiAHoTxsa86uuk3w+2Zwz2UlSJKPj+MGFin
	 OQNCPTsBYhQciLVSsbUpF7s5fHo7vX204GXG696xWy2G30TevZ2cIWnVyCX6LE8omI9jQ
	 goYSfNMD5Nrm4DmreuD3H4mxCkMdH7NPqUzKgpFi9Imgo6hKTYHrpIJLsYsLk+FYUwB6B
	 0i7/ab19F10Wlqx+DgHYatE724T7hiHfY+hpk+BkJlX2M6iMlC/IudgUDBL5vllx1/A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795235928;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=wC62JZ/ARb10DmjJgu9ZpGY0DoC/+f2u1nFTiAcSvkM=;
	b=tJO4T2LrG3Dwrjhc4WgRwMyQKG1JRSFC6oXblaok5Ejm5RE253wZ4bO/J+9NaN97t9aW
	 RwZk0lMtTmLqKoE6hplR8JbyCu/ORnv3r/7/5mHbHFt/W4djpAbZUD2chyOT41eUbSU3+
	 odiKVMLD1zwZr9DUj1zvuokf8Gn6lodFBn5Tf0PuioRs448fDnHAhR+lBFJKGoOQceonu
	 t1+UjnN2HjlK2AiUd2guFhHNFY5TvGJLeWneGvtDDGidLlAlXYKxv6V4RCQS7Rsl5WTGJ
	 DZkY1QfCTkQF0zzx2o85cJ6J/irHO5hTluo9CID9wUWRgWX1aHuk9jBIHJMW0ISUCNg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PM5+MH0p;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795235928;
	bh=wC62JZ/ARb10DmjJgu9ZpGY0DoC/+f2u1nFTiAcSvkM=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RG/LhJ4jL9XrsWnvE9/8mzm/dsMGmpsImI8vMNl3vxSHoiGBiGv2OJVlrKeer+0jD
	 YNnUfiQv2T4wd2svTZEKSh2SSkjUqMxVO2aqq5WLVD2tk2AgHg/c5Ovk8MBTXbOysX
	 t0FHC81StWd/CgBc9sny4VHETOM6/Nkqe3pguVwbGO85mK6+FVwngasZ6RQ5+N1G5c
	 6IyAN6nMq+oc241BJG8r/HBVBUiEEPqEgMgO8332mJjA0rXDsuEn5jlvDK6myrtI37
	 dtXQ6BE6xlK5NbxQe2UbPDbtKZq4D1zarw/Nf/jMhTbEZHxo4BIzuNBCSkfYxO/nBW
	 iZz8c9EF0Ivdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1CD080F6C;
	Sat, 21 Nov 2026 04:38:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 775911C9
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 04:38:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69AC5810CB
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 04:38:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h_EdqKZxP-UR for <buildroot@buildroot.org>;
 Sat, 21 Nov 2026 04:38:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B159580F30
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=PM5+MH0p
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B159580F30
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 04:38:45 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4b79502c27aso13545675e9.1
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 20:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795235923; x=1795840723; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=mgVgSEZ5khmsbdKPYHeAOdlbcIakEhkG6c1kt4dZBG8=;
 b=PM5+MH0pHPs5R2dRw+csVXZU0AxdHqyeRx5UMsULUyX8ilxcupmvi9R3M/whVfZN7f
 t0HBa2IVd/aSWvphlOro9BaArq4SI5PQOb6wZ1lNmKhlS0Es1YQ1eFKtfMGaQy8ZfRct
 rag1M9vppmH0U4oZgTClIxvlsA2M8FgSBf7TKxO6UgXKQm1PDjcD629dq1Wl1Z58idf8
 w/Fsp61Psj++kjW1r8BjV8HDA2CEKkNmayn60vMyfO5g0EYpvtFrYPLNn5LQ3sD6Jdkg
 ndQ09PVh+TNpuzLOQ5IOng/H33vD2i9HuNxCPP/GVqbnFEyvUcXWqmIRe9ifH4Vykv2W
 +CbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795235923; x=1795840723;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=mgVgSEZ5khmsbdKPYHeAOdlbcIakEhkG6c1kt4dZBG8=;
 b=AiThb129rkUWMZ3CmFftlE/q7aKVv1F4aMG7jXkuzh+oH+CyDV5UzrG1tpyTilb9wW
 WRzOKMecSM0M7UvmC5S/i1shRnPvES2KbUH7lF6D8dc53YeApHym7Kmcs8QrHcgxyx05
 pPLoc7iAnC9Q1QTb3VlBEj+2/2QBiB9B6R0lbP21UEHrcirOFrahGC449wmInKOsAyi3
 4fNUrNwSBDAKXRZjtZDOWIBK8FQhyGE6pt5ckkiRRmaPczFDkpxDyB1ybPnUfc0z9TWE
 /Dy7fJyVntEYmpCEliVen+pqpX3zcHcLdWvkmf0EYGQOV/3sqWfsuNOlaQ3uNPkjBW1S
 6emw==
X-Gm-Message-State: APuU4Z9lPmlunuAIEWEe0YwAXwIMKhIaAGnJ9z61fhSF+9XfPkvb4JZF
 0iz/zSJEXx66ppeMVChoqhE79itYAtlgFOQzLAyvaj+Ga6jnpOURMvL0VnMoJmwK
X-Gm-Gg: AZFdTZff+DZeQmekXL3s7ZPHK9+Skshc5J7UB5rwunDeAQzC/ZW4wGGU7NZkFWvLPLK
 eGZikhbvG3G1ifMgewLElM51iRYsyOeZYHr1eWCCDd5LOqyPf5YE5FxV6Yp1Ogg0eicUrSFvoBr
 Jln9MUZs4FljX5zsIMLdBS60Yd0NjE9cDqwJ0EEjMqmmGyDnmoDWJ2TyJvCLEfkcV7eEc9sKSjR
 A3Pjf9rYP/QSjvPNbNbLr59EWWVoZgk9f6ZerPeF7iyi32cKZPY6OzFMhedTyF4ijGQ2jm72SfM
 0pdvHUEFq7kySUqnRGnezAWD7t2zFunbDErRNY+6RXg/zBpfMGFSi/zVTAaAsyFYiIXMJt8DlA1
 c1Dp7orN+39yYWTqERVYm2mxl6FjKLrKUGdDZPEJJX1fQOjpcH0iYraXxXR2Mfe4fyQ7K8cV6n5
 Qn/aVFkv6VERiuF3+02gtnnZwu/lt71ZEv5wX6jIi++vSjMNzDQnbbtfgjw9VAzEEgqY+gQYp6r
 OlGeIHK3bBd89sfRXY7cpx2lGXTZYd9hsB9dLLbtU/tnIltqHqlCH+UrZ1cjRyDr7dFWvyeHK4B
 0LC2w+6l4HGdv8QgFag47EE74DfJYKgn
X-Received: by 2002:a05:600c:1389:b0:4bb:6519:477e with SMTP id
 5b1f17b1804b1-4bb88813b35mr116276845e9.17.1795235923051; 
 Fri, 20 Nov 2026 20:38:43 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb884a15absm124425275e9.9.2026.11.20.20.38.42
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 20:38:42 -0800 (PST)
Message-ID: <6b012052.7c30d97a.11e496.f136@mx.google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 21 Nov 2026 04:38:42 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-11-20
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

Autobuild statistics for 2026-11-20
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  |  7  |  0  | 11  |
  2026.08.x  |  2  |  3  |  0  |  5  |
    master   | 32  | 60  |  0  | 92  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 5 
             host-libbpf-1.6.2 | 3 
    host-mender-artifact-4.4.2 | 3 
              host-rust-1.99.1 | 3 
                   perl-5.42.3 | 3 
                  chawan-0.5.1 | 2 
             glibmm2_66-2.66.8 | 2 
               tcf-agent-1.8.0 | 2 
                    attr-2.6.0 | 1 
             batman-adv-2025.4 | 1 
        edk2-edk2-stable202608 | 1 
             firmware-imx-8.30 | 1 
               freeipmi-1.6.18 | 1 
             fswebcam-20200725 | 1 
            gdk-pixbuf-2.42.12 | 1 
                 glibmm-2.76.0 | 1 
                 haproxy-3.4.4 | 1 
       host-gcc-initial-14.4.0 | 1 
                 host-gdb-15.2 | 1 
      host-uboot-tools-2026.07 | 1 
                   iotools-1.8 | 1 
     kvm-unit-tests-2026-04-17 | 1 
libftdi1-v1.6rc1-2-g92d657b... | 1 
             libxmlsec1-1.3.13 | 1 
               linux-pam-1.7.2 | 1 
              llama-cpp-b10702 | 1 
               madplay-0.15.2b | 1 
                    mraa-2.2.0 | 1 
                     mtd-2.3.1 | 1 
             open62541-v1.5.10 | 1 
              openconnect-9.21 | 1 
            optee-client-4.9.0 | 1 
                    opus-1.6.1 | 1 
               pulseaudio-17.0 | 1 
            python-numpy-2.4.0 | 1 
python-remi-2022.7.27-37-g1... | 1 
            quickjs-2026-06-04 | 1 
raw2rgbpnm-f28b903ca63b4c22... | 1 
                 rtl_433-25.12 | 1 
     s6-portable-utils-2.3.0.4 | 1 
              skalibs-2.14.3.0 | 1 
                 systemd-262.2 | 1 
                 uclibc-1.0.59 | 1 
               valgrind-3.27.1 | 1 
                    xen-4.22.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/620c97cbb12bcce3af96935fac2489242cb668c3 |     
  aarch64    |       batman-adv-2025.4        | NOK | https://autobuild.buildroot.org/results/669cc9cf33787427bce0539256eb44286589ca8a |     
   x86_64    |          chawan-0.5.1          | NOK | https://autobuild.buildroot.org/results/2bf6a499c1a9db45c737a5c364bd5febfb5bc228 |     
powerpc64le  |          chawan-0.5.1          | NOK | https://autobuild.buildroot.org/results/01639d8d72b5aa30ac79eca5ab0d5c9b325bc23a |     
   x86_64    |     edk2-edk2-stable202608     | NOK | https://autobuild.buildroot.org/results/a415f14cfaabdb2700f1bd960915daca12b6083c |     
  aarch64    |       firmware-imx-8.30        | NOK | https://autobuild.buildroot.org/results/7a797bcf43569b09d79f134f11f02e95ce2f78f2 |     
 microblaze  |        freeipmi-1.6.18         | NOK | https://autobuild.buildroot.org/results/2deb96ca25eaf56b44c7020b09ec8b94fccf4a7a |     
  mips64el   |       fswebcam-20200725        | NOK | https://autobuild.buildroot.org/results/81e281d8b1043158b7fae3e1c251a5a5f0095d49 |     
powerpc64le  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/3afc3c4470b47877523ad97b1e106a86f5de38eb | ORPH
    i686     |         glibmm-2.76.0          | NOK | https://autobuild.buildroot.org/results/d4d233a0b916dbc022c9f387b12f25d7179cffda |     
  sparc64    |       glibmm2_66-2.66.8        | NOK | https://autobuild.buildroot.org/results/745516672a849c0380dcb61520ff079a35f88043 |     
  aarch64    |       glibmm2_66-2.66.8        | NOK | https://autobuild.buildroot.org/results/dc7138388b57e8ae94cb399ec2862bcf3fb3beff |     
    i686     |         haproxy-3.4.4          | NOK | https://autobuild.buildroot.org/results/82c31b6d41fa9af1b4be8a1f3477c13ceb081a17 |     
    arm      |    host-gcc-initial-14.4.0     | NOK | https://autobuild.buildroot.org/results/59b6741ed6cfdb9c66c5f7106b39cb907a660d3c |     
  mips64el   |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/c7e4da9a6d88732b890f772883848f028ddedf9a | ORPH
    arc      |       host-libbpf-1.6.2        | NOK | https://autobuild.buildroot.org/results/c5064ce1f55a8b598e05bc8457f1fec7e0088785 |     
    i686     |       host-libbpf-1.6.2        | NOK | https://autobuild.buildroot.org/results/f95b9df8ea55364e9984643617f34f923122fc0d |     
   x86_64    |       host-libbpf-1.6.2        | NOK | https://autobuild.buildroot.org/results/7c8689192cec997adf1c45b9f200713f6b772d70 |     
  mips64el   |   host-mender-artifact-4.4.2   | NOK | https://autobuild.buildroot.org/results/5a9f1af46213373a978029675b9c1a002ebd3cbc |     
  mips64el   |   host-mender-artifact-4.4.2   | NOK | https://autobuild.buildroot.org/results/31c0cd6bd2acb082148443ae57b295cf63e8eee0 |     
  mips64el   |   host-mender-artifact-4.4.2   | NOK | https://autobuild.buildroot.org/results/8ccc2af0e165b51189e4c5eedfc778b9ae8553b1 |     
   x86_64    |        host-rust-1.99.1        | NOK | https://autobuild.buildroot.org/results/cca3a92f26a7c4a0c0930aa873bd31f548e2439a |     
   x86_64    |        host-rust-1.99.1        | NOK | https://autobuild.buildroot.org/results/766f3d38585ecedebc6a1465ed0c2c8c52e346cf |     
   x86_64    |        host-rust-1.99.1        | NOK | https://autobuild.buildroot.org/results/66007b0dda9e478a529b8a37263b715511094111 |     
   x86_64    |    host-uboot-tools-2026.07    | NOK | https://autobuild.buildroot.org/results/236a3497329d2ce3491d997b5a2613ba4176f6a5 | ORPH
powerpc64le  |          iotools-1.8           | NOK | https://autobuild.buildroot.org/results/cccb9257208e3bbdb6119b0231fe029acac9b7dd |     
powerpc64le  |   kvm-unit-tests-2026-04-17    | NOK | https://autobuild.buildroot.org/results/7cd6c5beb40c8f1a41f64db0c018f2875fb44b13 |     
    arc      | libftdi1-v1.6rc1-2-g92d657b... | NOK | https://autobuild.buildroot.org/results/ff0bce633aea155d87437a12f183aaf826b7f081 |     
  aarch64    |       libxmlsec1-1.3.13        | NOK | https://autobuild.buildroot.org/results/04b85d5964cf8e286ab1994a6dfe849430a2fcb9 |     
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/36d3751e47ca162e46854b3ed3ac40691e6bec8a | ORPH
  aarch64    |        llama-cpp-b10702        | NOK | https://autobuild.buildroot.org/results/ac16bd4174b9ffcbd81dcc41c16fa443dbc27693 |     
powerpc64le  |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/b87de37a8b1f2e2b961638311b0e69217b705f79 | ORPH
  aarch64    |           mraa-2.2.0           | NOK | https://autobuild.buildroot.org/results/514eabb089a4cd9f25416fb2b405849f3103fef3 |     
  aarch64    |           mtd-2.3.1            | NOK | https://autobuild.buildroot.org/results/ec713b836468c494a059fc0cc8ab43bfec32b451 |     
    i686     |       open62541-v1.5.10        | NOK | https://autobuild.buildroot.org/results/289283cb02e45fa76886c4da3e40c5f381271097 | ORPH
    i686     |        openconnect-9.21        | NOK | https://autobuild.buildroot.org/results/e788cbb9eea5dd9c710f0be71cceb5eca7133975 |     
  aarch64    |       optee-client-4.9.0       | NOK | https://autobuild.buildroot.org/results/5a56ed2d13afbde2ab058ff0f06fb11154f0a2f3 |     
    arm      |           opus-1.6.1           | NOK | https://autobuild.buildroot.org/results/e7396609cb47827bef2a220cbe1f46167dbf7ec3 |     
    arm      |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/d9889802751cdbc2afc05d86fb7f8fc9a2836a41 |     
  aarch64    |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/d994a436bd4bbe52606b6bf33e53173f406a1bbe |     
  aarch64    |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/77cc46ed493511ec59a52e2c3d63e872dd85a264 |     
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/b4719d45457b99fdd86bf088dc0b1ee8136c2508 | ORPH
    arm      |       python-numpy-2.4.0       | NOK | https://autobuild.buildroot.org/results/feba2c7ea02686a73578029086282e46bf9ef140 |     
    i686     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/be2a359bfaeb023f01e3b9d4a97081c9a27810ab |     
  aarch64    |       quickjs-2026-06-04       | NOK | https://autobuild.buildroot.org/results/ec282d38aad0d8df2cb3f8d27bee196076283f4d |     
    i686     | raw2rgbpnm-f28b903ca63b4c22... | NOK | https://autobuild.buildroot.org/results/14e6ae8d3b390b88554fa10c881a4716d4e51722 |     
    i686     |         rtl_433-25.12          | NOK | https://autobuild.buildroot.org/results/de7518a2028dbc70d844cb431aac7610afc2bcc2 |     
  mips64el   |   s6-portable-utils-2.3.0.4    | NOK | https://autobuild.buildroot.org/results/3d0193115e59722f0350472cb63c6b1d9b36f1cb |     
    i686     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/36255039a906f621cdcd623fca0910b8c361858b |     
  mips64el   |         systemd-262.2          | NOK | https://autobuild.buildroot.org/results/40f44508d567945b83f4108be2e7261fdfcb840a |     
powerpc64le  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/5b2152580496c4a5961e84517fb6d6d2c848d0b8 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/b4d79040ec58a3a0cd6c12459aadd7c189b747cb |     
    or1k     |         uclibc-1.0.59          | NOK | https://autobuild.buildroot.org/results/5204b29f045f11089b97289573023644520b3720 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/b4e2ec87119d1e21186a227fb4921adb8b2b9d55 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/a31006a3a053443523ac52f9b03120eb69665d4c |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/54e7f5603eb21409922d1d5b6ca0900873cc8704 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/4ad63c9d6d17e6e3ed5f4a589d6ecdbbff30f5af |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/f0eff36b55643c098cb448ef8ce22cafc9092e4d |     
  mips64el   |        valgrind-3.27.1         | NOK | https://autobuild.buildroot.org/results/1b15d2277a050740936cdc7bbc6b99e92842e34e | ORPH
   x86_64    |           xen-4.22.0           | NOK | https://autobuild.buildroot.org/results/d5ab7a18c4ef9dc0586a81ffc11203c7da0b71a6 |     


Classification of failures by reason for 2026.08.x
--------------------------------------------------

                   bzip2-1.0.8 | 1 
             dahdi-linux-3.3.0 | 1 
      host-uboot-tools-2026.07 | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |          bzip2-1.0.8           | NOK | https://autobuild.buildroot.org/results/966897d1a9dc54e8afe715a09ee4177cc544d17e | ORPH
  mips64el   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/f32bfb0cbbbe3abfddf05cf77389f71d8f927042 | ORPH
powerpc64le  |    host-uboot-tools-2026.07    | NOK | https://autobuild.buildroot.org/results/7d74351438c0dad8e06de9189b288c76dbe1d632 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

package/linux-headers/linux... | 2 
             fswebcam-20200725 | 1 
                   fwupd-2.0.4 | 1 
glibc-2.41-174-g92b93a3bc26... | 1 
              host-rust-1.82.0 | 1 
rtl8189es-6b4cfb5c37f10c099... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |       fswebcam-20200725        | NOK | https://autobuild.buildroot.org/results/045a0a93a3be13dbaa3432c680f5a0f64f89cd90 |     
powerpc64le  |          fwupd-2.0.4           | NOK | https://autobuild.buildroot.org/results/ec544727be622b14bbdb31e11fa7341d2350e1ae |     
powerpc64le  | glibc-2.41-174-g92b93a3bc26... | NOK | https://autobuild.buildroot.org/results/f38dfe68da9086edca92e896f071d89e1adb9382 |     
   x86_64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/ec6f42c1eace67df8c6a7291eece0a26e8840d7e |     
  aarch64    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/26d9b643058c5dfa62965c752c811c856ec6339f |     
powerpc64le  | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/40cefd7f8940672ca30456a4c60f44969fc4adb9 |     
  aarch64    | rtl8189es-6b4cfb5c37f10c099... | NOK | https://autobuild.buildroot.org/results/518af21a65186fbb85735ef2bfeff537643f118f |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
