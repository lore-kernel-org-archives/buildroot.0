Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E9CEC433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 04:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A209884910;
	Sat, 12 Mar 2022 04:56:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vHGYIC8SCSMO; Sat, 12 Mar 2022 04:56:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A63DD8484B;
	Sat, 12 Mar 2022 04:56:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4A5C31BF2BC
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 04:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4725341A45
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 04:56:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=paral.in
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gtXmSNoo9h_g for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 04:56:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A731D41A44
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 04:56:06 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id 189so11615941vsi.7
 for <buildroot@buildroot.org>; Fri, 11 Mar 2022 20:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paral.in; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=X8UpEL3Ym1KboX6t+7vJzZezC8eokf8sdLa+9+WWEPc=;
 b=Ow84qFHSTUzynsN58s3Pga1LoFxEopTtpuqwljrSTr0cBlINg0GDCDhosC23HLXdxj
 k+1wJpCbt5zgbYOsbhm6UdPS9n32HRTO1m2EMguZqPmQpXiL/ppHoo9kh7RDXL+12B8i
 vNb2ZrfqBpFWXLtNcLIWHdfAPCqz0rlnOKb+5Dj2XmZtgJIRLzgvTxS/yBqfBR/BdSuM
 KRrV7odTdYcp3feqzld06AAMLq6/kWx4WqftY8wpf4AD3KAnPdxwmg3Jd+2nbCbJrrP9
 ErSJ8pCdNFssafjaz40jSHbGut3BudCpKR2siqBjHjNHczfkpc7njUJ7RTarpS0RAlzo
 psvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=X8UpEL3Ym1KboX6t+7vJzZezC8eokf8sdLa+9+WWEPc=;
 b=qO0FL9L2ieoCErQQaua2NJ0TMrpvnOBsNd2M7mVmmvPpFt5ppYKSs9iNLEn+bzyrJt
 vr7PB68ROTVNNjFMGxLAy+K1XHRJ6lKhWF2tCH6WUES6feldqJ8Il3ianII6dDJW4hHl
 iA/ZyHt/0kKcYBgeHEEpFYjJ8t09CjwGj1AtFV766Wej8vXYvnqytRwNm5bKG/RFAcq2
 nCgYSDClZWBLphmsWUTIrpf+/G+8duUOPwzeOev1VUZnvgkMpKKZJ1B+F1P6EKUWdm27
 IOrirkDVcx86lzIrAjIlzZ/shSLIBSoDKr3R/aFiC6Au9z829bJtWfgtqC9CSdr7+Q91
 sXdg==
X-Gm-Message-State: AOAM531mZa4E2RP5eUb/NheRU8rVZxcqKYQqqgvr9NK65PGppqc0+MPr
 lZLbCoY1G7/NNN6OO9GXMAfd9J2wzgLPAA==
X-Google-Smtp-Source: ABdhPJxku6MIx1BMhTKfrx0punaGUwvsEKPvtrRbP6pSh4kpIavFevxN+gOUEDCNml0sSeesifc1Zg==
X-Received: by 2002:a05:6102:3049:b0:320:b4d8:d3f2 with SMTP id
 w9-20020a056102304900b00320b4d8d3f2mr5746154vsa.78.1647060964812; 
 Fri, 11 Mar 2022 20:56:04 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com.
 [209.85.217.52]) by smtp.gmail.com with ESMTPSA id
 s9-20020a1ff409000000b0033778b206c9sm1924832vkh.45.2022.03.11.20.56.04
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Mar 2022 20:56:04 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id y4so11604981vsd.11
 for <buildroot@buildroot.org>; Fri, 11 Mar 2022 20:56:04 -0800 (PST)
X-Received: by 2002:a05:6102:2845:b0:320:7fc9:dbdc with SMTP id
 az5-20020a056102284500b003207fc9dbdcmr6489715vsb.20.1647060963717; Fri, 11
 Mar 2022 20:56:03 -0800 (PST)
MIME-Version: 1.0
Date: Fri, 11 Mar 2022 20:55:52 -0800
X-Gmail-Original-Message-ID: <CA+h8R2rU1EhsLTx38qHG0Q5BrNjBDi43D6rw+Rq3KA7dQAremg@mail.gmail.com>
Message-ID: <CA+h8R2rU1EhsLTx38qHG0Q5BrNjBDi43D6rw+Rq3KA7dQAremg@mail.gmail.com>
To: Buildroot Mailing List <buildroot@buildroot.org>
Subject: [Buildroot] sshd: fails with seccomp issue on arm
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

Running sshd on an odroid xu4 (armv7) w/ Buildroot 2022.02:

connections fail with seccomp errors:

SECCOMP auid=4294967295 uid=103 gid=105 ses=4294967295 pid=1041
comm="sshd" exe="/usr/sbin/sshd" sig=31 arch=40000028 syscall=414
compat=0 ip=0xb6bf41b0 code=0x0

I found this relevant issue & patch added to gentoo to fix this:

https://www.mail-archive.com/debian-bugs-dist@lists.debian.org/msg1844602.html

https://gitweb.gentoo.org/repo/gentoo.git/commit/?id=9cbbc55aee6b2534bbc8d8fe12128c1083ee6850

Shall we include this patch in Buildroot as well?

https://github.com/gentoo/gentoo/blob/9cbbc55/net-misc/openssh/files/openssh-8.9_p1-allow-ppoll_time64.patch

I also ran into a build error with fzero-call-regs, there is a patch
to fix that too:

https://github.com/gentoo/gentoo/blob/9cbbc55/net-misc/openssh/files/openssh-8.9_p1-fzero-call-used-regs.patch

Thanks & best,
Christian Stewart
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
