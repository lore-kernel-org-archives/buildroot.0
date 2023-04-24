Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA53EC77B76
	for <buildroot@archiver.kernel.org>; Mon, 24 Apr 2023 10:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C13C40C21;
	Mon, 24 Apr 2023 10:06:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C13C40C21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id id8mhOteUjN1; Mon, 24 Apr 2023 10:06:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65B7C40C1D;
	Mon, 24 Apr 2023 10:06:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65B7C40C1D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4BFA21C2AC7
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 10:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26E6760D59
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 10:06:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26E6760D59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2w1KhUDyJLUb for <buildroot@lists.busybox.net>;
 Mon, 24 Apr 2023 10:06:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 600D260A7F
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 600D260A7F
 for <buildroot@buildroot.org>; Mon, 24 Apr 2023 10:06:52 +0000 (UTC)
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
 by mailout07.t-online.de (Postfix) with SMTP id 4C6F6535DC
 for <buildroot@buildroot.org>; Mon, 24 Apr 2023 12:06:49 +0200 (CEST)
Received: from [192.168.178.32] ([80.128.93.19]) by fwd75.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pqt5s-2JZSBE0; Mon, 24 Apr 2023 12:06:49 +0200
Message-ID: <00604ac1-606d-ab11-8302-619aab02bcfe@t-online.de>
Date: Mon, 24 Apr 2023 12:06:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: buildroot@buildroot.org
Content-Language: en-US
From: =?UTF-8?Q?Niclas_G=c3=b6tting?= <niclas.goetting@t-online.de>
X-TOI-EXPURGATEID: 150726::1682330809-F0FE9C10-E6651EA5/0/0 CLEAN NORMAL
X-TOI-MSGID: da4a4b28-bbb3-467d-9d62-0247d86cdbe2
Subject: [Buildroot] SWUpdate default services
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
Content-Type: multipart/mixed; boundary="===============1561901399023443404=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============1561901399023443404==
Content-Type: multipart/alternative;
 boundary="------------MVpjCudrPvqk5Cc0LC7YHMlK"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------MVpjCudrPvqk5Cc0LC7YHMlK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

currently, the `swupdate`-package (for init-systems other than systemd) 
automatically installs a file called 
`/usr/lib/swupdate/conf.d/90-start-progress`, with the only content being

exec /usr/bin/swupdate-progress -w -r &

For me, this is problematic because of two reasons:

 1. Having `swupdate-progress` running in the background is optional and
    should therefore not be the default.
 2. The process is not handled via a service, but is started every time
    the `swupdate` service is started. If you restart SWUpdate five
    times, there will be five `swupdate-progress` processes.

Maybe I have overseen something, but I believe the file should not have 
been there in the first place and I would prefer to add my own scripts 
if I needed them. In any case, I would propose an option to disable 
installing this file.

Best regards
Niclas

--------------MVpjCudrPvqk5Cc0LC7YHMlK
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><font face="DejaVu Sans">Hi all,</font></p>
    <p><font face="DejaVu Sans">currently, the </font>`swupdate`-package
      (for init-systems other than systemd) automatically installs a
      file called `/usr/lib/swupdate/conf.d/90-start-progress`, with the
      only content being</p>
    <p>exec /usr/bin/swupdate-progress -w -r &amp;</p>
    <p>For me, this is problematic because of two reasons:</p>
    <ol>
      <li>Having `swupdate-progress` running in the background is
        optional and should therefore not be the default.</li>
      <li>The process is not handled via a service, but is started every
        time the `swupdate` service is started. If you restart SWUpdate
        five times, there will be five `swupdate-progress` processes.</li>
    </ol>
    <p>Maybe I have overseen something, but I believe the file should
      not have been there in the first place and I would prefer to add
      my own scripts if I needed them. In any case, I would propose an
      option to disable installing this file.</p>
    <p>Best regards<br>
      Niclas<br>
    </p>
  </body>
</html>

--------------MVpjCudrPvqk5Cc0LC7YHMlK--

--===============1561901399023443404==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1561901399023443404==--
