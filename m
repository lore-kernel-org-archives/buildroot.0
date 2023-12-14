Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94DC1C4332F
	for <buildroot@archiver.kernel.org>; Thu, 14 Dec 2023 16:32:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DC7B61AFA;
	Thu, 14 Dec 2023 16:32:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DC7B61AFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 32sE9xysH5UF; Thu, 14 Dec 2023 16:32:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FB1961B0A;
	Thu, 14 Dec 2023 16:32:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FB1961B0A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9A76F1BF28E
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 16:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D4DB61AB6
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 16:32:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D4DB61AB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XIVujCl4qVZV for <buildroot@lists.busybox.net>;
 Thu, 14 Dec 2023 16:32:13 +0000 (UTC)
X-Greylist: delayed 8746 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 14 Dec 2023 16:32:12 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C43B461AEB
Received: from 10.mo561.mail-out.ovh.net (10.mo561.mail-out.ovh.net
 [87.98.165.232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C43B461AEB
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 16:32:12 +0000 (UTC)
Received: from director5.ghost.mail-out.ovh.net (unknown [10.108.25.35])
 by mo561.mail-out.ovh.net (Postfix) with ESMTP id 8687F2BA15
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 14:06:23 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-k565z (unknown [10.110.113.134])
 by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 1D5BC1FDE0;
 Thu, 14 Dec 2023 14:06:23 +0000 (UTC)
Received: from blaess.fr ([37.59.142.97])
 by ghost-submission-6684bf9d7b-k565z with ESMTPSA
 id F5GLBt8Le2WiggAAsumx2w
 (envelope-from <christophe.blaess@logilin.fr>); Thu, 14 Dec 2023 14:06:23 +0000
X-OVh-ClientIp: 82.64.11.165
Message-ID: <c12b0b06-8481-4e29-92d9-125ab8b9ab11@logilin.fr>
Date: Thu, 14 Dec 2023 15:06:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay@rtone.fr>
References: <20231211081730.1406640-1-christophe.blaess@logilin.fr>
 <ZXobtaqzrUQ3eXLw@landeda>
Content-Language: fr
From: Christophe Blaess <christophe.blaess@logilin.fr>
Autocrypt: addr=christophe.blaess@logilin.fr; keydata=
 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
In-Reply-To: <ZXobtaqzrUQ3eXLw@landeda>
X-Ovh-Tracer-Id: 855402455246243280
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrudelledgheelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurheptgfkffggfgfuvfevfhfhjgesrgdtreertddvjeenucfhrhhomhepvehhrhhishhtohhphhgvuceulhgrvghsshcuoegthhhrihhsthhophhhvgdrsghlrggvshhssehlohhgihhlihhnrdhfrheqnecuggftrfgrthhtvghrnhepueejheduieeuleekleeftdeivedvtdfhgeegtedvvdfhfeehheelgeeutefgleefnecuffhomhgrihhnpehoiihlrggsshdrohhrghdplhhoghhilhhinhdrfhhrnecukfhppeduvdejrddtrddtrddupdekvddrieegrdduuddrudeihedpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghhrhhishhtohhphhgvrdgslhgrvghssheslhhoghhilhhinhdrfhhrqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehiedupdhmohguvgepshhmthhpohhuth
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002ed561c91-9b1e-4d7e-a037-5898403ce5e4,
 D3966082DFCA2BE351F3E1D22BE8DE41D3E0D936) smtp.auth=christophe@blaess.fr
Subject: Re: [Buildroot] [PATCH 1/3] configs: add support for the Raspberry
 Pi 5 board.
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
Content-Type: multipart/mixed; boundary="===============4491418033534811272=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============4491418033534811272==
Content-Type: multipart/alternative;
 boundary="------------CVzg0YVwztPH2TmK0EkHHQmf"
Content-Language: fr

This is a multi-part message in MIME format.
--------------CVzg0YVwztPH2TmK0EkHHQmf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Yann and Gaël,


> Gaël has sent another series about the rpi5:
>      https://patchwork.ozlabs.org/project/buildroot/list/?series=386144
>
> Can you look at his patch and see what is missing compared to what you
> did?

I think that Gaël's patches are more complete than mines (especially for 
16K pages support).

I suggest using his.

Regards,

-- 

Christophe BLAESS
Twitter: @chrisblaess
https://www.logilin.fr


--------------CVzg0YVwztPH2TmK0EkHHQmf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Hello Yann and Gaël,<br>
      <br>
      <br>
      <span style="white-space: pre-wrap">
</span></div>
    <blockquote type="cite" cite="mid:ZXobtaqzrUQ3eXLw@landeda">
      <pre class="moz-quote-pre" wrap="">Gaël has sent another series about the rpi5:
    <a class="moz-txt-link-freetext" href="https://patchwork.ozlabs.org/project/buildroot/list/?series=386144">https://patchwork.ozlabs.org/project/buildroot/list/?series=386144</a>

Can you look at his patch and see what is missing compared to what you
did?
</pre>
    </blockquote>
    <br>
    I think that Gaël's patches are more complete than mines (especially
    for 16K pages support).<br>
    <br>
    I suggest using his.<br>
    <br>
    Regards,<br>
    <br>
    <div class="moz-signature">-- <br>
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <title></title>
      <pre cols="72">Christophe BLAESS
Twitter: @chrisblaess
<a href="https://www.logilin.fr" target="_blank"
      class="moz-txt-link-freetext">https://www.logilin.fr</a>


</pre>
    </div>
  </body>
</html>

--------------CVzg0YVwztPH2TmK0EkHHQmf--

--===============4491418033534811272==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4491418033534811272==--
