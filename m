Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F384C4167B
	for <buildroot@archiver.kernel.org>; Fri,  1 Dec 2023 06:54:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A2ED60745;
	Fri,  1 Dec 2023 06:54:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A2ED60745
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n_05tLlPizMF; Fri,  1 Dec 2023 06:54:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6AFA607A1;
	Fri,  1 Dec 2023 06:54:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6AFA607A1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D1E481BF345
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 06:54:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99E4542083
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 06:54:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99E4542083
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3yWJrsx3WICs for <buildroot@lists.busybox.net>;
 Fri,  1 Dec 2023 06:54:30 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E9ECF41E38
 for <buildroot@buildroot.org>; Fri,  1 Dec 2023 06:54:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9ECF41E38
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2CFF9FF80D
 for <buildroot@buildroot.org>; Fri,  1 Dec 2023 06:54:27 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Fri, 01 Dec 2023 06:54:27 -0000
X-GND-Sasl: bot@bootlin.com
Message-Id: <20231201065431.99E4542083@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; 
 t=1701413667; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dlDO1dzymF89ZyFcrLDXqzqZi6AVywjT4vBWmmNCyxs=;
 b=WpUM/Iwz6Ttejux0lzW86Vqe64KoZGFLHbuXzvoFGvfPPrYRRO1DW5jmX2vdH+NaN31iO1
 LpOOedNu0NwIJcFKI++UER1lF3nJeIG2DJdmNrVMHVQ+Cw+ZI0bQNxNhyJRmb4Bv3l+Owi
 u80xeR0ao5r0XfoeqRGaNAZXzriRzWJwxUiPPZKJHPw4xY0grwdxEuI06cpCaZfGPUv2sX
 aStiToCe2cYVgYoWkX+BIiEM6Z2lcIYuJvhqFhpk9THjGF30p91ALJ2UM4XFJgp5MFI9iV
 21r9hqsbyPnUgphIbw7gMA83nFBAyKlZdnTUhZDLzcvu+keBKSvmcDlM0/2OJg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WpUM/Iwz
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2023-11-30
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

Autobuild statistics for 2023-11-30
===================================

      branch |  OK | NOK | TIM | TOT |
  2023.02.x  |  2  |  2  |  0  |  4  |
  2023.08.x  |  1  |  5  |  0  |  6  |
    master   | 45  | 36  |  0  | 81  |

Classification of failures by reason for master
-----------------------------------------------

                libressl-3.8.2 | 5 
                elfutils-0.189 | 4 
glibc-2.38-27-g750a45a78390... | 2 
  gobject-introspection-1.76.1 | 2 
              host-rust-1.71.1 | 2 
                    ngrep-1.47 | 2 
                    php-8.2.12 | 2 
                       unknown | 2 
                 apitrace-10.0 | 1 
                    bat-0.23.0 | 1 
  binutils-arc-2020.09-release | 1 
           crucible-2023.04.12 | 1 
                host-go-1.21.4 | 1 
                   libnss-3.94 | 1 
              libudfread-1.1.2 | 1 
                   linux-6.6.3 | 1 
 Makefile:727: target-finalize | 1 
                  monit-5.33.0 | 1 
   openvmtools-11.3.5-18557794 | 1 
                   perl-5.36.2 | 1 
                python3-3.11.6 | 1 
qt5base-e44097b63d17ba3178a... | 1 
                    rtty-8.1.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |         apitrace-10.0          | NOK | http://autobuild.buildroot.net/results/870cc64eb1a080690732f18242ea9d33092896cd |     
   armeb     |           bat-0.23.0           | NOK | http://autobuild.buildroot.net/results/d20838ed90540071a1e4088b82732ed433ab8696 |     
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/2ddb23ecdc3d8de63b2e3fb80cd8f34b3eb2d7f5 |     
   x86_64    |      crucible-2023.04.12       | NOK | http://autobuild.buildroot.net/results/987a00e69f398b2d58dd0010aceca7433a7c725f |     
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/6347b1d1f92394c605cace6a2f9b9442fb097b09 | ORPH
microblazeel |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/0d9db5839c65379b19a3cf61a6fe4698ce47bc2a | ORPH
 microblaze  |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/da6ce55f4de56f8356e92b4aace3c1f205b80cd0 | ORPH
    arc      |         elfutils-0.189         | NOK | http://autobuild.buildroot.net/results/2ebb4ba56c6c1873b741a08cfe4c3b645ded3edc | ORPH
 powerpc64   | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/5be0366603d020a76afc3ed80bb69861a690ee81 |     
 powerpc64   | glibc-2.38-27-g750a45a78390... | NOK | http://autobuild.buildroot.net/results/89b0d13cf8ace86fe6ff6b95c45817ae4dfd6c0a |     
    m68k     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/fa36bcb49c8ded7532ef7ad8b06564a0111f6f64 | ORPH
    i686     |  gobject-introspection-1.76.1  | NOK | http://autobuild.buildroot.net/results/e5f35177b855dcfbf309d0eea0243884da947c64 | ORPH
   mips64    |         host-go-1.21.4         | NOK | http://autobuild.buildroot.net/results/92112ced17896763d711a9c8aff18b9481591323 |     
powerpc64le  |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/e58fddee0d98ec9dd951498ad25b1f7bb7737389 |     
    mips     |        host-rust-1.71.1        | NOK | http://autobuild.buildroot.net/results/39f131ed08f0cae0f72ab85365e6b0f34bbbacce |     
  powerpc    |          libnss-3.94           | NOK | http://autobuild.buildroot.net/results/c802f9ca0f5e7994cbd401b1b096cba0dfd63c4d |     
   s390x     |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/c779aaf7c4bed3bb80bcff5247fb5e04a4c878e3 | ORPH
   mips64    |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/e47f8f147e4c192ba6293e8b54c3300f14d7ec3b | ORPH
 microblaze  |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/833d3f53c2b682b528e6a2ca4172cc42db81a28f | ORPH
    arc      |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/6542cc092e5d6498464cd1de64d9ebb01cec9407 | ORPH
    arc      |         libressl-3.8.2         | NOK | http://autobuild.buildroot.net/results/4af557b3e886b92e91e45dde4f06937faf54d220 | ORPH
   armeb     |        libudfread-1.1.2        | NOK | http://autobuild.buildroot.net/results/a1227c0bd594facaf80da18fc5f061256ee8136e |     
   mips64    |          linux-6.6.3           | NOK | http://autobuild.buildroot.net/results/33dfdf187704e20fd1ae97067fb0f75f830786c4 | ORPH
powerpc64le  | Makefile:727: target-finalize  | NOK | http://autobuild.buildroot.net/results/046cc5a341c354357a276be9664b0b72d27e2916 |     
    sh4a     |          monit-5.33.0          | NOK | http://autobuild.buildroot.net/results/7b0500c4edbf77db37d2c558b632cee640146c5f |     
  mips64el   |           ngrep-1.47           | NOK | http://autobuild.buildroot.net/results/420bb5af5ef7a6bf4e969850c51e7d7aada6e57f |     
  powerpc    |           ngrep-1.47           | NOK | http://autobuild.buildroot.net/results/60ddd5d74a9e9fa0a0b20553bd8eb2b1c1db0e80 |     
   x86_64    |  openvmtools-11.3.5-18557794   | NOK | http://autobuild.buildroot.net/results/767ee55053b9f5c26af4704f6aee4ac8c7c2fa7d |     
    mips     |          perl-5.36.2           | NOK | http://autobuild.buildroot.net/results/eebc31ede9fde97a26aa90526982df0bb33276d8 |     
    arm      |           php-8.2.12           | NOK | http://autobuild.buildroot.net/results/1caa93119f534bd5fd3a585da6806eed040c5030 |     
 aarch64_be  |           php-8.2.12           | NOK | http://autobuild.buildroot.net/results/fc7122f44166f9ed61bff3c421ab189aa9414244 |     
   x86_64    |         python3-3.11.6         | NOK | http://autobuild.buildroot.net/results/fb1f487d16e5eb06a7fbd0578d03e5d7fde87658 |     
   x86_64    | qt5base-e44097b63d17ba3178a... | NOK | http://autobuild.buildroot.net/results/54463e7e5e43665de224c9e6352c8f118129cbfc |     
   s390x     |           rtty-8.1.0           | NOK | http://autobuild.buildroot.net/results/9db9f1dcc6760de4b78771bb79f109c4efd06c36 |     
   sh4eb     |            unknown             | NOK | http://autobuild.buildroot.net/results/b956385006aceec1a49da9337afcb00daa7ce739 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/47d0872bacd5edd3c62bc9e70e5a3a40d2075e7c |     


Classification of failures by reason for 2023.02.x
--------------------------------------------------

glibc-2.36-118-g22955ad8518... | 1 
                  motion-4.5.1 | 1 


Detail of failures for 2023.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | glibc-2.36-118-g22955ad8518... | NOK | http://autobuild.buildroot.net/results/ac043d40b494586ee2b1cfbf5bdf97d79294c75c |     
    m68k     |          motion-4.5.1          | NOK | http://autobuild.buildroot.net/results/8203c2f7569996485c28826195666c25a71130c6 |     


Classification of failures by reason for 2023.08.x
--------------------------------------------------

               host-runc-1.1.7 | 2 
               libglib2-2.76.1 | 1 
                python3-3.11.6 | 1 
                       unknown | 1 


Detail of failures for 2023.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        host-runc-1.1.7         | NOK | http://autobuild.buildroot.net/results/b31aee7166cc9aa155052599c6231cfaa21d2d1d |     
   armeb     |        host-runc-1.1.7         | NOK | http://autobuild.buildroot.net/results/80d40501067b183cd620d3c3e396cf98699f07b1 |     
    arc      |        libglib2-2.76.1         | NOK | http://autobuild.buildroot.net/results/63d8230c3322dc049d95f003d92b71d3b97999c4 |     
   x86_64    |         python3-3.11.6         | NOK | http://autobuild.buildroot.net/results/61750bb1f4d6adcf43f082703c7169e942037a99 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/cd765e5270076e7e2a212330164b5bf282e16a7a |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
