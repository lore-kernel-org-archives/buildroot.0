Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A36C433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Mar 2022 12:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32A3140207;
	Sun,  6 Mar 2022 12:47:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q4pFqJUeVHQO; Sun,  6 Mar 2022 12:47:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2CFE940181;
	Sun,  6 Mar 2022 12:47:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2677B1BF4D5
 for <buildroot@lists.busybox.net>; Sun,  6 Mar 2022 12:47:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 103DE402EC
 for <buildroot@lists.busybox.net>; Sun,  6 Mar 2022 12:47:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vUxEcHgrJa0k for <buildroot@lists.busybox.net>;
 Sun,  6 Mar 2022 12:47:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 46B8A402E8
 for <buildroot@buildroot.org>; Sun,  6 Mar 2022 12:47:06 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id bc10so11188910qtb.5
 for <buildroot@buildroot.org>; Sun, 06 Mar 2022 04:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=+UVstrls7ZQ/tukZcAuAbESAUz6KxlQluU7YHGzjIYU=;
 b=gZUT3PD+M99EQd4EFuCh43Y0EWGp6Ok4QQaVdhhzKO9yohYONMnJaTmJ9EefLDlWsZ
 UErPKk7O6i22A5MicBuZUUWASPfpRiB+ZpTPuXSSDR1oD/a3Tk6JZa1jwJRFLrw0df/N
 2qIOIjrvbOnp3rFmpNmA6strON6mn/3dOT5oreLpqByrE7gHfy/XIz4ZLBR3EfGhs3tg
 Glr5D/GMEHtmk3H+gLSo5EuZDaZ4cvVLcjjXGbeiVDWpIxAwLAab9GPO7i4k4pczMvdc
 XFzEpUAjyFTQ+G/GM/+En6l2qQ6Hk1sl2YMwPC5wMHyRmW+Sdc5+vTDdsBuf7oyzYNlN
 3JHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=+UVstrls7ZQ/tukZcAuAbESAUz6KxlQluU7YHGzjIYU=;
 b=4Oj5x7uucxYRt32oDVqMTaNG/imxuPa1Einb/Im+8Eg3Lr4Vu+1qMZrM9HyfYxhz6T
 Ahb2zUQb53nUpUbHiJ2km5jIirv9ztA/eSP0OKhKu7fhWR+WKd9L/AuLcCwgCc7ARJAl
 a1UkxIQUKJXSSo3phAv4GAxDonWyyqhpobgtpVH0YMgYqM9UXIWrsemCPNIlhmjjl36G
 x+4mrIg+ddPqMtVxKtmuPqXMs8ALtg6c2eOerZiuL++jgkwugyrEwHsHHXai9GWQ7GO1
 rR0pSidYazSgNW3lUdsGfBv2zu+fyqUN1sdqoSll7vCWqmdTEujX1uvpeCK3Zf6PcvIv
 ernQ==
X-Gm-Message-State: AOAM530RdZyX/M5CqqlqWrKynthIBVFP+dWtp/P03xqMQyQwqXxutbW/
 EqzPfajNPBgJjIegOBY68f7xeOhbWU/5+BuqxgIUjbSVa/k=
X-Google-Smtp-Source: ABdhPJzREnWeHhmkxUj+2wnLeqSAp1S3iKSBfKyzWLeA6/x5i8rYHbKFGqxn/CXkghkw+wlOENcK+v6i9cg1B5Tfw4g=
X-Received: by 2002:a05:622a:138a:b0:2c9:efe8:72c7 with SMTP id
 o10-20020a05622a138a00b002c9efe872c7mr5849078qtk.546.1646570824886; Sun, 06
 Mar 2022 04:47:04 -0800 (PST)
MIME-Version: 1.0
From: Jacques Samoun <jacques.samoun33@gmail.com>
Date: Sun, 6 Mar 2022 14:46:54 +0200
Message-ID: <CACaKL1wxLACzdRqojEaji9p70okZ+EcBMJkUNOwYuDyvU-5AuQ@mail.gmail.com>
To: Buildroot Mailing List <buildroot@buildroot.org>
Subject: [Buildroot] cannot make the device_table
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
Content-Type: multipart/mixed; boundary="===============4450451067278188474=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4450451067278188474==
Content-Type: multipart/alternative; boundary="0000000000001d6bec05d98c25eb"

--0000000000001d6bec05d98c25eb
Content-Type: text/plain; charset="UTF-8"

Hello,
despite all my tries, i just cannot make the "device_table" feature work as
described in the manual.
Basically, i am trying to set 666 rights to /dev/tty + add a dialout group,
so i created the following file (device_table.txt"

/dev/tty c 666 root dialout 5 0 - - -

and have set the correct variable in menuconfig. I know for sure that the
build has handled this file ... but looking at the /dev/tty, it is clear
that nothing has happened, the permissions are still 600 and the dialout
group has not been set.

Am I missing something ?

--0000000000001d6bec05d98c25eb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div>despite all my tries, i just cannot make the &q=
uot;device_table&quot; feature work as described in the manual.</div><div>B=
asically, i am trying to set 666 rights to /dev/tty + add a dialout group, =
so i created the following file (device_table.txt&quot;</div><div><br></div=
><div>/dev/tty c 666 root dialout 5 0 - - -</div><div><br></div><div>and ha=
ve set the correct variable in menuconfig. I know for sure that the build h=
as handled this file ... but looking at the /dev/tty, it is clear that noth=
ing has happened, the permissions are still 600 and the dialout group has n=
ot been set.</div><div><br></div><div>Am I missing something ?</div></div>

--0000000000001d6bec05d98c25eb--

--===============4450451067278188474==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4450451067278188474==--
