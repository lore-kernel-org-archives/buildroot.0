Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB72C02198
	for <buildroot@archiver.kernel.org>; Wed, 12 Feb 2025 17:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1717406BE;
	Wed, 12 Feb 2025 17:43:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GRy3-EuEA5hJ; Wed, 12 Feb 2025 17:43:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C96540682
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C96540682;
	Wed, 12 Feb 2025 17:43:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C2F6BC2
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 17:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6C8880B54
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 17:43:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9hbyLvJi_cPs for <buildroot@buildroot.org>;
 Wed, 12 Feb 2025 17:43:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b29; helo=mail-yb1-xb29.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 918818044E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 918818044E
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 918818044E
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 17:43:22 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-e573136107bso6304926276.3
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 09:43:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739382201; x=1739987001;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vbcgJaWLf8g4ZGpXdabj3cS+biBpEmybxzgIx9OKt9E=;
 b=sshCSI0z3XsPpNNjTyUUCQ4w3U+wno3TtPDBXERN+tFi5uhYWWDUYB/eSb1FE/UQoE
 9mUxh2/KmjXP7oJy0rJW6dbVzVMFbdTtSaG8gxW5bD5/AHxq2P0qPjx5sNQ1RyBdrOPE
 6ryx5OZnf+sGUJmdZnl5qTRCT80yyOYdXkVTjlqpxpaXbPDHQ6ERyzBk5H2odE4nPP1O
 ow1D2eUF4mpsVEuAbYoe3lZnEEEiJZqi3XCT8rVSYvi2t3vCMWMgEnJCmEwYna4cZR7l
 gCXiuS5wK6I1076w0PPr11eS8CJSxlqHBaydXnfvd5n8S/0oUXvrzAwytxCv/IKPDvc8
 lg3Q==
X-Gm-Message-State: AOJu0YwsRSaN9dsUuK++nlszq53sCy8ON4ZMeJsLgMpP0oofnrkLglqM
 oawp65+rXzymaRVPqg2bmVPWXewKRsC4py5JFbA9Wqve+EnxCIJH4hv5blb3n7s+8cnUc1IEZIf
 nWm51ak9Bd3jS3b/Rxz+h8HlrMH9LBVNo
X-Gm-Gg: ASbGnct9QVnEuV42LmZxjJpdMaiUtxYsjv40ZHI0VzJQKY7srHXvXHTlp654BQoLG0D
 xu1bL4tdRiKd46xzKNpm764PEJkPcO3fjRVt5654zWv6sjMgfGz/5vOVpzmDRDJ3QSkOmBwWLew
 ==
X-Google-Smtp-Source: AGHT+IE5zhTzVYzkBaFfaNSVe+mGBIv8bmsQvYwBZLp+tZryLf36WuS88N9tgD2sbGQN3Hz7Momy5mTgbiMctwyeqWA=
X-Received: by 2002:a05:6902:2011:b0:e5b:1baa:1105 with SMTP id
 3f1490d57ef6-e5d9f18769amr3831303276.41.1739382200395; Wed, 12 Feb 2025
 09:43:20 -0800 (PST)
MIME-Version: 1.0
References: <20250111063753.769689-1-nemaakhilesh@gmail.com>
In-Reply-To: <20250111063753.769689-1-nemaakhilesh@gmail.com>
From: Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Wed, 12 Feb 2025 09:42:53 -0800
X-Gm-Features: AWEUYZnJfwEHpae84JRA_rwYu3O1opYyIOWI8SHCBiqLwvx8XslzaZfU9vQVMV0
Message-ID: <CAMV0Ro-AWc6Ugxsgks2zhVzvNkpVWW0zoJSvYfQ0STh2D4yu8A@mail.gmail.com>
To: buildroot@buildroot.org
Cc: Brandon Maier <brandon.maier@collins.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739382201; x=1739987001; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vbcgJaWLf8g4ZGpXdabj3cS+biBpEmybxzgIx9OKt9E=;
 b=TXnAa4Zatq1ybzMyv3HD2NaRCBBOog5gm7PGGGOOlpcbjgrFrWFRRg+8YE+uQONtz9
 b46w0kFd7IkxYnXLKMGYXZ/+O1kUNN5tDpiv9nGE/CM8DQXK9fd4ZCHE+T2ogObAZ5pk
 6WK5VZFhiTmnyUSj3U6nFCcI8rHHGw/rv2CN5rn04k0K6NsZo/hZGwLWeQr5lV4849ca
 OHAAG5saQrAsU5r7SGptzDxBMXf5/TtO7uFDY9fwPQ+sXDn8pZoT5D394skWa4/o3ilO
 O3tmUgogKn/1oQp8aj5EPF90ncFDHBlijaibJkDrw3xu36kWjw5hKvew5C/ZfX0DPsvY
 yr1Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TXnAa4Za
Subject: Re: [Buildroot] [PATCH 1/5] package/qoriq-rcw: bump version to
 lf-6.6.52-2.2.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5938466825500501068=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5938466825500501068==
Content-Type: multipart/alternative; boundary="0000000000002ef696062df57a99"

--0000000000002ef696062df57a99
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2025 at 10:37=E2=80=AFPM Akhilesh Nema <nemaakhilesh@gmail.=
com>
wrote:

> Changelog:
> https://github.com/nxp-qoriq/rcw/compare/lf-6.6.23-2.0.0...lf-6.6.52-2.2.=
0
>
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
> ---
>  package/qoriq-rcw/qoriq-rcw.hash | 2 +-
>  package/qoriq-rcw/qoriq-rcw.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>

Could you please review this patch series?

The following defconfigs require the latest LF release tags to satisfy all
dependencies:

https://github.com/buildroot/buildroot/blob/master/configs/ls1046a-frwy_def=
config
https://github.com/buildroot/buildroot/blob/master/configs/ls1046a-rdb_defc=
onfig
https://github.com/buildroot/buildroot/blob/master/configs/ls1043a-rdb_defc=
onfig

LF version tags are a new approach introduced by NXP. If this method is
intended to be used consistently for future releases, it might be worth
considering the introduction of a buildroot config option to store the LF
version to simplify version upgrades for NXP boards.

Thanks
Akhilesh

--0000000000002ef696062df57a99
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>On Fri, Jan 10, 2025 at 10:37=E2=80=AFPM Akhilesh Nem=
a &lt;<a href=3D"mailto:nemaakhilesh@gmail.com">nemaakhilesh@gmail.com</a>&=
gt; wrote:</div><div><div class=3D"gmail_quote gmail_quote_container"><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">Changelog:<br>
<a href=3D"https://github.com/nxp-qoriq/rcw/compare/lf-6.6.23-2.0.0...lf-6.=
6.52-2.2.0" rel=3D"noreferrer" target=3D"_blank">https://github.com/nxp-qor=
iq/rcw/compare/lf-6.6.23-2.0.0...lf-6.6.52-2.2.0</a><br>
<br>
Signed-off-by: Akhilesh Nema &lt;<a href=3D"mailto:nemaakhilesh@gmail.com" =
target=3D"_blank">nemaakhilesh@gmail.com</a>&gt;<br>
---<br>
=C2=A0package/qoriq-rcw/qoriq-rcw.hash | 2 +-<br>
=C2=A0package/qoriq-rcw/<a href=3D"http://qoriq-rcw.mk" rel=3D"noreferrer" =
target=3D"_blank">qoriq-rcw.mk</a>=C2=A0 =C2=A0| 2 +-<br>
=C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br></blockquote><div=
>=C2=A0</div><div><div dir=3D"ltr">Could you please review this patch serie=
s?</div><div dir=3D"ltr"><br>The following defconfigs require the latest LF=
 release tags to satisfy all dependencies:<br><br></div><div dir=3D"ltr"><a=
 href=3D"https://github.com/buildroot/buildroot/blob/master/configs/ls1046a=
-frwy_defconfig">https://github.com/buildroot/buildroot/blob/master/configs=
/ls1046a-frwy_defconfig</a><br><a href=3D"https://github.com/buildroot/buil=
droot/blob/master/configs/ls1046a-rdb_defconfig">https://github.com/buildro=
ot/buildroot/blob/master/configs/ls1046a-rdb_defconfig</a><br><a href=3D"ht=
tps://github.com/buildroot/buildroot/blob/master/configs/ls1043a-rdb_defcon=
fig">https://github.com/buildroot/buildroot/blob/master/configs/ls1043a-rdb=
_defconfig</a><br><br>LF version tags are a new approach introduced by NXP.=
 If this method is intended to be used consistently for future releases, it=
 might be worth considering the introduction of a buildroot config option t=
o store the LF version to simplify version upgrades for NXP boards.</div><d=
iv><br></div>Thanks<div>Akhilesh</div></div></div></div></div>

--0000000000002ef696062df57a99--

--===============5938466825500501068==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5938466825500501068==--
