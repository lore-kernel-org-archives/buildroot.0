Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4846C83F2C
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 11:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E1EE40092;
	Sat,  2 Sep 2023 11:28:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E1EE40092
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9rJyA3wMIgBt; Sat,  2 Sep 2023 11:28:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5327440096;
	Sat,  2 Sep 2023 11:28:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5327440096
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3F0371BF409
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 11:28:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 25B904017B
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 11:28:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25B904017B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 99LIFG-6-IY3 for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 11:28:55 +0000 (UTC)
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5459440140
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 11:28:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5459440140
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-52a40cf952dso3627713a12.2
 for <buildroot@buildroot.org>; Sat, 02 Sep 2023 04:28:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693654133; x=1694258933;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SPxUvOiNWnNjrbdqd+MkF8Tvzh750UvfAqTU/MGQTPU=;
 b=NnzchYKX9zmiZWAEcFngYAiK/BQpENszRq7j8NEUTUVuDM/hibkgFf4/TTQZlrUuw2
 xCdDgZwhhrGXqUbhhxn7rU9s//gLclVxz2HxNUrtn6WkpH213DCGLfcTraIwOIG3UElN
 zwlJB2kGkt/jJRam/4nvx4LejSfCh/e8uCtKLPLmB4jYb77quv++bBGj/KWvcOdYHuIR
 1tdaV1n0d4Bk2lSru3O+olk8dLNFQu6/tF36awp4zXYrjZT6R36e46BBoMXXfY8l/wYn
 rYfrkC/GDKj1ZGGD/ZEY3oAEMvHs5Dim5rV6tffWXyDqOR8frtMJ3nRM3pHOkt1SuBsd
 WN4Q==
X-Gm-Message-State: AOJu0Yz2U0BMOWgm53JGWkZjx4TdvrdFdalkVS31clVd5VzReOWcwWuf
 rKTqxVTEjwK3PCOUokFY6N3O2EFr69LPGC7rMgum+da8zn0H3w==
X-Google-Smtp-Source: AGHT+IH2kD4G2B1jW4EuYmybYCH0EJG2WFtU3prN/aHPXf0TfBm0+i05L84cjTkT2NqvRke5KG9bpfj8DA+2SixHnaE=
X-Received: by 2002:aa7:c690:0:b0:523:3fff:5ce2 with SMTP id
 n16-20020aa7c690000000b005233fff5ce2mr3640663edq.41.1693654133145; Sat, 02
 Sep 2023 04:28:53 -0700 (PDT)
MIME-Version: 1.0
From: Andrea Simeoni <andreasimeoni73@gmail.com>
Date: Sat, 2 Sep 2023 13:28:42 +0200
Message-ID: <CAPmASeuyO9Y_bU67F8FSFspMfFyo1zT6YAfa-a1X0KS7HcR+5Q@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693654133; x=1694258933; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=SPxUvOiNWnNjrbdqd+MkF8Tvzh750UvfAqTU/MGQTPU=;
 b=i+KK6wIxs+eSIRhdq9bSxUt4eWShfCbYeZjXT5+QMvJfg2DFAP3Q7TcdEg5p2QpjJ7
 gZSLosojWqqB+4auWlzYs0HcZ7YelBenDQQ2hPx8WBveSVooHMZ1Biaw3ERiPSkKstg8
 i1XkoLfLbgk/wJgl248qJ5II8LGOYdbAwmEQBqfTjg2gOyPERVpYEUJ2pOcIwRETxdIy
 1b0CdcLgvcLlZxgNhyXCrNJiyvvBkinNBLEBubanzMZgivKPPrck5GV9kTd4mKkHHcOL
 t+C2vhHyHvuwd0jxJU0OR+G6pLY5DUaqz2EyOQFcYCf+XgcaKTVmows6s1+AnYp3n9zt
 PpiA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=i+KK6wIx
Subject: [Buildroot] PHP Apache module is not loaded
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
Content-Type: multipart/mixed; boundary="===============0284531699696791075=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0284531699696791075==
Content-Type: multipart/alternative; boundary="000000000000fa84de06045e9484"

--000000000000fa84de06045e9484
Content-Type: text/plain; charset="UTF-8"

When enabling Apache2 and PHP w/ Apache module, this is not added to the
httpd.conf file.
In order to run PHP code I had to add these line to httpd.conf:

LoadModule php_module modules/libphp.so
> <FilesMatch ".+\.ph(p[3457]?|t|tml)$">
>     SetHandler application/x-httpd-php
> </FilesMatch>
>

I guess it should be handled by Buildroot automatically.

--000000000000fa84de06045e9484
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>When enabling Apache2 and PHP w/ Apache module, this =
is not added to the httpd.conf file.</div><div>In order to run PHP code I h=
ad to add these line to httpd.conf:</div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div>LoadModule php_module modules/libphp.=
so<br>&lt;FilesMatch &quot;.+\.ph(p[3457]?|t|tml)$&quot;&gt;<br>=C2=A0 =C2=
=A0 SetHandler application/x-httpd-php<br>&lt;/FilesMatch&gt;</div></blockq=
uote><div><br></div><div>I guess it should be handled by Buildroot automati=
cally.<br></div></div>

--000000000000fa84de06045e9484--

--===============0284531699696791075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0284531699696791075==--
