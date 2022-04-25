Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE5DC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 15:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FA8A60E71;
	Mon, 25 Apr 2022 15:41:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z6muuHBzWM-X; Mon, 25 Apr 2022 15:41:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65D9860761;
	Mon, 25 Apr 2022 15:41:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EDED71BF295
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 15:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB9EA813E8
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 15:41:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MCojxTBhpXDN for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 15:41:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 71BEF813CC
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 15:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1650901259;
 bh=qeTB+gnYbJ4Bqn2HR8rQqzXzaDIpVP0tr7e0XDUUr7g=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=fpwbTExDpWsijrLuvhOhDbsCOrovt3UwpIXNDYsZk+PMv7nepYW/Lrr7p8v2KjZI+
 ZRkEGlVCJhz3U/QWMvpOwGE5jVnGPjJy9QWx8a5VzOhqtsccD7oM068q1XYP64Nj41
 qZ0f65Qw5vyOTo8pNQAy8gbBzwZWazgXyOk5IAbE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.178.101] ([84.133.21.31]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MD9T7-1naWOA30gD-0097oL for
 <buildroot@buildroot.org>; Mon, 25 Apr 2022 17:40:59 +0200
Message-ID: <fbd06f4f-2d2e-1ab0-d635-60bbd3aca262@gmx.de>
Date: Mon, 25 Apr 2022 17:40:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: buildroot@buildroot.org
References: <20220128145103.3422-1-universeiii@gmx.de>
From: Andreas Ehmanns <universeiii@gmx.de>
In-Reply-To: <20220128145103.3422-1-universeiii@gmx.de>
X-Provags-ID: V03:K1:fXH7W5uytmPnMLH3bG6BSHwP2qC5f1zb+y+0KMFavOS5sDmHNGe
 S/P8hJ/0CFIR+hiTZMx+8P85IB0Olp8JUTShBuuzU7kAa0vy/OU6gbCGXttNwNvDOox9sVX
 d4T7wc3e+RE8WVo9+rC/QhdKqKayMyeQY3D8CNUHSVwhgJ6gBZX9msHUOXx6WG6xNSJp5h8
 jPB9A2bcrRkET8HciWuWw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1Y40JYRycys=:SXp4808wJkTLSiAZvdi/Ig
 MpHYVpWkfjC9WO+d/9eFFnX7qWEAIF9HxU9wGNlyGhOBwComB8NZ95DRqvjrpU1JR1296ht0L
 Gl4vPLQYFC6eYTatieIKOnXNSJwEsjus+ScTsK3b+3/fg0AbnbzhaYF/9IeeJYGVfAvuJbuwo
 MEh1rqPvf58pLQcpLQ+TKtV7DKhkaQUVe7t0NPKnLtX2eksRkHIlu5u/guUfSeFONsUW7yK5k
 aZJk502VQ7CkgnUrqttakTDu5sJEWUGMh9fHT3ZmF+CfisWpb/BqR7FwdHCn3jZcYoAeod+ii
 th2La13qdQkIshRoau85FqCz7yT7dS3Q/iyjiSn8VbJTvMqxzFzvINbQjIoqL/0DFIWkjvefn
 0WKw+WIdbAyBEj3Wc3NpH3CA31qBQd1G0XqYkNe3IIX7FEFpCSxv77zy21XqJNG+M4TxFaTiR
 +TBwiz3e8dM9ZP7bH/ZkY0w+t3sWVw6lBywXBAtPzhV3YJhNkN1cF/G9fZ+msl0ddcXvtrxQx
 ZWZ7qlm1ar5bmwoCLmWZznORXGsxtQFjIWs9Bz5A+Bv2xM+2caSHDx1kQlgbu6FGQUbQFs0Ll
 A473zkgkeJuMMKje04hP6XyMAz5ZDeouikDDKXQCpB2z7v2MJ1EVMFPKgbLtqtPvPRglTwEQh
 mutVaYQJXT8/c17eRLs0Uh43mOMUdDjbKCrXDlp/Mt+UeNz0S3ctsbwjkLs9rvMmoeL1fBgz8
 i7AslpSWsFpj/OtJ59cngYrDux7Yef/3iJvqVnzT3HTdMbbD+mBr6esQTJ48QXkQf9fbaMrLn
 fCXdFnqumQ9h9sADAEdeY4XiB41So1EWVRnKyXKUaU+zcvyUMVlS00e2sG9ibqRDvU/EEbDo4
 Ghtg0C/hIXVgyq7rg9EA1ZuhfdJ3FyqoBmlnlAwOhcXQFVieV93IaWllWeetuqUBDdHCnlQpd
 N+WBdkupFgDZgpE+WW43P/fJo97fsOegoTbp5Vh6YhtaaJGPxZYFuHtTb7zNLytto9nBkx1ug
 sZetsCjhQWadz353ZXWkXdQ52Uog+tpwHyquMPyKsQbzfjdYDeqsL0LlcSnq1HmyANAiCuXKr
 QIB1KRzAs8jbe4=
Subject: [Buildroot] Enable missing security options for ISC dhcp server
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
Content-Type: multipart/mixed; boundary="===============4837581575334758362=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============4837581575334758362==
Content-Type: multipart/alternative;
 boundary="------------nCBkUnirf9pW7nSbL12sQWYX"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------nCBkUnirf9pW7nSbL12sQWYX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Dear all,
I was trying to make the ISC dhcp daemon more secure by using the -user
and -group option to let dhcp server run as non-root user.
Unfortunately these options are not available when building ISC dhcp
server with buildroot.
The reason is, that the configure script must be called with the
additional option --enable-paranoia to activate these options.
But this option is not set in the dhcp.mk file.

To be backward compatible I added a new option to the dhcp's Config.in
to enable this feature when desired.

If you are interested in this feature and can create a patch and send it
this list to make the change available to all buildroot users.
Let me know what you think. Below are some details.

Regards,
Andreas

1) Add this to Config.in:
config BR2_PACKAGE_DHCP_SERVER_ENABLE_PARANOIA
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool "Enable paranoia options"
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on BR2_PACKAGE_DHCP_SE=
RVER
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 help
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Add option --enabl=
e-paranoia to configure script. This activates
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 additional server =
options (-user, -group and -chroot) to make
dhcp server more secure.

2) And to dhcp.mk:
ifeq ($(BR2_PACKAGE_DHCP_SERVER_ENABLE_PARANOIA),y)
DHCP_CONF_OPTS +=3D --enable-paranoia
endif

--------------nCBkUnirf9pW7nSbL12sQWYX
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-=
8">
  </head>
  <body>
    <div class=3D"moz-text-flowed" style=3D"font-family: -moz-fixed;
      font-size: 12px;" lang=3D"x-unicode">Dear all,
      <br>
      I was trying to make the ISC dhcp daemon more secure by using the
      -user
      and -group option to let dhcp server run as non-root user.
      <br>
      Unfortunately these options are not available when building ISC
      dhcp
      server with buildroot.
      <br>
      The reason is, that the configure script must be called with the
      additional option --enable-paranoia to activate these options.
      <br>
      But this option is not set in the dhcp.mk file.<br>
    </div>
    <div class=3D"moz-text-flowed" style=3D"font-family: -moz-fixed;
      font-size: 12px;" lang=3D"x-unicode"><br>
    </div>
    <div class=3D"moz-text-flowed" style=3D"font-family: -moz-fixed;
      font-size: 12px;" lang=3D"x-unicode">To be backward compatible I
      added a new option to the dhcp's Config.in
      <br>
      to enable
      this feature when desired.
      <br>
      <br>
      If you are interested in this feature and can create a patch and
      send it
      this list to make the change available to all buildroot users.
      <br>
      Let me know what you think. Below are some details.
      <br>
      <br>
      Regards,
      <br>
      Andreas</div>
    <div class=3D"moz-text-flowed" style=3D"font-family: -moz-fixed;
      font-size: 12px;" lang=3D"x-unicode">
      <br>
      1) Add this to Config.in:<br>
      config BR2_PACKAGE_DHCP_SERVER_ENABLE_PARANOIA
      <br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool "Enable paranoia opt=
ions"
      <br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on BR2_PACKAGE_DH=
CP_SERVER
      <br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 help
      <br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Add option --=
enable-paranoia to configure script. This
      activates
      <br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 additional se=
rver options (-user, -group and -chroot) to
      make
      <br>
      dhcp server more secure.
      <br>
      <br>
      2) And to dhcp.mk:<br>
      ifeq ($(BR2_PACKAGE_DHCP_SERVER_ENABLE_PARANOIA),y)
      <br>
      DHCP_CONF_OPTS +=3D --enable-paranoia
      <br>
      endif
      <br>
    </div>
  </body>
</html>

--------------nCBkUnirf9pW7nSbL12sQWYX--


--===============4837581575334758362==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4837581575334758362==--

