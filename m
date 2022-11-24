Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04924C4332F
	for <buildroot@archiver.kernel.org>; Thu, 24 Nov 2022 06:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57F8640C8F;
	Thu, 24 Nov 2022 06:49:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57F8640C8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fK0vo5okQRys; Thu, 24 Nov 2022 06:49:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7FDF540C88;
	Thu, 24 Nov 2022 06:49:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7FDF540C88
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2E4861BF842
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 06:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04BB7417BF
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 06:49:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04BB7417BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AZNDBcekuS1c for <buildroot@lists.busybox.net>;
 Thu, 24 Nov 2022 06:49:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BDAD417B6
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2BDAD417B6
 for <buildroot@buildroot.org>; Thu, 24 Nov 2022 06:49:45 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id 140so846745pfz.6
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 22:49:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sQVywi0sKjfZ+serYf/5q+bMELFbu3NNm+F1cTEtcmk=;
 b=RsGXnVngMSzo2UBQd7hbkJEO9niX6X3nAxRfhUIKm/Tjpzh5GWYrXeSkQi5SAdm/wV
 iHlUt07d7JvZp8o1GeyJJde1TbFPlNrdHPyVS2rG5T+4XVKtNS95MJhKp1qj/T76Su4w
 YNAIfC2+P0Thvjt0uKxEBQSDylEZg6SNyrZAG88ah/cChzagO3jyOpYlrd2v2b1r6aZO
 DDvD2yv9qFVJGb5kvOlk51u2FONRidLAb8LVO+fjwymgg+qnTGcFgZMp1HcNLqoxHIjb
 fJvynfVrB/hBnfsKacl6XI886U4RaF7sSxaYQJJEnDBeIrL9EbZP8GALX1bJYPYDhuKH
 kfFA==
X-Gm-Message-State: ANoB5pmGMMxu258P211gnGHo731xrGknI/STjm/pcc/PBAdevoyRs9NP
 9NP4LhyEMwkDVwetvF4P/SYXLPG60IgqT0tRJbnWciLqdPI=
X-Google-Smtp-Source: AA0mqf4EBjz4Jq4a+RT2Mrb60juRiQewGpi/H7e5tiYU9J1NFdRMH1TzArSyLlWltM3vplfm3LMbrlkXFJXdTOC+jc8=
X-Received: by 2002:a63:d143:0:b0:476:c8c5:ba85 with SMTP id
 c3-20020a63d143000000b00476c8c5ba85mr28285668pgj.182.1669272584229; Wed, 23
 Nov 2022 22:49:44 -0800 (PST)
MIME-Version: 1.0
From: Charles Lohr <lohr85@gmail.com>
Date: Thu, 24 Nov 2022 01:49:33 -0500
Message-ID: <CAGu26P9vNEBQiekPKn+x5F9MJVBeF1Y+YJOng3fzuxMTnwBuqQ@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=sQVywi0sKjfZ+serYf/5q+bMELFbu3NNm+F1cTEtcmk=;
 b=DdksUdYXiaKKr+Qc5tE9NjaS051qR+8JInKoFhIMTT00GVeDDiXiYivfjGEDRh6FxU
 qnIE4PaWSBkmyTpJzpzkoqGlg3egQlbQfJC/aCCqDh2K2Zxtd8ZuKdapz+Zrf6VX6Rgf
 268sixZcMr7TIetz+Pqx2gQCEojBWo/r1OaPiVkFjZ39rYG9iKsqx2bqieqF/sJQ2k6t
 rOm20OQLtFHoAOmEFU5hhOblFTV0H7uxOC2N/5NZzK6AG4ZkHcF5aLPZA2HVYZj+HE33
 /gvzE57It/Wzjj/xbchPNb1GdAUtxuY3NveE78UFVdzCjrfRS0+7wunOUXI/M+vN7DxR
 kOXA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=DdksUdYX
Subject: [Buildroot] CPIO Kernel Image Build Order for initramfs
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
Content-Type: multipart/mixed; boundary="===============0290805802793675284=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0290805802793675284==
Content-Type: multipart/alternative; boundary="0000000000006a99f805ee31cf6e"

--0000000000006a99f805ee31cf6e
Content-Type: text/plain; charset="UTF-8"

(Forgive me if this list isn't for questions, please direct me to the right
place. This is my first message to the list)

I want to build full executable images, with the rootfs built into the
kernel without compression, so I'm using CPIO.  But, buildroot doesn't seem
to like this when starting from a clean slate.

It wants to build the kernel before the image, but if I do that, I get this
error.

make[4]: *** No rule to make target '../../images/rootfs.cpio', needed by
'usr/initramfs_inc_data'.  Stop.

Right now, my process is: touch an empty images/rootfs.cpio file, compile,
touch the kernel config, recompile and this works but it's yucky.

What is the "right" answer?

Charles

--0000000000006a99f805ee31cf6e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>(Forgive me if this list isn&#39;t for questions, ple=
ase direct me to the right place. This is my first message to the list)</di=
v><div><br></div><div>I want to build full executable images, with the root=
fs built into the kernel without compression, so I&#39;m using CPIO.=C2=A0 =
But, buildroot doesn&#39;t seem to like this when starting from a clean sla=
te.</div><div><br></div><div>It wants to build the kernel before the image,=
 but if I do that, I get this error. <br></div><div><br></div><div>make[4]:=
 *** No rule to make target &#39;../../images/rootfs.cpio&#39;, needed by &=
#39;usr/initramfs_inc_data&#39;.=C2=A0 Stop.</div><div><br></div><div>Right=
 now, my process is: touch an empty images/rootfs.cpio file, compile, touch=
 the kernel config, recompile and this works but it&#39;s yucky.</div><div>=
<br></div><div>What is the &quot;right&quot; answer?</div><div><br></div><d=
iv>Charles<br></div></div>

--0000000000006a99f805ee31cf6e--

--===============0290805802793675284==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0290805802793675284==--
