Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C638C4167B
	for <buildroot@archiver.kernel.org>; Wed, 29 Nov 2023 15:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F9196150D;
	Wed, 29 Nov 2023 15:02:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F9196150D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K-fuEHxRKGRI; Wed, 29 Nov 2023 15:02:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAED5614FF;
	Wed, 29 Nov 2023 15:02:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAED5614FF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D060F1BF2B5
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 15:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A92B26150D
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 15:02:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A92B26150D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0JcwUPmDeviR for <buildroot@lists.busybox.net>;
 Wed, 29 Nov 2023 15:02:23 +0000 (UTC)
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9664460B3D
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 15:02:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9664460B3D
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2c9c39b7923so4121141fa.0
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 07:02:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701270140; x=1701874940;
 h=in-reply-to:from:references:to:content-language:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=xdRWE+SgwyfLOndYHaOl4dtdZU37url8ML/q3e7x2l8=;
 b=tmeK6FeoSInfuGP/GzbfyJnBKaJN1k8y1EdzszmvPNXrzqCtmJ67YhK8XMc/uU5xB6
 JSuWR7SQDluv1FN/PhbSip1bntv1+B0seApq0d/1qHZbqE/ndk+SVHki3TJjDGWOF/TE
 C9qYhFUlxqCDb3qureLROStIXxobkHKZZ5/3G9oE4E2bWeDaHBqBRMoU04xeRr0Jz769
 s3OFXl2Rhijux2V6SiYFWMaeWTFY0s473+Hzv483G6+D84F1dRczLwyk9ItegI+vbxow
 CrqkDeoHBNiNitU9nahlrNzD6nfpSbi0elbr54CJeOOUDPU2CpSRqXl5VMtGLPHhTQEO
 6Ygg==
X-Gm-Message-State: AOJu0Yy6llW76ZNlastbFqQsyM22x8lExPrXp59UU4oIwOIAB6r2oge/
 2nkz+UNs8R4/SvDIw3hF6sOyRFSrci6RZIFAoGg=
X-Google-Smtp-Source: AGHT+IE4qkuz7BLt9O45wDcoatPXnPYIjY9AdUpRy2YUawrP1+TiZMmcDo/K+nsfc3XC4pWgVDoQwA==
X-Received: by 2002:a2e:240b:0:b0:2c9:c580:82d5 with SMTP id
 k11-20020a2e240b000000b002c9c58082d5mr217619ljk.35.1701270139662; 
 Wed, 29 Nov 2023 07:02:19 -0800 (PST)
Received: from [10.5.3.225]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ay5-20020a05600c1e0500b0040b54d7ebb9sm1832071wmb.41.2023.11.29.07.02.18
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Nov 2023 07:02:19 -0800 (PST)
Message-ID: <56ef6583-cbf8-440d-9513-63b7294f3502@smile.fr>
Date: Wed, 29 Nov 2023 16:02:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
References: <20231124161523.215078-1-antoine.coutant@smile.fr>
 <20231124161523.215078-2-antoine.coutant__4480.32651781745$1700842615$gmane$org@smile.fr>
 <pan$5ec9d$5fde4d51$dffa430d$e2645b4e@ID-313208.user.individual.net>
From: Antoine Coutant <antoine.coutant@smile.fr>
In-Reply-To: <pan$5ec9d$5fde4d51$dffa430d$e2645b4e@ID-313208.user.individual.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1701270140; x=1701874940;
 darn=buildroot.org; 
 h=in-reply-to:from:references:to:content-language:subject:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xdRWE+SgwyfLOndYHaOl4dtdZU37url8ML/q3e7x2l8=;
 b=ZZFw6H45Y3SkVWWF8ResIl3U8iL9Qu1ggjmGLnLk1AjH6CN7Ije1zmXtCQ2TPXh02q
 zz+OR070w2IWG/8xxANiNfRINZTEfRPyX96G5OoncbFWhTNk3Lm3NewVeRJz49aTFklq
 W38lJTIDeUlsspuufoRJ5hTU+xRF3ZQ0ZOWIwq0k5z6k4CgzNYMFaA3vmFVjL7jz7mD9
 Ihn8Q1qH+EvxkqOZh75euL5RBsCZUxPHl7zvGOM7iFRjXMUy7a/twUtKqiLLxriT/ZY5
 7ORIkgGphh3blglLKIP6pNHP8cw5frZjmqI9HxQweM9SNWK+kOJ3o8DB6U+G7nzLzPFa
 IDfw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=ZZFw6H45
Subject: Re: [Buildroot] [[DO NOT MERGE] v3 1/7] package/meson: bump version
 to 1.3.0
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
Content-Type: multipart/mixed; boundary="===============3418215464871010351=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============3418215464871010351==
Content-Type: multipart/alternative;
 boundary="------------xMHXSAhR0QxN4eSPYIZFz5yC"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------xMHXSAhR0QxN4eSPYIZFz5yC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bernd,

On 25/11/2023 12:24, Bernd Kuhls wrote:
> Hi Antoine,
>
> Am Fri, 24 Nov 2023 17:15:17 +0100 schrieb Antoine Coutant:
>
>> It would be safer not to merge this patch without being sure that the
>> problem was from qemu and not meson.
> apparently there is a problem with meson for which an untested patch
> exists:
> https://github.com/mesonbuild/meson/issues/11914#issuecomment-1764880338
> https://github.com/dcbaker/meson/commit/
> 5440c57a63f81d5d6cdf0cf7a5c5613f766589f0

I tested this patch and it appears that it does not fix the issue.

Indeed, this patch removes paths that are not compiler specific

but the path of the library linked to host-clang is not removed

(/usr/lib/x86_64-linux-gnu/libgio-2.0.so).

I added a new comment on the issue :

https://github.com/mesonbuild/meson/issues/11914#issuecomment-1832011210 
<https://github.com/mesonbuild/meson/issues/11914#issuecomment-1832011210>.

> Also with this version bump you need to update support/misc/cross-
> compilation.conf.in
>
> -pkgconfig = '@PKGCONF_HOST_BINARY@'
> +pkg-config = '@PKGCONF_HOST_BINARY@'
>
> because ofhttps://mesonbuild.com/Release-notes-for-1-3-0.html#machine-
> files-pkgconfig-field-deprecated-and-replaced-by-pkgconfig

Thanks, I will make this change.

Regards, Antoine

>
> Regards, Bernd
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
--------------xMHXSAhR0QxN4eSPYIZFz5yC
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Bernd,</p>
    <div class="moz-cite-prefix">On 25/11/2023 12:24, Bernd Kuhls wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:pan$5ec9d$5fde4d51$dffa430d$e2645b4e@ID-313208.user.individual.net">
      <pre class="moz-quote-pre" wrap="">Hi Antoine,

Am Fri, 24 Nov 2023 17:15:17 +0100 schrieb Antoine Coutant:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">It would be safer not to merge this patch without being sure that the
problem was from qemu and not meson.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
apparently there is a problem with meson for which an untested patch 
exists:
<a class="moz-txt-link-freetext" href="https://github.com/mesonbuild/meson/issues/11914#issuecomment-1764880338">https://github.com/mesonbuild/meson/issues/11914#issuecomment-1764880338</a>
<a class="moz-txt-link-freetext" href="https://github.com/dcbaker/meson/commit/">https://github.com/dcbaker/meson/commit/</a>
5440c57a63f81d5d6cdf0cf7a5c5613f766589f0</pre>
    </blockquote>
    <pre class="moz-quote-pre" wrap=""></pre>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"
      id="docs-internal-guid-799749fc-7fff-a703-bc69-407ac7e2fdd4"><span
style="font-size: 11pt; color: rgb(0, 0, 0); background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap; font-family: Arial, sans-serif;">I tested this patch and it appears that it does not fix the issue.</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span
style="font-size: 11pt; color: rgb(0, 0, 0); background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap; font-family: Arial, sans-serif;">Indeed, this patch removes paths that are not compiler specific</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span
style="font-size: 11pt; color: rgb(0, 0, 0); background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap; font-family: Arial, sans-serif;">but the path of the library linked to host-clang is not removed</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span
style="font-size: 11pt; color: rgb(0, 0, 0); background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap; font-family: Arial, sans-serif;">(/usr/lib/x86_64-linux-gnu/libgio-2.0.so).</span></p>
    <p><span
style="font-size: 11pt; color: rgb(0, 0, 0); background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap; font-family: Arial, sans-serif;">I added a new comment on the issue :</span></p>
    <p><a
href="https://github.com/mesonbuild/meson/issues/11914#issuecomment-1832011210"
        style="text-decoration:none;"><span
style="font-size: 11pt; color: rgb(17, 85, 204); background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: underline; text-decoration-skip-ink: none; vertical-align: baseline; white-space: pre-wrap; font-family: Arial, sans-serif;">https://github.com/mesonbuild/meson/issues/11914#issuecomment-1832011210</span></a><span
style="font-size: 11pt; color: rgb(0, 0, 0); background-color: transparent; font-weight: 400; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap; font-family: Arial, sans-serif;">.</span></p>
    <blockquote type="cite"
cite="mid:pan$5ec9d$5fde4d51$dffa430d$e2645b4e@ID-313208.user.individual.net">
      <pre class="moz-quote-pre" wrap="">Also with this version bump you need to update support/misc/cross-
compilation.conf.in

-pkgconfig = '@PKGCONF_HOST_BINARY@'
+pkg-config = '@PKGCONF_HOST_BINARY@'

because of <a class="moz-txt-link-freetext" href="https://mesonbuild.com/Release-notes-for-1-3-0.html#machine">https://mesonbuild.com/Release-notes-for-1-3-0.html#machine</a>-
files-pkgconfig-field-deprecated-and-replaced-by-pkgconfig</pre>
    </blockquote>
    <pre class="moz-quote-pre" wrap=""></pre>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Thanks, </span><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">I will make this change.</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">
</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Regards, Antoine
</span></p>
    <blockquote type="cite"
cite="mid:pan$5ec9d$5fde4d51$dffa430d$e2645b4e@ID-313208.user.individual.net">
      <pre class="moz-quote-pre" wrap="">

Regards, Bernd

_______________________________________________
buildroot mailing list
<a class="moz-txt-link-abbreviated" href="mailto:buildroot@buildroot.org">buildroot@buildroot.org</a>
<a class="moz-txt-link-freetext" href="https://lists.buildroot.org/mailman/listinfo/buildroot">https://lists.buildroot.org/mailman/listinfo/buildroot</a>
</pre>
    </blockquote>
  </body>
</html>

--------------xMHXSAhR0QxN4eSPYIZFz5yC--

--===============3418215464871010351==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3418215464871010351==--
