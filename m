Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AB4606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 21:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=f8fnC9xA
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF52C60613;
	Sun, 25 Oct 2026 21:21:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KYIiaIpHVYyl; Sun, 25 Oct 2026 21:21:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 18A3060635
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792963308;
	b=g0C2CVoz6/bGtxTA/ErjSvfufD3yyLsNQ98yVVWhedXSeP62Ixv0kczfLLz1U3DCDbVe
	 qL3CqAGmnHRjNO5mpAbTf/PAzhPjof76R2yNwPKr14CPBg2ptYpgUR2scWkJ58O1nWc/W
	 ZA7bVhq7T4j0T1Tbm9QtioshU8qTtK1/MiXyg6j4jOiTgeOFa0piuIZI22Gut6a9GhkxD
	 Zm17ZIhIdElI50aVu2lrhHffaohs5Q/yzE73NyljiUle+m9stRbYyvhASHXL/iBGaLNSM
	 qf5vpED4IjloEzRRB5HXdY1VIFeB7c/jVJPKbvbzFqy+2SAq2Vpo39+bDqDcSBDnkDQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792963308;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=BphCKUDDqMJafRYo2nZz9uvl9Incs805n18Qx4VsCKo=;
	b=YiApHbtw5wVoI3MCCcjoJQaEDkbcmIzAOJewXcLHpcPN3mL7Yg+TwoVIisKz0+hghZhn
	 gSTtPckCvvcuHOQ8X9ij23h70HySNQs0JjGPL74CvS+y8JtU9tls1QGdy7jiN+iuEk823
	 zRz0SXjBJDfrqcrKFqOZJtxeY1Q1R3TYAQbEQzvEuwFfEQ1j8NNs9n+Tj7kY4h6I2d6iN
	 XHEiY+jPxEVIFSUCT38pwbyNm3zf5Ppv/6XStogW9bRg6E33vHwwrqKo1w7RZLolZjOeo
	 2rSpc5/12LUO+B/671BBOH/rQNxobECVIzXsePobzz/3/vbetFKsMRCxPeu2AgB193g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792963308;
	bh=BphCKUDDqMJafRYo2nZz9uvl9Incs805n18Qx4VsCKo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=f8fnC9xAop7RxjL4LYxcFrVg5JCtUW1L7cZNf6oqY5NctNXy+KeDVylfOBT22jBXQ
	 ch//UzAZ8vDzOsu9bQM6EZ5MjYEvJdmPCDu3m2ur+QXkXw933GLwVEs8bl7XvrWNT3
	 X1eoM5MhLmc5CPzffP/M5UWU+ofgncEmrY1DJ8UiWO7ICKnfQrGX2RxeDcqO2Ie7aq
	 qK+uUaXaR2Oa+9fPwK7vNhAk+eyc0VRwEaSNKgasZKYEbrTGwpcLxugr+YBLi4NWIc
	 a2nTUMkAeD/lQxGFeHolDuPO4OXCMMlPZzI/cSgpsbBrui69NbXTG6P5Q+tM/IRi3i
	 phdLM+kZE/QeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18A3060635;
	Sun, 25 Oct 2026 21:21:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E95D279
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 543F080D32
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:21:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QR4JC1-iIsIL for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 21:21:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 30B2580D39
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792963304;
 b=NwVcTGWNahOZA2li/RaeYPGYJAQmpwPc5B71uOdUNqJ8skrnj3H3UXdY3jQ+11pqIZ2h
 YStiMsfFcUXTbV0YnZflfNPiD4PqBmTu0cT6mQjCUmjMxgWRIzbMDZttPir9R8FGdO5yn
 6NITQbcpkQgamuw/y98kSrK2C2log9LqbHSTRZlleJibtV9epdHxh0Mx/VoXE8mT07nve
 n2OoH9K8bq7xJqxxY/bfQyoY4N/A0A5AK1mbk5TtQkeYEQFYgRkTuIQBnU5lsC3xOtSBL
 kr15WUYum1wg7ptiykIpXgBAcMNeBc+fmV/6KptqZI3Af9Rou3Eir/5UQOlQn+4U2/w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792963304;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=Pz6KEoCt1J+7umW/z1oVf1mCH/ykfOSAKLOSQcH9ffk=;
 b=Al6MxJzDnq0aGmZWgRvmOqZx3KM7HBA/6vMCtSEOc3NJOM2R4lBTrp/iwkw8ai1u2y0J
 y2CBNtvTS4wFLc80+dd+QDYRaYemTAPAG9lKb+D4Q/KvNftzT0b9TklsTzSrqGYTPow2i
 Mj7GYbI97UDcGeWNcL/E/6CcKRMTnkWLKBpip5AQsNC44J/tZPpo9xUPnU+kSbEXCzhje
 oiJ31JhD6Sl+SQegCd8nBTUJIn+C7T4qKVRrtb6jfsj4s9yfpm2HALwIbQH7cr62mO2NB
 JBBCiaf1XOXF4qhlYDdHGtZekXsVlEa/5x16CZpBIm609DFyEibC5tF/vcrWJmkk3bQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=QbiM11JO; 
 arc=none smtp.remote-ip=212.227.17.22
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 30B2580D39
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:21:43 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MBUqF-1xQIBO1HWp-004oHm; Sun, 25
 Oct 2026 22:21:41 +0100
To: buildroot@buildroot.org
Cc: Meena Murthy <meena.murthy@amarulasolutions.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fiona Klute <fiona.klute@gmx.de>
Date: Sun, 25 Oct 2026 22:21:23 +0100
Message-ID: <20261025212123.4106996-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261025212123.4106996-1-fiona.klute@gmx.de>
References: <20261025212123.4106996-1-fiona.klute@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:uo5PwMXrFoBeBrrlZhnOmuCA5lSrm6qztb92/doQHevEDuMiA0O
 i5MUL7tEy6pan+ohZ41rwADRJg5u+JRpbskVumgJ2aEXUQZTaMG3A3QnxBadQ3qrFFIo7uQ
 1qr+zED3yB9pe0anOsb2AfdAxOvh4Y8KNC2Of5eNcXSN/ehtauO8l6Lj3pggIFeNkkd2yYs
 XCzFHacooXbXBgnoi81Bw==
UI-OutboundReport: notjunk:1;M01:P0:db93DGHOYDc=;mIAQJL+JKFTZdIRgiEeGyjUxIbK
 yn4nhJ4Lh9ogsuV3U5saUYmBZQB51vynP/K7uvRmMyLUG4nXekgPfpePfsHrX7pq3UzotFo3y
 5a4zs2d4/4FOhpcP5QAu8JTpIXu21Ev8KYjqPtpE0mEGJbt/ceF9YXbY/SKFEnI9m3VSMW/dp
 7XFc+1zgq9/Yh13aiFgKuL+wB3XmDBleVsQOGoe3gHrmBmPdU/p9v12SPbAM72YJh/JeWGqIJ
 F4U1bYLm2hapIF+TNqKVDQxosdclsJyN5CjM9F1bu8Z7a0QMbSQ8z3rklV8wz+KnDZLx2mfWh
 h7VTyJ8Syb3inDuNLOKFw/qYIzB1CUgVoDIome7GtVGVqBksODxWIIRCflRVEp2s/wAm1SfwT
 usB/oA4E15wF65unXhtPympC+HKX7uI3eLZZiNaL5+I5pK2+Bl99IEyDja1ByQQStWrmtShHB
 /GWR1Y87KPS3vrWFo8zfjzdkPwFf8c1qgG+MpJDD1gdxRP+7VXwAEOfIxr49rbBgfwNeOleNG
 oTTPmjlm7+Gxgmb/yy12yYalIO0pDBRQ/cVPql7An6N2Yf3ozaLIXWpvmMYClASiCJLwbya7I
 uODPNb5rlsgUH2odTJZzwQ3FeGFwuTMvKy3ckpJYw9E6psY3qGu8aBZE0rDYG4iF41N5umAJk
 z+S3w5f34jKOnhmD7GikX3ugn1vOeGTYXcd0kE+HjayINvfiAQRozk5KN1dKrg3UJZ3VaQMOD
 UGPqDsPSwqOQ6+C0zfjlVBm0Gs4jJAVGDsC0aYBgaQmEYgQ7w41YvDC8hxF6ESbvGsvuonZ3V
 VqnReMm7NQ0VVBhKuAInUxqBEZTZLUzKII/pNk8o/fwkrW7CaFNZt4BxJOWfmyJvicCo8iQb7
 7MmT6htjOUW8ZCrRwmf3U05Eft7TMZbqZZcINxesCdJJzkTfep8DizL10bQ/KmadN7Up9R7fw
 /ds9tyCnCL23oGmaR//V+eMcXsfhh4nlZh3B5fC5Ebj95mmdKNIQFqoxxiK1skJnMGVbDiTeQ
 udP9n66dXMppyGSzGiM0JDtBTABepIYPR/0A/WDkfawHEiEgaPEzxsa3KVdflcCECKA9BJxW3
 69kshZr0tUQqk9WgbURJb8PaVN0whTA1dHqhYoQXpMoR/XUZJrMvv5hGQ5EZF7U87D6DRVGkm
 IsvuZRrJIwPJ1ImlaJINqot+Fz7q72e5D+jrf2oInIIfcI/KZhCovuZ0faBBonloIEr+++/ng
 WczDO9EVAmk7yeRyfQ3+2djjzoqUOWQs3Y1c2BgdCR/bjpxvbuOMxStS/qXLa22Vt8u4FWqei
 xwuC5Af2hQhtZ18QBT/EcQCg3EOAYWKuso7v6UmH1N88Hq9AvpPt4negvvSXHY0YK4yhtYNQN
 2yrTeNxOy7F/JVM3rC1To4rk2IpNQ2co6LXXlvAEDckxHKIyTcH4R+0xyRA0Jx1AvjR7HCtYW
 IGWkSLuRjriAE48ZoEGeUKu20RpPnANlWIV8zqMdY45w04mwYn1CefOnSZUhS6F/aJ+6rOK6o
 qjRUP7WIXn/0w8Bl0vvrCGnIaT9jhYRVMEzciert7ibsLzycewWR/ZjNkFVWAJB+GSjleNgsU
 2xaMGr84L2XOuH5nzBIPzoocAdunPWSlwGHAzWOebC1lINx97+F/EivBLV5s1xKtxpNBROiL1
 WA59BHe74ol8JF6TDMeYGM5fwiHn1W/4pZlQVScSKzxQZJ995xnSpgZMugG36UZJciUYDtdEr
 fHwb/enNt54IFg2nYl+cs80XlkNVmoEbQ3+Pm/a5ne3PuUSqXAGj6jEHZvgYYIglsmxXUj9Yq
 LzHpCXGV4BbLA+G8IcEI9P2rRWltzlEsKSIV4YBjZZcuryCvbwSgjfYu+qc8doPqJ9iicYhQu
 dfKbZ8MPYFBYpNq4VK9v855bR+cP+W7fkxdLatVA1ktTjioM17SONsA/tzWFgRkiBp9b6moH9
 IpraNp0ycA3JRL4pi3qFP09yxGKpPWuVxy9zb/ngIqDFzoRqGIUFA1GXhvQY99UQCG0wST+PB
 saeV0GFjAYzM/P3hzXopG7bE+xnAdmDP6v9xmKS2zEPRljUSFGA5NltxAIIotDGmlPZ/1DIF5
 4lvvVsVJQb7+c+2LEy3LOEofMpP3juBcUKF25ZGEDIfM3gRrDeFL/nGYI9ius+GajbUJrzZYT
 gVJKB/RBSuLG9UgQGHP8JEblOL2vQQ6WN96ginlO2LtFDy85CfA70f21XU66H8Kjdlly2UgQE
 qp5y5yZar+YMAVCzmB4ck4hOW62ja4m5i8j2+N+V5akWpZqaoVFboHHATstJ5XcMtFd4iR5UX
 n9VbRuyaPGDT0dx8UrzlPx7QJuyGDyQ6Ybe2WbO0TCGrtAIiEY6jHSvZdV7xgkAoJ8/4u72ZI
 wq+D57PEVDYlpkmAySICj+Uu3GnYgbUgY1dicw2jGqd3ylPAUoY2g2ExGipwJc9+j0gqUtN56
 Yu+BVSxCAG8PzaqBSnaopIf2rCIsa1RwOl112YFjuDcqlx1dnLW/EM+lkHDq8m2uhd4K1FNUv
 VTS8hmZFDr7DcCFvmnS+EELQh8c6/XynrSxHL7HWleJpJkUthwhLRxShaip+8UHm9wCOl4dAx
 6Ji5wnMzXwlNp0d0wIpQVfYuNKitqIWDI1SJUFWo6CZQsES9C5Ayy0+6VJZwmTCJC/hT7U4+C
 VTu9IfAX61V/QWEULbELATomoEEPmFQhM495mgrTjOg71fi26pBMw8pvDI9xZTdKmWD4a7sde
 VclXkM7HnZztHSyNJLJHJ6j8NX4Cz9A26nXALfEauKNau869xMSkxY/Gk8g3NgIy0sR0HE5xk
 xwNNhy0WGJqcVQ/c6579+9S4tsliYim2gSc7FZxkrzZp86QDpT6jRh0X63C1GTpTsKx+ZM3CG
 6GNH0pOcWyeMgZ/N2a9FX8sC4AR+IPcNNIplW+gc9LRlMyEj3gYQkRfZ7iwaMBSMM1cjWW1Zw
 0EQ2c9YcGZe+AkqlHFYB17iLPb0EiPGjko/A2O6GZx8lqymZAfIkTflNN7M3ck0OZuXHniwOT
 oYtOV4hYUyrApyUowUT2z9wY5j+d/1bIr1YMxAXpgY/L4qnPW8AyW4QMttb0ulfJwjJX2fBL1
 8z8zeJc4NZ+Njqh8KFvH4YXPoUg+DaPCyMIryqUcmIRPfAdwXIumxDJBC4OMUQogWBBj5oeKU
 9btH9iK/MpyTbGmV+2KVRkzlpk88ATwYWOAatpaTfBJxdtZnmm0yzqUrQbOkD5QMm0V5xWSkP
 gijrtkVO0dBXd9FIwviAff5xNlUHkCW5ZzjRP4LkRJ9hJ80WCbq+39KiMihua2vFlTcMxcVhx
 P4PWerWuYtVTX2SXAbFKCHV7zi2T32vCStSdVl0Q6wpUTlXpdOHROh4SKDB6wLQGvNvH9aipF
 7HKY4uQ3yIZGNr+0nAdiuuI58j50EWqJOdpgvCMZlchH2gjJwkwjWvPJ05PZqBTWwe3MWRJXF
 5PNa0NPVD1AitfY8oZ9165tNYaBDRnRNweOdnrtl+RGerPo8D2Y9p/l6lGaa3Rwse8dFA6IAM
 PLZq8tw0+0zxMRE420UjTzOr5AVKl+1p7Kqs1Q3w0lgm2/TEYcpo5qVSZNcI8E3ie4IdXGnAM
 xnue3Q4rVVeIy91JscSlb8B4eH8KXBDGnRhAp1n2WfC9vxj14mZrZdOkQryJyBhz7iTxgQq8A
 5D/ZSOtd4GbxIFAbbgkVAZ6m/oqYPyovk5o2YgZ1mKpKxrgyrwgrEz344Kwbx74Q96hzJu/gk
 m1Vq8wOFeEj8woj0XkvrbaUU1c2lVSrZyKAWSHoeLY7ArvdZhUJktch+RgsO0RSBcjkhxdMVP
 ticDVGFWFg4P6o7ohz9yVTmlEXUaPoZnnfxNzbUlzgBlmrvCGBaJnE1Ebel11r2VYQYyOyvh0
 gKOI6pRSHuliPZgl+PcxiqnxC/MyiJHKFu20qrbOBhe/spJe8Hwx/8pC8XDr4ZdlN1akH9ftD
 VR2rYI69Asbpcud0oE8NcSvtMNtOp5qKPjEThtFgveWZwYrnW+jSWtnNDD/OM9IAC+wDLVI6P
 6h6NdfkX5KmOZoe1jF/okfUXcdOx09ejc1vtdzlJwdSX6D+uX21w8nquz3SiJ3uatc/O5pugc
 uiUn+RAXObd6JWi4dDZVhR0IXN7jbyZhWSaYSNZZJNEEfzaQfmBIIMt30rL0sshsnC8Wx9EqV
 MbpFoWebveIzyUra45yAqlHvdqLSOp2/9OrhReX7m0jf5XTJdjw/0eewOoiRnRf0ItJeZG5xN
 Y/x2o8WBtPEimRouD1uvIuDtvbaeiRl/Di88Lad33WwvkRz7l+wirWM2Z1tn6BMVz2ShvPa6c
 uPLB0JMLy7UyPLfr6o6Xo6wnrO928hqaTGX1ChLiLXzlVAgvmlHg7wvsr2ESYAyxNKf477AUi
 YeW65vABQnM03rmumDmz1F9Y5paUcV4kJ1iAGcfGDb0d8XayZgByMzBueLKTN6tIymyAYGCkS
 g3eBWrNmZ6L2ivvEF/k4gitX7FhSwqNaw1Zwj+TKNYuFS8wwuFvKmVFdvYX3URaVXqgZpxcvk
 q/frWHMxjqP3+GjoHXTSdr08KIsZu7aSLlz6KNQxcA4ChaeRG+Rn9uO7GnhXgnTMqGVAuRibu
 2k/iG0U2kgBL0BnArYNrv34kyAdoJtm4C4zs66k/A8E1HRMVw+XaZk4MxdRmU3ddkykUfK5xY
 47ZqCuTXrRRDjHC6uHVtNLRG3eHBll3ffKp3Ojzh7OH7UmvciBKD9ffpuSEZEo8b1ZwccY5um
 FWDbqqhIL8FtNaf48ceaxdjHpRlBVb6O8ihBqnAs0VAStkK7ocD7qsoDLdYdcxY8/cQcdVlz4
 SZLGOOdK4LmGxhfpZ1Ot44hajDHeCs9SHGsMO88AcHjehMzJrgPU7PytR4sNNabqz9qwlaCwv
 bvKrj831t+OYFx3M48XnV170z3QIwYnJ3bBHqaqryXaJWElHktcCQLgS9bxHtQk7HsBjbwMrQ
 aeRKVOlGJNuLx/F+zFcuE17VawwNtSxegGLF9hKFazGU3T15qq3NVS8bqFrmCdSIjoPLpTaVi
 1/QDOQZ3GI7BKRwuADfv7zJUxbkhwv9WPrvNQVjRTRmpESRK5mWzphKObKokrkF4dLcBy8kaJ
 LdcQGhoy6mR0sQSkaJXYCdcMZhdKomByKweQCUSMyxeVkjgzGV1oG5Zs3fRGMD+Y6tKZERb3K
 VMhuhAh5YQhj4KMIDT+VwO97IndUJHlU2ZegY4kYg5BJKosfmu2kTeiUFKI/GmtV4NOLmQcE5
 LS4eHGEN0VITOlTUXT+0c6o/12cjhbcVb5sRfnM8YhWRlbbUyr3YiOgVJkkASu398ozVQ1eXF
 nDHti32aYAJ/944QpdOSpNA0Fx09BGvkroGU58ksL9JWthT8xv9oe7dTDoiO8wwlqxgE+BJgh
 aq8N9jWsuAS7Tm8z2XStj6jJl/XbyZx5tUnTEB2OJzIJifrhNRqgCv87uIDuCGaKi7jVHVmel
 W9Td9rZ1/0vRpVyWXyiZkNzJVz/hjABq3ZUTHOsAZMITLtvD+1Sj6dn51M2Ssm8d54/hG/tT7
 tAOZjbtasGjbwdXlvmT2L5O+32MP6AxcY1j/PLwoA7cIBw1JYyIaNuB1AZexGBd6ioHtJWw9F
 A/kNYaMIJMSBhIhtgKHcl4m3RFWcMwXMLSmZReBsiUbfpECCdarwXJqHABsa+bbhNM4WY1LEf
 QnpHcfouD0sJrLq62r9AIOQzLxRSLFy2jqVNx7rw57HvH+xIj3T6VkZloXIEKKg+Nz+a647Hh
 msdUmpvpJpv6KtrQTirfCu8LU1A/U/5hN9FQx6zy8dXnyan0TT8o82WxOLtFFLlownUdc4scp
 fII1MH75LZKYJvbSjJr45Okrf7iYaqiaXdlL5hT1n3mrLxyRCtK8VpOzRHKmTh1Wt65qP1CZ+
 b46dBxaZ5UU2HYqv3r38X1NJwoMhUXlNYANvd2ei9nRI6WP6b1BFZ4/yznfd0nUmtcKQlKyNw
 OYPhnDHzRU52N2MS75Z4a94W1r+tNUbLe6P1B8zxToy1QT4OYDMtQfwyxLvsfB1/zr94zDst4
 Qu86DK8yGHWTF7B90uwdy+JNqucpNrj/+4ZQqSeLz7Mrnl4fakdYgrKQyFkVKrYEkdYBb100U
 /DHPOp4zuaM+2aCFLaSy8R1zktYpiQsuxOjfKsK+lMj6SQJ/sbZYomK9Fljb5xG85iz88X2a5
 vlWcF8rgaTAyMRiM+NEqwThDZ6shJHW3CygIqh8i7kBnY8ZVsRDSH8GEqHV2v6YSBKzPKL/eY
 Qk2A2YZC5xCqb+vMaXlqg+zQXmqMT53f/hN2AGAe43XWNisA3mz28Qaf27lUwZdrSsaiGOFrb
 JNJuvDoiZei79zWQeolujxPu2HZAsQF7dZ1xYZM8iFffFSd8KQz8VcTK+SWw/L2DHghhk1+Vh
 ZbQ/Bkk3IgdUHCPHc41D4kDrKQz6vqAKAfrvE5NK0eIk7BuuSr4ohYdMp5tAxGB4NmkObPwFN
 aIxKv3pUvP2Wjcb5FX7f+wiI+4Z6z7buNXXFssZ3pySLWwa6n6QaPyZNdlHOthK22NdWnxQdC
 hE34w3Rf0BpfZ2WZaYIbCdBbfDZnHsWQa+UycGp+Xyi9zGT+rBbM0ZDIaDSwhxa/t5UMnGcaY
 KlJHYjQXvV+I+nUxCUj8zOyd+qvRu2Kv+Kzt2l8DaZQQy+Mdebi7/mkK+idO1wnfQPsf9hoVH
 ItAGRUSX4KFciHpVAPTjgiz2MlvIqUpiRnYlG2Hx8qK5BEpy/bjWxr0ehlpRAbjVNlbfi7EXJ
 55RquhinGnCJOboOzb6lvfDtZrE9whdwt5kqVB+T1Izg9tgQI3/MeyKv/6c/O1nI8b2TIb4S7
 qL6/61GNUViA+dOhXXFI8CBqKbZ1pwPmExHMRxdlciPuuOPedlyye9BZsnrNaV7uPhOFrRnBU
 ML+fjy/m4QtFGeQ1PRmt7zfLwwsY8ocTHDOeknWOMLcWsLJEHmtn7yROnAwh6kvdLc9g8yFih
 X7T8/X/UlskGNczpYepIodCTt2UgX3isRvPhBOsdjxtA6W5oj9SbUt02Oc86HH8uH+HjZQQ/m
 hqMvILjsh7zYVhgCB2PuRMg2nDnV6I23ixvzl82I3yJ1rG3grfBMRSku4BqhmhjODnO7uwo/J
 AX5xWGmKXXQthN9USJ1u7duQ6TOgJDgDNI3fPOH6Qr6MnHRojEGaqkuP/nBPC/oqLI3CQ1hRF
 yR5SOkonhBRbZtsliLoeiNUAh1HCAn0QPYN9csFm2XvZfuHyuVoEKbF0t5kwQEERkQ2tKAU6H
 RqY=
Subject: [Buildroot] [PATCH v3 2/2] configs/engicam_px30_core_defconfig:
 require pkg_resources for binman
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The defconfig uses U-Boot 2025.04, so binman fails without
pkg_resources.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
Changes v2 -> v3:
* refresh for renamed option

Changes v1 -> v2:
* drop kernel version bump

Compile-tested only to verify the U-Boot option, I do not have the
board.

 configs/engicam_px30_core_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/engicam_px30_core_defconfig b/configs/engicam_px30_core_defconfig
index be5c56e19f..d59effa96f 100644
--- a/configs/engicam_px30_core_defconfig
+++ b/configs/engicam_px30_core_defconfig
@@ -36,6 +36,7 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
 BR2_TARGET_UBOOT_USE_BINMAN=y
+BR2_TARGET_UBOOT_BINMAN_NEEDS_HOST_PYTHON_PKG_RESOURCES=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
 BR2_TARGET_UBOOT_SPL=y
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
