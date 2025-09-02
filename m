Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60681CA1005
	for <buildroot@archiver.kernel.org>; Tue,  2 Sep 2025 11:41:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9D9640B5E;
	Tue,  2 Sep 2025 11:41:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y8sZngH496cF; Tue,  2 Sep 2025 11:41:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D97DF40A83
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D97DF40A83;
	Tue,  2 Sep 2025 11:41:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 93F8A10E
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 11:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85E4C83BD4
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 11:41:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ikgFVKQSU70J for <buildroot@buildroot.org>;
 Tue,  2 Sep 2025 11:41:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CF84D83BCC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF84D83BCC
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CF84D83BCC
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 11:41:49 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-45b9814efbcso4710565e9.0
 for <buildroot@buildroot.org>; Tue, 02 Sep 2025 04:41:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756813308; x=1757418108;
 h=in-reply-to:from:content-language:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=I4uwRhQNrrgRB9O+4GkpxjLHQHQW6FFxE4W+gSMy0+Q=;
 b=bw+4pKhHN4/YTTxdWzEboMeeU1mZq10lMVB3mjL5IDLeCWSwcGdnJF/5PTg5O5mJPZ
 K9TkgxWTpzrIO2Y+YcxDxMFw5bs9OwwwM+7Gq5yea5pLt92pxYwQCZdQ/XifNYLKlE4V
 Ht9G0ct0aZSUxxTTsLCszlMjgsjRnte8W8YKnheayQInOY59+uxSSFl1NKT3o95MyXK2
 I1BG6PBybX8hXizCTHncipGjav+DyOG2E9cySIME/gPAA7U4X1uZ1QWFDEMgyH70woag
 noyhLxZDPxEYxbi6LGGgwox+TPi+4/Nhn/mWH/RX7VgNkKt28jK4JHQk6T/D2hS4D/sq
 6/8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgx8ht7yvKp9aLcwk/XdTrBdqWXIETtZIzzhCpD6kNWlIHzwEiEAULbRmxILV2HCyJ2w+tJZtIzp8=@buildroot.org
X-Gm-Message-State: AOJu0YzJSfs0G7uznxbuDTJwhp6/BlOdP2wD1obDQpWttXCTAzJpt5wW
 Le6n8cO9tst1nhArBPwjAVlA5kPqdt+5qvRrao4/e+t7HS3JZgObMZumuYpSvEhwqew=
X-Gm-Gg: ASbGncsbLE4qdBRbmhrPH6S93/ycKag/GwqptFiplxaV1OdpMoHlFITXHD/thLKT5B3
 MB9CDGuFXJz1AHNdTPJWxNvGlsfpT69FImXz4rxKx6XCZXt6Cn4FMsFmOIlPhB3IDD+++9qwTFf
 hQKSU82sVSt2hOyG1BCw0uqeASxpjMNLTjzpn9vL0bamo/zGUN5MfhtW+tXkUHL+//jnD4ned7a
 JutAWrSEFa60jjdEXhIKo7a4IjboERx49RhtZiUFQcMzhCVMuW9Z0jvYI0W4KbNqY1XAkBs86P1
 y9RQVdHse7POa+QidXmloQCxJEOVL3PP++NMeWlndM6fd/rlLXZNn2bBFibzoitvGV9TPlM7/0H
 rQs3ARg8+zm+VirlBKFBOjQQQRWoYXV3FU7nn/lIRtujgPInk3fsQX+5bqjrE+ronqpwPvAbVdm
 g6eRATGAgdE+eX/RqHrVq51wE=
X-Google-Smtp-Source: AGHT+IEYlWEwwDHSDt1X+Q8abZdgs/U0YIYehMiRsSI/TQediKigDggz7usdhJg3ImcVCe5cIOrKFA==
X-Received: by 2002:a05:6000:1447:b0:3da:6fd3:bc56 with SMTP id
 ffacd0b85a97d-3da6fd3c202mr1338681f8f.4.1756813307605; 
 Tue, 02 Sep 2025 04:41:47 -0700 (PDT)
Received: from [10.5.90.83]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3da9a6470f4sm2248027f8f.36.2025.09.02.04.41.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 04:41:47 -0700 (PDT)
Message-ID: <4e6e5e34-a0ff-4d89-9d79-56d1c756425e@smile.fr>
Date: Tue, 2 Sep 2025 13:41:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Pierret <david.pierret@smile.fr>
Cc: Romain Naour <romain.naour@smile.fr>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <20250829234459.01a60586@windsurf>
Content-Language: en-US
In-Reply-To: <20250829234459.01a60586@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1756813308; x=1757418108; darn=buildroot.org;
 h=in-reply-to:from:content-language:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I4uwRhQNrrgRB9O+4GkpxjLHQHQW6FFxE4W+gSMy0+Q=;
 b=a8KbVgWshj8hVwcVXTJUaSFGnbQLxKa5mg6hUn7NnkgUo8hkJM9OvLty4/MdKDsaxp
 SYIvtoZYkwLx/FXePSPKqe2G9PwqMR2ZiAZvvj43NBLIHGP8l0lInxtYfOEkFbnOy3je
 7yW6O8mSzYw7OFOWcCLtrTtQcB2mn0m4MnvTw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=a8KbVgWs
Subject: Re: [Buildroot] Fixing the Buildroot 'bat' package
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
From: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Reply-To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Content-Type: multipart/mixed; boundary="===============8625712249557033392=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============8625712249557033392==
Content-Type: multipart/alternative;
 boundary="------------v8tZDPqB9ktx5Y4eIxej9vcy"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------v8tZDPqB9ktx5Y4eIxej9vcy
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Thomas,

Le 29/08/2025 à 23:44, Thomas Petazzoni via buildroot a écrit :
> Hello David,
>
> You are listed as the maintainer of the 'bat' package in Buildroot. It
> turns out that this package no longer builds with GCC 15.x, and you
> probably are receiving on a regular basis e-mails telling you that
> there are build failures.
>
> See:
>
>    https://autobuild.buildroot.net/?reason=bat-%
>
> Basically, when building bat, it uses the 'onig' crate in version
> 6.4.0, which itself contains the oniguruma regex library implemented in
> C. However, this version does not build with GCC 15. My understanding
> is that the onig crate has been updated to fix this issue, but bat has
> not been updated to use a recent enough version of onig that fixes the
> issue.
>
This problem sounds familiar to me. Thanks for the report!

> Could you have a look at solving this issue?
I'll have a look at it and try to fix in the next few days.
>
> Thanks a lot!
>
> Thomas

Best regards,

Mehdi

--------------v8tZDPqB9ktx5Y4eIxej9vcy
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hello Thomas,<br>
    </p>
    <div class="moz-cite-prefix">Le 29/08/2025 à 23:44, Thomas Petazzoni
      via buildroot a écrit :<br>
    </div>
    <blockquote type="cite" cite="mid:20250829234459.01a60586@windsurf">
      <pre wrap="" class="moz-quote-pre">Hello David,

You are listed as the maintainer of the 'bat' package in Buildroot. It
turns out that this package no longer builds with GCC 15.x, and you
probably are receiving on a regular basis e-mails telling you that
there are build failures.

See:

  <a class="moz-txt-link-freetext" href="https://autobuild.buildroot.net/?reason=bat-%">https://autobuild.buildroot.net/?reason=bat-%</a>

Basically, when building bat, it uses the 'onig' crate in version
6.4.0, which itself contains the oniguruma regex library implemented in
C. However, this version does not build with GCC 15. My understanding
is that the onig crate has been updated to fix this issue, but bat has
not been updated to use a recent enough version of onig that fixes the
issue.

</pre>
    </blockquote>
    <div _ngcontent-ng-c3352479451=""
class="markdown markdown-main-panel stronger enable-updated-hr-color"
style="--animation-duration: 400ms; --fade-animation-function: linear; font-family: Google Sans Text, sans-serif !important; line-height: 1.15 !important; margin-top: 0px !important;"
      id="model-response-message-contentr_0f36e6074dfd084f" dir="ltr">
      <p
style="font-family: Google Sans Text, sans-serif !important; line-height: 1.15 !important; margin-top: 0px !important;">This
        problem sounds familiar to me. Thanks for the report!</p>
    </div>
    <blockquote type="cite" cite="mid:20250829234459.01a60586@windsurf">
      <pre wrap="" class="moz-quote-pre">
Could you have a look at solving this issue?</pre>
    </blockquote>
    I'll have a look at it and try to fix in the next few days.<br>
    <blockquote type="cite" cite="mid:20250829234459.01a60586@windsurf">
      <pre wrap="" class="moz-quote-pre">

Thanks a lot!

Thomas
</pre>
    </blockquote>
    <p>Best regards, <br>
    </p>
    <p>Mehdi<br>
    </p>
  </body>
</html>

--------------v8tZDPqB9ktx5Y4eIxej9vcy--

--===============8625712249557033392==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8625712249557033392==--
