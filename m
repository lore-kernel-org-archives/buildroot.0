Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71928C54FB9
	for <buildroot@archiver.kernel.org>; Tue, 21 Nov 2023 06:39:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8CB440620;
	Tue, 21 Nov 2023 06:39:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8CB440620
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wGAy-JlWI6tF; Tue, 21 Nov 2023 06:39:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D13EE40942;
	Tue, 21 Nov 2023 06:39:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D13EE40942
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7B3A81BF3D7
 for <buildroot@lists.busybox.net>; Tue, 21 Nov 2023 06:38:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60DAD40942
 for <buildroot@lists.busybox.net>; Tue, 21 Nov 2023 06:38:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60DAD40942
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rGIG5UfEkbvG for <buildroot@lists.busybox.net>;
 Tue, 21 Nov 2023 06:38:58 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 57F2640620
 for <buildroot@buildroot.org>; Tue, 21 Nov 2023 06:38:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57F2640620
Received: by mail.gandi.net (Postfix) with ESMTPSA id 34B86FF816
 for <buildroot@buildroot.org>; Tue, 21 Nov 2023 06:38:54 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Tue, 21 Nov 2023 06:38:54 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231121063859.60DAD40942@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1700548734; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+bE70CPtzVhNuZMany0t1DfLjlmYVrHLzS8v0CM6Ank=;
 b=gdbKPxK3eQgNj9wNqTMYLXXr/uBCLDVypztSTymsdLZBAjMEuBGEFk5mYu1bCl4yc+OXLs
 Hban237FzQZOy79NQZ6Xy2cyFny2A+NnVufndQzKM54W8m4ERxdwDH5pXuQWfQj9l9i7Ry
 LzSQ+eAjrcak0n2HoC9TZ4R3CN3HXDZUTRxE7+/eX0WUnsZ2HbVs9m6lTxD8pbNISZPH3x
 I9KqNERVMVZm+aL6h9YCAL7kMd9RIK8yW7d4r/yhEfeGLVS34zHp2f2oI/f8EVqGtDYLkj
 CzhM65fmLagnxiFwVM1XeksJ46YXFWP4XKomxxbLv8hzzRKO+sYxrg98EU5fKQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gdbKPxK3
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-11-20
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

Autobuild statistics for 2023-11-20
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  9  |  1  |  0  | 10  |
  2023.08.x  |  1  |  2  |  0  |  3  |
    master   | 17  | 15  |  1  | 33  |

Classification of failures by reason for master
-----------------------------------------------

              host-rust-1.71.1 | 3 
                   openrc-0.51 | 2 
          python-msgpack-1.0.7 | 2 
                     criu-3.18 | 1 
             flare-engine-1.14 | 1 
         gobject-introspection | 1 
                libressl-3.8.2 | 1 
                libselinux-3.5 | 1 
                   linux-6.6.1 | 1 
               mariadb-10.11.4 | 1 
    python-cryptography-39.0.2 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |           criu-3.18            | NOK | http://autobuild.buildroot.net/results/94cc463762b57efacf743d107a8dda7660a995a3 |     
    mips     |       flare-engine-1.14        | NOK | http://autobuild.buildroot.net/results/2aa1470ce1d4eace79098184f1441e19f99a5cc6 |     
 microblaze  |     gobject-introspection      | TIM | http://autobuild.buildroot.net/results/2a96935826a4e07d3e21ccbf4a1b7e0b339843f9 |     
   s390x     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/75bb3b32c4abb83d837bbc45dd6093b5a5eb69bd |     
    i686     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/d942ca275fa8c49a29acfe60b1e3991cb8ee879c |     
powerpc64le  |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/1c2cbbc6ae7438246c662786b49ab3d5f1ec7143 |     
  mips64el   |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/69384dc109792be1d067d6f3ac3f03fbc9af4d73 | ORPH
   sh4aeb    |         libselinux-3.5         | NOK | http://autobuild.buildroot.net/results/af8761c122a0c4b26c7c859920336531fcd64043 |     
   mips64    |          linux-6.6.1           | NOK | http://autobuild.buildroot.net/results/29735771423e0ad54250ea9d99aa0d007d0ef83c | ORPH
    i686     |        mariadb-10.11.4         | NOK | http://autobuild.buildroot.net/results/9c65a0648baa0c3d294487522ddec97fee9ea961 | ORPH
   mips64    |          openrc-0.51           | NOK | http://autobuild.buildroot.net/results/2c9542335d85575bffcac06d58ed3a6d24914118 |     
   mipsel    |          openrc-0.51           | NOK | http://autobuild.buildroot.net/results/0bdf60edaf748d089ef6015058d29b1f0304e310 |     
  aarch64    |   python-cryptography-39.0.2   | NOK | http://autobuild.buildroot.net/results/ef696dff28297c7fd0b7d3eec3e928441ebc77b6 |     
   mipsel    |      python-msgpack-1.0.7      | NOK | http://autobuild.buildroot.net/results/85f1bb81b03cf5cb69d2f214081bfa6758dbaa1a |     
  aarch64    |      python-msgpack-1.0.7      | NOK | http://autobuild.buildroot.net/results/6dbd79695e45e29f2e9d9117933199dd2f0aaf39 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/8ee14ca5b6820e286c2137843b48c88130ed9236 |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

                 wolfssl-5.6.4 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |         wolfssl-5.6.4          | NOK | http://autobuild.buildroot.net/results/34b2a21befe5e531a825f312be9d5d284a7f1d83 |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

               host-go-1.20.11 | 1 
             util-linux-2.39.1 | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |        host-go-1.20.11         | NOK | http://autobuild.buildroot.net/results/6744607dbd5c6898c1b303519c05fe3b4d03011b |     
powerpc64le  |       util-linux-2.39.1        | NOK | http://autobuild.buildroot.net/results/7ba7325e26a0cde27885f4cf990793dd968386c6 | ORPH


Gitlab CI results for 2023-11-20
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
      TestCpioDracutGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5572984185  | ORPH 
...ioDracutGlibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/5572984188  | ORPH 
       TestCpioDracutMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/5572984196  | ORPH 
...pioDracutMuslMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/5572984205  | ORPH 
     TestCpioDracutUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5572984209  | ORPH 
...oDracutUclibcMergedUsr | https://gitlab.com/buildroot.org/buildroot/-/jobs/5572984213  | ORPH 
              TestFlutter | https://gitlab.com/buildroot.org/buildroot/-/jobs/5572984573  | ORPH 
           TestIPythonPy3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5572984603  | ORPH 
          TestLuaLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5572984623  | ORPH 
           TestLuaLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/5572984642  | ORPH 
       TestLuajitLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5572984625  | ORPH 
        TestLuajitLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/5572984647  | ORPH 
                  TestOla | https://gitlab.com/buildroot.org/buildroot/-/jobs/5572984753  | ORPH 
          TestPolkitInitd | https://gitlab.com/buildroot.org/buildroot/-/jobs/5572984783  | ORPH 
        TestPolkitSystemd | https://gitlab.com/buildroot.org/buildroot/-/jobs/5572984784  | ORPH 
       TestPythonPahoMQTT | https://gitlab.com/buildroot.org/buildroot/-/jobs/5572984855  | ORPH 
   TestPythonPy3Bitstring | https://gitlab.com/buildroot.org/buildroot/-/jobs/5572984805  | ORPH 
   TestPythonPy3Construct | https://gitlab.com/buildroot.org/buildroot/-/jobs/5572984818  | ORPH 
    TestPythonPy3Crossbar | https://gitlab.com/buildroot.org/buildroot/-/jobs/5572984819  | ORPH 
  TestPythonPy3Dicttoxml2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5572984825  | ORPH 
    TestPythonPy3Dtschema | https://gitlab.com/buildroot.org/buildroot/-/jobs/5572984830  | ORPH 
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/5572984835  | ORPH 
        TestPythonPy3Hkdf | https://gitlab.com/buildroot.org/buildroot/-/jobs/5572984844  | ORPH 
        TestPythonPy3Mako | https://gitlab.com/buildroot.org/buildroot/-/jobs/5572984850  | ORPH 
     TestPythonPy3MakoExt | https://gitlab.com/buildroot.org/buildroot/-/jobs/5572984851  | ORPH 
     TestPythonPy3Passlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/5572984856  | ORPH 
      TestPythonPy3Pynacl | https://gitlab.com/buildroot.org/buildroot/-/jobs/5572984864  | ORPH 
       TestPythonPy3Pysmb | https://gitlab.com/buildroot.org/buildroot/-/jobs/5572984869  | ORPH 
      TestPythonPy3Pyyaml | https://gitlab.com/buildroot.org/buildroot/-/jobs/5572984874  | ORPH 
         TestPythonPy3RSA | https://gitlab.com/buildroot.org/buildroot/-/jobs/5572984882  | ORPH 
       TestPythonPy3SciPy | https://gitlab.com/buildroot.org/buildroot/-/jobs/5572984890  | ORPH 
      TestPythonPy3Spake2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5572984899  | ORPH 
             TestStressNG | https://gitlab.com/buildroot.org/buildroot/-/jobs/5572984935  | ORPH 
               TestWeston | https://gitlab.com/buildroot.org/buildroot/-/jobs/5572984952  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5572984960  | ORPH 
              TestZfsMusl | https://gitlab.com/buildroot.org/buildroot/-/jobs/5572984962  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/5572984964  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
