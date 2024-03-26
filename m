Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 926FCC54E58
	for <buildroot@archiver.kernel.org>; Tue, 26 Mar 2024 06:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ACA0F40BC9;
	Tue, 26 Mar 2024 06:46:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aTX5MYiebSmo; Tue, 26 Mar 2024 06:46:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32F9440188
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32F9440188;
	Tue, 26 Mar 2024 06:46:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 53E221BF3B5
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 06:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E81F40188
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 06:46:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kQCx00sX6Wxm for <buildroot@lists.busybox.net>;
 Tue, 26 Mar 2024 06:46:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8426840150
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8426840150
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8426840150
 for <buildroot@buildroot.org>; Tue, 26 Mar 2024 06:46:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C35C124000A
 for <buildroot@buildroot.org>; Tue, 26 Mar 2024 06:46:17 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 26 Mar 2024 06:46:17 -0000
X-GND-Sasl: bot@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1711435577; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=v17AmSw7t/wZi39hueuIbt8iAEn5joiOGPiWye0/qzw=;
 b=kDe85vfr3mNp//gsDdxkQMeGvzfyD1LnbqAJppH085kH6yMRYTmAVYyuvYBz0eYp6g5D+7
 dC2UP/3aocqdQ+HjcxqOJbm8LU5wxqNi2sGlNJM/tKC3artgnHG3NhKsjeEG+mjeQXYwFI
 8rCaC/eN3c62zrm4K1SJKk+z3fqj6tv3qTHJkPtNl4JLoFRl8C3i6483nzqK9AIrHPhDa9
 BGVGZqtfAYDsWuFVRryCDCrjW3y6yhG6WhthVqDY4CFSpjJzhu85RX6cyZKTDYM+6lIy7T
 0F78NH+55hQ2pwHfsfU3CGyj0kXUsCCcdZN83trtnOxFhCTV3gfI2pFD2WcNLQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kDe85vfr
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2024-03-25
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
Message-ID: <20240326064617.E-txI-DZs0uP2fHAaBNY1PT2S5Lm9i6AVuqz5ivbWE0@z>

Hello,

Autobuild statistics for 2024-03-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  2  |  9  |  0  | 11  |
  2023.11.x  |  9  |  9  |  1  | 19  |
  2024.02.x  |  7  |  8  |  0  | 15  |
    master   | 25  | 43  |  1  | 69  |

Classification of failures by reason for master
-----------------------------------------------

                libressl-3.8.2 | 4 
                elfutils-0.189 | 3 
               asterisk-20.5.2 | 2 
                     crun-1.12 | 2 
                  davfs2-1.7.0 | 2 
dmenu-wayland-a380201dff5bf... | 2 
   host-flutter-sdk-bin-3.16.8 | 2 
        host-sentry-cli-2.20.3 | 2 
               libglib2-2.76.1 | 2 
               apcupsd-3.14.14 | 1 
                     dtc-1.7.0 | 1 
                    dust-0.9.0 | 1 
                    fcft-3.1.6 | 1 
           flatbuffers-23.5.26 | 1 
                     frr-8.5.4 | 1 
glibc-2.38-44-gd37c2b20a478... | 1 
                gnu-efi-3.0.18 | 1 
         gobject-introspection | 1 
  gobject-introspection-1.76.1 | 1 
              host-runc-1.1.12 | 1 
              libarchive-3.7.2 | 1 
          libcamera-apps-1.2.1 | 1 
                   linux-6.8.1 | 1 
                     lxc-5.0.3 | 1 
               mariadb-10.11.6 | 1 
                 minisign-0.11 | 1 
                privoxy-3.0.34 | 1 
                python3-3.11.8 | 1 
                    ruby-3.3.0 | 1 
             strongswan-5.9.13 | 1 
               tcf-agent-1.8.0 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/c489b663d151ce622836f872ca6ad88e88be67f7 |     
  riscv32    |        asterisk-20.5.2         | NOK | http://autobuild.buildroot.net/results/a308673a20cc47bafdcd326d4934842fc283328f |     
microblazeel |        asterisk-20.5.2         | NOK | http://autobuild.buildroot.net/results/48435de52fb205db9cc2473d4a348e9a899a224e |     
    m68k     |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/7912cf80d870b9ef48fe87e9e641c32d062d181f |     
   x86_64    |           crun-1.12            | NOK | http://autobuild.buildroot.net/results/b2f2d293e922ccaade4cd5398601850721744056 |     
   nios2     |          davfs2-1.7.0          | NOK | http://autobuild.buildroot.net/results/f5b8c621d8d8917a38a903f4ebf25cddd449b60b | ORPH
  aarch64    |          davfs2-1.7.0          | NOK | http://autobuild.buildroot.net/results/70806057a940c12e433ab3536191309c25353fb4 | ORPH
  mips64el   | dmenu-wayland-a380201dff5bf... | NOK | http://autobuild.buildroot.net/results/54ae4404d9de56b83d3d3034551802392a2d6e2c |     
    m68k     | dmenu-wayland-a380201dff5bf... | NOK | http://autobuild.buildroot.net/results/5ac8bcfd7732fdb1a4ae8a080976de7942f6d0cd |     
    arm      |           dtc-1.7.0            | NOK | http://autobuild.buildroot.net/results/dfe8b74146bdc15c83319404b302adbbdca0ff98 |     
  powerpc    |           dust-0.9.0           | NOK | http://autobuild.buildroot.net/results/e2c22b3ec658ee7ee3afad89197ebf08a8c9485b | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/62ef7c50a1dd78a098699e980651b33576ce6214 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/5895a40225cdf3bb9092145c3905e2cddee69b1c | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/40083aba6d992ffa2f575709eb7ed9b849172646 | ORPH
  aarch64    |           fcft-3.1.6           | NOK | http://autobuild.buildroot.net/results/b61757561c60f5ff9c1fabb7ad08ab92e6ef919e |     
    m68k     |      flatbuffers-23.5.26       | NOK | http://autobuild.buildroot.net/results/f6698456351c387f41b4b99c2344ea9b97b0330c |     
    arc      |           frr-8.5.4            | NOK | http://autobuild.buildroot.net/results/0bf01097615a32f91d7e3d8e9942e20f10c9b5b6 |     
   arceb     | glibc-2.38-44-gd37c2b20a478... | NOK | http://autobuild.buildroot.net/results/61d2a12ee0bac460de7734c01ee9a14410094ebd |     
    arm      |         gnu-efi-3.0.18         | NOK | http://autobuild.buildroot.net/results/2541ce0f6e23da567c6b34e16899b4468ad95dfe |     
microblazeel |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/fa1e9bd30216b1ec0eaf75e5499242b0e087b61f |     
    or1k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/e035375ff784005cf809cb8df54e92b1c90aaa77 | ORPH
   x86_64    |  host-flutter-sdk-bin-3.16.8   | NOK | http://autobuild.buildroot.net/results/a73eefd32300d2dc71e292347a7af45be741e2c0 |     
  riscv64    |  host-flutter-sdk-bin-3.16.8   | NOK | http://autobuild.buildroot.net/results/346a60e9da6b96db1cdd9401598ea42ed68fa25e |     
    arm      |        host-runc-1.1.12        | NOK | http://autobuild.buildroot.net/results/f1dd7a1b1f94adbe5594ffa1922a4b85dcd5f7ce |     
powerpc64le  |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/38bb9ba17d6b1d9640f9138506fa5dce399bc215 |     
   arceb     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/6cf01a0ef5b38b3eaa6ed9c773a280e39edc205c |     
 powerpc64   |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/014d38c297c4313d2ca66934c8c61b0cc12eada9 |     
    i586     |      libcamera-apps-1.2.1      | NOK | http://autobuild.buildroot.net/results/9deb45d7a4ba86d37cf8a3ff4566e1eaaf17b623 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/6d6b5c6528de2fc1035452b8d5bb0c318089e07c |     
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/c211bf00a046ff688457035ca9e0a9a0003d27e8 |     
microblazeel |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/9a2453a7cb9b8cdf050a73aa6f1a0fa8080a7b5e | ORPH
   arceb     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/2c2b8223f5aebc5d8410006a65e6bfcdecc3ccaf | ORPH
    mips     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/e301b6166e6640bd0dd7ffcaa07982ef4baba6ae | ORPH
  mips64el   |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/ce494a69fe8328cac844cbf90d953e467abb78a5 | ORPH
   x86_64    |          linux-6.8.1           | NOK | http://autobuild.buildroot.net/results/199cd21677a98fe753b401f1461da307415febbf | ORPH
  aarch64    |           lxc-5.0.3            | NOK | http://autobuild.buildroot.net/results/633597bce0867d8a55623d666bf594ff720027a0 |     
   sparc     |        mariadb-10.11.6         | NOK | http://autobuild.buildroot.net/results/96153ef5eb4f72284d6708e9059910b6ac44cf4c | ORPH
    m68k     |         minisign-0.11          | NOK | http://autobuild.buildroot.net/results/7a391040b6dc9b65b5a04acd3ae63bf5cbffb353 |     
    sh4      |         privoxy-3.0.34         | NOK | http://autobuild.buildroot.net/results/74e20549190ebb0926e8306bfa07137791b27e7d |     
   x86_64    |         python3-3.11.8         | NOK | http://autobuild.buildroot.net/results/c854080e003e9a7d525325073190b472a8f982aa |     
  riscv64    |           ruby-3.3.0           | NOK | http://autobuild.buildroot.net/results/c9f1d190f9ac9ebd6f03feca571286f152d6ced7 |     
   mips64    |       strongswan-5.9.13        | NOK | http://autobuild.buildroot.net/results/afe09a11f5ae8a89a070b3fbd2894907b24d025b |     
    i686     |        tcf-agent-1.8.0         | NOK | http://autobuild.buildroot.net/results/e73f316f59d7975aeea1e3db1b47c5985eeb3e1f |     
  aarch64    |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/a5800534541aa37f13ac6516e3bcddfdbe01415a |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

               gupnp-av-0.14.0 | 3 
                  clamav-1.0.5 | 1 
            freeswitch-1.10.11 | 1 
               libglib2-2.72.3 | 1 
                    proj-8.1.1 | 1 
                       unknown | 1 
                    volk-2.5.2 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          clamav-1.0.5          | NOK | http://autobuild.buildroot.net/results/0ba28e585f7f2157942683eb53fc284525f48125 |     
  riscv64    |       freeswitch-1.10.11       | NOK | http://autobuild.buildroot.net/results/f37d4a9d9c127fa293d8e12e1b4c6230aa643dcf |     
    sh4      |        gupnp-av-0.14.0         | NOK | http://autobuild.buildroot.net/results/51e45ad67d81a70fe550c04ed5bc2b6ec2947c2f |     
    m68k     |        gupnp-av-0.14.0         | NOK | http://autobuild.buildroot.net/results/4d6f490c8a1656d4c76cf1c528d7509123689f57 |     
   nios2     |        gupnp-av-0.14.0         | NOK | http://autobuild.buildroot.net/results/9beaa4977f9670d337ce2976fe37cf21e5673c21 |     
    arc      |        libglib2-2.72.3         | NOK | http://autobuild.buildroot.net/results/10178d15ac57f866ceda4d6faeb8bb48b54f017f |     
 powerpc64   |           proj-8.1.1           | NOK | http://autobuild.buildroot.net/results/f9e20b8fe5401e6f2c0ea92d6fbf6c0a33d0d0a3 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/350f44819ce87dc1f1a8ce0f8eb35e7b713cc387 |     
  powerpc    |           volk-2.5.2           | NOK | http://autobuild.buildroot.net/results/743a19e064f38d74243b7adc49e8f2f2ebb74315 |     


Classification of failures by reason for 2023.11.x
--------------------------------------------------

               apcupsd-3.14.14 | 1 
                  boost-1.83.0 | 1 
                 coreutils-9.3 | 1 
                     efivar-38 | 1 
            freeswitch-1.10.11 | 1 
         gobject-introspection | 1 
   host-flutter-sdk-bin-3.13.9 | 1 
                   oatpp-1.3.0 | 1 
                 openssh-9.6p1 | 1 
                    pppd-2.5.0 | 1 


Detail of failures for 2023.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/1e3f580a27030dd904d6411a34aba93b18e8695b |     
   x86_64    |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/149fdadd4ee8a5a1db2d6cc450b886a1379fa925 |     
    or1k     |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/6bc813a7830039e76d63eff2b89a7d233e31f626 | ORPH
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/d517c496608cf5094a165b3ff6720c8151502942 |     
    i586     |       freeswitch-1.10.11       | NOK | http://autobuild.buildroot.net/results/c506b140c0588c311263153b09f36d30b173a104 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/3b844b34813e11eaf43f245dc9ce38f983be4225 |     
    arc      |  host-flutter-sdk-bin-3.13.9   | NOK | http://autobuild.buildroot.net/results/1b284073ef18e7216af98b60f0b7a6c3f964043b |     
    m68k     |          oatpp-1.3.0           | NOK | http://autobuild.buildroot.net/results/98b6623cfa6977df39b8626b5c8815170baeeab1 |     
   armeb     |         openssh-9.6p1          | NOK | http://autobuild.buildroot.net/results/f31d28c69093a62080aa84f9187391be2bbc1ce1 | ORPH
   sparc     |           pppd-2.5.0           | NOK | http://autobuild.buildroot.net/results/ad9e7b90abd17c2c077d8e5239857b628fb3f7b2 |     


Classification of failures by reason for 2024.02.x
--------------------------------------------------

               apcupsd-3.14.14 | 1 
               belle-sip-4.4.8 | 1 
                 coreutils-9.3 | 1 
host-heimdal-f4faaeaba371ff... | 1 
               libglib2-2.76.1 | 1 
                  octave-8.4.0 | 1 
                privoxy-3.0.34 | 1 
               pulseaudio-17.0 | 1 


Detail of failures for 2024.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/b72a766ca308ee43bc7f2b2bb991356110ae211d |     
   xtensa    |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/5c2cf1765340a420418c99b3ab33efd897167fbc |     
    arc      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/c795775eef68b1005aa7824dcacc4aae628081f9 | ORPH
    arm      | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/ea7c41108b8ea2ce3af71c8c9e80b1ddb642871e | ORPH
   arceb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/076f27d88ee3841e361fffa743fd56d2564482c8 |     
  riscv64    |          octave-8.4.0          | NOK | http://autobuild.buildroot.net/results/7d6af77a9c52a00b6e445df4b78d40aa0d03af5c |     
   x86_64    |         privoxy-3.0.34         | NOK | http://autobuild.buildroot.net/results/6cb36e47aecc2303abbed1bd65fca2c44c620de4 |     
    arm      |        pulseaudio-17.0         | NOK | http://autobuild.buildroot.net/results/ddae2ec4200f67299146fb722915263669bcaf60 | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
