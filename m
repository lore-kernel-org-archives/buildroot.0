Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C93C4167B
	for <buildroot@archiver.kernel.org>; Mon, 27 Nov 2023 21:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FC608174D;
	Mon, 27 Nov 2023 21:22:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FC608174D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fjzbO-vqDCAa; Mon, 27 Nov 2023 21:22:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 337D78188A;
	Mon, 27 Nov 2023 21:22:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 337D78188A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0E7731BF37B
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 21:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D29D560EFE
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 21:22:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D29D560EFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P-8yKmjuSrtd for <buildroot@lists.busybox.net>;
 Mon, 27 Nov 2023 21:22:17 +0000 (UTC)
X-Greylist: delayed 459 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 27 Nov 2023 21:22:16 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCE9860DA5
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CCE9860DA5
 for <buildroot@buildroot.org>; Mon, 27 Nov 2023 21:22:16 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4SfJHp3kjgz9tM4
 for <buildroot@buildroot.org>; Mon, 27 Nov 2023 22:14:30 +0100 (CET)
Message-ID: <f0b3caa4-43ce-4f0e-a855-9726f1944644@lindra.de>
Date: Mon, 27 Nov 2023 22:14:29 +0100
MIME-Version: 1.0
Content-Language: en-US
To: buildroot@buildroot.org
References: <20231123174105.2435757-1-hypnotoad@lindra.de>
 <20231125220439.GQ3177259@scaer>
From: Ralf Dragon <hypnotoad@lindra.de>
In-Reply-To: <20231125220439.GQ3177259@scaer>
X-Rspamd-Queue-Id: 4SfJHp3kjgz9tM4
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lindra.de; s=MBO0001; t=1701119670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gwT6/QzKFMxcT+87K+zTRtmKe17y1nFsXx3ZwMPobP0=;
 b=S2+vksCv5M06vnQabcBsoThxApCWD77NFJMPKm939a5HZQIx7PFbPbL7D2ORyjuCnCxRwV
 PvxDZiLWgeQxTL2MlUzoIOO/vfqVuQ7ZIk8cYka72esUZs+Vzld8bes7KDczCXyOuZnRfJ
 Q9G34vAD+boC29Q47AJAiEYDte17yyzhcU4lTObtKscGb74nOYJu3zEllvgCZZaxwnlrXj
 08S9riwf5Tit0Sx/+2pk7BQsvTNfNa3hAN/MErm/2W0bXj89Y8+5mRLcA4uIWe0dT44o6K
 vhsW10+aggCDMioId8wotQ6HG4Zb62+t1im0C/1fgULLV8ScIElbjBWln/gOuw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=lindra.de header.i=@lindra.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=S2+vksCv
Subject: Re: [Buildroot] [PATCH 1/1] python-sip: fix compile error
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
Content-Type: multipart/mixed; boundary="===============1227034579404197630=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============1227034579404197630==
Content-Type: multipart/alternative;
 boundary="------------ChvzrN1PlCtcmlqHRhhgdx20"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------ChvzrN1PlCtcmlqHRhhgdx20
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Yann,

thank you for your feedback. As you might have noticed, this is my first 
submission to buildroot and I had no contact so far to such a 
contribution process. So feedback is appreciated.

> Here, you'd want to explain why it now fails, so that we can assess
> whether we need to backport the fix to maintainance branches.
>
> So, something along the lines of:
>
>      siplib: fix build with python >= 3.11
>
>      With python 3.11, the PyFrameObject structure members have been
>      removed from the public C API:
>
> https://docs.python.org/3.11/whatsnew/3.11.html#whatsnew311-c-api-porting
> https://docs.python.org/3.11/whatsnew/3.11.html#pyframeobject-3-11-hiding
>
>      So, use the proper object type that can store an actual
>      PyFrameObject.
>
Your description it is already quite good 🙂. I will check again. I have 
to say, the patch checker command passed for me, but I was probably in 
the long-term branch at that time.


> We also try hard to push patches upstream so that we do not have to
> carry them indefinitely. Please try and submit that patch to the SIP
> project:
> https://riverbankcomputing.com/support/lists

They write that siplib is no longer supported and that 4.19.25 is the 
last version: https://riverbankcomputing.com/software/sip/download . 
That's why I did not consider asking there.

>> +Index: host-python-sip-4.19.25/siplib/sip.h
>> +===================================================================
> What diff fornat is that? We usually have plain diff, or git-formatted
> patches.

I think it is the output from "git diff" piped into the file.

> Can you look into reworking this patch of yours, please?

Will do.

Best,

Ralf

--------------ChvzrN1PlCtcmlqHRhhgdx20
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-text-html" lang="x-unicode">
      <div class="moz-text-flowed"
        style="font-family: -moz-fixed; font-size: 12px;"
        lang="x-unicode">Dear Yann, <br>
        <br>
        thank you for your feedback. As you might have noticed, this is
        my first submission to buildroot and I had no contact so far to
        such a contribution process. So feedback is appreciated. <br>
        <br>
        <blockquote type="cite" style="color: #007cff;">Here, you'd want
          to explain why it now fails, so that we can assess <br>
          whether we need to backport the fix to maintainance branches.
          <br>
          <br>
          So, something along the lines of: <br>
          <br>
               siplib: fix build with python &gt;= 3.11 <br>
          <br>
               With python 3.11, the PyFrameObject structure members
          have been <br>
               removed from the public C API: <br>
          <br>
                   <a class="moz-txt-link-freetext"
href="https://docs.python.org/3.11/whatsnew/3.11.html#whatsnew311-c-api-porting">https://docs.python.org/3.11/whatsnew/3.11.html#whatsnew311-c-api-porting</a>
          <br>
                   <a class="moz-txt-link-freetext"
href="https://docs.python.org/3.11/whatsnew/3.11.html#pyframeobject-3-11-hiding">https://docs.python.org/3.11/whatsnew/3.11.html#pyframeobject-3-11-hiding</a>
          <br>
          <br>
               So, use the proper object type that can store an actual <br>
               PyFrameObject. <br>
          <br>
        </blockquote>
        Your description it is already quite good 🙂. I will check
        again. I have to say, the patch checker command passed for me,
        but I was probably in the long-term branch at that time. <br>
        <br>
        <br>
        <blockquote type="cite" style="color: #007cff;">We also try hard
          to push patches upstream so that we do not have to <br>
          carry them indefinitely. Please try and submit that patch to
          the SIP <br>
          project: <br>
               <a class="moz-txt-link-freetext"
            href="https://riverbankcomputing.com/support/lists">https://riverbankcomputing.com/support/lists</a>
          <br>
        </blockquote>
        <br>
        They write that siplib is no longer supported and that 4.19.25
        is the last version: <a class="moz-txt-link-freetext"
          href="https://riverbankcomputing.com/software/sip/download">https://riverbankcomputing.com/software/sip/download</a>
        . That's why I did not consider asking there. <br>
        <br>
        <blockquote type="cite" style="color: #007cff;">
          <blockquote type="cite" style="color: #007cff;">+Index:
            host-python-sip-4.19.25/siplib/sip.h <br>
+=================================================================== <br>
          </blockquote>
          What diff fornat is that? We usually have plain diff, or
          git-formatted <br>
          patches. <br>
        </blockquote>
        <br>
        I think it is the output from "git diff" piped into the file. <br>
        <br>
        <blockquote type="cite" style="color: #007cff;">Can you look
          into reworking this patch of yours, please? <br>
        </blockquote>
        <br>
        Will do. <br>
        <br>
        Best, <br>
        <br>
        Ralf <br>
        <br>
      </div>
    </div>
  </body>
</html>

--------------ChvzrN1PlCtcmlqHRhhgdx20--

--===============1227034579404197630==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1227034579404197630==--
