Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 843E3C433F5
	for <buildroot@archiver.kernel.org>; Fri,  6 May 2022 17:07:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1ECD981C20;
	Fri,  6 May 2022 17:07:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aggZz17tSSch; Fri,  6 May 2022 17:07:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38EBB83E2C;
	Fri,  6 May 2022 17:07:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 96E9C1BF42C
 for <buildroot@lists.busybox.net>; Fri,  6 May 2022 17:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84B7D40447
 for <buildroot@lists.busybox.net>; Fri,  6 May 2022 17:07:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nv15EVzIFXja for <buildroot@lists.busybox.net>;
 Fri,  6 May 2022 17:07:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 79104400E9
 for <buildroot@buildroot.org>; Fri,  6 May 2022 17:07:10 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id bg25so4803229wmb.4
 for <buildroot@buildroot.org>; Fri, 06 May 2022 10:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:cc:from:in-reply-to;
 bh=LG8lAQkT7rekWmEpn8THEZD4S1blY6Cq2DRH5Tc1NGE=;
 b=Rphb2kN6o74gpbBj8w1cEnGf6e2pKDcr5njuz9RRvpnsF/T8YHn6Wdiuk2kFxZzoOr
 xTN/kdgh7qNZdAAxvCLjrc82zeiZU3sSlHGmshkgxsro1Cghr0lIXHexz1WQgK0Wbj2H
 L7LQbfC8BGSjC29a9O+xx96j4CpgmRCsOoFcWk+GTgGtL8Pqjxp8r7U9BgGduSfrvonc
 VDsUT45NlQSTC2nDjhtx5d1mx4R+Ue2TchZjoTazwzB1+fF2ecddztMP+mZezjcefBtT
 faXIc3u72bAWiNBW+HtOtQNNiw5i7kQDc+Ewdaci0Go4KnpF+R5T0KRkDf0vcYZw/iek
 CjIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to;
 bh=LG8lAQkT7rekWmEpn8THEZD4S1blY6Cq2DRH5Tc1NGE=;
 b=WveikYjbK1EKOlBh60NhM7bk6NwWqO/gCo1SF7L4KVdgElBBYWgqTLL79jMK+g/MgO
 /dwotGRWITFoUyhe6AgQREC/5c2lSdD2BGbKMm+Nu0KN4ToP5p0RVv7aNjKDRhjouyXR
 9J00DoIxp+yK2Op+3sFb2PQ0aLJPsACU7Jn1xoKZdLpszRURKRsFXoEKhCt0+oELDl4k
 MjcbQpcM7XljW42EKzH/ZzEug1z5KsOXnhFwjl6W/9y7oQMtfVVgr/SGkDf7H0cGlY0t
 7DQbGtzk6rjkSZMTILvpw3mXH4/eXcS0fl0OM50lYWoD4MlSJ4vxnyVSm34w5F3T/vSy
 KUrQ==
X-Gm-Message-State: AOAM5304nezRi1ySZOlk2lD8fgnTHfC1i/un1dv6Yq7XkPIdkRLTgL4P
 4ZZ/XH8zvnqBWpP+MntQ7M6NPt6k6BuaqA==
X-Google-Smtp-Source: ABdhPJyKQXRtdKdBagUWI0a3RPH5Sd3j05Y/j7I4nrRlaPHH65lZ5Asypomyb940lqonhCOljyCCgQ==
X-Received: by 2002:a7b:c310:0:b0:38c:f07a:e10d with SMTP id
 k16-20020a7bc310000000b0038cf07ae10dmr4350830wmj.110.1651856828540; 
 Fri, 06 May 2022 10:07:08 -0700 (PDT)
Received: from [192.168.12.171] ([46.231.147.8])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a1cf702000000b00394538d039esm7894148wmh.6.2022.05.06.10.07.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 May 2022 10:07:07 -0700 (PDT)
Message-ID: <4faa9736-e53b-629c-e6c8-7588e3cf7ba7@gmail.com>
Date: Fri, 6 May 2022 19:07:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Content-Language: fr
To: Alexander Dahl <post@lespocky.de>
References: <1651848863-30178-1-git-send-email-remi.jouannet@outscale.com>
 <20220506153144.GD19726@falbala.internal.home.lespocky.de>
From: =?UTF-8?Q?R=c3=a9mi_Jouannet?= <remijouannet@gmail.com>
In-Reply-To: <20220506153144.GD19726@falbala.internal.home.lespocky.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/busybox: add -O staticroutes
 options to udhcpc udhcpc default script can handle staticroutes but it
 missing from ifupdown options
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
Cc: Remi Jouannet <remi.jouannet@outscale.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============0608096589574194898=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============0608096589574194898==
Content-Type: multipart/alternative;
 boundary="------------zfL0EAj0SQeBD0QCH2knxS9C"
Content-Language: fr

This is a multi-part message in MIME format.
--------------zfL0EAj0SQeBD0QCH2knxS9C
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

yeah sorry about that, i'm not used to send patch by email

I wanted to do a simple subject and write a few lines to explain the
patch in the body

do you want me to send a another patch with a a better subject/body ?

Le 06/05/2022 à 17:31, Alexander Dahl a écrit :
> Hei hei,
>
> took me a while to find the reasoning for this patch. Didn't expect it
> in that very long subject line. ;-)
>
> Greets
> Alex
>
> On Fri, May 06, 2022 at 02:54:23PM +0000, Remi Jouannet wrote:
>> Signed-off-by: Rémi Jouannet<remi.jouannet@outscale.com>
>> ---
>>   package/busybox/busybox.config | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/package/busybox/busybox.config b/package/busybox/busybox.config
>> index 52cb8ff..a614662 100644
>> --- a/package/busybox/busybox.config
>> +++ b/package/busybox/busybox.config
>> @@ -1022,7 +1022,7 @@ CONFIG_UDHCP_DEBUG=0
>>   CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=80
>>   CONFIG_FEATURE_UDHCP_RFC3397=y
>>   CONFIG_FEATURE_UDHCP_8021Q=y
>> -CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-b -R -O search"
>> +CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-b -R -O search -O staticroutes"
>>   
>>   #
>>   # Print Utilities
>> -- 
>> 1.8.3.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
--------------zfL0EAj0SQeBD0QCH2knxS9C
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre class="content">Hello,

yeah sorry about that, i'm not used to send patch by email

I wanted to do a simple subject and write a few lines to explain the 
patch in the body

do you want me to send a another patch with a a better subject/body ?</pre>
    <div class="moz-cite-prefix">Le 06/05/2022 à 17:31, Alexander Dahl a
      écrit :<br>
    </div>
    <blockquote type="cite"
      cite="mid:20220506153144.GD19726@falbala.internal.home.lespocky.de">
      <pre class="moz-quote-pre" wrap="">Hei hei,

took me a while to find the reasoning for this patch. Didn't expect it
in that very long subject line. ;-)

Greets
Alex

On Fri, May 06, 2022 at 02:54:23PM +0000, Remi Jouannet wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Signed-off-by: Rémi Jouannet <a class="moz-txt-link-rfc2396E" href="mailto:remi.jouannet@outscale.com">&lt;remi.jouannet@outscale.com&gt;</a>
---
 package/busybox/busybox.config | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/busybox/busybox.config b/package/busybox/busybox.config
index 52cb8ff..a614662 100644
--- a/package/busybox/busybox.config
+++ b/package/busybox/busybox.config
@@ -1022,7 +1022,7 @@ CONFIG_UDHCP_DEBUG=0
 CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=80
 CONFIG_FEATURE_UDHCP_RFC3397=y
 CONFIG_FEATURE_UDHCP_8021Q=y
-CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-b -R -O search"
+CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-b -R -O search -O staticroutes"
 
 #
 # Print Utilities
-- 
1.8.3.1

_______________________________________________
buildroot mailing list
<a class="moz-txt-link-abbreviated" href="mailto:buildroot@buildroot.org">buildroot@buildroot.org</a>
<a class="moz-txt-link-freetext" href="https://lists.buildroot.org/mailman/listinfo/buildroot">https://lists.buildroot.org/mailman/listinfo/buildroot</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------zfL0EAj0SQeBD0QCH2knxS9C--

--===============0608096589574194898==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0608096589574194898==--
