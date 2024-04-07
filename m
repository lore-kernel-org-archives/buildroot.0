Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 592C9C3A59D
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 03:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C254E400CB;
	Sun,  7 Apr 2024 03:55:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wUe3xRG_h7-5; Sun,  7 Apr 2024 03:55:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B4CD4012A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B4CD4012A;
	Sun,  7 Apr 2024 03:55:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A36D11BF335
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 03:55:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8FD774012A
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 03:55:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T0aSJ-spf_8I for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 03:55:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5B4DE400CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B4DE400CB
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5B4DE400CB
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 03:55:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0CA4A40006
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 03:55:38 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sun, 07 Apr 2024 03:55:38 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1712462139; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XpfAglT7XVz1eWoHHAGbLT+ea3RvXG53uhYRnVxdDig=;
 b=gZ1w5alSTc2r3TZFrLew41yHzD7/dq+SDE5xTDsSLHSV9lQbzdY0KZrHnW9K1byTnm1NTt
 9kizjm+rrRoXI+KHV7oV5wBKG2iJSypjGmDl2oFypuwFj5GDvTw/PzUxXW7dH628IHWNki
 NkCizAYRHIFEOo836rJWGBb3iP4iZ66KCNLwImAKPXonTKZ423dG/500Lcr4m5EiIQTlYu
 oZVtThwnynK4uxQzpW2RYOqdSFRfgslSFTQlYQT5xB/FJwtHgzLw+KXbOCY6n8fkPsnNCK
 NUDsYs/4bfDz+GXkSUY4kuSW5lim7bJkMoSDBCJKmVxGyB88pDdvIG7wSoTmXg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gZ1w5alS
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-04-06
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
Message-ID: <20240407035538.-IF42bp464syBcH8NuLtdbpFNw4QhqU9QbMkA4BODGo@z>

Hello,

Autobuild statistics for 2024-04-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2024.02.x  | 11  | 14  |  0  | 25  |
    master   | 61  | 92  |  1  | 154 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 6 
             util-linux-2.39.3 | 6 
                fail2ban-1.0.2 | 4 
        host-sentry-cli-2.20.3 | 4 
          libcamera-apps-1.2.1 | 4 
                libressl-3.8.4 | 4 
android-tools-4.2.2+git2013... | 3 
host-heimdal-f4faaeaba371ff... | 3 
              libarchive-3.7.2 | 3 
         python-remi-2022.7.27 | 3 
               apcupsd-3.14.14 | 2 
             dahdi-linux-3.3.0 | 2 
dmenu-wayland-a380201dff5bf... | 2 
                   exim-4.97.1 | 2 
       freeradius-client-1.1.7 | 2 
   host-flutter-sdk-bin-3.19.4 | 2 
                   libnpth-1.7 | 2 
               linux-pam-1.6.0 | 2 
                memtest86-6.20 | 2 
                 openssh-9.7p1 | 2 
               asterisk-20.5.2 | 1 
                 augeas-1.12.0 | 1 
                    bat-0.24.0 | 1 
          cryptodev-linux-1.13 | 1 
                   dante-1.4.3 | 1 
                elfutils-0.189 | 1 
       freeradius-server-3.2.3 | 1 
            gdk-pixbuf-2.42.10 | 1 
glibc-2.39-5-ge0910f1d3278f... | 1 
         gobject-introspection | 1 
  gobject-introspection-1.76.1 | 1 
            host-binutils-2.42 | 1 
         host-libxcrypt-4.4.36 | 1 
            host-omniorb-4.3.1 | 1 
               ipmitool-1_8_19 | 1 
                  jack2-1.9.22 | 1 
           janus-gateway-1.1.2 | 1 
     kvm-unit-tests-2024-01-08 | 1 
                  libffi-3.4.6 | 1 
                   linux-6.8.1 | 1 
                   linux-tools | 1 
            micropython-1.22.0 | 1 
                    ncmpc-0.49 | 1 
                  octave-8.4.0 | 1 
       perl-net-ssleay-1.93_01 | 1 
                privoxy-3.0.34 | 1 
                    proj-9.3.0 | 1 
           python-numpy-1.25.0 | 1 
            python-pudb-2023.1 | 1 
                  quagga-1.2.4 | 1 
                    rtty-8.1.0 | 1 
                    volk-3.0.0 | 1 
                  whois-5.5.14 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/cc04fa57d87d14b618bffc54309b145205532182 |     
  sparc64    | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/c28986dee2f44c535fdebca128b7f00ceda7e507 |     
    arc      | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/cb20f4abcc2163718e106c23a5f13b33d0214342 |     
  mips64el   |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/318a055515acf8dd39d799b905d811023fc52d76 |     
   nios2     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/30ec6dc80278a75c09f6fb014b61dbdc49026af5 |     
  riscv32    |        asterisk-20.5.2         | NOK | http://autobuild.buildroot.net/results/3be28c7093569ec28d735b9148172adc2abb8f67 |     
  riscv64    |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/459179cdcfc05d273dc4cb0767e6986178262c9a | ORPH
   x86_64    |           bat-0.24.0           | NOK | http://autobuild.buildroot.net/results/eaf56461bb4c56ea03c815f5dfc3b3fcae73cda2 |     
    arm      |      cryptodev-linux-1.13      | NOK | http://autobuild.buildroot.net/results/b613691b0b74c43c695a42f1a0ae364a2f06cfd4 | ORPH
  aarch64    |       dahdi-linux-3.3.0        | NOK | http://autobuild.buildroot.net/results/b503cc3a75b196d84debd4133809bc241110d3a9 |     
    i686     |       dahdi-linux-3.3.0        | NOK | http://autobuild.buildroot.net/results/b1fd9f1e27dc4ce994c28d2827a22ee5d736ecad |     
    mips     |          dante-1.4.3           | NOK | http://autobuild.buildroot.net/results/0d99fda7b2349625e064feeb7448effa6df3799b | ORPH
   xtensa    | dmenu-wayland-a380201dff5bf... | NOK | http://autobuild.buildroot.net/results/62f6a686f967a40bd8734f8c0d4a621332ebfc99 |     
    arc      | dmenu-wayland-a380201dff5bf... | NOK | http://autobuild.buildroot.net/results/af4dfee738ca06d2e7a313477a1b1d43e72d7839 |     
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/232bf7ea768ee89d9d0fed4ef42bd6b390924d20 | ORPH
powerpc64le  |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/91a060e4f61b9b2dab29134182f026faea722f97 |     
   nios2     |          exim-4.97.1           | NOK | http://autobuild.buildroot.net/results/f9c9cbbc3f6415e7ff4083a5c4bcb353ae9de127 |     
    m68k     |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/c7a050c7cf0abaa8fcc40da136ffacb6f2af1b0c |     
   x86_64    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/ca17667f359deb77f1782e65a4dbb580bbd77b43 |     
  mips64el   |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/547b2074634106b7cb5a532457496e5586af1362 |     
  riscv32    |         fail2ban-1.0.2         | NOK | http://autobuild.buildroot.net/results/44964f6876c15d8f40c69443be153c8d3fda7853 |     
   mipsel    |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/151cf165c7989520113958ea205632e520df9de2 |     
microblazeel |    freeradius-client-1.1.7     | NOK | http://autobuild.buildroot.net/results/80769e36b2b20595cdadf40f392facccf3e7390a |     
    i686     |    freeradius-server-3.2.3     | NOK | http://autobuild.buildroot.net/results/1de6886ea096798d9a1d2382e1547f0dc7ef96ec |     
  mips64el   |       gdk-pixbuf-2.42.10       | NOK | http://autobuild.buildroot.net/results/387014f6a93e887a677aec119c3cefaa2808c72f | ORPH
  powerpc    | glibc-2.39-5-ge0910f1d3278f... | NOK | http://autobuild.buildroot.net/results/6556ae5c14e6f10a84267d3007ea8ea8d9262caa |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/bdc9314ec2544a06984c488dec5555079047bb90 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/36a7e062eae3c4ade4ed587c92314fc4d1838272 | ORPH
 microblaze  |       host-binutils-2.42       | NOK | http://autobuild.buildroot.net/results/a0fd1ecd405a3e150f348efd68b9a8151b015fbe |     
  mips64el   |  host-flutter-sdk-bin-3.19.4   | NOK | http://autobuild.buildroot.net/results/382ff6e6a0b95eee7a06617a54aebb86a4fbeb79 |     
   x86_64    |  host-flutter-sdk-bin-3.19.4   | NOK | http://autobuild.buildroot.net/results/300baaed4661607310aa6845c6d7227747e96cec |     
  sparc64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/e24ea90c143d32c7808fa82b2e786afa4b5181ff | ORPH
    mips     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/9869bea8db1f0662d9b2046161b399f336635ce1 | ORPH
 aarch64_be  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/b2e30dd250b5e1e446f3850049d9775d97499dc0 | ORPH
powerpc64le  |     host-libxcrypt-4.4.36      | NOK | http://autobuild.buildroot.net/results/e93d3ec689bbdff841c82dfcb51eb37aa10516ae |     
    arm      |       host-omniorb-4.3.1       | NOK | http://autobuild.buildroot.net/results/ca9479c364700f41672049b7fde2f7fbecb40feb | ORPH
    arm      |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/7ba2097782b8d07cf94e06f3b60784aae17384bc |     
 powerpc64   |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/0cd646cfb7b73bdb06667a9dabd32f1145de2c58 |     
  aarch64    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/650e3f6198a90475d6d13d26e35757bf887a8d6a |     
   nios2     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/ed59ce4fd91bd67c12ae78c705c73b80e10e7f11 |     
   arceb     |        ipmitool-1_8_19         | NOK | http://autobuild.buildroot.net/results/1bf09473846dca48ef9689a37a6c56322cb10c82 |     
    m68k     |          jack2-1.9.22          | NOK | http://autobuild.buildroot.net/results/1afa4f8c825040c690e56eb914d00a1f3a732a3f |     
   mipsel    |      janus-gateway-1.1.2       | NOK | http://autobuild.buildroot.net/results/239940b86f7c54adf14f359abad3cdd4656c1ff5 |     
    i686     |   kvm-unit-tests-2024-01-08    | NOK | http://autobuild.buildroot.net/results/8021f71a82eaa3785125c0e0d4b86226cd69321e |     
   mipsel    |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/fbed5877bb30c855b25c888ddaf999dd807ebee9 |     
   nios2     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/62f0f2bdad7a0abe47a09a7582ec9e591c6f6ed9 |     
   s390x     |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/4e2928cda76004d4ed8d30c9614f70c99d0fe0e8 |     
microblazeel |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/8e9d2ef62f75ed83a8e01d15abb48962397f6067 |     
   mipsel    |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/ab6672598c53b1057f4be442bcc54c2b27ad033f |     
    arm      |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/756a7808b6de95b75d18b8a841e6ffc407620529 |     
 microblaze  |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/7ffe5bc5645163e2905eca88fb34f56463a8e14c |     
   arceb     |          libffi-3.4.6          | NOK | http://autobuild.buildroot.net/results/9ad3a672aab22a868ae04425c94b7dd0252f668d |     
   mipsel    |          libnpth-1.7           | NOK | http://autobuild.buildroot.net/results/fee5dd2835c626429fd6f5df3a59a07f033a7f1f |     
  riscv64    |          libnpth-1.7           | NOK | http://autobuild.buildroot.net/results/d986ba27b734679fd70b4e0f23278ebd38e13c5d |     
  mips64el   |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/c28ed0c589d69a5a38e9928af6b7137c3d583584 | ORPH
 microblaze  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/ec58592ba8c752291d4d958a0fa25593a136ec14 | ORPH
powerpc64le  |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/69061095a8a5548e3a5334421dbb76f286ffc3b9 | ORPH
    arm      |         libressl-3.8.4         | NOK | http://autobuild.buildroot.net/results/24dc312be4bac8f81df6a3481eeca35481141c1e | ORPH
   mips64    |          linux-6.8.1           | NOK | http://autobuild.buildroot.net/results/8e656fde9fd0f87a3f9cbde70b9dc5ece1c41697 | ORPH
  powerpc    |        linux-pam-1.6.0         | NOK | http://autobuild.buildroot.net/results/4facc54515582cb0969ac8866607e505e6751df2 | ORPH
   nios2     |        linux-pam-1.6.0         | NOK | http://autobuild.buildroot.net/results/586355657b15144bf2500222b632f3ee6fdcb30f | ORPH
  riscv64    |          linux-tools           | NOK | http://autobuild.buildroot.net/results/3972269baa6974be5f77e9267f61bcc2cd781822 | ORPH
    i686     |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/bca209e641f9205d6518e245471fe70d1a55e5b2 |     
   x86_64    |         memtest86-6.20         | NOK | http://autobuild.buildroot.net/results/054ed76d98079231095c16649fb705a8767c3724 |     
 aarch64_be  |       micropython-1.22.0       | NOK | http://autobuild.buildroot.net/results/8c9756866752ce1fa892c4dcbe508974748f6287 |     
    mips     |           ncmpc-0.49           | NOK | http://autobuild.buildroot.net/results/77a9da498eab138eb370e9e24f4f93537d324eba |     
powerpc64le  |          octave-8.4.0          | NOK | http://autobuild.buildroot.net/results/3f6a2f6aed64320640824c9b5ce853fdde6d9309 |     
   mips64    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/01bf634958c4a898380d61e25bc6ea0ace656b54 | ORPH
   mipsel    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/8ddbc300023f711f2ab99f9d336cb4a968038903 | ORPH
   x86_64    |    perl-net-ssleay-1.93_01     | NOK | http://autobuild.buildroot.net/results/abd884fc08c32e1c9c635352d44facd76ec31d32 |     
    arm      |         privoxy-3.0.34         | NOK | http://autobuild.buildroot.net/results/1ed62da3f03a6d14d1e398cb6b0c5f9fe2af1b4c |     
    m68k     |           proj-9.3.0           | NOK | http://autobuild.buildroot.net/results/53400284377ebf4ddce5c7013ec5575d657c5e53 |     
    i686     |      python-numpy-1.25.0       | NOK | http://autobuild.buildroot.net/results/70fc2d57bc8ca2585a941eb5a71a021ddc4e098b |     
   mipsel    |       python-pudb-2023.1       | NOK | http://autobuild.buildroot.net/results/0e3b15b9d02dda231f768595cdcff4e75ad71afd |     
    or1k     |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/f9385ded4666468e5358c3147a96f4fc7c9e42ee |     
   nios2     |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/59ff2895baa49260fb83bc375993907144b945af |     
    or1k     |     python-remi-2022.7.27      | NOK | http://autobuild.buildroot.net/results/7825e0113fdee7ed23a5a55cab149d9e62155467 |     
   nios2     |          quagga-1.2.4          | NOK | http://autobuild.buildroot.net/results/984572031cedd124f48b5a5bc5abe6096d22eaf3 | ORPH
    i686     |           rtty-8.1.0           | NOK | http://autobuild.buildroot.net/results/0fd5a118f6173233fc3e9ebc9477948031355dd7 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/e2a193b07d48203a4302bf6640b862b348fadca3 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/72f2bf22f4ebdae41c8a0b4be68bfd0e9c70fef3 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/a8410db7d15c0d4b301bbbd51cc22cde2c1d667f |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/9324bfefb1e28ab36e821631153c183b35989735 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/0a35a763fe8f4277d259293863212c24bd92b6d2 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/a6c8dd2a758517eae5e28b9009f9c04e123007e7 |     
    i586     |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/42365e68d0db4989fd5eb984db250381bcd20253 | ORPH
    mips     |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/5466c067e50847f454a2793eafef9d68b9017b0e | ORPH
   mipsel    |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/153319201efe380a72a8eb6a2a6e8042ade953c1 | ORPH
  sparc64    |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/b4a84eaf846551f5bfee05d1d486a459e3044772 | ORPH
powerpc64le  |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/80eaba067674a5c91c6ade0d53dbaa2880022a64 | ORPH
   mipsel    |       util-linux-2.39.3        | NOK | http://autobuild.buildroot.net/results/615f7989fc0f194825f41be3e9cd1d20f3d2cd21 | ORPH
  powerpc    |           volk-3.0.0           | NOK | http://autobuild.buildroot.net/results/5c93eb880c270d15ec284d21622da6b2fa99897d |     
  riscv32    |          whois-5.5.14          | NOK | http://autobuild.buildroot.net/results/b0aaffaf951725186ae078ce101edb24c963c6a3 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

               apcupsd-3.14.14 | 2 
                       unknown | 2 
               belle-sip-4.4.8 | 1 
                  bitcoin-26.0 | 1 
                  clamav-1.0.5 | 1 
                     efivar-39 | 1 
  gobject-introspection-1.76.1 | 1 
   host-flutter-sdk-bin-3.16.8 | 1 
          libcamera-apps-1.2.1 | 1 
               libglib2-2.76.1 | 1 
               libunwind-1.6.2 | 1 
                 openssh-9.7p1 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/11807c2c0259e735ffecf7db5269e0e31e6115d0 |     
  aarch64    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/d2f1a5eb27d1d1cd0dc2e221009a442b38f74fd8 |     
   xtensa    |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/773e9fbab0937bbb0a0006a7c100ea1fdbe41495 |     
    m68k     |          bitcoin-26.0          | NOK | http://autobuild.buildroot.net/results/888ac06168d9bd9da2c8f163afbec63945af965e |     
   x86_64    |          clamav-1.0.5          | NOK | http://autobuild.buildroot.net/results/de403e9114bed5ad7049cb553437a5ea5697912b |     
    i586     |           efivar-39            | NOK | http://autobuild.buildroot.net/results/4a206bff8683b63ab4b1c883b8f86638778128d2 |     
   x86_64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/84bc10684181656ae3cfd9bd99659e3a0a2a975d | ORPH
   s390x     |  host-flutter-sdk-bin-3.16.8   | NOK | http://autobuild.buildroot.net/results/e9dcfd083ae809e6bcc40ad1c48b6376aab30fe6 |     
   s390x     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/20101f7d07fcb8cd8d88d51d757d2d5d7999e317 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/9ae7b3d56b7f9e9caf6b7eed40ea300a0d6c9c22 |     
  powerpc    |        libunwind-1.6.2         | NOK | http://autobuild.buildroot.net/results/f3f79c11e86f45004dcec7373d69b28883220dd2 | ORPH
   mipsel    |         openssh-9.7p1          | NOK | http://autobuild.buildroot.net/results/5f6a4c3ac390bba0bf99fbf8299971a1db581478 | ORPH
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/a58325fa4eb8fa8df7e77efbbaf921a8ea9fc238 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/bcde00b21c98b0f25b961da179f2c649e214720f |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
