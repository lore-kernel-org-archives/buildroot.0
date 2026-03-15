Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96429F3027F
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 23:07:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EBF48223B;
	Sun, 15 Mar 2026 23:07:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ar8C6wdPNxpV; Sun, 15 Mar 2026 23:07:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6EE8821CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773616070;
	bh=ymiEX8Uwtj8fBcUwe/tdFRjSP8yFQylJZo+TZSB37lQ=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=e/o5s+DkJSd6p08nx+spgy8OoSXvyskV0+su1KcFzcyFa4TodCftwy+y7u8Ot86kA
	 J7g/BxmjS3cRRl49Io3jtmjZ1Pl9uwqagW2bZHJ6Q7PK7gutWqeB07KOhe15sfv4hS
	 wcS1KAwzAF6A3dpwUPJ0ZxM5qdXzVM5EI3IjaBRIhyNDjdH/gvjA4O/PifhiqL53Wz
	 x7UFDrl7gvtyiSUVrx5CbldnuPgxAl9re43nRAeWXZpGKh1ZhR4tCxshaMZCEGz0H9
	 U5K7EVUNVANY24wTex8wdli93VPMQwSZw4m7TPI9KOdTzXeJoU3hbadsGowxpKdx5l
	 0PJ1BupaMm+bg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6EE8821CF;
	Sun, 15 Mar 2026 23:07:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C1141B2
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 23:07:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51E9161145
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 23:07:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aMysLZ7Nk1Hx for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 23:07:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 45D8061088
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45D8061088
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 45D8061088
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 23:07:48 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-43b3cfc38edso1227293f8f.3
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 16:07:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773616066; x=1774220866;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=N5AoZ6QymSZ5yKiUrJmg42l8uoscQoeMRGYr5j47nzE=;
 b=jIAr6OO7696zDnXXY07PV9IseutWUh3Nz5zvxqJAR6TxathZnz7I3Dc+kr62/0fvUi
 MsMXN6iPqn/vFUPLv1pm0iglR9f5QdFQ44fOqb2MCQJxDzy0iorZzePZ+UEFK+jHUJ2H
 fCYH9BndDA/me1YRKrOk7/2RYOSch6VFR/81VFWnLnY5logXR5DMYQELMw5LDnBAgYtW
 pwJVxzsCvnuZzaY/y47sJaMSyH2NMVn6+E4d4ZHTf2MyZECVko8UYNUawqv2pWhH7dD4
 3+XKi8CQbve+EzseCXwAZKgg7LhL80YBCAf6MPr7bGzaf4T9xsaawTUJuZ//q1wcJVDA
 vglw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGnP9YHUinoIsI/13Ikn1svFXf+Z+tb6yjlHFBtl4+sMoX7pE9n+u4WJclQtgr45QtvFpJD3NFO/Y=@buildroot.org
X-Gm-Message-State: AOJu0YzlT0rCeKQEiL8hYIKmGlNqT15xBZ5YdvGaoAvIYneh1VnH/sZa
 hH+XGWmgFgA72J+66qu7HRgIfEIWfhwnlNu4ayku56b4EqV+FCT3Kqv9
X-Gm-Gg: ATEYQzysLWE5Cu5CT24RaJ9b/a9A+gbpgTt5IGZZkjBq2ju9s3pn+v5r0df3/c6fdh6
 SmYhfooFf+2XFjDLAn2Q6mn7NMuxFhZ9b/Jno4OdmeeNpXAqKVnVa07f0xWePMSTUtlpHcF5mhg
 YYQ+ZnX6W4+Fy6afoBed0QnsuXqCuBDEtjyZdE1TZWGbaF2QUpdlSTC2mL4PanmsG1+FHWU2iEZ
 23LkffZL4lIbew+nUe90LtzatAjIMwrPKXIyITM2B7OkzRER40Zq0qVfe2wnaCVDhkBd448jbTl
 9HWuXlM3xaVNrBQQRFf0hMqjS1ka7V7N5Sg2gLRjqLd7hsN9+5fQXvOVXTAMX+BBkbySTYVOTnh
 xt+j28laJ1ERZCeDrCEOFgGUTWO7JfaA+PzM/EDUyODWCLIjcQz/ioFTVahG0qTQK4LJKoFmlBb
 dCC2OvH3UEPm+P8Em/JjtpBzCEe8thsJbykOgAd8/j535LVFDBmBprBMkOoqMI
X-Received: by 2002:a05:6000:1acd:b0:439:ddc0:4bf1 with SMTP id
 ffacd0b85a97d-43a04dcbf4cmr19871318f8f.55.1773616065646; 
 Sun, 15 Mar 2026 16:07:45 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b3e9a4fcdsm9470202f8f.8.2026.03.15.16.07.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Mar 2026 16:07:45 -0700 (PDT)
Date: Mon, 16 Mar 2026 00:07:43 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Message-ID: <20260315230743.GB267706@pevik>
References: <20260313211015.4152659-1-giulio.benetti@benettiengineering.com>
 <06e35fabddb8f84102a922b63710ea3d@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <06e35fabddb8f84102a922b63710ea3d@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773616066; x=1774220866; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N5AoZ6QymSZ5yKiUrJmg42l8uoscQoeMRGYr5j47nzE=;
 b=P2P0Vy3NsV6cC4ON3HUIPDymZ+r0fDXIHtuVlKrnS528SOyVJXRs3cgWg5eOq4Thxz
 QjJlushy3KfqzuqHwUiwaeT1QbWxA5rCNX1jlMGtR6ZYhAf3mUQVCXJv4zqZgCgD5zBf
 k6keq2GjjkcD79hISAhnOr3/hPK4/4EDAl8IetHt5g182iyFk6oLI4YMO+eEc2PPlunM
 3OuEbgbwo6VqFUR7nznBC4ZTYSPGjgKkv7YvTq2oD0yNkgen6z/I5I5h12OU1axLn1la
 lWI3hGJ0bZZ56qCZTplQrk9sOucwpMV3DvFtv5fE3rKj92nVSy/N1/z7fSconPjumB1E
 UtDw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=P2P0Vy3N
Subject: Re: [Buildroot] [PATCH] package/nfs-utils: security bump version to
 2.8.7
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Julien,

> Hi Giulio,

> On 13/03/2026 22:10, Giulio Benetti wrote:
> > Release announce:
> > https://lore.kernel.org/linux-nfs/4d11b9d7-7b49-4a1e-8c26-29ecb2fefe2f@redhat.com/

> The commit title says it is a "security" bump. I can't find any reference to
> security
> fixes in the release note. Could you provide details?

> Or is it a copy paste error from the previous bump?
> https://gitlab.com/buildroot.org/buildroot/-/commit/7dfd2feb445c2cf83a2b52057fab96e72e42a071

> In the later case, no need to send a v2, I'll just remove "security" while
> applying.

I'd also say it's just a copy paste from 2.8.6. 2.8.7 seems to me only a bugfix
release.

Kind regards,
Petr

> > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

> Best regards,

> Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
