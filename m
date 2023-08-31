Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D5E9C83F10
	for <buildroot@archiver.kernel.org>; Thu, 31 Aug 2023 05:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B05460BC3;
	Thu, 31 Aug 2023 05:41:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B05460BC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 73AF54zb6opm; Thu, 31 Aug 2023 05:41:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8171360BD8;
	Thu, 31 Aug 2023 05:41:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8171360BD8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E195D1BF4E6
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 05:41:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4FB882207
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 05:41:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4FB882207
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iHiGFBGx-FVy for <buildroot@lists.busybox.net>;
 Thu, 31 Aug 2023 05:41:15 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A7E582204
 for <buildroot@buildroot.org>; Thu, 31 Aug 2023 05:41:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A7E582204
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6992860003
 for <buildroot@buildroot.org>; Thu, 31 Aug 2023 05:41:12 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Thu, 31 Aug 2023 05:41:12 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20230831054116.C4FB882207@smtp1.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1693460472; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nnbG5LjE6orir9nPQNZiJ84oBnqeuNskcN1NMHlvhbE=;
 b=BhPKDRzExzu5K/XuCVm2XlqjExMOwtl0QfJoussfLKDGyOI4QjjL0oYuHDI3y7zBizHxwD
 v9wUSbMMXImsvRriCHeEetPXbdQ201eNHwT/b8xhwjhCc6UkIJoNmPUHaHILGa4joIpLhS
 dIM5LdPRTKYgpwu72WpSmpWEg8eWKBCIcZQAqqo+yseM6F2B1wTyb4glPO+ZDY1cRgXCSu
 d1u+EmtKveBtjViie7SPD//xm4s1XVRJPGYZdIZhLITCiOoMY6gZ8boC5KLdL95oVvB/tN
 pxJdGqfxlRS+5iaz6e00Xd1Wso4qCxG6qdqQ04SCmY1B20NhQO9ON501t64M0A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BhPKDRzE
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-08-30
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

Autobuild statistics for 2023-08-30
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  2  |  4  |  0  |  6  |
  2023.05.x  |  2  |  3  |  0  |  5  |
    master   | 74  | 52  |  1  | 127 |

Classification of failures by reason for master
-----------------------------------------------

              libxcrypt-4.4.33 | 12
                elfutils-0.189 | 3 
glibc-2.37-2-g9f8513dc64119... | 2 
                host-go-1.20.7 | 2 
         host-sentry-cli-2.8.0 | 2 
                  linux-6.4.12 | 2 
                     lxc-5.0.2 | 2 
                       unknown | 2 
                alsa-lib-1.2.9 | 1 
             batman-adv-2022.3 | 1 
                  cairo-1.16.0 | 1 
                  clang-15.0.3 | 1 
             cni-plugins-1.3.0 | 1 
                   cpuload-0.3 | 1 
                 erlang-26.0.2 | 1 
                  eudev-3.2.12 | 1 
                 fdk-aac-2.0.2 | 1 
fs/romfs/romfs.mk:32: /home... | 1 
              fstrcmp-0.7.D001 | 1 
         gobject-introspection | 1 
  gobject-introspection-1.76.1 | 1 
               libdeflate-1.18 | 1 
                libglvnd-1.4.0 | 1 
                   libnss-3.92 | 1 
                  libzip-1.9.2 | 1 
               linux-pam-1.5.3 | 1 
               madplay-0.15.2b | 1 
              open62541-v1.3.6 | 1 
                python3-3.11.5 | 1 
              shellinabox-2.20 | 1 
                    sslh-1.22c | 1 
               tcf-agent-1.7.0 | 1 
        util-linux-libs-2.39.1 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |         alsa-lib-1.2.9         | NOK | http://autobuild.buildroot.net/results/768eb0d5e11ba1e668cc2054bfb0d7d2ace929de |     
   s390x     |       batman-adv-2022.3        | NOK | http://autobuild.buildroot.net/results/3b2661046578d4bd9c0a6852b838ab96ea549e5e |     
   xtensa    |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/170f2bcb78b411050e5e3dc5e939c7c71bb3f945 |     
   armeb     |          clang-15.0.3          | NOK | http://autobuild.buildroot.net/results/e0ecb1f0dfe0d6afa5a795774c274b184a93e950 |     
powerpc64le  |       cni-plugins-1.3.0        | NOK | http://autobuild.buildroot.net/results/a8a98d872628992222f9cc71e9bdc5daa548003a |     
   arceb     |          cpuload-0.3           | NOK | http://autobuild.buildroot.net/results/0024c28776d980e74969c176f821a3a846dc33a4 |     
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/900dd6fd6055cb0b2d771287d527d1055eb69c82 | ORPH
   arceb     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/57115cec282552e40de9fd1cb561c8c4355c1f10 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/5f4f4233b14d54e1a63f6310304ca2ac4b695cfb | ORPH
  aarch64    |         erlang-26.0.2          | NOK | http://autobuild.buildroot.net/results/c08faf550db711acabcfa8eee6582ec017a832e8 |     
    arc      |          eudev-3.2.12          | NOK | http://autobuild.buildroot.net/results/888411559e578390152a22bf6c6f3817fe2d36d1 |     
    i686     |         fdk-aac-2.0.2          | NOK | http://autobuild.buildroot.net/results/13c05782d1df7f544f3ee7053f679afe4a8b037e |     
  sparc64    | fs/romfs/romfs.mk:32: /home... | NOK | http://autobuild.buildroot.net/results/78dd33001bb3c7dbd60bff87f3857b23432370ae |     
   mipsel    |        fstrcmp-0.7.D001        | NOK | http://autobuild.buildroot.net/results/cc1a29928accc46fcb7b6193d0b91a5ad2d9b806 |     
powerpc64le  | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/474e86269b654f751450e24bb120789bda67ed06 |     
powerpc64le  | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/197054e4185169ec6ba8ece1fb15a4a3e5886bc1 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/4d8b45bb1cfc6a6820d2fb9a8a12fb1a24cde75e |     
   nios2     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/174183fa6e348a5f06313aacf0028ed98e96fd8c | ORPH
 aarch64_be  |         host-go-1.20.7         | NOK | http://autobuild.buildroot.net/results/0538a26901a95a077ec89a94431f6cee0611f721 |     
   xtensa    |         host-go-1.20.7         | NOK | http://autobuild.buildroot.net/results/be5e1a0498521ea159a66543fa892d7270e95a52 |     
   mipsel    |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/69ce7636e9793d876fb853ae5d0794c9a0c0981c |     
   armeb     |     host-sentry-cli-2.8.0      | NOK | http://autobuild.buildroot.net/results/11b899b87c282cab397ccd0a087032061bc73f08 |     
    arm      |        libdeflate-1.18         | NOK | http://autobuild.buildroot.net/results/540be2d07cf768c9fa5f3cd36201168c576d5d47 |     
   mips64    |         libglvnd-1.4.0         | NOK | http://autobuild.buildroot.net/results/16a9167d8d594845f3979e2ebc1897dc742eba95 | ORPH
  powerpc    |          libnss-3.92           | NOK | http://autobuild.buildroot.net/results/de59886d80f98b808d35d0c441639e9fec264e2b |     
  aarch64    |        libxcrypt-4.4.33        | NOK | http://autobuild.buildroot.net/results/8b0224db9df33ba6d3e873ea2065acf49dab7a9f |     
   x86_64    |        libxcrypt-4.4.33        | NOK | http://autobuild.buildroot.net/results/2e4515545dfa0c78b3017cc8c64856837c8e4243 |     
  aarch64    |        libxcrypt-4.4.33        | NOK | http://autobuild.buildroot.net/results/1a9ff6ff39b415c3d527990aa2de3724d6678b83 |     
    arm      |        libxcrypt-4.4.33        | NOK | http://autobuild.buildroot.net/results/9e847a9bf1a23fb9e4d4167f159631468f6ccba0 |     
   s390x     |        libxcrypt-4.4.33        | NOK | http://autobuild.buildroot.net/results/17bdbcb046ca7f1cf66cdff779d2431b27addadb |     
  sparc64    |        libxcrypt-4.4.33        | NOK | http://autobuild.buildroot.net/results/a3a2e84200a8352a37b93e86ab7849817b3242f9 |     
   x86_64    |        libxcrypt-4.4.33        | NOK | http://autobuild.buildroot.net/results/609e073d3754252c8e8624064d4704e8c4ee1292 |     
    i486     |        libxcrypt-4.4.33        | NOK | http://autobuild.buildroot.net/results/5555039ccdb225f2f666c37a067e5cf0c8a5cf32 |     
   armeb     |        libxcrypt-4.4.33        | NOK | http://autobuild.buildroot.net/results/993490f3a4f4f0053be33f495507416a5a0d26aa |     
   mips64    |        libxcrypt-4.4.33        | NOK | http://autobuild.buildroot.net/results/dd1b7b9732364e0222dcee7c681ff48c34b61ca9 |     
    i686     |        libxcrypt-4.4.33        | NOK | http://autobuild.buildroot.net/results/3bc67701bbee898b49d4ebada7fd504dea4335b8 |     
   sh4eb     |        libxcrypt-4.4.33        | NOK | http://autobuild.buildroot.net/results/6008b9077813351ade6ec4d435ec62badcdb25af |     
    arc      |          libzip-1.9.2          | NOK | http://autobuild.buildroot.net/results/5725f7c04126bd49e39c4c2a16b2ce448e820947 | ORPH
    arc      |          linux-6.4.12          | NOK | http://autobuild.buildroot.net/results/5c5c8ca3ea9df50dd678e083d83da4d4215861e9 | ORPH
  mips64el   |          linux-6.4.12          | NOK | http://autobuild.buildroot.net/results/ce6defca6fc9d514a41ee5f526175409d78b36f2 | ORPH
   arceb     |        linux-pam-1.5.3         | NOK | http://autobuild.buildroot.net/results/04900c35c6866833cc49d03226b37f3eb90fb16d | ORPH
    mips     |           lxc-5.0.2            | NOK | http://autobuild.buildroot.net/results/0a1df7d2617342970aec009a19f56006d68556fa |     
powerpc64le  |           lxc-5.0.2            | NOK | http://autobuild.buildroot.net/results/e1f83600164750f75099b6cfe1a70de42f1db215 |     
   armeb     |        madplay-0.15.2b         | NOK | http://autobuild.buildroot.net/results/4847f65e1cef0991e6c8246eed835b8229d23950 | ORPH
   armeb     |        open62541-v1.3.6        | NOK | http://autobuild.buildroot.net/results/5b25d63d2415775bb8027f8ff75ed5551f83bb0e | ORPH
   x86_64    |         python3-3.11.5         | NOK | http://autobuild.buildroot.net/results/cf339ed2011a97dda4333f1da59b4cd6a5c44e88 |     
   xtensa    |        shellinabox-2.20        | NOK | http://autobuild.buildroot.net/results/baf3c939fd7d4d9ce17eed5389cbce8c457fb9a4 |     
   sh4eb     |           sslh-1.22c           | NOK | http://autobuild.buildroot.net/results/17752a8cb7f5538834125545705ae8f170ca86de |     
 microblaze  |        tcf-agent-1.7.0         | NOK | http://autobuild.buildroot.net/results/07f19ee287062fc02ed620ddee53b913dfbe27d4 |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/1f13d1182784fe00d7180d2b228c6a9f4afb6701 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/6a6f74bf8578e27b6eb7e01041520afe15ca540a |     
 microblaze  |     util-linux-libs-2.39.1     | NOK | http://autobuild.buildroot.net/results/d5bc942b38665857d461cf24ee6925b84188ef84 | ORPH
 powerpc64   |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/65c145ad83548db3d758a89e59b007153cf932fa |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

              erlang-22.3.4.22 | 1 
  gobject-introspection-1.72.0 | 1 
                  ntp-4.2.8p15 | 1 
       python-stack-data-0.6.2 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |        erlang-22.3.4.22        | NOK | http://autobuild.buildroot.net/results/9d809766d86b4ad5559498e1e284da5e9547dec0 |     
    or1k     |  gobject-introspection-1.72.0  | NOK | http://autobuild.buildroot.net/results/4b9d0bfb153669507566b961eabee7a773a04cf1 | ORPH
   sh4aeb    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/63fc05ad4b4a5409cfcf340e8f4d88faf4b16d94 |     
 aarch64_be  |    python-stack-data-0.6.2     | NOK | http://autobuild.buildroot.net/results/bbb70b1b5abe723272b09e4d4c1eae3baf3610cc |     


Classification of failures by reason for 2023.05.x
--------------------------------------------------

glibc-2.37-2-g9f8513dc64119... | 1 
                 opensc-0.22.0 | 1 
   openvmtools-11.3.5-18557794 | 1 


Detail of failures for 2023.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    | glibc-2.37-2-g9f8513dc64119... | NOK | http://autobuild.buildroot.net/results/cefb036ae8cee10cf15b2cc9dae59f4c31fca4e2 |     
powerpc64le  |         opensc-0.22.0          | NOK | http://autobuild.buildroot.net/results/657f4ebe427dd6fc8b0ba405ce5f894beaccb372 | ORPH
    i686     |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/9a0df03084e4b447d5faa613fe3b4d0f4da2b598 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
