Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB2CC433F5
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 07:12:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E7B060E9D;
	Tue, 22 Feb 2022 07:12:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xBz3YvsDWPkU; Tue, 22 Feb 2022 07:12:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E31C60E91;
	Tue, 22 Feb 2022 07:12:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5B8411BF2F1
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 07:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 498B14091E
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 07:12:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5l1Jxs8X8yes for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 07:12:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EB8D840917
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 07:12:37 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 23C8040006
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 07:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1645513955; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gzqdSLP8OhpB4/ED336Z94njQMFvz5UM9ep/AsLUyTA=;
 b=gjFs3sN1zmHfZEdpieDH2+sDcQ5BfG2G3KtdBrKpEVPLdG/GU2EBcs8pwyLUjnmxJVDQXz
 Je3lO7uYmZvAwbYqy36qF9ebu1Cc038hBRXFhZBOcSztik7yixD9KRpB/3Yj6313xlRXUY
 6o6AouXL4BhDOIUmL0WrInv3Ozm7KgOBPnpgKgx4coXo7o5c9eMEJml6QFiVNHxNJSA3gf
 vmPjn/3URwGNr/VZs+wUhbZ9EZjsbYRwrTouYt3Al84x92mmT/HaYr9jinA0M+oMgGTMqV
 e3QuBkMWZ0HzLqzCARH3Si/0KkcywiexzmSl6DEWrapt5Au2xWPOip0jhMew/w==
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 22 Feb 2022 07:12:34 -0000
Message-Id: <20220222071242.498B14091E@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-02-21
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

Autobuild statistics for 2022-02-21
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 42  | 10  |  1  | 53  |
  2021.11.x  | 15  |  2  |  0  | 17  |
    master   | 38  | 34  |  0  | 72  |

Classification of failures by reason for master
-----------------------------------------------

             bluez5_utils-5.63 | 7 
           host-libselinux-3.3 | 7 
bpftool-a7f0e7f057283ae8af3... | 2 
                host-go-1.17.7 | 2 
         python-greenlet-1.1.2 | 2 
                re2-2022-02-01 | 2 
                safeclib-3.7.1 | 2 
tovid-87c676f4aadb7303d2cd9... | 2 
                       frr-8.1 | 1 
                  hostapd-2.10 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
               linux-pam-1.5.2 | 1 
                 mesa3d-21.3.5 | 1 
               osm2pgsql-1.6.0 | 1 
    python-pygame-d61ea8eabd56 | 1 
                   sord-0.16.8 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/845feb257c8ba37bce2447b99b3fb4ab97ccc86c |     
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/8693754a0932c2316c8512bda896974b386005e8 |     
    mips     |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/05e9dafb55fb575db91e62611ceed71b9fe24b26 |     
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/17d5f8ce421ac19c970aedb1ddf81db76161e022 |     
    mips     |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/a8e2290345be14a2c3d11a879cb6103adad4973c |     
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/b7fd96676f3d100166e1a0cad87f97ea00667d31 |     
  mips64el   |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/eb23b1f0ec9ec68ead4617124b380966df2b87c7 |     
  mips64el   | bpftool-a7f0e7f057283ae8af3... | NOK | http://autobuild.buildroot.net/results/9b71da40a873a9bec1759a333e7266e793d16d9b |     
   mipsel    | bpftool-a7f0e7f057283ae8af3... | NOK | http://autobuild.buildroot.net/results/b51a8ceb1745cabbeb2f92c0a035f5db84c41f86 |     
   xtensa    |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/f991d30674ca25f0e6374e000a34e1f07190ef69 |     
  mips64el   |         host-go-1.17.7         | NOK | http://autobuild.buildroot.net/results/e2770d1b2a7f04f157bffb4cd817e705fb9f5ead |     
  mips64el   |         host-go-1.17.7         | NOK | http://autobuild.buildroot.net/results/d59509d6402b2bae0e650d63995b886dd8d2abb1 |     
microblazeel |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/a84b0d6b43271ca81b1b4c7e8f696e013dbc83d5 |     
    arm      |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/3158f442a9540f300b1ba70cb7d503a58f7e3dcd |     
   s390x     |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/8ed49c0fc904b011d919aaec5a6cc2a7c556b21e |     
  riscv64    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/3be1191b11c3807e3dd534396a921bc5b11ece83 |     
   nios2     |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/8667a2ed97d0740ccc41fbe8f012660614b1e032 |     
   x86_64    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/d07b4d8107f854e91f30478fad36b99ed83f35a5 |     
   x86_64    |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/488b01124b60492ba6c28394aadc7fff48771643 |     
    arc      |          hostapd-2.10          | NOK | http://autobuild.buildroot.net/results/00bb075a71ba8382f49f1383ab49f0b9b4fbbc66 |     
powerpc64le  | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/5ffced2811194591a74506f4fa783f84baba72c6 |     
    arm      |        linux-pam-1.5.2         | NOK | http://autobuild.buildroot.net/results/4d99609a94c35029839c2a2030bc17ef9f68f4c2 | ORPH
  mips64el   |         mesa3d-21.3.5          | NOK | http://autobuild.buildroot.net/results/d24a17ffeea6cd76d8879163e4cec7993bae39a4 |     
  aarch64    |        osm2pgsql-1.6.0         | NOK | http://autobuild.buildroot.net/results/5af1a0ea176559a5dc787ba945a3a83823f5b1bb |     
   x86_64    |     python-greenlet-1.1.2      | NOK | http://autobuild.buildroot.net/results/6595d90a1c26b2e74afea15fcc19bdceda1999a1 |     
    arm      |     python-greenlet-1.1.2      | NOK | http://autobuild.buildroot.net/results/a4b91d8c715910ea8c4743024437745832736cd7 |     
  aarch64    |   python-pygame-d61ea8eabd56   | NOK | http://autobuild.buildroot.net/results/99c71022328f023eb287ee7415a3252e9f8a8549 |     
  mips64el   |         re2-2022-02-01         | NOK | http://autobuild.buildroot.net/results/8ebbac67f32fe24416a1f72aad0afd42b567b403 |     
    arm      |         re2-2022-02-01         | NOK | http://autobuild.buildroot.net/results/4bccc24ff3121b804f0e6b3f7e5a28111f7bdf7f |     
   sparc     |         safeclib-3.7.1         | NOK | http://autobuild.buildroot.net/results/40a42e6d9021401faf336818bdeada8b85e4f068 |     
   sparc     |         safeclib-3.7.1         | NOK | http://autobuild.buildroot.net/results/651dd437ebcd892b1cc678e813e979edc92da590 |     
    arm      |          sord-0.16.8           | NOK | http://autobuild.buildroot.net/results/170d0114987b39a2b9ea173df7a5e806bd270fd8 |     
  riscv64    | tovid-87c676f4aadb7303d2cd9... | NOK | http://autobuild.buildroot.net/results/b205845c2bb2a965aabc095ba497f0a862ef6e1c |     
    arm      | tovid-87c676f4aadb7303d2cd9... | NOK | http://autobuild.buildroot.net/results/1836542d7a0574a12f1ab84d577fea374fe0c4d1 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                rocksdb-6.13.3 | 2 
                  zeromq-4.3.4 | 2 
  gobject-introspection-1.64.1 | 1 
           host-nodejs-12.22.9 | 1 
                libkrb5-1.18.4 | 1 
monkey-f54856ce250c4e257354... | 1 
                   python-lxml | 1 
           python-pybind-2.6.1 | 1 
                       unknown | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/0bacddd9b9342933c8922d51297d23dd70dac1a4 | ORPH
    arm      |      host-nodejs-12.22.9       | NOK | http://autobuild.buildroot.net/results/a83fe8621f05dd788bf46a1df9f6fae1bf6bcfbc |     
  riscv32    |         libkrb5-1.18.4         | NOK | http://autobuild.buildroot.net/results/1ac6ad4ddac5fd82222d076530bf94cdbba7f491 |     
    arm      | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/9c57c468f46e448e7a865358692c3efa0f8d749d |     
    m68k     |          python-lxml           | TIM | http://autobuild.buildroot.net/results/0bc64a5d1933dd731f623e6ffa88cb256cf912b1 |     
   nios2     |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/268fafedf2525a22932f945e0681d397b790c8cd |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/c8d4a627057190a142d08b22a961cec6f4fbe476 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/4c5925f0e707865201b9ef287db93025247d770b |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/4cb56565aef679124928e1b8ad5ae30e0a871752 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/da365eaee525bb36267f74e30424e13ff68fdb03 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/a16c379c05f1e6e27ac27b9e97728bca5efc4b9f |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

                    ruby-3.0.3 | 1 
                  waffle-1.6.1 | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |           ruby-3.0.3           | NOK | http://autobuild.buildroot.net/results/f8e79f3ab3d7e33e7d25dcd0ba506e53185ee6fd |     
    arm      |          waffle-1.6.1          | NOK | http://autobuild.buildroot.net/results/332331d5806cbd40096d523d27d56e71d7703bc8 |     


Gitlab CI results for 2022-02-21
================================

Detail of runtime-test failures for 2022.02-rc2
-----------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2115531405  | ORPH 
                  TestLxc | https://gitlab.com/buildroot.org/buildroot/-/jobs/2115531472  | ORPH 
    TestPythonPy3Crossbar | https://gitlab.com/buildroot.org/buildroot/-/jobs/2115531519  | ORPH 
      TestPythonPy3Pyyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/2115531541  | ORPH 
        TestPythonPy3Treq | https://gitlab.com/buildroot.org/buildroot/-/jobs/2115531547  | ORPH 
     TestPythonPy3Twisted | https://gitlab.com/buildroot.org/buildroot/-/jobs/2115531548  | ORPH 
    TestPythonPy3Txtorcon | https://gitlab.com/buildroot.org/buildroot/-/jobs/2115531550  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/2115531556  | ORPH 
              TestRustBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/2115531557  | ORPH 
                 TestSudo | https://gitlab.com/buildroot.org/buildroot/-/jobs/2115531562  | ORPH 


Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2116202335  | ORPH 
                  TestLxc | https://gitlab.com/buildroot.org/buildroot/-/jobs/2116202405  | ORPH 
    TestPythonPy3Crossbar | https://gitlab.com/buildroot.org/buildroot/-/jobs/2116202484  | ORPH 
      TestPythonPy3Pyyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/2116202526  | ORPH 
        TestPythonPy3Treq | https://gitlab.com/buildroot.org/buildroot/-/jobs/2116202533  | ORPH 
     TestPythonPy3Twisted | https://gitlab.com/buildroot.org/buildroot/-/jobs/2116202535  | ORPH 
    TestPythonPy3Txtorcon | https://gitlab.com/buildroot.org/buildroot/-/jobs/2116202537  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/2116202544  | ORPH 
              TestRustBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/2116202545  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
