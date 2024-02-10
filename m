Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A81C4829B
	for <buildroot@archiver.kernel.org>; Sat, 10 Feb 2024 00:04:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BE9F607F6;
	Sat, 10 Feb 2024 00:04:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6slHvXTCPOOu; Sat, 10 Feb 2024 00:04:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3084060839
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3084060839;
	Sat, 10 Feb 2024 00:04:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5FE191BF990
 for <buildroot@lists.busybox.net>; Sat, 10 Feb 2024 00:04:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D6AE84FEC
 for <buildroot@lists.busybox.net>; Sat, 10 Feb 2024 00:04:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wW3hrz6aCYwV for <buildroot@lists.busybox.net>;
 Sat, 10 Feb 2024 00:04:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3492484FE4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3492484FE4
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3492484FE4
 for <buildroot@buildroot.org>; Sat, 10 Feb 2024 00:04:02 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-557dcb0f870so2137263a12.2
 for <buildroot@buildroot.org>; Fri, 09 Feb 2024 16:04:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707523440; x=1708128240;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HQ1pq/Z2/H/BWNdlo94MtF31Jad+o4US00BHawbpizA=;
 b=UixssV0zxYkk2C/pzRU2lA/4Egys6hyj1gw9//tusGhGuO3nez8/6a1zwwwXEFieys
 rBWW93z9s35sy70pavtfHgf6IXKxbUwQDkJuYCJtf5Nf3exLG5mNjiqhaM8uVv1YFrAj
 xrDkPK8D70cSxi0g24Q6RvTJwd+qSUyiuYg4U65KNWUHn18tNmFLzTDwvU5sWCrBsjGf
 CQI/chgb7/VvitSSK9Wxfb7ux9B20aLVd8MzUCO2BrfuazJacTaCdhIMP7Ka2Mu1UGM7
 74U5vZovdEtWqviAM1/5QnO7+JGtP8sVj9Cpm7WHX+3JbFT3UPfdbtP5dtIgcemKGrE0
 US4Q==
X-Gm-Message-State: AOJu0YwF+/soybbUwjnIymMRQdGEAtZx+cua/hN4t6DllpzkRENGZxko
 oEnSJugBYE/lKqOERtvrmDlmINRpz5raeH0moxE3pzQAHeFOUX16roJTv0ZGOAY=
X-Google-Smtp-Source: AGHT+IGthGJJFiVDGTgGwaMDX8lhzB7eZSegA4XQEyYZ1lLYtPAH5jmt2ykApnKbXRY8Z6SzeMzs/A==
X-Received: by 2002:aa7:d7d4:0:b0:55f:e574:4ea6 with SMTP id
 e20-20020aa7d7d4000000b0055fe5744ea6mr324795eds.2.1707523439939; 
 Fri, 09 Feb 2024 16:03:59 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVtmWdMprQHALk0smJiirWJDj0hnnghnE2Z7L7OcG6q26rMUNaBK8jhAmWAcfwzbpWEzrYYqrVrI6Wq5DVZ8TKx47rbd7KhDaNQuQ==
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 bd28-20020a056402207c00b005613194b260sm224978edb.9.2024.02.09.16.03.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Feb 2024 16:03:59 -0800 (PST)
Date: Sat, 10 Feb 2024 01:03:57 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240210000357.GA381153@pevik>
References: <20240209203852.671387-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240209203852.671387-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707523440; x=1708128240; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HQ1pq/Z2/H/BWNdlo94MtF31Jad+o4US00BHawbpizA=;
 b=UCBEqo0VZrAvcj3Gwq53c9Ujksr+6L0ibUuEPaYMJJ07sh/Tu1F1YL0u5PzxqhlDyd
 Vu6gi8Nd43PAQCCHmmMhWxiTZkeCUYikuYTSNfLSQAqykOkP832wWTLU4dgayH1fLEx/
 ttFWLSKqTqRPzrW0je+JlpSQ6oYmaCZTMUHpVtkpa0GH8O60/b8Hid7jMM7dwYH85Gq2
 ZM2oy7EWnWHhGCOjdrt6XSR5LVjqt1nH+l37SA7Mo1I+5f2zW8WiaegE8JppPhj8GMJ2
 CYeFSRqwfZFY2GUXwgFRmsDa1mzJRsgq1a5Do/d8u8Z446BtCnV5ggGuYghTSLL3vcIU
 XC2Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UCBEqo0V
Subject: Re: [Buildroot] [PATCH 1/1] package/libqrtr-glib: fix static build
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fabrice,

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Thanks!

> Fix the following static build failure raised since bump to version
> 1.2.2 in commit b50bb982208011841fe0a9a7e4309808085cf493:

> [5/5] Linking target src/libqrtr-glib/libqrtr-glib.so.0.0.0
> FAILED: src/libqrtr-glib/libqrtr-glib.so.0.0.0

> Fixes:
>  - http://autobuild.buildroot.org/results/e0442e97279a07f33a14ec52840f98b7ec0fe32d

I would also add usual Fixes:, but Buildroot might not use it.

Fixes: b50bb98220 ("package/libqrtr-glib: bump version to 1.2.2")

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
