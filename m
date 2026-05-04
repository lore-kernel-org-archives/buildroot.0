Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A3D0FF886F
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 12:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49235409C1;
	Mon,  4 May 2026 12:56:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cSqDyznUgrCr; Mon,  4 May 2026 12:56:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 708744179A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777899388;
	bh=BP8ufqEZxtIUI4at7/tzrRuSg42fSg31s/Mu21jt+K0=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=kAe+BHt1L2VIBuksgaSLJVqGtYoULpgD7TFad7PD0JikwoEHGxmHBeWBs8pItxcWy
	 R01V8Bnf/aWEXnj4p4mPadvW7pWlb8qMGJqUxgTBKmPO8gdARugD7mKi+Roiv0mtDX
	 4urVVmfu4GaGwOHNR1w5YUmrTSJET8Gk+IgZ3JZy9TYBFJddKrLzzCccb79qmAk1oD
	 gQh6ByLhBhJWqmf962B4Uwlpx0J2/BBiQ39F1ayvB5cSWIo5Y00bADws5nNajmiBjP
	 T7Q0G5n6X3BSxFbjBYKli+LNSNWO5fPW8mnFWWfdwyBFGdU3tSGL6C2E3cxMrMKgB6
	 pUCzqpgy2dDTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 708744179A;
	Mon,  4 May 2026 12:56:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 89C2225D
 for <buildroot@buildroot.org>; Mon,  4 May 2026 12:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C0C94179A
 for <buildroot@buildroot.org>; Mon,  4 May 2026 12:56:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vr8-x7J36E8n for <buildroot@buildroot.org>;
 Mon,  4 May 2026 12:56:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 180CC409C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 180CC409C1
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 180CC409C1
 for <buildroot@buildroot.org>; Mon,  4 May 2026 12:56:24 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MtfNl-1vSkEC06yl-012gqL; Mon, 04
 May 2026 14:56:23 +0200
Message-ID: <6def6813-6abe-4412-a0b1-d99b75b45db1@gmx.de>
Date: Mon, 4 May 2026 14:56:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org
References: <20260503232504.3712616-1-fiona.klute@gmx.de>
 <f8a85faa-8626-4f5e-9555-00eb794b23df@bubu1.eu>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <f8a85faa-8626-4f5e-9555-00eb794b23df@bubu1.eu>
X-Provags-ID: V03:K1:PpBg2sVNNkoIYwpwO1uVgK9YqSwzKY7Jqa67B4R7rpdb4VB+IZU
 AqyQZaztD0gWEJpMKYcKwa0DEsipABZlBiVjNE5dEZMAhnWLLqSd/g7TZvYNICzeBaStHfI
 3z9D+dbG2ULiUEr422sQLpcunxwznik3wznSgHvVKewJnvZ9Gd9p1qEh9SEzP1wgvoi5BCW
 KPhmWTrfK1jjPzvLmPyQw==
UI-OutboundReport: notjunk:1;M01:P0:WZu80I0SipU=;CdNJZsGc8srmhcpjC0ChLvH4xKX
 A3NQ41EwY/76uhcGAiw12vFKuLeTRvCQNQYoaJiDGpN9nDDGkoJzHTWEa1nkLr/2iAQ085CLf
 ItwFS5EmPJ5qaKW4McLKTjSGUKGpBbPLwBtHCGPhA6u+zCjlph07Z83egaPKIDNMi87UMduDO
 OL2V1kYJEkkV6vT5xn7S830RMjSaq6u0WGt3YnfmOfMJdq5kVHDcOGuLyNgfskXimTV59QDpl
 q0InGgNYSyp6ZEoCc4TZUqZz5AgZnhVbSPYGq/d2JgYdDeSauGT+WsDvFf5VxftSW5aYYg0TD
 KR0/OXG5gRKOSAdWSqiA95sCn+CLlAOutpbQl10rq1W37ir27RSw99CwJ/FF/wWGToA8w6sF8
 hOK56W6tAxZcb4+7uiSjUBXMaAkkE6aJRRR4GiifvjwBfXy+tpOYfDCLlSH7JT1a8SJN4OTze
 4WfrWcuJ+RkyIQ7z8XmLiGcj3AJSO63Chs4Bva1wfCprWqfYYYtXUwW1Oumzsv2YY7Ti9K7gI
 /Y9/jDtAvYBJP50Pk/CFujZozJSzfIXf2zRI4AIiJmCpnSUjPfwzD1094eKUq5P2PTx7WNlq3
 xydbfE/v33OiExQO67G28D2lmh9/4gz6KyA3B35duB5y4rOjz5/th8swJPC2g57RZdx5Z4yAe
 lsbmXmB4GjIlv7ekTKR6Va85RcbReAINpYHvx65jncbVTypJNQClVQAOzvR0tX/aVUb0P+jzs
 zBAdoRD7iE/vw31KEpAP0857OLHXGfe6h6cBr15lfzkZi2/4Gk3S39ipWW7uelvJ8ysfioyTE
 /B3/9wPqIhm6lXXpN5pQJ4uoRPwQDgcBZGHWaORxhTHvtm6WNvFjEw/Ool1ILL2YkU9cMGdXT
 E0V7OQdhQlwkmVmFQ1eMFWykG/TI9bnpYZhgX8yT1fh4iaFopZ0sLUESXb4hR/s86meyg3Q+6
 JoykWVnFafhVEJmOq0aY397Xtnm+Hwdru2AYP4LiImYq0ySiYInkI6vIjulV9N0fyeWt0X1nd
 9jayA+YAG9QZrGb13xMwAGCc0ifCQ26JyZLo/bPqrHu0vyv+ekhxuXAt12X+VZnfDmAsw6zRi
 ROjBRPgIOB5Atjl+WRruVLzBomvrAiZiJ3uWmoqbkOuqyfO8Gog8raeruipmjN1bvk4E17gF4
 M/ZHoTG69QN1eSVlaSwgq3QH/zBH+EjaKT6SXadnnCG0002vyLJi4ZtkgHiij6R5QfyjR6yv4
 B7xejWDK3wxOPafBy9z5BUBHThCBoaWocS5S3I2stq8K8yp+UsnxxkEvcfHMDNuO0fwEIxAdO
 zSjeG6aHSeGpsjV07yq7FfmsrmUsigjlmMIAj4gnBPHhtOBly3ZFuq7eHvhRTnj8edF8yrdOk
 hOf3PMmNdfdaPCEgjkoLX5eraB+Nv4x3sav6OehPTA2pEwEK0PCF16MZPdwtdWNfgE0flrb1R
 Ql8AT+jXisiI4eeHlH7jm28UpodN9EahbRAvgKTmXMfiK/YIRbR3eVFtLxVi1LQBv2j5AQgfW
 c08yw/PCffD0cuUjWT3BQ4X2y0nFhRQ5oYqXAZ1ouq0eHKbgh+7tInKNa1rR554a+HhWI8GEf
 RiAm8N/vMtt8bdyvJHfAwbMAUxdCb91Q30XZ1rZUsgmL/9pb1X6kbYyGvzYdbw38w7TVn286A
 4Ig8fBdBeerPxKHVEjoswAiO4wUbmJERzszs7bUwxsEa2IjLutwu5uSBH7pWXwYp4VWwHRvq0
 rDtYFhPPbwa9ttLAwxK0KZP+90WMaCakZNhIeR6bmX2Bo+owwtpPy90szrO26+BDSgQAx+rwo
 aq0sTZM38f1C7ow1iMyOoUsgX7GrxkzipmOclVd9MBe2jOt4U6LbOGD3E8CStE1lVH+76mbeR
 8BXIe0t+Ns/RU8t9u6udSpsaGqVloGGCJRwsBf2ai7ebAuzSa2tmLreCABVirbDiok/HRDDv3
 Y+oAN1Knpz38pOOrKPDx3FCG5vhNJhgD0NTlauFpme63hQnIgvNAE+VADENRG8AE8f9PlIjmT
 7YfS1tLp4jdntnuS9pIFaMsmJP4WDiEsOGvjHFiyEGXNJDKNsRC0qfmQqHSizts7FHmNa1XUc
 gAFdjXZMdEaNUJWWfh8sFTNcAGD8kDk/Fc39WJNtv3ARUY2Pn8dgbtQZdrUeISuJXZhaJ4iyy
 sjeViOqaT4xVg529c5uPsehTUGnhTqgqRXQN4I+KTODmnk25k19Rt8N1h2YsheH3tCXeJvs/y
 ccYDqowBjxicp7btZhZYMZg93QgXFVvODwoKrhjz3kh5uODhYqWKrGug7CkHWqik7EYpTGHyf
 EWWZRiPhci2lktTn7pOyTvm/ADNaINxsufptZNaAR3IvDpv8GeDzoR/JfWH/HQoNAh0Z9hhYX
 +paxWHzXPRNRLos9n9CnlOmnvDpHk/qxlC02QGoeode0mBm8QOQwgJXpxK3hR8R1omDaEVZbl
 1pmVHKNtS+8QMjL6oLGYESh52MO9Cf7tnPTRe7KKd+RmD63uXQkFVR0GYn7qb6cu5OTu8xshs
 8ZMgwDjh0lNTHezFEgzGVSWFbgA0Nm4Jlwtk29DJV9Xib3tbsosxmUkJB78L6t1egpDIUb4Ij
 e9dShtJMQbsdWprmw36M8Zozy93XH/+zbJf4++jA5bFyB6ym5IJCiZ6obNqBnX8zNEQteMxgW
 N5w0SXb/tGQz7BChWmuc0I0vD5jPHweXLsVDJfv7krlSUaKfFgSpW5LOPZ1nS87MYvxRIo1yL
 mrULsqoOb1/xSuaaEGtK1iLnupHTcvvwQv6T4gkPZ1sJEtibCSFxFP4JUuK4ut1buj5L4aBz7
 Bm3PXiODzWRjT6h7sDwgkT3Kgxo1swgTCXbGF7XMMgAwwJ6pfqGM0A9I0wV7x40Fl9MEC0kmK
 HWHYk+g1CozxbPRbo0QiKVUIIF5h5oU0OyCPSeTZauFD6mXhciHKtrkvIzSyrmYv4bTaQzMWh
 AxdgsFZbyHXy1eI4I+NPmGhfsr6FdW3DQ8JzLmS+KS3Q30dJg596Z411rnCoP0E/1TRpPPhsC
 7HUj4ivC2ULabhlM0Q6qef9COSQQpUKVlqqAKb4ojShe5An7DyDD65bd3JqeLYWGm16/ZHkjW
 fU0Io4pChmrzODQGXEzMtk03i4V38WWxlV9RqSi7bE7bvFH1+nSXFWzx/lzD+EsbwvjgEzd9q
 Z3wT37EEtoyrUclpMQ0QoKpM0NMFlNSdf/C6GYjfrWCCCcmBXhYkFlkZc0Z+gVpjgtOdmdM+h
 p3odTepv3kjzNLiNfgbodbiOu0f/5LomrWAS+m0KzLg/dJepVeKz1kluqX6zkucEV7rtju0QR
 eGUK4j7Qn+c4TfnNM6Y4UogwTONDe3b5MFRMbv+czmgbX8ClPs2g3G1+6fEEvnmrwSAWuRUEi
 JTfGxFToE4ax3cv0WYqarXvghNx0QSMtHYRV8ruUqEhFq3n25eQM5fZN28FVIgdRHhdlq82e5
 6fx2Y/eDCqWM/jXHXft+sed6htzb00nA1dj3rOh5RhEts8B6pV0LaFVHbtT/V1pqiZK9mFb0f
 SDrDCpKhjY1Mn7kYJFpvuGz7ciUhBorJUpzRROBq8zPNBDTqjvXzLecWokka9T07xdhvyPlaN
 aItfGcO58LEMYFEZkUWufGLma7De63eaJW5UsppN/j3EXVZt7c2ooxcO8v4jxzl0DuF9imZ7k
 hIumg5NGl5Om0ajVuBSXCRdvzdVDB5iNsBJyGarMp12qCr5WJjPP/+aYza2LTGGtgBQf7h6pu
 7Xn4E9LJr9DcJhrd620rxuIMckEAj4N+Qn244XsU4v3cSZjIr9eYdI54NDmDq8+IqQUZgelEn
 U10bz2RjYgjQWPePw7NaRG+jOFFd3j58E1njNIwhoybzz9fgjjyReh+3AV/YS5IHr84P0SYgo
 gKQlWyRATnwf6MKD9ux67KzQ/31O5bvdBzsnGTuSw3ldfZEp/9t7wPaCioiFUsAAONDK9Mkin
 gb7vZpLp2zwg7w9XgJ6MFIhRhJyU/qlcTBKaSbA2f/yQt/Fawrbcg0M/dzyIz0Zh+yPOdbNX9
 T4k7AGzR8HN7Cj4Aul0KZRLE+kH5KKMx5aHRIGsOcSMyrQoFZVMQk1TKGReShT2W+7Qovca8N
 CyFfrojegVruOXgov4OFDXf0IWIPVbYVyB2zu2V9EUHl4DX16DBYqSmZqeoIpl2GVvKhs7o89
 cwp5hIFsaafaFBjpA3heQwSEWe8Up/YFeB4SV2/QqWj94APJIIydS8eRHHnzuuytgYFouFYue
 qVRyqsl8Vr3PwLRHtWseb8oQq+sMs6K8UAK8itBG0GzLwaiR3eakRr5j5P2wDJlOqSro9wQkX
 0255yhHh+18DhJVGn2rKJ3eJE0SvUUIGT6gs6zahoCy4RBr1TTEpSPyFvgPxQ5KaTJu6NbpTg
 628SgY+MdQxAKFLV5Ec1uHEak+dF0k0GhvBOFB1YPZujcAWWAVznNGe5QhClW5covLcH1jr6S
 7jdeYrk4epDXSMvTNTeGKXVSoBNFAI1PztK1InH/FdyW0Lf68LImGBoWkBw75IKOce8v8LTMK
 nO9PsHOR1IMnM0RDNrTfjp58JLgCv8k9xcMHzGtXMETCf96BB16shRX1z9FITetGmskc5NZx8
 ubSvupF911rg/idfpL8BkXH0uJKpliYXeQoKK5FgmFofHDyfgsEArH2I/vR825Sd5Cox1gV15
 7YT5a7YdWedjWupYUui6PQDlCZ0eObD9Lm4ZAcZ2RrdMW+66Oq6u1nLYqpWDzXJLqMbMW+hL4
 vOgl/ztOUeFcCgad1CRHQhlEC7h/JydHdb8Mt3nDmfCqArMVZTrg0mOsABe9xBgANb42NIvCN
 MxOoV5yi3rfjg/Td91FcHmvfOlNpXjn7cetd7UrECX5bJS0Am21z8nQaW4LIaix2qHoYw4lVA
 d4EJrxli+PZ8i/FwxZlUFpLPZUp7FFxdReqFbzBYtQJn5wfhn6rb0oTCJgIUptvgYi5esab0L
 AukhPqwPJa5EaGdze65xGwrTbMJM+NYV7WSWFhuKSUd8aLoAWuThV0NEJwC3IBLNuENrgI3Kq
 8wmd8ap+VGHcqwqoI9RJ5HvbMbiULayGcsPQRrcpxpwekzicPdsrRJxCkYPuKoaRX8j2RKyEY
 Kf9vmGDMukImySidH/fmYExwKBHZtb5aZuSISa5ynGcwDlVWdinq7BAezbotzIbveTNUNsaoN
 9v8wnL4WZY8DusAVKOsyDIMvlZfv//B/fSrzkUzkZzNH8VoKxPLYAJliENxptk1pXntjYduTu
 g123vrA0mXVUNKvmPPLcBF1eec0ptFw6AqfYaaqudO7VsImzqkM4oOMxkxTg7l0gAgxjam8vg
 SGRjZJlBUwikUwZo2zjWfUCwDPDXmttef9rWGzQ+xHSARwlRr7BNRI5y76r/NLqKocUsVOlEG
 h32/Wf8QVOAqxs5v8nwsVxIofLP7uc3sgBOjzdh8niF4sO6T+qRrzDv9gjFyRKcLLVZzdhnsc
 XHxtr26qmI8VHZnCHTjfRcXA9d4Xy6cAorSh8zvSfRvmgZllTeb6LPw284r3kYMIj6xQcnHkE
 UWEupQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1777899383; x=1778504183; i=fiona.klute@gmx.de;
 bh=nCj07FAtUwRMgJvit79nHOFEkkyi/ccLa8NcUsyfV4k=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=M+JGVIWQHGrL0yh5SyK7ZpdcYjFYyf86cBrx5ENzknBLqLubg1xUyeed9scWvks2
 wum64+HndqgOHoMlA71MWFZ69D3+6/NF0XXlxIgVjv3ncKz8hlfB3lYjF3rQTc0oK
 gjnlQLxNmNXYrDWp7qp2lM8mTesuYqR4ySaV+Aq7bSVGPTXBk8aiL5zIdbV7PRear
 l/Mz8cu4CDI9HT5J9gKgAY2LV36lP+0O9S/3ltBGBRsbt/CHstomreWxjR0tlTUsg
 y4sbnPkcTIE0T/QT+o2jtgYiYpEr/TwtZvHve4ztVzpn4WkPU3N7cGnJsKzFvjwNB
 oF91SXOSzGwm2GPWFw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=M+JGVIWQ
Subject: Re: [Buildroot] [PATCH 1/1] package/openssh: explicitly configure
 PID file directory
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Marcus!

Am 04.05.26 um 14:34 schrieb Marcus Hoffmann:
> Hi Fiona,
> 
> this looks sensible, but ideally I'd like a bit more clarity of what is 
> going on in the commit message.
> 
> On 5/4/26 01:25, Fiona Klute via buildroot wrote:
>> OpenSSH checks during ./configure if the default location /var/run
>> exists on the build host, and defaults to ${sysconfdir} if not
>> (/etc/ssh in Buildroot), leading to confusing errors. 
> 
> The errors are at build time or at runtime?

At runtime, see below.

> (I'm generally a fan of including the relevant error message sequence 
> that's fixed by a commit in the commit message; if anyone else 
> encounters this later, they can google/grep for the error.)
> 
>> This can break
>> e.g. in a sandbox with its own mount namespace where there is no
>> reason to create a /var.
> 
> This is would be on the build host in this case, I assume?

Yes. I was running the build in bwrap, primarily to test if there's no 
network access needed after "make source".

>> Explicitly setting --with-pid-dir=/var/run overrides either default,
>> and only logs a warning if /var/run does not exist.
> 
> If it does not exist on the build machine or in the target?

If /var/run does not exist on the build machine, without this patch the 
target sshd will place its PID file at /etc/ssh/sshd.pid. That then 
causes errors in the init script, which expects the PID file at 
/var/run/sshd.pid if sshd is running.

Because of that there's no *one* error message to quote, but a "stop" 
(including as part of "restart") or "reload" will always fail with

no /usr/sbin/sshd found; none killed

from start-stop-daemon, even though sshd is running (because the PID 
file doesn't exist where start-stop-daemon tries to read it).

On the other hand, a "start" command will try to start sshd even if it 
is already running, because it cannot detect the running instance. 
Unfortunately sshd does not fail directly in that situation (so the init 
script completes), but something like the following appears in the log:

[May 04 14:48:05] auth sshd[4592]: error: Bind to port 22 on 0.0.0.0 
failed: Address in use.
[May 04 14:48:05] auth sshd[4592]: error: Bind to port 22 on :: failed: 
Address in use.
[May 04 14:48:05] auth sshd[4592]: fatal: Cannot bind any address.

Not sure if all of that should be in the commit message?

Best regards,
Fiona

>> [1] https://github.com/openssh/openssh-portable/ 
>> blob/5fa60ae0d2ed3fc441f54c9349afbd63b6301929/configure.ac#L5568-L5576
>>
>> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
>> ---
> Best,
> Marcus

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
