Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B71C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 08:04:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95F714EBEA;
	Wed,  1 Nov 2023 08:04:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95F714EBEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xyutmoMfCUgm; Wed,  1 Nov 2023 08:04:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE5364EBED;
	Wed,  1 Nov 2023 08:04:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE5364EBED
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 356401BF2F5
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 08:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1766B84847
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 08:04:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1766B84847
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MnLksAhEZQR4 for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 08:04:31 +0000 (UTC)
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.154.54.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5FE1C84846
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 08:04:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FE1C84846
X-QQ-mid: bizesmtp90t1698825856tqq8wiz4
Received: from smtpclient.apple ( [36.27.65.245])
 by bizesmtp.qq.com (ESMTP) with SMTP id 0
 for <buildroot@buildroot.org>; Wed, 01 Nov 2023 16:04:14 +0800 (CST)
X-QQ-SSF: 0120000000000060Z000000A0000000
X-QQ-FEAT: 2DyNk/YukPDHEKE2PsG75xUR4z1p9COr7aMxODnTkq3ZC49nDFSl1FA5DWWMy
 woMI+jTCSi6A0oQ8W/SzF2uUD43cj48pAv074xwycYTOSYj050ew/7ujJYrA/ll1242XY4C
 L88Q3A/DageuIYT9wYVDaQC4GecP0C5oA3IrNIt6IfUHnZvYAS1mUEf6r0YUYz88usOBw5p
 cnMklEkM39aUZrB0EnfMYbmoeqtw3oPDS9sMNi53c7jPM5kM4eaYW531nMEzGSp5tDtQVuQ
 JjPL02s6EtUKdAjiRTONhNvAqNTQ2VIBhI9lUzj6zVIeaDdRs4Iyv5zjS+CiSJy5I3H7UYm
 rYlZC8hmi3ry4vfPxk=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15222861101267048187
From: =?utf-8?B?6Zm25rO95a6H?= <i@taozeyu.com>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.100.2.1.4\))
Message-Id: <F5BEC5A5-8166-48FA-A7C7-45C4F1250585@taozeyu.com>
Date: Wed, 1 Nov 2023 16:04:04 +0800
To: buildroot@buildroot.org
X-Mailer: Apple Mail (2.3774.100.2.1.4)
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:taozeyu.com:qybglogicsvrsz:qybglogicsvrsz3a-1
Subject: [Buildroot] Can buildroot support WSL config file
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
Content-Type: multipart/mixed; boundary="===============7194683690495396214=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============7194683690495396214==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_4B2E5CF1-57C6-40CC-945D-5D84461D8771"


--Apple-Mail=_4B2E5CF1-57C6-40CC-945D-5D84461D8771
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Many Linux distributions run "systemd" by default. But if you want WSL =
runs systemd by default, you need to put something in the file =
/etc/wsl.conf.

[boot]
systemd=3Dtrue

(To see =
https://learn.microsoft.com/en-us/windows/wsl/wsl-config#configuration-set=
tings-for-wslconf)

Can buildroot supports it in config panel? Maybe support some options in =
system/Config.in to generate /etc/wsl.conf. only a single checkbox or =
more list of options mentioned in Microsoft WSL documents.=

--Apple-Mail=_4B2E5CF1-57C6-40CC-945D-5D84461D8771
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"overflow-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;"><font =
size=3D"2"><span style=3D"color: rgba(0, 0, 0, 0.85);">Many Linux =
distributions run "systemd" by default. </span><span style=3D"caret-color:=
 rgba(0, 0, 0, 0.85); color: rgba(0, 0, 0, 0.85);">But</span><span =
style=3D"color: rgba(0, 0, 0, 0.85);">&nbsp;if you want WSL runs systemd =
by default, you need to put something in the file =
/etc/wsl.conf.</span></font><div><span style=3D"color: rgba(0, 0, 0, =
0.85);"><font size=3D"2"><br></font></span></div><div><span =
style=3D"color: rgba(0, 0, 0, 0.85);"><font =
size=3D"2">[boot]</font></span></div><div><span style=3D"caret-color: =
rgba(0, 0, 0, 0.85); color: rgba(0, 0, 0, 0.85);"><font =
size=3D"2">systemd=3Dtrue</font></span></div><div><span =
style=3D"caret-color: rgba(0, 0, 0, 0.85); color: rgba(0, 0, 0, =
0.85);"><font size=3D"2"><br></font></span></div><div><span =
style=3D"caret-color: rgba(0, 0, 0, 0.85); color: rgba(0, 0, 0, =
0.85);"><font size=3D"2">(</font></span><font size=3D"2"><span =
style=3D"caret-color: rgba(0, 0, 0, 0.85); color: rgba(0, 0, 0, =
0.85);">To see&nbsp;</span></font><a =
href=3D"https://learn.microsoft.com/en-us/windows/wsl/wsl-config#configura=
tion-settings-for-wslconf">https://learn.microsoft.com/en-us/windows/wsl/w=
sl-config#configuration-settings-for-wslconf</a>)</div><div><span =
style=3D"caret-color: rgba(0, 0, 0, 0.85); color: rgba(0, 0, 0, =
0.85);"><font size=3D"2"><br></font></span></div><div><font =
size=3D"2"><span style=3D"caret-color: rgba(0, 0, 0, 0.85); color: =
rgba(0, 0, 0, 0.85);">Can buildroot supports it in config =
panel?&nbsp;Maybe support some options in&nbsp;</span>system/Config.in =
to generate /etc/wsl.conf. only a single checkbox or&nbsp;<span =
style=3D"color: rgba(0, 0, 0, 0.85);">more list of options mentioned in =
Microsoft WSL documents.</span></font></div></body></html>=

--Apple-Mail=_4B2E5CF1-57C6-40CC-945D-5D84461D8771--

--===============7194683690495396214==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7194683690495396214==--
