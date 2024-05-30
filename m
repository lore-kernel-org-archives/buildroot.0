Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98680C25B74
	for <buildroot@archiver.kernel.org>; Thu, 30 May 2024 15:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D7F4404D1;
	Thu, 30 May 2024 15:53:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yn0KshoZ327G; Thu, 30 May 2024 15:53:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28BEC41431
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28BEC41431;
	Thu, 30 May 2024 15:53:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2096E1D483D
 for <buildroot@lists.busybox.net>; Thu, 30 May 2024 15:53:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D366610C7
 for <buildroot@lists.busybox.net>; Thu, 30 May 2024 15:53:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xx_FyUGj21mX for <buildroot@lists.busybox.net>;
 Thu, 30 May 2024 15:53:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112c; helo=mail-yw1-x112c.google.com;
 envelope-from=jesseevg@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 44FC3610C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44FC3610C4
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 44FC3610C4
 for <buildroot@buildroot.org>; Thu, 30 May 2024 15:53:05 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-62a0849f5a8so10424137b3.2
 for <buildroot@buildroot.org>; Thu, 30 May 2024 08:53:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717084385; x=1717689185;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mVO+dhsDDM07l1jJchgbN7SiGsxjdhh3DI1qlhc9skY=;
 b=l1e5VOg51EKh1a3YF4LQYcvt+MZExhodS7frkY2xBFa3h2H6Ngtqka4UX0adJ5no+7
 bYqAjbs5esOnK85GV4y+oc6cP/JSJVDjqrT/93WXjvzVhHtTceBM7wHQV4LxTxKVi6X/
 VJcM9pde4WosDu0ufVkwQIzyRx3bjvy4b7Ol+DEyJ4Ti5kesc37e0iZXt/3PU2y8AF5p
 i5hKVWvacVbxjPjGiyCRxXS4Y5WhMupga832QntrxEmbxDNB4eT9J7X7AdDi+iFN0sYQ
 8izu5ZG+1Ow/8Hor7Kry913Gfa1wTFSYvcBGRF85W3XrihJIQsywcxaM3yIO+1Lj3cM2
 qraw==
X-Gm-Message-State: AOJu0Yxwyv4EAbV3shR70EpCoaAIEn2AeXA11fo4OUMZZcQ4EyRse5t0
 uJmhTHYvrXELO6pb3/U3huTTuileLfDHq2oJAq35yN6OSeA+I8AUcX3mmQrmOUFdFPzeyp4fOQK
 6ANdHrscHhHdAXaq0xduD6pBV/L57uw==
X-Google-Smtp-Source: AGHT+IEuv1timbuoCIuxmG7nRrEzn+j32nJyqw6CmUrmZwZivbMk5y3dR4SH76M/Qdi8EdCu3QIPyExTpMHKMGIenCU=
X-Received: by 2002:a0d:dc87:0:b0:61b:33b6:41dd with SMTP id
 00721157ae682-62c6bc7af2amr27631417b3.37.1717084384592; Thu, 30 May 2024
 08:53:04 -0700 (PDT)
MIME-Version: 1.0
From: Jesse Van Gavere <jesseevg@gmail.com>
Date: Thu, 30 May 2024 17:52:54 +0200
Message-ID: <CAMdwsN_aTq18DxJUJQKCdgZcjEmdP6cfC4ExS1=kEngRUouGsA@mail.gmail.com>
To: Buildroot Mailing List <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717084385; x=1717689185; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=mVO+dhsDDM07l1jJchgbN7SiGsxjdhh3DI1qlhc9skY=;
 b=J6RqaOa0wth6SK4Ku8Nxt/JDtcOjx341h+8XG6Cnt7ywKJwwzFPy1JxSIAfsh+cAA5
 mTWko0VdZxjNfN0nIiuZhXU1d8mHHjL9nTAl1G4sLiG2B6vA8E16RLvpcMA6zfATogyU
 p/EVTq/UvA8/kzbxTPd/VeYeeiIjDX6bqZE/fUzx5XOtQcPriYxarboFu7Vfm9TzIhWb
 qBmRsB73lL4xvsJGOwbsHMEtY7atr48uZZ752scbec9H1mo8ytDeOwMV85Fvr/tw7JBo
 tmqAcoU3fUNvhBiXYnSqeeT0AX20V1tbsjdkRNT3CqKJyJBQUdQZrCmHjW4ikW0QBuFD
 PYvw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=J6RqaOa0
Subject: [Buildroot] Buildroot LTS sponsoring initiative
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
Content-Type: multipart/mixed; boundary="===============3821721744618654438=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3821721744618654438==
Content-Type: multipart/alternative; boundary="000000000000cb0d970619addc35"

--000000000000cb0d970619addc35
Content-Type: text/plain; charset="UTF-8"

Hi,

I got a mail from Mind from one of their marketing managers which talked
about something called buildroot LTS sponsoring initiative, is this
endorsed by this community/the maintainers?

I had not seen any communication about this and wanted to know if it was
legit first and what the motivation behind this was, compared to possible
other alternatives.

Best regards,
Jesse

--000000000000cb0d970619addc35
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi,<div dir=3D"auto"><br></div><div dir=3D"auto">I got a =
mail from Mind from one of their marketing managers which talked about some=
thing called buildroot LTS sponsoring initiative, is this endorsed by this =
community/the maintainers?</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">I had not seen any communication about this and wanted to know if it was=
 legit first and what the motivation behind this was, compared to possible =
other alternatives.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Best=
 regards,</div><div dir=3D"auto">Jesse</div></div>

--000000000000cb0d970619addc35--

--===============3821721744618654438==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3821721744618654438==--
