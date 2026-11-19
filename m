Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43EB1606A320
	for <buildroot@archiver.kernel.org>; Thu, 19 Nov 2026 15:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Xs8ZSka8
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 219EE80D15;
	Thu, 19 Nov 2026 15:23:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sab_CgirtJTQ; Thu, 19 Nov 2026 15:23:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 338E780C64
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795101796;
	b=ENW3TfJuh5Tc2qyf3mMZg45mPcCqWMJegzoIQpADZSBDFJSF7MZed9FdZBLFtfmt8c7e
	 jPymaZw3AoShumTLiVXZ85RBcPf/lbz+8C16xpmLjDnsbGNQyagIjpStF+gLm+LvaI65f
	 cBxVsW2Ai+UTn9w8AGjPts6yZSShOwAUTzP+v4UpHnaYYl1whnyvjAppXC/6Gxdn6Si5l
	 IQFv67Qz3hHFoxt2HqVlgHKPY15icsLE+4eEH2UMLADvCE1Keh3RxIMO9j0DnaYFMX7s0
	 gkEqgbHvLTmhjGUrAHH3mHa2hDmEfA/I0JsSwxFMXAesZbaB7rn4H0OYlf7iSsjQKkg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795101796;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM2-Signature:Message-Instance:X-UI-Sender-Class:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:References:
	 Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:UI-OutboundReport:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=BqT5IsjzbkmwH8LiA2t2phJtyo4IPXsKQl+sBhTf0hI=;
	b=UVuCm/uymjSPCwgEx/WfAkofRprwYsOalk+g86wGqtygh0J/liunZgSR/cA1Q1Dnn3rj
	 qXJt1ASS9SaOhqp3YabUljkLN/KZQ8pGvx5tvnyFmCG2SCYykUGs05mPVtF1jwZQq5bfS
	 c59LiX5NMeo1zq6Bps75O8+27Ci17bb+amMtJ+HN9xzl7I+iOh+sSCVkKZqfSzZE7f8tG
	 QMse/N74vSlcxb+aGxA+s/lD9zHKHVYeras1qEhqcb/NVaiDyrdzlX3WGC4hfejrxy96i
	 si/FN7V6vIVdiYNXhMHoAxDnyicovdewa9et8JNQ6/AXneq6jOtDkuABNolH6xWMj9g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795101796;
	bh=BqT5IsjzbkmwH8LiA2t2phJtyo4IPXsKQl+sBhTf0hI=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=Xs8ZSka88hGk58sqUW9X9PaOSe5szDZexbr3cYMhb/0Mz4ga9KKqGKV2LppEvJN2H
	 +Nkg6ZA4SjdrV9MeqsRyMDPH8JJcKfwWDr3NWywwSKpZSu8DsAwxh2on72aM9XoJgi
	 3rqjgZ8PbSenV5eM1KVlNN380o9kqvLvAeTec5JkkFIu13/9oWGNOWl9oz9j4fJVlT
	 ZqwAuB3AJ9taa6RfclW8w6s+3rHXralfSj+/KtqnpZ+eUk+SrMbEOGTornvuNnjPMm
	 gT2Tu5s8YKO9QXMNUs7Wm6eTo9mZj6Erg51l7Q0/fFcgMUOxLPv5latHI7CsWfrUzw
	 BrF3LbGpoguaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 338E780C64;
	Thu, 19 Nov 2026 15:23:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 224291E7
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 15:23:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 13E0340D0A
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 15:23:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gABnPxj5cHyq for <buildroot@buildroot.org>;
 Thu, 19 Nov 2026 15:23:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 68A8740D04
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 68A8740D04
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 15:23:12 +0000 (UTC)
DKIM2-Signature: i=1; m=1; t=1795101791; mf=PGZpb25hLmtsdXRlQGdteC5kZT4=;
 rt=PGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPg==; d=gmx.de;
 s=s31663417:rsa-sha256:e3d457XkwCiQiyFTDOP54wrUzDlx
 5/KSoicnQZOIvQaPFOK9QxDt2h7aQdfHi0+1luPI5j6inhzhy/BSVbwFTr4yQXRmbDj1sOGqrLd
 Xesuuv6zcFcSVlX2f+/zPeak7um2qYINbdi+q3p3Ol98C4mLJ3J0jbWDZNB7YBIb8x0cVYt+Ltu
 wVAOdG+691TZ8DP24txE/NczaGe/N39ItTxQciDJaptODuT1aQz3eGCvF+HLUs+CLbqXToB5lzb
 jm+4HbpmZah1DmhmksMJVPkZNApV0HKDK+skTmIiTeZlmTqUy0n614fPhZTJnslpikcYSmXRLH5
 FvHn+20n1YyccA==;
Message-Instance: m=1; h=sha256: gkcqDdU9/NsIgokhp7q4LceAogPMUVF+OFKtAmnSTjE=:
 kYFELPW4iFp8bSjhB/xlYkprAqt9YaXHJR+zRhQEbDg=, sha512:
 0O2rLhrlq0jTLwavZhjunNhoGxLOQ/WIAw7zAkHwzBaF7am3pREyrEeV9YJ24ekQ4NYvznYdx8wNpMiT48U7ZA==:
 89fZ0ZKpRWkvQwgEWgCGtik1ZiuO9YrbiS/cwxZCXR8UzWQkDDoXDrt/ncxLoVXwWQVAIAO9aAHEAAZEb8NAtg==;
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MHoN2-1xFEGu3WJq-00CUei; Thu, 19
 Nov 2026 16:23:10 +0100
Message-ID: <630c8dd9-a8fe-40dd-b4c6-7cdafb5d5ddb@gmx.de>
Date: Thu, 19 Nov 2026 16:23:10 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org
References: <20261114140316.956334-1-fiona.klute@gmx.de>
 <47f92296-e71d-459c-adff-6f1bfe9e863d@bubu1.eu>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <47f92296-e71d-459c-adff-6f1bfe9e863d@bubu1.eu>
X-Provags-ID: V03:K1:ob2mboH8J57ZG/KPcymHmStLnPnIC37M5aAEwwJIW+zz3gdv5tB
 aLFmIsqBWE+ng0h1NkY+FKWQZ6eMIq/Dn/Gyfkx4WVMfpRlEaK/MoN29mgU5ww6EpwsRi8c
 w/EJXgvN4fwzwkAfOWzpjh8zKMXIkbNOh6CJ3knYh0Ln4GAmcXAxGDmfxL9AWx44pKkd7SF
 wnbIKOBPEtny4LV94HNLw==
UI-OutboundReport: notjunk:1;M01:P0:94zEunDtMWo=;HNPKhFZrkZX9iau1uowo/PH+fOM
 1CNzGdeAP/XwA7KaqK7kVQpERfRIiCjVAxDgkdGPbNYOGoiPWTv0H4zun93rgTGjeFeu0WQTh
 TdanFR1SF/ZNOCYe/GSFuXVTRFGWejLuFk8oMUD8dC8t+K7xV0z/T8HQ5qbFxuB6zbYJGLrKj
 UXRYUOrB0XPt3mErgXqnNRDDcXidgjBOg54Eh1DowLdPXvtotAxQikY8ebCBHeKSOr1Po9x9j
 ccuM00y/Oof4AZLyTTACfNzBzAQeJGs3EVpaNgxjXsjLKGBep+ABD2DQo6z0alv3CziBqqQtP
 P02jUVQqiX/tLIp5AO55zCl4h04UndWhMJmuvU7jqbgZCYLm8f0WPLkbRwv7bHIKKcmzHUmdu
 bOenzm20EJTM9rEvc4mA0A5igQxMWsx4SjSZL2ka5zlnmQPnW1uRFv815CcYg6GGsPOkKXsq2
 lqXOmiaRcy3je8+IK7c7dAUBjFYWT4kV4PeyHIXC5lhLTwdiuOZBw0fbNXG7RNYWb3cZUtvxc
 ESgPrAAVr7H4gNznaNXThOv5g6h7g4V/as7MmcyDw0XfGVM1gcICLceAHwaptvyXiwBI9F10f
 ellJ5nIzJ0M8rPDMAqSWAlQHW9G0wtwsMfegjm/kUOYBZGivKwm6fdPy/8DisqUgb0akG+nfM
 RLnohhAFq1igWPbadp2jVKazda9ONRtZH8Ozgbd/lUMoA9dqDa0480Tm61APwNOzzzMGTRLOp
 pIOlbxpRZWjWh3tewHsHhsIMFNyJ9t+MA4P8vPanp8PAVbnbpfGTUW+JwOj4H76dg/LGnzm5S
 Qoa+y20N3YsUotn5HnMcpIkHyDnEgLgTFb672HdcmkygHhkx3tMXgEqgum58QAkUeq/Sn4z3q
 jpjlhf+AYpXOrJlgC0WjNiPXkQqV1Hj+o+L3RIJ0o3UADAIO7BPuhBGyx948sdFr67PCMC2ru
 xgclX90q9M0pkg4W491ZfbjxXNe19sQoljtf1uoTY/yF5pXdXXu1XFwEbanGoFgMrRq/TeoUU
 ld3aW6rLzjgxzJ03vnYGa1pyrnPLOeU9hODoVgdmi6wBSXg5+1xWlwTQCSUtNAk0vKRUiBTRr
 dFtE4dUNhqbPJUnxqLHGvpKGs33pz8EIO5K8IYglYjkwOepQODVXG2djDQjgZnmtgHqOtKMk5
 /0UsxPxGFQVnI5c4qbJUs7seHKh2RwLEBlDxF29ifTgYIYcDdzWquA1M9/2DWqHWq+C/vJ70e
 lIua16rBiGd+KF0u7DjZt2x21W2f38UqyEahKHNFiNVHDgYwG4/O+yuGbFId9kGD88Pd73Rqe
 xWyP8eQeA8wtx5cXJiMCLJJf6/p+MbvuIL9DsNoV8zivyAzffxTXzn6dj1uMlqJWnw7qkBXoL
 9lPLSNxSnbp0gNYPpjTBg470hz6tRDygoyez7pxbPXTZsXbfTzzpnJ3GCjy7TzJO3I/HcAgGl
 oWTMH9eyeRR9/5z9wz1CSjjXPqG6sRIiyPFWspAfI5sJKDq0nPcOL4R8wkh6GERGAnLP/zn2/
 ysdJMaam71V0I1+1SEc/4c7F+5iJLQpxZDQrreNAOZfkjiDPiZ1/vQ436rGFBJx1i1xSOx93S
 J9pCevikw0Cuxs6hKTg8dgtAzXErxF3i/QXOQUBIGKcEiFeFcQUZPbnk/VixQL+4K53B3gXzP
 3JnG5HU/mb95YABaPI8AWuH4gh9QG44GsK5Hh8jLWFYDB8+qerIi1O1jJLBWXPYHQr8xFecHD
 WHcw7yA09bfeWILWDj42jsvuhIVNTVdBx4PWJUHSeFmsUBVsVHNqRX8yHzUrs9HfNOuV99A1S
 n36eD8CN5/uIPprj4bzXKbgqA1pVCVXrSuRow6Oxupf7rMqzGUknluQLzYcVTQ4F4+EdEl0jA
 TSOLVit9Ncx013dneaZeTx7eR/IjBgcJlNrqv6Ur/yfz1o7W/gTE2MaxXY3IANxIeRTNfdEf4
 F3PpBMW0+qIbecMIeDer37wT7BpAOaKobmCbe1CT7T1iFbHZGuOc0MDAT+IdKLMhfr2Ovvg8l
 tG7E3AVY0vbR4bUg9L6RwuJrZH3YeesHaXrfIDxlHahHNcm8vC1r+eczvBoAax4M2VVfJP+1m
 tRYCb6OtjACkaZhMN67pNcEZWJ6jkaCLEk0HvZdeJ+fcqRte+PMdW2RxGu5dagFXnW6rm7/Pu
 fTSPSlbEiNI5V5HXNYrrElqkkbTfw+Tv3/28lr2dVKQNXbsvkct8OMCrI1fctsVYlaZhGaunZ
 ysY1qlZSP6RXUT2PP8S9M4hnXUcS+sEddf4jcYW2Ilmw75NILN1w6zPoSTIHQCbVReOA64fgG
 sHL7XMWyOn7QH9g7CI1szGOTlcMnJSfQrJShIKq8FyyZ45ya51EDCglI++vufdSWyl1bbK6g4
 u+y7Rxy1E6q54rfEntTzmYMDdss3YvXJBObTae1Bk66v8g1UDXgcEgIKh6t3oQPd8Kq2/sjsY
 SI016LnB2pCvyDDhQ+i8ydHTnReQqWFkF42+AyBgF4YWC+KZD9Hm80aP241M/phrYIT8Ib0kW
 cYQKllam34L3w5Q0oOw95Qj1ku+DnPB/0a9O7wCuKMZ/2KukZVxTyiSYX1fIlpFU6cA+XxIY1
 CEP6B5HFKYZWoswKRnPfA5zdEcHo98llBaTRFH5tOwiDoJpzres0V4B7TfkouhBmZtr6cM33p
 WyUB+MY4sbIRhuh+HooBRMDrpMqCKiw/4tfeGnFZcaKGCHMSJO5CNDlrZdkjhAyz07A1y+gJ9
 rSPlV1M1Dx7bXAwBaqdyLrvUlHZbTwXKsVZazcxScOQJaO8v3AgYlgsJf8coBGd2KM0U3smuk
 o9bJarm/e6rZibY5dM1Fa0r7F7gagFsdbl7fli6SIFUdaGYWh71hMWbj/DtlqlDULRYCoz00a
 bfFGwmgDUpNIznZSxkKWjqKxcd9aYS111CKKP4Fm5vzPugNLiO0gO75vVwTzEameZ/79RAC9g
 3ft8EHVrkbl3gWl+YQM6oBUMZjI72s+jiuJUSZVwV7xTSZzm+JRx+aWzNoc0jT9VG/K7oW7pm
 w4HjARmd9wJXtZ0F6TrZEWnbPGNS52d2GxADJrqMyFdGDhw+Y/RGtVYFU6Fj/W/iv0A/KPV8x
 HfTSwcwdKVPfg7eTgNv0A9zad1v2A8Lj5mEvW74rhmDzTuw/2u6Je1hP1Cb4txtejKK6VqV0w
 PyZ6ndYutt1x1KspDwNLCqKz/sKR7SWg95pjbcuNOKad7JDtBf1NxLL1DHC91c/DJZ1D6ioj4
 jSs2EsMM58ywGUSgRzO4EaXv4QNjVE1Vusd+/MN2q/gaBx8vhWLFlaLlrmB/8wBMOvI7JiyZT
 /bXdL4Jk6x2xoHf0mCloZbv3c2pqahjPYpeFfGHF4OQzF553BCRy/eFgbok4aqMJlesTaPswk
 5qO02ZzxilvA3zJG+L+J8EsrUW1iOY+6OaapIeoWk2Cxlg00HqKGC7qt9FyRRgacfiLGMg1rT
 MDYgT1cO5fgHOmUk3xu6oZx0ZmUVnkVE6y2XkcUAnMSRsFxMHNqgadmocIoW7SqG4EjA+Znha
 ri4W2vquEYSc47BwtNp3dbd3GtwfAVm2WTPeqI5US+NVXuAHVwaYItaKzMFYQhPmLKCf4bunG
 VFw5hwuFka2cSFVAPunmnc39cXRwCbK4ton+j3zaoamICmo2OR3shkKwRENDH7zvQ0lHhvQJo
 Rx7gzJQh6ZFFzBKlA5cZdWxQNgQLpOP+J1E1+fJl58RgtGiYDOd3kdo44EVmCKzMrw3FJgkxr
 jWBRIxCAUvXLOw3qXpkRZu2n53cSx04jJgstwHebZAAYE28tp0Xb1hIXcaESDl4XqtsSnzcRv
 4Hdpax3RLM2PDb5/YBx1FPgLx/kH77DPnlGWD5ARC8BPW5CnaQ9wQVvg5w8rh9pe77j6aOLsO
 iepwZQB/FXl2RbE5fF/xI7V5S6Gc3PC9/NCL16JPRZvHVsGzvi6ydF7aQF4FSicEjLKoxm4Ca
 6JGo3xY/tFr6d25QNhkULc6rCQ0b8TSt87p4r8hAllPqOnhdtZHkJYhQYkz6jO7IumgnbPJXT
 av4V3naKeN/EX9+dcRrJTFhBXHl2CbhyIUyfHh6V9oGq6e4u215IhFhdjdn+XlWq5Fd7+P8IF
 +z7/bYf1Kati13J3fE2MLYhFL+ZUZJnq3l83WS4uhFAjDz/tLmsH8/aQZ/tuGaTuMFpW4BWCn
 N6TIjwInsmmrm4XtPGym/LV0hPiER/2kIR6MTiuqVH+julW8i5C74yH6jeOZhVlX2bvFv5PlI
 5QCFPmOJkckp4PjImO4sr4c1D3mT1jR8AjYBrsr7gFHV6JG5l4AHR+b8PceX+YrvnV84fOsfe
 vwPnZ6XkMh8ZRPZq7SYf0BgTvqN9sxMyu7CHXO31uByEjckuXFT8Psp5YWN6z2F+6UW0gGq+X
 HJAwaL2Y91Pfkub8tM1m33uBmqTaYxWyhf0JXP+LBWlvUvkjgVACWIsHIC2p1YcfEj4A4K9Ga
 rBYP5sfBoUg33YabqSm+xtuVkRiYyDqsC5Bqh7tM+d4XYguPasekahMQ06YGJr+UD7fEbMVx/
 HXZSsypC8roh9q9Wco+v64CeBLYZVyuCymbtz7j4GKpPbKEA+IxC/REvJwiPwUzVUmWOsez6p
 D5Jvj5/m3pmhBX95Jf4Buf9VPXbNpUiXkfE6thGZyIfj+XP2fZyeoWyA5yYVfBzCNOP80nZhf
 Yuk3XXEXobSMmosuUg2DzINdZj+JC+dM8zlfzZvom0JzFRU5jRCZbFI2YqVhv3xmtPzLwErGy
 s+x1Rb1pEBFWeHhbMIF8wl4a5JdqfdYUbcfDJ4T3Vea+Aogqj9hAdhOWmqy/BRItXneTuiPQ4
 OxWQxoxvK480MJ8D9pbZNlZLPjQtFVmk9pegioCB7rKADcn9HI0HeZbrRUhce5EYVthWqu0o5
 hjugf75m7bew7KIvmUOcggVannMPBoW5ofmsxsuBvIg1WVgHu1b6RMHgY+8s7TDV48M0vSlQ2
 ZvJBIgSUtOtevnPF6YhkJ9eYfZRalTUfMn3PGEjKq3XAYtQmTgHde0IgFmnlTweAZ8dsWg22H
 PcWWTv0sz+tJziq1Ebgb0Rv1rHV2xjREjy/PKiBmjf5ZjIJoQbKdDkqSeqwI3DYAMn8WdJf+u
 C/ZfXbhpsNFucnVLYIBwINJV90t51rMm/vOxS4m8V8UobyAXtwelxrUAj0mUsAe6jq443LYPq
 VI1+AdmFn4S8af7RsQU0de5yb4I3VMvGLOMcXaf5MotHJwrNc+A/WVj9mFvw+aFXUBLAxDAoj
 5u7soD4NHAXwZ7IkUrezMCfth53EciXp+BjBFZb57wT4L32ExE5DY9qOt1x01uzXXkMVELQ+e
 GfxlvLDVxT9ta7/xT1Qc0GVa9LJHiGETKKHQkuXewz8FifRUyGvndeAtYhhg+kjjm4EVV1BSH
 o56ovK01DYixZ0ICBfDWGGxR5y1eiHuswXzXC8kotJIgit7b1MGTXvGOqkyiGbgur9Fz/uehC
 ydvv5yN28ysoGU3GeQ6K/zWGhm/bMbquS2w8KAabY1K36QJnhvK7ZZVtKnFBdWr4HoOtTVMzz
 kAOpQGGWW7KUBSqRbb3/MJv7MLjXCvFDU35p0kP950Gk8lXye8vkbEzn/GLCnLoVHBRbOnoPr
 8IwOsSy6ajtsCKl+G1/ch1csII1ruEgPeraNb0JAnliKVurSnD4BBV6PQKIyh9mDapkJL+lzF
 1GhOT0wkA1WU+uUv3SpEjDWiVSyZIslQks/Gj4PHsKWI6uaWxsBQo8ngltTMD2qgnVHIqVi0e
 TmQhK3cJULgOynipnjqIyUU7d0Z+0C3Zl5LomSMtTllpZyUMWjRhR7HUM9ySPsOyZAkarSDFs
 CrUphw3z1jdEkVGIUB9EzqJboTvtqszxr5lA9LPAcg28mgFBTI1ruvzZn7WDfOkxrfg7wqqkn
 h13RX/3r2oIa21sL9k/JJdgYPMp0JqsLQUkARp4lNCjgk/nN59KnpIPF6yVTKe27LEwMTSOhY
 iHwCVtEbr/P8o+7RRlbHNMgEIzpvHW6bIo86E3WQsi/0V12xAI8LU/Z5QNRlWYrOvHjBvDo77
 XwRKrComBkLocYkRKFDXRWZ5J9gO9dxGYAFeB689FxZ5IIsBn6pN7uBSKP7fPwn6JasjsFiF4
 l9Rp0/aJU3h69heeRyJf/SX9eg6id+I6jtNW9VQNsuVX73MqUmqflcABRb/h+Au2+TLfVRNnR
 qByDNcxnrvr/2uK0w7y4EkO7fl4SoFoc6K6SColAXotAvXiu+3f6SO9tS+CXX9Rp5vh+RLAAS
 k+AYf7AXPDdSsAPipo0gk+fcwMHbGz9syi9dBe9qdMME2YGdFlDXQYEMojUAYiOt3yfBcHsYR
 M6shfCAqh7qeY8LM7TTN4sEBFlz/hXsdDh+NpaQ/P86kGLXEO/T7EXM2rMmLL8459iXQc6Y4v
 2rcCxkZVcLBWpJhww0ugTxvXTQqdMbvV41wSKd2g/j/oDmWy9nKPZU2Mh2jQ0HSYBp8JnIhmj
 H2MQDAF8QW+WKP059LHZp1C1I9Ct1mV/rmC65425cIvlpppBXBPwLzTxY3qHWw3b0/B0ZkjgX
 ES/VvgoV9sZUuSch0CCTDGvQCIKc7RHKuQlL4HEjbasaD66X5HLvAU8VvpGVQXHrja8Xmo6wS
 XDz4GvbyrheFfO7lUdxSoKIfPmn5vF+fkMvrtaooZ3Lur4ubjudPWvflkGlUmkouuu2teg5sh
 06aDs6wtQwKylk7xjFqlEF0eLbdodAYM4WPgmBaB7Ve5uqUbYfkqPetJy+Ld3+WxuwyPrdq6b
 2UuuB3dZDhQAMIAAAzpYMTO8EwGwEHAJhaxfw3c0QT889gA+YJPIBiPJYj4YQ6cYMekdCedgG
 hmEmSe81ZriEQ+YTeW1ayVZUz5ZOBRZERd/TZlu4b2XPxz2goI/tw2LM0h3PBoYgf7FGQpwms
 KjWW5vKfbL3WvVnMBK1IVegR5w8cC4S6Z4TVwPgqK8tVcol3O2MiO1Jo7o4Hcv2SBeT7yHEKX
 7H5iFT2wDR7UY1Arj5nztByTnexvtUnyBxp4X8x3aOSv1dc7uIuZMFnsrGBDt2zyNMi1gSr4j
 oQogqg4a2hEL9YbmAG2hK/6fL6yJ5HKMoWKgdfFRDZXOMBwuJs1v+OoA7vBRd5/+X2iFKFWf9
 x+30J0nErobetri3COmQ6KlrjW9Tsk9DW0SpD28cGvJt74omN0sNPPUkJt0S/sMQVe7ct0dAF
 goaX5cUMyguy/cGkD5fdUJs0/kIzxCb+vQs5Ssth1dtqEu6d5tfZAFveKFUkxhgltP59s/tEp
 BVJLwQuPU4ySa3rMH+5+9JatmE/QLqvYQXsbitrp3R0OAZk9/sI5ha6XUR74lBRrrfvsuF6kw
 kl4VCZgZu9dJP4NtZw1LYCP+0ngnUGYAEjgzAjaNhSJQnQtDoMcSr4dKIB84ImBBqyJZpYg6k
 BijivLCyRymwX59J+rbUhLcTQpSQ==
Subject: Re: [Buildroot] [PATCH 1/1] package/cgroupfs-v2-mount: allow
 setting mount options
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
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am 19.11.26 um 15:32 schrieb Marcus Hoffmann:
> Hi Fiona,
> 
> On 11/14/26 15:03, Fiona Klute via buildroot wrote:
>> Certain cgroup v2 features can be tweaked via mount options [1], so
>> those should be configurable. Implement this following the common
>> pattern for init scripts: Source /etc/default/cgroupfs2 if it exists,
>> and pass MOUNT_OPTS to the mount command as options if defined.
>>
>> [1] https://www.kernel.org/doc/html/v7.3/admin-guide/cgroup- 
>> v2.html#mounting
>>
>> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
>> ---
> 
> The change itself looks good, but I worry about this being not 
> discoverable at all. Do you think adding a Config.in help text addition 
> that points users to /etc/default/cgroupfs2 and MOUNT_OPTS would be 
> helpful here?

Can't hurt, I've just sent a v2 that adds that. I assumed that people 
would expect config in /etc/default like most init scripts use, and as 
the handbook says you should support when writing init scripts. ;-)

> Also do you think we could add a test for this package? I think it's 
> implicitly tested by the podman test but that doesn't exercise this new 
> functionality. Would that would be worth adding?
I think the Podman test is good enough.

We don't test config via /etc/default/$DAEMON for other scripts either, 
and I don't think it makes sense to: The only thing we could really test 
is if the config snippet is actually sourced. That doesn't seem worth 
the CI time. Testing all possible options and other fun things someone 
might do in a script snippet (related: I've recently used it to put 
services into cgroups) isn't really possible.

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
