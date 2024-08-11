Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B590C3DA4A
	for <buildroot@archiver.kernel.org>; Sun, 11 Aug 2024 04:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 025E581342;
	Sun, 11 Aug 2024 04:52:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4tAGozQBfTNG; Sun, 11 Aug 2024 04:52:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA52981366
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA52981366;
	Sun, 11 Aug 2024 04:52:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F12761BF3FC
 for <buildroot@lists.busybox.net>; Sun, 11 Aug 2024 04:52:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE89840281
 for <buildroot@lists.busybox.net>; Sun, 11 Aug 2024 04:52:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x43GsqUB-fk5 for <buildroot@lists.busybox.net>;
 Sun, 11 Aug 2024 04:52:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E9A9040169
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9A9040169
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E9A9040169
 for <buildroot@buildroot.org>; Sun, 11 Aug 2024 04:52:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AB4FCFF805
 for <buildroot@buildroot.org>; Sun, 11 Aug 2024 04:52:24 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 11 Aug 2024 04:52:24 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1723351944; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZwrcEkqGZAID6UfV7UIF+e/5bRbYaRE22/UNlVtLkcA=;
 b=cw+MBTO8DdafqQbI7QUYynVsQ8blFKIVJo2weKcOdNW24kPM29TYMvq4+3qj1NLwc08LgT
 dPpfI6UqFGcArgw7GxCXCr2+MbOfkvV/7dwBQu+1hDkVBxs4PX/VKpvflNzkeUOhGWuITn
 ViBpMIP1NsH5aCH5IwmCu8IzCcUkJ8AoPu8UpDXHaBtsIaQkz8Jl+Y+N+/2PcGg1ZwTMAj
 bLoN6TbXomtv9BgMUbeA1ZP2Kj9S/IyrYaSg0IQn5pChhDjwdw9JTrFSn8ZRmxAGiYPWlM
 xSp0k/Dxn6lpREk3Vo9TK5WxK5GqRuMzN2WftIG9e+ywlyNobbe4aVcAR9Xhqw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cw+MBTO8
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-08-10
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
Message-ID: <20240811045224.P4H_XTVQ50nkVLB2sW-7rtaLL0FMBVY4o-g9l8E1wXs@z>

Hello,

Autobuild statistics for 2024-08-10
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  |  6  |  2  |  0  |  8  |
  2024.05.x  |  8  |  2  |  0  | 10  |
    master   | 98  | 152 |  1  | 251 |

Classification of failures by reason for master
-----------------------------------------------

                gnu-efi-3.0.18 | 9 
               procps-ng-4.0.4 | 7 
                  ffmpeg-6.1.2 | 6 
host-vboot-utils-bbdd62f9b0... | 6 
                   foot-1.16.2 | 5 
  gobject-introspection-1.76.1 | 5 
host-heimdal-f4faaeaba371ff... | 5 
                  linux-6.10.3 | 5 
      python-autocommand-2.2.2 | 5 
                   atop-2.10.0 | 4 
glibc-2.39-74-g198632a05f6c... | 4 
                  libffi-3.4.6 | 4 
                     avahi-0.8 | 3 
                gerbera-1.12.1 | 3 
host-go-bootstrap-stage1-1.... | 3 
             libgpg-error-1.50 | 3 
                    norm-1.5.8 | 3 
                 apache-2.4.62 | 2 
                  boinc-7.20.2 | 2 
                 dc3dd-7.2.641 | 2 
                   eza-0.18.22 | 2 
                 gnuplot-6.0.1 | 2 
            host-binutils-2.42 | 2 
 host-softether-4.30-9700-beta | 2 
ltrace-82c66409c7a93ca6ad2e... | 2 
                  mender-3.4.0 | 2 
              netopeer2-2.1.49 | 2 
    python-cryptography-39.0.2 | 2 
  python-pypika-tortoise-0.1.6 | 2 
         python-remi-2022.7.27 | 2 
             sofia-sip-1.13.17 | 2 
                       unknown | 2 
                    bcc-0.29.1 | 1 
                  brotli-1.1.0 | 1 
                   cvs-1.12.13 | 1 
                  daemon-0.8.4 | 1 
                elfutils-0.189 | 1 
                  fbterm-1.7.0 | 1 
firmware-utils-86739f2b3ae9... | 1 
                 fwupd-efi-1.6 | 1 
            gdk-pixbuf-2.42.10 | 1 
         gobject-introspection | 1 
               graphene-1.10.8 | 1 
 host-binutils-bare-metal-2.42 | 1 
       host-gcc-initial-12.4.0 | 1 
                   host-go-src | 1 
           host-librsvg-2.50.9 | 1 
              host-runc-1.1.12 | 1 
                   httping-2.5 | 1 
               iproute2-6.10.0 | 1 
                       kmod-31 | 1 
                  libbpf-1.1.0 | 1 
                libdrm-2.4.122 | 1 
           libfreeimage-3.18.0 | 1 
               libglib2-2.76.1 | 1 
                librsvg-2.50.9 | 1 
                   libsha1-0.3 | 1 
                libsolv-0.7.25 | 1 
                 libssh-0.10.6 | 1 
               libunwind-1.8.1 | 1 
               lighttpd-1.4.76 | 1 
                  lvm2-2.03.23 | 1 
               mariadb-10.11.6 | 1 
                  mupdf-1.23.9 | 1 
          ncurses-6.4-20230603 | 1 
                 openssh-9.8p1 | 1 
                pinentry-1.3.1 | 1 
          python-grpcio-1.60.0 | 1 
                s6-dns-2.3.7.2 | 1 
             stress-ng-0.17.07 | 1 
                 systemd-256.4 | 1 
                   trinity-1.9 | 1 
                 uclibc-1.0.49 | 1 
ulog-0389d243352255f6182326... | 1 
               valgrind-3.23.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |         apache-2.4.62          | NOK | http://autobuild.buildroot.net/results/3c2a66040e673241a1935423b1060fcf5a024c5c |     
   mips64    |         apache-2.4.62          | NOK | http://autobuild.buildroot.net/results/3ba3fe9013991cf5f4533e824068a32e3c5c8839 |     
 powerpc64   |          atop-2.10.0           | NOK | http://autobuild.buildroot.net/results/3ac9c8e52e39a6109019e492fbcd913323c41a4a |     
powerpc64le  |          atop-2.10.0           | NOK | http://autobuild.buildroot.net/results/becab17226a31a31b309186f22ef2c917f614002 |     
   s390x     |          atop-2.10.0           | NOK | http://autobuild.buildroot.net/results/60636d84ce04d946ddb76ddd3a2be2aeb1c883ec |     
   xtensa    |          atop-2.10.0           | NOK | http://autobuild.buildroot.net/results/6de2eb783415339f31b2dddfd7e3572d0b7d32db |     
powerpc64le  |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/92ee34829d6e0aec4b8a3e95b0b556eec306e127 | ORPH
    arc      |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/4729f6da23c3e9ef8d39d262572905d409b080ce | ORPH
   mipsel    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/9365de450cbf49c0bccc30f7b99ac6aad2ea4b39 | ORPH
   x86_64    |           bcc-0.29.1           | NOK | http://autobuild.buildroot.net/results/50bc6a1d5b6b41765f61f47d170809a92dc288cd |     
   armeb     |          boinc-7.20.2          | NOK | http://autobuild.buildroot.net/results/7a95ae2c7663d5cb28c1e2f211a12ce0837485b6 |     
    i686     |          boinc-7.20.2          | NOK | http://autobuild.buildroot.net/results/acfde54782506ca887b7c9f840aaaea3fba31cbf |     
    arc      |          brotli-1.1.0          | NOK | http://autobuild.buildroot.net/results/c38bfca49140694e804db5b27afdeb8f94561df7 |     
  sparc64    |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/09129c7715f3ef5f002fb0f54ea98164675f2b58 | ORPH
   mips64    |          daemon-0.8.4          | NOK | http://autobuild.buildroot.net/results/4e14f69ca2d296f853061b9f683615f800ecd890 |     
   xtensa    |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/631f5cfa0357d12acc017f7abf7284523677dc3a | ORPH
    or1k     |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/23b10c5958611a05ebf7c473a922fa19f4572104 | ORPH
   arceb     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/f29a98a2d1c698213677c969a436abbef7e64b4d | ORPH
    i686     |          eza-0.18.22           | NOK | http://autobuild.buildroot.net/results/e9e6eb49c31e2ab884311a4119937eaecda57c0b |     
    arm      |          eza-0.18.22           | NOK | http://autobuild.buildroot.net/results/63e1f55c01f9406d1f088c25a78af75c75a601eb |     
  sparc64    |          fbterm-1.7.0          | NOK | http://autobuild.buildroot.net/results/ff2de57754c3788d8604df163b10215c67f02b2c | ORPH
microblazeel |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.net/results/4f0f2bdca600fc064fde2295956ccf52c4b8fcfd |     
 microblaze  |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.net/results/a19ffcec30f4f0a746e758400bc5b51dfd1de527 |     
 microblaze  |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.net/results/2277763fd255d5dc190fb8fd8a390e3bf0f0ea46 |     
    arc      |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.net/results/73399d21d5526b90662de564158521249be2d687 |     
microblazeel |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.net/results/281631c23baf9013259d129a2bc22288339dcb56 |     
microblazeel |          ffmpeg-6.1.2          | NOK | http://autobuild.buildroot.net/results/449c7a8a9454f0f785b82a14a04d337cc29d2ebb |     
    or1k     | firmware-utils-86739f2b3ae9... | NOK | http://autobuild.buildroot.net/results/4ef7f5aa047f37b31c6790dbd26882c98ea1f9d8 |     
microblazeel |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/d5da5d98b703ee8936ab1293d53ee8cd82320762 |     
    or1k     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/486443821d777a3f8648ea137e41ee5512309ff4 |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/0c1aff98ed4955db29c8d71919dc3cec8a8f6d92 |     
   nios2     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/7e93032c684d499e4f3625677993acb1e9cd0c40 |     
    mips     |          foot-1.16.2           | NOK | http://autobuild.buildroot.net/results/f7b688487950fe6b96cdfc4d57a94a29df2046e6 |     
    i686     |         fwupd-efi-1.6          | NOK | http://autobuild.buildroot.net/results/8218068a51f5a31d1f4cfe3a363436698d530f89 |     
    mips     |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/6deeaec863d105da848573772104ccfb38966334 | ORPH
   mipsel    |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/93cb6f5fb707b2b07f718132592d67677a50735f |     
    arm      |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/153d5d76f2b4e7c1d09cac3f3c1bc740096f4b86 |     
   x86_64    |         gerbera-1.12.1         | NOK | http://autobuild.buildroot.net/results/2bcfd79ba77f021d5f8cd8a81da02806e5ea2380 |     
  riscv64    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/58838f6ae9da4f3bd144da28f5e219b2308ace89 |     
  powerpc    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/bbc01ce717f4d1c8b84976bd49351ba8696ae645 |     
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/5edbe19a793f51e86b40b76cde35dbfed8f26d47 |     
  powerpc    | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/6f9b31a28140f30607413fabf5158b96d072de35 |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/4f383d1080ef3504f73797d81a02baf543e4845b |     
  riscv64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/592481a9026ed71ff3847221b71e8bfd82d18bc0 |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/6c2a8eb380852bedd965c0c309dcd022cd0a13a7 |     
  riscv64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/7ed099ebc3fa8f201a61e19bb9985cce6cd0702b |     
  riscv64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/cb849ac444d750f286b47830e8258412bb1209ac |     
   armeb     |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/0823f2f1034f25d6b06afd5e60501d5e9c21140d |     
  riscv64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/3bf2f4c00dd8456fbc65dd07eb15ff102dd69854 |     
  riscv64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/a75fdc976f3adc99da45f19433b535bad9ea76d5 |     
  riscv64    |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/11e3c3f976add109299cced5898d633fe428112a |     
 microblaze  |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.net/results/14e185bd8e7c672421346b595dd3a75a6516b3c8 |     
   armeb     |         gnuplot-6.0.1          | NOK | http://autobuild.buildroot.net/results/573dd7e0ccf0458ba74bda5c396a88c9abe96d5b |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/c63fa6948a7a9e316f47b9694f91860671cb1f1a |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/19fbf2b5c9b89c720842c403bab97adfa33fb566 | ORPH
    mips     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/bd7306ae52c246c743b3ac060807e68134c04cb1 | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/327f53d6e33a79141d51ef77d4d7f5c18da1ae5a | ORPH
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/bf567ca126af006280b42e320f36a9e3ed70bfa5 | ORPH
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/cf9a255069458280561a0abbe7197d9b3a01d21c | ORPH
   sh4aeb    |        graphene-1.10.8         | NOK | http://autobuild.buildroot.net/results/ff557a5766f6bbfadda4fdb7362f2e97dcb055a2 |     
   x86_64    |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/2b69b2890b9d5f206721eefc1bda0465b911620a |     
    mips     |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/a796d44567ca554305ccf364c14ae57ddfd1d4f4 |     
   armeb     | host-binutils-bare-metal-2.42  | NOK | http://autobuild.buildroot.net/results/4e7bf74a5b5dfe1dd202c05e1416675fcc7b8f1c |     
   sparc     |    host-gcc-initial-12.4.0     | NOK | http://autobuild.buildroot.net/results/660bf037652e47dc44c1552846045cedc56f205f |     
  mips64el   | host-go-bootstrap-stage1-1.... | NOK | http://autobuild.buildroot.net/results/c67f978acc70f852035a9a7aee7319b390474d2e |     
   sparc     | host-go-bootstrap-stage1-1.... | NOK | http://autobuild.buildroot.net/results/780531527612f4ebe6f6584a7ef9e86ab4a1386d |     
   armeb     | host-go-bootstrap-stage1-1.... | NOK | http://autobuild.buildroot.net/results/c79d791f88f14137f45af75af3d89fa1f23322a8 |     
    i686     |          host-go-src           | NOK | http://autobuild.buildroot.net/results/7fb5e5ac6bac233b9177ea5351fae398ee09a635 |     
   mipsel    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/28b60e5dff2576f464eb755e9acdd955761ef353 | ORPH
  mips64el   | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/049a12e92a53ff2d37718d2696b116170ad65ff7 | ORPH
  powerpc    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/8f6f3c9319161e1c80017725bf2ca5a482c73926 | ORPH
    sh4      | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/a338107f6864bcd792468ad40976d65403a86069 | ORPH
  mips64el   | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/13d639f164821db878211af9d2dafabcfbdd2821 | ORPH
   nios2     |      host-librsvg-2.50.9       | NOK | http://autobuild.buildroot.net/results/e81cf5d88b2f27f65d8c0a611a3f9571b428e51e |     
  riscv64    |        host-runc-1.1.12        | NOK | http://autobuild.buildroot.net/results/a27a553ba305f2b4a707404e9598926459e265f8 |     
   nios2     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/ad0a4d967724564a262b7330fa199c1910cea86a | ORPH
    mips     | host-softether-4.30-9700-beta  | NOK | http://autobuild.buildroot.net/results/6d9a24af0d0aa99011b66fa101dee25d1af409e3 | ORPH
   nios2     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/581b1dd405b3cdbcb79d2d81780da21662c719ee |     
   mips64    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/607b706fc767331f3482b13e1e44f2b624bee2c1 |     
    or1k     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/494a01e036038673be804cdac2ee024184e6caf4 |     
 powerpc64   | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/620779a2a969ef9aefcb1a129ab8e32dec6d4b4a |     
 microblaze  | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/f825103ee66d62d2bbf2b957f8b929f7abdb4b31 |     
    mips     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/d5624d6dbe03d993429d7689bc4ffab9f60381f3 |     
  aarch64    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/8d6a21a70fbc762ffcaf52b3ab7854375d625d47 |     
 microblaze  |        iproute2-6.10.0         | NOK | http://autobuild.buildroot.net/results/a30f4958668125d866898b2c4902113296ab8a7d |     
microblazeel |            kmod-31             | NOK | http://autobuild.buildroot.net/results/8baf97d190f36ee26d2393f268d7ade1eb3e4ab9 |     
  mips64el   |          libbpf-1.1.0          | NOK | http://autobuild.buildroot.net/results/fb961c40e5aba712b5574ee457f31038989c8e16 |     
   sparc     |         libdrm-2.4.122         | NOK | http://autobuild.buildroot.net/results/7ab583edb135b4b6948fb47e598d1f74e81fea7d |     
    or1k     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/c9d565c6ae9b1858b72935f0f6a36eaf44e7c9c0 |     
    or1k     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/9f2c8c539b743c6de2af69324db5fd3414c727e9 |     
    or1k     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/96dea35b7fc62303d91dfa59c39f537972a148a6 |     
    arc      |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/fc43461a163ef2a9798ed4673248210383d924de |     
  powerpc    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/ae206db036c483adf4d2d75ae86a1c896ff49269 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/358d41cc4c2314799f1208199a00864edf160486 |     
  riscv32    |       libgpg-error-1.50        | NOK | http://autobuild.buildroot.net/results/c01185b58b9f427235bff174d6af476d76e6205c | ORPH
  riscv64    |       libgpg-error-1.50        | NOK | http://autobuild.buildroot.net/results/4c1966a71020af31c1dc1b0a13a3928c84e75874 | ORPH
    arm      |       libgpg-error-1.50        | NOK | http://autobuild.buildroot.net/results/7b1ce0c5afee5e62842492b556c76e7cd6d74184 | ORPH
    arm      |         librsvg-2.50.9         | NOK | http://autobuild.buildroot.net/results/90d3825b9ba721025e3749d283b9a858b3c14c8a |     
    sh4a     |          libsha1-0.3           | NOK | http://autobuild.buildroot.net/results/b9fa56213033752818a102c4b5cff56e2fbd6ee9 |     
   mips64    |         libsolv-0.7.25         | NOK | http://autobuild.buildroot.net/results/c6b406e289bb456fb828bce4df6c159cb50b5c1c |     
    mips     |         libssh-0.10.6          | NOK | http://autobuild.buildroot.net/results/e8482e1cd7ccd218ad7c796a20a46dcfb493eb80 | ORPH
    or1k     |        libunwind-1.8.1         | NOK | http://autobuild.buildroot.net/results/843826e6ff1de85d3683d165f29353fc6dee37bb | ORPH
   sparc     |        lighttpd-1.4.76         | NOK | http://autobuild.buildroot.net/results/9595c29021288f7cf044498f7b676c40498f7869 | ORPH
    mips     |          linux-6.10.3          | NOK | http://autobuild.buildroot.net/results/af5fed89dfe776d57923cd86d0e1504c0b3a91a1 | ORPH
  powerpc    |          linux-6.10.3          | NOK | http://autobuild.buildroot.net/results/4c3c02c5b634d06b52c82303d759f7e3885edadf | ORPH
    mips     |          linux-6.10.3          | NOK | http://autobuild.buildroot.net/results/c7b8063a0f59e3dcf0c19e288afbddd8caf51cdf | ORPH
   sh4aeb    |          linux-6.10.3          | NOK | http://autobuild.buildroot.net/results/bcd7bcd49876807ae3f2400c7b660a2ce0071ef2 | ORPH
    m68k     |          linux-6.10.3          | NOK | http://autobuild.buildroot.net/results/82d09b451c6a1d8b56115d2247b9e92f435bc0eb | ORPH
   x86_64    | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.net/results/06ee3efda72da4cb2517d4de2b590b3f643653a4 | ORPH
    arm      | ltrace-82c66409c7a93ca6ad2e... | NOK | http://autobuild.buildroot.net/results/990816fa41d922ae1a57e97ef3755706bc2f90ac | ORPH
 microblaze  |          lvm2-2.03.23          | NOK | http://autobuild.buildroot.net/results/3a0050e8834bbf03b9113688b5b865500b8b9162 | ORPH
 aarch64_be  |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/b4f421422b6a1a41d395ed215a5871a93b26fa64 | ORPH
   x86_64    |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/07844017cb09e72b16a966ed50c3c1cc9ddc0bce |     
  aarch64    |          mender-3.4.0          | NOK | http://autobuild.buildroot.net/results/828508b6f76577383c71c9d6e54e75abbcc42b9b |     
    arm      |          mupdf-1.23.9          | NOK | http://autobuild.buildroot.net/results/68f5a3c939c452347216089d90e085e08d038402 |     
    arc      |      ncurses-6.4-20230603      | NOK | http://autobuild.buildroot.net/results/551a5f89cf6134be619146f8e0300a44863cf56a | ORPH
   nios2     |        netopeer2-2.1.49        | NOK | http://autobuild.buildroot.net/results/85d4ba12354a424c138842d996108fa83d26071b |     
  sparc64    |        netopeer2-2.1.49        | NOK | http://autobuild.buildroot.net/results/c784f1c774931d867cf9665e9438a93aa39ccfad |     
   x86_64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/68ed7890a266fe97d2719d8d7d02b8bf16004cd1 | ORPH
   nios2     |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/e08b008eea0b29798328bb599fea26e07fcd4fac | ORPH
  sparc64    |           norm-1.5.8           | NOK | http://autobuild.buildroot.net/results/108cc5ef8e7feb0731089f7d6b529861cfc648f3 | ORPH
   s390x     |         openssh-9.8p1          | NOK | http://autobuild.buildroot.net/results/cfc411e67b687aad199539a65c11ff2287053f54 | ORPH
    arm      |         pinentry-1.3.1         | NOK | http://autobuild.buildroot.net/results/d921d522faf190bb4a2979042bcc14fb0bb42df1 | ORPH
 powerpc64   |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/f8809cd0cbf0951efa7fe905db78863c1a63008b | ORPH
    arm      |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/b0f149e5e59f1d1692426ac3b5f688f3cd624eed | ORPH
powerpc64le  |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/8eb5c3902b58b76222c96c224e24572f64dae923 | ORPH
microblazeel |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/a8f00fea0fdf5aece0bd07aeea7f85f7bbe87ad6 | ORPH
  aarch64    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/dffb5d903b6e9d4d6facd398edf1fbf9ab697b0d | ORPH
powerpc64le  |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/0c465ebcdb38482f2a1e6b177e297bea0e81d643 | ORPH
   xtensa    |        procps-ng-4.0.4         | NOK | http://autobuild.buildroot.net/results/15af5a9f19505aa09ff330963f97d3180bc5d45b | ORPH
    arm      |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/21c4ee43dc4ea2ee799187f03b1f9bb6f01e3528 |     
   mipsel    |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/33827a7ba0386d522a6a1075d41b4633aae52b27 |     
    sh4a     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/7bf5db689d70a8a29958aaa0352f220919c8518d |     
   nios2     |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/718797674c4ecafaa614016818a71658edce162f |     
 powerpc64   |    python-autocommand-2.2.2    | NOK | http://autobuild.buildroot.net/results/95adc0673c9677700cd82f3bb6b6099f1afd3b73 |     
    sh4      |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.net/results/a79f58315095b59a894ca83a7ac75fae1957f391 |     
   mipsel    |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.net/results/319eff9337f6d60f5f0b924e084965b9f4f1717d |     
    i686     |      python-grpcio-1.60.0      | NOK | http://autobuild.buildroot.net/results/2cf4d5e9dc298d9b4789ce8485e04c8f9af563a3 |     
  sparc64    |  python-pypika-tortoise-0.1.6  | NOK | http://autobuild.buildroot.net/results/03a2ed25b1a7e0c8a1b8b3625b7fbba93fbd1a61 |     
   s390x     |  python-pypika-tortoise-0.1.6  | NOK | http://autobuild.buildroot.net/results/4a5a3e7811908f03c3d845f8700a8fb848389d3b |     
    arm      |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/9c640bb4fc698dcb03c0cce1f2fc0542dcdce49b |     
 powerpc64   |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/973fb9ea9c5d3290e3410f4cb8c2e495e12d2f49 |     
  powerpc    |         s6-dns-2.3.7.2         | NOK | http://autobuild.buildroot.net/results/7572065505a26e90f2e90def7e595eab9ee14fc3 |     
   s390x     |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/7a04c14cd1310bd8d58f5d72bfab46129ab00853 |     
   arceb     |       sofia-sip-1.13.17        | NOK | http://autobuild.buildroot.net/results/40add9802489210b73fb21e4d31a9e861b075c6c |     
   armeb     |       stress-ng-0.17.07        | NOK | http://autobuild.buildroot.net/results/1dd17e8706d7b4e95079787c6e69b4498fe2be64 |     
    sh4a     |         systemd-256.4          | NOK | http://autobuild.buildroot.net/results/0e614375f731f7bfe3c6041c6e89a09c31898053 |     
  aarch64    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/3017e1385b306b3d5a49241c559390244942f1be | ORPH
    or1k     |         uclibc-1.0.49          | NOK | http://autobuild.buildroot.net/results/97b2a549f5047e380e71ca09ded2262de1d1d49d |     
   s390x     | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/a01a82675af0d0bb0d8f4a44318e58d515bfcb90 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/dd7b9d53b98f37fe7b68dcef0aed15f1e79acc03 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/c87a6942e4b315c9b17b51789f53ffbcd559f4e3 |     
    mips     |        valgrind-3.23.0         | NOK | http://autobuild.buildroot.net/results/fce420a7dbf0d1bc7aad7bcf0bb298aff9863743 | ORPH


Classification of failures by reason for 2024.02.x
--------------------------------------------------

                    bat-0.24.0 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/b67bbdf4e1e9a2782526d51b120d8dcf018a58ad |     
  mips64el   |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/96439c6a1988fd29db2d58363e1e8d72b7097194 |     


Classification of failures by reason for 2024.05.x
--------------------------------------------------

glibc-2.39-74-g198632a05f6c... | 1 
                  ntp-4.2.8p18 | 1 


Detail of failures for 2024.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  | glibc-2.39-74-g198632a05f6c... | NOK | http://autobuild.buildroot.net/results/e9b38fa627a6e913eb81f58e9b15bc0eda6eb25d |     
    arc      |          ntp-4.2.8p18          | NOK | http://autobuild.buildroot.net/results/af216646536ab513e04e6a207f3dee5235d556e1 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
