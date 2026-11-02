Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0756070CB4
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 14:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=DeJR5e2h
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DC914053A;
	Mon,  2 Nov 2026 14:24:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pT6AZsBugZt8; Mon,  2 Nov 2026 14:24:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3E1F54050C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793629488;
	b=bqay7PskrILqKamU294fklRKQdgyrJGS/qfIL6PiRiVg0qT8uTrflgZ14Iaz8Rygq6EC
	 hYNdhYbu19df+X5xElbAjsQOggQbGcVuO6XFWseNiyUDpejglcIcbGMzCsBaWNLt89cnI
	 qmLp4O6xmC/onPcyzLcyNt/AybiP2WKF95nPwlQ3gLCMBSteXGXWgEoNoqk2DnYUWkLs9
	 o4BJMAgSeKsg3RaMBdAdX/5ryLlQvon0yYg4p0oo8ochbIlT7TZmLAqDnJ5am601xcSXA
	 SdF6Q/xcRJoHyNpDd/RwI4LIFcFeZQSRdi43DePaIDpF/SU8Z16zp2DazjfouaMz/vg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793629488;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=IKhUmpCqFPvlI+nubfB1j5VLVxH2n4S2CSm3nIdD1EA=;
	b=I3PepNDkKr79R2ih3rg7o2B6Kdfi2kbV8Tr66LGDlZ6+TQCzzRUoWfwbMEyYwipFA2jN
	 BErXL+6bSaDg9VZ46qKWT67P6mgQ/ffB/U+ljzz8RkOSHeZpzeP8Y/AIo+jXc+ePQFLUB
	 nPLtGy9s79gqs9l8gV6wUvfX7ycUoDe+E9VNweyQLP3a1JRGqpZYAOXisttlId25LpQmG
	 HHeIGzqirsaOlKPIus1Ch+kB7sWFoWwnVPct3wxl7F31axyuOd37XrXA22eMhotcd2Hjd
	 SB9L9zRLoGMBulOzROT6c7yBhgxLcYMblXulqrqhufHn2Z6ZivrgueRPyUE2vLFsaow==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793629488;
	bh=IKhUmpCqFPvlI+nubfB1j5VLVxH2n4S2CSm3nIdD1EA=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=DeJR5e2h7lEt4yNTbSDRIHQUfDIgdc+wnpFb8vyefdwfFNaNCeBbdPq3Vpi/WYQkR
	 swW6knK+dj0xt7yhoTo4qEbGnqPeW+PSQoEbh1dxvvJObYuljzLc0A1luW9rK1lDbD
	 t5MxaxT4OsOvsExAMzgjqBpAtthClj2/9hY0z77appE6tCcLEgpdVIXisGZPQyP4xp
	 WKymj3L5dGwOa+afrSD/4WvmzBWDkI75/UGUEr5nmT20XbqYH1iLCm3M0THknO9gMO
	 ejyev9LCJgYwbfWMOc18XC+sAFsEf6kUXmVlxi0ZWlxW58zhTBb9jSoHhlyMlIukJ6
	 YmMroHvhFW7jg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E1F54050C;
	Mon,  2 Nov 2026 14:24:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BA81AD3A
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 14:24:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A05E880F49
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 14:24:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1gwQ_0q0YV8N for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 14:24:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0F9BC80F28
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793629485;
 b=paRkFbPOjwt5YvP/EXydj3VbE9T6/pXXU/IBiwLVnBNvU6MXBpLhONq4kYJhToHO3GPl
 950C4pAJte9BcYmHkTgXo8cveVNTssqFrThL5Mmz+7R124tIzvF9Mi8WTvtv0pIc0Q+jo
 JMQ+FLjKzKUNPfyHU6LChpPjsvt2i0S9B8UiSX302iLrCnfqcpGcZnpWp40e/qaGLA484
 BrLy3Xkhdi8SEDaYDbR73TVgC/0scAl8BDskJBl7vKHsUIPPbnQgftMGPvWy0c0qC184b
 N1f7kAE8EK6IjcZ5O92JJ2ZQPrf+BHFpkCXhktlhiVrYOK3shPDCXMlOOczFOwJx/+g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793629485;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=pC8PvG/cY25Mo01o8cC8qw6VttJ2ueCaiLttGmr3iII=;
 b=FYzFac8/aQloQ583SsmVG3XpjPhc/zM03vcHXNjCnbqDWsSLkKQwjUNSHjWXvTHj+tGS
 9sbih3uLIsLa/LTTJ2uS7vwPqkw4wmkQw12gHtq7kslvNHjY16j6rsi2cg/EqN72+eiQX
 tv2Oz6zd9FEukW5xlISV3DTgIwX86+47qyKx5IQyvVDmx5XcdylX51dxQpc7jMzj5x7L/
 CgA0nNa8MLq8nXNSPWkpT7sRsaD0GBTIJSSrt11Iza7vzIWskIfLzE3QkQQbewYQI6neb
 ht6T6d7ZFu/rCE9UFLPjADGNO19KD8YTazoAjKUVOIfOmPCvGLGjuJwq4c3jmjfP21A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=SE1Thgzg; 
 arc=none smtp.remote-ip=212.227.17.21
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0F9BC80F28
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 14:24:44 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MAwbp-1xDBZo2mUr-00Ewps; Mon, 02
 Nov 2026 15:24:41 +0100
To: buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 Julien Olivain <ju.o@free.fr>, Fiona Klute <fiona.klute@gmx.de>
Date: Mon,  2 Nov 2026 15:24:13 +0100
Message-ID: <20261102142418.2544020-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:x6wzj32XEQ3RUbUWJ7M1iH/toYC2qkcipWSTEmQGA75/feBSxzQ
 9kD0v/tA+S7+/rhj5fYO/6Vl9eqwUDz+26MTF5/gCEkjXbABjgDWVxhpQPkD+AJQFsGzrip
 kW0YBJUrZom8b5CwX2FKvptayE/VmxBp0Hz2UR2MjavW2k7vmrRWV5HTxi6Qryldw0W6CnL
 ytVP8JWbTvbp9yJ7yqGMA==
UI-OutboundReport: notjunk:1;M01:P0:6ornqa7Ytak=;+JtYFbLm4kjMbSPwZBKcZfc+mR9
 NQ4hGoYA9XpUB1xJ7TPoweX6euP3Hsj4N/28B+wEooIbA/DVkJkg5Hz61JzzlCOmCocVElGAC
 fVFTYTH92hR/vCy1CwTTKxT1ck22yj7jT32h2kt+4SX7vEwcQACm0RjypUM2ujF10GIKxTo+0
 zRbsrU7OzaJ4u03tPhi/zMSEJKEMA6fqlRyxO4y0qLpPdueDVXDeazBykHN3jrHTR+M5FIfyt
 AJUal1yfNao1HfRcUv1GxGRQjLz8//JawHMvJPSIuK4iMzoyUYs/h+OgfGDE5srMlNsMS9s98
 x5MYwVVOInwiM0HaTkQlB+5hPzizyJCPr/opKAqFr1Hc/MMaAu6zgdTG3KxjMcu1xqlz17WCx
 7i8RkuGjhoInp9oLq02y0ehkN58sewP6jaUKgbT8N5CTIJA37R1UEp/HEZO+noxODqfYDu2SV
 Rr8kUfl9wryxwBh3GPS8ChsHogxCLpO9oxTEIo222EU/8dUFHSQVVEHmkaFCmCsXdW6DkOfda
 3ZuddBrcIuShv/ARBI/IkyT3glraNE8l9J3i3s31yTFfBGZ5sbzPFutcddx37SRXOTAoH6LYy
 s5BnDO3awTvrN5/2UwPXwcbIk6exrrJeE7WVk6lFAU1BzLwJApqE/hce5SQGFobkqbwiIb6/2
 hA4TqND9hkqOk/mLBS5vVeNOsVqAJs6+St4PxwDqpVzgB6DjPFlAMg2LGtmTdOH0gXjCRAZni
 lFKoEJLunyFO8HQlHLYj/nE/O4alKjLt4JR1rqySD8A5TB6dEL+ZYTIkm5vfrMQS8d1XJHK8V
 GoavCf1icxoqsYwG8KnHg/8H3SMdiTMpBh0gTIBrM/zK37Lss3klM7qz2pfh8/WsQrv80VV16
 arDdfZxokrnXlWvaPOKcKSDPRMgn1aq2iaejS+/76yPRdggj/NkpbhdsvVwjmWClN79nRaQ3a
 yVtbH5PoZOpV1hQh4o1ZwwPf7Pcyasv0/XkZcQC2xRgikwWuTsaotCs7MLq6G95YVJtW8+PfM
 GDxTyqK9VfXnO6IuAdouxQzlbvfpJnXv3ojSef/tgRQzTT9swDYWRvoUS/iAqo30AyN9eIqhi
 Wum92T15Db3u3BG/SzUzPkLZRXGuiz0s5hTK86o2NvhByJJiQ5aNT/1Z12cpGgoza8ochB2TX
 UrJv7OI6jwLToOiVutwooZUFuw9Xff6URJpao1xbwC2I7ZjsyZGPE9DQAQ02CSDKSZIMieZNQ
 NkKTzteFtXMJ1zLjaXCfQf0UDqYHLCMRd3gpzf9kuXKkLIFv+rCGt9Yxz76ApboR4OWfz1puB
 3LUOFWa/Eyxdt9zSLtlmzI3k/D1NZXIxJy/pWIYkJqfjT6HBbH0eOiZQ6/r6TaxMZXsr9nvK2
 rtPRZ8hgfffxa1xeUI7k5Qkk9ZiWSy6TUE3T2k2MLb2d8kMMlWfmtn4DqJkjBq9slAZmWSlW7
 jOtrYtBKW3DWjwc4pfY0zcsyfQ2B+amSwosucP2DYtY8wwx3NfzF4ExSttepjOzEPJD0xDOD4
 U9wLexlZF+q+q1kz98Hb7au8Ou6RAqDrmu8/uRQy5PnT/aZaGFjR2z7ooahZ31eIgMef2nFI7
 bJGZBeYVEw/fjEs+ztXBNgqjY45K1uieTGGlAW34v+iuRBy+oCbi+V6V4iqJYdDkQB6s0nqrt
 kt+6rTmZH/PHWBrSu25R2CXJj9gPvtOVplnV+s1ga0Vy8OcBMPHgESZCooRRbLvVKlbB1BTD7
 zrOZuxD3zM7ypnV/6NIR1bsJ82dFUjZZyYGpx+uAvReqIBQQb1fhISRfXei8UPfbXYZeAQN4K
 4R6wYZrSqZD4tuXAbM9GYDFCL7QJ+voaAC1eC5Lo2Tm3hB3yaTwNu7LzqokHn/6Js7eXdTGY9
 5RARzGU/g5uLzGVwGQfshrTmdt6ItzVSDSiU6FNM6zjHHEQ9MCYvsUTst8p1HYhIrtYt8Agos
 EapinSWk3A/xL194m8PwhxpmCfs78zIm6mt7EndEJiF7mJ5JbQFYwQFi86zd6KQ9oxMo3rs73
 40djoUR+ISGDVfsHxVrOVS5Amot5f7jVe573lBOXUoX/MfJ5sajx7ScG3auT0qpONSR8Z/Qgy
 KzZ7JbJBt47DCqOxxfEvFrImMJyBmYijm36mK/S5xaHRu9g6f5QPC768ckFOMJL/BKCTDOFO1
 hv0IlKw23vXWO2fPshS5HJg/ERWK4/nD5Lf0P88nA4DtvUhFk25d8RuTWV9fOjgHwkQYuJkK+
 kAWvufdbY9USB/+2IPrRrrkRbQHgAzq5hH21CjcaTHATQnytybn8C0L9Z/WJUuf34D278LvIc
 Qdlk8iP5QTTZx8PB72cyrqiEPqO3W7MD/X/nUDi2M3QOBho8ZfpakR6bU17F6meHczAAbM5Gu
 9nOj/OlhnULwHd2YQnpS27hrHnAxrdds8QhzTiWyVOn0wTFwI9tY7le4xaKtbdaIFC5xAZ7g7
 7e32CSWmD/4AfhmJgAlc0P1r8v+ZNyb/3UDQW0nelH4LZjUK946+/pKs9++2uIbAoy285JoXh
 q7QURMO3sQHdbEPakA/NPE1Kq+4bo+UZl09muK9Y1vrcuJgp2UZAaCRpEMTI2E7I9HZBI2Sdc
 Pp22ZMHF79yacewXqLub9244UNTERZyKXcSe5gGWRtBJkzNTJNTp6j3WsjWU4ebCyXHq5QSf7
 xasjFquAUNwMgw0F4fxlAp+gPctQQjbfG0vuVgDcoKO2Yw5z2QnX/7V9b6KKgLnobDpSg4jNs
 EXTH0a9Amu47fbqI+kePa1QauFGCuUgFGUS3dR3fc9bR3Hbfq9SSC3qEV3bCXYOxuOUs/FUKc
 aBf0eY9aZsrqbBsLRp2AE6OqRvzWFkAT3+2RzGxF/EpJJ+wbSdj3aAO5wEZKChmFKxDJwVW8E
 FeiUU0HdrntVQAO1kdcxuSyekStjd94YV3M00sbuL25Aa11PCtXSgxAGx8ILQJXx7yW8IhCDf
 wK/trLOU8Bwzxsk946sNAKBS+SwDTDK2R3JX4CQ3fQcROjls8HqFIiCayCLn9tCOTr3kcDp0q
 ovbOQzVgBmh9Ywwwii2dudSnFMU6mpAyh1LiIs+O5+Qxy3Er0UwWPEZrt6RkbfiBwuPk3GM/u
 1VtqFjiUvqkbT2vEu+OOSSkhZbEo3QwPGw7P1Di0rYLCTT+2AKLOEpO8K4M+HGXQ0iBGul+65
 X8i0RIsBohPa/82HcP0ZZvn9aHEennUH+rfi1nRPT2H6dpb0YmdqlALe0CAP+qPda4zidAYT9
 iqSrI5gZgU5+/qS3FWHR6vKb52YfKgTCD5jRE+GU7jIAAEEYAWJ1pbL6ZU2tlHN5Jpq//tUD6
 eA5rVEM/t/AgFE9j2Jr/zBVmEuLo5VC4ZDrP4NoLUsYU2NunY8AJ187RDwOyyN0XE/zCc2/yj
 mCRzNDEleHkvDlP0wr+WnH5/2Nc7t5GRtm53dR0ZkjMAA20JwLkjdfXIXLzhlW09kqIjdojP6
 URA2M0lmZ3ktFrTcu1gnH6/n08TSaRm0XObytcoYxM8q2Ig8tE+9gWgngsCxbuHGjkoTTuoHg
 VblA8B6gatskRLe2c99/H/ZXJLje3SjPcK0VXR0rl6Q3zzFAILRDl5GhB9XsSVQ92ahPNHIzH
 di12Z5AQ7mRXxtEJHqHCtUn9S1YXPSNf8oIN+zt4mSG40Bk0pcw0nAkD5x5tm0WX1XyJe3fpi
 jhKkBxqUpSMx2aqF1LOsK1H7DFUBSgUds7mqqFNN17gpoSCK7I6uBgmLBh4CpPlhTEZie2F2a
 1Uvtv5nUET81hpXhVaszZK20ckDJHh/YszVd8IPbAy8PjyTHqkpI5eItVJNBoGNiFU6b71eDh
 MoDV1RTypqxo/Y38FKN/LA0iujEft6PE9gRPqIzveQdqIArNUmtjydTKfo4+0FZAze0bxqLKd
 s0VG38f/bRVxuei6jwR31zO1nPuvoFsawLigy24bzy3qXwvYETY0kQ4GZsC6h76I+Hq7MI6Lk
 5s07MypPHHnS1kqyoEIScAX5S3wcoBeOJw6zftPHDVS3u+dbsbPqA4kC1JCmywsZG592LRQT8
 Iqy8a+oH0luFt52gOFAVNOnQirVxVTP+hlIoIRGIWG7CJloACTNhszWoUadHWgv7CxFKggYCK
 N2VPVCp9gRroLvfvTVgS+8AddSg7QH+EB5bmRCadVSiTKimJ8FTaFLz4SwCfh0/C9+j5mvRBF
 H4nmL7WaSGi4nDZlehWnQkHtOcaUchP/016P1nATvVEPtBN4qDhqVB6E9UJMZew/ucV853Frm
 qLQALlMZfzeiTpUOa3iNj6yppHAO7u07HEhO8nBPHMVPo+WdaRkoIgL7quBSvusyeFf3e5Jft
 RoQ3CDG21VQp8d8cyCyM1fiMIgc91Crr3BGKAvdT/y56YJpMT0Xmtv4LHRBCFjiD8YhdGLSRZ
 H+cb4d58bTtap2Qu0bHbKfzVnYkH1L9f7SkOxTFINUrnnnqSGPZ2mvd78EoahHeuH7NL5E4iJ
 8FScMiENAoGbFtAhrcdI/vpAiV4zMp23Ts9rFkInYTfngwhSIUzseb7OH9QogJEBDJTdNP41o
 chEuU95ehPCgZpIrIwNCvPJzoU4oHVeAukWEVhetOPGUwHhENKtqe+FBBwnfvD349z6dfdU3Z
 T3DRuRlIrlw9DnNBv1E6fzPQ5TZkAP/qchUoh+YF6I3+0xxprII23/gfsGDBxK9YTNJXbG4tz
 6IrkcHWbqXgD84UyYKJcUsIfT3l3nGHtJ9jNG0fPW/3XSu3Nla12w3MKvKF7NtdZDD2RjMNyg
 qrafPQq+AfZhYmFu09KyI5gPqT2GT0zFM7d460n5BRKshXRBkW9anube5/BboIiLE/hNAPutX
 VYWPQtzzA6y1HW61L4suUcKvMqneOnMHnmY4srME36NUjVB6ycoFcD2/vOyjWi/qHNiVa4MIT
 n557kMSklWm5022y3YT1t9qjfMBbxo3YeOkEMdKHjPKx0jEPk7MzP3BQLxIddS8WspuqJsfaD
 N7R2tJ5hIANBHVDeM9flYvUtQUWAen/mI1kn9ZyVewD6xU7kKAFGaNejw02yshoZvwHJS5wKV
 gTXFKSdPpVThSwfFIJoTAvfY3zNU809ZoHSw/1BaH5J/OXuAzfRlPiK/U/KqThKe7sp13+GKD
 tbNEZGJ+zhY1ZOMlq98w5uR3GutfGS2MQqRnauAwfrkIig7+HW5q9vnQVTCbQVFGJxeuxZWgR
 PkUf4XIJJ8bs/w31u4tWtpsfrl6ch7qHoImNlgI4UxY2+GwDkwh6wwednOd7Su4sC5getvii7
 EpcA9UzELr9UdzbRVvykkmGiOXjlp9lIwirPBuouVnVLyJCPQYOx0u7/qI1pJ7QVrdq4tCavK
 C67t5XU+w+RYu6bCLoR7e2/hsYgcqQ5FKUih3UpJNNes+TB7rgH37iowqg6o0heHMIBK3Z2vs
 11q7KgQqlIBvSzWhRMelw53cw91NNYamcA+AitQ4tpGzcAoBkUbJMhL7ex53r6FKjBrG9G1L6
 Omh+CcXMqD4N+Sp8H5R7u8XyHJYJbbsZDgETC/HRnqWk7epPd+JcDuZ3R23o6qZwWSwkAPEY3
 +Ez4kHjxdxNRUTTt2ZvGh7lrFRYnJpQQs9Ss9bntXLXVFP5yzDfE7HxETQzYRGU84AtGE9OZJ
 eml+AwEvd4OnE7FCiLec6CPoT9SdTxjyAev8PvF8OLF/YcgpZzRndHAyz6t7Di1o+BIKGcA6y
 vg72B36tgLH4DbZIFsPJDKuqg5LOG6ZDQRONtsROkUyqB+Y6sGLXcuNKIo6qOjWKKvWx7I3hE
 mWH0MafmIl3hVwTJ13ntTArmQiEO4+on3M82ZaKfM4p0hLI5E7d3kN0EpBSL1im+uy6Dgu66x
 Wj0N+17KXP6GN8VFx8iTxJblcqQev79ks4CkoA1GtbR+5QhBAw/q5FhpUdauCZNH9rPsCCOT1
 I30tomQ4NfR2ncXIW0B6KQU5AOMwkj2f0vKN9xkfGSkJ5UZu4hD1ht6vkqaDI8UT2sUToGZRh
 QgZYBiUQlWZR47+5taXvhNKypzG6Z6x1pC9IdVh30t+wMcM6MSvBs20a5LbnFzFStzHEhFd0Z
 EDuB4HEAHvBSnzrBWA2qNjeU+8LWV4RPwqIGKrpNzd7rQ6E+wTzPiuNcjzzgV0GqoYcMQ2Xlb
 1EM20cCmOk02pjpbe9K4zTbCt71KzsyhFkfGTbbMm931If+fILrMCr0iqvABD3e2g7NdU/pqL
 drLj7PheyYmUAbYqnmy3bRbkWOOzy4IIJXbSfDdqFe/CBkeY8YJgxLEExnVZnU2CGKL5kqdSn
 1ASYfW6T1ScQJdVSMZt5x3K2Z8071GYDgV/Vlv3X0OZ1OErmy1fVpxfFJ8dJKwwB7D9YURz36
 kN9xu+jy4ffvq5IFkN6UUn2p30D6KwWNg6XvngMn51m2KWb4wGPti1k7BhO+xzA36F5yaNVJM
 0kPPgcfwqWGVPyvGj/R3onxigX4Vf71SPQFvIhSYE7Uk9Y0HHsxrYD4dbZnQ3zYTojrsJupwr
 GCT4Ihd4tv8LmvhtFNf5cdgwRJMiBy9Gcy+AuZH8bh0JFq69qiWqPk3b6q0SuyaxO3ZWzHqgo
 C3DIh0crnnH+reEjJIIkWU2ct14KusaELFqPxtdLVueU79wsop2TFLczNHrkvM+ZZoX4waNvs
 eIdlGIFG/eyg8rX1fBResXy+cltJnNynFPFgGqwc4AOR10N7ifp8/8aoqLtLmY/EakLQWlq2V
 jfMMG0pnz4fJVVKRClDd5q4jgO0AtD/Vfd6UJqM1y9XACmsbNPp4tki7erC5wU35csqQME+ZS
 T3lO9xCPH7hpmi+RhTSOTOWG5OQRfN75cSEm5YJlbzfAcf8m/y1/GkS60pVC2/c+dA5ylbTpj
 bnmWFJCJlPU3ns9Lu6tuZX3EtYxEXxMBRcyDDoC+beo4NgCJMW7szpCxL4ZfsBrKlKAeRW32f
 qrhCDx4z8kl5unymmlI4eWS3Nww2sgsGRl7o5ifN4s0eC6uNjfb7041FdIYMjXNOLcFwC1+a/
 9kBNHeKz8/S3bDr7+yKjOwVqwy7Fv6/WY2yL1KrrPMxZ5+w0vGohcQSNHnSxDeOg6WhGngZSR
 oXNGZ5xJyOytRGhRlvLWJC57yV+A8RuPwWAI5cDjkpRYx0/C4pDb9++1u7o2+JbusSSqsVOB/
 e3+c393xHhCdCaFf51XnqYPy2wftDHfJD7Ag2oaw8Qr3o/XtWaN0MhdPO17dx0uFcZO9DKx5H
 dDNml0eMuBjREiCtHnjBA7wq5nC0A1s/m3SSQZEkryTTcztl8Fnf20VSwgGrgIDK64mFOHsUs
 9ga6ZDH3hQFDD45W9gD/vSXKx3Fk4cy0An/yeX743UMUUWZIxS5sWTqYmkoN49nRYQR6ar6Jt
 QPDZY7piKg3jwss
Subject: [Buildroot] [PATCH v2 0/5] Update systemd to current stable
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
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi everyone,

this series updates package/systemd to the current stable release
v262.1. I'm sending it as one patch per major version because I think
it'll be easier to review this way, to bisect if needed, and also to
apply only *some* of the updates if later ones need a revision. ;-)

Patch one is a bit of cleanup that should make the others easier to
read, and can be applied independently.

In addition to the builds where I need current systemd, I've tested
with:

support/testing/run-tests -o output/test/ \
    tests.init.test_systemd \
    tests.init.test_systemd_selinux

Note that the pre-built kernels used in tests are at the lower edge of
the "minimum" version range from v260 onwards.

Best regards,
Fiona

Changes v1 -> v2:
* Require "recommended baseline" kernel headers (>=5.14) from v261
  onwards, upstream does not fix build failures with "minimum
  baseline" versions.
* Fix hash of LICENSES/README.md for versions v260.10 to v262.1 due to
  minor changes, please see the updated commit messages for
  details.

v1: https://patchwork.buildroot.org/project/buildroot/list/?series=1658

Fiona Klute (othermo GmbH) (5):
  package/systemd: sort {,HOST_}SYSTEMD_CONF_OPTS
  package/systemd: bump version to 259.10
  package/systemd: bump version to 260.6
  package/systemd: bump version to 261.4
  package/systemd: bump version to 262.1

 package/systemd/Config.in                  |   3 +-
 package/systemd/systemd.hash               |   4 +-
 package/systemd/systemd.mk                 | 254 +++++++++++----------
 support/testing/tests/init/test_systemd.py |   8 +-
 system/Config.in                           |  10 +-
 5 files changed, 147 insertions(+), 132 deletions(-)

-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
