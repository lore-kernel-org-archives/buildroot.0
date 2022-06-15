Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56FC6C43334
	for <buildroot@archiver.kernel.org>; Wed, 15 Jun 2022 16:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1515827BB;
	Wed, 15 Jun 2022 16:07:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mh_PmNNS1WGe; Wed, 15 Jun 2022 16:07:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EB81826E7;
	Wed, 15 Jun 2022 16:07:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CAA251BF4DB
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 16:07:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B299940A4B
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 16:07:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iUU8e8HVG6Lv for <buildroot@lists.busybox.net>;
 Wed, 15 Jun 2022 16:07:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E7B67405F6
 for <buildroot@buildroot.org>; Wed, 15 Jun 2022 16:07:07 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id x17so16013477wrg.6
 for <buildroot@buildroot.org>; Wed, 15 Jun 2022 09:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r8uwktqnrqb2kSPUH3Mh777x01g6fPKvlhFqXAwDSuU=;
 b=cjIgtI7Jyv5iQGCT4+9fFrqP8H6UDrJtOi3NN/Nuo0FsjIm4u7gf4S2wz7HNDmdbK+
 bIGhvM+1aEnNzIcdjnx1Mfhe0b46/e2WsuOqz/+5V+b3rZTs3vBnupETnftpu9/Z39gV
 Cb2+uBgNOCN31q1sepM+dBv5i1KWpUu5eUNrMhrBv8Evl4KJckjnAfZiB5W1Wpe0jitB
 0jREL9nwgR3O6E8F5pCNef0f1kO1wO+fGc8kfQdKweVt2znlE8PeskAy6KTv3fes5sFt
 /GUGq3LQ42UinSycD7G7Ifr+gZQqQjFpsAPKatj+t8yDRbXa/kXetwsTVcvv/If6S/6p
 EI6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r8uwktqnrqb2kSPUH3Mh777x01g6fPKvlhFqXAwDSuU=;
 b=ubs21u6oCMYDNBawmeruNDevE6f6tcfaoLBDfWlBBVWl5JnO2kHfhyDD2VoR4IM5ur
 rShCk0jZb0Q2J6CIeAs+9LiC35MN7Q3SLFomSe5AG6qZ5Ss7DtKGlkXGLXHPSOEF2KWk
 C2QBsAxtSbRWW697OsszFvsqAJkYRdjdeBleTnSQubq8lEPIqb0+xMjgV8FKYB8ZDJuc
 Ly9v4+RYFsZsLe7eJK5u22tt3jDyWTHqmHQmY6NjpaL+yo/wtgKDA9LrACNvgw6hqToA
 1jhbIkWI93ug2RgsK+aq5BO4WYpWZkV9REen9tuFCzOoN3JjwqP6zqNnmjz6GnbCwfnS
 V+Hw==
X-Gm-Message-State: AJIora/mder+aYWqHHhYhHF2biBdrwL4L3CfmnO4cGXgQVCQhTBGzUH3
 oOI4nLnz2dN8vNNhOOKSAjyoTc2FyFtOSR5z29Y=
X-Google-Smtp-Source: AGRyM1uO4Lztz+48jtI/D6Mx7+lyHweh15z+YogsS2VvNhBFOpf6r7us5/zkzzTTP0oVAwzNnTVl8qB+Zdq/TefVZxg=
X-Received: by 2002:adf:fa8b:0:b0:214:1f4f:5e71 with SMTP id
 h11-20020adffa8b000000b002141f4f5e71mr480440wrr.149.1655309226069; Wed, 15
 Jun 2022 09:07:06 -0700 (PDT)
MIME-Version: 1.0
References: <8c2fc8d9-5bc7-1982-35ed-1fc31e1bb470@mind.be>
In-Reply-To: <8c2fc8d9-5bc7-1982-35ed-1fc31e1bb470@mind.be>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 15 Jun 2022 18:06:52 +0200
Message-ID: <CAEyMn7Y0DBejQEqpx8apVkSTnELhhaUQD56bGSJCJSSsA3zabA@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] Article for the German Linux magazine
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
Cc: Jens-Christoph Brendel <jens-christoph.brendel@computec.de>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============1336425894634863857=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1336425894634863857==
Content-Type: multipart/alternative; boundary="00000000000069d56405e17eb647"

--00000000000069d56405e17eb647
Content-Type: text/plain; charset="UTF-8"

Hi,

What about bootloaders and the generation of complete deployable Images?

--
Heiko

>
>

--00000000000069d56405e17eb647
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi,<div dir=3D"auto"><br></div><div dir=3D"auto">What abo=
ut bootloaders and the generation of complete deployable Images?</div><div =
dir=3D"auto"><br></div><div dir=3D"auto">--</div><div dir=3D"auto">Heiko=C2=
=A0</div><div class=3D"gmail_quote" dir=3D"auto"><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><br>
</blockquote></div></div>

--00000000000069d56405e17eb647--

--===============1336425894634863857==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1336425894634863857==--
