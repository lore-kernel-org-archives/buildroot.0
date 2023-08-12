Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C94C001B0
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 21:54:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E85D040481;
	Sat, 12 Aug 2023 21:54:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E85D040481
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4iNTcF8hyVIP; Sat, 12 Aug 2023 21:54:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A957403EA;
	Sat, 12 Aug 2023 21:54:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A957403EA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0B7FD1BF5DC
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 21:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E05D6403EA
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 21:54:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E05D6403EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yvMAtmaRVMKR for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 21:54:12 +0000 (UTC)
Received: from mx.kolabnow.com (mx.kolabnow.com [212.103.80.154])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 97B0F40111
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 21:54:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97B0F40111
Received: from localhost (unknown [127.0.0.1])
 by mx.kolabnow.com (Postfix) with ESMTP id 8203AB7B;
 Sat, 12 Aug 2023 23:54:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
 by localhost (ext-mx-out001.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WxnI4QvjBi-B; Sat, 12 Aug 2023 23:54:05 +0200 (CEST)
Received: from int-mx001.mykolab.com (unknown [10.9.13.1])
 by mx.kolabnow.com (Postfix) with ESMTPS id F24BD7B6;
 Sat, 12 Aug 2023 23:54:04 +0200 (CEST)
Received: from int-subm003.mykolab.com (unknown [10.9.37.3])
 by int-mx001.mykolab.com (Postfix) with ESMTPS id 565F8847;
 Sat, 12 Aug 2023 23:54:04 +0200 (CEST)
MIME-Version: 1.0
Date: Sat, 12 Aug 2023 23:54:03 +0200
From: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20230812215559.65936b40@windsurf>
References: <20230812175348.1449808-1-zgyarmati@zgyarmati.de>
 <20230812215559.65936b40@windsurf>
Message-ID: <6691f34e23b7c34d8458417421e7ea27@zgyarmati.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kolabnow.com; h=
 message-id:references:in-reply-to:subject:subject:from:from:date
 :date:content-type:content-type:mime-version:received:received
 :received; s=dkim20160331; t=1691877245; x=1693691646; bh=zdlft6
 nWbPN26ukmp+zUNjJOUuUuMCwI26OTN/ZhYS4=; b=ufjbUHPtFU5OwhEXUU999/
 iFQlPrx2ce/Sy4Tc2hnEs38dRvl9pZdSEEmpbBx3kfOC2bs8aX1W8FbLiK/UqttW
 mFeX6tIoyBN9WpPBIwmaJZFMf0eteNp3OYv7jpRoyzkzzGruQ+wWOriG/X8KEhJC
 /o6nyEUPw0bKnCVApCqbfX8fX2uM7WQekAYwP0b/oHX9Icr54y1Ax1+NM9Q3bynH
 zOiHR5qK3caRIecoUAA3520Tfr2uI0vSfpGPg1KDOwFOchngdvccqcuSBOHew89I
 kXkSlomxHwAPaqXaGJ+TM/kXpVc8INJ9uiAQgQC3UxWk+1JFTPiB0iSylFFhqzN5
 /jFhYG8E+nRBT6gJdW7hPHbPmlF37h1D9+xsO3i+F3Z/Y5NYEAcYPCP66hwbTBdB
 zE/foXa7NRFUS/QeYejlqRDSwGmBDLVug21VEkEX3v6utEKHgLDIs8kMivz2ws1d
 oJyQbzjEPNSOAH2OhNUxFwYZOvg2r6ikxqvaShJ0dmLHhmbRcq3k1uDcrvshtMQT
 Q2tNXWeLj58/yPTlJHvp0JHfowLWQVlsxQl25RRL1/URZ1Y44vhWGt7DaJ6zHGhr
 wOQna/fi+YBo64ukkywC+fLeB8tBmYBjjdzYN3G9ADWK11Jybzbo5ucgSL+FkGhe
 dldRdZHecAgJZ3oh6UU0U=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (4096-bit key) header.d=kolabnow.com header.i=@kolabnow.com
 header.a=rsa-sha256 header.s=dkim20160331 header.b=ufjbUHPt
X-Mailman-Original-Authentication-Results: ext-mx-out001.mykolab.com
 (amavisd-new); 
 dkim=pass (4096-bit key) reason="pass (just generated, assumed good)"
 header.d=kolabnow.com
Subject: Re: [Buildroot] [PATCH 1/1] package/libusb-compat: bump to 0.1.8
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
Content-Type: multipart/mixed; boundary="===============8356631370068399234=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8356631370068399234==
Content-Type: multipart/alternative;
 boundary="=_e9f681f7b7ff0afce36a08541b1bd1e3"

--=_e9f681f7b7ff0afce36a08541b1bd1e3
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII;
 format=flowed

On 2023-08-12 21:55, Thomas Petazzoni wrote:

> On Sat, 12 Aug 2023 19:53:48 +0200
> Zoltan Gyarmati <zgyarmati@zgyarmati.de> wrote:
> 
>> Removing upstreamed patch and force autoreconf
> 
> Thanks for your patch. However, why is the force autoreconf needed? We
> need to have a comment above this line in the .mk file that explains
> why.
> 
> Thanks a lot!
> 
> Thomas

Thanks for the feedback! Unfortunately this release tarball doesn't have 
the `configure` scripts and other files generated. Gonna send a v2 here 
and send a feedback to upstream.

-- 
https://zgyarmati.de
--=_e9f681f7b7ff0afce36a08541b1bd1e3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3DUTF-8" /></head><body style=3D'font-size: 10pt; font-family: Verdana,Gen=
eva,sans-serif'>
<p id=3D"reply-intro">On 2023-08-12 21:55, Thomas Petazzoni wrote:</p>
<blockquote type=3D"cite" style=3D"padding: 0 0.4em; border-left: #1010ff 2=
px solid; margin: 0">
<div class=3D"pre" style=3D"margin: 0; padding: 0; font-family: monospace">=
On Sat, 12 Aug 2023 19:53:48 +0200<br />Zoltan Gyarmati &lt;<a href=3D"mail=
to:zgyarmati@zgyarmati.de">zgyarmati@zgyarmati.de</a>&gt; wrote:<br /><br /=
>
<blockquote type=3D"cite" style=3D"padding: 0 0.4em; border-left: #1010ff 2=
px solid; margin: 0">Removing upstreamed patch and force autoreconf</blockq=
uote>
<br />Thanks for your patch. However, why is the force autoreconf needed? W=
e<br />need to have a comment above this line in the .mk file that explains=
<br />why.<br /><br />Thanks a lot!<br /><br />Thomas</div>
</blockquote>
<p>Thanks for the feedback! Unfortunately this release tarball doesn't have=
 the `configure` scripts and other files generated. Gonna send a v2 here an=
d send a feedback to upstream.</p>
<p><br /></p>
<p><br /></p>
<div id=3D"signature">-- <br />
<div class=3D"pre" style=3D"margin: 0; padding: 0; font-family: monospace">=
<a href=3D"https://zgyarmati.de" target=3D"_blank" rel=3D"noopener noreferr=
er">https://zgyarmati.de</a></div>
</div>
</body></html>

--=_e9f681f7b7ff0afce36a08541b1bd1e3--

--===============8356631370068399234==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8356631370068399234==--
