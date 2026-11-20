Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0E2606A33B
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 00:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=o+zuBnx9
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECDA760D8E;
	Fri, 20 Nov 2026 00:07:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7cuwt3fpd7rN; Fri, 20 Nov 2026 00:07:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B7D9960DD2
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795133245;
	b=kPEEKtwXfR1Q6+20mbyNFdXN/OLQHoCm1xage86d0wvZIdyk33qpHzj2hU4adBVsNdep
	 daYAMAOg320KZgKdOmGmI5FBahCUcX/n+2wS0dszOwS22S00UrtIEp6EFBhjhViz3j0sG
	 7yI6Wyp+OmuE72lG9SOH+XG+wdr9C/tWOHhcqILqtO5q44njZArtCJlm/WKfszA4Aj4kc
	 cJdn4uVLml7Viie9MQyUSV/qUvRz+QhhN5W65OOBpfVnOb9K0i/GHd/na9rJz22id5xiS
	 wXc9fwVTdixlOvM+iLGdo5dGVVRl9vwmPScVvEjkp80FOSlX9a6Pq5vfnVbqfZT3jMw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795133245;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM2-Signature:Message-Instance:X-UI-Sender-Class:Received:To:Cc:
	 Date:Message-ID:X-Mailer:MIME-Version:X-Provags-ID:UI-OutboundReport:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=xzNaO6XoFJlSG/NbDsQ/X5dKLgBZj7ncKAwm446d6Q8=;
	b=ZukjzzHXs8DPwSOK7fEFx7FBZjVK2a8BUPKPEdOZOB/CEoueRPtDKx54xG0Pt8LBX+rr
	 eKVEsXPzvEJWK5xd+h/xPTmX5+9i0SnXRWb0gvHxtG2e1LiqOn2vQxtmEx25vkKNYvHen
	 joIXuDaaYjTln+lqtyD09FyawU5LDz08NJnDqFuNpeZ+JWZexDADRTtOAJSXUHevtRGJs
	 9aD6GDTd96CR5IwB3uDDdGsmug0OeZi29xdL/HPLLqe0e2GyRt+fOeYvPNaMUUc0B1fD8
	 wRiZ+jJ4kYg19No2zhr9Ju+lM+VcASR93pbIMEVf990yD7wJW1v8g8Za/QWhsGRMEvA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795133245;
	bh=xzNaO6XoFJlSG/NbDsQ/X5dKLgBZj7ncKAwm446d6Q8=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=o+zuBnx9BpzZMJcNan3NrQeF+8v9XV1jUMi/luVPQ6qiBvUlxU2/8DD/peO7//9U+
	 SypIpN00O8qVRAmd6syE60tFb2A9KIXh8sGWehnvTHZQ9yyMAZxb/304bUdKlus2I9
	 ovOAOjNDNpl+sVER+BQKQfHU7wbNDYP7Lu1GAYdjnsVqNCd4UDLRGt70NqriHNVw68
	 MLrHHVhvQ3yQ6PJJIFuuo0kEmMAObEx8kM63C0S48rU2U2nmtdqI1ejMlY+xNQ/AHr
	 631HH9g2JxGaUs0JHdFuaDWxKcL2VaDmn7P0S2NWXgT84KXYjR71ww65wrzbRsHQjD
	 LSEsXow0EM5xA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7D9960DD2;
	Fri, 20 Nov 2026 00:07:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7EBA7260
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 00:07:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7034D815D4
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 00:07:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bJMIQ9CwvqQW for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 00:07:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BF129815C5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BF129815C5
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 00:07:22 +0000 (UTC)
DKIM2-Signature: i=1; m=1; t=1795133240; mf=PGZpb25hLmtsdXRlQGdteC5kZT4=;
 rt=PGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPg==; d=gmx.de;
 s=s31663417:rsa-sha256:cLJOhqIIFq0fwYtXwPf/hhvFIF8k
 DRHnlFxe7yf1iRECQCKtHTyhuhyLEc8pTlXIvhBdGvSRg+ztM/3Z86NLpCX9/uHhjcyZD7WDcWn
 v8bcv25LUnW1jtaPobA5Ky2030AdbRQwHUi6pGw71Ac4bbNlWPCpobqPXcMuFGO14QkAy20OO51
 ShqFY8SxSLwnz/MFsukqLL/ygn7083eqCjLJ2PoyvK9p7c4I5z9dEJQMnYY3OGJ/OY4hEkt+aQk
 fd+vrDL0wl7YiSkZoCq/oL1bLGjSCnzMVrfxmyuT0UmWaKBfVbhLB5Ynxa3ni+BC2y4WLBBZ2PY
 VIF/h+Kd13wTTg==;
Message-Instance: m=1; h=sha256: UBjsxYqFYqz8fWfWZAYmKSxDOZsoOvHkKt+bvfY3FQo=:
 x5oZm80NK240DYv+eqaaXIcQ987ldvyFR9iZktsmlWE=, sha512:
 ule3TeeJBQmOgfsWsWsMGgmYy8hVtQ0i2rGT3WmUyXJFH/gC0uU7UL+ukomcNeLVQjeYpgJMdDIFNp1IiGeQ+g==:
 IW8vOYPsLNucEZ2MbER64kgrnEJzMTAFejYqxdqbJ3xrFb4IhwaDeNLxZr+8wjAvioVqS+5/lMNtnDotf3KoRA==;
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M7JzQ-1xMV3L3KSS-0099xn; Fri, 20
 Nov 2026 01:07:19 +0100
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>, Peter Seiderer <ps.report@gmx.net>,
 Fiona Klute <fiona.klute@gmx.de>
Date: Fri, 20 Nov 2026 01:07:14 +0100
Message-ID: <20261120000714.490935-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:4COTcLGMgTZ25tdwWs+q2XEVBAnicsydUMqBp+8w/B9QCwmKJd6
 Yz5HvGN8S4+F+Fej62L35ZQyN3ZBc8zASbglqoI7Dadc4IuPYIKBO4Rhu9BkfhiY9kAVs6E
 uPhXwhBnqN3mHkwAxyqw2UulciZqs5TWwbhy9o9xWh6u+ocw/EiTSCVogohjqUWquecPrZF
 w47/fu/jGUrNyheAb343A==
UI-OutboundReport: notjunk:1;M01:P0:fvtu8Uv0vLQ=;qtLV+bREtDHs5C4MZ0DxfwOQzZx
 Lloc1jG/9X3lm2TNEtdMVu7EbVhv64sRXdLF0GvnZoaffiejpoAW+QEKVgdKp4ZXjSriH7Ds1
 bMfcNKyY4E8Ffj9kr0o9xo1sNO1LDPgSdOS/hvmdMc4kRfTxBvc0ovsW4f8ntJ35AJqN/b//o
 UrvsTOpnGiipAeTmBgSIl/zn/IeeRO+Ve9tT+Ft95Fhg2tPHfyhjo5GXSPftUYxmQXebpWudG
 P9o/sUYFTGxEgB3ukfPE35uoWn7c8WPNc08lj+SNzTeOReZjuU9b7V66wZzHuHTiemxjZgoUF
 WPFTHy1HeDEVkOlT43YXnTUMHhsrTlp2r6lahtYxBWHsZvBP6JOYwh6PS8tSLiDfp6arrdW/e
 VDSBYHrCivYEVaSKlUwPOCvY55cCVUppdlnELm5sszKL+xscctdq3Nxm0QGKVXhbo9eD6Y+4X
 d43vQ0VhqhoEyzVGpR6v08VncNYfCvd5lACt/sU62MlXyavwtKWNfpMWKp7DpVISnk6NexDaE
 7VlQ+x1565JbQ78IXD7dRdhTyKA1sF1qFscYuipHhkAGRezI1Pxsz6xHkeVHAVGxRQf9xerBJ
 lyT9HJdzQZoQ2WSWKCF6lsGh3QBFoRusLrUY8r+wYD3VOmG3PRQ0FCQXPtJqWcl7A61EshAE8
 rlYo3MxXbohg78otx8iS1cCcBG8CBTJouoBt8TpjClUrLCwVCpOtdh7VObQ8ye8wd2jvKztoL
 9uKUwe7iVKMlmeoJTUMz6k5LUDGkqLJCoEwG/mOHkM4cjSzb69gw9xtegGPrGSIk8meDDCB+K
 CBLKY6Ay7o7qTEv/y0bXB/33Edukiw+X0Tq5WqQeWYF3Fc7Ba87KCxyr1erusJO7Ijckna4f9
 WySbB1Vw7YPwpLtDlhGIpKmONkrCwiBSlWfS7ojTxyhpIEPqqiQ+seFeHgWwfF+s6afTyw3Ea
 Qy+w2HzD9SZuqeyeIOoL+j9y/YIm0trre95UWR/11mXBeMR1bujRrGp8KFhzM3cwEnR1PQ+wW
 /2AnG9X5vo6xpUPIWfe+QpM8UzfJCAjQatAHe+36uYalHicjTff4/OZi9VQsZBfgCM5xJpi3B
 1EaD28t92YWcnCqxd+j2euERunx+uxzxUWlrBYe1+Tf5UAag5bMumH65zo/rkrCumMuL+HdA5
 G7NffOu0oxYi7AVs5zKMGyzmuVvaoSSt+iaBvrbc9hMH/A+UCO9/Be2hsLIAMkuEB7IxB8qWZ
 +MeG1sZmycA8oN/S6EPDU3Fjtw75jKFjAo8xZlVhSmKO16teQK4gFtN7xQx3rlLbPg6pRH8yV
 qi1WYgZRNvay9DqJ3iv/HvKLNxJoIyrk6zoSxBjYpwLY1VpNIGJW3esdioigWBSFuvDH/XbXs
 xyHqzCOqaxsQJqBHSQRY1KLyKnt4x9wTUuQcv8xFwjccVZi2hqYhirp1tl/BFXJt74W3kQHAZ
 HEZR+KXsE/AnfxWZ0z499k+qX70oZguknLowf+v8+QYrpu0/nuv+/oMUUtJE9OKn1HlE6Gvlk
 YiJgY0P7jnYSNMrwhbL4sjc3Aeoh+XNYBGCKbyx3og9KuL9uCjni14Ke1gKZ2rktMOSBJx7B4
 70MVr8dO40DDXP8ahD5catORlp7xgSikTeeurDD1v+zt+7C3D1X8KFIkxj5K5ErIsYtMvuWMh
 vWLL7Ob4VGe9+MTQhteYFkPyF4NDHKmseJ+jt2QYCoL6zJ/H+AmTpvY3RnCVU+YBFVTE5/dwD
 IGOukyofF269O5JMJQb6pR9ASgGja3U7NxRS5p9kAHVY6P8FOPBmsBSYcQED6TQ5/GAQztpdt
 lQk5LQHCirGNmhbMJVmRPi0ofr8rxDoU+kuZ0lVF3Lm80KpQUmFJ6qxhhtTMjptLKp5LYOyP5
 Mbhk+/td3Jslx5SEAubqVcYWFGCLUatZJ3j7Tcti/K8QG+NCQ33gPTXZG8DCT/hLkksLMb3ui
 P/4fjiitIXQWLiL4KrWp+SxgResrjtkqhqE1OkL49oJLZXyLlKxEowI33Ubhq1LMpnEQ6al6Y
 g1msfI34PBXBQWy7XkqRyFRxXI9CHFCVMo7lCbRIWV0CYWBP0+HM1hO08MQAbdzmUEvoqW7Z3
 ySXpJK0ANxH0l7oQer2zNKIahjSbA4GtmBAe5M1zucMnyUTe10rIIyxUlhkadz8nXiEHosqyh
 Kkzrf+IRYxzjwkWeSyRji+dqPmFmaomQlGgjlSkEsobBwFsp84lChDrfOfWNGkzbZnXSIxAgk
 CZJfgeT1YKmZWHYbEN0UGa73EKsYrGDFXYLj0glGRDRF+8E6djbmUVjMvnSVL3Tb602rnoXyv
 7rk84/+ggwTmdERtO4ermTLM4hEiJxq3XbAvqE7YgB6ZH5rPd1IioOYq0UuZsU1f6Gi7aGkuE
 1//iIv/v3GD90PvGBoocEPwkoJu8BH4Nb7Hj2CUZ/TelcnXoFIqw4tWoxD1QThi5bo8j+uHif
 vWcX7uIYzJ/oetZJEyKo85AOzeiMVLJ10cgLJnK6zlq+yTdUHMX1CWvlxnFooeWdH54pTaak9
 Pp+XLZg9Rw9ZOw3/fRSC/3S0QEypnBdZtS9DstLNr6wr9OgkK8fS0C7Koj6kJ9SDQLEixj+2i
 gmu2pswA/SBCyiDpKyZBtUKIZlQvSUTMuDBSyLUIsmgrQKdT+G9g4btO6DjDtcFwMKTrYcoDd
 pIS/237r89GoPGMWY9zL+/02kmEgpcLXJ19P1oxfILkl8xQ6TCa5DMUYssuCPHnGr9xTKaYJQ
 346GfwpNTDEFQJxImtwbdzjS3ukEvcw8nz6yslNrZj4ZOlaJp/Bq9eZRTARgopHV8D8pg4N8k
 3nFibvp59vDwHGqgb5FdAafPyYIYv9QPYpktWy+dUqL+Pir6moo3XQUPfTT2fFIXOhay6dN04
 oD4lYrhpQUNzwPEp0aKrLSAkXzxpcJAUVbX4l20miS2bpBMChQHAqdiTl8/k09WA1J8BfshYG
 7xIcFkERyqsm1IrXbjvDktUD6Jh9IjXE8VRNJ0pFlW/9HRpxjeqeF+ONqzHiQfZnwuSKpDWmW
 MorKan5fhNDmcdQ46XHgwN3zi0WYgGYZgN91iL2OSzEM9OpLDnWSm4+gDC1VMEhTjnXqLg75+
 eGKSFtEzH8L5PMO2sJ69o8+abl8Na4S9+CRJgV33UsTtFmT7qB1gTsXTSn3YYDJngZKW9cK5m
 AgFCPxTAWbRXG2j9w5twGxTLHGYBMcoqwg3jGz0p4nhW6SE0+pktfRrtHXbBDrM1q310sOU2D
 iHKpTFkN2+TcbyvfA0wdbQiB5NZZZpVtb7TNulSCpRf80lpscuyo1g5rhPJCU8xPYOzE89bDF
 YuaJldrom5uFRyBdrsK9nxmLYrndZ9d2EEThVjGxSjihZoCXNmTuBKD0UPeRdcAVLQMeSJXNR
 cI/AyIUvJnV57bNO8k5rM1tEXf0/+HFd1DnbJwtnIJpauddhjrYqUhJUM/gMRsnTp1KyUKg0n
 DpDGPAlTFqA9mCEr6r7MJwhyDB4h70lZovaBADOYq+5Rb0YW8ubRBHSaAoFY6gJbJSsgoe7IH
 50+wuWPUQw+920MfJ+q6L6HILp34PqmEW3ki3l5lki/BtZxARmmfJF8/4+qIW9XXf1SIdu8TA
 mpToenglpKMDc0xBJZ1gTdrbA0s848L2zu0GNs6aC8QxDnNJRyGAWQFdJoxMKUDpatBwyjZdP
 4iXZBtEMCRGtbFBbojx0pCuP3ndRMwNlPB4396qxdv0b3diqpIzU/AowrLxxftduXtxfYhOwy
 ck07wzLmxhOROl81WUKiex7cx2ibZw3nBEaVyjuvjilImo8Jg2REOHyQwzbo0Rmyv8ksBIH7j
 CWstrMml64P/zkELI4Csrwdz6rp8WHLBfvCfXUa58jSa7WhqDtWPtVuWc4l+yIbg0BbtJqrFn
 8UkY25FkI/KMvu9wvs2bEfsw2UXEo04YUbfVqogiZnZ5ZrXBcYORbDZH3Bo9WCzVPFmbCynyw
 IqfSKHeb8tYjmmBpcOvEKtIHFMpQvhFJWE1vNFea3ksri8Cl0kx2lsdSr7vaU4Eq+jjPlXe2x
 MjcBvgtsPnKyGJJLvSD4VCpbyQJqc9D51P4UKV5yVGvQEh75zU1GYWao+7QpJA/bakutajIoz
 3AaSr8gayRwozJhcqasPWU8Up2mwVIyHmIkNkPSp55h7w5yfbrAtFwRFw/fup7JZBL67FZNOd
 PJLn2IAvxq2Jx6gs8XGO5jgrIeUE6M2W0oWdGkFpGaR1uhHoHv8IF2zxZLP1tCmde4zqSmX2j
 t2Vyo6ZV9481wP6nFxDlj/OQUWY+TyCji7n6vixiajrhoyjNxR4qzMmseCuWcEgH7qrqAXXDY
 H1a4GHg91Tlefd5B41KP7AfAC1jGFMOIh4BUMJkRkL98F0WaE3PM1TQ9ThOg9xrivFpcd4Sz8
 q58QpWtTsEbCp88yhMtxH1gG1emjRn9fPkUYyc54GNRigOdztSrqUZ0ZTXcKpNd9DiLsC5QBv
 aZFQKkD4A/H0mLGDZO1W0BS6Wdc7KPvUpQX3M2TkhxbDRH1oTBQxNHe03OqySi6Ib1Tzu4JY0
 f5Oe9vvNeGtcM7T6JYIYYB4U8G/xjgAqNYVXFsod6VEwj2qi9uZwGCNMxFiBWPWxm/zbTLyZL
 NOhdCNqSS1Ey0EZmTC32MoR5nWg5bZ2XnEfl5bWQYu3SIUXATzhCiCH1qedZVFDLB8vu/TNf4
 ruTnqdsDIBOszPWhIAr8jH+aAgPLAmpkYuepsnrKTLsy1OQ1u57NMnUy/CQYT78uxgEhrTD6N
 Sj8+ERGZWCz7GkLS+0WXoln/YAWe3KA4NiB8d5aFGDhRMgymrIF7HWWze9D/6twO18doP9Ean
 vUbDJBI4GoQreTsMH5qob+ISZkKTH7WqD5OcWt81J+1IWjbQUYHOYbK8b1o6YRQr2Wjomb1cR
 5YqNuzlemdqneIYbgBfYtmH9RR7WZWzj78gkottgExaYoTQptlJRL31vQi/w1woShpy8zBInG
 cgNzM03rzn5drzTo9yhr95jQK0bHShA/bFhnF3T4ydGkVKJrGSBx81y2x1KvuBaz4/qTZmDGw
 SWkLdqvi4ZIFZsQDFTrI3+/aLx4y2p7MKM02ht7LDQse6o0YbSWNGTduFp0q4WHxyZIkjPF9C
 wPd76dSqakikMItzfsYXYC/O9e1LLbrhqrI4pOP/235RzIiABshNQi5S/LXjxekFcPyYIQ2Un
 yiNXqM1+BSiaL+d1A8eJIHRoPRYsZerGvm/TYGY06IDA146Gn9efE4uaGhtFzCniIttiffJ4N
 nlOyE9lOsIN2zyoEx7NaKKcBPuvcg318ofCJ0ba2IyvRlFMWCa+TaQFxssw0d/dnQwHM4adk2
 7Dffx8RQ9i5hGApg0U5qcu1gJwGmFqjIFO4hIvHBYA/pg852L7D+L7mF1EYaqL8/7n6P/Emze
 0IME2px9n4MkPq/IFn82YLU45+jmMTL/hy8XKRfEqtjv4toWNTeGL37ched9Mtx95iFxReM3w
 bdY9tlERPUwhvHcpQF+7TrLZ9cWOEBsDpsqb0fozLRyt2Eln6qrQ6rYAvFuoaTO0ieLae5m0x
 2TH+lnvGOL9pfmH2GwPod+cc0bba1LcNFIa4mgT7nT6HDwLmiUfCgz4KVfQFmRS0nlr1i9pBO
 A3ny/5A296hSTMT3Bmzuh7jATw6wXfxVObNFtr1NKXRDu5r96T+hUz8F1695S1QrkKpkNNr3D
 A8wlaome+qa6RnowwtF7mD9I1LIBl3TyYSzC+9GO2SMgjq+ykx+asIE7z2LWCS2ZVF0xOFxuK
 Di+RVGLzLdXZYFnKbeEyYqi5K78Lv4Tn9hZhnRzdbpbBfVoRk/rFYdM+sLNAhOdm4IAuFCtfK
 BZYeTfi6GdwLUYFyy3vnC9Hgy2eH5TfJkrsUq+RzaDTBTlx8V9LjymaA2FFbtu2Hgf2NQ4yNE
 U9Ku8uCAunaMyqWxYyQW1u/t67Avi2IicoSFsIZ8CUZajaWktU3a+EyADZgEdQ5dZw2jkltMK
 pxht8MxWwv8bBS9obMpyLcQxNO82t7CswWkJZNvzivnUSUnVSNkSVUojcO3ol5wc1LwR+ziSN
 Jn5YOXWc2KkE/hR8M2HIrmxjoXlpzCcgXrKX1qH8vDlaHUrLp4p+xeCrAG+MDbGxjBHzd4no9
 VVogWC2s4bkMJSjgE2DLmPhMsKt1BLKzQe994orgxFP/MMlu9NFMtDb8g8GdW5HWELcuWvOMW
 5kaqgnXUZ4jHLA2vyOr4EhnyIYY05LmI9Bd7DURQFnwrnE+y3WnfOfVdmPPOrobxPQRzHw0m+
 ZtGvLvuEF3Sa2G0o2MX6dk+mQ+63j8iK18R1+8y1HSWxK0IVR21t5vU/x2Wl1omHSdStbkmVe
 XyE8GUxee8wWJaMMh+fSPwYX+HtFUf7hVed8qjqCS4M6lTVcVQ8A70EE9tqu/QwltEw6DyeK1
 MFHGV4+768ZD7K+OIR3jsOMqRYKISm3BOXQfLjEEBb9pR4tjsThrI6Fn3EHz1O73RHXajhsBi
 9smvB6S0ntrZRQGpQHh8bz9e89HFnVntA6QXat/JnP1vbljdx/xClIjYve6o7uRT7GmWokayX
 6FKWUjSrj1z3BeKQ4X1BXRPIdhD65rNEqD9/Dxq5fT/o4HZhkUJNPdzh0gDqnR2BKUwic0a3w
 Wp2RTJD/oCt1llVzT5Bg0/cOUzd87STZQTvPXqeNoHEMRcWD6CfFp4sD0XApBJRxT0ERad+9N
 +WGS/ICJSdE3O3kSXOaxe5u9Uu6fMpnGf5KzQq8bKf83yx1Ksi4YknEnSj5/U1qP/jGB7r1n1
 z8YPyKTqpYZtv0TE60nUtkEqokU3yeuK3CYzO91ImkQOs43ivlYKFvGVvnyh8fjIyH0mqUIG2
 +EZ/gKm7y2e2tXuBXfeXcoA4b0FcgRNIw8k+QHlrbwGOBpH9ZnUNf/vt2v2+uTJ6PanojzeQy
 zwmHopYFgVy/XEWbVDEuYUft133MDQNEhuPgv2OUgPMBSKkpt3QoFyj5gRwfr2kE8RWfLSDdc
 RgsdcojGm6W1P48/94hHWpTiQp0wpBPqLQshfyVbtCaW+fk/tSzPbMYJzHMbMT4QLY522C+DS
 Sttdz3xPw==
Subject: [Buildroot] [PATCH 1/1] support/testing: test_usbip: fix with eudev
 3.2.15
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since the update to eudev 3.2.15 the QEMU USB keyboard and mouse both
show up as "QEMU Tablet" in lsusb output due to hwdb changes [1],
causing the test to fail because it expects to find exactly one
keyboard initially. Remove the unused USB mouse, and adjust the test
to work with the remaining "QEMU Tablet" device.

[1] https://github.com/eudev-project/eudev/commit/27542cfe3c5f0f9e71d9e3be1f9430d00d7c8551

Fixes: f6c2c6a086ae1a5857f99514324ebf4038dab31a ("package/eudev: bump version to 3.2.15")

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 support/testing/tests/package/test_usbip.py | 25 ++++++++++-----------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/support/testing/tests/package/test_usbip.py b/support/testing/tests/package/test_usbip.py
index 62c7b59814..2a1a0e13b2 100644
--- a/support/testing/tests/package/test_usbip.py
+++ b/support/testing/tests/package/test_usbip.py
@@ -35,24 +35,24 @@ class TestUsbIp(infra.basetest.BRTest):
     def test_run(self):
         img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
         kern = os.path.join(self.builddir, "images", "Image")
-        # We add a USB keyboard and mouse devices for the test.
+        # We add a USB keyboard for the test, which shows up in "lsusb"
+        # as "QEMU Tablet".
         self.emulator.boot(arch="aarch64",
                            kernel=kern,
                            kernel_cmdline=["console=ttyAMA0"],
                            options=["-M", "virt", "-cpu", "cortex-a57", "-m", "256M",
                                     "-initrd", img,
                                     "-device", "usb-ehci,id=ehci",
-                                    "-device", "usb-kbd,bus=ehci.0",
-                                    "-device", "usb-mouse,bus=ehci.0"])
+                                    "-device", "usb-kbd,bus=ehci.0"])
         self.emulator.login()
 
         # We check the program can execute.
         self.assertRunOk("usbipd --version")
 
-        # We check "lsusb" sees exactly one QEMU USB Keyboard.
+        # We check "lsusb" sees exactly one QEMU Tablet.
         out, ret = self.emulator.run("lsusb")
         self.assertEqual(ret, 0)
-        kbd_count = "\n".join(out).count("QEMU USB Keyboard")
+        kbd_count = "\n".join(out).count("QEMU Tablet")
         self.assertEqual(kbd_count, 1)
 
         # The daemon is not running yet. Listing remote devices is
@@ -64,18 +64,18 @@ class TestUsbIp(infra.basetest.BRTest):
 
         # The daemon is started. Listing remote devices is now
         # expected to succeed, but with an empty list (since we did
-        # not exported any device yet).
+        # not export any device yet).
         out, ret = self.emulator.run("usbip list --remote=127.0.0.1")
         self.assertEqual(ret, 0)
         self.assertIn("no exportable devices found", "\n".join(out))
 
         # We list the local devices seen by usbip. We check we can see
-        # our local USB keyboard device in it.
+        # our local USB tablet device in it.
         out, ret = self.emulator.run("usbip list --local")
         self.assertEqual(ret, 0)
         self.assertIn("busid 1-1", "\n".join(out))
 
-        # We bind the first device (USB Keyboard)
+        # We bind the first device (USB Tablet)
         self.assertRunOk("usbip bind --busid=1-1")
 
         # We list the remote devices. We should see our exported
@@ -88,16 +88,15 @@ class TestUsbIp(infra.basetest.BRTest):
         self.assertIn("Exportable USB devices", out_str)
         self.assertIn("(0627:0001)", out_str)
 
-        # We attach the keyboard. This should create a second USB
-        # keyboard.
+        # We attach the tablet. This should create a second USB tablet.
         self.assertRunOk("usbip attach --remote=127.0.0.1 --busid=1-1")
 
-        # Wait a bit, to let the new keyboard be detected.
+        # Wait a bit, to let the new device be detected.
         time.sleep(1)
 
-        # We check "lsusb" now sees exactly two QEMU USB Keyboards
+        # We check "lsusb" now sees exactly two QEMU Tablets
         # (the original one, and a second one created by usbip).
         out, ret = self.emulator.run("lsusb")
         self.assertEqual(ret, 0)
-        kbd_count = "\n".join(out).count("QEMU USB Keyboard")
+        kbd_count = "\n".join(out).count("QEMU Tablet")
         self.assertEqual(kbd_count, 2)
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
