Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C1C606A31C
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 15:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=NlqdqTBw
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75EEA80DCA;
	Wed, 28 Oct 2026 15:51:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IP8cymwwkzsb; Wed, 28 Oct 2026 15:51:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7707180E13
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793202708;
	b=NaKgHFvp5yvyom6ytHU9zlyyPE+7mFzl3DXdg/v4+mqsr1GQFjYovmZUorGfP8JWVmkL
	 TAa8XX0x+UnUOwxpuOxniseESygMMVe5KpcBRGIcmfLqTDb5othegg0inwhgbedk7P3JC
	 DCypH0IMS5f2bTSbEz3zCeAkeCg3iS3q1nvDWSQ+J6oj0SfGULCEuhPGHN0QEe4PWSxeT
	 jtQZTpBnndNjqb8Z/7F2dn0UuvsABFUfODlaGlWspRGPK1jnpLnxFFlm83T1kUHDsIZRK
	 HLE6uuu2E5eo2wAeYG+L97/NKlzzEbfP64WmDz4cXf9wJNEx740spStAImVLwQE1WMg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793202708;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=yKxUmA40blxXbXA2r3zBushKYXUQ1vEkApga7k69i1o=;
	b=HCICzgC+Du+qRHCqcCUAhB26ozQ7w1rNuw19VVtWt9uTxxZaT0yirTtnkWC8uKa0zLYJ
	 3gsYUtgJYQSfZfvP429B1CEnVFuIWAGHtSkZgqX+Zo7XpQYG1hnUpHX9ckCKBuBdFRXA/
	 /mWBTiJw1sfaSjG9NISXmUAaoZV5K9CGRvVEqoVB2sT7/LXTBSTigsX8BWzQcjCUw8hU3
	 ic1EymAIqzu669yrgEDDfUdbIMygAyxMZBl58fycy17CSPAxMU4+s2Lcz7D26G7NFc8Os
	 FuudVi/SwMdfI60R3trUSIbLofiMLyNb0fEHuYhBbH3ox8N/bl/jR35cWS3yk3QwD2Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793202708;
	bh=yKxUmA40blxXbXA2r3zBushKYXUQ1vEkApga7k69i1o=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NlqdqTBwjfPYrMJg9z/iaPz1Pepqs6+UkVdgo2OkQTNzRsf5UJSIGOxPK77lWtstV
	 oE/BcRI0Y8JWDBpzxGolNh+OK1zzYM0Jg0whcrPrppHf2XgQRMkYOagQwrC7RN3LNj
	 TMtpUJYFoPjlGbBY6KPm4mb3MfNS6E14MKF9Oq75YM9DivrIW6/NS09jElsxmJPAkO
	 fyV7fgSINc+kagnEfdMGnqKqJ1IKOGQYzfXGNMQLlCNTY1hiGxV9R5AkRSAnXP27ZZ
	 JsvnGnskUR9ZLLHi2v+C1hfR6Qg+c8ftH/sHQkvdEZX70RTpUtJloL0CpZJyuB5d/D
	 hLt0GLbUcmbcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7707180E13;
	Wed, 28 Oct 2026 15:51:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B369E4D1
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 15:51:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 990C8400AD
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 15:51:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yFy_euZXrB5s for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 15:51:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 0193F4009E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793202705;
 b=lXRwOFQGkZE7MaizW7dVtMytmpLuFlcl6Po1mIrn2tn6XBdfdvDhvUurHNpJ2B9WKTru
 gyjmGqO5BhnDF1gUdRsFYC12pgxmeRRqE+xNYp4Nn46FKDAhcXI7qWNjBaj8gazEJX8Lj
 rWaubRrHgUC9YIxzUUZSxZVQyz14cHqu8RBEmiB6Xas9UL4yz678RYfD4MvyJNQAD5fQ9
 oE60pcoM2yn6FcoTpiFE2gUwun6OR9lrtIXuIxgpisjnYPnzqDuhfrxNchLNLxhRdZwRG
 j9tM9fZVNhZ2l9fqmgDktT6OQZNtrWDXZHM9+8othMlGshGk5KypT6YKIk89ds8TQXQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793202705;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=rNsZwx+K6omUBLNFGUuK54GuKkgAC6IP9ZYfh++1JN4=;
 b=ANVQ0zaT4zJqqem7PUWGZ+4DkrPO0Bjpoj4TOOCtZ2kWA4zU17IfO9kvhJAyBLZl9fyI
 XeNk1RiEECbooSabA9w/O0Hz8FBDrLRvVekfV7RqSCUl7VXCBspJyfXq8554StXWZBcFN
 yIt/GSXTCILp9CaqBut75BVyISaIV1ahyB56JHCPKN87vKOHwQH2HTMCDQ6kxqf8C4U5l
 X1/jHPN1B1tKlqHuxoLxHn+8ymmaKtgKnppeyCZCPrdlJvLPqMKR3wXTyvktj/l43eoCr
 irzpyTzIvTL9Z2D6E0DjVBr3fPqB4FrOCnGXsQNuVkz2jSvSIJsssuQlov7I4+OT6mQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=pWLK6pj6; 
 arc=none smtp.remote-ip=212.227.17.22
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0193F4009E
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 15:51:44 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MgNh1-1wuR9u3O5X-00ZRnV; Wed, 28
 Oct 2026 16:51:41 +0100
To: buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Wed, 28 Oct 2026 16:51:22 +0100
Message-ID: <20261028155122.3226008-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261028155122.3226008-1-fiona.klute@gmx.de>
References: <20261028155122.3226008-1-fiona.klute@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:Jz4hXhSGks2akYqNh9B8ZvttJBqsw05379e9GR8jqHxLDYokoxO
 riV/Y2F5UjOhsU/KTjc15wp8YVQQyaKX7BGUr1EP61TzHyRQhagbJeq3p0YM/Gt4PbCtSvY
 lth8povz5MNdgbrSz+msxBEMaV8ITaFguV5wPIoSNHR9ZGVfGtxqFjkC3/oEj5IlykUZL57
 Y1hExfEDaL+OUJvYENAyw==
UI-OutboundReport: notjunk:1;M01:P0:Z+/ivLNrr+8=;m2tKpq4Mx3v/cz4BCuZR6zuTzeX
 PaJ96nsBVZ5C58Z+OmYtF75V4X//D/7EaGoKTCyWGT5/BUZlCKMGPnjD3FoOUHj+kMXaInZ3+
 CnCZZxU+RkMlEwlmqKGqoGrZD+AvqxZntb3xAekmyk3sj4O06z/jhN4rdKSn9XVtAhiBC3e2x
 U7nWESP6UUtbmTfk/aZ2yLO+RJoyTGTjGKmkEztpL70UEi1Bjss+ZxHwdhb+vUuhLBdtJn+N2
 r50KzYWsA9LsRFcqOLGPqXDmzCVySeaE00FYwBpdclChT1Wyb5dAxAj+ye9Q2YkoXZ/uQQn+f
 NmMHDXCOc204E2VWDgUZvnIg9uh6gfTTwcyDOBfU12hj8A11qKtIugPz/xjRno9soczDtFYjT
 vD7Qpcrai6tM2+8T58c+29v8nq3sNlLRAUKZaOoGcr+ckWlWI5EHoEEXopo3EiaBldgHXnfL+
 bY4kKtKTEt9o36v073GASWYFUVOBb6WsCNvcZV3VEFatMVMwfpkUqT13mfZBtUOkROxkHgTj2
 yjyzevKabN5FXFezBPfuAuslQUjPBDmA/T0J90bPv03ByXn4Xtf0y9NV/idqTF6S2n8ZrTQPi
 bDFRXzTZdTy4etC6oLD7Zj016f88n9KJ9aUhsTDzKELLimyqjZzsybdq5PqO9eWce7bBCWFv3
 FmyXkddkaKP5tmRFZoJXrbbYUsVzqpN5SQtsfbVx8BjDZI63Aa0DCwvBYpSD7vabnaTD8E+05
 PQ/x+NobVIvEZfUflWzMkq8uYbTs+72809PXtco1or2k3+LfMRVpOMbck1pLnKmx+EQrEuc1u
 6UV0xHqI3DrQK7o7neCOYhZRV49eSW0E/C6Argx4k4hdwsk88o1JFoyutn03upeBIqhhbBpdp
 PGz0pi3G2d7qXs/3nXvRyIb3Nor1lHuOdaZgf7S/nLrllEwk2FJv+jrZzoXCUHr7H5TkhA3hh
 pjtqBzGdD+26LPmwvPWWpM7NjwzaKSx1s9WQbxrS1j4wYDiqWc0XGSiJROyNtOcxNUkDim07w
 fv93eoQ+n0o7W9pDtIUhRrucDcs8lO5TtyjtUL4JXdrv6Aimq4s9UFPjiTvISE6PDtB/8wDSl
 D8Migjy87ZzJhGip4Kv+gow9YKL3Wpmt4Lh1kpgNX/Oxh2MgzOKagG2Q7q3y+ORU7xjfRSi4c
 B7+UIi0HNUR9tA4Do5dfSc0CYvCJ+ZClBkFytfG/IFV3U8ZMhUm2nbu44eZVp/HGG2JfEHsCs
 xHSVITx+zwKDvtiX84e1Ky3KqmCNmZ4azzmjd/SfbxzFSiM5E+gxc3TpeEWyAr/T3DDostv+W
 fBWDcf+5V/p5AcBtXpkmm29CFjF5I2n9RxamGPElzhkpz0XP7WWPx46jiwE8w/NSLl3hq881K
 zgSbx7/VajYgeJ2EWXESmfoRGwQKRjH23dElmDq/VCDSLlLtngAu06BEOw5xcbm9iFq6Wz8d1
 I1LKwNb8gV04yUNly/manrva8T41CjJeUa3htsPu6UedGS3px+nApmFrC34xhAGDF7vd63jhp
 /r2bKvA2mopp/9+Dlgq1cKZWjBut74gwDiCIUOBx4d+fevgTM3EfDqNTZO6QNlvi6QZOMP4J2
 EopKHf4tAQ3bVJWv3vMueFQbTe2O95/2ukY6X29b5RIufM0v8ZdE7fomcKBP1D/Sp2uRx54E3
 7ZT8didokR/E7t+Vhi6Y88Q8uIQmeS0NYeYRccU9RB5AOk722VWit+DDdh54h1TTKqnnw+3Mb
 h0jXv55W3myMMXk18vYBoQJl69xTtrvRBUtJMGNtlYIPUYd9mB1aTe+egYjVXAuXm4J/VplJL
 gcee1iZOjgpFRqM3cpmGYMP8IwlH5sGUe+qIMhwN0zodlLwuK5qV7omapS79SMWDyQqf+S7Sj
 fgNcuvmAmrX4sA6EY65dbJndMA+3rs6+WPWE3SU1HplBz+dV1E1AE497/q+48OCbuGtTwlqrN
 /9m30R1g4gkKkpPY/CnRe21Y3BIrTvgTuU4ThtKd0DIj4B+jyHVr8BO6FfvPui5cGPZlFLGq5
 MnNWfZPk2g0mo1zG6GYjBW/xq9Acrfn3QYaJCMjEj7Uy2So0DuUP8lBixdn7A5YHubNnYWX79
 FWFsr92x3abb3OFRRJsvEmfPxdG0ro1z8NodngtEdaho0kXDd0jq4b1qVoem3aVhs3BQJAULN
 vTXWqLBTQbzh/H2F4g/34wiJFYXsB47HODZXTNSEgGYVTdCo8mxSyatTjxG5HJ1uKDmm+qd+5
 FfSFnsn7THx1x9Bha3dViArbDaQBfr3DbZeaNbgktLFeMzpGVOhH+ixnqkbN0zWkWSHxyiC5w
 I7YZ1ltbHJs4uXzYdiSYuoC5EfovKofLvCjkS9keG9v37k13R22HAiJTfGRJYwiMLzVHdJd//
 MsySWXQLD3ZepOvTZbzAM87/IpbAUCiCdbdshpqxpDuSL0mmQHTdtz3qgrUhPRLG/vqAH2HBV
 n9nK4vhYMnkUGFshSjQMXKDrCIxXTkJa6J29p1Q7PjjmeJfhJNfl5KvwJyOWpqs8gKsxdDWnG
 km7T4JDA8GqlB3ZyzYTRhuoVGeKK2Ok0xdQq2/UeK+TUPFZrl+J0mhzCCukOh6BzCEERA7kZ6
 HsRRNi5pdlirj5Azsrr+mC5a94Nv6fIa1Bc3ewilUJM9I9QWd+pl6uAyRfk5CzfMWZCOqZu3I
 D9VcZ5YmiLDRW8iWPSyjlw9VB08j1Zw8VP3cMaU53U77tQJ198GubzTnoHO44qICYHIlCyPfs
 3vgeDwO/dkzt++lVsEXHe1mdGNCHi238hbmwtwJIog3PiWpdgbqntfMvqa5D6Mm8wDszqJQ9V
 g90CZTlvMXGzsxo7yC3gvpfo7g+EfNChjvZyWplB2MOeVga9jaxt3Ca5yV/nr6TX/WAiIkvk9
 jPigDqqPdlHL5akNFnCilFGMJFS20FDSHATQQXt0eAzdfgW9W8z2BUUbByEdFvw0mzk4V3pdx
 pd1WwImGCxdDRtm7LJAMdXXqf3lDfvE5Xv+8NinrcXnzTzwL68/tJ5MHsb+axZMBzAX0G7A9R
 K6GvF0EIcOze19PETsx8TVOg4urpq4kz1V2HzS5nxuF5Jq9swJpgTHb3f7wLtfa5z3Ry+JqCu
 ClViG7Wv41J5AyzBMNi2WniUHtnNh+tiyDks/tHCP915I+FJg5/aYEEdCT/1z1OAgJaf+MLyh
 Kn1PtYHRNLSlDKinoGzhgtMS+d+ifr2o0q3ow/slQFndNDw7dqa7h5gTv4J+GYIFHiC37iymo
 tHs6gMIL/Dx1JBosfIyypBlGqxZSYdfQfdqTHW4FL1i2siOTgh6BEO+ojm//Ct3X0qFudgSD1
 wtkaKvyyGAau2kNGxyF0XQzjg4XBBOjSQqZTu05itnUPNcM+LMNGsuh/a60PSA3MzyqAZWZJR
 19aF01QH+nwGEQ+5GE7zvR7/9FsW74zu4RX55IeA5ID9eo+TrTwZf1G0SwzsticnJ7fA+Ac/8
 RLZFUK2Z2eWNM9tGGve1U+AItiwkrqHbQo3B3Op98PIiSUDFK+Kq8vq9tmiuvHrKaOmZI9aJR
 +QHFFDP4rQ2kzrGILuoLUdZ1sJJRzDF7lPmuU1DMLxqQrNnNjhl8xYbS3nd+NW9qf+L7ZLKen
 zKC1kE4+RuNlWiUQ0Oiv2Zf8z5Hx/NGKyUiR0dfmDTENTrZF82C8mToZn8f4/NAtGA/LZH8X5
 +IuAUj9NvMrpax8wRfOYKCTZ3kh1dtmuacfbkf8tfQVWrCQXo9g2C/2zlNQcSO0FSD2XrTH6I
 wFWzGYs6l4/ep3dZLTFC0XneaIVoudF3SBbtSwAGlQ7QNPxdlncWxodTKiXmjv/yvq2dHlWSr
 osoMuun5IUE6GqnWUbY47engq/Wcqm4Q44sZSBD/Fd6LZL8DdUZVGh1mNv0pJjuKpFasxViib
 5vJdzXaJBohsLemdIel02CJeRlMIMUj3OxmXdIU41HhxCFw30od61zLQrCRaWTBHy1Kc//tG6
 2Qab0Xvc7o/Iqhg0e5YOEED+OFNIStpT/wclrmu5pdBGbAqknX0CiB7PNKcFI6LZR0CY6/1BG
 qfbAwVPJWHuK2tpHjcZj6Zq3xh25BNLiVgr6DoZIPtUBOKr6ac7BgK5p5CMMeiuJe+auHQtuf
 YDuRgCPjzuhes0e91p5l8JUMuj6Rr6I+gaBt51oZNA1NHqcDdIKB9rHThloWdl7k8dsZwEpWb
 owQtsPt1yCX/aTN8vrcnduG3t7ryt2M8oL06ASsMj9LGuFOgP1lRkS6RhDQbsGutgd1HbZOa+
 Ue7hEEoEwJSr0bOOHtsa7fnjQKlI1F9OIpDdFqDaJ5U6fSXqDNXDHcOUr1s9bwOzEdP4EbR9s
 M6xO36+3LWC5Yhl3U8CrSMQSooOg4tSmMLQDIDABq7yZ8stalFzl20sQH1ml+0vFLgcvuADz5
 WRQD5f6tayM2feoZ4pgDP3WY5W5jooV13e+X01Skybp4UwHs9NC+Gyiyj6r+w9EyT5coIqY00
 VBN3BgUcxEfqCOkNFfdasdbpx6Ra+ZWcNPsEDsM6c56Bs3nZWXEkEC2vPmAET1LPFzV+DPGgL
 Y3dBAB4k7uA+EqrXwnttyg5sJgKJYZiCNQTJm3fyxDdx3VyujG+TPdHGe4S/K2mYP7fzdLutD
 9ZKC4hzBO+5OPyLqYEcazF8tAMyLGJGZl+GZeLYhCtd1Knr93XrFQb3Tj41i0LSEqra2nakhA
 POUZM4prlzCIWxpcht2FAAgCE2peqs/eLW/6NX02l8OZ1D61pXJ5Y3JhSUvS31xnSbry89Ule
 tm3GRfEXDkDxarm4TEfcL9mke53XXd31sA/wbz/2vzjZlsZqSxDyqKVpFLo3o8aNX85MG2W3/
 VFtFxjVFW7HzsiV8120WZ8A8Hfm/l4sS5aMxUEvLJDM/N9kF/mQuUUiMMYFy1VbdpBGZCj7Wy
 QTpEMrX3+Hi8pQR+HZv9MAIAFdiE20mbXzqKWDrpV4S+NyJ0kjpJpENgpmho0ZPvmWq0S1Soy
 BDpiv5rip9ALnbQ/IGx46OLssWprcPRGkdbx/xGWw7ed5Z9zJtsY0moup4K1T+gjmJQN94O7W
 5lSCB4CeBrjhSPoiD68/p1TsUQhOVFdz5jn30YNDYxnBDMPaKX9kSQlAGEZg3MPDz9XFhiDQx
 dNK2m8u37kuoZn6Hg2corm2emjYSSfqRlgpoJrGORXdy5BOIJjuXwoW0lk2moxoqXBevylmBm
 mz5M9qx+vFlRbQ2EnlMqvC2FMp5WPXAuC9FtgqXJYNIl5rM9eNeU7zq5R4WpxFftLp6lnNXYE
 pgANhlvHspvms83eV+unz8a4imAlQXGqRKSb2ZnKzzz0m20TxFHdW88T1i0vFVozscmuGiHx4
 mq0RbWEHynF4BVKKzKsueEB+mvIbeaVcu/h4ebul7P3agAOgt7Paqs3Y2YEbCoxM0ZOH86vLf
 xF/tK/+1WRGkLc0F+RFE+bWN4RWd1hzN//hDtLPiJXCu+M8SzLHoZOabQfjSotgpoPTarPTr7
 t6XucYo/a+jCJNQHhuBR6hl+t0A3DLR3WtAgrNfrMzRTxe1j9F8w9OlrINNiv0iiS09wHLGOq
 DPALZkVs18n0Q5xTTjBew7tOoG3zCf1wHfyN/pz/T4e8q/TwX+wXChmtdvrQPZlWfHvIvBwFs
 XmS0uls5aXg42sAPh7FjkFDf2RVOIliKCrQYDWyZvpZNDIphwZtGDfkQZPTfGt5MsqO6FcVwd
 9fK8cU0O59DMl8diFiiRqyH52rolfeLmIDSdIKdPdgkWSSCgYHD2rFiKgK0BHilb59Xi97fFh
 7/7STH1T6v+wpIRGPc0IeTamfo+wucoiPJp+A9csICP+eGD6zX3Km0/uYWldYhkHTaAeOEo+Z
 bQ32G317E3K0p/5wyG30sVf/wt/pJAXJYAZ5RJ6MGKEJq2NoaIBLiSwRxBefwlY8qsek1aqcO
 NyHhoyKQic+Irb82GpNBX2vSzN7D28BG/MC5q4mxnRPF8fGhseA8mCKESGELCfMv7Ii2u14vz
 13KzqzYYvQd0rnTBL8/NL70TNpBoT5SOOVobZTLgAoEngGEOo7GjnTSpO8aD2ljBBu2p18apM
 dk+qnP4mI4ETSDCyawW7g7yz4gxM+tcuMeJ/aq8WghSZiORV9mBVskPv//ZZ5eVFud7Rz1K9/
 yBItdOcqZVsVAdbkXHYaXv3pbEq7FGcmSN/Al0Thr0F4CD828s54E08aPvijiUOckPDaBV+wz
 eL+xk7O5m24tOpH86u/z7RBRnDN+nplpebBL2AWyTwpMTYY4PvpTf37VeRpmlbGiSWQJnDlhw
 t+XpfN16rsbPhg9Nl/vXfVTrnRArzb6hDaKsZ/CAgKEJbC5x2RC1Nl7PgUumGkQccTBrG+2G+
 E+5hzxl5CeIjC1nsznjoU/8U5XuIUaFuIvPhZhsznc3aZUOk5zGcRpbdwYuKqga6Xmm6qAwir
 sDjUDYBi59GGBcBTxwvL164bwqT84NNjBoFApFaLsEy/7Fsy0CUM6QHoQA5IGQkrRS08shLkU
 rGoV6KJRxGhP6srFzr25qe6KTp8ZD2C9F+teP/Qind2DLLynUSKpLGx/UCDkTFqAf0CjOF2Dx
 yePxTcS3YXEmSzaLQAk5asx911dEKCZzDNJ4Qv3Z93bB2HWCQbP511eZBydU6qqDEyUZIKmaF
 d5bwheeOsJyiu814feUbhbV4j2c5IPL8ORJ945TmTllByayy40PEufZsW01tud70arQ5b9XaX
 0Qw5fXwG4FDbTNH66H2pleWARy6SMgsQhJHht+gWneh7ghAudOr2H3gumXCLQpnt9hshz8XXk
 TPv6Twn4zoboimeqEr5Kxtpj8it3Sj88GFpLgdUsENUwiXbMFXwMBf7LHcrfwgELJYcvpiSCl
 pvwuuYU1yWguyqFiCtCpf3CbKCHzfpGossDPBAghqJKFSt2coLFGIp6wEsujXNmDBP4josy/O
 GHaAZ1r/8LRgf6LwnyenX5XXdmAE59j9u1A7KvT53QerSzaCBtXmXJUBJbQTXeAmyX9X5BJFe
 /fo3sZsd2elXj+oJMfPtyiLgLbYAHdTI+UlVJVr+uScii6kl7Ihvnu0HERKiZFaPDfE+v3bkz
 dexCIY943X4KAWFz9MNBVJ+WQ6vHQwK2HXm0XyV9q6dTrssinidYXjAglMd3EKwAK4XKm9DIH
 9rvfvXMiKk6VEyaCKijtaAkL7mYB/1b8DM5lhH40jM3Pk5dQVcB82m19hjAYHV9xuMW9poiK8
 uJweEESwZbHOTCsRUdFWA6AdzYtfY2o5Gzi0ZGuUqmrenC4keVdvjp41beRmihti5hn2T3Z+1
 G4WM7mt4mDAqUBkNqThFxAZNQ9egcZmuGnlVLdHnjR4y2iCecFI0mLrC5OtHtYAaqjecpB8KM
 mG1jqp2YMIWJm7Is9o4U9Qj8CFE01mejqshBQ==
Subject: [Buildroot] [PATCH v4 3/3] package/systemd: add option to build
 host systemd-measure
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
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

The host package already installs ukify, systemd-measure is required
if you want ukify to calculate, sign, or show expected PCR values. To
get systemd-measure, the "blkid", "openssl", and "tpm2" features must
be enabled [1].

[1] https://github.com/systemd/systemd/blob/v258.12/src/measure/meson.build

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
Changes v3 -> v4:
* renumber patch, former patch 3 (select BR2_PACKAGE_HOST_UTIL_LINUX)
  was rejected.
* link to src/measure/meson.build as of v258.12

Changes v1 -> v2:
* rephrase help and commit messages to clarify systemd-measure is not
  only needed to show expected PCR values, but to get them at all (in
  particular, to create signed PCR policies).

 package/systemd/Config.in.host | 17 +++++++++++++++--
 package/systemd/systemd.mk     | 17 ++++++++++++++---
 2 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/package/systemd/Config.in.host b/package/systemd/Config.in.host
index fdbebaee7a..87f409311a 100644
--- a/package/systemd/Config.in.host
+++ b/package/systemd/Config.in.host
@@ -1,4 +1,17 @@
-# Select this if you need host systemd tools (e.g. systemctl)
 config BR2_PACKAGE_HOST_SYSTEMD
-	bool
+	bool "host systemd"
 	depends on BR2_HOST_GCC_AT_LEAST_8
+	help
+	  Select this if you need host systemd tools (e.g. systemctl)
+
+if BR2_PACKAGE_HOST_SYSTEMD
+
+config BR2_PACKAGE_HOST_SYSTEMD_MEASURE
+	bool "systemd-measure"
+	help
+	  Build host-systemd with the systemd-measure tool. The
+	  host-systemd package installs ukify, systemd-measure is
+	  required if you want ukify to calculate, sign, or show
+	  expected PCR values.
+
+endif # BR2_PACKAGE_HOST_SYSTEMD
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 346d034822..7a73a06bb4 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -902,7 +902,6 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dmode=release \
 	-Dutmp=false \
 	-Dhibernate=false \
-	-Dtpm2=disabled \
 	-Dldconfig=false \
 	-Dresolve=false \
 	-Dbootloader=disabled \
@@ -953,7 +952,6 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dhtml=disabled \
 	-Dsmack=false \
 	-Dpolkit=disabled \
-	-Dblkid=disabled \
 	-Didn=false \
 	-Dadm-group=false \
 	-Dwheel-group=false \
@@ -1000,7 +998,6 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dlibcurl=disabled \
 	-Dgcrypt=disabled \
 	-Dgnutls=disabled \
-	-Dopenssl=disabled \
 	-Dp11kit=disabled \
 	-Dlibfido2=disabled \
 	-Dpcre2=disabled \
@@ -1018,6 +1015,20 @@ HOST_SYSTEMD_DEPENDENCIES = \
 	host-python-jinja2 \
 	host-python-pefile
 
+ifeq ($(BR2_PACKAGE_HOST_SYSTEMD_MEASURE),y)
+# host-util-linux (for blkid) is an unconditional dependency
+HOST_SYSTEMD_CONF_OPTS += \
+	-Dtpm2=enabled \
+	-Dblkid=enabled \
+	-Dopenssl=enabled
+HOST_SYSTEMD_DEPENDENCIES += host-openssl host-tpm2-tss
+else
+HOST_SYSTEMD_CONF_OPTS += \
+	-Dtpm2=disabled \
+	-Dblkid=disabled \
+	-Dopenssl=disabled
+endif
+
 HOST_SYSTEMD_NINJA_ENV = DESTDIR=$(HOST_DIR)
 
 # Fix RPATH After installation
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
