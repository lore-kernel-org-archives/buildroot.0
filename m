Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD67CD6E52
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 12:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1994A610CB;
	Sun, 31 May 2026 12:26:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ypqy0w7HXHc; Sun, 31 May 2026 12:26:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C320260F04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780230382;
	bh=CuwXsOPIRayIB3pGcqrqn0BtN2Y6altPzuAufa/ZpnI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=A/+MMp/XPfQAyzqczB/TqjFOZZFyuHYeixnjf/Es2jpDkvbvdMDyiyEHADXTUBFx7
	 qV2bwJ1Gwi0hWyX0UJf3ZbIy6tS/IC1INNPKAM+rsC4x1jzNzvQeKTj74U2UDrRoC1
	 MhCwVDL8hptyqD+uq4kK8lKcTq1x7dbzGwwUHncfJpTH1+WviYtPc/1SnywD8c6vD6
	 qwnsOLW/3ziqBJ9PoSMLEFNDkVNVVBtQKlZV820fLB+ChzIUroaVRAWGYuBv8wj6Tx
	 pZFTTU6V6StdS6Kh2LF6G+ssngU9r+PigorTfbfb0JHpWq577J3JublSigkYkDBxsW
	 Q5Y/DKsFJkImg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C320260F04;
	Sun, 31 May 2026 12:26:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 559CE389
 for <buildroot@buildroot.org>; Sun, 31 May 2026 12:26:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3BE8460F04
 for <buildroot@buildroot.org>; Sun, 31 May 2026 12:26:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NOU0d1-5rju3 for <buildroot@buildroot.org>;
 Sun, 31 May 2026 12:26:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=and@gmx.li; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C1A806089A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1A806089A
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C1A806089A
 for <buildroot@buildroot.org>; Sun, 31 May 2026 12:26:19 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MatRT-1x1cPr2M9L-00eEQS; Sun, 31
 May 2026 14:26:16 +0200
Message-ID: <60827c83-a835-4f53-b633-d1029e16599b@gmx.li>
Date: Sun, 31 May 2026 14:25:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20260531091932.15865-1-and@gmx.li> <ahwiDEQcTu7smad5@windsurf>
Content-Language: de-DE
In-Reply-To: <ahwiDEQcTu7smad5@windsurf>
X-Provags-ID: V03:K1:uV2xmFnmwdfEshSx2JIs0YSHV8afE2Itbb8AAZ15OLDIIVeP+z2
 5oI3EyLKbXFl5rRup5a5dCGB05KCYYmm02c9pXVXYzL9VHDPthphtqavATqtjmK4jqVjr24
 +biCdRtfmB9++UyhpVTfn59OOks7V4HtNT7aSG+fp31Prr9ZbXdGKWaossbfqfkDFaPaa3Y
 v1Hvt6mRRVs2+DTrFm7Rw==
UI-OutboundReport: notjunk:1;M01:P0:aXzvi7xRlVo=;zY7041AmXaAvic4JudElVbS5C5w
 EbFSg4gjo0g2sVbpB8Fqv5/mRoPqwy+oXNRwscAZwTyE6LOGH3l7IPU2LboMlXNNoWDVaEF6w
 zqDDYb1AYLrrK38yw6qT/FfQ1mCbo20+NYq7rYrgXhl7TkoxF/xxJBnQ/6dkeOfURazX/yym5
 Y25NbxVJtRbQl40mXzSHHXjfnxo9rhf37FgVeiY2ID0MumkcSmEyzy9Y/IHwcPIL0b1knEEzm
 NwrCZzoA7LnJAeAoMkP0ivY5Jos/Yz2ssfbFSP+VfQYa681fBE/84uoGG6VAVug4mlxSgSAtP
 wbtBUSv37u7phw07WvzznxGva+7OGGm2MBTo5ILdKLZ0QN5PLMTxgw2es+pWPGut5AoisvfFA
 7xcAjnpPNQbPR1D6budxXi3G4Nbk5QljTEMYa8/LNnCg6tzaDQpBhLEyw92EbJf021kED9Zqm
 xDKhUhPANGnb5mgS5X2rW9Fjqmmzr+MZJHgIRaOpYQUsunZcnHGKcdvLwhvN1INvMfB3GnD1h
 aP3FHV8agWoUy27AFZ+EADGPp5hZye9X81uMAkBYzzcHjBbkQqGUTEfgnLVJv9b6d86paGDEZ
 oeOhjCARjZxDyokCUCdu7HFVHm/GXb7JIkotM1/uYlby3/CajFCi1wJr64UUPG25DMGBTHiub
 FxffEirc6DcwzaY1cnMGFbQLYFxjlQK3Ne1BIJxpoUMjGpNzA87eavF0ksoP+wnitJ3d684HT
 nQOXekDDUrEcVFqbeOrLEJU2tJu04PqaKEwng0KNhSrIUdDfeJXtz4zqoT+1UgULJLlPbGkSK
 yNUtpBugVbmr7dXa1LpcQzaAogFImNN6gmuG/gO/Ux9Qgpw0AelMOkv4L/vJ895I68GC6h9lB
 u/B2E7aN8/ywsn52Kr5GA2g5X1ENOL8DJn/M3dDP/rCwDUenWxq7KLRGQADV7Zkx4I/kt6wFq
 FB65qsoD45V1FMH4bvLQZwmRWJLlj8+K46KPOgjrtT9Sc95ANw9li1/vJY9i/NvTs/w8n2bob
 eMT8hhi9RZVmXGZg10yDGn7l/utIPo02fOuNIFQR8ghOIyCqJdfVyMGfM1HiItfBvDsFwbBVv
 KttPc9Y78EJ0AA8012MyeJDNXBz0KNbxW5BHN/RvcD5Uw6m1UW9il0X6G6N3AEWCgFRnyfvCF
 KDwKJQsipVvvybarDmmJek7or81QkR3lpM2O94oQg9oTtxdUN/Um2Claq9AXMrcfXgKAjDQiw
 ZAicSDNhPl2Pyte2O1JU91dRCsr6GJUj5vaqKydgzlozBPGyTNfbmNmEr+37Y9N44rBCHuFyN
 9uvRHVkx1zjjfyMJR3lO4S7o7WVlFXmFP+OboLPyxlh2YGMO8A0xMFheW26oZ1bidgMfx7nTy
 69ppOxxJaPOQ5R8IgccfdpHs6okUyUO9tN6No6BTCmD5n41xpxidu4rhkLBrP8sQ2QkiQxUUG
 6sKpqsCUqDCEFHSNr7b5PBjzUGfDIjkQXidF0njXdEarIn682gFP4aU5uHxY3RZake1ePX6cq
 FAfF6p3nTAmeeEvlWi9UQn/jmaSGNz5Q6sX89oGkQFf0HaF8+0l5nEsSChYfpPOZxYbkgLDC0
 Mju9o5jXLHUGEGrmjHPFXjmZy1lARcehB2IcPucg5RWUW6ny7MfG3ln6hBBAmLOaqEsCymfji
 VNa19P3vvGj+Sz2wmbtGF54on30RFYh7/OdoOVdP7whKL/xe2ZuCDec55UuqQrPj+D/DSfXDd
 H05msIDeuYrjRX/m8ppf29olX0Yvlm9RLZYn3tkH/oY07RbZ70iWFGnNc6s7psSMrpGK1b/AO
 S/U+68XNI8nO182ItXu8Gd8ZZRK7ophezJRgKuk3JGfZjr7Wd+MZVgQL/DZArSPoBKoduZfcy
 YDUfEtjvAiBl4RO+LVDr2WKYlx72vJhLT7oQl94kVcTseCKoZ7S2TyJfD7+wHSPcQzPSVkMRQ
 7SrN6JM1MBdAkyJMNLa4vrDnUUSUqproPyEDk64clYPAV5azEf/XpmXcJGvcfWUTwxQn3v3+c
 AzQXYSay5AvdA2EAbRDxcGyCZ0/XnbrM3nzFLkXBko6N5mAIUKKQuFjy6rxoGFWypCYsW2+pv
 rBelJxS2yrYwpxAZTM/rPxxAAztI6TkgljNk/9k2yGZ7mPznYswioY9Bjzn7HW2zOGQcouFVt
 qMXnKo6jc1OjphrWXiX50mNuGkBUhIu0qp3UEEh6UEwYvzMQhsT4p60Cuz66B2GzJRcGlufWs
 FtbxhNUEpoz7g/n8hgpwP8jhv4E9iRwSGL54jwVXakAPlFba6iZccuDhYqdyLzZvwpHDsQBtP
 219VsvbmcfmUVSkaISHYOjKTMoei6baEk4WiqzJtWz4P4QOCnI1ugJyRI3Nh8bIWRcCu4n5wk
 /v4XQJtepSWR3mEmhK++QTcXxDiKg2faY08OXbqQUaei7TBmI6jBU/CzkF0N0hHCncPdMSpcD
 mcbxJ9xBl1pVlfuGBzA+yBFS9SXaCC3o/pGnEa9Y55mOazSGygcs5X9XAYxKpJYklphkuRmP/
 ADvNtUCfgv64JNb4JXJvVooRH/WOta48PWp71Jy1LicQIJMUtHZl7cdGh85jtrELqoTjcSesQ
 qwhYGisv9nSX36fsC6chq2w9jLo0NhNhVo/pEFRybd1lIuuGWZ1U4nzACwfEFh1A2A1actik6
 jmPMUVMUar/5dDmJ3YuM+lx+7hX7lRtb4nsFqQ7HFvDe811B+LJHNVUC7zgZk+fkM6YoE+vmc
 KVjvDm+dPSq1eNXUPCXH52C39OZSfi80Icf51KuJzJCuyyydG/bkLqaYdsreFEyeh2nqkWOiF
 vwP4AoBaaFah+s3uwMhBJiflhFhSQFDqhNAyZ9LDACr0XoUmnM7j4NtVTNjEygXnTVcbPkQoa
 I9xf7BJwDlPqKwtFMsddEhdmhVm4C2WTeyGuo+Id1A0Qnqlk2Ay8dXkpEEPWexb/PJ0eGaTPX
 aXuxwxFCnerKEm47pkxlTyn5q9PZ0o2qqqaMmb22I3P7SDDYpC2nYwW8yCQ5b8Z2bSDqqz32L
 iQNg4VDf9zCGYnP2mYwLeLV2onn1dU23JRGlMQnuOr+jitSOQtCGDEzebXWPXcc2oKa9v60wU
 zpPcjMD0ofHcNpBKO9S65v4p9gIUWDFl09Rx3aywlLBGKQwwU/1QkWSnhJAhbdSDPZT9ofIks
 ohv8NucEJUBIw48eF/hDzXPpkWME76Btej9utRXYXQzsot4WCZEbz8Zjq+6IYRAI1YGx2rkwv
 BWCnX0xBIcUzOSR0w+gFu7W2Tmacpu1ut7T2ObaJwOAhh8z6l98sRP6zXan96FqNIFU9Cv8/o
 Qzf5ZqcXvB8aCIgHybWTOcW5ye58c8VCnrPPm+Xse6oqFTa93pNwVidbmvF7XD04jvYV6kkAe
 TCUhdjY+rqDVzgiHzPTBLhIfR0UafULQUmlli2+Rp9/n3cSBPFvVGWcfnsCim2/UKgKcwXh3D
 HpftCqtYULby0mYYAovhTD33GFBmyBCq9XhMqb2bZVoOIsKLgNDlYuiOLD3MGK2GrnLVZ6Ufa
 5x8F4tpiIm23NE1oQ8awgZBH5YMVlCyb7rn0yOrFJfly2ohtC8fbpCQTUwN1l6UUjlsrc+Jv4
 4KcD+y5U8QwzWrb8/MXpGj/IXH5cb2u2UMOW2T1JXEZ8gjVvptezvcC9FEhW9FOcewpaJf7UK
 /85aqy+AwYI7ZX8RQ0dGesmk3/pFaid7ZX8RJUxjCEuhZ6aeqdY7O58zHool61ATE9LS9pu9k
 8QC7ppnkK08KI5w35+48j0ApepzMtby/ff+HbPuQGzXu+lcx6G/ux0EmS3CfhOs/pvArF9oiC
 ep+SKJ7rBxSqCAtNOtIi1pb58uTbip5i6C/53TvMFa+J1iWISHmIumz5K4DC6Be/9ilgJmxUn
 oNjZrCcn6A32Ae9CikyKVr3JRz9y3SN0QK7UPdbKeKQAOvWcLRWJnjk7Pa6NrFnl6VurV28ef
 k1rPMtHBVsZUNNiM6oCkVZkstUC/OrWCI3sOgbeZLMhPKWSCrscFdGf6l5GS/Yp7fEj5j6GiS
 JyNiPH95ZgZBZTu80WPhTlmxRoHD6QFYIMw5m/VmDrsU83isuZ39T1IxQg0ZJoDIggkSLr1Ik
 yxbG8sSeWXrUqVxNL+RsMys9qVs+TpBBQepLo3E3V2Hojkq/75umPm6AY5GsO8s2G3Cm4oEiv
 qHk/4eEJVlGMNpiFO+DNNJyZBUiPQQ+f1IonepKaEBdLVHfOLAqzwjZLg709yYQd0UHases4P
 hAmuZEkcH4bofmNibuMISl+S5/vHcV7ldvDF3ypJo6IIlioPGeXpBuATGTSyC9RSz1ZkcwANS
 wTbn5Uf5w//l9z4PuxOsQo/0gkIO5s6LLi+mTKqwrmKkst2w2KShVHkkm3fqZX4g9IMrheuK4
 48WKbwk6AVWVF4izkS+UJD/WytmnwhZ7psNqsXFx8rH2u/wIDyqGkfO8LApsSbuR4TD0slPJW
 szcDovZ1F8r3NSjVVhTw+Fy3jVqjSqSJLcbmaQNo/3K2FcKm2Odivh9sDJIXNbEB0WcBbBSJ2
 jOvzyFa70uEZwAqbkLQu6QKxRTjGzeqsMb1XAEKO2LA/qmGBFLF/stFScObMsk4zviOlKpc7S
 VM2ajjapyDqBdSWlUYUSCZ6hrBb8iDIW4RijH0W85x2buEXg9fQg7ADs8q++R7QfuA9y8doDj
 rWxPSwrjErvMkVGFBOj7DZOWN45SlFBT/7blj5lITd4ZP/JYQ0oQb5UZgngSDmD8IsZBXyvPR
 s0z3KDkBNHzXkmcJbcm5tR7hZqWwCLb/Srz+QvdwK2a/vmJa5Rje+iThH7f7wjsx915l5fS4t
 NqsCTWDtRA+VQoQqQ+XrBpG21UHswl84X7xNJt/wHPNbXgvkPs0sdi1zLvTNe6oiS1mJqLRDx
 M3oj1Tu0q09DZkrBnB6NomlfmI2EEZXLtvAuf2BDkmx3Bab+qoQZjvFDCA3R1x7BA131sDuC6
 bnIWA2oedaw5jvaAazhYPKqrKkNDr5XTqA6tWp/IIdTnYchj86RaXGe6gNbJ8mKWfGWe3yKW5
 IOpSiohsO5UTn9Fpgw7BAkQHZJtbkESu2ydfngIgVfTwA387XrviNFVaxqGy3To4dkuqX+5Pw
 eWOalUFe2lOJKpZvWr9Us2pmEP+zxWu0NaLuJL/UX85m3ztjRVONyDQcmODeajhqFjE+VovEO
 2LkVe8xtZL9evHVjj8JOq2c9Zx2M/kV8IrQmzSj4md/F9B6/jnDikPP7bj11paFphaVEea7wG
 yJ2CK5W8PU5yaG8GKEPboPHoHT+0K+ZDgTH7tI56sOqAXAL7QJUJkfZfqA7yvAR8be20lRy2x
 zhtqDABk4zzxjVWR0Fo2PxskfTIS2g20EmSrpdkK+pT5XXL8WWa6DV0Jh1MxEXL/YrsPjCw34
 SLSU9ADCbAYk5DgWkrCa/xWwdSn2aoelkKNF3Diqxbp05NuejfyWCY1NFtp8oGZH6idPRxMeu
 /fQxzaFHICl8HnajrAxvQsOP/Y4Kb2Cm2NGqjGiiRo6pJAQPJAqqC0odnbAB/ggrOQTY+o/oy
 JMWsmObamh7x3cPyF8diXI/OMEP6OXv29ogzVImJSisoAAAOdjHuulAcBf+kdezpDeSQRy0sh
 TJNeM/dTkl99sEBfUowvvt7ESHBQg4pZ2qZyzMhkAFqfa8P7iY8sOMG5NbGf85xcubDFYDjYq
 6/a/YMtOWVfvGcDgklJzu5dHD78Z35
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.li; 
 s=s31663417; t=1780230376; x=1780835176; i=and@gmx.li;
 bh=jepuemNUUZvzgBjfy7S0unGzy0x7mM4f0c9rdXUq3o0=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=hYCFp4pSaLxMOJrN+rSY5c7Em3dVGXg2C2hqTG4iGzHMAOLankBqlzDwp1wcwh7j
 qkpLBgo+kULViDWCH92Xn0ArjEppKv+rj0rzTQqYmgZh19/RKorg5p0HVpc5BEhgb
 vhxfLtUv9Laa0zX3RArw+IQd6k341Jmi4u/eOMbbOvUuR1yJaQKLq8peiQZYOG4uG
 KybiGWBNBPQobDf2A78K5Wr0IKHzsOMYk4im/vWrTKsIQemmAMxkhR6PrJazoX5Qu
 T1ku8LQttKK9TStx/t0i0IB/KaZhZ9Bk7CTCBNd8JMiqjNdNiJwiHwLZx22OuA5rp
 btW8a+kJCDzrxuHg+A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.li
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.li header.i=and@gmx.li header.a=rsa-sha256
 header.s=s31663417 header.b=hYCFp4pS
Subject: Re: [Buildroot] [PATCH/next 1/1] package/cryptsetup: remove
 libiconv dependency
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
From: Andreas Mohr via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Mohr <and@gmx.li>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


> On Sun, May 31, 2026 at 09:19:32AM +0000, Andreas Mohr via buildroot wrote:
>> Iconv dependency has been removed since v2.5.0-rc1
>>
>> https://gitlab.com/cryptsetup/cryptsetup/-/commit/6e47fb6d8525a96bf264fcd43c163bb4057fa99a
>>
>> Signed-off-by: Andreas Mohr <and@gmx.li>
> You had forgotten to drop:
>
> -       $(if $(BR2_PACKAGE_LIBICONV),libiconv) \
>
> from the .mk file, so I did that as well, and applied to next. Thanks!
>
> Thomas

Thanks Thomas


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
