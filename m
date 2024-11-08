Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5312CD5E127
	for <buildroot@archiver.kernel.org>; Fri,  8 Nov 2024 04:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA0E68407E;
	Fri,  8 Nov 2024 04:14:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NDqjoCEtDX1J; Fri,  8 Nov 2024 04:14:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1D0E83EAA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1D0E83EAA;
	Fri,  8 Nov 2024 04:14:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C03AC2
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 04:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5BF3140A62
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 04:14:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TwVlS-TRLpHc for <buildroot@buildroot.org>;
 Fri,  8 Nov 2024 04:14:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2A8B740128
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A8B740128
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A8B740128
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 04:14:23 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5cec93719ccso2143079a12.2
 for <buildroot@buildroot.org>; Thu, 07 Nov 2024 20:14:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731039262; x=1731644062;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UlbgdZV3vjmkcT2Jk1q8LJosyET2ncuPR5xFa6sJ4mY=;
 b=xPpXTUeTYDYJiPwrcIaWTNzd7fk2FIk/KXdTyiqvhUY7gmTPJwNygXdyP+midPrp+v
 mOhpXgdLAN8oLktusHSROXIc2FBwWp/WR++dr2U0bfHMkYc8+Nuu7bUEb8BuigZsdkGi
 KHu22tgAHBKiWsWw32JOWG0u33saJMtnbih6zlc70Zq1kGBB8q/S1erir/XCSDfvpZUL
 +RTvKxU+9cqdRW1UCm7+YX00lvnwoUFxT9YYVdActuID1wDVCHr0sLvyrgihHpiXBi5Y
 73l6stOC97DSHhEmy7M2XOemVGUZgqIcP5Mcv2jyCGRrPqvx6wQXk1xSBt/JPRRTeUey
 4uzw==
X-Gm-Message-State: AOJu0YwDguabZ/6HSfuD2u/XmJcKdc+rg6AC1E1FiqrJPS9WslxNt1Fy
 BvfsTEc6TOmSEvI2jtZ71tyF3yb6AOT6QsH/91qzKWXSnyJ/I+9CKs7/oQ==
X-Google-Smtp-Source: AGHT+IFwi6lVXKpuoZr2PA+GWekJ7Otw4qDxMfcC/UatUqfUZGbt5j4kWl0O8cC9kdkECpkuPTNjgg==
X-Received: by 2002:a17:907:2d0c:b0:a9a:7f87:904b with SMTP id
 a640c23a62f3a-a9eeff44762mr106670366b.29.1731039261746; 
 Thu, 07 Nov 2024 20:14:21 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0dc533bsm182232466b.114.2024.11.07.20.14.21
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2024 20:14:21 -0800 (PST)
Message-ID: <672d901d.170a0220.b86b5.59b7@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 08 Nov 2024 04:14:21 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731039262; x=1731644062; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=UlbgdZV3vjmkcT2Jk1q8LJosyET2ncuPR5xFa6sJ4mY=;
 b=ilmTVCpO7xVMnfVONltZIj1Af73lhu/OSTFGHRHPJFIwfFK4Nos2RRWBza9Tay/7Cv
 v93e9dSfD7k+9YiLrAhAio80Mtse/adf1sKDuh9e8e/JlfYY34FBpYczw38HOY/86vhX
 wcZs8oh82YlcGSKMJZ6KqWH7s8yJ6j0ew18YfnWsy4nPXE+2OokVDnrJgXcSRDdZ9DV1
 hG4a6tZRpuCSLfpXb8odP6l8Lua7nwc2nxGo9jw6rgA+rwyAztcLcgL6ZIvoZ50IuWYw
 Ju2PjdXAYQ9n6HR8M6TASQhHfCurWXh6cKiJ69XRrRM4hG7g4sJha5tHWr4UI5OcZG0Z
 Vtdg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ilmTVCpO
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2024-11-07
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

Autobuild statistics for 2024-11-07
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  3  |  3  |  0  |  6  |
  2024.08.x  |  0  |  4  |  0  |  4  |
    master   | 12  | 81  |  2  | 95  |

Classification of failures by reason for master
-----------------------------------------------

 ibm-sw-tpm2-rev183-2024-03-27 | 6 
                lmbench-3.0-a9 | 6 
                  linux-6.11.6 | 4 
  gobject-introspection-1.76.1 | 3 
           at-spi2-core-2.50.0 | 2 
                  curlpp-0.8.1 | 2 
                   cvs-1.12.13 | 2 
             dahdi-linux-3.3.0 | 2 
                  ffmpeg-6.1.2 | 2 
         gobject-introspection | 2 
                   grpc-1.51.1 | 2 
         host-libxcrypt-4.4.36 | 2 
    host-python-greenlet-3.1.1 | 2 
                   perl-5.40.0 | 2 
               procps-ng-4.0.4 | 2 
             util-linux-2.40.2 | 2 
               valgrind-3.23.0 | 2 
android-tools-4.2.2+git2013... | 1 
                  bcusdk-0.0.5 | 1 
                 coreutils-9.5 | 1 
                directfb-1.7.7 | 1 
            ecryptfs-utils-111 | 1 
                     exim-4.98 | 1 
                   foot-1.16.2 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
              gcc-final-13.3.0 | 1 
glibc-2.40-18-g564178076272... | 1 
            host-binutils-2.42 | 1 
host-binutils-bare-metal-2.... | 1 
         host-gcc-final-13.3.0 | 1 
              host-rust-1.82.0 | 1 
httping-0e26c53d5fe504eb720... | 1 
                latencytop-0.5 | 1 
             libargtable2-2.13 | 1 
libdbi-drivers-0bfae6c43134... | 1 
               libgtk3-3.24.43 | 1 
                  libnss-3.106 | 1 
                  libva-2.22.0 | 1 
          linux-5.10.162-cip24 | 1 
            linux-fusion-9.0.3 | 1 
               linux-pam-1.6.1 | 1 
                 logsurfer-1.8 | 1 
           oath-toolkit-2.6.12 | 1 
          obsidian-cursors-1.0 | 1 
               openblas-0.3.28 | 1 
                 pixman-0.42.2 | 1 
                    pppd-2.5.1 | 1 
               pulseaudio-17.0 | 1 
      python-autocommand-2.2.2 | 1 
                 rtptools-1.22 | 1 
                  scrypt-1.3.2 | 1 
                   swipl-9.2.8 | 1 
                       unknown | 1 
           v4l2loopback-0.13.2 | 1 
                    wipe-2.3.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/9f69cc3d4d6808d8d84fc14e59e989ee70e35294 |     
    mips     |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/dbf69f3a0c00d473888d6599da0efee573bba8c4 |     
  mips64el   |      at-spi2-core-2.50.0       | NOK | https://autobuild.buildroot.org/results/1045575f02d0dcea607eb71a912214859d235998 |     
    arc      |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/ce7478acac5da5ec517820faf46cdcaccb6384c2 |     
    sh4      |         coreutils-9.5          | NOK | https://autobuild.buildroot.org/results/ece4788c9f5847a6f58460fb7f588bde2617e0d6 | ORPH
   s390x     |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/cba088b0488180e3c0dd31725b811151012b1703 |     
 powerpc64   |          curlpp-0.8.1          | NOK | https://autobuild.buildroot.org/results/c18828431ff096a3fac7c011a012b28340f0ee9d |     
    m68k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/e7b881a32a8f16b9dc9f319fa392197da02aa04b | ORPH
 powerpc64   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/180bc8fce73c35fc7b981fbae345cd135d30f41b | ORPH
  riscv32    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/7c378de37ab67914f72fe5fd3f39a89e126a3bcc |     
   nios2     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/5b7f99df6f386733dbcfa7efbd913b96f7dfb27e |     
   arceb     |         directfb-1.7.7         | NOK | https://autobuild.buildroot.org/results/c47742ca1f545efba364de09e53416ab6593322c | ORPH
 powerpc64   |       ecryptfs-utils-111       | NOK | https://autobuild.buildroot.org/results/3d63090e43ffa6ce2805cd8539d39f8449f83424 |     
   s390x     |           exim-4.98            | NOK | https://autobuild.buildroot.org/results/fe88ccee423ed7b20bd8f25a0293d9adc6b9be01 |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/e08d27dd0eb051f502b727f77ef91dfbeccdef94 |     
   arceb     |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/d9820e0b2508d7cf7d9ea18626b3adda04617e9d |     
   nios2     |          foot-1.16.2           | NOK | https://autobuild.buildroot.org/results/667d358f28883b73ea5196f1dcac93a67f84ec7f |     
    or1k     | fs/jffs2/jffs2.mk:71: /home... | NOK | https://autobuild.buildroot.org/results/d3fba2c706f8b9658f7118832d680750e7c356a7 |     
  powerpc    |        gcc-final-13.3.0        | NOK | https://autobuild.buildroot.org/results/33a704e9bcf25fdada2b2de6cc462ec1f68f583a |     
   arceb     | glibc-2.40-18-g564178076272... | NOK | https://autobuild.buildroot.org/results/b3ceb377a79678ab7e7cf1dcf39401870f13c573 |     
microblazeel |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/992c248c247097a963a169697b3a42a0db036edf |     
 microblaze  |     gobject-introspection      | TIM | https://autobuild.buildroot.org/results/ea5301a4a26227567c43ce39dd03bc3cda47bd48 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/673cea68b1c60d70fbddd620b96982f326fc6d5d | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/f0cbc0b0ee48d4fdc79d82d2a54654d7f67be3d3 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/e8f9c029b6400a98eaa03b9dafe27acd6ae2d1ba | ORPH
  aarch64    |          grpc-1.51.1           | NOK | https://autobuild.buildroot.org/results/19d5bf68a78bbe433202a94e24437478f5968f47 |     
   x86_64    |          grpc-1.51.1           | NOK | https://autobuild.buildroot.org/results/f97074bdf5c45bbf612860750e9050cd748c7b83 |     
  sparc64    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/e887b196bc954d2a65388b2cffab7ec8df6e5bd8 |     
   mipsel    | host-binutils-bare-metal-2.... | NOK | https://autobuild.buildroot.org/results/a539229ddea55540b09903bbb351dd0795ffdb54 |     
   arceb     |     host-gcc-final-13.3.0      | NOK | https://autobuild.buildroot.org/results/b5b301a047bc817a7046b8043e091e8becfd68d3 |     
  aarch64    |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/6c058f237cac3dbe4c78ec33395776cf57c754f5 |     
  sparc64    |     host-libxcrypt-4.4.36      | NOK | https://autobuild.buildroot.org/results/424a946f2f31cd86c57ab7fbb380a5858b041fe8 |     
    arm      |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/8451f361d541218e74cf8129292f6e0fa534e40d |     
   sh4eb     |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/127691284ae91c4846fc3a617359c00762ae1202 |     
  sparc64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/dc4f6fb6c79420ecb7255221f260b6abf0a7dbf7 |     
 powerpc64   | httping-0e26c53d5fe504eb720... | NOK | https://autobuild.buildroot.org/results/ee69ef5a7652d0e52599d826d2d1f80926c8a05f |     
   sparc     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/96e2c56f0ee3d25b751ad9d85394b21a26969b6e |     
    i686     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/86b6a6158799a6d4c86ed13d5657a974d0062484 |     
  sparc64    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/06b1565355cc933df88ffce41cdce0fdb3d8be7b |     
   mips64    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/df7afa91b61405e369c8ce942179ae36ecdc7f55 |     
  riscv64    | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/46095d1d516ad440c92eeb86204cb4d59fc8b91a |     
    or1k     | ibm-sw-tpm2-rev183-2024-03-27  | NOK | https://autobuild.buildroot.org/results/94a4732bdf416b0ccf27c63e90381c91c1cdba1a |     
   armeb     |         latencytop-0.5         | NOK | https://autobuild.buildroot.org/results/416cead5dda1b4d1a67cf558fe871d3a06852af7 | ORPH
  sparc64    |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/8bed96bd269831d6df9ca33aff85d9c154153777 | ORPH
    arc      | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/b3f5be85861114d15ee537b3e83a583046ff210b |     
   mipsel    |        libgtk3-3.24.43         | NOK | https://autobuild.buildroot.org/results/f33045b93af6a02df23f1507e3957e06b2bebb51 |     
   mips64    |          libnss-3.106          | NOK | https://autobuild.buildroot.org/results/9ab97cb7b091c6b998f245fb843479094369bb3d |     
  riscv64    |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/1f8b92ac9bab30b8e7492a190c07ae5f59ec7174 |     
   armeb     |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/73557420a15fed28cb884a4cedb0f7fb2872a837 | ORPH
   x86_64    |          linux-6.11.6          | NOK | https://autobuild.buildroot.org/results/af4dfdef6e1f1e862a1f997ab1663aac798ba388 | ORPH
    m68k     |          linux-6.11.6          | NOK | https://autobuild.buildroot.org/results/270670a1edf9e414ebba6ba83d35dc907b6a9e62 | ORPH
   sh4aeb    |          linux-6.11.6          | NOK | https://autobuild.buildroot.org/results/31ca3ce548491e5bad58432266a489069b944506 | ORPH
powerpc64le  |          linux-6.11.6          | NOK | https://autobuild.buildroot.org/results/429863ba7aee3ce8cd4101e3fb101ce4946250d0 | ORPH
   sparc     |       linux-fusion-9.0.3       | NOK | https://autobuild.buildroot.org/results/634a9bf05890cac4c5430b931dd73898cc881b53 | ORPH
    arm      |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/6bae12d53e30af29ac97b38453a7b673cee543e9 | ORPH
   arceb     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/ed2fe79d1e231d9ef45bd6a50c62c29aceea6669 | ORPH
    arm      |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/9354443a699c38911d5ffffb8c284d25e660e756 | ORPH
   s390x     |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/a0b2c872c5691ca358e14f37692ed471748629bc | ORPH
microblazeel |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/a5ef2b6226bae076346e365c988628d9b63f6494 | ORPH
 powerpc64   |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/01afbae021f2005bce2b955b862b217bc8c860d8 | ORPH
powerpc64le  |         lmbench-3.0-a9         | NOK | https://autobuild.buildroot.org/results/2e278787dfd86eb765e2a3d962cb3993eb60e77b | ORPH
    sh4a     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/1cfe3b72839a95ff199c2e936c6c0e5364e11080 |     
   sh4aeb    |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/7490ff6f45f90f52be0a4316af7efcc3dbba9d63 |     
    m68k     |      obsidian-cursors-1.0      | NOK | https://autobuild.buildroot.org/results/8ebd5b250fae7aca88c8f34d2cce4197fee79a38 | ORPH
  mips64el   |        openblas-0.3.28         | NOK | https://autobuild.buildroot.org/results/9706f51e2e7502f134b1118390e66cdefc8c19c9 |     
    mips     |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/cc83f2b3727e2514ad9be142d028f99fae2a4992 |     
    arc      |          perl-5.40.0           | NOK | https://autobuild.buildroot.org/results/a47704d72cb21b9993cbe0f53c14b6b69148b162 |     
    or1k     |         pixman-0.42.2          | NOK | https://autobuild.buildroot.org/results/6b4138f2fb99337544f6d99bfe4c42c410676c61 | ORPH
    arc      |           pppd-2.5.1           | NOK | https://autobuild.buildroot.org/results/6cc0d5ff55209a889e060b19ec0378b19a61027b |     
    arc      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/e8eb422d783b32d19dd6b0e563053a1822002e4c | ORPH
    arc      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/bb7d5428d14a6dd44ed6c4f53a1b65642225508e | ORPH
   nios2     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/5f4aa0e14e566a0e43fcdbe52da424409be65cf3 | ORPH
 aarch64_be  |    python-autocommand-2.2.2    | NOK | https://autobuild.buildroot.org/results/3e9b40bd880b1355ced67b08b27f3f40860c8189 |     
 powerpc64   |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/9e8090f2747d133122da2ece217b746877dfce7f | ORPH
 aarch64_be  |          scrypt-1.3.2          | NOK | https://autobuild.buildroot.org/results/d293ce3a6eea577482f3db37afe4e59f9e2dd457 |     
    m68k     |          swipl-9.2.8           | NOK | https://autobuild.buildroot.org/results/68553fb358b2a56229f118d4126922c04eb72fc7 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/3aba92c33113c9a1dfcbcdc8a45a189f2c019c3b |     
  riscv64    |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/63fb700309493fdf3cca0182ddac31209ad2d80e | ORPH
   armeb     |       util-linux-2.40.2        | NOK | https://autobuild.buildroot.org/results/2c893df718877d0eb3bd0b4b3b0b8c2f2e9a0fc4 | ORPH
   sh4eb     |      v4l2loopback-0.13.2       | NOK | https://autobuild.buildroot.org/results/2b8b460a6328bc1657b84cdf36c2f758a58d0cf4 |     
    i686     |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/b8352034db3d36bd214834cb5d7601f8107c1785 | ORPH
   mips64    |        valgrind-3.23.0         | NOK | https://autobuild.buildroot.org/results/cc4f2437d8a505f279420e0c1018776f796af107 | ORPH
    m68k     |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/68f845f27371fc266ff95b962a0366fc17956bff | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

           babeld-babeld-1.9.2 | 1 
                  bind-9.18.28 | 1 
                  linux-6.6.56 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |      babeld-babeld-1.9.2       | NOK | https://autobuild.buildroot.org/results/6952aacbc20622211e64f714c42c921f24d862a8 |     
    i686     |          bind-9.18.28          | NOK | https://autobuild.buildroot.org/results/35ec4942fa7f1bb291ce9a051a2c669c7962eed5 | ORPH
    or1k     |          linux-6.6.56          | NOK | https://autobuild.buildroot.org/results/722597a142a7d8c95bf8af52848591c4b7663cbb | ORPH


Classification of failures by reason for 2024.08.x
--------------------------------------------------

  gobject-introspection-1.76.1 | 1 
              host-rust-1.79.0 | 1 
                 linux-6.10.14 | 1 
               procps-ng-4.0.4 | 1 


Detail of failures for 2024.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |  gobject-introspection-1.76.1  | NOK | https://autobuild.buildroot.org/results/a3fa563c487e4547a8c9df7c045f39bbf2d24099 | ORPH
   x86_64    |        host-rust-1.79.0        | NOK | https://autobuild.buildroot.org/results/39cd727ab80b5059c05511dbac5ac75fd8d8da7c |     
  powerpc    |         linux-6.10.14          | NOK | https://autobuild.buildroot.org/results/b2a51fb1adfdbdc2d0a12bf0b083f8486f977152 | ORPH
    sh4      |        procps-ng-4.0.4         | NOK | https://autobuild.buildroot.org/results/f472bf2be54729f952c79418527f5f10ee05ef5a | ORPH


Gitlab CI results for 2024-11-07
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                 arcturus_ucp1020 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8289664876  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/8289664910  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/8289664912  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/8289664915  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/8289664920  |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/8289664929  |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/8289664935  |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/8289664938  |      
   atmel_sama5d2_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/8289664944  |      
       atmel_sama5d3_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/8289664952  |      
   atmel_sama5d3_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/8289664961  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/8289664962  |      
       atmel_sama5d4_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/8289664969  |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/8289664972  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/8289664983  | ORPH 
                   beaglebone_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8289664988  |      
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8289664997  |      
                     canaan_kd233 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8289665001  |      
                  chromebook_snow | https://gitlab.com/buildroot.org/buildroot/-/jobs/8289665009  |      
                             ci20 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8289665010  |      
                      cubieboard2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8289665014  |      
            engicam_imx6qdl_icore | https://gitlab.com/buildroot.org/buildroot/-/jobs/8289665016  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8289665017  |      
        engicam_imx6qdl_icore_rqs | https://gitlab.com/buildroot.org/buildroot/-/jobs/8289665019  |      
              engicam_imx6ul_geam | https://gitlab.com/buildroot.org/buildroot/-/jobs/8289665020  |      
             engicam_imx6ul_isiot | https://gitlab.com/buildroot.org/buildroot/-/jobs/8289665021  |      
           friendlyarm_nanopi_r2s | https://gitlab.com/buildroot.org/buildroot/-/jobs/8289665077  |      
                 imx6-sabresd_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8289665099  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/8289665130  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/8289665155  |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/8289665160  |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/8289665167  |      
      microchip_sama7g5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/8289665170  |      
              octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/8289665226  |      
              octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/8289665229  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8289665240  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8289665282  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/8289665288  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/8289665324  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/8289665433  | ORPH 
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8289665449  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8289665454  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8289665457  |      
             sipeed_licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/8289665468  |      
                  sipeed_maix_bit | https://gitlab.com/buildroot.org/buildroot/-/jobs/8289665469  |      
           sipeed_maix_bit_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8289665471  |      
                 sipeed_maix_dock | https://gitlab.com/buildroot.org/buildroot/-/jobs/8289665473  |      
          sipeed_maix_dock_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8289665475  |      
                   sipeed_maix_go | https://gitlab.com/buildroot.org/buildroot/-/jobs/8289665476  |      
            sipeed_maix_go_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8289665478  |      
                 sipeed_maixduino | https://gitlab.com/buildroot.org/buildroot/-/jobs/8289665481  |      
          sipeed_maixduino_sdcard | https://gitlab.com/buildroot.org/buildroot/-/jobs/8289665482  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8289665490  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8289665526  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8289665527  | ORPH 
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/8289665531  |      



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
