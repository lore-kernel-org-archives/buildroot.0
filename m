Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D8D5C43334
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 07:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4B9A4159F;
	Mon, 27 Jun 2022 07:24:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4B9A4159F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V4GQ3ZIGHOQv; Mon, 27 Jun 2022 07:24:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59302415A5;
	Mon, 27 Jun 2022 07:24:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59302415A5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 68FF81BF3D5
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 07:24:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42C80415A5
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 07:24:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42C80415A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tT4GrSU-I0L3 for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 07:24:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D84C84159F
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D84C84159F
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 07:24:43 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id q6so17101366eji.13
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 00:24:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=XE0wYgCyiAHHzFamZMi8qn1Blv3ZHI30Cu8IdjERc9w=;
 b=gdQZRRxp4p/+09yaid7lMRrYSYunoUJo9BFyMToCbOBuFarVREt+mEm3+YjTP3pssL
 GTvsvUkjKiAymgjcHGzwakHWieJLwRuLIzU0j5t93KvQo/rZ077ltTQSIwyWMH0OyVsN
 p2e2dMq6gDzIYtAHF4Y2PSMzIe0PZyBMH8yYPaCGhmGp5L8Tnywnqy5SPfDjlYJEvb/W
 bosTnxfUE4KDvy3gIgWtO5TCRiJyy5JHa5tx/L370oB0XPiwaq9dNoy+I+a0mJciHlw7
 +54DJhpw1of9u014+ocKO1OX5t2E1Hp7OS13XfvtpIUqXVJIObGCNAoo7woEL6bhAEW7
 k7UA==
X-Gm-Message-State: AJIora8hOITTIy1oZ6x3cVo22LZ1hCztN4cbgPl8s8By9wcKAIoSq/GU
 i0FCjhUpjibzAsVBRvhmpdb15DB4H6iThTDsdVL1SHBneTU=
X-Google-Smtp-Source: AGRyM1uSIenXs9gVqtlCxCbehXMj6/vr4nD4ajv4D3cq/wjhF6ZWJGhuLbWf1/90ihkJLM3IisoYgwA9qI6WQgLPM48=
X-Received: by 2002:a17:906:6015:b0:726:95c1:924f with SMTP id
 o21-20020a170906601500b0072695c1924fmr7060708ejj.576.1656314681785; Mon, 27
 Jun 2022 00:24:41 -0700 (PDT)
MIME-Version: 1.0
From: Andy Bergh <allmyaddmin@gmail.com>
Date: Mon, 27 Jun 2022 09:24:15 +0200
Message-ID: <CAAmck7XmyTTXftb8cpcqyK7ca4PA1Pif4jcDyohPs3SWUBi1HQ@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=XE0wYgCyiAHHzFamZMi8qn1Blv3ZHI30Cu8IdjERc9w=;
 b=jJw4i1IKSlAAGU8yn3fBVQ3s/V5/ABcSSw5BoZhmktHsNZLRRniXnaIvAdJTDTb78g
 1w9/bpSg/pc9RsFzopF3TBqaDBwrB7fICn3AgrX0fQECpNV8J0ASKTGGtNIASTC+CgZi
 W8GwhhBi/pQixjjSj95BljxQAV+8rfODbGW1kXG/6HaU9+ZWc/c6pqZlP1OLuuAKfX2Q
 6XFbd1+92TfH+Yt40AaarxCZocdpb6roQv7sKYDxf4yZbHU4fVHLuklwx/Iteso54zYN
 O2pBWQtDETEdeYteIq3DeQbPoN8QeUYMF2UhGrEAkNNQBTYtfXoOTJVlJiDqnUg4nyiq
 8Wgw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jJw4i1IK
Subject: [Buildroot] BBB CAN Bus Clock Speed
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
Content-Type: multipart/mixed; boundary="===============0356179418833613804=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0356179418833613804==
Content-Type: multipart/alternative; boundary="0000000000003e849e05e268d0be"

--0000000000003e849e05e268d0be
Content-Type: text/plain; charset="UTF-8"

Hi,

I have a BBB with the CAN0 up and running. I do experience a problem every
so often *on startup* where the CANbus clock is not "correct".
On a working startup the output of *ip -d -s link show can0*:

2: can0: <NOARP,UP,LOWER_UP,ECHO> mtu 16 qdisc pfifo_fast state UP mode
DEFAULT group default qlen 10
    link/can  promiscuity 0 minmtu 0 maxmtu 0
    can state ERROR-ACTIVE (berr-counter tx 0 rx 0) restart-ms 0
 bitrate 125000 sample-point 0.875
 tq 500 prop-seg 6 phase-seg1 7 phase-seg2 2 sjw 1
 c_can: tseg1 2..16 tseg2 1..8 sjw 1..4 brp 1..1024 brp-inc 1
* clock 24000000 *
 re-started bus-errors arbit-lost error-warn error-pass bus-off
 0          0          0          0          0          0
numtxqueues 1 numrxqueues 1 gso_max_size 65536 gso_max_segs 65535
    RX: bytes  packets  errors  dropped overrun mcast
    141768     17721    0       0       0       0
    TX: bytes  packets  errors  dropped carrier collsns
    94768      11846    0       0       0       0

But on a "failing" startup the output is:
2: can0: <NO-CARRIER,NOARP,UP,ECHO> mtu 16 qdisc pfifo_fast state DOWN mode
DEFAULT group default qlen 10
    link/can  promiscuity 0 minmtu 0 maxmtu 0
    can state BUS-OFF (berr-counter tx 248 rx 127) restart-ms 0
 bitrate 125000 sample-point 0.875
 tq 500 prop-seg 6 phase-seg1 7 phase-seg2 2 sjw 1
 c_can: tseg1 2..16 tseg2 1..8 sjw 1..4 brp 1..1024 brp-inc 1
*  clock 26000000 *
 re-started bus-errors arbit-lost error-warn error-pass bus-off
 0          0          0          1          1          1
numtxqueues 1 numrxqueues 1 gso_max_size 65536 gso_max_segs 65535
    RX: bytes  packets  errors  dropped overrun mcast
    24         3        0       0       0       0
    TX: bytes  packets  errors  dropped carrier collsns
    0          0        0       0       0       0

I made the clock in *bold* as I suspect this is the problem. As far as I
understand the clock speed is selected in the "am33xx-clocks.dtsi" with
options:
clocks = <&virt_19200000_ck>, <&virt_24000000_ck>, <&virt_25000000_ck>,
<&virt_26000000_ck>;

The can bus is started with "/sbin/ip link set can0 type can bitrate
125000". Note that if I add "ip link set can0 type can bitrate 125000
*triple-sampling
on*" I get an error:
RTNETLINK answers: Operation not supported - is this maybe the problem?
Tripple-sampling will make the startup calculation of the canbus clock more
accurate?

So my question is, how can I ensure the clock is always set to *24000000*
on startup?

Thank you

--0000000000003e849e05e268d0be
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>I have a BBB with the CA=
N0 up and running. I do experience a problem every so often <b>on startup</=
b> where the CANbus clock is not &quot;correct&quot;.</div><div>On a workin=
g startup the output of <i>ip -d -s link show can0</i>:</div><div><br></div=
><div>2: can0: &lt;NOARP,UP,LOWER_UP,ECHO&gt; mtu 16 qdisc pfifo_fast state=
 UP mode DEFAULT group default qlen 10<br>=C2=A0 =C2=A0 link/can =C2=A0prom=
iscuity 0 minmtu 0 maxmtu 0 <br>=C2=A0 =C2=A0 can state ERROR-ACTIVE (berr-=
counter tx 0 rx 0) restart-ms 0 <br>	 =C2=A0bitrate 125000 sample-point 0.8=
75 <br>	 =C2=A0tq 500 prop-seg 6 phase-seg1 7 phase-seg2 2 sjw 1<br>	 =C2=
=A0c_can: tseg1 2..16 tseg2 1..8 sjw 1..4 brp 1..1024 brp-inc 1<br>	 <b>=C2=
=A0clock 24000000 </b><br>	 =C2=A0re-started bus-errors arbit-lost error-wa=
rn error-pass bus-off<br>	 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 numtxqueues 1 numrxqueues 1 gso_max_size 65536 gso_max=
_segs 65535 <br>=C2=A0 =C2=A0 RX: bytes =C2=A0packets =C2=A0errors =C2=A0dr=
opped overrun mcast =C2=A0 <br>=C2=A0 =C2=A0 141768 =C2=A0 =C2=A0 17721 =C2=
=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 0 =C2=A0 =C2=A0 =C2=A0 0 =C2=A0 =C2=A0 =C2=
=A0 0 =C2=A0 =C2=A0 =C2=A0 <br>=C2=A0 =C2=A0 TX: bytes =C2=A0packets =C2=A0=
errors =C2=A0dropped carrier collsns <br>=C2=A0 =C2=A0 94768 =C2=A0 =C2=A0 =
=C2=A011846 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 0 =C2=A0 =C2=A0 =C2=A0 0 =
=C2=A0 =C2=A0 =C2=A0 0 </div><div><br></div><div>But on a &quot;failing&quo=
t; startup the output is:</div><div>2: can0: &lt;NO-CARRIER,NOARP,UP,ECHO&g=
t; mtu 16 qdisc pfifo_fast state DOWN mode DEFAULT group default qlen 10<br=
>=C2=A0 =C2=A0 link/can =C2=A0promiscuity 0 minmtu 0 maxmtu 0 <br>=C2=A0 =
=C2=A0 can state BUS-OFF (berr-counter tx 248 rx 127) restart-ms 0 <br>	 =
=C2=A0bitrate 125000 sample-point 0.875 <br>	 =C2=A0tq 500 prop-seg 6 phase=
-seg1 7 phase-seg2 2 sjw 1<br>	 =C2=A0c_can: tseg1 2..16 tseg2 1..8 sjw 1..=
4 brp 1..1024 brp-inc 1<br><b>	 =C2=A0clock 26000000 </b><br>	 =C2=A0re-sta=
rted bus-errors arbit-lost error-warn error-pass bus-off<br>	 =C2=A00 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A01 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A01 =C2=A0 =C2=A0 =C2=A0 =C2=A0 numtxqueues 1 numr=
xqueues 1 gso_max_size 65536 gso_max_segs 65535 <br>=C2=A0 =C2=A0 RX: bytes=
 =C2=A0packets =C2=A0errors =C2=A0dropped overrun mcast =C2=A0 <br>=C2=A0 =
=C2=A0 24 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0=
 =C2=A0 =C2=A0 0 =C2=A0 =C2=A0 =C2=A0 0 =C2=A0 =C2=A0 =C2=A0 0 =C2=A0 =C2=
=A0 =C2=A0 <br>=C2=A0 =C2=A0 TX: bytes =C2=A0packets =C2=A0errors =C2=A0dro=
pped carrier collsns <br>=C2=A0 =C2=A0 0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 0 =C2=A0 =C2=A0 =C2=A0 =
0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 <br></div><div><br></div><div></div><div>I m=
ade the clock in <b>bold</b> as I suspect this is the problem. As far as I =
understand the clock speed is selected in the &quot;am33xx-clocks.dtsi&quot=
; with options:</div><div>clocks =3D &lt;&amp;virt_19200000_ck&gt;, &lt;&am=
p;virt_24000000_ck&gt;, &lt;&amp;virt_25000000_ck&gt;, &lt;&amp;virt_260000=
00_ck&gt;;</div><div><br></div><div>The can bus is started with &quot;/sbin=
/ip link set can0 type can bitrate 125000&quot;. Note that if I add &quot;i=
p link set can0 type can bitrate 125000 <b>triple-sampling on</b>&quot; I g=
et an error:</div><div>RTNETLINK answers: Operation not supported - is this=
 maybe the problem? Tripple-sampling will make the startup calculation of t=
he canbus clock more accurate?<br></div><div><br></div><div>So my question =
is, how can I ensure the clock is always set to <b>24000000</b> on startup?=
</div><div><br></div><div>Thank you<br></div><div><br></div></div>

--0000000000003e849e05e268d0be--

--===============0356179418833613804==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0356179418833613804==--
