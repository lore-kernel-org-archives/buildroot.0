Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF63606A31A
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 03:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=f1HSlXi9;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qkmQPBhr
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22D8D80D6E;
	Wed, 21 Oct 2026 03:24:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6FJtk4D90S2H; Wed, 21 Oct 2026 03:24:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5881E80C42
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792553042;
	b=Asri/CEA/+MRf+FuJ/z7TDhp8MIEeyYqLplWsSFnL+DAO1OfAkf8XQ9/jLer15QlYm5q
	 PtWEiO8eGumh8nS2HPckAcZPSHM1AMrmEKBEJcLnY9XVsiRIziBe9jEceZXIAGkYQM+Q2
	 6AzdHa9B+imEG6DstsTHIMFkli2FjNtM+MVk65VpbyrBpRG5jZUD7OENJf6q4HL2F3W6X
	 DgCftKmt1C9B+0wEJRmJjAxeFxeLD4IQJv7KNsfXMw/50JYINVCo0wrfR/s0z6DevESDE
	 HzSlp1BmMio3P1WaVHCBg8M8Ei0os0e9MpL8ZW7ECBJCLKr4UKF+KTzO2bzJZOo2VEg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792553042;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=MEETEDThZ93Xbnn155DNvExmQhf4r7kWG0cGh82T088=;
	b=qw5xBCvPYVblKN3T9bHFRYDwV3/VFxuyr2q/3jI2kaQ7q3G4D1yeisivOd+o/wYl6iKz
	 2icM1GICRncMld0o7algNehTTxC0QuxE5noRzivv5td9cyAEhMeqvtVhtDcBBBi92vnvM
	 +ccU1WN/8EqsR6PpWx4DYaVyaoTSeD23oTCozixyAcQix1pmlywQGTOzvMI1apmxpiLVG
	 iJTp11TfZfuKzwim3v10wo5c+sYn99vp4Y5Zd4Sf587jqm3SFdFyLGkWz5WgA+UBVUQuW
	 a8FBdhUBjNyqrWY5LB6tUH6H53Fqnel3rGBrT91smaFGCXASWFoqzVz3YVXAnMhc+8g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792553042;
	bh=MEETEDThZ93Xbnn155DNvExmQhf4r7kWG0cGh82T088=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=f1HSlXi9yEvimUb3qGfOqPVaw3ElDZbTOqejj8GW0q5rWmrLdWR1M9MDN9er5HM3g
	 ef/N550ROrKnxsIRFRuDylV2JV9wE3DJ3G8ZxcjO44d1nfYTKrUzAdrL33jdpqHaSa
	 eO8K4GcV6iR0/Sq1rCyGEEvDn6sax5H8LqVDRmWOiq3WVMYW2+AGSLHRTRDhyTzh4+
	 E2/0FFBTmNRr26HrzGAZh/D7J5xuOG22qv74PMMFeP4EjBA8mAHl+L7geJOGnvxRKv
	 bxmmTk4dGDuIJoyQ4dHoxwV/CoPVflTsa5BfUjYdVDb4FbeuHOorpeL3/b9oLu8Fq7
	 PbLAcd6K4dhlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5881E80C42;
	Wed, 21 Oct 2026 03:24:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 293122A8
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 03:24:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F62740512
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 03:24:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VrkYk4Yutza7 for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 03:23:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 11417404A2
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792553039;
 b=qkU2GWpv2UPHR3oiP74X2Tw4rHvs0OsUzd3G1txD/2ZXQySxx440YIyOY5Dr7WrFmeHj
 vDriGX018FNgkE0q6NEotlPKuheGujwkcGDxWY+pEtIVLNmwJgvIWi+mb6Omu7yGWwx1G
 NitZplU7iQXQfgPFilUIB09pEN+JfkiUi7zUM6llHY1E849UI3aZBEAwSiEr9nB6WS8ze
 vZS/YXUn5ZvrXephP/hfgXuD00unlZXkAIVzDWTwBB8yfBy5xq+LesYtcfcEWDlTepD7z
 w+Srbx1Oyky/5FGFw+2n413qE7fyIlb/V/NpdFpJU7elDrd9+D8wxJqWpuxzr2ylbLQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792553039;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:From:
 Date; bh=BSwQYNsi48k/Rkl4qke/KAcMT/agW+GdAMmvhqlAX6w=;
 b=OtxZcbPz28YDS259AtKJHPymSUr147GeLKoyFJFR16G3AeLrK2bjG/lMLvYtU9mrte6h
 QWm8nenxtJqEvqAw4UEY3xIMEP0qwPeJsySxQO7zO2jeF+8yPfA0TxM6nyvzDX/3eiKze
 h5cno8WN8UiwvJBtq2oAbe/TpApTkY5DCXX+m8vHcHcC8B20JkXaUUjAMY7i8MrqVYY+G
 gFxCsusCBQU73Uy+CybEO3m7+zMQE5rnum6DkWGhGB/QWhhD51hm4FY5hXvCZJvn6vFW7
 +iJMrP3nlS+0MnnFVj4rMajDTXyTlXT/Ga+cnCjC115LatNTCyuCxQvYbkT0GI/rmZQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=qkmQPBhr; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=qkmQPBhr
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 11417404A2
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 03:23:58 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4a1df4c0966so1320405e9.1
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 20:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792553036; x=1793157836; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=BSwQYNsi48k/Rkl4qke/KAcMT/agW+GdAMmvhqlAX6w=;
 b=qkmQPBhrlz6HVdu3DeQrJW0AozVRGet9kcyuxdXg9wvSWthek1YZrdsWQCkVWu04E7
 DU9OgFJTJUc3jvcQRhAHEAr/WrZmqmWxrDPmrdAyp1c9UAoHKlW2+zX97BO1HGpf2uWy
 nvFTOvP/AWySESDGa4GT3m1fUSYy49dM0Hvm0d0Y5uOpgLJZv5J13noMnxiMeqLCACXP
 XmbJC+1gyWT9Go46tAhQSSz2LPgvAe61TcvI5e7tFInWHB82PditOzGcdwNvc66xqi9r
 KJfS6hOWyb1PvDqOQSVJ8ioWJc1PKA0j1RYzmnVk5Hru2tXEPQ+NZmdNXupbGIwSxDol
 OGXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792553036; x=1793157836;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=BSwQYNsi48k/Rkl4qke/KAcMT/agW+GdAMmvhqlAX6w=;
 b=m+ygbPKcWrBuGr3+Brhm5nJqB6RFzgUNuU61rE9TrRjIpQ07zrQvuhyzYRgnUWz/Cj
 3LvRO/UzeaHiCznfrHMOUzZB9nUpNXXdQ+JKyQ7yG2rQWUmisH/boyaPqlWS+1lwR8Bn
 Mwp1Jvv8cUoVNdnZBZxOHGpwXgSaR4Pgthnrb8Abmqh8uHAbcN/0iTkrHWs40z4zECNw
 glpBA6nquCqicWmzN8DwV68BLe5PtKYNqbluUt4mFwFMYs/1S1x87dWE2dcmepOUyoDs
 n+xG9KBc4Vpq3b16xON1g/4vySJvFtisKPi9UT4cVL3g+WUr2X+U/R92N0w67VdOYZ4b
 lduA==
X-Gm-Message-State: AFq9FYIwcgT6RUTpebm38OhjqE4yDRGBNwU42Ml3ihMUJd24qa7Wyzm8
 PQnVojo7Sl0owkd4kHolj/tv/wVtCLxR0TvnNS/AD7oz1TPB62RE2HrR6t/+mHjq
X-Gm-Gg: AYBFou3FBSK6VjJCpHFzjlSEUMPMkhEbFBZpsD9lloG/I/3ie4IkZOvcHFk88MQZ5JF
 d/VrWpiVOkaLVIawEYmvCy9NADXPuYZa9eyYB9SM+hwN56iQtw1SHcDAJGKRTcKM7DbBpGKD/XX
 +CnVgqp8VTjLLWaR/5bDXDaIuT6fuwH95xZY+Bt3kUrCi9XCbUhI0C8+xgPx5tOF4TRNkDuBOzm
 0kT6/tfzcB2y43UVg2AXTaatK/tiBLjFdsVS/okXPOf4LrY0/Wujzsus5uc+hQdeMTebHnt9JHs
 eHGE3rG9rLIhMil//kTmsYEuAiAlyoMlc2zksHh8pHIgGhwyOErCaR+y8B11jTdeE55S6bHX0LX
 NxHqFfH2cuYbov+mk4kfwqjvaHrQ6fqgp8Y/kHYLVMDCIXkoFTKi162vIHllORUfX3dD0jDP0ky
 NZOJA3vr+7x21aPYk74nXq9O8uMS2mAUownddK1c+Bf7L0AJNUBPyeO3+qo8H2aciKTA2tO2r3p
 5NPE8HEXMnnji6LWtPwlR2Rjpijy0Rxb7UDrjElZAI4FQwa89bdrNWgn2o=
X-Received: by 2002:a05:600c:a0b:b0:4a1:efbe:529c with SMTP id
 5b1f17b1804b1-4a1fdd2443bmr10900835e9.12.1792553036351; 
 Tue, 20 Oct 2026 20:23:56 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1fb698ce0sm45560395e9.2.2026.10.20.20.23.55
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2026 20:23:55 -0700 (PDT)
Message-ID: <6ad8304b.b27c65e7.10298d.5b29@mx.google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 21 Oct 2026 03:23:55 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-10-20
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

Autobuild statistics for 2026-10-20
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  3  |  7  |  0  | 10  |
  2026.05.x  |  1  |  1  |  0  |  2  |
  2026.08.x  |  0  |  2  |  0  |  2  |
    master   | 37  | 98  |  0  | 135 |

Classification of failures by reason for master
-----------------------------------------------

              libmodbus-3.1.12 | 12
host-gobject-introspection-... | 8 
                       unknown | 5 
                   perl-5.42.3 | 4 
    host-mender-artifact-4.4.1 | 3 
                    attr-2.6.0 | 2 
                   bird-2.15.1 | 2 
                    ccid-1.5.2 | 2 
             dahdi-linux-3.3.0 | 2 
            gdk-pixbuf-2.42.12 | 2 
            igd2-for-linux-2.2 | 2 
               libepoxy-1.5.10 | 2 
libfutils-c326ce0cc2a735438... | 2 
               linux-pam-1.7.2 | 2 
                 systemd-258.7 | 2 
               tcf-agent-1.8.0 | 2 
             batman-adv-2025.4 | 1 
                   ccrypt-1.11 | 1 
            dt-utils-2023.11.0 | 1 
                  ffmpeg-7.0.3 | 1 
                      fio-3.42 | 1 
firmware-utils-c42a3bc53da8... | 1 
                  gnupg-1.4.23 | 1 
                 haproxy-3.4.4 | 1 
hare-dbus-e9a89f8bc5ce783fa... | 1 
                 hidapi-0.15.0 | 1 
host-am335x-pru-package-5f3... | 1 
            host-gauche-0.9.12 | 1 
           host-libaio-0.3.113 | 1 
host-mxsldr-2793a657ab7a224... | 1 
host-python-types-psutil-7.... | 1 
         host-ti-cgt-pru-2.3.3 | 1 
 ibm-sw-tpm2-rev183-2026-08-26 | 1 
                  iozone-3.508 | 1 
kvmtool-7ad32e5514aca2b6d19... | 1 
      libabseil-cpp-20260817.0 | 1 
                 libclc-23.1.3 | 1 
                     mtd-2.3.1 | 1 
                  mupdf-1.23.9 | 1 
               nushell-0.108.0 | 1 
           oath-toolkit-2.6.14 | 1 
                 pixman-0.46.4 | 1 
python-remi-2022.7.27-37-g1... | 1 
python-types-python-dateuti... | 1 
                python3-3.14.8 | 1 
 qcom-db410c-firmware-1034.2.1 | 1 
                      qrtr-1.2 | 1 
rtl8189es-0a5d04114fac3c9f4... | 1 
rtl8723bu-ac3d2f564bdf6816f... | 1 
                 rtl_433-25.02 | 1 
rtmpdump-6f6bb1353fc84f4cc3... | 1 
                    runc-1.3.6 | 1 
        s6-linux-utils-2.6.2.1 | 1 
                      tar-1.35 | 1 
           uboot-tools-2026.07 | 1 
                  unifdef-2.12 | 1 
             util-linux-2.41.5 | 1 
               valgrind-3.27.1 | 1 
            vorbis-tools-1.4.3 | 1 
x264-baee400fa9ced6f5481a72... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/3d5c57b19bc70ff0116c34add50f6447223d6fc8 |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/000f1f0ff2ac3f3c04080ce9a5e0bad9d6b212af |     
  powerpc    |       batman-adv-2025.4        | NOK | https://autobuild.buildroot.org/results/c7d901b72da783e9fce041da3e692fe7ef367cd2 |     
  riscv64    |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/d71d92a93b075b1e26f227a6f83d5fc96561172e |     
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/bc3686f6d842c75e2ab97148bae539f0086d86fc |     
    i686     |           ccid-1.5.2           | NOK | https://autobuild.buildroot.org/results/7858d8c24d215e9ff1114a543bc073164d158634 | ORPH
    i686     |           ccid-1.5.2           | NOK | https://autobuild.buildroot.org/results/b5b03d37aa1a180a74efa2a01993d949063bb8c3 | ORPH
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/1f8bf7a3ec1792205e242ba8da0e4f745bb9c783 | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/7f1abe32eb99e827b22ffcd24e628f180d454276 | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/d2b47d91e5fd38f5242bc8701edd96660e573947 | ORPH
    i686     |       dt-utils-2023.11.0       | NOK | https://autobuild.buildroot.org/results/50b57e143d0d0469804bea0d84a088fca90a8c61 |     
    i686     |          ffmpeg-7.0.3          | NOK | https://autobuild.buildroot.org/results/2bda9c308bde8105418a39ed8ffa419a3580cdef |     
 microblaze  |            fio-3.42            | NOK | https://autobuild.buildroot.org/results/4e5a0ad766815c53d46f693cb0baece8bcf268c5 |     
  mips64el   | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/d470ba9de5a73ae83f46fcdbe47f6e026b3646ad |     
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/0677d85746b4bb0aa5de1b70e71cb78b30bbafdb | ORPH
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/e93501774df8008bb1bf40b3e8710dd70ba7fe93 | ORPH
    i686     |          gnupg-1.4.23          | NOK | https://autobuild.buildroot.org/results/63c3e075267e7df4a338e5667ce0b384e7b73935 | ORPH
    i686     |         haproxy-3.4.4          | NOK | https://autobuild.buildroot.org/results/eba6b68808c95f8c866fb07dd043b40de0906acb |     
   x86_64    | hare-dbus-e9a89f8bc5ce783fa... | NOK | https://autobuild.buildroot.org/results/cd599537380815267af918c443c90aee1dfd9fa9 |     
    i686     |         hidapi-0.15.0          | NOK | https://autobuild.buildroot.org/results/eba842f15d96e483e0d16b12028da2ce10dcdeb0 | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/e046daeff860189f38ccb72ee11b10f08fca41b7 |     
    m68k     |       host-gauche-0.9.12       | NOK | https://autobuild.buildroot.org/results/44baf20086b40b458900381a49185c6e48a5fe18 |     
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c6a1ea85501601fcd53d0767da8c9f958f46087a | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/77b157abafe9cb6fee20c7ab3fc70f1b4951af32 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b2ac78a75b512d1e8a4dc69493ac92f842b3cf7b | ORPH
  riscv64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/283504e2ef31934225681b7f111f11823af3e149 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/cc033d93cf8f69316f4966e4a1f7af3a037e23a1 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/df48804ac4e67c776be4bad416ff040bec92fc9f | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5071edc43da1a9996aa2665af1baeaf4c3cd823d | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b0fa101f9ff769390663eccabe7879e172359b15 | ORPH
    i686     |      host-libaio-0.3.113       | NOK | https://autobuild.buildroot.org/results/b1c7f89c9c9d2a249090f91b8a0c6cefc829da26 | ORPH
  riscv64    |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/90237851bf1517230c0c58d04daf0bc48c1ba561 |     
    i686     |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/82a72b92c99ae752da5f6580719ca457551afce4 |     
  riscv64    |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/3651449d3fa7cbc5493ca61ec01f5f4a6a2bcb45 |     
   armeb     | host-mxsldr-2793a657ab7a224... | NOK | https://autobuild.buildroot.org/results/07231326c820964cd7336b0dbd78eb5641ca6e88 |     
    i686     | host-python-types-psutil-7.... | NOK | https://autobuild.buildroot.org/results/c926f72993a14766e780a79b28798d4e8dfd17f6 |     
    arm      |     host-ti-cgt-pru-2.3.3      | NOK | https://autobuild.buildroot.org/results/e66b793087e161e41bf8bc0d74e1c5da5a6b249a |     
    i686     | ibm-sw-tpm2-rev183-2026-08-26  | NOK | https://autobuild.buildroot.org/results/fc11752709d882b817690993b7f8899c5e500560 |     
  mips64el   |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/ab7a054fbc0ef0cb66c7b2cfe1743b66dc3a4cac |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/0551440a094405331efc06940451a4c8670c111a |     
  aarch64    |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/fb2a595f850f9ac05d9fd48ceaec2d8bc66445a9 |     
   armeb     | kvmtool-7ad32e5514aca2b6d19... | NOK | https://autobuild.buildroot.org/results/1d9ff70c6595cc48a199894fde6fdc47b53470d4 | ORPH
    i686     |    libabseil-cpp-20260817.0    | NOK | https://autobuild.buildroot.org/results/669e84311e6b78255ac50c836c8bc9496cd3b5df |     
    i686     |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/a9fbf9345ad09b86b1f5af1c8a98a7b56ab8d40f |     
   x86_64    |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/d0794a4d7e9646a864cccac1001eb473928bcf0d |     
    i686     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/3aa76d39467331231ccaec4765842e6f89c63502 |     
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/3f053497bb36cc0eece4770ed18b341a14ae8901 |     
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/8907718df377fed1d9f6cc6fb8c49c1c3b9ba348 |     
  aarch64    |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/a88d104a3bef11fe8e1c786c39bfd68f09679a91 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/79e61b179a7ce679d4463d24013210dfc52b7d89 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/e96067277daf92e5e8727fca58bea41504ed3b7a |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/297b1b898b8227732a78769e84ab4e3d6c36aada |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/fee2eb1eef40ecf20f122a783877024a84816abc |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/c73cb3304281710b2de4df4373e8afe9cd398eb9 |     
  mips64el   |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/22608826151b7e6a2883899072429185fe323a0f |     
  aarch64    |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/be1016b3177a61b80d66cf1dbe0e77eba60f24a5 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/421c8dae3b80edc948d8fc016dd97b16abe0645f |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/63f0bf0521dafeb95392650ac04f395234bf8bfb |     
  riscv64    |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/950f93ad34fc2ebe371aaa0a4f74de2567e158cc |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/deec8ec5a7da75f508f2c993df97e664cd14154a |     
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/0b84bfd9654b7e8fbd9c06d734b0ae72a4bc91b3 | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/4022073b6ab4b0c6ff7c26719dd52a47b30c61aa | ORPH
  riscv64    |           mtd-2.3.1            | NOK | https://autobuild.buildroot.org/results/c00dbd2fd75511480c029060d82b5ce10f09789b |     
  aarch64    |          mupdf-1.23.9          | NOK | https://autobuild.buildroot.org/results/7b571dae88e48dbef9b0493c441ae17531c7a10d |     
    i586     |        nushell-0.108.0         | NOK | https://autobuild.buildroot.org/results/72cee9e060bfd7b89e59ddb76d8d06f2ef49776d | ORPH
    i686     |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/f74e6601ad441a227db6423da7c2146ad3e5014e |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/1cc4a5396f59c4938cfb139898ccfa4c1e9cb1d6 |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/ca6332470f658d924e581fb5dcd8c3a663c345ce |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/75f33386c3df9e9aa6ac6be4ac3ecc73e410822f |     
    i586     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/4237f2c7e06760818f1d9117e73e6282fe6888e9 |     
  riscv64    |         pixman-0.46.4          | NOK | https://autobuild.buildroot.org/results/339b85a7f3129679bda3fb2207aa470d5fbdeb72 | ORPH
    i686     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/5ac1743e94856ef49788febc8f9c7961946ab37b |     
    i686     | python-types-python-dateuti... | NOK | https://autobuild.buildroot.org/results/968f091a5df388d3ffaadd6b034553d7d005fa3f |     
    i686     |         python3-3.14.8         | NOK | https://autobuild.buildroot.org/results/8fa1d359edba81663967fbce90b7e610c7424790 |     
    i686     | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/9cdd3331cb10e20a48f9ef198ba5cac7a2540bfb |     
    i686     |            qrtr-1.2            | NOK | https://autobuild.buildroot.org/results/d5f669f99f72ee68433bc8a1b1197594f46e8882 |     
    i686     | rtl8189es-0a5d04114fac3c9f4... | NOK | https://autobuild.buildroot.org/results/c893e14ca5d122dcc14f72c4027f352866e30cae |     
    i686     | rtl8723bu-ac3d2f564bdf6816f... | NOK | https://autobuild.buildroot.org/results/1314c7321d1b7c47c25aa8dc9fbd7d79989b6996 |     
  mips64el   |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/9277d54e6245820c2a8a986ab8bd42d2f6f61fac |     
   x86_64    | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/44e6d557bbdd4b1bd0c99def80e6e42afac6e54f |     
  riscv64    |           runc-1.3.6           | NOK | https://autobuild.buildroot.org/results/462437c2c40ed19a05df819b735879bfe8369963 |     
    arc      |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/30793fab1849f78bef0d32c0e66c75d33c6448c6 |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/6acf507199e630909d7f236998141aaefc20637e |     
  aarch64    |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/8be2e47295734084a565aa371f3356f982419987 |     
    i686     |            tar-1.35            | NOK | https://autobuild.buildroot.org/results/9747db312e2bc2f2aabd29f000e7fa69a192889f | ORPH
    arm      |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/dac75cec94cd4a4f64b7c601167a7bf79dd41689 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/4006bc59afe916cb3159fee02371888a4bb1177c |     
    i586     |      uboot-tools-2026.07       | NOK | https://autobuild.buildroot.org/results/f074edf4487518f865f0cb12d453221dae674e60 | ORPH
   x86_64    |          unifdef-2.12          | NOK | https://autobuild.buildroot.org/results/9e2f228f52172a45989622359775d740134656a7 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/2f7e7b9c19f67091d17e603106341fe11ea1f159 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/18d2cb9e884159e8741820da13ec572f98fede5f |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/3216b779db00b43e051ab7aa1d8bce13de65f588 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/7db61ca0dbd3b4e6b96d90f7b26324920262c7a2 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/d833b7e8cade1fd93f991a7a10de9add38cb7541 |     
    i686     |       util-linux-2.41.5        | NOK | https://autobuild.buildroot.org/results/5820b379171dbfc4f0fc7debde6228087ca350c4 |     
    i686     |        valgrind-3.27.1         | NOK | https://autobuild.buildroot.org/results/33263a9460ef2a32bd64c5550743aa4cb0d07db3 | ORPH
    i686     |       vorbis-tools-1.4.3       | NOK | https://autobuild.buildroot.org/results/55fa3829d7c77e3edaaf765f0f9a40ed6f1767bd | ORPH
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/f7035f61c642e48af2d704d6e40a1907b33f5061 |     


Classification of failures by reason for 2026.08.x
--------------------------------------------------

               tcf-agent-1.8.0 | 1 
toolchain-external-bootlin-... | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/52b606cc43ea2deb4c8a376f446460b8f56fedd1 |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/7902456c56433f2beaccd1380ed052bb31409c5b |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

make: *** Waiting for unfin... | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     | make: *** Waiting for unfin... | NOK | https://autobuild.buildroot.org/results/a6848baaf4b55f8eeeeeed0e61f50694644713ae |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

host-netsurf-buildsystem-75... | 1 
                  iozone-3.508 | 1 
     linux-5.10.246-cip66-rt29 | 1 
                memtest86-7.20 | 1 
              ntfs-3g-2026.7.7 | 1 
python-remi-2022.7.27-37-g1... | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     | host-netsurf-buildsystem-75... | NOK | https://autobuild.buildroot.org/results/d5bcf58fd9ddd01178901ada207c51edba371ad0 | ORPH
   arceb     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/ddb962cfdf5481da74c74c5a86a186bf42283f64 |     
  sparc64    |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/2deed8443f08391ed0e57531e73c862a6b38675c | ORPH
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/a1c2a43d60a1b94dc39a124291ccd2bb4844ee5a |     
    i686     |        ntfs-3g-2026.7.7        | NOK | https://autobuild.buildroot.org/results/2447a4bf45db9adf79906a5056295d2c60baa53c | ORPH
    i686     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/f1331929029cb3e754db0be0ea20504a07b52d16 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/47eacf7dd66889e0704807c1e27736b8af975f1e |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
