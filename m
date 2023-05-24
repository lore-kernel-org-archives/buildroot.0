Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF39C77B73
	for <buildroot@archiver.kernel.org>; Wed, 24 May 2023 05:30:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6830B84041;
	Wed, 24 May 2023 05:30:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6830B84041
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4OAD8iOLfzzi; Wed, 24 May 2023 05:30:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 435B18406E;
	Wed, 24 May 2023 05:30:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 435B18406E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7BF4B1BF352
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 05:30:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FAB261569
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 05:30:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FAB261569
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gSVn6GfG2bp0 for <buildroot@lists.busybox.net>;
 Wed, 24 May 2023 05:30:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1043614C4
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F1043614C4
 for <buildroot@buildroot.org>; Wed, 24 May 2023 05:30:37 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 263B12000D
 for <buildroot@buildroot.org>; Wed, 24 May 2023 05:30:34 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 24 May 2023 05:30:34 -0000
Message-Id: <20230524053040.0FAB261569@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1684906235; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iFUCoNWaSyn0ZUJ2ltEcydxEY64IgJZIeXuUVmPwp0M=;
 b=Wlv9jfq1E117rq5WIpGUKfaXDvxItCXr9a7f15PL6M8Z+ugZN5RaBcbvTwu3BzdDLxN2Kb
 4fx4QqNhTtYKJNvlt862uC7o7mJatG0ZNyrMxbvsabrIKHcyVrj47irGlvEhBk+e8EmWD8
 rINab/1CvssRU5UbYDfy9AoT0+gx80WQFlYh/3ZlGqYXXnkjMYm2n1ncVjiHyezn5UabN0
 7Ys+UTb7Gk8S4NpBOydaf1HAQMuOWk1wXljUGoJ4mEoZpsUgEqrzlMSO489xPOqQ60+BWz
 4pk7oGqEKXcKZOWtv+XT14BShuiGBeG4EmfvH6h05CDJ+tgIrA4GQ+3300lKqQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Wlv9jfq1
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-05-23
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

Autobuild statistics for 2023-05-23
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  |  5  |  1  |  0  |  6  |
  2023.02.x  |  5  |  4  |  0  |  9  |
    master   | 81  | 60  |  0  | 141 |

Classification of failures by reason for master
-----------------------------------------------

           at-spi2-core-2.48.2 | 5 
host-heimdal-f4faaeaba371ff... | 5 
package/sdl2_net/sdl2_net.m... | 5 
           sdl2_net-legal-info | 3 
                 agentpp-4.6.0 | 2 
  gobject-introspection-1.74.0 | 2 
            host-binutils-2.39 | 2 
              host-rust-1.68.2 | 2 
sconeserver-8d1935919a20133... | 2 
                    sdl-1.2.15 | 2 
               syslog-ng-4.1.1 | 2 
                  acpid-2.0.34 | 1 
                     audit-3.1 | 1 
                  clamav-1.0.1 | 1 
                    crun-1.8.4 | 1 
fs/cramfs/cramfs.mk:46: /ho... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
            host-binutils-2.37 | 1 
         host-gcc-final-11.3.0 | 1 
igh-ethercat-2e2cef61318953... | 1 
               libcap-ng-0.8.3 | 1 
           libfreeimage-3.18.0 | 1 
               libglib2-2.76.1 | 1 
                 libnss-3.89.1 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                   linux-6.3.2 | 1 
            linux-fusion-9.0.3 | 1 
        ltp-testsuite-20230127 | 1 
                mongodb-4.2.18 | 1 
               nfs-utils-2.6.3 | 1 
            python-sip-4.19.25 | 1 
rtl8189fs-c223a25b1000d6443... | 1 
                   shadow-4.13 | 1 
                sysrepo-2.2.36 | 1 
                   trinity-1.9 | 1 
ulog-0389d243352255f6182326... | 1 
                 wavemon-0.9.4 | 1 
                    xen-4.14.5 | 1 
                     znc-1.8.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mips64    |          acpid-2.0.34          | NOK | http://autobuild.buildroot.net/results/2ccd53588a64f27993781650e5eadd64247dd1a9 | ORPH
 aarch64_be  |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/11c0308ac61795ae911176f1efd48233214c1773 |     
  sparc64    |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/6caa5b0f56bc8e0e7bf94e2a940d005f5fc598d4 |     
  sparc64    |      at-spi2-core-2.48.2       | NOK | http://autobuild.buildroot.net/results/778d09c39ad6f0fa46951ddda1d2e9da19848169 |     
microblazeel |      at-spi2-core-2.48.2       | NOK | http://autobuild.buildroot.net/results/0356adf414eccff2f3b577919e04aefd563f683a |     
 aarch64_be  |      at-spi2-core-2.48.2       | NOK | http://autobuild.buildroot.net/results/d1d67bf147e2eca0c8606d3e989b8d61c58227a1 |     
  sparc64    |      at-spi2-core-2.48.2       | NOK | http://autobuild.buildroot.net/results/105a18678b75db764c45826d9dc58cf4df45aefc |     
    mips     |      at-spi2-core-2.48.2       | NOK | http://autobuild.buildroot.net/results/0be6118dab155eeb9602f59360b2934f19dea308 |     
    arm      |           audit-3.1            | NOK | http://autobuild.buildroot.net/results/49ddae4f6891d753ae8ef9700144dc4b1b5464c9 |     
    arm      |          clamav-1.0.1          | NOK | http://autobuild.buildroot.net/results/bee5dd5d8d22db812c78bf83c8b4b1a5bd9a0dcc |     
   mips64    |           crun-1.8.4           | NOK | http://autobuild.buildroot.net/results/5a34b50e92414edba3196e5b0b75f10ca5ea9c9f |     
 aarch64_be  | fs/cramfs/cramfs.mk:46: /ho... | NOK | http://autobuild.buildroot.net/results/ff5010d2bd25661402fbe8a6c7c4a52e6bda7c6e |     
   nios2     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/0a1b4fe36cbaf80d32ea46b34ff55fff0fc363e0 |     
    or1k     |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/d53ce87037993f09fdaa1ba3b54f6cba4a44d0bb | ORPH
powerpc64le  |  gobject-introspection-1.74.0  | NOK | http://autobuild.buildroot.net/results/a5628b32474a033fc30fbf36f8578a5ea9fe577a | ORPH
   nios2     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/f0d17567c08783bf3e5b3c12cd681fd575cb5dac |     
    arm      |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/8d42d87fc7b9b498ae77cd2341b83770df1323cb |     
microblazeel |       host-binutils-2.39       | NOK | http://autobuild.buildroot.net/results/f38736052db0bce1ce0e13d3512ab8780d126e91 |     
microblazeel |     host-gcc-final-11.3.0      | NOK | http://autobuild.buildroot.net/results/bb5e6e3361e9c5a60a478fffcb9d002cc130bf9d |     
   s390x     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/8212f9725d82ffbe3b0629410a7923d209b8326f | ORPH
   s390x     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/5d45346be58aaa3b0f2a7e54b1d91930e88aca24 | ORPH
   s390x     | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/aad95610365bff04200e2d41ddc409ea9f996631 | ORPH
  sparc64    | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/b087f773c2126cadaf456c483cb93dc979e6bfe9 | ORPH
powerpc64le  | host-heimdal-f4faaeaba371ff... | NOK | http://autobuild.buildroot.net/results/aa35dd9b0f1083df7c37072977855e7b215725e1 | ORPH
  powerpc    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/9068ac3bc75b70df0bab0ffefc3bc3a36013fc65 |     
  sparc64    |        host-rust-1.68.2        | NOK | http://autobuild.buildroot.net/results/9b20e5dd57eb3dd36af798d65bfeacf5a65c0f05 |     
  aarch64    | igh-ethercat-2e2cef61318953... | NOK | http://autobuild.buildroot.net/results/689282fad4765cff587ccbc4a4088a91227addcc |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/89373a5ff16729da01a7a633e5d03916ea0e4cb9 |     
  riscv64    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/5db8a8322f4eaed36ff5556877f3a590b714a10c |     
   armeb     |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/989c5e5b50c7155ce4c09b68102decbb27ce0979 |     
   mips64    |         libnss-3.89.1          | NOK | http://autobuild.buildroot.net/results/3b787fb514556dc57a50db760d6db2fb8a7fc7a5 |     
  sparc64    |   linux-5.10.162-cip24-rt10    | NOK | http://autobuild.buildroot.net/results/14ce852ff73bd155fc8ef2c1b5f5db55e54eb344 | ORPH
    mips     |          linux-6.3.2           | NOK | http://autobuild.buildroot.net/results/7741b9752a77012bd68c6bf8fcec11160e5b9a67 | ORPH
powerpc64le  |       linux-fusion-9.0.3       | NOK | http://autobuild.buildroot.net/results/c6bbcd2dc628e48e52fa665329d971d0658b22f5 | ORPH
   x86_64    |     ltp-testsuite-20230127     | NOK | http://autobuild.buildroot.net/results/211495f5566921339a0ac176be3067b88340187e |     
    arm      |         mongodb-4.2.18         | NOK | http://autobuild.buildroot.net/results/0e5b7c37a6d1f90e211b64e6a9ecf975e9680e7e |     
    arm      |        nfs-utils-2.6.3         | NOK | http://autobuild.buildroot.net/results/ddd8200fd66bcc4fb6aae9ab2e2b68d7b363bd7d |     
   mipsel    | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/117c1b290e4220c9f7c24e3da3884005f6f0faf1 |     
   sh4eb     | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/ce649540f680738b84856aaad85703e645f73cd1 |     
    mips     | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/a001deb8a4e5ba978c89bf1a7a258798a07444b5 |     
   sparc     | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/9fcedf10f89ab4a7810e548208da78304b6e6700 |     
   sparc     | package/sdl2_net/sdl2_net.m... | NOK | http://autobuild.buildroot.net/results/b50f2df7800a44abd48b007b0bbc106d6f444c11 |     
  aarch64    |       python-sip-4.19.25       | NOK | http://autobuild.buildroot.net/results/f0115684ea0188f6fbe0e9219eef4ae457f8fb95 |     
    or1k     | rtl8189fs-c223a25b1000d6443... | NOK | http://autobuild.buildroot.net/results/0cf3f1dc1e1322ef8021d21ebc607c7e37e37acf |     
    i586     | sconeserver-8d1935919a20133... | NOK | http://autobuild.buildroot.net/results/bba6123029e23f87f2a5ab36be75e4bab8615d9e |     
   s390x     | sconeserver-8d1935919a20133... | NOK | http://autobuild.buildroot.net/results/db2deea1470a1116ba37b86c19fc464326eb4c37 |     
   sh4eb     |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/d42d95bc28f66a11bc1a3b9dcf8dd008fb230b3e | ORPH
    sh4      |           sdl-1.2.15           | NOK | http://autobuild.buildroot.net/results/79befda28701d4d4ec10e14803effb68d6558cdd | ORPH
    arm      |      sdl2_net-legal-info       | NOK | http://autobuild.buildroot.net/results/5a9a6f97699ad70c9a1bdafff97b792216a3dc9e | ORPH
   s390x     |      sdl2_net-legal-info       | NOK | http://autobuild.buildroot.net/results/7a500d21fa33a74a1cd7aec942974ba034299acf | ORPH
    arm      |      sdl2_net-legal-info       | NOK | http://autobuild.buildroot.net/results/880f5dc8d727489d319aa4fe1f0df8d10e4bdbeb | ORPH
    sh4a     |          shadow-4.13           | NOK | http://autobuild.buildroot.net/results/a90f3b20e1cc8a807a54cda476e60f4fc1232e37 |     
    sh4      |        syslog-ng-4.1.1         | NOK | http://autobuild.buildroot.net/results/f8b012b2deed6939f263ff57f5a801ed1d51ea4c |     
 powerpc64   |        syslog-ng-4.1.1         | NOK | http://autobuild.buildroot.net/results/281ddd1dd086cd633d5a5dda92b82075ebba7d40 |     
  riscv32    |         sysrepo-2.2.36         | NOK | http://autobuild.buildroot.net/results/62b3d50d9497a0181597800ed23fe6c631e72e64 |     
 powerpc64   |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/652ea09abd90079800677dfe2c850262b9f0d6a6 | ORPH
 aarch64_be  | ulog-0389d243352255f6182326... | NOK | http://autobuild.buildroot.net/results/38e4aa77dc8a8ffb4cfc7f1d66ab55b125d02706 |     
  sparc64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/6df18ac704e69f5660feff7ece264b723709a39e | ORPH
  aarch64    |           xen-4.14.5           | NOK | http://autobuild.buildroot.net/results/442c0f535a22229bf27d9625e1c6e1bcadccc81e |     
   s390x     |           znc-1.8.2            | NOK | http://autobuild.buildroot.net/results/14c44e94b6b588aa033f24202aa8437882cf8792 |     


Classification of failures by reason for 2022.02.x
--------------------------------------------------

libcamera-1966b9a58436fab51... | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    | libcamera-1966b9a58436fab51... | NOK | http://autobuild.buildroot.net/results/f9e6b7383c0f353f682957aebb372c9741d4a77e |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                 agentpp-4.6.0 | 1 
                 coreutils-9.1 | 1 
                elfutils-0.186 | 1 
google-breakpad-c85eb4a59b6... | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |         agentpp-4.6.0          | NOK | http://autobuild.buildroot.net/results/091fdfa980d5e64b5cfa70bc4488de0e0ac253d9 |     
   sh4aeb    |         coreutils-9.1          | NOK | http://autobuild.buildroot.net/results/ef09178216ae0e1b5847984154474fe03202194e | ORPH
microblazeel |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/67d8315d96c8bd8c440bfc690b3b197a8314efb8 | ORPH
   mipsel    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/cef3cca46e354b87d43d471fa96327a5bf6dd931 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
