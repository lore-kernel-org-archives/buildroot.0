Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F112EC4167B
	for <buildroot@archiver.kernel.org>; Fri,  8 Dec 2023 10:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81363421E4;
	Fri,  8 Dec 2023 10:45:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81363421E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dL2nOaUN8rze; Fri,  8 Dec 2023 10:45:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9953421A0;
	Fri,  8 Dec 2023 10:45:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9953421A0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B9F631BF34A
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 10:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92945421A0
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 10:45:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92945421A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wEG-hgzolkxG for <buildroot@lists.busybox.net>;
 Fri,  8 Dec 2023 10:45:47 +0000 (UTC)
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CCA81401D6
 for <buildroot@buildroot.org>; Fri,  8 Dec 2023 10:45:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCA81401D6
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-db539ab8e02so2240114276.0
 for <buildroot@buildroot.org>; Fri, 08 Dec 2023 02:45:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702032345; x=1702637145;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pzDPDi6fLOiAAknOAW6FJq4d34tFf2178FYg4BTJZZA=;
 b=hRa4YMeeTOwFUiHo1ChFRwxNbgDGbIO7VM3yIZ/G1ukFKKagXsDV/lnYs/w35SoFlB
 ajlPnEsn8iA7HBwKwla1claILte3q4rpTU3TG9cAu7sB4pqfqDPfCsQStXNM5PTffFse
 9ZlJGxk7BocN++KQKZS2yA1bAOZrw/DiinZGDK21SpWF0ycipeDSJC3PJV1xOsFyUyIV
 iF51C2tESMAM25PkwMOtoCtsT5A4vFNR5RAypLH7sYFmcKTwFqMNqxtHnbXFez1Sz460
 pRjh6bEBaMWzC4yRpZ4ZG+sGpacqYQIjbi4zMdsmPfpXCk5mTipsxkno0xF7+6moUePG
 isyA==
X-Gm-Message-State: AOJu0YwCBYLkVKdQfzL58/2MKMXAM6Ni/yzVC7m3KXBLMn8iVMLJBL/r
 NnEyyFk6st1ERfFbOlNVEc8BHk4REZ4E2LUh2kZyAGFvf7E=
X-Google-Smtp-Source: AGHT+IF93SvbihkaqThz09jUX3R7eGXQJxr+yO6Gp92ZuuUw3C+m0kFZS/C7ARVRZYkBQ2wovFXmA8yu5qC9BHtantI=
X-Received: by 2002:a5b:f8a:0:b0:db7:b6fb:7446 with SMTP id
 q10-20020a5b0f8a000000b00db7b6fb7446mr3816711ybh.9.1702032345327; Fri, 08 Dec
 2023 02:45:45 -0800 (PST)
MIME-Version: 1.0
From: Stefano Cottafavi <stefano.cottafavi@gmail.com>
Date: Fri, 8 Dec 2023 11:45:34 +0100
Message-ID: <CAPn86JAC9RLnYULz=M+y55KGgzvF_yWZa3ujNSbg58aCS6KPZQ@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702032345; x=1702637145; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=pzDPDi6fLOiAAknOAW6FJq4d34tFf2178FYg4BTJZZA=;
 b=FpgA4GtYscqNv839naRNFsLnTJ/G5jVTn1rxb1GWb9/DmYQOtjCUOyXpL8NVh8WWXJ
 6oADBlaE+9CwVyRQkj9OCAmYEuxhK+tHeP7HtqpoGkaMcSeqAKVtEIX65psFons+jTYY
 L+SNnZsbhYKVzh8YuJaLT2PgOyzMzk7BWZKHo9hrZ8MugIHU6IkVzIoLtZda4ZSr18pE
 YPO6FvrywHfJ/4wgO5CqcYLLxnF4AdmZeG30MhJLxj1RiZeaQB8rYmJu/vpPZIApSaCO
 kwmDyLQ5qw+qyCMJ+qHGxe4Fumw/oO6rEwXeGtOa2IRzGOrKnSxHIh3iQAbdocJAD8Is
 oLJQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FpgA4GtY
Subject: [Buildroot] help - custom user not working
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
Content-Type: multipart/mixed; boundary="===============5077959342614893000=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5077959342614893000==
Content-Type: multipart/alternative; boundary="00000000000056edf5060bfd49f2"

--00000000000056edf5060bfd49f2
Content-Type: text/plain; charset="UTF-8"

Hi,
I'm trying to add a custom user to the minimal "raspberrypi4_defconfig"
build.
I'm using Buildroot 2023.11, following the manual I've created a
"users.txt" file (in the buildroot root folder) with just one line:

pi -1 pi -1 =raspberry /home/pi /bin/sh -

The config file contains:

BR2_ROOTFS_USERS_TABLES="users.txt"

The build is successful and looking and the "full_users_table.txt" (output
of the build) I can see the user definition above.

However, when I try to log on as "pi" I get "Login incorrect" error.

If I login as root and check the /etc/psswd, I DO NOT see the user pi

Can you help me understand what am I missing?

Cheers
Stefano

--00000000000056edf5060bfd49f2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace;font-size:small">Hi,</div><div class=3D"gmail_default" style=3D=
"font-family:monospace,monospace;font-size:small">I&#39;m trying to add a c=
ustom user to the minimal &quot;raspberrypi4_defconfig&quot; build.</div><d=
iv class=3D"gmail_default" style=3D"font-family:monospace,monospace;font-si=
ze:small">I&#39;m using Buildroot 2023.11, following the manual I&#39;ve cr=
eated a &quot;users.txt&quot; file (in the buildroot root folder) with just=
 one line:</div><div class=3D"gmail_default" style=3D"font-family:monospace=
,monospace;font-size:small"><br></div><div class=3D"gmail_default" style=3D=
"font-family:monospace,monospace;font-size:small">pi -1 pi -1 =3Draspberry =
/home/pi /bin/sh -<br></div><div class=3D"gmail_default" style=3D"font-fami=
ly:monospace,monospace;font-size:small"><br></div><div class=3D"gmail_defau=
lt" style=3D"font-family:monospace,monospace;font-size:small">The config fi=
le contains:</div><div class=3D"gmail_default" style=3D"font-family:monospa=
ce,monospace;font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-family:monospace,monospace;font-size:small">BR2_ROOTFS_USERS_TABLE=
S=3D&quot;users.txt&quot;<br></div><div class=3D"gmail_default" style=3D"fo=
nt-family:monospace,monospace;font-size:small"><br></div><div class=3D"gmai=
l_default" style=3D"font-family:monospace,monospace;font-size:small">The bu=
ild is successful=C2=A0and looking and the &quot;full_users_table.txt&quot;=
 (output of the build) I can see the user definition above.</div><div class=
=3D"gmail_default" style=3D"font-family:monospace,monospace;font-size:small=
"><br></div><div class=3D"gmail_default" style=3D"font-family:monospace,mon=
ospace;font-size:small">However, when I try to log on as &quot;pi&quot; I g=
et &quot;Login incorrect&quot; error.</div><div class=3D"gmail_default" sty=
le=3D"font-family:monospace,monospace;font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-family:monospace,monospace;font-size:small=
">If I login as root and check the /etc/psswd, I DO NOT see the user pi</di=
v><div class=3D"gmail_default" style=3D"font-family:monospace,monospace;fon=
t-size:small"><br></div><div class=3D"gmail_default" style=3D"font-family:m=
onospace,monospace;font-size:small">Can you help me understand what am=C2=
=A0I missing?</div><div class=3D"gmail_default" style=3D"font-family:monosp=
ace,monospace;font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-family:monospace,monospace;font-size:small">Cheers</div><div class=
=3D"gmail_default" style=3D"font-family:monospace,monospace;font-size:small=
">Stefano</div></div>

--00000000000056edf5060bfd49f2--

--===============5077959342614893000==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5077959342614893000==--
