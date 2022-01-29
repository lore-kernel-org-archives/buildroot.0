Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B2A6C433EF
	for <buildroot@archiver.kernel.org>; Sat, 29 Jan 2022 11:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E37E460AE2;
	Sat, 29 Jan 2022 11:04:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FdSDdBP74PCB; Sat, 29 Jan 2022 11:04:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8901860EB7;
	Sat, 29 Jan 2022 11:04:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EEFC11BF82F
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 11:04:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7C228272A
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 11:04:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6B-b-SXjevZa for <buildroot@lists.busybox.net>;
 Sat, 29 Jan 2022 11:04:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD8DF82690
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 11:04:02 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id s13so25236261ejy.3
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 03:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T+BAdkYgXWK91v36xkcxdDE6t5OBQQhrc2e/585KZzU=;
 b=HNfUFULjQPyjyrZpAauBq3epCmW2J1KGRzYvqiomadrLLCTjzExp/McATWkL/f8MtC
 lZJsMg0TtRlh3Bclpn+U/hr1iqW8s+8Uw6LpiEqj5iLDIIASwAVk4HKJHG366TCUg1E+
 D0tMxcSzn1+TKcCrpUNUJIxBDZspp/NchqEdl5MSO5Z3Hh+khtvKQoNgRxFZtRm8s3/Y
 WwhAhPwlvMGsCI90j8RXDdxbnFwj2TZNxSeDjMgHbSOUg7b1Dr7ZHtZ3uRH6XhgK+WkB
 dPCQSXxwf//5D2kn1U5CL0XniPQSSSC96whQ8ZuL1aTkvA9cv5yyEYHcrXw9w+wRvv95
 skzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T+BAdkYgXWK91v36xkcxdDE6t5OBQQhrc2e/585KZzU=;
 b=VynbzogoIP07riCI3qDjcyV7HmzMpEbkmxQeYpN4lagk0iiwM3XNBlo+5mzxqiC0J/
 rl/Pxp0nSAnmV1DNy3juQBK5DAiUmnnHNgviQtBq3avA+6BeAysVtPHKQD1qFiAD8B+x
 uOkhCEOpDJKF4kublMsk2Y/uESFruhd52zzhQDM4m8J8WIjYU7YZaQLitr/Gn00FrmgU
 PAVufBgZEvHBVRzjrhnSv7FAAuEFx9nhECY2V1abRdU60QMXdegOuOk01hbVAxYALsEf
 IXoKHYN9HWYp2hZjFoBuKpftCdcvBwfCg6l02uQvfSLk1BwWFJa0ZDSPbarf5ffzBOdF
 4RWw==
X-Gm-Message-State: AOAM532gQ/HAj2rI0M8IXePoUZGRTeCc9vtR0jzS/rQxTukC0rEG2J0n
 2SLPKSuqWXwUUUMRI2o4AI0wXLRT+J2QgIlkwwk=
X-Google-Smtp-Source: ABdhPJxLdl21LSxRcX89wWhO9fwpU5Tc2q0bXl8KcP3/0a/7N+i+i9Tl0BYgfalVxBjYQ0i1aebdllZC+W6QiWN9Km4=
X-Received: by 2002:a17:907:97cd:: with SMTP id
 js13mr10252318ejc.41.1643454240501; 
 Sat, 29 Jan 2022 03:04:00 -0800 (PST)
MIME-Version: 1.0
References: <61f4e7d9.1c69fb81.722e5.a0feSMTPIN_ADDED_MISSING@mx.google.com>
In-Reply-To: <61f4e7d9.1c69fb81.722e5.a0feSMTPIN_ADDED_MISSING@mx.google.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Sat, 29 Jan 2022 12:03:49 +0100
Message-ID: <CAJiuCcdc+LQBf_8svYXYA-8U3Vv3riC4_e72F=JyD95qFEFRAA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/mixed; boundary="00000000000036000605d6b68269"
Subject: Re: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2022-01-28
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
Cc: buildroot@buildroot.org
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--00000000000036000605d6b68269
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Thomas,

On Sat, 29 Jan 2022 at 08:08, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> Gitlab CI failures
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> Below is a list of Gitlab CI job failures in relation to defconfigs or
> runtime tests you are in charge of. Please help us improving the quality
> of Buildroot by investigating those build failures and sending patches
> to fix them.
>
> Results for 'master'
> --------------------
>
> Build failures related to your defconfigs:
>
>                         defconfig |                        link to the jo=
b
> ----------------------------------+--------------------------------------=
------------------------
>                       beelink_gs1 | https://gitlab.com/buildroot.org/buil=
droot/-/jobs/2021478208
>
>
>
> Thanks for your contribution to Buildroot!


Not related to the content of the email but it seems that since June
2020 the mail format has changed.

Before I received email with the To recipient defined like this:

To: "Cl=C3=A9ment P=C3=A9ron" <peron.clem@gmail.com>

Now it has been changed to:

To: "Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>"

I use GMail as a mail client and the To is no longer properly parsed.

See attached original mail and picture attached (If attachment are allowed)
Thanks,
Clement

>
>
> --
> http://autobuild.buildroot.net

--00000000000036000605d6b68269
Content-Type: message/rfc822; 
	name="[autobuild.buildroot.net] Your daily results for 2022-01-28.eml"
Content-Disposition: attachment; 
	filename="[autobuild.buildroot.net] Your daily results for 2022-01-28.eml"
Content-ID: <f_kyzq492q0>
X-Attachment-Id: f_kyzq492q0

Delivered-To: peron.clem@gmail.com
Received: by 2002:a17:906:5447:b0:6b4:38b9:8ace with SMTP id d7csp646396ejp;
        Fri, 28 Jan 2022 23:08:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy7X0UhYTOoezK1mZgH61b0yNYjl/M6IMc1UG24c7cZ8U7shZNZVKQnDZw9zjQRhOjH+0I3
X-Received: by 2002:a05:6000:1549:: with SMTP id 9mr9665233wry.210.1643440089667;
        Fri, 28 Jan 2022 23:08:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643440089; cv=none;
        d=google.com; s=arc-20160816;
        b=zvICTtRsxpmCN2ApewlCjaTwqAbYYyNbDXvNa00pJNa3+BzBJOPvXsbZiOF94DLvm2
         98UDviZpFtCgzl8zGoUpnA5EXxZhABPKteDOo1bA8TBspA/pQmBKr9ms4JBSEL3G552m
         ez54BixjrgbJREvO+BJdoUddU74KnBevoI29NoLvBZfhd6dPXMaVcjpUFuXc5MEqpMkM
         NWuhsH/ajnk73oWRT0CMgmQSAwtZPT2aMhXzxlMNyXU5EqjxlUHUhf4I2tot9ohgJnuz
         D/snNRgwcBRlWBBI1GXgN4CQi5HJZNdu/NMqt5hfn1a7HnsdapYEOSHq+nQDpNRL7oVg
         cykA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=date:from:to:subject:content-transfer-encoding:mime-version
         :dkim-signature:message-id;
        bh=0nAcUhFSZZjECpILzw2/0t2LbL8p35CDhVDBR+1ZrWo=;
        b=llMt80kLCHRYy7F7UpAWcxJzswBYinIuk+sA0g7+XxDwdfAMHBGykiZd64iwjRD6Sp
         BxbYUHltlGoumVMfbORKcuFSb6ivNDY7aZHoX8D+linhhgPlgV6SuGZNzeRcfeySv6/H
         M64vGriVnihmx6jVzxiccmnXD47dAHg2Id6IyYTMgvjylkREmh2X1QvQEFdh4mI83auy
         pw2ioxcXzXz0zH+eHBiwkYq/YDmqImVtuDzLJmMb9ONy/2Q85Kh0Zd8wwl/JyQVGA1o7
         OA07e3j+NH/xFF1H+NHcH8flioK8cJXpvudfvPGFfQWnqE97Ih77idIBqHCHpgr/ptaK
         vQTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YJWycY2y;
       spf=pass (google.com: domain of thomas.petazzoni@bootlin.com designates 2001:4b98:dc4:8::230 as permitted sender) smtp.mailfrom=thomas.petazzoni@bootlin.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=bootlin.com
Return-Path: <thomas.petazzoni@bootlin.com>
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net. [2001:4b98:dc4:8::230])
        by mx.google.com with ESMTPS id h9si2894389wmb.208.2022.01.28.23.08.09
        for <peron.clem@gmail.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jan 2022 23:08:09 -0800 (PST)
Received-SPF: pass (google.com: domain of thomas.petazzoni@bootlin.com designates 2001:4b98:dc4:8::230 as permitted sender) client-ip=2001:4b98:dc4:8::230;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YJWycY2y;
       spf=pass (google.com: domain of thomas.petazzoni@bootlin.com designates 2001:4b98:dc4:8::230 as permitted sender) smtp.mailfrom=thomas.petazzoni@bootlin.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=bootlin.com
Message-ID: <61f4e7d9.1c69fb81.722e5.a0feSMTPIN_ADDED_MISSING@mx.google.com>
Received: (Authenticated sender: bot@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4848C240002
	for <peron.clem@gmail.com>; Sat, 29 Jan 2022 07:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1643440089; h=from:from:reply-to:subject:subject:date:date:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0nAcUhFSZZjECpILzw2/0t2LbL8p35CDhVDBR+1ZrWo=;
	b=YJWycY2ywLMoOsYtfvlzowsLxpFQGMEnRBMi/yTMkx+HLLxf5dt7vodauKD5zt9xXoTHzn
	fhch/OfFfHbzsVL6LUoFpPmanJZ3hNLCjBwTGo9kD6MdHLF+gangw3187gAulxOo1KcvI8
	vEHHHX+dz9kJi101a86Wq6jtCTlx9HJxpHS2wwG0dAcSlOfPXQ1I4YAZGQPa+tbyISxhOu
	WgZSEanQe11uauo5f3GKniHY1H1fouGhg5FUTeyStAxYc/QbGPyNppizotYZ6YvhJpHCPs
	3wvcW7dJx7ndSCYvAjZgEtZkI7EVkx/cn7jlwNQJQIyzpc2yz5OuFyicA5lUKQ==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [autobuild.buildroot.net] Your daily results for 2022-01-28
To: =?utf-8?b?Q2zDqW1lbnQgUMOpcm9uIDxwZXJvbi5jbGVtQGdtYWlsLmNvbT4=?=
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Jan 2022 07:08:09 -0000
X-Spam-Flag: yes
X-Spam-Level: ******
X-GND-Spam-Score: 100
X-GND-Status: SPAM

Hello,

Gitlab CI failures
==================

Below is a list of Gitlab CI job failures in relation to defconfigs or
runtime tests you are in charge of. Please help us improving the quality
of Buildroot by investigating those build failures and sending patches
to fix them.

Results for 'master'
--------------------

Build failures related to your defconfigs:

                        defconfig |                        link to the job                       
----------------------------------+--------------------------------------------------------------
                      beelink_gs1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478208 



Thanks for your contribution to Buildroot!

-- 
http://autobuild.buildroot.net

--00000000000036000605d6b68269
Content-Type: image/png; name="mail_parsed_issue.png"
Content-Disposition: attachment; filename="mail_parsed_issue.png"
Content-Transfer-Encoding: base64
Content-ID: <f_kyzq5sz01>
X-Attachment-Id: f_kyzq5sz01

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
9nMPvgC3zNa85QTP0QAAAABJRU5ErkJggg==
--00000000000036000605d6b68269
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--00000000000036000605d6b68269--
