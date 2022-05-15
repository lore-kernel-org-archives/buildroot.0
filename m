Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8803DC433F5
	for <buildroot@archiver.kernel.org>; Sun, 15 May 2022 19:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EE3D403A7;
	Sun, 15 May 2022 19:35:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f_a3vNy7SqMR; Sun, 15 May 2022 19:35:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCD60403A8;
	Sun, 15 May 2022 19:35:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1A3871BF3A0
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 19:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 162AA60B38
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 19:35:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=yahoo.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G3ONfs3hXXxo for <buildroot@lists.busybox.net>;
 Sun, 15 May 2022 19:35:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from sonic302-48.consmr.mail.ir2.yahoo.com
 (sonic302-48.consmr.mail.ir2.yahoo.com [87.248.110.111])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9EFF960AD2
 for <buildroot@buildroot.org>; Sun, 15 May 2022 19:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.it; s=s2048;
 t=1652643307; bh=WKx+bRG83Qh94Hx521MB03cHmlKeSTW2xortZ4/nThI=;
 h=Date:From:To:Subject:References:From:Subject:Reply-To;
 b=fHeKo7tUwzntXcJ2Tp0O2vPhbqJrLQd53gviMBTKrg+uWAH7/YkN836xH0cWzBvIt9TkYoa1+QfssnPb54TrAW0lklVkYDq/M/T5X0oWOjgkUDZV8E3J5c4t12j0cVt6U8XTdIsU5QlF0PJiCXqrIYzZOXna1bpodT0NDLa0LyLPV7y+hQwsV40qVhTm+DTC4ODGOtbLhNL378PcA8Ys0U7qpCX3fLXI15O8yOzqTWaEXsfipWYkXgTQmiNyIN5ZmwhzwfL0CaUKXLCM8iiuOEA6M+rN+2V0cUlpY7nTZAXvw0dXAE8WpomKQC4TWX93C38l1ts+eEKZpcCYe4hHBw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1652643307; bh=RGcfoT9tDUX9fuqwHjzRYFFQyQ3SDDy6mkeb48I5Rhx=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=SsK1eo6rb9tq2sPkvK3H7ROWFieeuhZ11bbgWVMgcA+2vpFvjvCkeE7Z/6E32e3PTGGzTC9QETOP0Qx+TaWbsm4o0iMqPpbhfyvW2Nvo2a6f1sNpyd5tbiFdW7ZiS3BPWMw4GuWkJ18mm9w5WSesY0r/f0DvQKNQE886C1jWpuchakJ1M1fXxLlmkJs+nMVMmW5Va+Lo7+ruL3bfCeLdWonrqyAvaFfyvU/wEUfY82FQEiuzF+JLNS9SKGlGAlt32vJu11jf3ItnSSo2eUxgiT0nSR9hSFY/DJkNDUX2T8qQoehV+DUg/9Ehrdc4jz013ZMF3X+95f5cak7t/exkFA==
X-YMail-OSG: YihPuwEVM1m8ufElyC8Knzr8LrFzLRLxWD8tDDVVf.OCWWuuEMI2.nzszSa6Q3t
 n2cKPOgs_k6gKHh4D5oIogvS_J1lTivVpEZTDkcm0QIcBK3b2nI_5JVelAVO_tSYQ8WVQLP9Q._Z
 iBuMye7u9q.Q4JRbEhnC.cdyYRLOkFvkB0pBmSxlwile7w_pDLLoAGOGMh7ATJZQ.pgjLImw4Hif
 DF0yGxdWokdhIk3QMNXwPa7WlO4hS9R5Ke7dYJcZHWoL7kSMw0OLTO8ZoqL3mtQ3IOSiSwaf.9Ug
 Zk20yD70X61Mqt91gpXmblwFPzPFmbywIysRQ2ZbdycEF4ZiFMHfv3b8uEGuVOOL0yU.6ZNjtux8
 8A8nCr1u7kmODaQ6cyw9fIS.jmEzLFrcEo2z0vUpy7n_dbvbzR.CuljG4le4liL4hbhbspI0bgIp
 1ASIsNveKEb7XhsXmsGAElJqRcqNhJkmRWBvJgDXoMXrptknZhyje.LHlGnDTZULZUGJsf5_xlEm
 T._7RN4K4JRaMdRynRffqZKBCV0eDSaI_2JjUxsu6nE_xdZ0DmdgOvTKRxHq_H4PcLcnhlNHgywF
 LCcpuBBQgdJ3ZZPCvRItFG6yhIKn.Of6_BmS21Ec8dTYVdT6bhN_BKYPfxxIpsTlTM9QJz5fzhus
 WP.CYd3oDAWMCNwR28Y.RYTl.TfSHyNyDcZ9r59lwduZ7gRdxCnJKt1ovrpG32x8a3.Obom8WkI3
 OB53qpFB_CYLLsue63esse.1Jc6UIOlR9dMGgdN1rRJoq6qFesOMjqnLq_b3rdfDwrWrFChtk.vV
 KszMJIFBZsy47TfYTczlMVuZdaSbtEu5i6SJAH2OdNGwT9LybbCBxiGw7mojekXmR0JY8Zn3Qes4
 d2tnxQOrxOUTeoP.V8T1Ldc_umL..bvHCVlx_NMYKBu23AHutNl1KlMvgd9ZuBTLl6rdOToKUnTs
 N0sThJayvzhaAyw1_OWgCZdH5zSXf3TwWJ4uZLs2DUxBHy8SJca8ubb9YMRgcyRLl6.tPT.TLs9r
 1JB86TWBVffBb_Eoy4vkITIjWOorHE2rQtumQqv9fVPTqZhkkW3YhjnzrYkz4r.8rgT72p_IMCfw
 oE12fumyycedBcRUXYO5nXgKn4fbT6sL.PBnV75FAt_eUgzQRwMXrRqTeHXy19.jxdEgL2uTMV26
 Zw4GN2yCVmNVsXUZnvtlJNRGS2pCn08xTaDq5Dps3s1zQy.isLVpkCjG3NAEEhALMM35smjSlfg0
 e6DXIF7lIQVGBROsFmYk78wf31Iq42HMzU66oqnTxf1IdHwzMVzWwHRTR61ndqgWwyG4qJ7uPfzA
 T16jngqdgbc2yMfBgCwqnDmjFtPT9AXXmjq4ToANkhFIU77gKUrsbmUbOhXPXv2vvZFnyvhMI9T.
 mBNMbQdThlacec3zSxk.XUugqP7k1jxy01IHLTBQuGFMEluFCVJod_mY3lAiP.5lZplg_g8Tmkos
 nst9aa2l195qM8X6fUwZi1PX6ZzXkHQ1eQV4a6RmOLjg_Hqt0Edvv3KODT7OswQSgtdysidPBHil
 ImQVm9RTFDb9IAqy4hD8NIMBuGFiLs7iBHJqPU8DyvYGDdgDYyHb08Zee69ZEHffJrBgelBXEeqp
 vWOENzi_Dx1niv3urq0PWS9s_Y8oWlxHLa4WBNccrMJ0h4t135bh_kgWzVhtLmupO_MVfUfQ3TpM
 Jw.3cEQ6tX7Ij8xjKNgo0oNNT_WMcswzdUz.3G.yogOa0xefS4Plf1XzCaf0PCefpg_73EoAI.0K
 t6f5sxSUrfpEMzVwCiUFZ5AlhMKOyEaB7vtkgCZDZhyf74wBUT7B3Hi2JellhHVT98tuc6OiJwlq
 GXPqYegAMg6fMSfbZojyixGtjI2_WMniM15MkZZpLz6a5iv39aCLt8stsKyl0iUEa8DKF3fCGFth
 6N36WJSf4NHFeclo73lLd5xsYGq_.46xbS6lPlYnKFtMTXE9uvS.nF31r31aUVBIf8TB7c3x9zwy
 UIr9bumOZmbqi1bPnXPr6cqbUV6bWHfrjwXiB5YEYP8nGguQybwl1KxWidMgw_BTGEOclpSmsQNM
 lTqc8F9yAqtkb_pHhG4GqtcWP.FByi5azjffWm__twaXWxP25XQcYxu8_8ENR6eHzepVvDtr9OgI
 7iRdDnn.C7mhnFbrlseuBiEzV2McX.QaL2FyvagFxqnP3nR_EEnCxIJ3SZ7mXVYi8DTRtAf7qSx.
 tK2KYZELjVRoV8QX0Nc3vw.eiUJxIzvLNCfnSRcjwL5HG7bqrvb7TdA--
X-Sonic-MF: <lfindanno@yahoo.it>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic302.consmr.mail.ir2.yahoo.com with HTTP; Sun, 15 May 2022 19:35:07 +0000
Date: Sun, 15 May 2022 19:38:33 +0000 (UTC)
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <1299252099.5797319.1652643513458@mail.yahoo.com>
MIME-Version: 1.0
References: <1299252099.5797319.1652643513458.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.20188 YMailNorrin
Subject: [Buildroot] Error compiling buildroot: ninja: error:
 obj.host/tools/v8_gypfiles/run_torque.ninja
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
From: luigi findanno via buildroot <buildroot@buildroot.org>
Reply-To: luigi findanno <lfindanno@yahoo.it>
Content-Type: multipart/mixed; boundary="===============3368217430299586487=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3368217430299586487==
Content-Type: multipart/alternative; 
	boundary="----=_Part_5797318_1734761787.1652643513457"

------=_Part_5797318_1734761787.1652643513457
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, I tried to compile buildroot starting from raspberrypi_qt5we_defconfig than I included node.js and qt-webkit-kioskbut I got the following error:
ninja -C out/Release
ninja: Entering directory `out/Release'
ninja: error: obj.host/tools/v8_gypfiles/run_torque.ninja:1356: multiple rules generate gen/torque-generated/bit-fields.h [-w dupbuild=err]

make[2]: *** [Makefile:127: node] Errore 1
make[1]: *** [package/pkg-generic.mk:293: /home/luigi/rpi3b+/buildroot/output/build/nodejs-16.15.0/.stamp_built] Errore 2
make: *** [Makefile:84: _all] Errore 2

I dont't know how to fix it.
Regards
Luigi Findanno 

------=_Part_5797318_1734761787.1652643513457
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head></head><body><div class="ydpa7b85328yahoo-style-wrap" style="font-family:courier new, courier, monaco, monospace, sans-serif;font-size:13px;"><div dir="ltr" data-setdir="false"><div><div dir="ltr">Hi, I tried to compile buildroot starting from raspberrypi_qt5we_defconfig than I included node.js and qt-webkit-kiosk</div><div dir="ltr">but I got the following error:</div><div dir="ltr"><br></div><div>ninja -C out/Release<br>ninja: Entering directory `out/Release'<br>ninja:
 error: obj.host/tools/v8_gypfiles/run_torque.ninja:1356: multiple rules
 generate gen/torque-generated/bit-fields.h [-w dupbuild=err]<br><br>make[2]: *** [Makefile:127: node] Errore 1<br>make[1]: *** [package/pkg-generic.mk:293: /home/luigi/rpi3b+/buildroot/output/build/nodejs-16.15.0/.stamp_built] Errore 2<br>make: *** [Makefile:84: _all] Errore 2<br><br></div><div dir="ltr">I dont't know how to fix it.</div><div dir="ltr"><br></div><div dir="ltr">Regards</div><div dir="ltr"><br></div>Luigi Findanno </div><div><br></div></div></div></body></html>
------=_Part_5797318_1734761787.1652643513457--

--===============3368217430299586487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3368217430299586487==--
