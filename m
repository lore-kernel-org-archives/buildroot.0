Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 653A7CE79AD
	for <buildroot@archiver.kernel.org>; Wed, 20 Sep 2023 06:31:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBCDF41E86;
	Wed, 20 Sep 2023 06:31:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBCDF41E86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HvH2CVoHzsBe; Wed, 20 Sep 2023 06:31:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DD6F41B56;
	Wed, 20 Sep 2023 06:31:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DD6F41B56
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9FECC1BF97A
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 06:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 859D560BEB
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 06:31:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 859D560BEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OEO-TfjkNwYF for <buildroot@lists.busybox.net>;
 Wed, 20 Sep 2023 06:31:00 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B93A160B2A
 for <buildroot@buildroot.org>; Wed, 20 Sep 2023 06:30:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B93A160B2A
Received: by mail.gandi.net (Postfix) with ESMTPSA id BAE1DFF803
 for <buildroot@buildroot.org>; Wed, 20 Sep 2023 06:30:56 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 20 Sep 2023 06:30:56 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20230920063101.859D560BEB@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1695191456; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=G0aNE2mcUjrVRpVP5hoJH1wx2O8kceNxnVdg0DftyOo=;
 b=VuhJreUxa6nnXYfEMeOFupQnPIhQPu/jZEyIyLtCm5JjCidgk6wTt25oRL5Z+JMc1tAXd0
 8fgrD8AyuRazh5sUiJqgw5KwD8pUVBvsEEJZ6CJkavOLPMgPp5Qdqjj++t/ovIImu4wI9s
 ItcMSn5Dw+z0qTPx9c3Dxj1Gvc1pr/Dc+Py1G3tSDRhqPdrKQGku+Z4pEwIONCnfSs/qxL
 DyVHQqMngPoRHEqV1f1tVXThHEo+UWndlD7z+7G7WzfE/7vi2rFvJ0iRT4n44iIMPrb5Zt
 kDRVujjgMS6K3ROvzUhjqUpI8UuHCluQMw87tBuLt4vhwqWrINywaEOAy9cicQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VuhJreUx
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-09-19
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

Hello,

Autobuild statistics for 2023-09-19
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  5  |  2  |  0  |  7  |
  2023.05.x  |  6  |  8  |  0  | 14  |
  2023.08.x  |  7  |  5  |  0  | 12  |
    master   | 52  | 34  |  0  | 86  |

Classification of failures by reason for master
-----------------------------------------------

             util-linux-2.39.2 | 3 
check-11970a7e112dfe243a2e6... | 2 
                     efivar-38 | 2 
  gobject-introspection-1.76.1 | 2 
            host-erlang-26.0.2 | 2 
                host-go-1.21.1 | 2 
                  boost-1.83.0 | 1 
               dbus-glib-0.112 | 1 
        edk2-edk2-stable202308 | 1 
                  eudev-3.2.12 | 1 
                 fdk-aac-2.0.2 | 1 
                    gdal-3.6.2 | 1 
           ghostscript-10.01.2 | 1 
google-breakpad-c85eb4a59b6... | 1 
        host-sentry-cli-2.20.3 | 1 
                  linux-6.4.14 | 1 
               mariadb-10.11.4 | 1 
mmc-utils-613495ecaca97a19f... | 1 
                  motion-4.5.1 | 1 
                    olsr-0.9.8 | 1 
                 openvpn-2.6.6 | 1 
                oprofile-1.4.0 | 1 
                   perl-5.36.1 | 1 
                    proj-8.1.1 | 1 
                       unknown | 1 
         vulkan-loader-1.3.262 | 1 
                    zeek-4.1.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          boost-1.83.0          | NOK | http://autobuild.buildroot.net/results/deec8395170a48ec34b122322723fc903063162f |     
   x86_64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/2b4abd19c4ed0df49f05460e6051de7d9198080c | ORPH
   arceb     | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/3ec8a8743a16e298a2a19924feecf2eb45d4c174 | ORPH
   sparc     |        dbus-glib-0.112         | NOK | http://autobuild.buildroot.net/results/8d857e8a0062e7cbe7a9493c9d48528383137e8b | ORPH
   x86_64    |     edk2-edk2-stable202308     | NOK | http://autobuild.buildroot.net/results/a057a4c5a37621dd4746c40a09b0e77d49e026fc |     
    arm      |           efivar-38            | NOK | http://autobuild.buildroot.net/results/7afeb0818bcb3a22241abfa36d94df5ed92dfdf8 |     
   mipsel    |           efivar-38            | NOK | http://autobuild.buildroot.net/results/d4ba6f4f163a2fc74e1f3e81330c3a3f62a150ed |     
   arceb     |          eudev-3.2.12          | NOK | http://autobuild.buildroot.net/results/5db281b19a80d0e69f7fe068403b75a8be68e5c1 |     
  aarch64    |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/ce4adc4ee3a704e10501c3d70d4b73906a0c80eb |     
    sh4      |           gdal-3.6.2           | NOK | http://autobuild.buildroot.net/results/562b2845b62da663fa34d1c7c9e8905f00d89041 |     
    sh4      |      ghostscript-10.01.2       | NOK | http://autobuild.buildroot.net/results/34f722335a10e749e6a99cefb43b2298d6c540ef |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/251583a759930c8dfe8d9c44c7968c0450605eb5 | ORPH
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/087f36e59501c2d0e322e0cb44d37420d5b4a574 | ORPH
   x86_64    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/35e54ff07e7cc689a803beaa56f5068432e25179 |     
    i686     |       host-erlang-26.0.2       | NOK | http://autobuild.buildroot.net/results/ed98fef2fd01437f74f381392e6c70d10144294a |     
   mipsel    |       host-erlang-26.0.2       | NOK | http://autobuild.buildroot.net/results/e58f1a40bf2ff36a24b65538ad49c907e584b395 |     
   nios2     |         host-go-1.21.1         | NOK | http://autobuild.buildroot.net/results/52cd01453e365fa3b41c4cec7e9f54f3ccd936f5 |     
  mips64el   |         host-go-1.21.1         | NOK | http://autobuild.buildroot.net/results/8c634cba5185a503a1b671d10084de050af5d325 |     
    or1k     |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/b780c6ac707b81a7e9bfbafdf9de255b566a096c |     
   mips64    |          linux-6.4.14          | NOK | http://autobuild.buildroot.net/results/626b4e08dc0c85a92dff25028e84afd8b8123cef | ORPH
   mips64    |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/c086962e5832925951a28cfe507c1921de720fb1 | ORPH
  mips64el   | mmc-utils-613495ecaca97a19f... | NOK | http://autobuild.buildroot.net/results/ac5865610a081e30e03cc3ef4cf57aaa9d516fb3 |     
   armeb     |          motion-4.5.1          | NOK | http://autobuild.buildroot.net/results/0e85bd50f3da452043d4a0f699b28b3ab73a57d4 |     
   mipsel    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/847d836c8a1ef26614c2657441b98549c5eadda1 | ORPH
    arm      |         openvpn-2.6.6          | NOK | http://autobuild.buildroot.net/results/46609f90634d22d8388bbc92e28aa032f733ce56 | ORPH
  mips64el   |         oprofile-1.4.0         | NOK | http://autobuild.buildroot.net/results/0d129b6700172a72d32a026b5edf23bdc98ef7e0 |     
   arceb     |          perl-5.36.1           | NOK | http://autobuild.buildroot.net/results/c5de426e06fbe89d6199362b426297c560044b56 |     
  riscv32    |           proj-8.1.1           | NOK | http://autobuild.buildroot.net/results/cebe11fd4eb4a51b430f35174e0c2d15a47035fe |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/e1311832c5b8abe52dd85e0f46df488da3fb9bac |     
    sh4      |       util-linux-2.39.2        | NOK | http://autobuild.buildroot.net/results/c9a2efc0c700097cdebce8cb05882c3ac63eeece | ORPH
    sh4      |       util-linux-2.39.2        | NOK | http://autobuild.buildroot.net/results/d1f4d30f5c9b244f1771d0e5f85db1c5c570bde3 | ORPH
    arm      |       util-linux-2.39.2        | NOK | http://autobuild.buildroot.net/results/da8b98ab06f27c5ab9f504f412dc3e7a9adb5c08 | ORPH
  aarch64    |     vulkan-loader-1.3.262      | NOK | http://autobuild.buildroot.net/results/55ddfd44393e3bcc2f25bad2f9ecb7e1b142a985 |     
microblazeel |           zeek-4.1.1           | NOK | http://autobuild.buildroot.net/results/30e13984fc8e6ac260739b9200d9b090d9deecf1 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

         nftables-python-1.0.7 | 1 
                    olsr-0.9.8 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |     nftables-python-1.0.7      | NOK | http://autobuild.buildroot.net/results/cbb4c5e8705649a02f74e9fe768be63b943b0130 |     
   mipsel    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/0eac9c0393cdee012eac48e6a0d47df5db58e86b | ORPH


Classification of failures by reason for 2023.05.x
--------------------------------------------------

                  linux-6.3.13 | 2 
                 coreutils-9.3 | 1 
               host-go-1.19.13 | 1 
                  libbpf-1.1.0 | 1 
               libvorbis-1.3.7 | 1 
                mongodb-4.2.18 | 1 
               zxing-cpp-1.4.0 | 1 


Detail of failures for 2023.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         coreutils-9.3          | NOK | http://autobuild.buildroot.net/results/d7bd7cac8bdf09d0fcf5abd05b51a32fd319576a | ORPH
  mips64el   |        host-go-1.19.13         | NOK | http://autobuild.buildroot.net/results/cad2001a6edc10bb442bd43a37fbdab3fceb2040 |     
  mips64el   |          libbpf-1.1.0          | NOK | http://autobuild.buildroot.net/results/409fe1070330476cae7d8bb287b09dc5ac6b8266 |     
  powerpc    |        libvorbis-1.3.7         | NOK | http://autobuild.buildroot.net/results/2d6bae5cb5d3df300bf23a2b2fea6f900b4b53dd |     
   mipsel    |          linux-6.3.13          | NOK | http://autobuild.buildroot.net/results/c7626218485b0533e44dd95db5b6db533e8edebd | ORPH
   mipsel    |          linux-6.3.13          | NOK | http://autobuild.buildroot.net/results/c7242d3a557018b34d1b3369b80706b6202d48dd | ORPH
  aarch64    |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/3bc70cc7364003205dc290676ce409f508a6e541 |     
    arm      |        zxing-cpp-1.4.0         | NOK | http://autobuild.buildroot.net/results/5ac998f5dd485152c99596da41bd101dc2bfae12 |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

             util-linux-2.39.1 | 2 
                bpftool-v7.1.0 | 1 
                oprofile-1.4.0 | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |         bpftool-v7.1.0         | NOK | http://autobuild.buildroot.net/results/cee853221dadcd9f2705ae76829fa510b5d8fb60 |     
    arm      |         oprofile-1.4.0         | NOK | http://autobuild.buildroot.net/results/7829d42ee329900b96b795dda96b34a2f0a90e17 |     
    i686     |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/281a765fb7076016e7e7fd8094c7bd5a7190e322 | ORPH
    or1k     |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/619c3dce2e271769c5026eb7ed122a35251f1879 | ORPH
  sparc64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/cf8e8ef2524ae79cf60ae94efc82956799d39bbf | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
