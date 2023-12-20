Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48612C3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 20 Dec 2023 06:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BD7941E27;
	Wed, 20 Dec 2023 06:41:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BD7941E27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id seSjg6v4F5Uu; Wed, 20 Dec 2023 06:41:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52D2441E29;
	Wed, 20 Dec 2023 06:41:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52D2441E29
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 72C341BF255
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 06:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 12EFC60B24
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 06:41:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12EFC60B24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rUOaCZJcW4jX for <buildroot@lists.busybox.net>;
 Wed, 20 Dec 2023 06:41:13 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8E798607FE
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 06:41:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E798607FE
Received: by mail.gandi.net (Postfix) with ESMTPSA id 772231C000D
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 06:41:09 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Wed, 20 Dec 2023 06:41:09 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231220064117.12EFC60B24@smtp3.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1703054469; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8TD/UaVm+kHMjPUVILT6xRzq5c3ziOjC6QHUBeN5zy4=;
 b=Bw2iJiYcLc3jJIn9cK4RgGhtc2JgosGiO0lfEf/2GDsJFDSiUjzMO20AjqLIji/ywDcwhb
 dhEKh3DNdiAgHFZW7Kldoh9TrqJpZHfvucSudmU1MuMtjT1r/dkvcYqcWNuZSmmDds3nIn
 kSswqiFr/XTXaVKXwp0QmQWz9JjJWdjZWvicKk76Q27L+KFLQtJCr05NFmi/3M45dgVGUO
 57/D9yywOVr2ixfDgyUk+aWK6DUTwp5bt1NgRLzQ/ueX+R8AG2N9p5DCQFuWAWhDcBBM9g
 Y72VZEAN9mhu0EJYycQU8+YjDvL9ISgDjs+jaCo/HNjj+vfhJvSCPPaMbhcdQA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Bw2iJiYc
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-12-19
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

Autobuild statistics for 2023-12-19
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  3  |  4  |  0  |  7  |
  2023.08.x  |  2  |  2  |  0  |  4  |
    master   | 47  | 44  |  0  | 91  |

Classification of failures by reason for master
-----------------------------------------------

ibm-sw-tpm2-5452af422edeff7... | 7 
              libopenssl-3.2.0 | 6 
glibc-2.38-27-g750a45a78390... | 4 
                   linux-6.6.7 | 4 
                     exim-4.97 | 3 
        edk2-edk2-stable202308 | 2 
                libressl-3.8.2 | 2 
                    bat-0.23.0 | 1 
check-11970a7e112dfe243a2e6... | 1 
                elfutils-0.189 | 1 
  gobject-introspection-1.76.1 | 1 
              host-rust-1.71.1 | 1 
        host-sentry-cli-2.20.3 | 1 
              libarchive-3.7.2 | 1 
                 libcurl-8.5.0 | 1 
               libglib2-2.76.1 | 1 
                   linux-tools | 1 
                   perl-5.38.2 | 1 
        python-pysensors-0.0.4 | 1 
                   rsync-3.2.7 | 1 
              tinymembench-0.4 | 1 
uclibc-ng-test-0f303c63fab7... | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |           bat-0.23.0           | NOK | http://autobuild.buildroot.net/results/d06749d43a2a5487998051aa996213591eea6120 |     
  riscv64    | check-11970a7e112dfe243a2e6... | NOK | http://autobuild.buildroot.net/results/465b3b7018264d1910c36eddb517c12294b9dca3 | ORPH
    i686     |     edk2-edk2-stable202308     | NOK | http://autobuild.buildroot.net/results/3dbedf5a368619e17dc356698bfdeb5963cc4e6e |     
    i586     |     edk2-edk2-stable202308     | NOK | http://autobuild.buildroot.net/results/659eb8a111e67204fa903d7e436055509c78b2c6 |     
   sh4eb     |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/3ba808342ea1671c5c365d429894b3d69b465cbc | ORPH
  sparc64    |           exim-4.97            | NOK | http://autobuild.buildroot.net/results/8481e5f9f9ab306f1bf09387631f9582f3f6a422 |     
   sparc     |           exim-4.97            | NOK | http://autobuild.buildroot.net/results/296e1457ab993a121658ba3efe47c5ae5f4a0e01 |     
microblazeel |           exim-4.97            | NOK | http://autobuild.buildroot.net/results/0ce7a21ad42cfccfe31e52839edc79f5af42be1a |     
powerpc64le  | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/b730335cf0923f5f42b9d6dd879b49bfff2061a5 |     
 powerpc64   | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/7d054029efeb81bce8e4b5f39026a4b6e29ece14 |     
 powerpc64   | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/0635ffef36026be0cb7b29dae7cd661451f3c5b5 |     
 powerpc64   | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/03a712233efaf93b2c4eb0551898e5d938ef0437 |     
  sparc64    |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/ba0046610be57955e9e964024b714710966a2e27 | ORPH
   armeb     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/f692cda16aef390e814477fa1cf0b15ab1d717d6 |     
  powerpc    |     host-sentry-cli-2.20.3     | NOK | http://autobuild.buildroot.net/results/83a99b1a2b561bb9a5b90ecbeb91c449cca56b84 |     
    arc      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/8a27f9269779524aa97ab87b07d818c254cd06ce |     
powerpc64le  | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/0f5343161e7381cf2a9be37c3c51e5cf5f22793e |     
  sparc64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/785642d805f637d0f28c30f9ea970f7f403d93db |     
   x86_64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/a20c3ff9bd074f9d2a84426d280aa9cf11639147 |     
microblazeel | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/463bbb889d8bd69d7c0dc83f570d663354bd0d1d |     
  aarch64    | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/ed0778d135d362c3f5d78bf5bc1bad7aaed5cde6 |     
    arm      | ibm-sw-tpm2-5452af422edeff7... | NOK | http://autobuild.buildroot.net/results/da03591f97cec2469a34379c99b016feb2d65578 |     
 microblaze  |        libarchive-3.7.2        | NOK | http://autobuild.buildroot.net/results/96b24425e6ffe233809df4371dbbe236f19189fc |     
  aarch64    |         libcurl-8.5.0          | NOK | http://autobuild.buildroot.net/results/0424986fad1669ad8dea8e616fc6e9e119cbd3a3 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/0256e6efe8bcb260ee405716d8bd61c20b71cc0a |     
  riscv32    |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/0ff842b0996281b793f9745e42019007c0c5fd15 | ORPH
   s390x     |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/520e67289fa9cc64cfbe3ecdcadc7b91d85b7702 | ORPH
   s390x     |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/446a443d4007ca3cfb212d4a144e53bcc92ab411 | ORPH
   s390x     |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/448fc57a37e6a06a40b64e1ab8909ba6feb53a86 | ORPH
   s390x     |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/28fddb987cf4f15086cdf37c80039b20f78ce661 | ORPH
  riscv32    |        libopenssl-3.2.0        | NOK | http://autobuild.buildroot.net/results/19e803569ed9a53d50613b6b0e5ad8566b59822c | ORPH
microblazeel |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/ac9445637c6cacee8c3871bc2489b1cc309bbeeb | ORPH
 microblaze  |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/3ddfd73d4e326ba00d6548b7c555d7088042e1c4 | ORPH
  powerpc    |          linux-6.6.7           | NOK | http://autobuild.buildroot.net/results/a0c27e0ee195b630d9368774599536dfa6a13bf5 | ORPH
    mips     |          linux-6.6.7           | NOK | http://autobuild.buildroot.net/results/bd265dd9a374dddeb3eb36c1dbdbbdee7d833965 | ORPH
   sh4eb     |          linux-6.6.7           | NOK | http://autobuild.buildroot.net/results/de1095e1d1c2a5f99dbeff5b904b22db03938d1a | ORPH
    mips     |          linux-6.6.7           | NOK | http://autobuild.buildroot.net/results/605a5e035aa6b610a61e96f22c15853fe376e118 | ORPH
  mips64el   |          linux-tools           | NOK | http://autobuild.buildroot.net/results/68aba693571f53d91c78013546e00f64fc86304a | ORPH
   xtensa    |          perl-5.38.2           | NOK | http://autobuild.buildroot.net/results/a33f382c3b67af32225fef510857024c34eae182 |     
  sparc64    |     python-pysensors-0.0.4     | NOK | http://autobuild.buildroot.net/results/b165cc8552a55a7001faa379bc5c30d65c15b540 |     
    mips     |          rsync-3.2.7           | NOK | http://autobuild.buildroot.net/results/6fa42d3dde9ba2c94c9fad692c9caae9836baae6 |     
    arm      |        tinymembench-0.4        | NOK | http://autobuild.buildroot.net/results/e0428577185c47f07616c4284c0f8f7bd05b589a |     
   mipsel    | uclibc-ng-test-0f303c63fab7... | NOK | http://autobuild.buildroot.net/results/6c98fb3f6f48e661b318f171f8cb594969c7990d |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/c676e5aa353463aa969639124596116e677e9285 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                elfutils-0.186 | 1 
fs/romfs/romfs.mk:32: /home... | 1 
               gupnp-av-0.14.0 | 1 
                       unknown | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |         elfutils-0.186         | NOK | http://autobuild.buildroot.net/results/4cc75198004035c65f35fb2bb42e5f4e37401f4c | ORPH
    mips     | fs/romfs/romfs.mk:32: /home... | NOK | http://autobuild.buildroot.net/results/faa56b24be2fe9f48bfaec152bf92226480e1c1d |     
    mips     |        gupnp-av-0.14.0         | NOK | http://autobuild.buildroot.net/results/96da0aebf6c7508d18c82cb62ecccaa9cac85bfe |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/3a2565a01e30efacfbdfc69c31ec77c4e994dc7a |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

                elfutils-0.189 | 1 
               host-go-1.20.11 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/64a587982069e2f2c865481ed4a0523f010477aa | ORPH
   sparc     |        host-go-1.20.11         | NOK | http://autobuild.buildroot.net/results/3ae9336cfe52d0c93491ad797a97b073639a182d |     


Gitlab CI results for 2023-12-19
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
          TestATFVexpress | https://gitlab.com/buildroot.org/buildroot/-/jobs/5784203010  | ORPH 
      TestCpioDracutGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5784203041  | ORPH 
...ioDracutGlibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/5784203053  | ORPH 
       TestCpioDracutMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/5784203064  | ORPH 
...pioDracutMuslMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/5784203073  | ORPH 
     TestCpioDracutUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5784203080  | ORPH 
...oDracutUclibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/5784203087  | ORPH 
                 TestEdk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5784203029  | ORPH 
              TestFlutter | https://gitlab.com/buildroot.org/buildroot/-/jobs/5784203109  | ORPH 
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5784203129  | ORPH 
          TestLuaLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5784203140  | ORPH 
           TestLuaLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/5784203165  | ORPH 
       TestLuajitLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5784203154  | ORPH 
        TestLuajitLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/5784203175  | ORPH 
  TestNodeJSModuleHostSrc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5784203182  | ORPH 
                  TestOla | https://gitlab.com/buildroot.org/buildroot/-/jobs/5784203189  | ORPH 
       TestPythonPahoMQTT | https://gitlab.com/buildroot.org/buildroot/-/jobs/5784203241  | ORPH 
   TestPythonPy3Bitstring | https://gitlab.com/buildroot.org/buildroot/-/jobs/5784203194  | ORPH 
   TestPythonPy3Construct | https://gitlab.com/buildroot.org/buildroot/-/jobs/5784203197  | ORPH 
    TestPythonPy3Crossbar | https://gitlab.com/buildroot.org/buildroot/-/jobs/5784203200  | ORPH 
  TestPythonPy3Dicttoxml2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5784203209  | ORPH 
    TestPythonPy3Dtschema | https://gitlab.com/buildroot.org/buildroot/-/jobs/5784203217  | ORPH 
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/5784203219  | ORPH 
        TestPythonPy3Hkdf | https://gitlab.com/buildroot.org/buildroot/-/jobs/5784203220  | ORPH 
        TestPythonPy3Mako | https://gitlab.com/buildroot.org/buildroot/-/jobs/5784203231  | ORPH 
     TestPythonPy3MakoExt | https://gitlab.com/buildroot.org/buildroot/-/jobs/5784203235  | ORPH 
     TestPythonPy3Passlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/5784203243  | ORPH 
      TestPythonPy3Pynacl | https://gitlab.com/buildroot.org/buildroot/-/jobs/5784203253  | ORPH 
       TestPythonPy3Pysmb | https://gitlab.com/buildroot.org/buildroot/-/jobs/5784203260  | ORPH 
      TestPythonPy3Pyyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/5784203265  | ORPH 
         TestPythonPy3RSA | https://gitlab.com/buildroot.org/buildroot/-/jobs/5784203293  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/5784203314  | ORPH 
      TestPythonPy3Spake2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5784203326  | ORPH 
     TestSELinuxCustomGit | https://gitlab.com/buildroot.org/buildroot/-/jobs/5784203033  | ORPH 
             TestStressNG | https://gitlab.com/buildroot.org/buildroot/-/jobs/5784203382  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
