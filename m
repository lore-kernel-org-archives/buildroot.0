Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8681AC30658
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 15:53:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C4DB6078B;
	Tue,  2 Jul 2024 15:53:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yEJpVNilA4p6; Tue,  2 Jul 2024 15:53:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A42560B97
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A42560B97;
	Tue,  2 Jul 2024 15:53:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 449631BF30E
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 15:53:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C591820C0
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 15:53:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rVLn9-azJlj5 for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 15:53:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=nhed@starry.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 17E44820B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17E44820B0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 17E44820B0
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 15:53:18 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-42578fe58a6so22436765e9.3
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 08:53:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719935597; x=1720540397;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wb/GMSiwhov+P/gDYVibx4YeB176jMLYFgN+EzkjrA8=;
 b=G7pYVOJJh9JTr7bJErkMUvjgWv6m5A52XNmyHwEyJG81ElRU28wo7iuUcCpCXfnhA7
 b2NlqrzvqGExi9nWRh+NAUbRMUds1KzwEPU+a9zgEKLdzwIl4a5Xi/1E4zDIWun9DXlx
 q1AfG6u1fwrTMSfRuVRnkSQebIQKaAJWP8+DE/izm3M4IvMxDAA99JcNSCZ1oxQSznze
 LBbiaNyYk27p6i5iWn/YMj3CO2IL5QWdJpi3S8ALWQAhAcpIuBGXzZxjBU0IwlzxxCjs
 PDCcss8UNC4g9wLlA0NdBaJRbSHPyrqXwnD4F+DQjggcViha9cDCkIXNUpelSg+UcIY3
 Orxg==
X-Gm-Message-State: AOJu0YxLQkSsmWVGABdKtUPc+aUbskAcIJ6Pzqci6Jvm4IhmY6vOVl0N
 QqNFK+unZlIJfs+wzgWP5s05ahZA+OnF55g0C6xbtKD3lDF7Xo1pNEmGVzqk0EeSJy58e3M/BWA
 q9X3eKrOFGoIOkBZYWdYKnFL9N249FZJ9by68ZQ==
X-Google-Smtp-Source: AGHT+IGDykj26sa1aBtLmptLsVmHMaE/CMFTw9e1N3Tj4kN/vNL5eNbrOvruUykmjsVjoFTo8SULgMFlJJNoGldFBNA=
X-Received: by 2002:a05:6000:247:b0:367:89fc:bc11 with SMTP id
 ffacd0b85a97d-36789fcbd51mr1151047f8f.10.1719935596629; Tue, 02 Jul 2024
 08:53:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240702123615.1028278-2-niyawe@niyawe.de>
In-Reply-To: <20240702123615.1028278-2-niyawe@niyawe.de>
Date: Tue, 2 Jul 2024 11:53:05 -0400
Message-ID: <CABGDZCn0UoL6pxwjg2Xw1NpC1SFUQK5uvfRdnc4nfRKercVS8w@mail.gmail.com>
To: Niklas Yann Wettengel <niyawe@niyawe.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=starry.com; s=google; t=1719935597; x=1720540397; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Wb/GMSiwhov+P/gDYVibx4YeB176jMLYFgN+EzkjrA8=;
 b=b9QnA6kiX/IO1qk08InJ34j1vBOq8vfp8faQcxuN4WUP4uwIfXxybUQQrrciz6IqYo
 6NysySmQ0TkC9fG3yEPL4r3NYe5QoCTO1RUfPYInzp64zyemjt/NKnVXC4AVBMbX0P8L
 SIq/5hT4/dOSLFetrXPOUf24cAmzsTzm5BpQw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=starry.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=starry.com header.i=@starry.com header.a=rsa-sha256
 header.s=google header.b=b9QnA6ki
Subject: Re: [Buildroot] [PATCH 1/1] packages/openssh: install sshd-session
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
From: Nevo Hed via buildroot <buildroot@buildroot.org>
Reply-To: Nevo Hed <nhed+buildroot@starry.com>
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============5113377754083399016=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5113377754083399016==
Content-Type: multipart/alternative; boundary="000000000000462d19061c45b657"

--000000000000462d19061c45b657
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+1 - I came here to suggest the same patch

On Tue, Jul 2, 2024 at 8:36=E2=80=AFAM Niklas Yann Wettengel <niyawe@niyawe=
.de>
wrote:

> In OpenSSH 9.8 the server is split into two processes: sshd and
> sshd-session which results in the following error, when trying
> to start sshd:
>
> Starting sshd: /usr/libexec/sshd-session does not exist or is not
> executable
>
> This patch installs the sshd-session binary
>
> Signed-off-by: Niklas Yann Wettengel <niyawe@niyawe.de>
> ---
>  package/openssh/openssh.mk | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
> index 6d846f64df..7065c3ae4f 100644
> --- a/package/openssh/openssh.mk
> +++ b/package/openssh/openssh.mk
> @@ -117,6 +117,7 @@ endif
>  ifeq ($(BR2_PACKAGE_OPENSSH_SERVER),y)
>  define OPENSSH_INSTALL_SERVER_PROGRAMS
>         $(INSTALL) -D -m 0755 $(@D)/sshd $(TARGET_DIR)/usr/sbin/sshd
> +       $(INSTALL) -D -m 0755 $(@D)/sshd-session
> $(TARGET_DIR)/usr/libexec/sshd-session
>         $(INSTALL) -D -m 0755 $(@D)/sftp-server
> $(TARGET_DIR)/usr/libexec/sftp-server
>  endef
>  OPENSSH_POST_INSTALL_TARGET_HOOKS +=3D OPENSSH_INSTALL_SERVER_PROGRAMS
> --
> 2.45.2
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--000000000000462d19061c45b657
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">+1 - I came here to suggest the same patch<br></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul =
2, 2024 at 8:36=E2=80=AFAM Niklas Yann Wettengel &lt;<a href=3D"mailto:niya=
we@niyawe.de">niyawe@niyawe.de</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">In OpenSSH 9.8 the server is split into two p=
rocesses: sshd and<br>
sshd-session which results in the following error, when trying<br>
to start sshd:<br>
<br>
Starting sshd: /usr/libexec/sshd-session does not exist or is not executabl=
e<br>
<br>
This patch installs the sshd-session binary<br>
<br>
Signed-off-by: Niklas Yann Wettengel &lt;<a href=3D"mailto:niyawe@niyawe.de=
" target=3D"_blank">niyawe@niyawe.de</a>&gt;<br>
---<br>
=C2=A0package/openssh/<a href=3D"http://openssh.mk" rel=3D"noreferrer" targ=
et=3D"_blank">openssh.mk</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/package/openssh/<a href=3D"http://openssh.mk" rel=3D"noreferre=
r" target=3D"_blank">openssh.mk</a> b/package/openssh/<a href=3D"http://ope=
nssh.mk" rel=3D"noreferrer" target=3D"_blank">openssh.mk</a><br>
index 6d846f64df..7065c3ae4f 100644<br>
--- a/package/openssh/<a href=3D"http://openssh.mk" rel=3D"noreferrer" targ=
et=3D"_blank">openssh.mk</a><br>
+++ b/package/openssh/<a href=3D"http://openssh.mk" rel=3D"noreferrer" targ=
et=3D"_blank">openssh.mk</a><br>
@@ -117,6 +117,7 @@ endif<br>
=C2=A0ifeq ($(BR2_PACKAGE_OPENSSH_SERVER),y)<br>
=C2=A0define OPENSSH_INSTALL_SERVER_PROGRAMS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(INSTALL) -D -m 0755 $(@D)/sshd $(TARGET_DIR)/=
usr/sbin/sshd<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -D -m 0755 $(@D)/sshd-session $(TARG=
ET_DIR)/usr/libexec/sshd-session<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(INSTALL) -D -m 0755 $(@D)/sftp-server $(TARGE=
T_DIR)/usr/libexec/sftp-server<br>
=C2=A0endef<br>
=C2=A0OPENSSH_POST_INSTALL_TARGET_HOOKS +=3D OPENSSH_INSTALL_SERVER_PROGRAM=
S<br>
-- <br>
2.45.2<br>
<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div>

--000000000000462d19061c45b657--

--===============5113377754083399016==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5113377754083399016==--
