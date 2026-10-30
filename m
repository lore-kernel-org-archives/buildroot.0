Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1789B606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 20:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=oJygaJFv
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCD9C60AD8;
	Fri, 30 Oct 2026 20:06:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AUC7tE-pkph0; Fri, 30 Oct 2026 20:06:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4C53F60A90
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793390793;
	b=MYo8Wip/+aUmvm5UZvOo9QYrGSu+QRlSW1gAeG1XqiItbHAnqwqHi8rzm7ZwSZRVoMCt
	 rVZ5RTbA5CKWzWsLMyKozfgDEg3YqOdHfu4AfA8IklzzIEBYOMu36zEqsBcqd1QS39vfl
	 jEk1NYlZtVdTCgmJejbAzOVzsTl0DkJhkXd3tHlOgZHGjasosPXzc8spsHDX5zsSzbrf4
	 qhi5nPM14bHxMk78sQFn+UFYfS3O3JNo62+pbk9I3tK8dLg+7v4D1Q1Yfu7DDSiy3+S3D
	 /l0Afc031whADTtJAwnXXDoDLKHjObviv4FU1t6LtXskdc6/9lbKD/eLLfngb3b/AZQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793390793;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=DRlLtbx4ah7ZrYH7UmVUqzQA0KsJwH4/FAJHy9C3264=;
	b=Sz5lH0TTVWTp298yMeOjgHZasnK7gRcIdm0azULxljDfKqdtwomL7AeHUYmILz8nUUzL
	 4Pgns2HocHrYbRZRo3Uog0zP3EjiKSji0rPXL1xy30KQsC9GzD9AAEeFNLaohXvrOp56e
	 rX925XTez+uTYBQl8a/mtfd/x9gpxCx6drWfQcg6GkkJ7VzHdDGlh/z88+SNoXWZl2u8Z
	 d53xMs3rSKI8dZM1L+7Ptz0fFOz/A2U8z1JpX1RIsa0qGNUW0CNIVubq43iVnzXNuMfdc
	 /ysepn65fleUuYbPi6Bwk396ItcA7P0fcqqRtF9aEicVpidhwJ5Oxh7UMadoqTOnsqA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793390793;
	bh=DRlLtbx4ah7ZrYH7UmVUqzQA0KsJwH4/FAJHy9C3264=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oJygaJFvuD4485c/DukA2qMCUMThtWribS8xOOnJrLJZ8M+uMm+qODA86j2TfEqzt
	 T8jfKgEXkaL4Kapuw1IC7VvX1iwUEAEA6NyKqc0KfsdVTaBZ7HADo7EoZeS1J0h/NN
	 kpY+qEnW0ZTPlddijZM2d6Pc4TprTAMdYhg82nSFTEvfymKc4/cSjz52GpAtl4pQsC
	 ORYbKppmPMIkGF4ZpNZZL1kEt133xhUvKo63TUgwVOwJsdnB++jhtRVA9UOmfy58wI
	 mmX9PW15SpbUJE494GUNuDYbjdwcU6riPvRXTwqQs+OWWCCDwfAtoThB8BhRFi5nah
	 5AcPukck94zng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C53F60A90;
	Fri, 30 Oct 2026 20:06:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 460F64BC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 20:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32A1F60AB3
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 20:06:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t5IWPPMwdqyF for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 20:06:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 97B2B60A90
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793390787;
 b=GpYkYhwUHroezdo3oDma4pKxiI+8umxSxoo5hY1IMfx0cXx+w4LhT8vncpWLDcOsVEjP
 8O74afbnnUOxUTfOj857TNMajQztU3hnl3zeiNaI2L2dY7EGE6T/D//GvWUk9BOPkuDWO
 beg2Jr20BDmza5RAEC5I1T5sD8/z/RbU+erOc3HH0ylMmH0Uvq2wDHizDLE3Umj/EB9H/
 h091DnfMDaYalY8q3nB9UMJu2Roa4Hges/acv7SZZK7R5Ig07WFAU+FLqsaxT9rgWe++A
 Q9+PfVyYAMRM2/hF4+SUNea1Vt6LjG2Ymakr+Q1mcHZtFzMIfwZrYmLcLzlPMWM9UYw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793390787;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=GVIAhIzW6Qm8e7wyO5Et6B2K+E32r35ikOB2T1zI918=;
 b=Du3a8AVl6xJn+qhbOCDg3Tf8LmBugdFHxtrIKvlrWb3bRIQO+p/A1qbRiHg1k3ngAMOy
 odMwh7LoUcC+WgMiLhRiIkRmJnHejhJtYoAk+3N/+pRNa2gu8eE0llUssUdQbY8umodv0
 v/qSvUn5o+XtZFZmHcI3fNXPd26nkUoY6pBwpQPt4BhCEAxwUGVuRtV9tXebJWXJVrIag
 kKu6UROgVTTK3VRel+c7xZVmZEXPc88ld1jHZnfEyT5mOXfw7B6deH0g/w8hsO2WNwf38
 ewLXwHURt0nNeFhIZxhWhdqFns2rGomLstXdzK/ONQVW6PwC1ZQhRU1+HErdUaCxAvw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=NJVkPIof; 
 arc=none smtp.remote-ip=212.227.15.19
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 97B2B60A90
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 20:06:25 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MfYPi-1wu7cN18Z6-00fxgC; Fri, 30
 Oct 2026 21:06:23 +0100
To: buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Fri, 30 Oct 2026 21:05:48 +0100
Message-ID: <20261030200552.779306-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261030200552.779306-1-fiona.klute@gmx.de>
References: <20261030200552.779306-1-fiona.klute@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:Ncnvl3D4+Jw9IUPoFBGUx5oc4EFQaxINysP4PBaM8LgPmOuKxpn
 iWsZIejVf2vTc++0BTXDTl/nXO5MOarXhXCxx2mK9SzusvLkQhO4g9nvdd8h6WSMCRUatWU
 ibjnMvhFla8Z3WgpNSXQOmfMmw35sjZhJb/JM4Ffj7LDDSNybJQ6akCyYWDe01xsWheM66B
 FWE4rCqYN1CHTzqmE5TTw==
UI-OutboundReport: notjunk:1;M01:P0:XFWq4e783Pw=;RBq/QyVQ4RFP0EsVie/JCVvp+Kt
 9mGYkUgEty+QPwQ4uQaeOBDsG1ZR1/Pk0eNQBJeoIST/EsyyXe5J7wGe/ncBNYMn4xkKUHxWH
 ms25LMOILlvDvfRc83iG4y08BB+/TJthRsJNrrEyG52cghmPotYNQ91KzdiVvC0pur14k4Mf6
 AUrE1DZ1mk2mpGx0zJbtey57TY0B8p3J7gfOEkpAEBQv/pdKw+9Kdwc+3TK94Hb52XtlYOlnK
 gbYpY07hzU0BMbMbcl18IyFjHAJZXwgVfcgpWe+VAbThTPoISpMJfITgdG9W3aK3Es6uVccrg
 g+EzDokSoBBfZ/nlu4RV0IEyGR4hY10MkAZk+omLSp6eefQjsACk/MNddpB/qIieZM/1PvN3m
 PTL4SupUORH7KWGogq8eoBuiIqXkJ0TjK41zPsFqt6PChynl0lpqW881ELyvfp2SEmPTOxRBE
 fWizRbeMjUKu0N8U/ELi09flDo+vGEH465pFLxq+Y+Hg5qE0bP8+N9wCrShSBzi0Hcvvc47dn
 xj4/TEFXtcG1cO1Q9EqZG1C487NomWMfMkGspylEv7WdtOB0EIvU9/THRItA/upMb6AwmpG9X
 FSynjsmfEIDSEcqtByoIVe/9Si+MQBHW0bxjTAtEmBLhfC++kuAQefhgONHEg2ljvxDBXjp+n
 EZwEhnYpo5pw55JOTrctQtu/3ucpfK3RFwDKpqaNWyzsp80D5c3lvsyFMnXjRBzqEioy+FK3e
 yDVCazROmbtp9yXtNtDbbfUCPHDi/Vt/pPl/5hWYwokE3q4Si1aS9bzI4H/W+hsWcr41Y/aIJ
 C1wgsqCj09JYe7gO5eSnosIOqjFCNCw1z7O2I3+jdDsmd02CCRmN46f6ON/OdKyl7rD7nHQmD
 64lm6HTvZzYpsmhpyJ++cDU2Eh3pxbFmw5FIeVFVMSmVXtlgpvDnpzUtPeFs7OGETtLDo1YDa
 17mv3n8DTGC8N+1jFs0JbhVPPYFLpcFuzdjyxFOmWGKngJRHwt2lKZ6spOlkjn1XTX/m/lBjy
 c6fxqEyC69WtMgLkfkyU6Itl7MqRrEblwVIRhBwtsK0lZE5WmXYSx7wm6WmTS7Ut/9opnYAym
 7mf9LM5b/DirU9NZiQdd+7WlobHhhsQc5a+jpfsmy30X3JSjJUZJrzRuQGX1FknDhtc53itZ9
 QODJgzG1EgNfCZ19wWAkbYDZkANwhJSjZwCZC9YbkSuyClNwCh4pAq04EuAlyKXhfR57WswSE
 N/hd9hrYLRm/L8BIXYvD/1nqLjIb1FOvw+N+zQHa6An+AFIfKK6mfctuPour7+1u1Tw2mXDH+
 Eco+meQYwcgLjE4iqUCiY3Vl8zQl9cL2TyVDURpaKuwCHBsdJyvHrk462WwOw4PqBaduP2mIn
 pBrHFPj+C1677PkkMfE68OBvxgix8gXq1t6mnvfChTGhcNgsruNDdU8e6MoImRF4v45meIOt9
 gKlbQhsHfFDxCEB9IMP9gP1GZjw6yWr3oZAgKhs6Dy9pYc33oDADRruF9V/r9GplFQnH9zFMF
 2rop4P+wcZ2baahfd9AmFAyIdXncUFf+mZg1hwpPKMrvk9XuR9fT98Z6vzDYKsU98buOj2tmR
 F66rXCAk2wHf0Rmbt+tNvgJ4QpLZ46OlOsK9p9DtB2Vepx0tDh2FC+0OPcN2bHAoHUrMBjIHq
 2E8rqViCW+VjtoVOK8lR2jLQTjJ6WVhiZtkqWnNbReIHBcDWnucs0Kg9A4ZKUz+d1u93uvuBL
 JgfKeDQZyZuTOSJSyhDIZaTCgOIi3vSSRe042fXNayxbbnKl2/9NUj2m3xuYO6ubEwwSrv1mc
 g8ltAIcuFSL3ZUxtMeXZ6gC76sqtjra5PbJtcGq6CEtY356utDq3vWWmyqTM+wg0fVZZeTM/B
 B9CUB7f5lFviailzbynhshjzDWauq8kaz6WdQdvSaSvtOtP4MH5ZCMeYxjqz5MOAbI/u90nzO
 3qMuS68sXJ3q5j72O1MaVNx25GKY2gUTnw0y/U8G+8+Wz0dHt3WXXfvD3b8CQhOxGU1Wz8NC7
 DVigUk6q0gbu5xmddBIJKPT6KWg3k7bxKtRmEwQrZyWfq89dILVEXMkfcV/vR9yZeMkHruuRw
 uzyHw20frdpERsuKnqTsAHSe5BYabISzUvRYQ3je9WikBIdoQ6FxfE4EFfJ4QlmxMLgd5QaKm
 1+fQt5qeWrI2zncbl38qFit35G/8jA4QFmiQzXxMvvZVBLpb4z8pozm4/lE8B9iGwESOtWPP7
 x3gOYBpDfyFn32Ek2jsQPvaPsjg0Hfai58By3Ww1Sc+gJ5FS2AlrbfpvIjssvUV5JN2DcUx9j
 UMAbiJk5OTSvavXqPHFtfarvdU5DkHwncKE5WsXSDfdYwI1nCcI3Pn73evTYcuOkfTgwaZ2bY
 LsBAGWTGK+vRV6Hz86kr7BYQogykNNLXBOJ6czSl/lFyma263pjqv3z6Ceu8M4+t+nLh106h3
 aeFl5VfDDgowmNYT+2X+HD+bXL9ymadTvCLfTMkCU8JwOsWOzsIepQKq8+7L3PDzyqlcwcX1R
 tnCMR3eeUC8/L3IgD/8/GwFks5+POi3TgvCLGnz3BC/spJ/YE0dyPp4jAlr3fxog9j6Qt2fEj
 fHABhPpsrr004GpuZe5VrgdryYafH4f0FsPUEPoFvZvAbpglLXvk4tRcqoH/SMRnO5Hxjp3ob
 9YWWqAyzFZt5ELm1fyCb9OxOyB/+wslGxhA3qCxfsSsZqHvdE6hI8+uRvowXunNabG436TYma
 ZR41d5WEfKNtVknQ9xwOUSI9jlYbfpCnlZaEKe4syuJbZAU+Jojh9bOm6IZn7siMayf99fmN8
 y207vxAkCgTMUtDW8DRVmnH/lAcLdgp11QA15vI4ngJaQZ+ajW65xwjbLFRK6eKYfZae/Pt87
 hjycHE65ecpeg9j3sad48sfY7R1lE0TZ3OPlrEik2RZUxXzgTqDvbYEvc/LZ/mn5bRXfXzffm
 75lq1SG/Qknlh3sY3/MpYgyluG+p8SBGcL2TTfnF5OGbqmM5NVf9PkPpZpqUy+St9TcBqwlSr
 P0Bz4yB7I3TD6sV2gqXQYgQVfGZQNNO2TfchJuC7Xbbzy0H4f3+7ThvFLBA+4gdrz+pr6kCk2
 N+K8voKZbE/WSLIcqqflPaVIjMIN4RpnJXBwCKgKvkdKHecyUXzgdQkXY9dw+xn8ivJfOAnOG
 oVbEcmXIzT3bAd1MqQTG0HmSzqGwSlLDop0TZJcEcCqnxzVOEuD0duHFKD+wtFjAzyTSgs+aC
 bIsxo2tj71DXkTyfY5OKpzjbYLsPHfPLAqPpHnFayU37HLEop3ji1CcCzHPKAKaeqFArMLCE1
 SHkwLCMlufGNSmBeOgwOysPaJgigX++vNWNEYpHHUzIb9RqrZUTmDqZBPoFJonWbT8KeQ6jCZ
 0v+EcymELsi/qN01qCIczULDsRfINX3Sgx/eiSgXws/DzDtJg4H1CTQKKr4TvQ9CX9N6WmVcQ
 wZEcC0Vy+EWSfyPq7FDBK/6KZ05I+SJcSLAmYxXJOiD1uir8rk7KOAiUb5udQ6eWes6Z3PJsl
 6JPYobeSmmxx3rbumKjxzdge6qC3W1k9Aeg9qz3BfmJbqVZaJ+KYPUh16WYXlo75bLUwVlomi
 gX2EweDnoi1b8v0ySYGkDttR4UxlgCnYdq5boV88uS9BHyOPnJU/Fc43u+W5TYVlxIt49193U
 wV5YJyke+aIz+CrSUFW0c/tSd48MplR5MN29UNJParb4vUa9FRCyh7OUJ8gtU1hJViyNRjVHj
 Yol0N+XwdHRdRu/futJ3FIWsKQmm0Vp6BOyntLE/1l5M9uWJXBBxVd11gxxZIvRzAH3fbdxyo
 NpMA5J1QxcZ/UpadftN68otN7OBW0/16b5LNGBJv8MJFRfOkqE6rZogbO6c1lO51udyKg3cwO
 34dp5RPHw0Ify83TCppIOP8xjm6Wx8wjG7b5WB9pUcHIeWb+g5SKK79UjNj5bRsFn1ttsX0ZD
 Kr8KAxaWlOsC4n4pp2c6Vh5WIdLtT8bKvFOpddKItETBCsVd5CV69esIpYkKWiWfQmt7IxWhL
 gXc2+cO/uvPPcEYYn/yKL/K9HpKYGI1jUnhohXbV0aFaXyiCnrwy6cPmIaZKj0tY+z0W9GLTG
 ycyi85CD7ro7xDe5KEYMoru9p9a2nNFzuRF+757NRrNRC6njRd4iPfhv9WNK+Clsu9w8/A8Na
 r5QIF0o394QzQEoWF9TS/6TQtXqpul8BdhJLxEVVTtY38VdUKy7cotgTE79PvIqE1YTSBveXf
 9Ts9kmpN0+JQmlK78iiy+7YK4X7/qY1rGyUhcodbtA0QTfhYOQDh3AxKFleRkMYtXhUO+7UZo
 hJEBTmOG1aR0onh1n1Slr/J4riO0J+fRaWfdOOwHMtqLe2NWCVMnTdhWsBjSUCZ7F4ghmn0EB
 c5MyXPHy7OYz0IUMHyW8pWcZQ5xpOTFRYUz+GgKr2hOqikZRuTQRNLb+t+QHMJd1+xTDa1djv
 inOb0I8PxEElnnXOpV0lyt66OM7D8mrnPGlfzlRcZx3pQdpZ+YxUCMAGvf8LjAClAj9N/Ouje
 C4D8zFGKAUDwYorHIX2bCJmUvF1cWaxnR9fZSJZcxC8ywHq8AeO97wTlTSmzu/tssZHQ0PMUK
 DUGzf+7182Cd13664gLVPMK3MkmI5INQU186EBtCIzJwAifH7O/m7p9vMmyWP/XZRYoxwpw14
 KjyG5Jys+fQudVBwDhLxeySAlLTdY+RDG3RSR1PDBDUnLE1g3U06IJdEsWDDMaY09Xk824t5J
 V4W8F02VOZf8wJu9w5JZlunVp48UerogP1cmp718bUOXMXsa9f9odREs9eoVxk15K4okFoTS1
 ++4XsXDDYUYuVCIPCWGd6QWbu+XRwdrWqiThWHQnMqVY5Qm3mhEhEBsN2U2tK2h77UyKishku
 KVsXeLWJr/PzcOPE5N4tlYxmm8Wl2x+qlF93yq60ktR/FOCmMZx7qW5gDQuHEChGqMX9cwfIU
 KwnhSdD5i3n69gRdsuzjiux2C2dwwu8ZJY4DISDKcKwa06QOrQ/b5YNcHCF1Ym8sQSdJGGs72
 100rxP1Fcs85R/OajNnhd5qLZ8b/SrNM4uDaSzbwTg/bN2ueukGC1UmVOFSflq2lGeHO2PW3x
 5tZOC/U4/7xPXX602CNW2CH08jn5iXuoMfNZ2HGN9KZxSaENEQMFQJuRQnpoZd4ioG+Sa7oPk
 itmwQKyDR7bWfOTovCloY721PaO6yLr82pFODGOgXDghTeG/Ux3QpFJQbGDxv/TcbiCGoCy0d
 ewNQaRplmz572te0g//16paWtuDVWRj7Uh9h9wlwTlRlfkJw5o1LJ4y2wjZ6DFRqzAS/jgzao
 nsGp8WoXU4O+OH6XMQ96c877qXEbvvJelqOi/yCMXQaGKtd/nvUfyjf7u1Ch1aSV36H3mghpR
 ATWxDzpps0nrvxvd4aylHbKrqeQP1fD4G5eWkPYDTsInFQ5IuaqttmGXOslfgZEtfkI2JEibq
 MU3vbilLCaAfex3yQBRAEGh5+umI6IzCcvpVi7Q6x1BM57ijn87WBWsN7LstVWT5UPCcEiCT6
 L/BDbUa6xo8SDKkXZcJM2Y+nQneUGsGSoQqr8RkiTQfZ/tJVcfCjv2Cfcf319KSEiIwknPLNW
 NjYv9iZCdRFlic7j1dDwdKh4MAYryhwIR6tE8yQxwovOZRxXojwMAqALtQbKKLpXG8+DGYR58
 wJl+vRiPcNXj9poa0TyVa7AaNhpMvXpD7r8u8vDDu7G8sbJ5wPkgbfkqUmw4yGSBmUSMdEa9+
 KgQn7+uMSnmlHu05ne3iJKAYwv/9T3AoMFNd2GOJDw5RxqqxzI1ZwcnAvjXmyyP5i+k+Jv/Pb
 IBClqNWMjx6tJopqYBKiKC6yZpM8VV8YtpUqIJ58PLLELyeQO4bfxle1tfM13s5HY8oDKb7v3
 LDXtsAW+rbTfEndqyC4ajTw5NDp/Ra7Bm17RqveZ3N4eDsGNoLnysYbj+89eCWRlmhrCK1An2
 1Zy8h/pgKcg7Qije6xtUJnqcE4SZkw7gDzPuWQx0MqneNTpKNjaOsGURAnRwk/OcAse2ec2Hp
 fPqzryt226YClN4/LO30/8OkHiVzaJwNBmbAj9fdd71NkhOGnWuKU1mJ8KTy0twCUhE6lmPgT
 ygfT6Qd9aiuYm4+82oXu+reJoIvSfkTwmqMTwdVKV8SMk7vcOEJe7QSBzfm43OZLscFbGrnQ3
 HqukjUr9L46aU/9FAReATFrImu9HOM8hDipXe5DHvmppiWI4voWJDL4CvqsY5upfD37DYByY9
 iEHXA5e0FyeLTr8LHGMzvHdqaHgxuKFe3ZqC6VyohpCFBLyWsfsPLvyYmZOfdfnMbobA66NyE
 x8UkoxrJQbnyeSQR7Bl2SrGb+1wI3MA66m0+vJel9uBDhVOOMJCCQz4+Fq7tZ+FbUS9SHwohG
 Kevjlulx/j95R/cKgGe3Q80ETqdnO+cvRhuxW8RULOd+cr1AlrGOyCTm8qJ1HE4PCdb/AkPXr
 +9bc6BxwwMZuf1iNyhAAKBn94GwCoXgMmYvTOdfMP03c3bExZWnXDuM51P7TOL698EcPmfXFC
 2xTuWlP0AJ5sEPiis1CATm7gjsS+g3ct3Uw4p8rq+r9nr0HNs4RC23LYWPMkIEZID17OmWoxR
 3lEGRIVckBuSAeGVcPdUSdAQspI3uk2EcVN7Pi1Y+9LGw+fkqoUatRWsr0BALxZaxdym+gwta
 WUvaOxDp1JlO702Q7aeoLVKnmfdis+lVu6kmxiEsYfDGzn6CjRgWZbPr+NRxBCtKnQPWD9/hf
 OWC2X8z/GtBcer9QpxH4T5bha2kAQkuhrhATGim9W6IU67hcprYkQ6ckRMJcVRDC7fUuZgZlq
 DroVOZsxs6SyJmVeMoZh7MFlOntq1KQfutvl65ziR/uHEydkTAqQ8+bvqWBZfxMxj5m/6bMPw
 dy8x1phycv/wJ2oZ9Aw8d4NApnJ9C/qgWFeD8E7cQdhAtU+T+IP7BVy0eI0/E1IAauSNfXk5i
 Ztbe2q2GV5A2oq3N7M5E9XK02BRLlPodSGI0Ub+nDKbXyIGg8m8CzKYxL+9DS7gQbA59DB1C1
 mv/GmeijKtCjfJf7ukN1rRZBgWUnjMkaCRIyC92qMQZAvc/aWFwu3htExkS5oPuVXcWA7z31o
 UmztzIJxZGNaMGpTFByheb2EIhpmF8pH65WWwTduWKIhD09U16ZzNf+csfusJJHstwBqPBmvJ
 R7dpwA7+BN/jqAjMCzYvuV7Lqr6kyjMzUWpzw6PsDiOLPcasfrYEBomn8qWvki4XE2ZtoOCvz
 TnjHGu4JHi1tkrase5Jk2UUVc/uIvmIvI7zFuMKARC0ZravQ6svjPq0hBRutzabLETV/viqEO
 mRezitEOn/J4WSVu/qMpMeW/ZUyyP8wGBKnBDwm5dQOaADNYmqnZbaBQ0MeNSr4Kz2LTgx+7i
 CzjNHESaXUpp4P6yTCZtZ+j7sNOAdKlA1y4H02USArsbr/X0gZsQ4VMY8hRRT1IZApFa2o
Subject: [Buildroot] [PATCH 1/5] package/systemd: sort {,
 HOST_}SYSTEMD_CONF_OPTS
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

The same was done before in 15b4d396b9431634d339dde61cb1d52dcf9e0746
("systemd: sort SYSTEMD_CONF_OPTS"), but ordering was partially lost
since.

Also assign ("=") instead of append ("+=") for unconditional options.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/systemd/systemd.mk | 198 ++++++++++++++++++-------------------
 1 file changed, 99 insertions(+), 99 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 7a73a06bb4..4476b92886 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -64,30 +64,34 @@ SYSTEMD_SELINUX_MODULES = systemd udev xdg
 
 SYSTEMD_PROVIDES = libudev udev
 
-SYSTEMD_CONF_OPTS += \
+SYSTEMD_CONF_OPTS = \
+	-Dbpf-framework=disabled \
 	-Dcreate-log-dirs=false \
-	-Ddbus=disabled \
 	-Ddbus-interfaces-dir=no \
+	-Ddbus=disabled \
 	-Ddefault-compression='auto' \
 	-Ddefault-locale='C.UTF-8' \
 	-Ddefault-user-shell=/bin/sh \
 	-Dfirst-boot-full-preset=false \
+	-Dfuzz-tests=false \
 	-Didn=true \
 	-Dima=false \
+	-Dinstall-tests=false \
 	-Dipe=false \
 	-Dkexec-path=/usr/sbin/kexec \
 	-Dkmod-path=/usr/bin/kmod \
 	-Dldconfig=false \
+	-Dlibfido2=disabled \
+	-Dlibmount=enabled \
 	-Dlink-boot-shared=true \
 	-Dloadkeys-path=/usr/bin/loadkeys \
+	-Dlog-message-verification=disabled \
 	-Dman=disabled \
-	-Dmount-path=/usr/bin/mount \
-	-Dvcs-tag=false \
 	-Dmode=release \
+	-Dmount-path=/usr/bin/mount \
 	-Dnspawn-locale='C.UTF-8' \
 	-Dnss-systemd=true \
 	-Dpasswdqc=disabled \
-	-Dlibfido2=disabled \
 	-Dquotacheck-path=/usr/sbin/quotacheck \
 	-Dquotaon-path=/usr/sbin/quotaon \
 	-Dsetfont-path=/usr/bin/setfont \
@@ -95,20 +99,16 @@ SYSTEMD_CONF_OPTS += \
 	-Dsulogin-path=/usr/sbin/sulogin \
 	-Dsystem-gid-max=999 \
 	-Dsystem-uid-max=999 \
+	-Dsysupdated=disabled \
 	-Dsysvinit-path= \
 	-Dsysvrcnd-path= \
 	-Dtests=false \
-	-Dfuzz-tests=false \
-	-Dinstall-tests=false \
-	-Dlog-message-verification=disabled \
-	-Dsysupdated=disabled \
 	-Dtmpfiles=true \
 	-Dukify=disabled \
-	-Dbpf-framework=disabled \
-	-Dvmlinux-h=disabled \
 	-Dumount-path=/usr/bin/umount \
-	-Dxenctrl=disabled \
-	-Dlibmount=enabled
+	-Dvcs-tag=false \
+	-Dvmlinux-h=disabled \
+	-Dxenctrl=disabled
 
 SYSTEMD_CFLAGS = $(TARGET_CFLAGS)
 ifeq ($(BR2_OPTIMIZE_FAST),y)
@@ -892,118 +892,118 @@ endef
 
 # We need a very minimal host variant, so we disable as much as possible.
 HOST_SYSTEMD_CONF_OPTS = \
-	-Dsplit-bin=true \
 	--prefix=/usr \
 	--libdir=lib \
 	--sysconfdir=/etc \
 	--localstatedir=/var \
-	-Dcreate-log-dirs=false \
-	-Dvcs-tag=false \
-	-Dmode=release \
-	-Dutmp=false \
-	-Dhibernate=false \
-	-Dldconfig=false \
-	-Dresolve=false \
-	-Dbootloader=disabled \
-	-Defi=false \
-	-Dtpm=false \
-	-Denvironment-d=false \
+	-Dacl=disabled \
+	-Dadm-group=false \
+	-Danalyze=false \
+	-Dapparmor=disabled \
+	-Daudit=disabled \
+	-Dbacklight=false \
 	-Dbinfmt=false \
-	-Drepart=disabled \
+	-Dbootloader=disabled \
+	-Dbpf-framework=disabled \
+	-Dbzip2=disabled \
 	-Dcoredump=false \
-	-Ddbus=disabled \
+	-Dcreate-log-dirs=false \
+	-Dcreate-log-dirs=false \
 	-Ddbus-interfaces-dir=no \
-	-Dpstore=false \
-	-Doomd=false \
-	-Dlogind=false \
+	-Ddbus=disabled \
+	-Defi=false \
+	-Delfutils=disabled \
+	-Denvironment-d=false \
+	-Dfdisk=disabled \
+	-Dfirstboot=false \
+	-Dfuzz-tests=false \
+	-Dgcrypt=disabled \
+	-Dglib=disabled \
+	-Dgnutls=disabled \
+	-Dgshadow=false \
+	-Dhibernate=false \
+	-Dhomed=disabled \
 	-Dhostnamed=false \
+	-Dhtml=disabled \
+	-Dhwdb=true \
+	-Didn=false \
+	-Dima=false \
+	-Dimportd=disabled \
+	-Dinitrd=false \
+	-Dinstall-tests=false \
+	-Dkernel-install=false \
+	-Dkmod=disabled \
+	-Dldconfig=false \
+	-Dlibarchive=disabled \
+	-Dlibcryptsetup-plugins=disabled \
+	-Dlibcryptsetup=disabled \
+	-Dlibcurl=disabled \
+	-Dlibfido2=disabled \
+	-Dlibidn2=disabled \
+	-Dlibidn=disabled \
+	-Dlibiptc=disabled \
+	-Dlibmount=enabled \
 	-Dlocaled=false \
+	-Dlog-message-verification=disabled \
+	-Dlogind=false \
+	-Dlz4=disabled \
 	-Dmachined=false \
-	-Dpasswdqc=disabled \
-	-Dportabled=false \
-	-Dsysext=false \
-	-Dsysupdate=disabled \
+	-Dman=disabled \
+	-Dmicrohttpd=disabled \
+	-Dmode=release \
 	-Dmountfsd=false \
-	-Duserdb=false \
-	-Dhomed=disabled \
 	-Dnetworkd=false \
-	-Dtimedated=false \
-	-Dtimesyncd=false \
-	-Dremote=disabled \
-	-Dcreate-log-dirs=false \
+	-Dnspawn=disabled \
 	-Dnsresourced=false \
 	-Dnss-myhostname=false \
 	-Dnss-mymachines=disabled \
 	-Dnss-resolve=disabled \
 	-Dnss-systemd=false \
-	-Dfirstboot=false \
-	-Drandomseed=false \
-	-Dbacklight=false \
-	-Dvconsole=false \
-	-Dvmspawn=disabled \
+	-Doomd=false \
+	-Dp11kit=disabled \
+	-Dpam=disabled \
+	-Dpasswdqc=disabled \
+	-Dpcre2=disabled \
+	-Dpolkit=disabled \
+	-Dportabled=false \
+	-Dpstore=false \
+	-Dpwquality=disabled \
+	-Dqrencode=disabled \
 	-Dquotacheck=false \
-	-Dsysusers=false \
-	-Dstoragetm=false \
-	-Dtmpfiles=true \
-	-Dimportd=disabled \
-	-Dhwdb=true \
+	-Drandomseed=false \
+	-Dremote=disabled \
+	-Drepart=disabled \
+	-Dresolve=false \
 	-Drfkill=false \
-	-Dman=disabled \
-	-Dhtml=disabled \
+	-Dseccomp=disabled \
+	-Dselinux=disabled \
 	-Dsmack=false \
-	-Dpolkit=disabled \
-	-Didn=false \
-	-Dadm-group=false \
-	-Dwheel-group=false \
-	-Dzlib=disabled \
-	-Dgshadow=false \
-	-Dima=false \
-	-Dtests=false \
-	-Dfuzz-tests=false \
-	-Dinstall-tests=false \
-	-Dlog-message-verification=disabled \
-	-Dglib=disabled \
-	-Dlibarchive=disabled \
-	-Dacl=disabled \
+	-Dsplit-bin=true \
+	-Dstoragetm=false \
+	-Dsysext=false \
+	-Dsysupdate=disabled \
+	-Dsysupdated=disabled \
+	-Dsysusers=false \
 	-Dsysvinit-path='' \
-	-Dinitrd=false \
-	-Dxdg-autostart=false \
-	-Dkernel-install=false \
+	-Dtests=false \
+	-Dtimedated=false \
+	-Dtimesyncd=false \
+	-Dtmpfiles=true \
+	-Dtpm=false \
 	-Dukify=enabled \
-	-Danalyze=false \
-	-Dbpf-framework=disabled \
+	-Duserdb=false \
+	-Dutmp=false \
+	-Dvconsole=false \
+	-Dvcs-tag=false \
 	-Dvmlinux-h=disabled \
-	-Dpwquality=disabled \
-	-Dmicrohttpd=disabled \
-	-Dqrencode=disabled \
-	-Dselinux=disabled \
-	-Dlibcryptsetup=disabled \
-	-Dlibcryptsetup-plugins=disabled \
-	-Delfutils=disabled \
-	-Dlibiptc=disabled \
-	-Dapparmor=disabled \
-	-Daudit=disabled \
+	-Dvmspawn=disabled \
+	-Dwheel-group=false \
+	-Dxdg-autostart=false \
 	-Dxenctrl=disabled \
-	-Dlibidn2=disabled \
-	-Dlibidn=disabled \
-	-Dseccomp=disabled \
 	-Dxkbcommon=disabled \
-	-Dbzip2=disabled \
-	-Dzstd=disabled \
-	-Dlz4=disabled \
-	-Dpam=disabled \
-	-Dfdisk=disabled \
-	-Dkmod=disabled \
 	-Dxz=disabled \
-	-Dlibcurl=disabled \
-	-Dgcrypt=disabled \
-	-Dgnutls=disabled \
-	-Dp11kit=disabled \
-	-Dlibfido2=disabled \
-	-Dpcre2=disabled \
-	-Dsysupdated=disabled \
-	-Dnspawn=disabled \
-	-Dlibmount=enabled
+	-Dzlib=disabled \
+	-Dzstd=disabled
 
 HOST_SYSTEMD_DEPENDENCIES = \
 	$(BR2_COREUTILS_HOST_DEPENDENCY) \
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
