Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FC1606A319
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 21:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Onc4/nhx
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A78280D01;
	Tue, 20 Oct 2026 21:04:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6sIrMRFpcMtT; Tue, 20 Oct 2026 21:04:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org F192280DCC
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792530245;
	b=CkUzf3KZrNSOH+jitT65xYPyMKei+w7RSr8EOZtR+PC3UYxd1L3ZDld89eZOee7ibZEP
	 qq5kuTt2S6GKA6+swTbLgxf90GMdvkI/EFu7h5s+tNpeS6HWF0LdzhLfeRibU4bcmt8HI
	 Gg6DbOC9wIzckVkDmJ67bT9YLUgTVOfVkF8CTmyZvzqUOKvmbsZEpgEje7io/r7EpaXHJ
	 QWUpXzoh5dDhAQwN2790zgZ328RA0eo35ZheI1yn8ep6tzYhcFLHWO8goxJpCYT+fWA5z
	 Sue5rFCI6/R71LkzPAJm+lpO2nexVHhfY3ijxgzDR1nwTkMiVKy8j6oW3e59OJwpIkA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792530245;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Tk0SNe7QHLQK0Q1CWugcHKCXEUOASX7PPyTAciVTJ/Q=;
	b=Mzf8HxqfDWHhYV59ar1ngTIjtINDzRDVv8zLAknkrO17ePvMI5b3t/NseVG4i++Xv166
	 ek198rhyH7wbgZpdBwFNMIanuZ7otq1WvAj8YBjPxbq19c28ufjZaYkpmmCi0Q3Wry/IE
	 u4P/qDeNGNjP5V715r7i9oUpzfucTXke/6C9vrj1FXgNW6jPY/c/koHTZKbamKcISgv7s
	 NQJudWU1mGRgJ+MWu7vzfe2RS3Y9FXprLh2U/hSeJZzGXw4cg0knnjXmmeXvnGAd3+OM6
	 K1Xw96zQwz25/zdDHLCjUtWDak3+rEH3DDExHiaHpCqmJHjHMQsFJhNaUubwJ+Hs3lA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792530245;
	bh=Tk0SNe7QHLQK0Q1CWugcHKCXEUOASX7PPyTAciVTJ/Q=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Onc4/nhxzPZkGRIRxl9P+JTXYbsHDceRNvGz+n8w6psPQkh7X9ZFqMpGHimyazzeR
	 mPlP4FIAw3dpxdSlpuzUlJcmTK5Pqu9sUAGDKHrT6l/4J/hQdY2JzSlAyZGrWy9MQs
	 YkWp0AWIaipuWecm6KQt4oXPEY76ecWLcNWGUz2mMXIV5BR+10cAyE+vUrnWEo3izl
	 d8nJnv0TzlJne2wWAyGAGVSiIegzuEsdWXy/Wmtp5eBqkpQ9wV8Krdg9MNRM7SdxJH
	 JEyiOOK7cNqoTTp/N7hm3G3P05ZEdqq7VJ9nOD5XOIsLv0vTIRfakUIXbW8fuT+0xv
	 sXFqdz7PiR3vQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F192280DCC;
	Tue, 20 Oct 2026 21:04:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E382B3A4
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 21:04:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C91926071C
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 21:04:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JGVYpnrtf6Xt for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 21:04:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4F40260719
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792530241;
 b=cgH2cmxMZ4zDX4EmLV+4hEUMkBe3C7IFnditqxaDmPdyaV+CrGHqIk4hRJ0cSYep3PvR
 sccJOuZCj67JGWwsBUPGQqpcMhLgzhL9At+R4O4WrWbeEAVHJOTJtBhwU7Y0yRGglKRF5
 g4mcsY19VN+rvNf9HIHBJCnm5uphrryueZ+bZNg26uGtXC1yF3wnBBmgyaB/h2yK2JCD/
 XmZTawxV6VeNCUFh807aHyy1a807OozhRmg44hXTktxzM2PcX20yU4rb9xCAJDDsxMdQD
 AvhSvvQWuszw6nLOSNnnrZSKZYgz3GIS0Hro1ynpTkDPzYgNUKiFMUinikp7GqmqgHA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792530241;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=bFttZBcedh5kkmUYQ4tB9AFqAWz7+1PXxUxO4RpWy38=;
 b=TfnVWnA6P6inQZnT7xnA+EUBYzOzu156Z10Oz39iz1H7rmmVBy2kH+taMdCxmI/NLSh+
 NmCAVOP5kKPct3xTrQ9I7rZFQ9Htu+gur2DzRQDm9pDhglgCX5ubau0cRWwO/SGkTZIax
 0EJdgkdItJU2X+R97TZFqjD0yLBXW94V9ssw9ulc685enGmFmM2mBj9M7j9ooYQGwDT0N
 NtmUGBQQE6YxOOLlTnny2NgPX9MQifqZ0FYxfFHI8GZ2KTeyVC9CVU/xptLyuGcuhYG7d
 NVwFl/1pgKMlwdlppxaKx7arCEdcUplOgtaRxPxlPrlg1kd8L5Zy9kvXzaB6jM/LYTg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=SUF5RXWp; 
 arc=none smtp.remote-ip=212.227.15.18
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F40260719
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 21:03:58 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mjj8D-1wu9Vn2y3H-00dVSK; Tue, 20
 Oct 2026 23:03:56 +0200
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>
Date: Tue, 20 Oct 2026 23:03:38 +0200
Message-ID: <20261020210338.1175946-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:JdGU+8j0M1e9Smp/Vth5kQc37JUOd4YawU+8uji58S6fxjrLrYe
 qRjTFEa9hHLxMuairn5ywAkJh4r14Lmj4p+Yl1NRGH+kH8rJ3iFDjS0/6zdwX1LcM24SqXJ
 xu7A5V4WHmEzET7cGyVqLIPdHj0cOmYppxLYrM7MM4p5WPDL1gV/g9eMCSWUYL8gp55Xk3J
 Fh1ST1wklP/RkwmNrYooA==
UI-OutboundReport: notjunk:1;M01:P0:ui8XLDs2VVw=;GcVoHgqZR9M7h+bPtxbchm0i0Vy
 vFEgciyz0+uxmFXNQxmUzKgOl1BRn09oidinD0q/cNysIftee6A6bLMSqi/k7Mvk62l5xYWmD
 Appoyq9tFWOX7Ynhsu4euzybR2gCYa0FLHFt9NzmklwgioeYhMh0Q3W6p4zMIMkvIm3Cwh9Ru
 t7k3wzM8HzrQa6wuI5TFh6/yPwlSex+5J7GeJvxiF+e0ZvCW94+7kvYO0inohYkFceqxiJEwK
 FB3s5Hot64xH9qfJzk+OR7BePO/qpsaetTodZYfmHTgeI29H3HBb3wmCqabSyr757qMA+9lHf
 L48zWzKdfUJdMJf3nTIhXdoL96aZlFpM1n2cWhcGy312QcpfEF330oDVKystUwgzS2In3ovvq
 g44I7QA7SUy7ehBZLMEpsanmkgwUZV378Nt6GTOSVj90XBHhrLrCVtUlDTgHYKR+5MEKcFZ8C
 IwAwSsThyF3T6nVEUulms4ouCVZdS0R4zE5T1h10YmcmlBel1mD/sZwCZaFfkypw1JAwJCDAK
 /Q0ueYNSyFSG3NFLPfD65dplp4Jog7t1u3uFTAlEg7nyv79q8g/cQf/1Zy+VhQDLxS5Z6j0pk
 nGqDQJjqr9dpDrtupJg4hMm4kEDYq/6/eiyfVuXsjJqpzx9CVL9ap1JtAyStXXdNvWZlHy0/l
 Cg3OhVp5djGWUP1yfVCxa6XDT7fAAKD1BH6269YZEqN/eBnpvJ4dmghxwonhZZtJV75N/87++
 vVjgbPKUXzH0zRTql/od3fW1qWzF78JydEUmqCgK0jcGWr9374CFpkt4dzpnYx+Lncb72tvmc
 jdakbgV1DR7i4YTxzGoiOmNDgNJCXoWDsXAa18PgFqESQ5d6LmQw05I1vAt6zh7Up5tgXmQde
 3YG+2Af7a8SELxTaT4CItFwlYA5AN/4JNNmnk7L8A0MQwRCFcJaF5Y9zJNw55P0O30lZ60CLd
 40rHx6kJIxFJZWgDd0IRVXtc7r1Ux4+XMr159TpYcyIMJ6Q6MKEn7CBnxbypqVyYqXF1A2cfc
 uQWGP2eA/AzzB6D/epbMaD2PEl3AS/zGAk0g8Pg9mHgtnQNTJBuFtB/qlzJbHk+kbGHryYlEy
 0/4al9DvTQymNx7fQdyr7ekMCZhlMQXyQExOXNSz608nULDIXZUOtTChDRxHd6U8gHLqjvfLB
 nTZfl/sOUlDQgD0MSi2p466PJMQlGESVKPSE7K9hyojqvOxppgXafsg1gVkMajq5kzNvTVK4Z
 4ZP732H6h1UvmPoJ1vTYRMBCpTjl5U27YTCNwl8nuua5XVkE500GGXBVMWYGrdR97M7LXi4Cm
 5PE8o54MxEfmLQ/2Y8EgWJJF0+8hBRDZrdfI2RlxMtn0wSCQQND5QGWP17WYBZi0UzqYyK+gK
 C/iQH3p4jn0dM/OMWD+9TSfwqljUaJjavlLTGkdBKKP70HlGQTIAPz+bxTtWSbwyUBjLaJfTq
 yfy6RanJTpFQVHUFoBgvHvaeEdMEHA5mC5iaPWbdEmeg8KH3wJ1zFzB56PxlNHIIQhwYdztfu
 pnS0trfXtciIWG79q7M4wK6MMH2o2fsRMlCAkWHmRd7uzAaEUhObptr5IZMdioC43GXk0yMyn
 VOQYmilRYSh5p4BxJOhUXOWrnDg1rkDQTCoMwwYn50RPs613Lm+Hv9jfze6F8F0pvlQp/rQIx
 Zf4G/iNR+6Wj1g+OczgclP0J0xAF/GEtWbCW8wkGm+zmo1Xq4pvIhgvQ+aww+iHqGDcydhCy0
 qN0rvZetDXSC2X5pOityCA9xzXiApXbVzIBlq2gw0jTMIIEDOQLvYDzMU3CoKqtBInitS8uh7
 PUUMkowdmiL/a2RrtdhzbafxRqnP/U7rKGCrHAjCCs8XJ4GyGpB2IrmaDLhCLAqG1dnWgSiNT
 HMhNSQoHPcbzOfYjcyizmfqTIIiWR55aIyjdIEItbONQA98miWw4x7I0VxlWjjxjBcEMx7H1Q
 /qxOp/bBjLR2fmlDd8A3ol88LYdcPQA2dPoEGnSOS5rQvVOCLxZZBImXZfD++A4CVZUsdnH3X
 V6ur5xWhpaMmrXnARu5zvpoDLW+xfovXmg6Tnw9nv2jKojdRS1uOCrrFRHct7mSdKdoIrIIyK
 9I1Q318FP0eaNuqBkFV6rlg/9K8VRl4fiJ2BfUcOVbIm0X0k+S+Oq8WzcgGh6Zjl8nEHwldRT
 Q7eTLWWeFTvs6y/yVh3svVK6xG+P7U8nuGo3Q/MBsKuX7UrgXI9oSIXyihk6bAAY12L5f+BNK
 Hyd3epJRTD9CPcuSWXp7rFRn9CVWwT4Qy0J35FsCPG66xfZObKv0tsn6TFkhER4zr/Glbf8k4
 Yg/ksmH1HWSD8kphE25RcFakedCWNLUhW3ibiNssocLnItR9ip+uFcMuEkYb8BLvGl+PQxsWR
 M8Jnm7cBygiXqVxFb27UcEbOIKEh7w1FedEVVRMfAhfABs/5beeRoMkYQuEQtriD9YkvAEwSR
 ogYVIdC22OjczMt1ywNbVw78uPkg29btUl16Iw5b2RpdNYEwl1idjXPZrhqX+sPfxtJYkbyXt
 RaFF6Nt7tKrnlnhYsCdCJsyOQ20LE5wM5Jx9LLnRJTUYBLM5GwieMCacRSKBr1lu24ouNqmO0
 CbvrD+KgWl3qWGuav9b29BpjzOlmcntANTaJ2nc4/4a/0aAwn9vAN7HMqTp1knCMEmzfXfkE3
 xYN/3uKNoK/AdGSOJ5NOGnT8wRPbYUKyIpvFdZBYSq5wInrXltPxmg+5c+d51phV2ilOAXecb
 1FyJtGfawnn1Kqx/dTUNcxeQEY/rwsWQnWDaO70IJQW8Ltg30ycUREZ234KaG2XRGKzxcaKYU
 62TUwoQFQwNDL6vplqszaD5wPH+1F2gJBGvP8ju3FR5+CGtqwvwN02UV66WQPy6GhZJSKTHAm
 T0nIgsm0Bxhphj8dPy9i8GIjqBWFk56vRmK2hPtn4wxLtoQEg/qlnMc1BaI58uwOY/IS3DJ9K
 E8FXMKGUmq//+RUlenTL01DRuFbM39mxg6Q8VgvGtXT4uJiQc+RSDFuv+VzOpnemYfAOiK/Vx
 d4szH/OxlwT3hR7yB+Ornx5rAgaiBEszA9SyzhBlUD2myuHcTvYZ77jwBqRxoHZAUJKbY3E5Q
 ASpGu7L4lPz3CWqn6Q3ltx7GdGnSSFyQfRURXHziW19Sr6yshaeTe6ooK2LgDaeAfuyds1M1B
 5eJxXHUDSp1Zy+WjRLIShMJ04JBY9a7SfN5wKCSwb0vquNTYMearG4ngdN8Yc2S9lb9JpUp02
 VxF4ZMJYP3XpdC2pZ6Rg8YA/HYwafC0i2+TjX2GzO13t2VOd/kA3RQ9q44hT2ZNag5BeJERsF
 iO7gQ0hdviIxm1hXK2QEDlqFR5/oowRahVTGaq2xAZIA58SG0jsuYgX2Z7xEM6+Q4Pnpb+UE4
 0ACG+kjSiLZjHxTW+wiymO9dex5SvOW6VGBKik893iPb+s4utDmjwohCEaN5mxAUVMGLfFkCj
 LJtCkUPFMnxRzdqLjJtZXUyOKLd5+lqdTJDi8WHgj7eQ8jeWMlXwixXnxGM/PpQqi2YNET9Pu
 UQmjixn3PN07NsXBRfWwZjssGA7vYRpbj2RSer1omfAeU1lmNhQl9ziFYfq+BmFHngyzZLghl
 l96cOABj+AYWxRcXFjfiOJvFo73rispJVfU6PihPnz2thRPXre7w+srZqMwu+4GnpssoFfJgt
 bEdOF12z5g35ZzmA0L6UgwVADhxhxXk+m1IL+o0N3qd73lLRrq1vCAstVLDK8lLWX2sTiJogB
 03j1lgjV++cFIAYLI9mKDe7k3GlbKwVyX9BVO4DmkIBEF0KbBf68HiVRTdXjQVrsOxfvPDOiN
 qCWe58iVrCYRoAO9U5l64Li0Zwqe5umXyRWv1h+HslMa/33AfE0riVrO8IrMWM4HzKLihm5pS
 vkL6B7gn612sa1cTKU3MMzHJhqRHfiYjf9brUIQVoakitGBPjuFAmwoaBGxeRi/snFH/jl7jG
 qRODRK+bIaW4WNYFGIHSipPlrH2+1R5QPU8wg0gdgDu4QkpClyuYodn5LRVnDfjhj03ioh56m
 wngqqYYeZs9bSh1yv/duQ+MImucI1Xl0/lZUY/d4i0P9SK7/5De9l6HpyK5mpZns37hgWZAk0
 s1RtsCo9AhBBLcXw4i7mftVP4sQeRknplXMoFqLgqfu+CF0fWLwj3fQdSRLBKLfFmQnDfhIvO
 Hdh0RUf+Un77cOejV0raA8TtEPht42lmEbLiVHHEeFpGozy5KZ9KskoBOagRehkgdbGdO1lpS
 6dghYizQtM2G5KjffbbgAlCQI2jHqYSkVVwvjsNkX12XZmJlYfui7GVn2gZHjiHbBCweLNXWS
 aFmlXQ9OBcvNPKxIooixox5yI8sdQ48I21C1hjt9/XUEuT9L85bw75IVvy3pjuRPK3Tz3Z6bk
 7vnNXny884yvnvD9tov/iT5KT/U9iu5R1LjjktN0TQjXRg+fpsI5NeLgCV2oadG56euhZ4Lt3
 mpv6WV3cLDXccb9G/QDc8WowzQORXGOPW8ibHKVgsfk/u2vYaWG0RhW0WM7nJdGZ27bdPGTwD
 7s5Am4RKvdsfodHYzdft5sXFu7Ed5DplsVq7TGqt7InlMqlEqH8mWZ70hQrjtugmHkicXLexY
 LYdfv3/0EQ5+KrRH16uNJcdp0Cg9IVf7x5LquKdBB+x8G6zSO25oSR+molibHzhRr9jXWRBgl
 m/rD06GJV50rF5uhMGb13N9afb+WJ4YXhWVrCTtKwZo6tSO+r0MpmCgMeMMppbxQjEL75IOFl
 ZKr/18wzind5OLZWBsmWFxF5AJnIoqGMQKRCvToCRpDuXvXT1zwams4LneG7NM5JEykVY59nl
 oEp82sUoNkLRP42WpXBzAk3VhzpK6qM3n55tfn9E/zUE1AZAgC8R+xzrFvF3KGctHsX5nBA05
 kLBSl6m6zjFWzlBPA0iL8stlEL2HyHlfmxQTBnDa32HFXI9+OIZ0gIPsRgDoeTxvwgrFX0vDv
 zwU5AR1n2unGG7THbu57cO0gfwBrL+YWnZufGdE5PQfJ46Ns3f5ei05Mn1M6WgmHrtqm6BfsN
 0Zk33QBckibFnmHvuarF38BVodQyvGcxehyTVUs9O0EBMXESBBQd/TAgDEgnkFFZhlEKJDH1h
 mfuCe9x2r3FRZmh5kwGAEu3O/7uCIsBB9rxii5wFiGCLNGrx/s2ciGVs0b/v8o/BsW2ljyEi7
 oFV5c52OGXa7kbDs0lozgLxfUZdqe44Vx0IBPrLXGD2S1ESBGmvNeSv3HfkXERFEdDZraBCcX
 fS7uuBjYG/25o5enb0JNNMWHUAjf99fk9Mn8Bx7eZE8eerPHfNAK0/6BnD76/3V8juQVSWo5l
 blgQZldgVbnPH5i7r+LTQ9r1FFLorLttA6jWK4N82epC8lbCFW+Wu+KId2TYngp/c1rKwxOXO
 AFfTpF5LUqvk6GjRSoIe3HK10DMomdveYkQ08z49Ig8b1Gi6R0KR5BzRR5zHYhchhUIf/wvUq
 jqwIgoaFCd1wJx73IQB4BKb4Vn3EDvHQIxXofyn182VtamtZrdOCoB23sGVwHrUq/wb+ux4Dr
 uq/7bB1EgFiZ5xQ1IY8hmIZwIDl/E4YUOhESX+fZLh1KuRzSlUTV3ewMsOUmqx9CFgOSKXAA0
 12kNyStXfSBMzb206oiAy3KjOJIEsDEUgNfTCZ0uk5cafYxwojP8INWM4W0aDsfOaSG1G9/oF
 4PpFIonXhnJYv/xzO2QIYC21NWin8SmsR244I5AmU64+MrQh1UKCdMz9LUlet5PYA8CjrmhaV
 swexM7dg52LhFo+KnJooEIzMkd51wZ/6Ncz9Dqj5e/Ft131iFWxA6GmkPsgW6az8IaqyQJdy5
 bR9S4t6/uoIvmWJdCMQKJpCDgWf/igpI8fogi2c2udd58bLXT5UwH4STHKGnX8Vc+IFM1zEdw
 gUHhd8iWUp3Qqs75Tz6fi32VT9NuPXoQOLwm0fvoQkej10ywZuFqW0PeGxsIrAj94gR7LbC7e
 UP+DdN708nBHQ5CuUANSgAuMrAVtkR/YpWG4Z9HK+Z4f5swvQYImNR2Tw77EOHcAmjLDTUnzk
 TIn3W0UQarcVkXupoT5oedpaeAvzquS5DPvUenumLGK62zrwslntXZ4lqb8l4AB6rCZR8EPFP
 M0uwv3vt3gNmPM1mVTtg3klzhxF5doxjY+t1M5ceMrCsHuBfeI1PhWhv1JITwVk0/pf4W5EZR
 VVeCNAEvASLscGW66F4ecZx0WyP61bZ89s3jwG2NBFN/YEpFs+/LxcNvps3MlWwyR4H8207ei
 Ntu7LdMaVtKsZUbDonVanoGVwAu7FftBhgYglK8zjYNYUni+3hbH7LgU6BpKIpy5/M1LC95SC
 ID4YrmH7mA6Dc/LIAiLBCx7d1zxGnyWI6piccFGU0SV5L6YxpazpMcsNXtpjAIJppaoS0DStd
 OnjecqbhJ0Lh67sGbip8hGlQ8KdNPP+UblKeVveUPSm8ZWcjtAJ+j9e3pd5arX0EwOw/THUxK
 E0KqmQWZTpNFK6uGObrLfNP96UXNdyBz9mJ4p0vDZByzp8+sLoy5+iEqkOATVH47fwL7eu6j0
 gv/Ysab6ftFeF6WYZOxa7AQ7xRLknfsWMwQghvQ8xVcDVMXenRFsnSzhp2bzmj0DQXrTXdI6r
 5ILziWmKqRRvfwN5F0v+xJix7/gQY72c5rg1vDWSMg7WL/LcAo2AXk8x4vIvrcw==
Subject: [Buildroot] [PATCH 1/1] support/config-fragments: set
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
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

Enable BR2_DOWNLOAD_FORCE_CHECK_HASHES in
support/config-fragments/minimal.config, so all downloads are verified
in utils/test-pkg runs. A few toolchain configs use custom toolchain
download URLs, which the toolchain-external-custom package cannot
provide hashes for. Add BR2_GLOBAL_PATCH_DIR to these configs, and a
toolchain-external-custom.hash file with the required hashes in that
directory.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
I intended to send this together with patch(es) to do the same for
support/testing, but that needs a bit more work, and today's
number-4-related publications demonstrate that relying on HTTPS alone
isn't ideal. ;-)

 .../autobuild/bootlin-aarch64-glibc-old.config              | 1 +
 support/config-fragments/autobuild/br-arm-basic.config      | 1 +
 .../config-fragments/autobuild/br-arm-full-nothread.config  | 1 +
 .../config-fragments/autobuild/br-arm-full-static.config    | 1 +
 .../toolchain-external-custom.hash                          | 6 ++++++
 support/config-fragments/minimal.config                     | 6 ++++--
 6 files changed, 14 insertions(+), 2 deletions(-)
 create mode 100644 support/config-fragments/autobuild/patches/toolchain-external-custom/toolchain-external-custom.hash

diff --git a/support/config-fragments/autobuild/bootlin-aarch64-glibc-old.config b/support/config-fragments/autobuild/bootlin-aarch64-glibc-old.config
index 7637a99cc8..193da4b0a4 100644
--- a/support/config-fragments/autobuild/bootlin-aarch64-glibc-old.config
+++ b/support/config-fragments/autobuild/bootlin-aarch64-glibc-old.config
@@ -7,3 +7,4 @@ BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
+BR2_GLOBAL_PATCH_DIR="support/config-fragments/autobuild/patches"
diff --git a/support/config-fragments/autobuild/br-arm-basic.config b/support/config-fragments/autobuild/br-arm-basic.config
index 3212cd5a66..f7c053cf9d 100644
--- a/support/config-fragments/autobuild/br-arm-basic.config
+++ b/support/config-fragments/autobuild/br-arm-basic.config
@@ -6,3 +6,4 @@ BR2_TOOLCHAIN_EXTERNAL_URL="https://autobuild.buildroot.org/toolchains/tarballs/
 BR2_TOOLCHAIN_EXTERNAL_GCC_9=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_9=y
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
+BR2_GLOBAL_PATCH_DIR="support/config-fragments/autobuild/patches"
diff --git a/support/config-fragments/autobuild/br-arm-full-nothread.config b/support/config-fragments/autobuild/br-arm-full-nothread.config
index 855a24f969..b4853e8a9c 100644
--- a/support/config-fragments/autobuild/br-arm-full-nothread.config
+++ b/support/config-fragments/autobuild/br-arm-full-nothread.config
@@ -9,3 +9,4 @@ BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_9=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS is not set
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
+BR2_GLOBAL_PATCH_DIR="support/config-fragments/autobuild/patches"
diff --git a/support/config-fragments/autobuild/br-arm-full-static.config b/support/config-fragments/autobuild/br-arm-full-static.config
index 33c7cffc72..16ba61c94d 100644
--- a/support/config-fragments/autobuild/br-arm-full-static.config
+++ b/support/config-fragments/autobuild/br-arm-full-static.config
@@ -9,3 +9,4 @@ BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_4=y
 BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
 # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
+BR2_GLOBAL_PATCH_DIR="support/config-fragments/autobuild/patches"
diff --git a/support/config-fragments/autobuild/patches/toolchain-external-custom/toolchain-external-custom.hash b/support/config-fragments/autobuild/patches/toolchain-external-custom/toolchain-external-custom.hash
new file mode 100644
index 0000000000..189b84894e
--- /dev/null
+++ b/support/config-fragments/autobuild/patches/toolchain-external-custom/toolchain-external-custom.hash
@@ -0,0 +1,6 @@
+# This file contains locally calculated hashes for custom toolchains
+# used in support/config-fragments/autobuild/*.config
+sha256  1a48fa821f961a09e31f988768950b68dce44dc590c415dca6ec580b1a32a30b  aarch64--glibc--bleeding-edge-2017.05-toolchains-1-2.tar.bz2
+sha256  eda135def936d8a4e67e01c858bdc8f5d8ee751649d771a4f7a65e1eaabd8ddf  br-arm11-full-nothread-2020.11.2.tar.bz2
+sha256  318c5aebf3a42ce86197c386b4a2f44b96e934757b313383cde8c1e5e17f8d89  br-arm-basic-2020.11.2.tar.bz2
+sha256  2da69043b49be9c7280da0e41851350ea07f3761840ecf8498986e7e51cc2c50  br-arm-full-static-2020.11.2.tar.bz2
diff --git a/support/config-fragments/minimal.config b/support/config-fragments/minimal.config
index 3430fcce11..4427be7e7c 100644
--- a/support/config-fragments/minimal.config
+++ b/support/config-fragments/minimal.config
@@ -1,7 +1,9 @@
-# This config fragment disables Buildroot options that are turned on by
-# default, in order to arrive at minimal build time.
+# This config fragment disables Buildroot options that are turned on
+# by default, in order to arrive at minimal build time. Also require
+# checking download hashes.
 BR2_INIT_NONE=y
 BR2_SYSTEM_BIN_SH_NONE=y
 # BR2_PACKAGE_BUSYBOX is not set
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
