Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB6CC433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 07:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 087104157A;
	Wed,  9 Feb 2022 07:46:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mA-WiZBISXRc; Wed,  9 Feb 2022 07:46:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17E0641575;
	Wed,  9 Feb 2022 07:46:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 467421BF27C
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 07:46:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34B3183103
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 07:46:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RE-5QEv1dK73 for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 07:46:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 68AA982FF9
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 07:46:18 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2EB11240004
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 07:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1644392775; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NX/YSFQSrELbNhxjfHZDxnzU2n2/R+1pvAyaohPbkeE=;
 b=cuSCsCMwqw7E1A23tp1iy5TQNUSB9DqH0CEflhfRnV4bfAIawH+3SIz+AyXLWyfaXpOmSd
 HWeEf1qT7M9WByk1+nzeOyoLWheNwzUT5vBHvwSV2M5Qry+1TCf/4/FYKi+W75oni8bQHW
 qYUeYhkenJhqYP0D7+j44lpoTaQoL39tOZc0lXdz7zPXOsd0lNwUaaoqsl0MRRqXanxyMO
 CPyOICcZnreLft5yLfZIU7sQ/2II322PHh6u4UfPiq8qDGg6jhka7JglHZGNZUZTKR+iBY
 00eRrcgTfKuWJ80V0to9+CZyHI5pHBUdmVQxRKhpowPEFs8yBoQqMRw3mGSlMw==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 09 Feb 2022 07:46:14 -0000
Message-Id: <20220209074620.34B3183103@smtp1.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-02-08
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

Autobuild statistics for 2022-02-08
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 48  |  7  |  0  | 55  |
  2021.11.x  | 14  |  0  |  0  | 14  |
    master   | 60  | 44  |  0  | 104 |

Classification of failures by reason for master
-----------------------------------------------

           host-libselinux-3.3 | 7 
                 gerbera-1.9.2 | 5 
             bluez5_utils-5.63 | 4 
   host-python-docutils-0.15.2 | 4 
                       unknown | 3 
        python-docutils-0.15.2 | 2 
                 wavemon-0.9.4 | 2 
                  boinc-7.18.1 | 1 
                  cairo-1.16.0 | 1 
docker-proxy-55685ba49593e6... | 1 
                       frr-8.1 | 1 
                   guile-3.0.7 | 1 
              host-grpc-1.43.0 | 1 
              keepalived-2.2.7 | 1 
librtlsdr-ed0317e6a58c09887... | 1 
               linux-pam-1.5.2 | 1 
 Makefile:747: target-finalize | 1 
                   neon-0.32.2 | 1 
                 opencv4-4.5.5 | 1 
         python-greenlet-1.1.2 | 1 
            resiprocate-1.12.0 | 1 
                rtorrent-0.9.8 | 1 
                  rygel-0.40.2 | 1 
                  sudo-1.9.8p2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/5c96d82719691ad307021591bd5ef0d2de952ad0 |     
    m68k     |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/1e33ed794dfb5248e667feee2c3ec9a7a52f5056 |     
 powerpc64   |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/f417516c61d4999f17dfc16399a4d596d7d33beb |     
  riscv64    |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/0ddf026413bf968600124b9869511c3a54663771 |     
   x86_64    |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/5022a9dc3ea7c073be0b1c0c608428ae94ad4c26 |     
   s390x     |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/031d61ed4df168d96be7aa4658733f812d732ef5 |     
   x86_64    | docker-proxy-55685ba49593e6... | NOK | http://autobuild.buildroot.net/results/6c4d434c23f1aef90d04701cc7a79c7a80bfb6e4 |     
   xtensa    |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/010dd5ca7f2b24120212d3b9e2f14a54a59aa6ce |     
    arc      |         gerbera-1.9.2          | NOK | http://autobuild.buildroot.net/results/8d89717067872feccf9127503b49d949351d8df0 |     
   x86_64    |         gerbera-1.9.2          | NOK | http://autobuild.buildroot.net/results/6d50a4b2424a298118252818ec5a5042e9356062 |     
    i686     |         gerbera-1.9.2          | NOK | http://autobuild.buildroot.net/results/d06f0ddc78b0c045e9698f27e93edf08101da925 |     
   x86_64    |         gerbera-1.9.2          | NOK | http://autobuild.buildroot.net/results/b273cb3c5948812456d4386c89f06462afb81a73 |     
    arm      |         gerbera-1.9.2          | NOK | http://autobuild.buildroot.net/results/bc3dcdc6b0ced939368384fff6a63cd25450cae7 |     
    arm      |          guile-3.0.7           | NOK | http://autobuild.buildroot.net/results/f8efe6143bc99f1cedddba9b4a54e7175e859f95 |     
  riscv64    |        host-grpc-1.43.0        | NOK | http://autobuild.buildroot.net/results/44f6d7c61316e90d22e75cb1fb77c3bc5b31ad66 |     
    arm      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/30fa8f979767eceda116b8d390f11b8da3bb2659 |     
  powerpc    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/e43242875be865ef373fed673eabdad45adcc4cb |     
    arm      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/8cd5cd59b22b4e75d83d44130583cb251b4d8115 |     
    arc      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/9d2fe02f9b922771aab72a4369f16125d3fd3159 |     
   nios2     |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/dbe756e340531454f19b8daaa1baf6058582b260 |     
   x86_64    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/064d5f44a2da73b0854869bf6e0678e12124d68d |     
  aarch64    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/aded9c08368582d96de4f36cf8f9c2fc786cd45f |     
    arm      |  host-python-docutils-0.15.2   | NOK | http://autobuild.buildroot.net/results/6b748d2330e869b1a239bca3284bc748ac95b2c9 |     
    i586     |  host-python-docutils-0.15.2   | NOK | http://autobuild.buildroot.net/results/df7af0b8a54156ab8749c57c8c2bf17fb04400ec |     
  mips64el   |  host-python-docutils-0.15.2   | NOK | http://autobuild.buildroot.net/results/a941ae11f18805c4a0d6f672553550127072a571 |     
    arc      |  host-python-docutils-0.15.2   | NOK | http://autobuild.buildroot.net/results/0b0eef5c5f105a0c443529fa66f1ddb9f0ab7434 |     
    arm      |        keepalived-2.2.7        | NOK | http://autobuild.buildroot.net/results/2132570fb0407abc0e70146d771471e13ef10237 |     
   sparc     | librtlsdr-ed0317e6a58c09887... | NOK | http://autobuild.buildroot.net/results/b6f373907f4e9f4979f332a4dfa3241f30a1f8c7 |     
   x86_64    |        linux-pam-1.5.2         | NOK | http://autobuild.buildroot.net/results/94c29bb6393f68547285b5ff8c4c65f644e16097 | ORPH
  aarch64    | Makefile:747: target-finalize  | NOK | http://autobuild.buildroot.net/results/d0c081e1eeb0dc0e988de51cceff02c5c870fbc2 |     
    arm      |          neon-0.32.2           | NOK | http://autobuild.buildroot.net/results/2b005bdfd0f4949cc45dfd427cd6bd796fd56907 | ORPH
    m68k     |         opencv4-4.5.5          | NOK | http://autobuild.buildroot.net/results/edcd1139f2ba4b1a66f61feb222c738718d824f5 |     
    m68k     |     python-docutils-0.15.2     | NOK | http://autobuild.buildroot.net/results/fad07777625e14d1c722821e3a7023d877f2996f |     
   xtensa    |     python-docutils-0.15.2     | NOK | http://autobuild.buildroot.net/results/78ccedbcd1c6cfef2ae52cdf387b353d0dd497b8 |     
  mips64el   |     python-greenlet-1.1.2      | NOK | http://autobuild.buildroot.net/results/42b4cf13af6ce93f8722922a0d21d40faa7375da |     
  riscv32    |       resiprocate-1.12.0       | NOK | http://autobuild.buildroot.net/results/ad9d89fefe1a667daa123397a072bf130bfa03a7 | ORPH
   mipsel    |         rtorrent-0.9.8         | NOK | http://autobuild.buildroot.net/results/e87a99cb0392da58db831a369569537d9ef9be8a | ORPH
    arm      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/7c324c097979e00d383d9ff3e4b6927925253b4e |     
    arm      |          sudo-1.9.8p2          | NOK | http://autobuild.buildroot.net/results/7a5d4dd22343be46a5ddd1c1a1a8e1799517d564 | ORPH
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/5ea7b2b23b6675b926cb5ed84b1d947184b6514e |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/a11e5fba7d7f11c21cc7c44e578e576c82c294be |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/f35806609fcc98e769939e607232e4b2fa4b3d1d |     
  powerpc    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/de7a848ef4555f27a101ca4113e0a148316cbe37 |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/30e4f0c68fa39dc82b52d7d0bf59111526ea11e5 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
monkey-f54856ce250c4e257354... | 2 
                 libp11-0.4.11 | 1 
                       unknown | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1753e968e19c461f00c775b9c43647ef8495381a |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/59aa202cc83eb510da9b8abff23ce9e4cb83cd52 |     
  riscv32    |         libp11-0.4.11          | NOK | http://autobuild.buildroot.net/results/7e033fad93f56db7c5f860374ee2dc6d328b2cb3 | ORPH
    i686     | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/97699054e8252a9d0ea38c404e024d7714b30ec7 |     
   nios2     | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/6f2a352a892f9a709c4c41e56cf8d0afe5c07d92 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/ce1ef4979f5409ab13e5ecf66b2ecb5ba34074c3 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/eb270686f33ea625888f579f28110951296feafd |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
