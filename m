Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DFA606A31C
	for <buildroot@archiver.kernel.org>; Thu, 12 Nov 2026 19:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=dx1mJ+50
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28CC460D65;
	Thu, 12 Nov 2026 19:18:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cxM9VwDpG0JK; Thu, 12 Nov 2026 19:18:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0980A60B4E
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794511108;
	b=jRY2am8fwnmOmtTm5/xKtx3KqCW9wxKL+7IIC/xHnqJ9sjmF0jw6TsgvvoLk4Ny8CCZZ
	 CJm4J80mMWlaFaz2IyBnoVrGztsZDDAk+ZXDhgVuHYB7GzU8Vjif5TPkume508+euN828
	 rCJX25uANfuDQPl2N4BLbNMJ8wGHLOBQtOErYc0W4pMhJAmo/qt75KFkdrIBf5BMRRI/e
	 YqVUq/yUsnpYpVkUSI+hSgyCGi8p0ZPC4XMsgWC3prNCP3AGRomBTaRMxPm3Eg7cqoO01
	 sXgFbbMfYK8t3HGan4yca7/Lq2JJziYWh2bvD7MOW3uzM88AxpfjIQ4FCgtx8thghFA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794511108;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM2-Signature:Message-Instance:X-UI-Sender-Class:Received:To:Cc:
	 Date:Message-ID:X-Mailer:MIME-Version:X-Provags-ID:UI-OutboundReport:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=CvxKT0vcH55Cf2oNBwUGBh7ZQde2Uz4lPmf6ytwA3nU=;
	b=jLlGLUWXbM5S544O3l9upF3i8ArFuYefMKrXfYXVm7J6u+Nq+ilHDvzq9UvtWdcqUKnI
	 gsw7WfrdAMp6eG+/d+efAHu/iyJxxFf2rtMwevLAa1b65a8zEY3KXhzbjjEBpI+amNtSV
	 wS7QfM1OJht5HUNFvuMMkb2SN3rXG0D66bqt2wPK8iga2udXcDXT2mMX+QFBbJ9UzYwIz
	 Cyd9zGHjvElpP50y3DRNMTjAYpCYhDKSKDi+Kky8xW0R+qiIhA1+9d3IP27JjQJ8gRrYb
	 CwBB1Q31SP83WUnLcZgEagakO2q2H1IFVXKq6Rro3YYvteMtqYkoqHuo1p7SKRJf0Yw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794511108;
	bh=CvxKT0vcH55Cf2oNBwUGBh7ZQde2Uz4lPmf6ytwA3nU=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=dx1mJ+50GdAphSmcJ9ZzbZCpafFVGbFotGI0bydDy+DlhyBIX+8ZJ/0SnqTLEw4O/
	 1j5qR09+ShyqxykoVhslpj/gPfjiqw+3FTdWvbk4MVp2q1Q+29NzkYVQd8vCIPrjIV
	 6dYVnck4fI0HqCXkYPfCxZtWBRnSh8G2AVkgSHn8asP3v3ve1dz1F5z71kf2bZ8b5O
	 hNandbu1NQkbX2GLNm/YjarY5BdgdDcTgZR6JN9o344QsQWmf18+aVJ6i7gyoM45rm
	 e//Vf7xnMnZBijypMBFiR9UncK/uolgvsybOH1wGzcpXYcrS01yE49dHLoV1iUnGHT
	 yCA2OsceD2Jfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0980A60B4E;
	Thu, 12 Nov 2026 19:18:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D7772FE
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 19:18:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5303B60B4E
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 19:18:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XVF47oP80x5w for <buildroot@buildroot.org>;
 Thu, 12 Nov 2026 19:18:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D79D760733
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D79D760733
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 19:18:24 +0000 (UTC)
DKIM2-Signature: i=1; m=1; t=1794511102; mf=PHBzLnJlcG9ydEBnbXgubmV0Pg==;
 rt=PGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPg==; d=gmx.net;
 s=s31663417:rsa-sha256:t8ZHIOyiDLWk50hYE+VuVRjWoVmx
 ++VzqwLpD1dhVhvhEbwc2FW1YHUpEeKuprMCUC8K7NH4YGM9qLVOM9PNUa3CFeJzmdntq2zT8ki
 cKx9v4ku2UOFo7RvY1w9/RXPs6+q7rDuZrhCHSrnZ+Fcwr4hndSxv3NCJ2n8uprI96Zuwnny+nP
 S+o7dC8u94QtdeWocBxVzBxTQK+GAe4yZ/QBHluQl+Vwg5jF5fgS1rcp5T+uZ740wpbl/5xZxko
 lqTqNBvCVGFSB0qnWzoq7tyehnTX1WrYd7RMcvbztaSiSgdPzErlidKm2ME2Z8MQRk63hPsxMUd
 zVAFVW2s2oIzEA==;
Message-Instance: m=1; h=sha256: QCzBntUEC0eEG1XrkK9AphQQpDPebauNY3q25CqRAE8=:
 JnfGdTp00dMTvusUSqUw9Kapvvmi9Cz4PhYVIZ0QrtM=, sha512:
 /ne/oz94cnXiZ12Ll/FQlYKvWI5sFHo/dogk1OZz1PrtsZ577MC0Xr4B/kasU6Wwg0jzK01rZH7qoAH/C7HPlA==:
 uTfkbcCeX9QFYjoUUahCJrulMqv5ozeUPAspl8SWCcTBZYziJfGu5NoKqCXOYWPu1FDJgGjqpqNn+fc93ns28w==;
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M2O2Q-1xS9L62XJ0-00E6A3; Thu, 12
 Nov 2026 20:18:22 +0100
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
	Peter Seiderer <ps.report@gmx.net>
Date: Thu, 12 Nov 2026 20:18:20 +0100
Message-ID: <20261112191820.1758859-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:vD7ieUdtA9g5Wz0Y6QS9G89IT2/0KX6Rpc/tgwrf7akat0f6R7h
 /PrUERd1AWtTT3qvNkD2UHjDO8Fq/BhDb5F+AYMWDcP6yHDoQGYzmOQjB0sGNtdNPwPrsTZ
 e9mHvw9lE1/xcnRafiabI7FPQUBcnrles3Oo0D1oEA3mzdgaRD+BEcAd031qSrxWfbQ6ZL8
 MESk4NVp8Nr75He4o0SZw==
UI-OutboundReport: notjunk:1;M01:P0:+YBkC/T9rwo=;5I2cTRAz1C3hF7stzul+G5YLVPJ
 QH5Uo4cIMxjG3FHiZNQvrQ0ZYpwQdBZJz55HXOATlk4wNK5XievqTlzqN6irhnnza+/zumTeF
 lXR5WQjnpINQbBrFu4dLe2zAFEUa5ALJl6UyXo6aS04RgSXKOnf3n09drNApfo6H5oT0APHBn
 V7eJY2+2xyrr6tqA7LdcgK5weDNqIWKowdcGcfOyIcVJurnjVOlyMdh9jVdFpXzKSRn+hbbsJ
 oK4xobKqyKqdOdZcwv7VpC3/8vrq1ay9KC5peaKsohfV2Ji0Lib0bF2AbXHdbSeaN9TXGhN1C
 ki6iieXIHyyiNoZcTSB9P0FJUTtrbRlYu4pD+6qybgzuJsB6w5+kvxlSALZSRLY2ot27+0G6E
 pQBC5tunSghvDbaiHS5NEDClb94h2hC5qNMggRm6PuxPcyh86w08d21ao2Fcilj4ltazd6uBD
 +FLpqPvHAwFz6kuZBp+xTQFqjqeS7tWuL1R4NMwx1LNR7N88Ms+O9AySg4Ejqs6NU5us2kaNB
 zVUgdXS0NCz314CBEKz1YFsXstcqquNxvQqZfhGrT6t3dlzk8KwG+5g9e3RYHMXj8tpApfFte
 z2c4RDlzvXCci+PFHR5ykVS86ALvq0qX+Tnms2+SppfNPP0F13r8GxwlpOzTYnPMObSKldOv+
 wXoN33yJ/vGaTGFb4jD9kj/X+UoJtdRx6gtjZSgX3jFsy9SI3h2UkZ6gKiL/8zu5sW59vdnPN
 bB6/YaSYTjY5HXKjWUPwj2LaFWji2Ss85GkZb6Oke6YNr1EK4HSOYltNMs5XyrMbAUv+xPoCi
 DAKFXqoFc93zVrv2aD/Iy21joVgHudWsxGhqtY6XG9LuiutjUKXyQcITB1M+F3O28YP7dzMbS
 GFA0/XMO0PyFmVSRgC1ZsRCY3yLyHiDD4Y0QrNr2ZpbR7XSrMVB45vZLlQqv26xCsOLcGjrnI
 sJSWY3zD2bpd4lEbuv552pRryLHlr37yMjl2gqVoVZvNeg5fttvpg3JwUsEOuY+gTod077VBC
 p333LQWrLz+BXZbe+LgV6QosoUkGvZzOly3X66OQB3zKqho+/X8hFAo48PfT0HiRoR0vt7bgk
 712o2OavgXaubRPieGcxQ57zMWQiBWk3zDlCzpI3FJb87DD/Qrd/eMyoK2BxLljqwQzwZYSG4
 KttyN55xCy2H/3pNzwvBKvrwjIazE9p0V8yNDy9Ia0ATyb9ELjiVB/GmKgRwfhWJliVyPfhNV
 3KK+Kxp/VgpO6B/6XHKPHCDGIEPsm8+hxOLI3qiso9frDLazgD3bYvzyH9QKOhgYkyV52heK5
 VDdBcjdO+ZZ1e1E2Q0j9ZfCPFrHHRY1PWe08D8OoV6xPMVmV54pKdOqD0eL9JtOffGp+3Ghyz
 zfvczgl1RiqlG/eP79BoByAbdUV83skU8yp7dIfQetKFVOtATCaRkbIdqdUZ5ph7e2skTuldE
 Z+7iHb6H3Ms3eJj+ivRjLiJNWudMmY+3FUpYYY8E637FmwbVaIaRpVPO8KGdU/j4YXnn7neq+
 E5vQOZ/mHnmBTj9LszBK+fJNJDTbAUW4CoitRIFFovaonV5WjMFZuvZrZ0D5bgporIH2T2liX
 v3SNC0AxmU8A1XDTDfxzdu4/x5Y++nX9BgE4FPyD6UwL70uV9SnRMHqqcEjfr7y31I3UFc6H8
 oVOnPt893X7GAcg7tFA8JSHR8FA2f0gHimnBkePyjT0yVSStiZu8aqUFk6ejO8g4xTC7kjAHx
 1PwYaB8IUzqp3C7X1cTgN9uK7MnLoSuJL1tsbWl945nr7edVTtm/ocpUU3Is0uc9I74ElSIFo
 acuqPmbvrSCOXusphGeHQNvBjz7czsc8x/kxmN9S/LNc3qE7VIudAd6AIIGO5xeFoZhjGqAiE
 Jgg1pL1MfWF0Vx15TvU8+F22pavSEobuED7tjM2d5Q1r5mN/jFonVUcI1/LSTFY84xuZFoHvc
 hxJsP7ynoVYugpSZjpiF9RuXkSYfgFQcUdwLQbHCzIg99/89roOAPWvrkoccwIvpR7pMDcM6c
 ZYxWOeetms9240z19HXwH880drPGQT6KTZMoO1rsNXJC0K+Q2VduJ+BrrXTklY6fMrJd697dj
 BlxSYViMcoVIK9wBQ7S2oiUQda3JmVq4h6HcvVShnZ0xLXYUPG/L8xZTLbf6XgGhUF/ZGZkYz
 /7Q9ajH8MAbECeYo6ZC4WlMavdeDTJWryWhC7EAmPjhxvd5DwZJY7th7dmdvH4ub+167G6IGO
 S0fxkpSX1PneHHeOdHPPpspwbxoTkFRcaDOqFDRXbmoUj2gNnhf20ZRtFXVaMGegfm28T+1A6
 swT2W90ElLMxa3Zf0mwlrIdubR4SDQPhEXtalYCZNkl4VsXwJPWYQx6zFwz1itXRuhjruUVli
 PVrXRmdPPjxbTyHFcQCkGh4OnIshmthVpRam6Td59+7uWm6sJMbxClYQiynbKZzSd4aLohBuM
 dSPPoakJ1sT/lx5OVmE/nHLEWfunz/bo5LYz50+A+YfRNPs51WZwPc2vrl6LzzIHw+Lo84Zbv
 o2/1+v8VibXgY+MEzRYBM/WO2m29QYHzsOAWw3AJwiK32/aA+8QQvTPSW0LJNrbIGzegxamJP
 XT15Eb/UYnS69TZdPHUurnOqd9wKaHBF1E5CE8nayO8ovgRgshp7/h6y7Pk5N/8lHJ0ZhuyNh
 e2S4SrF2pBSQzyLEjubd6eugAgzzYDI7Hhw5DDnFUSDdyjaPVCJP6dvBgTx1m6yKGVIo1G0UB
 IdXt54pcKkosi72b6gFG2+3obI+cEYz132l8J9W5q83UK6dTVGn8TUanJTLFpVAJRYi1r0cIS
 DLZKcib7nxF7O8Mcasc8T/+OZ+o3eHtRSEvvcqThH5i45rwtlNmUejWy4OHueiKjkEf92QaE8
 rAo6eDR+UBt7ZJuW92h/TldkP5tK+KVreF1TMTqZKnU3fvq29KM89pQQAhJXPbGwxmh3QHVKN
 Y0XndA/778jQOfIVnaZGyVBKJcEpAOSOpQ4Pyco8JPyaPCbhi0A8L0j+XePo1zwBVaAp1YJ4y
 hqRgeZ/g5ZQe5S6FK8ktvGjIYsSWywPBDXw97T5e4tUUPmAkQP1AXOxgNc/Cw9Uq+RKdjwz3J
 vurOy3mMe6xgyY5/3Aaj4iCo9gI7HZmQDb01GOGdzLUTLT8PnnzaPfNu0ch69uMtmqR9q/0Tx
 zMMjwWLqBr1obBwnQC3l+VEwnyaxChRvCKy0qCCqHVTCShLGV3mpgxMt6iq0OZl81OHzL79mJ
 y/zmzGFy2+ErMB2QFpVky3jESY9ramM925NEdI553xzYN2a/VQ3asGxwTVX9RSGf8layHVzT6
 Sm/3lXnh4+teNNpI54HO1jVUHwBv1PkS1Ldvyxjo90ssiurP6hPyam4pJqSNcFo9HlYxDnaZE
 pfGQN9AyKiGsJbSf26QfyYqyvGFJHTWyuqUSkJzvLu7s9r2nflOhdSLkZSOE5RWiNZlQo0pjX
 griP0yxrgcN6Mh7zbCh6bAfG98ekrE5jNKSXKh+jtK9Zcx8e/z/Xl+GP//0L/04m1hjs/6aeS
 +UNU4irhFrB/xejKV6iq8qVOJljfgQgox4ePQIaRbBXW2eHvVjjsOw7LtV839mUoGWVa7NEHl
 AxmRBg5HPnqxr7ZsvFMadymVgxqAcaYZeMtDODlDLgg/j4P3H1EPTaQNhnzy3Q8TCj12r7Rv5
 +qqaDTzA6VKIjWxNqZi0n9JqLO+Fnc4GdJzj/74dIS9xwVefHRpzaB0V0utjRilPPcF5HZ6yQ
 ghYXpVcjMpZemels46TG7rCnlM0Yyj408Q/cS0saXBWik7H727zI8bGcSnlzwyeI391XgQHRG
 IjImtQkyybWo5EtHM54gfo1SF582zj3FZ6VeaEKqrHfLmN9oD4mpyynJk0RvVJqEuYHk4OYfr
 oeo6+MXNxwPJYD8PKDMxocNGkMsSggES6zRVxKHuCoRzRAr25w+o5JZfMfb5JP3uEQLI1Arag
 xiqca/ZkFGvBW3TW5hMPifNDtghYb7/SXnAYPiJacRYRpKr7eyMaukbDlqyXmsk0BOcEeu0C2
 kceqPqE5Etc2rqvSvMY+vgjKdiJTXSUrf+bemw/Z0zlNcKx6t4fznLjIRM9+Ht0Kg31kq18Cs
 0SAXfrggjg44sLZ0Eldfc/kYzv3v066T3ICSo2C8BFGF63f1fKgqhTlcm+nzD4GV9KdQ0PhVl
 DcbYfD6tz5Cz/jZh4esIBI5t97VFKbrkx6gV360Q9cR21Y8L1Gz6flLGb5MSe6oR2PgYkv1eZ
 pvZgkskCD6hTigIYSsHDb1JQPUO8AQHM2oMHVqw4yfI5ySPvTvIAsiDgXBczhwSJxojU7WXSY
 y0DdwjxpIJXJhjCPf0dJDTdlzSo4JuegsVospVSLPxiGBERi+XO8s+f2GBhoQ2yoPx8LASnXa
 c4L9+AN3nEeuq69vF/E/6ebUHBY3OOsCErIE0fGU9g4uqz/hov9ldvpwTn/W7r+PqJsN9CXLg
 S/6hBo9M9UANa3mb5A7kRQ/g4v2DjUSTGde1AbiWHRti5rqP5k8H9HgNtslXVYod7gthhxGb7
 zFivdxVPfeHvpUjO6suL0IOODIjCTxQPUaO/UbBZGv9McbSLkaKs1bD0TNecijrh3Ts1e4mZZ
 MN6ao3IiWU8Mm8RQXKRcIEuuDBD1iOu5I1OGNzqUYrXKPjuI5bxtoeiElN/kvnb4tJga+fZEH
 EvMeKZvqbPMAk5UNaFkdySOZjKtcxWM9AS+B96e648XHG85zPudTDfg5nLW1hnOcO1z0F2o9y
 9sQEFYP3vItJ7Oua8kI2kGs0Jx+4lfc6X6pMfU0qfa2yAp9clFD+27SmbHj+UpcA2p9XAGcPx
 QSR4f+lo0xbefCeI8xb9jet8NZOk5gzuLgoDk/c/0A+pxLSLP7VY32QoxgHeH5GuBQqAD8SHy
 ML5egnfYzJgOio6v/qjjhQWgwOF4uM/hJD+S7qLK/VSyuO3OcfxcPBwk1OQWM4+lCAcfIJcJG
 H8BVHoziFC80xqAmrZqWhO6uXFHnHsDoSXzHl21aNS3ZGzjTF4gIvh6uhBr0WkD/GDYrBZ1NO
 /9XAB+koCSBSGdyXEWuDpWWlOdsdSzn3tnwSGfENga1MUPWisgJSYSIts35Tqrm2neNVS3VAP
 ww35iisGmNw408Vsdu03KEtY3fhR7/aAR13WRhmnDLNeCELoY1hz4t+7zBKZwtvP5ANMIuoHl
 XKHouWNV7hE4MVdjklA/HviSFBAfnnVZLIWUPr9xk96eS3sIxo0epVk8FVRN9yb5WrxhN7nT7
 NktlU6r9AC4ZABgcDL2fNVZfIxQEq41u8HxdoJ6lwlGFKOIJoxNjgfgAyNs9ByspKlv2bO255
 IIyFQa8z6kGeQEZ6mI2Lo0M1mWL4BPzMTs7/1dH3C4l5Jpm6T05JBIZXzicTbaydXE4prxHiK
 W8tDVGf3g5BUCeNIKIguwSXeD6rZBHzeU1e3jnRmpE/w3TloaH2S9crO9JTWe6t9wocwPkyR8
 aPUtHf3ioTmlBnujye+LOyYIeG9j9Zk7Jzi5t3TMEePBGx6r1EDzXDYIyohHk82aFzZ9c+Wup
 sfWyWun6FOOVBktSxcY2ieKszndZKR9ipa1DmuUgxNW5BH9XeF2zXLm3NwiETDM+tsJKEqeLM
 XhmSmJBU2jdIjQpb2f3NBmSKEyiGjuZLz+qmFWbibsTuJqT5ceN7g7CYRjEHhVee8IzGjPsXH
 0V3bP4Zg8A2dffNqiuvC3hatpvlLt5UIAgH+cv8/J7w6RMm8oKjv7RR48y/zTs5pq5T1TEyox
 XFeTb+2a1x2L5kCRweXlMwFXbAtONY4iCKLohXfflr40o8+nCS+XOUtFsPv+m4Er/UOwQZNLR
 IQUczxhGwtSZTyoAttQ+7fg6wRp9tcoRkqNu/WG0C8rVMJSC/Ju9Sn1glA8yPODcF1tTTSEJT
 6NMmHlLtxkUtAQY4GC9RNUAVqg6ps4dRcozXpn3Kpmki53vSHAxIVE3d7sJUGCG8tdH6RKuhP
 cFlDgFj0vbL73mIILQh/PfXTREgUxhQdJ8O8C7mQMX1kpd8yJU7zBXAB//xgnqTJgEUyy07cU
 iKXOCd7lq+69Z0hjoRfOHQtJq6joXRU77MtBymvqjuNDJ3s+IUT21UKbgcbHxJuf7iz1elnpS
 f67u8IHay29OE9hbSXDKV0zEXt1/mQcc/gAUY0IPeyad7vFqwxgCsMtVGg6ADz5Ijstge+4Dh
 qCqFKYQ8raGQ7ktGaOB+pfc4VMcG2tHgG2VSeMfSPw5i3mKBRWjDKe4TBOQNPiPfzATBtR8F8
 CizC+8as5sdMtpkqGnFBw2rYwh3WfpY8GT3WiG7nVB8CDqh3ZXNXDnBt4Ixtwldw8LdsA6hkw
 K8l3LRaGrevB+nhaNFPvt/7aOWEqTNIggL872YLtdiGiTFAS+mlaqUovvJo2pclZl/j7uXP9J
 euZMo1Vezs/tKX7nxUOFWpeW94QYT6NTZbozc6kHwzocrqzx2IDpFTOlfjP421jakEIpuoYwY
 ckIoTIhmKKwBKfEpJ5BOgxjBDK8n7XJL8IujoFlvUrv3GDtWAfu7unrO2XA24iU1DLQwOPdGz
 UK56+DmdYEHhD/6h0qT6r2cWAwlWu/tCrEYFvwKaqPrNkbUx7SPR1k731+oSecHPsIcqq8f6j
 JEqtzwq6Fe/iscZZr5+gNm/PKVAkaXaO+kJ5fvaLIPhbglQP8+hrdjAI2mJ9Qs9cAldXXWKWh
 CnR5gaoqw1D0vmm+R7BTVhHjt8cfeAueiZZ+jP8oKZMq3H4u7MMCH45q1LZZXLSG89K3XHlWe
 zEG9TyTX5B3tvby6ZG75z9B4MKHzM4u23iAxHYT4zoXrTPzHA5ax+c1+9oQ3JD8lBeBOMspCC
 pW2+c9yVXGne1rm6fieeFyq831KGJbOy49yYlJTs0pSf7NBviH+PvDdSP0A1Nk5WsYZGlgF5A
 alKuUbNa3AUK8W8vpSc1BZRcxL+XFrN0Le31oTfjKiK46WBOTtzox7taEtdwUSMel27T+
Subject: [Buildroot] [PATCH v1] package/apache: security bump version to
 2.4.71
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

- bump version to 2.4.71 (for details see [1])
- fixes CVE-2026-119618, CVE-2026-109163, CVE-2026-106023

[1] https://archive.apache.org/dist/httpd/CHANGES_2.4.71

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/apache/apache.hash | 6 +++---
 package/apache/apache.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index 1de97a5873..23a61ff530 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,5 +1,5 @@
-# From https://archive.apache.org/dist/httpd/httpd-2.4.70.tar.bz2.{sha256,sha512}
-sha256  1eefd7dc95836c5872894ce8e6a37f773d5a6764f0766869d39b8bcf0b1bafc3  httpd-2.4.70.tar.bz2
-sha512  bcbbda8fba5a3e59d6a8b88551d401ff62f2df6bfbb5f6cfac9479ac1aa14a433d490a09e21ad164502a30bd747b43e67c7e43df4412f5dc40e1723a35e3398d  httpd-2.4.70.tar.bz2
+# From https://archive.apache.org/dist/httpd/httpd-2.4.71.tar.bz2.{sha256,sha512}
+sha256  2bc5da5a33c247341de082717d4ebcb5cb49e8b73a05b7fddf7d5d6dc2f8de62  httpd-2.4.71.tar.bz2
+sha512  b0eca2692e7672226e9b80e21ad64d7eda48bd5f3a1b774e3719baaa8a38e618e0ba5a9ea4fd077db306699d6b77d4b122a1f5fdc330a105d29ce6fc96ed167e  httpd-2.4.70.tar.bz2
 # Locally computed
 sha256  47b8c2b6c3309282a99d4a3001575c790fead690cc14734628c4667d2bbffc43  LICENSE
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index cee02f8d08..d6ba7fa4f5 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.70
+APACHE_VERSION = 2.4.71
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
 APACHE_SITE = https://archive.apache.org/dist/httpd
 APACHE_LICENSE = Apache-2.0
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
