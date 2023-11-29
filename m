Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EAA7C4167B
	for <buildroot@archiver.kernel.org>; Wed, 29 Nov 2023 22:11:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 168A5615FA;
	Wed, 29 Nov 2023 22:11:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 168A5615FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AiV4SG0r9_xs; Wed, 29 Nov 2023 22:11:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA5C661609;
	Wed, 29 Nov 2023 22:11:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA5C661609
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B6DCC1BF356
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 22:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8FBC78177C
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 22:11:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FBC78177C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oLlOoXd6CRBl for <buildroot@lists.busybox.net>;
 Wed, 29 Nov 2023 22:11:01 +0000 (UTC)
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 06B9A81755
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 22:11:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06B9A81755
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4SgYS02P5Dz9stb;
 Wed, 29 Nov 2023 23:10:56 +0100 (CET)
Message-ID: <36de4fd0-85f8-46a4-9146-05029704f458@lindra.de>
Date: Wed, 29 Nov 2023 23:10:53 +0100
MIME-Version: 1.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20231123174105.2435757-1-hypnotoad@lindra.de>
 <20231125220439.GQ3177259@scaer>
 <f0b3caa4-43ce-4f0e-a855-9726f1944644@lindra.de>
 <20231129064229.GI3177259@scaer>
From: Ralf Dragon <hypnotoad@lindra.de>
In-Reply-To: <20231129064229.GI3177259@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lindra.de; s=MBO0001; t=1701295856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cXLoRiS0qmLFqxf/BullZIIXUA9LDEXp8Q5xUdJMYCU=;
 b=m5izaD9D+ZDxx03UHbEPYHPzyJlfy4FQBdHqGkSzMYFNfHYCCm00pgb1U3o/I4C7uShpQv
 4EWYnzCYU8Ui1GOXMugiTQ4/X+/9ESw+xL6NSRQuBGkmEEX7T7YvRzAMOs8q+XndO3/L9c
 kXMZBSoaPUunRSoSXBvFfLdWffZLD/4eZuONv7o8YgPCUYyfND7HFfmAoDs7zqJtz9Wizx
 Iaj9yijiD5KWeMeUM9GjeQRcJlP5+B9g4OPswkmBBMCnwa/btieoBks+JbLgM7mDj6M4Xg
 N+UlVHZT2S8tm6OT2UV2/b9nMRKdg4NcoxmVovmWG0uc4qOk7itLHyomBC0+Hw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=lindra.de header.i=@lindra.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=m5izaD9D
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============1645841177403968776=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============1645841177403968776==
Content-Type: multipart/alternative;
 boundary="------------XQz0IfFAYBtD1bPtMOYzAgQF"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------XQz0IfFAYBtD1bPtMOYzAgQF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Yann,

We also try hard to push patches upstream so that we do not have to
>>    carry them indefinitely. Please try and submit that patch to the SIP
>>    project:
>>         [3]https://riverbankcomputing.com/support/lists
>>
>> They write that siplib is no longer supported and that 4.19.25 is the last version:
>> [4]https://riverbankcomputing.com/software/sip/download  . That's why I did not consider asking there.
> What I read is that version 4 is no longer maintained:
>
>      SIP v4 is no longer supported. This is the last release.
>
> The repository is still getting a lot of attention, and they tagged
> 6.7.12 last october, which is prestty recent. Also, it looks like it is
> now a proper python package, so we should be able to migrate python-sip
> to the python-package infra now, and drop our custom _CONFIGURE_CMDS,
> _BUILD_CMDS, and _INSTLAL_CMDS altogether.
>
> Of course, pyqt5, the sole user of python-sip, may still require sip v4,
> which would preclude updating... :-(
>
> Could you look into that?

Debian did a pretty similar fix like mine 1 year ago: 
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=%231023913 . Freebsd 
uses pyqt5 with sip6 
https://gitlab.com/FreeBSD/freebsd-ports/-/commit/08cac15470d53f0475de0de67a94c7e2cd7e021e 
. I will do one attempt to update to their versions 5.15.10 with 6.7.12 
from SIP6.

Best,

Ralf


--------------XQz0IfFAYBtD1bPtMOYzAgQF
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Dear Yann,</p>
    <span style="white-space: pre-wrap">  We also try hard to push patches upstream so that we do not have to</span>
    <blockquote type="cite" cite="mid:20231129064229.GI3177259@scaer">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">  carry them indefinitely. Please try and submit that patch to the SIP
  project:
       [3]<a class="moz-txt-link-freetext" href="https://riverbankcomputing.com/support/lists">https://riverbankcomputing.com/support/lists</a>

They write that siplib is no longer supported and that 4.19.25 is the last version:
[4]<a class="moz-txt-link-freetext" href="https://riverbankcomputing.com/software/sip/download">https://riverbankcomputing.com/software/sip/download</a> . That's why I did not consider asking there.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
What I read is that version 4 is no longer maintained:

    SIP v4 is no longer supported. This is the last release.

The repository is still getting a lot of attention, and they tagged
6.7.12 last october, which is prestty recent. Also, it looks like it is
now a proper python package, so we should be able to migrate python-sip
to the python-package infra now, and drop our custom _CONFIGURE_CMDS,
_BUILD_CMDS, and _INSTLAL_CMDS altogether.

Of course, pyqt5, the sole user of python-sip, may still require sip v4,
which would preclude updating... :-(

Could you look into that?</pre>
    </blockquote>
    <p>Debian did a pretty similar fix like mine 1 year ago:
      <a class="moz-txt-link-freetext" href="https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=%231023913">https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=%231023913</a> .
      Freebsd uses pyqt5 with sip6
<a class="moz-txt-link-freetext" href="https://gitlab.com/FreeBSD/freebsd-ports/-/commit/08cac15470d53f0475de0de67a94c7e2cd7e021e">https://gitlab.com/FreeBSD/freebsd-ports/-/commit/08cac15470d53f0475de0de67a94c7e2cd7e021e</a>
      . I will do one attempt to update to their versions 5.15.10 with
      6.7.12 from SIP6. <br>
    </p>
    <p>Best,</p>
    <p>Ralf<br>
    </p>
    <p><br>
    </p>
    <span style="white-space: pre-wrap">
</span>
  </body>
</html>

--------------XQz0IfFAYBtD1bPtMOYzAgQF--

--===============1645841177403968776==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1645841177403968776==--
