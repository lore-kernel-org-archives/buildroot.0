Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6DE5ECAAD5
	for <buildroot@archiver.kernel.org>; Thu,  8 Sep 2022 09:54:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4396261226;
	Thu,  8 Sep 2022 09:54:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4396261226
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rJKcX8ZSPX74; Thu,  8 Sep 2022 09:54:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5888E61208;
	Thu,  8 Sep 2022 09:54:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5888E61208
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 513171BF36A
 for <buildroot@lists.busybox.net>; Thu,  8 Sep 2022 09:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3626B61208
 for <buildroot@lists.busybox.net>; Thu,  8 Sep 2022 09:54:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3626B61208
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HvRSHYX1Sp-v for <buildroot@lists.busybox.net>;
 Thu,  8 Sep 2022 09:54:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BE7260BF8
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3BE7260BF8
 for <buildroot@buildroot.org>; Thu,  8 Sep 2022 09:54:42 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-12ab0eaa366so3520347fac.13
 for <buildroot@buildroot.org>; Thu, 08 Sep 2022 02:54:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date;
 bh=8I5lcIrtYTmdHtsqlGxAQEsBvyL4n9yWr/zJj9GwZYg=;
 b=Gri72IkRN4NSyLwDNK6YUL2HNey38jZQ9UHqH62+DgshwFgtkw8HryX86ubwzDgHJF
 OQhGa7z9fP0J0w8zVL+9w1ySUJv9EcbfYS/syVHWVBbD3VG01DCD243zGEMPJYZNsiGg
 1r35Biq60cxn817MaEjSB+Q5cCvJtUuEiJFSY66NvjYB4zztcR31kX3VRr5rCX7eRDul
 Z+nNPc464daOal/lmp+8zcw5wYbrrqAFkWix3Rhdn0R1kj3g2kwE59fnaIV+uZMa47ky
 MbvKctBnYtOPJDyr4lo2dBJoefqIJsnZi7PE/r5vlP5ZD4fa8VvDFpxQXuvceLU2JfCw
 VXzQ==
X-Gm-Message-State: ACgBeo1bKNLhlQTA0ii/1XBHpOHAuQX8ORWFf+f5EjK1JG36iTCdrkjS
 FIuWBvSNfs/aW30/Z8ob6dBH8yLEdQo/76URkW8nueukFOs=
X-Google-Smtp-Source: AA6agR6Ni5D2+Q3p3rMvRtqxVST5Lxljgifh5Qe9rQbKazalGJ2tH7+W8hxzdMRo+1Jc7n1jFsJ0AyJxGPpk0PxfY1A=
X-Received: by 2002:a05:6870:344d:b0:11e:4aa4:869b with SMTP id
 i13-20020a056870344d00b0011e4aa4869bmr1335195oah.208.1662630876490; Thu, 08
 Sep 2022 02:54:36 -0700 (PDT)
MIME-Version: 1.0
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Thu, 8 Sep 2022 11:54:25 +0200
Message-ID: <CADYjeSumGE326iMjWw=NJoHpcp+L0tzSvMbufoNU1WxjPmbXag@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date;
 bh=8I5lcIrtYTmdHtsqlGxAQEsBvyL4n9yWr/zJj9GwZYg=;
 b=qYkk1CGeSnY6oca+AsTsz5fOvXRelZeBhvXcDPNOnTeHc6dQr32L9eeOG16PbwYjn5
 bD6H6GsWqhLI575+K93+/3W9CLUVgnIQEPk5/dlVVeJ0aw2N9Zujgv3naapFWQzhqrtu
 kEwZcQjMuAqKf+ZWFzTwSqI6dGrkNy9arQ2OvuvD5GmbvoavCfskjKzfV61TU3uQk/ON
 85f5IWEZcVZey28K7oYGmraaS921jGSXPSe3NvJo+5k2gk5rh0GFdId0CBHRz4F74vLO
 Iht90sILY8ArLozzICGFqVsTZKuk8hviqHWxNPpleZvFBqj1JFReaFuAU6EO0SvWYQDN
 XlZA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qYkk1CGe
Subject: [Buildroot] How to configure cron in BusyBox to obtain similar
 behavior as systemd service?
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
Content-Type: multipart/mixed; boundary="===============2738652372598254480=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2738652372598254480==
Content-Type: multipart/alternative; boundary="000000000000c933d605e8276a2a"

--000000000000c933d605e8276a2a
Content-Type: text/plain; charset="UTF-8"

Hello All,

I am fairly new to BusyBox and has previously worked with systemd as init
system. Now I want to switch to BusyBox as init system. I am using
Buildroot tool develop custom linux distribution. I have bunch of systemd
service and timer files and they run at certain interval to trigger some
actions. But now I have to adapt it to BusyBox scripts to obtain similar
behavior. I couldn't find any example/manual to demonstrate how this can be
done. And also I wanted to know if cron or crontab or anacron could be used
to schedule these executions and what are the downsides to it? Below I have
added some systemd service and timer files as reference and I would like to
know how this could be converted to BusyBox compatible. This would be the
starting point for me to continue further.

example.service

[Unit]
Description=Test
After=network.target

[Service]
User=root
Environment="x=/etc/xx.cnf"
ExecStartPre=/bin/ping www.google.com
ExecStart=/usr/bin/example
WorkingDirectory=/mnt/test/
TimeoutStartSec=20m
Restart=on-failure
RestartSec=2m

[Install]
WantedBy=multi-user.target

example.timer

[Unit]
Description=Example timer setup

[Timer]
OnActiveSec=1m
OnUnitActiveSec=20m

[Install]
WantedBy=basic.target

I am interested to know how failed jobs could be retriggered automatically
and how "Environment", "ExecStartPre" and "WorkingDirectory" could be
adapted in crontab to have similar behavior to systemd.

I also read that if cron is used then there could be issue with
/var/spool/cron/crontabs dir as this will be deleted after reboot and cron
jobs will fail. Is this true? Or do I need to put cron files in boot image
rather than rootfs image?

If there is any other way in busybox to achieve this, I would be happy to
know about it.

Your help will be much appreciated.

Thanks in advance

P.S: Please let me know if any info is missing here

--000000000000c933d605e8276a2a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello All,<br><div><br></div><div>I am fairly new to BusyB=
ox and has previously worked with systemd as init system. Now I want to swi=
tch to BusyBox as init system. I am using Buildroot tool develop custom lin=
ux distribution. I have bunch of systemd service and timer files and they r=
un at certain interval to trigger some actions. But now I have to adapt it =
to BusyBox scripts to obtain similar behavior. I couldn&#39;t find any exam=
ple/manual to demonstrate how this can be done. And also I wanted to know i=
f cron or crontab or anacron could be used to schedule these executions and=
 what are the downsides to it? Below I have added some systemd service and =
timer files as reference and I would like to know how this could be convert=
ed to BusyBox compatible. This would be the starting point for me to contin=
ue further.<br></div><div><br></div><div>example.service<br><br>[Unit]<br>D=
escription=3DTest<br>After=3Dnetwork.target<br><br>[Service]<br>User=3Droot=
<br>Environment=3D&quot;x=3D/etc/xx.cnf&quot;<br>ExecStartPre=3D/bin/ping <=
a href=3D"http://www.google.com">www.google.com</a><br>ExecStart=3D/usr/bin=
/example<br>WorkingDirectory=3D/mnt/test/<br>TimeoutStartSec=3D20m<br>Resta=
rt=3Don-failure<br>RestartSec=3D2m<br><br>[Install]<br>WantedBy=3Dmulti-use=
r.target</div><div><br>example.timer<br><br>[Unit]<br>Description=3DExample=
 timer setup<br><br>[Timer]<br>OnActiveSec=3D1m<br>OnUnitActiveSec=3D20m<br=
><br>[Install]<br>WantedBy=3Dbasic.target</div><div><br></div><div>I am int=
erested to know how failed jobs could be retriggered automatically and how =
&quot;Environment&quot;, &quot;ExecStartPre&quot; and &quot;WorkingDirector=
y&quot; could be adapted in crontab to have similar behavior to systemd.</d=
iv><div><br></div><div>I also read that if cron is used then there could be=
 issue with /var/spool/cron/crontabs dir as this will be deleted after rebo=
ot and cron jobs will fail. Is this true? Or do I need to put cron files in=
 boot image rather than rootfs image?</div><div><br>If there is any other w=
ay in busybox to achieve this, I would be happy to know about it.<br><br>Yo=
ur help will be much appreciated.<br><br>Thanks in advance<br><br>P.S: Plea=
se let me know if any info is missing here<br></div></div>

--000000000000c933d605e8276a2a--

--===============2738652372598254480==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2738652372598254480==--
