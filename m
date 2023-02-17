Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46785C636D6
	for <buildroot@archiver.kernel.org>; Fri, 17 Feb 2023 16:15:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 951248149C;
	Fri, 17 Feb 2023 16:15:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 951248149C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yThgGorycezh; Fri, 17 Feb 2023 16:15:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E726081371;
	Fri, 17 Feb 2023 16:15:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E726081371
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4B2DA1BF2E4
 for <buildroot@lists.busybox.net>; Fri, 17 Feb 2023 16:15:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 24BF861AAF
 for <buildroot@lists.busybox.net>; Fri, 17 Feb 2023 16:15:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24BF861AAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jDkh4VKJlAy2 for <buildroot@lists.busybox.net>;
 Fri, 17 Feb 2023 16:15:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70671617B7
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 70671617B7
 for <buildroot@buildroot.org>; Fri, 17 Feb 2023 16:15:49 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-17172b43531so1677056fac.1
 for <buildroot@buildroot.org>; Fri, 17 Feb 2023 08:15:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ql/nHJcqNvHewVDA7BLoYjRVzsK/wRxV9/WYzvHp1So=;
 b=gMSTUcza7nm42M0RVddpX6719blwUKOw1pbwq5OaIUCsPZinZzBxlDDInx4Sqzk4cd
 DUnnyVlF/iuOp/SuHMhMpFiYaUxnX7MlFrFQAWRJP4aRTVLej37Gi6fnlua5P1chdqHy
 nHLWe4cTng5rGEki+wixxzZTFRbbNXpp3wD7iOdlz7jIdXLbH4ViKf/UKJBfj8DjP6/w
 R63MFcr5AzFXdqWoe6mP5VYV0vKqnzbs4XuYve9fsX8eceGUDRnBYo1vFRAwIJxESTSK
 JPGutqEi/WUPQH/m9WTCQezHLdMhzFO/CEG1RPIdi5Bf2TGbUBOOoA7P+HHji7dmRN5u
 eydg==
X-Gm-Message-State: AO0yUKUVdbtPqwzSUNAxV88XJA9O6u/GsYfri500R/zvh1Azq1SYqgqS
 PAbpiLDchpBOInk8pfXSo5KOMUhDNJxRTttT5QU7MQJo
X-Google-Smtp-Source: AK7set/o1+otL/ek1Y1RK1/pOWthJGSgVPZGeRxRxzTqokognrIO1D8ZgP+Ni83r/jFnvL4g3WibaHHu0h+x1OmJR3k=
X-Received: by 2002:a05:6870:a18b:b0:16e:8b95:8548 with SMTP id
 a11-20020a056870a18b00b0016e8b958548mr430386oaf.208.1676650548412; Fri, 17
 Feb 2023 08:15:48 -0800 (PST)
MIME-Version: 1.0
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Fri, 17 Feb 2023 17:15:39 +0100
Message-ID: <CADYjeStG8bZEBprwqez+_3+n-HZ5pG9p8mBySxV+4FU7GM0r3g@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Ql/nHJcqNvHewVDA7BLoYjRVzsK/wRxV9/WYzvHp1So=;
 b=jqJKbSdPXNUzavpBMLEU3iLNhutW5rXo23vRFQIy3QRivR4d904Pkbdk6xj4a3mGcO
 pFiFwUO3v0tC8dFzRLfTUveNuE16+9wP5A//3L/DiYAi7JgIZlYLEE7vMwAvW5dgO5Cj
 +lzQho000hP0iMflQRF3n5PB9uKmm0ec6/SSs3pqwszDNtLIW0s30aa+7a54Z6UYGw8w
 eN6a9QdpyuTVjZSMo3Tnx32NRaVgZgIpD1lHgdzpHns6h9jOZPRr9Z9iILijz/1XB561
 vhVQmb9BuM2TBwAsoiK/FnKlCKLVi9dOiMRazDSCeGtKFnoLv00B5KwkbaaE3zMdrbHe
 Taig==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jqJKbSdP
Subject: [Buildroot] Updating trust store using update-ca-certificates
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
Content-Type: multipart/mixed; boundary="===============6494970827493114117=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6494970827493114117==
Content-Type: multipart/alternative; boundary="00000000000059c47605f4e7a0ee"

--00000000000059c47605f4e7a0ee
Content-Type: text/plain; charset="UTF-8"

Hello,

I am trying to add a custom CA to the trust store. I have copied the CA
file to "/usr/local/share/ca-certificates/" in the rootfs_overlay and also
has a .crt extension. Now after executing "make" the CA is not added to the
trust store in /etc/ssl/certs/ in the target. Anyways it's installed only
in "/usr/local/share/ca-certificates/" in the target. I thought
"update-ca-certificates" will add this during image build.
Can anyone please let me know what is missing here?

Thank you,
Sourabh

--00000000000059c47605f4e7a0ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<br><div><br></div><div>I am trying to add a custom =
CA to the trust store. I have copied the CA file to &quot;/usr/local/share/=
ca-certificates/&quot; in the rootfs_overlay and also has a .crt extension.=
 Now after executing &quot;make&quot; the CA is not added to the trust stor=
e in /etc/ssl/certs/ in the target. Anyways it&#39;s installed only in &quo=
t;/usr/local/share/ca-certificates/&quot; in the target. I thought &quot;up=
date-ca-certificates&quot; will add this during image build.</div><div>Can =
anyone please let me know what is missing here?</div><div><br></div><div>Th=
ank you,</div><div>Sourabh</div></div>

--00000000000059c47605f4e7a0ee--

--===============6494970827493114117==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6494970827493114117==--
