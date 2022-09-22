Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E1FFC6FA82
	for <buildroot@archiver.kernel.org>; Thu, 22 Sep 2022 11:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 988BC610DD;
	Thu, 22 Sep 2022 11:18:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 988BC610DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id be2XC0VvK15n; Thu, 22 Sep 2022 11:18:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42089610E5;
	Thu, 22 Sep 2022 11:18:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42089610E5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1191C1BF409
 for <buildroot@lists.busybox.net>; Thu, 22 Sep 2022 11:18:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1A67610E5
 for <buildroot@lists.busybox.net>; Thu, 22 Sep 2022 11:18:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1A67610E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BscQ3J-eR2ZR for <buildroot@lists.busybox.net>;
 Thu, 22 Sep 2022 11:18:08 +0000 (UTC)
X-Greylist: delayed 00:05:33 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54DA460B51
Received: from mail.logic-way.de (mail.logic-way.de [46.4.65.142])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 54DA460B51
 for <buildroot@buildroot.org>; Thu, 22 Sep 2022 11:18:08 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.logic-way.de (Postfix) with ESMTP id 1390C348CA9F
 for <buildroot@buildroot.org>; Thu, 22 Sep 2022 13:12:32 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.logic-way.de
Received: from mail.logic-way.de ([127.0.0.1])
 by localhost (mail.logic-way.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PsLoJHelu94s for <buildroot@buildroot.org>;
 Thu, 22 Sep 2022 13:12:30 +0200 (CEST)
Message-ID: <fea44483-37d8-17be-ba7e-17b0251474f0@logicway.de>
Date: Thu, 22 Sep 2022 13:12:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
To: buildroot@buildroot.org
Content-Language: de-DE
From: Ralph Nemitz <nemitz@logicway.de>
Subject: [Buildroot] buildroot-2021.02.11 systemd
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
Content-Type: multipart/mixed; boundary="===============4617893443750535821=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============4617893443750535821==
Content-Type: multipart/alternative;
 boundary="------------z6g05mRKJOmXF1o6h1WgtsZa"
Content-Language: de-DE

This is a multi-part message in MIME format.
--------------z6g05mRKJOmXF1o6h1WgtsZa
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi all,

I compiled buildroot-2021.02.11 with systemd. I deal with buildroot for 
a long time but now with systemd and that causes some difficulties to me.

The hardware we developed by ourself with an ARM3354.

If I start sometime there is only "/dev/ttyACM0". Sometime I get 
"/dev/ttyACM0....3". I need "/dev/ttyACM3" for  gpsd.

Although "gpsd.service" has started "cgps" doesn't give values, only 
after "systemctl restart gpsd" it does. It's nearly the same with 
"chronyc sources". Only after "systemctl restart gpsd" I get
"#* GPS                           0   4   377    22  -3582us[-4257us] 
+/-  200ms" that means I get the correct time from gps.
Does anybody have similary experience? What can I do to fix these 
problems? Do you need further information?


Kind regards,

Ralph

-- 

--
###############################################################
Dipl.-Phys. Ralph Nemitz    Tel.:    (0385) 2010 0054
Logic Way GmbH              Fax:     (0385) 2010 0099
Mettenheimerstraße 2        HTTP:http://www.logicway.de
19061 Schwerin              E-Mail:nemitz@logicway.de
###############################################################

--------------z6g05mRKJOmXF1o6h1WgtsZa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi all,</p>
    <p>I compiled buildroot-2021.02.11 with systemd. I deal with
      buildroot for a long time but now with systemd and that causes
      some difficulties to me.</p>
    <p>The hardware we developed by ourself with an ARM3354.</p>
    <p>If I start sometime there is only "/dev/ttyACM0". Sometime I get
      "/dev/ttyACM0....3". I need "/dev/ttyACM3" for  gpsd.</p>
    <p>Although "gpsd.service" has started "cgps" doesn't give values,
      only after "systemctl restart gpsd" it does. It's nearly the same
      with "chronyc sources". Only after "systemctl restart gpsd" I get
      <br>
      "<span style="font-family:monospace"><span
          style="color:#000000;background-color:#ffffff;">#* GPS
                                    0   4   377    22  -3582us[-4257us]
          +/-  200ms" that means I get the correct time from gps.<br>
          Does anybody have similary experience? What can I do to fix
          these problems? Do you need further information?</span></span></p>
    <p><span style="font-family:monospace"><br>
      </span></p>
    <p><span style="font-family:monospace">Kind regards,</span></p>
    <p><span style="font-family:monospace">Ralph<br>
      </span></p>
    <pre class="moz-signature" cols="72">-- 

--
###############################################################
Dipl.-Phys. Ralph Nemitz    Tel.:    (0385) 2010 0054
Logic Way GmbH              Fax:     (0385) 2010 0099
Mettenheimerstraße 2        HTTP:    <a class="moz-txt-link-freetext" href="http://www.logicway.de">http://www.logicway.de</a>
19061 Schwerin              E-Mail:  <a class="moz-txt-link-abbreviated" href="mailto:nemitz@logicway.de">nemitz@logicway.de</a>
###############################################################
</pre>
  </body>
</html>

--------------z6g05mRKJOmXF1o6h1WgtsZa--

--===============4617893443750535821==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4617893443750535821==--
