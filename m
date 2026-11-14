Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAD6606A32E
	for <buildroot@archiver.kernel.org>; Sat, 14 Nov 2026 15:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=m5gXPGoh
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5196B81509;
	Sat, 14 Nov 2026 15:40:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V1eD5vLOru2U; Sat, 14 Nov 2026 15:40:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4CCF181324
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794670822;
	b=G2+YRAEqqNKBPSquwR/j9Tk3Yg0aEtBCIrLddLpSjs5aw36CqPPv/+CYbmC8lfFSO/U9
	 lGnRm1vvRCdxVAq+2HSGyYZicqMu0QOSschtvuD/je9PWcy323vevIPt2iWSH+MuSC+c+
	 RQ4yZnav6oM0r2NnzrdVqHGZ/b7JVLZtZTTrWmk1upprLqvZFA3G9l/bNTYygOHdrnqAJ
	 Ui9P4cFVgbiqkblAi+6SAEMMu+S0i0XngRKTBIFRSgBZHshfBi5c079euboCvgyJNVJKR
	 3unNWRJSKXp8eJhqQiK9+UPCBLVx1RQb3KUcX/pVt4fJc5IWct1bkRKDy6VPWyvetVA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794670822;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM2-Signature:Message-Instance:X-UI-Sender-Class:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:UI-OutboundReport:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=6XOARi2wflcqHEAwDZGmPlADg22PBkfiIT0GIlbVnoA=;
	b=rpTn+DjgklNWEbHM+WxN1NldFyWi12PZwiEUZC/z572tQkzung0zZntN4v830TI1+JkH
	 /z+j4goSnKHZ3hB7vYj1kr43Zj+LfbkjgUi/h/djsvO0GfjKfF4oEAWkiHsMnVH1h5YjK
	 UDG9KGwMEEYfqr+Q7DYW9pgBYLVhoWcOzovu3o/1BYtL6eg3fHMSTs+9XEhq1FxCEPxaD
	 gVi9gLOAgJCvWif+iEMTUtShNIFzKGOhaaQOzOMbqMLAeeDGwejQM4Yuq+7M4DM16y0S5
	 NpVOE3UYejs37W9uGyhLuuW/YvU0fLLlrSIOqn4FF9LeF7dmoZUwsHGrpiBMFxaoY0w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794670822;
	bh=6XOARi2wflcqHEAwDZGmPlADg22PBkfiIT0GIlbVnoA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=m5gXPGohg66KHl/xSrInafhUzllyRCs4dvzHp2DKS/yBu6OJsM4KXQ76ftCJ9u4mW
	 QMctN/0eVk54+xzQqSYUH9BkDFQt4dxksyLLK1dhOXgglfPlDu+bXeXs0dcq37qOEP
	 fQYjIbLwF7OKg6qnFGSFBexTf6UxcO2AQa+anhZOtfic5LlwHuDU8zuqVMtUDR/1hK
	 4yVOWV+ZYlZ7IAvjPP4CoqaWxo6uzQV8GHArjG3Hzr25DLF+VW63tvmWJD9A9LPciy
	 ZeqiGsIXOR8KSFgfvkKkRpkEOrdn4HnqmtNhb3Tcp5dALcf1ku6XDySHlSrIMP242z
	 c/hHRQ9x8t2ng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CCF181324;
	Sat, 14 Nov 2026 15:40:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 580D528C
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 15:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 49D8E407E6
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 15:40:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 23_AMXP1RA8s for <buildroot@buildroot.org>;
 Sat, 14 Nov 2026 15:40:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4A2F640794
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4A2F640794
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 15:40:18 +0000 (UTC)
DKIM2-Signature: i=1; m=1; t=1794670816; mf=PGZpb25hLmtsdXRlQGdteC5kZT4=;
 rt=PGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPg==; d=gmx.de;
 s=s31663417:rsa-sha256:Qu+HBDmL2k6c+HY8DGNCwzQJGSqZ
 mvZ+b5/40N2XqyXFnH76SmmJAaZOzUAWAobsJDAQVmIiIdNS3RKSI+f1GBi+HGkjmMHyYgas3P2
 WcQTfz40vd0ciDCsSCnhxYu5/X7CKMHHVGpTNeh6lsM2XuxV6NkQrJPhIvKUj0sJrOSlUc5jDtR
 GYBnpGMoqSYMA7gao1dDWPM7N5UtXie8y+Bv40m/p63EW7PgAXCuvcWlKi5p1An70fcpMQkXseP
 fxMlabjaxr/MrZqFruT0ErVelu2HEfsVjEhlqMQiXqgnYHdYZFlX1M1UlJriqFRqp4wQeR9yqIb
 K0iSJ/uhdk0zCw==;
Message-Instance: m=1; h=sha256: m5GDNTt2a22sOYACarl9kCsa0ajKPuDjz9gXQ3gA3uI=:
 xSo/ylR5FhlkOj5p+57LS2gHYVIy9HBC4RNZ+LqXpxU=, sha512:
 icl8xbbG2mz5lAjZ76asZUWk/vhlYI675jUZLVPAGTJqlBr9Of/3Kve7NuG6zjt3Qa7ivNDE6hJaeap48wcqZg==:
 PBtkH9ox5DpASHc+1IR6EZur8iuWZQAL2c6sZwJkQCrR/ayAcEfcv//IUuSBxXdsB41TfkR8l2xv1M9ZDcHbNA==;
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MPGRz-1x5WzF2IXd-00HzPk; Sat, 14
 Nov 2026 16:40:16 +0100
Message-ID: <ffdeca0a-f9e2-441c-a80d-6f2d2318458a@gmx.de>
Date: Sat, 14 Nov 2026 16:40:15 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Eric Le Bihan <eric.le.bihan.dev@free.fr>
References: <20261113164135.3036282-1-ps.report@gmx.net>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20261113164135.3036282-1-ps.report@gmx.net>
X-Provags-ID: V03:K1:iL3OJU0bNwyWBQhIK97ZdCjWufu54spDL1F9wMjSawHFeGSRDmD
 RjF83G1Y4iiRwX+cGqF/6OW9tkvfupzsB/jPJeuER9mK7qIOCE4uydlSzXS4Xr061QHoEjy
 m0ftz/yXGdB6WBO+mJ3nioaUozNCDeKZROaUWwuzS+Aqr9nzqQc4YK+YP81diK92SzBzxGq
 fAkK2kkXIu4JKzaWC/RVw==
UI-OutboundReport: notjunk:1;M01:P0:Pa3hT5e4dCQ=;Sl97uCn/bDyzTXcqigfHmZhPv30
 +FTsT2JWpT8vSdvQ0G1iYfNMmLT//oRkQMo2Yf4da7kkUe+CWIYPdmwJb0l0EaGRoREAg3/an
 kjsALZPbpxoH7E5kguSu04hmQT5483MDy0KOc6/cDk4o4CDpVfkzj2jYLrtzPnMp1EGSEL2Ds
 01QBFdADsN5cydcvJuiN9VNhGlhogXBp7SmAThwxCDIVnzu5+09kJGI0JDFbWIZLL+VMxU2M8
 5y7MG4LHIxb2XBWpvs7zrxmBQQG53WoAW9aQbGYeF5AEtoBkPXNlxQowHW2xdGb8UU0e390/6
 sBdNezvF20+lq20IOiCUcVL0vfktlBmBJQqiDwGOmnThVNKNwHGDN0fdM/d6ejqq+9K8XUTNA
 FBFuMzR8m+1Obja/Su+PxWg0pmq8atfCLPILcmSvJZkuuWzKwc6iNBe5uhEA/PuEViG09GvGB
 c/gc1jDR1j+E1XbdmLCTYcBzgcd+hD7Q4pocEH1M1dYxUM8NlOKOzLxw8qS8iodyOtoSy4jEH
 O2xxF4BTTg4We8dXk1D69UzDKR3XMzpIx6HBtoh8a4hoGrRxnmhIlwZyTxT5ha6HhyMz9xrBT
 VCXs5Gd9lmjUkM2sAlBOiHgDbu/xNFdCRnZxZR5LfBH6WThs/L07J3oog7szzqK6HJRUG35Kk
 qgWh/oYFYmc2OIeiION5dvTNrA+B9DiwEPHjy2BybBXzX6ME4OyprvQ2FjnyL0kdGXzyqgINl
 4kuy/rvxXx6JUA5d8sGT9xcjC8WlUl1R3hz9sYHQrfeViTVC51SVbn6TK3nLPNiml3+WXwrlD
 7BqIQEuTiTp6eLvnC4HKNZL9gQalXfMFRu38VST//noJ5isgYnmj084FNrTsPmYXCn3fBmWxY
 iO5nCpNtoCajoK5hd5CljiJ5Y6HutzlkxDhQziZ168yWL+4uAgyzqjj4/3HESU8Pa1W3Jt9me
 ayktXK720uIbi40Dg+WT3/aOLddSm1NdOharRotKZFlHyavh/FOno1uDiLjNc3ZeBrtUU/vQy
 I0+RQK9r4G7hvzjMbksUXsWlwgtjSMzrOxsVS3NAyEFvno2bPgRflYHlmYWmZfT40h5FUIFVN
 6LYUTXrb5VsXAJYmv9qV0lFaBLijQCYHtFRWRcO7qpyOD24WKPNZySwd8fxc4ZF9aLmub8aWZ
 cqtPzRCHpRPEmnHVEd3/8O7a6LeQC9sBFL5H/PKWKTT9rjNTgjguM8pSVwyzmULrgfCJ2kqaC
 8UQ7t6XIq1Azzq/YWF4mpR20+VhX4CJv2qTVw6jLP5sIEW9LGXNm3ZugSnkyRP7vTnMlhjQYy
 KXhMTR4kdwCtOO3Y10KsQDP4VERb2JTSVBg82GAcU4Xe8v9/Pfw2XVQwChuXCWugXqTz6ynzv
 pyTGxS2W43CFfJ3BoVIIKtFqLeo3cGjqP1ReEvgHgIRJVwy9QrDUas2yJWDgU2PkMbmo4x5Uz
 1CJFUSMpwux/+G2L405fY/zd70Y3+lyx6Ztl1aHS1uSOFon9tRx1/Y0nLiEyum4w+wmmmXi6P
 /MG8+k2Rqpt7jGgog6gwwiQaC2K0h9XS575E3dKg45eTKqT6mjRR7w/It7cBa5GDLT/iD2UxI
 ZqdiI2QzAtXF9XH88osbIF53jLueZO6NgvA8o7O2MxY+LIIsLn9iH0VyN7OC/Axy5vl95WVL0
 EsUCCn8DfxcUB9xs7I9s517jh9l0Lea2IcbHiTP172Nuf4IIrDwcsLVMEALtWnnA9uvd2l5Dj
 W+0YWPFODNx1sUPH9odBXam8C3gnipQ59nJKPS7AQyiTW4NFhmnz/KGOBLF+jWxVYotvMJsEZ
 7KAakvnJn8w4IurSp3GrQ5KM4zG6QLvaKvgsEQR5NhAhIISak2ADhUDnTsiwYinJZ1luMjlsz
 23LWmtUneQ5Uav4tgDUN8BH8oJ3Cy+wM3Eue20095/PtbeBfsUAclRaXkEUPhC3w49MOkRhru
 FXlxKzQ5r0iDCrqt1ue3u9NC1aTz3ZCYG+NqOUuXdVu0gs2hsyYXn4WC1JmXCAoNSGiLYUu0C
 qSkhkCRH1VYnd07b5Wu8CisrF6b/y3AFy9xxaluGBIdxlLlqd8XVLN6Xt+x0GD38YQWVZvsRh
 DdE2ukhrRsFEqsO8e0R6uwJETQEhPUZ2Dugv7u8OHA36ylparIBfUE3C/m3oWG4NBoKjaaJ5s
 i2UfbJWPSq87wCqhNWiu0NOJipk4S0QZm5cEdCVTK1DvO+Ka6TQtR43q0Ij9zFEKRSnIE4/Nt
 Zv7kPVTOeZ963bHtJG4JD8G6ZrA+zcoUn+3ww0klfe9BVcxip+jXHXmFkI7CmN+Gf275frTpO
 gIAkThxeAJ0hVrVL5DPB9QrDjfDmqjUilFtEygf29OKELneT7NuLWNN/OkqS5pnp7h7K5zslQ
 ftXOC/MmDZ8FQikVHlxq4Ggx3QMPu+61BzBZDT/GX7MoWz0DWQ0DXkD1IDt2XAH56AAUp9LvN
 quSMnfbOdCRfZ1XBv45yb//ZX0QdTnVeN10s1yhTQazEC+ggDfB8+Nk/YJ5j5MGgD64XfGlaO
 E61YJCfg6zv+V8CJGKfPQbhLvaGYS20dMwyKcHbATaBRHHJ9Tw8wGV+i8vYlJZ1dk3NuV48ZJ
 bc2tyimXJayEo+to8DFubvJCUEYQwxDoyFBhzNZ3bsAWUtDILMtZfb/WhMyp4kG39i6fCG0WO
 Cg6qXKgpxlNbKUrlF5Ova7W58FOEAB+Yg37ncqOesCPMrKWkJM1saaF2B05tuoSkOgR5APMmh
 U0oXg731T+XemPcrHYaWFyQGRqi7CLntfPVjN42sy5rP4bL+8t+9I5dkngAjalC4k4+wrEebx
 Vci/GUkwojhs4q+Snh7FELVCTEp5yk3xfEp5xvxTuJUQpr/uJVn4f+WVmosi7NvJiAk7DKwSh
 z1XkGFlJ6WRWS7RhSBxgkGoYNQ3VeUgIDaAgrgJainZTtyBFpSLYk5T0qFr1O1mc8cu2plmNf
 nX8b3IULti0g4z1mWqK4GVsHinAzA+KKH60m9ZrsHTfbG5pnPJE3ZGi/Y5gR3Jjznau1aoexc
 2lSNGccemEraFUqMyctpLXsfUx6p2S23SfYrncDZxbnGLk1/P56qhbHQL+V2bPtKI+LoS6q1a
 bXhaY65iXGFagX5BlQx1rAM7RKywWRUVrd18Wbds/FWqpo0ignkX6bKDLbXFadDuDlpRkG7oc
 dbiYQGAPsRoVaFxcEL608Z/m19UqwcPkhL7joTDoWF1/iqQXLWhM7jYLMR/THEwzaxEhJ4eXx
 fGL7r0S6aFTmK4IT2QGcuWVzhsIwNdlCSjGPOuQJOwR3nVKaxW7+4j+h1ei4WNqQZmXwLVZZV
 oReBGcWTO25DonuItIkbc1qHeabTguTiSUVxTpBWLP2InWqURsDSpH2pNxM3MnnMXYzkEu06K
 PJw29q4R89VDCcu3+xRjXT9gCX6WOvWQ4N+sSX9fLneBYAOpig3iB//nE2yprf5szJjGG5zUv
 kf+2QjVyjxQBbcHmQIjHPitHNVO0HMEvHH7GsL4R91d7NWLJmQ8RY09Q2S71ZUIuuhTfQZbph
 EihIfdkNnp3C29V2UyRtRjoaxL1upFfldckoE9EhbtZwG6w+kZv+hUuP/ifIpWBj+czzQsbco
 M19vlR8GJpgYuf3Mmt549bLAiEhNZOP/O4XBbD/O/z6NsV96466cRg11LRmJ3qU9XaxPZtm74
 I8dBmISOQ8UgiH/9oLxI2d415pLDI7GvLZ9DkNGKFUUDFcz4i49UC8UKjusixs7Dkao6OkVrh
 fE6Vckt3vE/qrvyRRlm/KLwiN6qBvaJeZwLczQOKfhQuggMXvKJkq3d/ycZ0ustTuWFTxTFmy
 2xjYl0rqCboDxmfOcrTcsRk6gCH6GfjW9IiQ42lRQy/9EzM0GUsSqbhgaMWf34Xn3EkiskAni
 uefDPG5W7s/VcFWckzl0zUD0DLGV9OOoDpwr5G0RgmqPonVnWY/ObHjOy3honS6glEsCBUgut
 +uAesNZ0wXEawoar0LDgdilwz4ONNdVurth6ibY0DEpSmkNPAwBcPi/Auv0KDPrttxtUBEw3J
 3ov/YA2WEEZC85NCdshY2TO1dU9IxHTJV/np69CgkUGwJbTu6cmXQLfJNelPlMqN+8yJtYDCN
 lXmqi2jO7H8Q2egqZN8mV6Yo2oUrPwca6b3kKjo9R5RdZ2HYypRkt30d6m6RelfAN3Be3O9XF
 Sjp9snUcif7T2DYSgtah3ys3pLrP5qBqO53Jy3vE687LX5GmurDZ9yua0SzhXX8qn0UWLXrT9
 DJ3K2JHzDHzcT0NTSVKFwwj/n8pTRPSV/rG8u3uYy8kmVDYEw7n5FSjQ4SPAq8pyLNAd2Tg1q
 4bV94iCMACfx8Q6tbPFRRsdr9qAvJMzCGf0lLjLhj21l44lmiA6oIczq1gd8eFUphI8QmxoSB
 pJwdBsiURaBLe7FLrxN8Utgph+Y+SXuoYephruv8f7En6TZEX0l5VCa938A7laHfDFwlNVyyv
 81QTq6cGIXlIVmgutIac5QKQICHOqoSklLD8Y/uoUUvTbzcv/iy39/egbxOnUa5bQUeIZ9DXV
 6HxsxXrZ1frCUdXiv3Ny4JMCjxhHs4J+VN9S2v4dc7eC5NHPMetsdhFwCTQEQfXkA8XWvApTS
 kYp5T+XV7J8Ise7YXC3Zzx3IwmwjxyOJx5+EbGYjD2L0dxsxduWNiaNsGTySQEqSz2aOJfN74
 ot+7ftnzK3E7n+Wj4U0D4GsOcR6vGybx1QCUMwbfHtOV3SN5n053KfNYr8q46GDDLTUyY1FlM
 VeRPdr3jDDDwODDO7E4d44Zka41Ic+PxM2zpgNOBZn0E2rvybKlUYgHscQO899jozLPM9z10D
 dcf24CJA0DNX1fNjdItprWmMRGU0cQFwAvk3WG60iLQwlyv9UkNfjVvTIIrcNm2r8aT5UA/0t
 p+bLfptEr1YD3w++eGBr/0q1Lsc6TvTDG1+PHwVN977+tuVfD7AdkmDn5dBUJsbOfFZ4H4teE
 rm5/iHbziMVcGHZqFnHj/+JT2giNbw5xRjv6iQTH4UBJ2R15LUwmsiRhRc6kD8L0vmyIo1e0y
 M7QHxQoub6jpFnbV06+RMRpUmHSvbhV25YajbxLhBdnEvlLcthsGTPNwF2hyVZxXT47JMnKoe
 TJrP+xHZLxXV8FmMslj1k+UcWDE9KfU/vrO19HagqKSd0ekAY7mANfgecqYkshA91/bQNoe2C
 jURJdyP9otYo+mYrkFmHNCY5KNIixP2XHGLIqZAOtNcrZTiM2om7Zs9h8H0b7/dSm6YZomS+L
 gjo5QYXgj7eng9puYVtFyBOR0R1aGQk7qtvqurJmP5ZP1yOz389w8RLyy4hoM25tJcZ7VZr2Y
 KMjooEFsyPS0MmGhauF2Wm+a2DvwVXw4SQUrR+5cnkkT+H2v/2zxuI1I6gZLKzTmcIANqd0b/
 LUtbnbUieL5j3RihmuB4TAp/eFkrvV8agOKLKTRceMHRJTABZcSpaQcclPtgYCKyq/cFd5Z8u
 Wx85pCKup4kOd3nC8fTjl8t0rprj82sm/knkRcNeFJP9gu0zmgmea9ccTNtXdbkhPynsLeQwC
 Tu1AE4vQRomWIf4yBMf2ZT0Qz+UgLowyJezpNXvcvKhSePxZkJWj/r7zvqJlFye+johHqqS4i
 FYwrxdjqRRCO76pGVGOrtUs4aY5Da9GpoVrON6ZgVEof3lxVHYz7LfPq9k1oFBbuAGdkexMLC
 JhjZqxKZ3acKmp9/NAlbcQB6tXVZ5xQKE9DbFdFknLRjaCexHeDMEYT9Ljv9LWC3dwMQwa2bF
 7jPOJ546Jc16dvYU5Aux5NaopdER/VEsCSXCZup8CiB1YVb4nNVQ6FbUJ0S0oIKVgf9as8yLa
 RROzMsvPTHMX7wMQLEyWtfsHSXlJh20r1RBd4iRokLQtxoBTHA0yt+3ZQo9WAxV8kZzmKaxO/
 O2Cm72x16zkpFDuPnQ5xgX6S2V33mGtwkG0FdNjcrD8MFPkJFp3QBnh0DNYzXr9f2M4IcZuuT
 UacMR9iHoOxegY6PUEZdMUn4v4AGT9b6sU6vsjuNrdWTocQOOXUsxQkREPb6H+Y/AfnHgNrKw
 JmNcGoMKP3MmIGTUz8a/XOpFZk4htaf9PJr2xqDeOVD1Sc96n7EWf8TfDYhQi20yYvmLWWY/F
 2hYIO3P8dpe71osdllvWfNgsUClvV1at6RtTQXzTiYgCNivCrUol3bsGLaSPMg8bziXM+atHn
 GlbA+q9a1ThK1n6ILJlIEqJGm4t2REFAveowyNaVyReMo05zSmp6JdgML91ODJGzxXQwhiLW+
 +Z9q3UAGXSc81MUmsuTrzITF8LBVK0YNI7qUpCcb/6/0+uiZKxSph3UWbftlOXTMta2e+nDBS
 hRMs8OdzSEA/5eNo/wvIHnAFn3rxlivY82gzvNKs5iGS7kpCol4bBu35oIBNBdmKkt1JzZrSF
 0zJxtsUklZX74UicgxsiNpEQc/0H/Dpd3NZe3PSppmA+Iui5HmWm59jSf6si7bDGfOjwzyKKh
 u3VK6rL7iuadnJ5J3G0wmIQHuVsUr6nqV2aocrUy9QdodlCH72akNO9zbY24pmjP9quprc2u8
 k0orLwsY4RPtdjEDC3u0AYaeavm5BvbaLK1CI5lVmjP4VVEhSa7mdtFcWflz/5wto0LVTEjkR
 4lna7xebNUbIfkKB4IOZGS4o23pw++QfQAwOBzGFCXDqk1S30UbVSWQZ98w/RnQBvtvq2ksCA
 G0E5O3WrG3hOagbmBfZnd+O5N6hU5HkaM9LkE2rEVcVN2vG8v6xoDpz5tG9gI+GYBMyUeShT+
 iLeBXi9AY/3ZyFAeXHxs63LA1w/RA70hMUniSU6pmZF0vMEkj/NHet8z0WDl78gwsms7i0gtB
 mdGxX/v+vARJIe9lsPEDJGypxy0DZo0RLy/H6E64DfIcLxyTeqr4qDSUnn0K+oBNEf9JGG3/1
 OfThZrNRL78gO5lKdxaMIdOVl9ocB91EYrUHaOTS/Ch/PMV2kIG+sMsLj2mT68s72sSYjERNW
 MKP7XdXOUfz9oICWEoXySg0XmLpU/AUqYS2ttF324pcnR60G7CsCXExK856zB4nxJvXyAbq2z
 iTVLsFYkg==
Subject: Re: [Buildroot] [PATCH v1] package/eudev: bump version to 3.3.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-22.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Peter,

thanks for the patch!

Am 13.11.26 um 17:41 schrieb Peter Seiderer via buildroot:
> - bump version to 3.3.0 (for details see [1] and [2])
> 
> [1] https://github.com/eudev-project/eudev/releases/tag/v3.3.0
> [2] https://github.com/eudev-project/eudev/blob/v3.3.0/NEWS.md

The release notes point out the newly required "clock" group. That is 
currently created only by package/systemd, it should be moved to 
package/udev (like other groups used by multiple udev providers) in a 
patch before the update. It should also be mentioned in the commit 
message, depending on how /etc is managed people might e.g. need to 
create the group on update.

Of the new config options I think at least --disable-tpm2 should be set 
(or its --enable counterpart) depending on whether dependencies are 
selected (and if enabled, those added to EUDEV_DEPENDENCIES). It should 
be disabled for host-eudev, as far as I can see host-eudev is only used 
to build the hwdb.

Best regards,
Fiona

> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Notes:
>   - This version bump increases the target install size from 11.8 MB to
>     14.9 MB (according to graph-size). See following (uncomplete) list of
>     installed file size values:
> 
>     eudev-3.2.15                        eudev-3.3.0
> 
>     /lib/libudev.so.1.6.4  199K         /lib/libudev.so.1.7.15  339K
>     /sbin/udevd            435K         /sbin/udevd             927K
>     /usr/bin/udevadm       459K         /usr/bin/udevadm        979K
>                                         /usr/bin/systemd-hwdb   879K
>     /lib/udev/scsi_id      139K         /lib/udev/scsi_id       275K
>     /lib/udev/cdrom_id     139K         /lib/udev/cdrom_id      271K
> ---
>   package/eudev/eudev.hash | 2 +-
>   package/eudev/eudev.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/eudev/eudev.hash b/package/eudev/eudev.hash
> index 0e24957621..58aa19b695 100644
> --- a/package/eudev/eudev.hash
> +++ b/package/eudev/eudev.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  eb69809fc0d1187f2463ab2149c53aa9f42a78e59f14ebea68eae6cb6b4fc1c3  eudev-3.2.15.tar.gz
> +sha256  8fba6e4f49ea4b1938828a3c2e7cc48874816c68621386e527076b6477f5d6ef  eudev-3.3.0.tar.gz
>   sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
> diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
> index 0deb0e53c6..21b5c5100f 100644
> --- a/package/eudev/eudev.mk
> +++ b/package/eudev/eudev.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -EUDEV_VERSION = 3.2.15
> +EUDEV_VERSION = 3.3.0
>   EUDEV_SITE = https://github.com/eudev-project/eudev/releases/download/v$(EUDEV_VERSION)
>   EUDEV_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
>   EUDEV_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
