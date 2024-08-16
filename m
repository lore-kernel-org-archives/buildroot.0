Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D8CC3DA4A
	for <buildroot@archiver.kernel.org>; Fri, 16 Aug 2024 05:47:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B353881ED6;
	Fri, 16 Aug 2024 05:47:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LrHmCV29-Q_g; Fri, 16 Aug 2024 05:47:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E4E3840C1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E4E3840C1;
	Fri, 16 Aug 2024 05:47:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D1ECF1BF4D5
 for <buildroot@lists.busybox.net>; Fri, 16 Aug 2024 05:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BEC39400E5
 for <buildroot@lists.busybox.net>; Fri, 16 Aug 2024 05:47:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dAHon0wacwz2 for <buildroot@lists.busybox.net>;
 Fri, 16 Aug 2024 05:47:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 51E5B40003
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51E5B40003
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 51E5B40003
 for <buildroot@buildroot.org>; Fri, 16 Aug 2024 05:47:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5091FC0009
 for <buildroot@buildroot.org>; Fri, 16 Aug 2024 05:47:33 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 16 Aug 2024 05:47:33 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1723787253; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xF6AaE7oTRggSOe66tZjC2Gk/BKSaGQG/XaE7mJZTWE=;
 b=XSHcKcS9w9/ZSuba78Xu7zHMl2ArV5kPqpE1KO6TzRPyv0UhjaH4Y4Cnz7O5HnPKAlYXA5
 ludrtGosMLBC+D04rU9tqYjbFKdz4AW2W4ymLzaFAhawMabqkoKUR2UxnG+zJqVeBygdOu
 x/SkGHxTWNoQuRDcLr4cYz9023gZBWMYBitJL+fIORlbexI50FYu9ETjg7gfBvZlf+RRDR
 aknbtgrYlSlZizB00wYZd3pd12vXTypROZVlrVsjBMAJRHlFN8oLr4tgwMxq5RNRaDsq6B
 7efplKxXha05Jv5T6/qVzQMbJ3vmEA+ou5Imx+ZAf9N89p1nMNgZuivw6aPMbQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XSHcKcS9
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-08-15
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>
Message-ID: <20240816054733.EWipBTwo71gqz8zVAK7T46SdwhnUt3ma06s4Ije-Wl4@z>

Hello,

Autobuild statistics for 2024-08-15
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  4  |  5  |  0  |  9  |
  2024.05.x  |  6  |  8  |  0  | 14  |
    master   | 57  | 64  |  1  | 122 |
     next    |  3  |  6  |  0  |  9  |

Classification of failures by reason for master
-----------------------------------------------

                  ffmpeg-6.1.2 | 6 
host-go-bootstrap-stage1-1.... | 5 
                gnu-efi-3.0.18 | 4 
               procps-ng-4.0.4 | 4 
                     avahi-0.8 | 3 
                  libffi-3.4.6 | 3 
 host-softether-4.30-9700-beta | 2 
          linux-5.10.162-cip24 | 2 
                  linux-6.10.3 | 2 
              bubblewrap-0.9.0 | 1 
                  cairo-1.18.0 | 1 
                    fcft-3.1.6 | 1 
                      fd-9.0.0 | 1 
                   foot-1.16.2 | 1 
       freeradius-server-3.2.3 | 1 
                gerbera-1.12.1 | 1 
         gobject-introspection | 1 
  gobject-introspection-1.76.1 | 1 
               gocryptfs-2.3.2 | 1 
                 hddtemp-0.4.3 | 1 
            host-binutils-2.42 | 1 
host-heimdal-f4faaeaba371ff... | 1 
           host-librsvg-2.50.9 | 1 
         host-libxcrypt-4.4.36 | 1 
              host-rust-1.79.0 | 1 
                  ledmon-1.0.0 | 1 
                 libp11-0.4.12 | 1 
                  libsepol-3.6 | 1 
               mariadb-10.11.6 | 1 
                memtest86-6.20 | 1 
                    mpv-0.35.1 | 1 
                  nginx-1.26.1 | 1 
                    norm-1.5.8 | 1 
                  ntp-4.2.8p18 | 1 
               openblas-0.3.27 | 1 
                 openssh-9.8p1 | 1 
                pinentry-1.3.1 | 1 
         python-remi-2022.7.27 | 1 
             sofia-sip-1.13.17 | 1 
                   swipl-9.2.6 | 1 
                       unknown | 1 
               valgrind-3.23.0 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/d6d361d63451f4e1340817da9061c0add43d5fcc | ORPH
    sh4      |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/43fe8978750d0df87f85cdb8ce76cc0f4a8d89d3 | ORPH
   mipsel    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/d29bcadce34cf747f6af061aa2e30cb3b7408e28 | ORPH
microblazeel |        bubblewrap-0.9.0        | NOK | http://autobuild.buildroot.net/results/126a9239914672bd7dbd061b6c1cf61a3062b5ad |     
   armeb     |          cairo-1.18.0          | NOK | http://autobuild.buildroot.net/results/61e6c024514e7b85bd2d025fe04e86ef4f46c94c |     
 aarch64_be  |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/e8460e0c5e7bd25d8dcac5a9dfdd3fd91147cbcc |     
   x86_64    |            fd-9.0.0            | NOK | http://autobuild.buildroot.net/results/5392cebcdb484e03149b4b0219b8ede252d82a32 |     
microblazeel |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.net/results/524cef193aec30471e55eb0eecfa39f0d6011a91 |     
 microblaze  |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.net/results/3a4238cbd3b0ad3817a62dfd3ee40b36618a7e04 |     
 microblaze  |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.net/results/db7a40a08105ab4006cb04b228bee7982ed03c70 |     
microblazeel |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.net/results/d350d594631e94558770c8ef5a105a74c6c9a163 |     
    arc      |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.net/results/9c795769281d0d21368f71ddee13f32e34974e8a |     
  aarch64    |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.net/results/53be750f7dd85a2918234c1109d979973fdaad32 |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/18d54a9ee8b47e05256c0c9e12ff12c4c95c34e3 |     
   nios2     |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/14505543421eb8a4ebb8a0e326b6cde7dc8cfaba |     
  aarch64    |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/2af6800400c86b2d2639886535a1a1145551aaee |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/9f84a278ad08ddec413275d8faf9e6f949ba87e2 |     
 aarch64_be  |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/fd975cc832ab1fa6f2032b2c0db17f2693c5b3ab |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/996e922bcb781ad7bf48d0b9a58e554da8094927 |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/a61306b100381c37a089d4d5e0e43493f29aa6e3 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/33c724f18bd7124a9e8cd026cfc5f92dc65b82f7 |     
  powerpc    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/1d6fa7128379463769b5e7c18fe0c5d57ee3cc57 | ORPH
  riscv64    |        gocryptfs-2.3.2         | NOK | http://autobuild.buildroot.net/results/b8e2910ea147b10dc31c0a479969e9a1eced6173 |     
   nios2     |         hddtemp-0.4.3          | NOK | http://autobuild.buildroot.net/results/ea2e931ea46e225a878fb3a369726efbbec9f40d |     
   nios2     |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/fdf30c842ce17f01e539bcd453a29bad900e7b0e |     
   arceb     | host-go-bootstrap-stage1-1.... | NOK | http://autobuild.buildroot.net/results/46e4fd36033d8d9e789b47a4081f87794e7cb736 |     
   s390x     | host-go-bootstrap-stage1-1.... | NOK | http://autobuild.buildroot.net/results/25556dae7c05a6afb57e0ded33d795c85b2191e9 |     
   x86_64    | host-go-bootstrap-stage1-1.... | NOK | http://autobuild.buildroot.net/results/1f00d4675594c1d2368515444b104668de42fb1f |     
powerpc64le  | host-go-bootstrap-stage1-1.... | NOK | http://autobuild.buildroot.net/results/b4a9c01c19cfcbfa33bc85e805e249b744923fb9 |     
   s390x     | host-go-bootstrap-stage1-1.... | NOK | http://autobuild.buildroot.net/results/fd3b04d63004e85550abf5fa83e482c2fd819630 |     
    mips     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/91f42d00e97b7da703bc0602fd882b506d040725 | ORPH
    i686     |      host-librsvg-2.50.9       | NOK | http://autobuild.buildroot.net/results/e6ca6adc8f6bb3a64195fc182b615da0664a6e14 |     
  sparc64    |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/d27b2b0d2cc05bce66a748d24d01ec9a2a2bf55d |     
powerpc64le  |        host-rust-1.79.0        | NOK | http://autobuild.buildroot.net/results/f63d6ddcae87cefa289fa8546aea27bd8e99758e |     
   nios2     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/5e4764c449878ad4f49d3a6883418f18b1bd6b40 | ORPH
microblazeel | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/75320e8e61280f45584585262639cc7ec63cbade | ORPH
 microblaze  |          ledmon-1.0.0          | NOK | http://autobuild.buildroot.net/results/d4d7e8afe58a2009f0327033d499745c97c38715 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/1fdac04a6670c75cf01a99b7da7db96bb77b63fa |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/15d53db1a5140bf008f0e3042908b7de2b8fb533 |     
    or1k     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/19f32b64d35ce26a7aedc32973c770dec5e4631b |     
   s390x     |         libp11-0.4.12          | NOK | http://autobuild.buildroot.net/results/8c759c0052139bfb765b889e205483dcf493f6fd | ORPH
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/19c8b7e89761fc27ff2a0f0aee08b90be84ccd4e |     
    m68k     |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/fc638ab2c55f988f4dab2a8182d8a234da562f4b | ORPH
   mips64    |      linux-5.10.162-cip24      | NOK | http://autobuild.buildroot.net/results/25d1473d62fc555abdb144241f532083e342d01a | ORPH
  mips64el   |          linux-6.10.3          | NOK | http://autobuild.buildroot.net/results/eee3e816d0205e07ce9b27a6b68126428e11344b | ORPH
   mipsel    |          linux-6.10.3          | NOK | http://autobuild.buildroot.net/results/2100fe3445bf50a69cdf0a3a8d897cc79bb83c77 | ORPH
  riscv32    |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/d52254f8dac30886e89633af4a0fa43779728feb | ORPH
    i686     |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/cc6026aa817440eb4a6a40f861b748b58ea0a569 |     
  aarch64    |           mpv-0.35.1           | NOK | http://autobuild.buildroot.net/results/c9f6a6b9ac84904808a5e7aae1924ec064b04cd9 |     
    arc      |          nginx-1.26.1          | NOK | http://autobuild.buildroot.net/results/a85b00dfe9b55607390ebacc0e4e55c7cfbace3a |     
    i686     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/397dea2ca7c7f971bd50b2b87d12fbe721bf57d3 | ORPH
   xtensa    |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/2f68498c20aa555a027b29fbfe449277c72b6cc1 |     
  mips64el   |        openblas-0.3.27         | NOK | http://autobuild.buildroot.net/results/49df0946b187545ce97daf277f3591b431fa000a |     
powerpc64le  |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/7db8286f17cedadf515ead19e9f3add3f451706c | ORPH
  sparc64    |         pinentry-1.3.1         | NOK | http://autobuild.buildroot.net/results/6840e4684d146ebfb0440ef652ef98e9828f83fa | ORPH
  sparc64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/c1adfe03c5ed8d1871aa28575261913f372789d4 | ORPH
  mips64el   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/a6f73461578266eeab9b55ec1e41aee61bdb7328 | ORPH
   armeb     |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/b69fe0808ce6e1fd3564337b13a998ef1573b481 | ORPH
   mipsel    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/0e13e66354b31cdcd995ecbc255837ec3cd3719f | ORPH
microblazeel |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/c0ce5286ae8ef7a8a80c769a8eee97dca63960e7 |     
    m68k     |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/9ad0b0d19ac31b90d112e2443b7707509b71560b |     
    mips     |          swipl-9.2.6           | NOK | http://autobuild.buildroot.net/results/79f6737661c33661b865c362fb138c21e318beac |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/72b462e0de7c977af9490827ad519da673e9b9f0 |     
    i686     |        valgrind-3.23.0         | NOK | http://autobuild.buildroot.net/results/fadbc6d5f071dc433433c800bc6408e81c3142e5 | ORPH
  aarch64    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/a09ea306e3dbf65c5b9d3347de7df64896c31fe8 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

host-heimdal-f4faaeaba371ff... | 2 
                gnu-efi-3.0.17 | 1 
           janus-gateway-1.1.2 | 1 
          libcamera-apps-1.2.1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |         gnu-efi-3.0.17         | NOK | http://autobuild.buildroot.net/results/f854eff25cd2a6bb0320ab4f72d2d1b6bc3c1cb1 |     
 powerpc64   | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/677e416f7342a4d5f11fb5583ea0efc2aeb74e75 | ORPH
   mipsel    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/fc0bbff2f7d150c95fdb422361a45a8aee868a59 | ORPH
   mipsel    |      janus-gateway-1.1.2       | NOK | http://autobuild.buildroot.net/results/1597661f2ab21e3ce5b1667ab421ddc0046356bf |     
 powerpc64   |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/860f76ac54a5f4dcb16d3f896bfb88e8dacb88be |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

                 coreutils-9.3 | 1 
host-prelink-cross-a853a5d7... | 1 
              host-rust-1.74.1 | 1 
                  libsepol-3.6 | 1 
                  linux-6.8.12 | 1 
                  mupdf-1.22.0 | 1 
                openswan-3.0.0 | 1 
                    rtty-8.1.0 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/c8cdc40de88b5c88512acb0cbadf5486c826d336 | ORPH
  aarch64    | host-prelink-cross-a853a5d7... | NOK | http://autobuild.buildroot.net/results/79da953eb6d1035a066d6326fe4478856f175d33 | ORPH
   armeb     |        host-rust-1.74.1        | NOK | http://autobuild.buildroot.net/results/fc60a22f11d850d12ce84f4ab0486617996925cb |     
   xtensa    |          libsepol-3.6          | NOK | http://autobuild.buildroot.net/results/bbb132b90ef943d5ef430d3e9da6cb1e1880e625 |     
   nios2     |          linux-6.8.12          | NOK | http://autobuild.buildroot.net/results/ce9d03e3a596cfb69fe4c3718772c0a532375b5b | ORPH
    arm      |          mupdf-1.22.0          | NOK | http://autobuild.buildroot.net/results/ff1ac48d565004365937468d865360cf8d0144e6 |     
  riscv32    |         openswan-3.0.0         | NOK | http://autobuild.buildroot.net/results/fcf60c59c08c020e22c837c9ba27ba089a03e2d2 | ORPH
    i686     |           rtty-8.1.0           | NOK | http://autobuild.buildroot.net/results/e4d1f1f183c306aa155ba69fdbd2c46241cd115b |     


Classification of failures by reason for next
---------------------------------------------

                     avahi-0.8 | 1 
                 dc3dd-7.2.641 | 1 
                  ffmpeg-6.1.2 | 1 
host-heimdal-f4faaeaba371ff... | 1 
             libgpg-error-1.50 | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/8f711951a3da68b6ada6e8d41be36ea1b0fd0568 | ORPH
   xtensa    |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/7c9758c0857de1fe05a14394f7d17706edf89dbe | ORPH
 microblaze  |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.net/results/718c6f50eaa050718e1718e2ad489802de6d4bd9 |     
powerpc64le  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/46c0c17bdcbd0fb26fdcc242e927301b14f37b11 | ORPH
    m68k     |       libgpg-error-1.50        | NOK | http://autobuild.buildroot.net/results/3d5fb716a656f19db099ced76971fa35e1f1cbcb | ORPH
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/0e4170fc56b8045bd8095d1586b0589bf5d1e4cc |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
