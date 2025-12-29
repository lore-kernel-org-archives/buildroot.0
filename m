Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F67E9273A
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 15:26:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C368F40626;
	Mon, 29 Dec 2025 15:26:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XEOD8uvlYG9v; Mon, 29 Dec 2025 15:26:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF6B640475
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767022004;
	bh=+488WY819pROPM9DQVQKB7uWhs1ZQbemo14pUE+Ypf4=;
	h=Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=KFCYXrSulwFxtYVOSkmE6aSeXSDBs6xODZHrbMT3/efG1iqi7kFIu9J9l9BDp24Nq
	 2hqOQOtZ7S5mpXvxkvgnNKx7wp62cUQiDJONyp9umG+z9e8lRxm6c5LV02KLoC9obJ
	 AjpfNCzYE/TD6x4F20B7qyghHOEHyse7EX8efhkSpjChXWjyADuqGRNFBXpvvTSikn
	 C5lZSSSd4eRVWQ1uh+Rt/+rbU9w9a4BkOBpu0sSQB1fXhkOEK5Q937RRMZ7UwzsEe7
	 J0eWRnvEhYpTsIhmtQ4lp5CHSCkA7c/Hjyh3w0AXfxSlp4nXbYSiVTKBMNWKWqpNVV
	 pYY8zEzja72aw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF6B640475;
	Mon, 29 Dec 2025 15:26:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 75748B9
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 15:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 673F180C8F
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 15:26:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zAGux7ukrihx for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 15:26:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CE2F580BFD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE2F580BFD
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CE2F580BFD
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 15:26:41 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.0.100.107]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MZCfD-1vNP783JTt-00SGHL; Mon, 29
 Dec 2025 16:26:31 +0100
Date: Mon, 29 Dec 2025 16:26:21 +0100
Message-Id: <20251229-rgbmatrix-bump-v2-0-e89d8f364991@gmx.net>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJ2dUmkC/3XMQQqDQAyF4atI1k1xggrtqvcoLqJGzcJRMioWm
 bt36r7L/8H7TghiKgGe2QkmuwadfQq6ZdCO7AdB7VID5VQ6ogptaCZeTQ9stmnB3kkpbUFF3xG
 k02LS63GB7zr1qGGd7XP5u/utf6ndYY7VoyXmihphfg3TcfeyQh1j/AIlsYVXqgAAAA==
X-Change-ID: 20251226-rgbmatrix-bump-f1e5ec424fd2
To: buildroot@buildroot.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767021991; l=1563;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=E8JocInyNCFymvkYXTyXkoANnONiOr5d85NOkRyOiVY=;
 b=APkCgeRE6MfpQ5obHyYG4p/X/7deDjzTKUJ8VpParFh5ZR7eCA0ZsKKvfZMgbLjKcO2BfcYkQ
 wMWVM9PVuCOD0QTzLWK79XwzXnJ3OHRmDcOQbEnv6CtsgxbZGPypHEY
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:fRMxLvVRuQrCZZJbVnZXkhUsC9YeVrMVYGVZESk0RvRn9i/IkI6
 CJJNeD4TEY3uKlEzuFtxy6NPm/PNv+2/eMR67parqlckhqO0+V+lmOcqaGBgiuUhR3ITUi+
 jvZu0S2b+HtaH8fOuNBuocv0w8c6heZ49YdW24J8iLmYXHOFRUyg+AZAqZ3AcP/VeVhSyJl
 7J8frRE8XouP2xrZCgreg==
UI-OutboundReport: notjunk:1;M01:P0:Ti6x8LUku6w=;sl79toklX6MJv6N4dRkM0ss015r
 YaRcq2p4sibIyBJhkYZeK4DINjBdVxQYlYy8ArVPNSAqLe7xSI5375d30NrjB6TfWIxPynKul
 AYfHN7Obm1mmm4cksdZiUbv8z9TSl/smiHweXZS+NR26jLFqwBGWtSua+7eR8JhVoe9qlI7zQ
 J2KcazW790otLLyWCaYs283w/yu4kXn1Dw6TZmLvBeABXR+8QNyNYofu43ehlO/RD0gekHl+u
 hFkTJMG9VzSAWkRFw5itF/hmnf4yx0XwNvzs6qLARPL0ayNv1I/GPfvhZg6AHg0nr1tn+a9WI
 tLya20InzcIavD26OCrlsKWTo4y9RmhUEfmcsz4azXrA8Vhw2hYGhKqQGXyBtN/c/peb0de+o
 yQosPhVh8mOPQ41cy8sWPjZ0A99TO639aOrQPRKUaEp/h1OV0u5U+hJMXJ7TETNfDJ74F3SWZ
 TdL9sQVTpo06tX0ti3g2uaxr05PI03q/ZWdoM/B7ZLuQv6dcxlmDd65TiRdCjQCJS2tQGny0e
 X1AUAI/jnZ54+1H9C5FsYH3DOgXWFaiCv3xEtwH7pt34z5FHtTXwbTFMi3OHH0swG1a1RTs75
 UmLQB/5/wI0HPAtf6umBbQGA3QlnZrvvOuQX6B6mB9bqyM6xrQfW6OSxOqFPOEjdbRJxxdRCm
 je57V8VeO0fvxzuXOl1n/I+74kmH3nkftJAJDuSzACBoNGtOa7lq/PSJQBxWWlZo7FbyfxQH4
 hSdCffGMmUc+dQjDzT29pa6Cx+WFnpzBszSncU6p462tUDFgzKIxhEK0QOiUcCyWbhVwBedtu
 csVmFRgIYW4Pg6B3YgyN8XuUbVfPh85aLlcCjoaPQoMvawX3njErcrmi+jXRzK580GwxQm7ya
 Vv9D/ABnNK87g05brY+PYauf4wtu/Xksw+ui87GtruCPuiIbbCAc3+m6jNtulwuDjMQl+LTrY
 zAUXM0YvUSrp+U1G7YkotNOFCEWrKAJVt6nkVbXeUDjaPhbAPnxCXIrU8nXfmfkVFRlpap+OJ
 EYVYp1RDKUUwPvjThOhFHkeAFjQg0oAF2z2BgYC85Zabt6WE7u++KiPVofD6z9hvwbdkyjL5j
 QoRu+ulOQ2H3/hl50ed5QsJLSNxdSQ3oOJEB0YCk03KVXQy7DKxHUazUPN9YlOfTWyHIyYVNA
 omBvc+5tus8rSDksO5OLbVRWKmPpqnr9fqU2ad+OxgSapHdffjuQgAWqSQHak1uV+yWQY8UPm
 hFK2JT38MYL5JmKS7bohSkFwBl615rATvOyinqTz3O0vN832+vFnSzskay3AdrEmE2mvDjwzk
 HwJDDkVnkHo3/lO7WkKjMQiZxVwzOWuwhcreuBNK79rvjlXOO5fQCX9I8p4dWOWfjZelDXGYv
 /krf7Hc/yqLgGIzXnApsh2smu2p9Ekwc8OWcVATP+WZc49DpUEah6r91bLEesQt0QV02u4Vwv
 8ywhdZtecQQd6XD/rYKjEa0m8aA9eRqUURHpw5ZIcjJ+FUnvRtB64J/zIz168jJKE33kORamq
 Zsn79s63+XpPIRHX1+kOnmjZS58EUc5jH1VRhamr82cEImtmjEsKGB/kwt3k1BsHGUU9OjNi2
 1tFdYdxIutXx/HV5FsCf+t0zafcpPCXB6Bp0+/y7D2KUZDF7Hy+qc2AikScpokD6YFoz60ynL
 DliYEYrI+7frDt52dyKNvbi2li/VGPmfO+DpcxCEEoPZQDmHm420uIeJzyU/aMcLPR+BIk+kx
 gVe5o1LlcV8eZdH4SAhGYIvdcjA8NQTdd5pcSHM4YKL8XiBODN6GoVj6y+KUNbe3I254OAX3Z
 CE4aL/gQi294pSKvXeAC6gtG+RhUn5yrYS6tNKWt+5ElHpXe2MBdqtw0g5VJA2wPFFoM/kCCE
 PdweqjpqKWSybJP0ibnSsktkte9dIjqvMNKs741Pdh4DwUMRu/fkogI6p+pYrjpktisVNZ6OW
 AnqyqGmSzpHFQE+xJSVE7JB/z3j3ypBixtKGIemyDs/GcTXLFwYVCDGOHN1ZO+5we8x+sHShT
 0SFAuqtQGBKRhHTo65j/7QU1AOQFcGXWPK0b0Gj4THTA5tKIDO4Pg4/RF+47j7pk1RNGEqUG7
 nruIcV5hE1/KuVbIl7GUZp3V43Ix8kA/jiYkXclkT2W5BTXWnv22QYoS1NxSBVY3hKJf5lVhs
 skrQsUAqnxTkehFgmP6RZXe2zjLFTVbiWWXJdppDAgpR6dLMiphFH1QZzGCDllho0H+AiEL0n
 YcXKBVJEa2v55YS3ltQD9lQSFTjucpOL/hBrXh+eRrDbLb8iKr5X+allsTzRIvdP0h73OBhEa
 U72wBhSBNpvG0zOELGfNTuU2hB9aeDLXPmJMcfra4XSBLA8eVdLZRI0Xu6Ip/DJwnGCXqW9yk
 7qRielYAHpR8XckSV1cWW30Chf2yaKOrLc9rIW+BcUXDJYUPCkNArDddPU69l0ZMr/HgnQfo4
 sc8pe5bzKFqgQPD+CbYmxq/conHu3fOims9VPSI+8CwPyouFBCR/IcovZ/qjG7vc4KJCmq3+/
 3nVW6K+ZTIsGWYtHlnQeMPjZT6Scq1EhKihTUoJXKKXIhgCJvlr9wt7+hYVx6Ei6pK8/StFAE
 LTw0oxQzuhO2yaI33IRYBgK5F8hOD+ZLuW9Ed5mr8euwPft1bER3L8pcO/M0GQkUaHwmGiRna
 nMlgptexgtudxnOYTfytMhW0429I8lWbouuVYALrzy8dwhfKJNF9SIpNCmMQK0xEWSdRHCHEK
 ZY/3BBRj3JGzdllxHoo0P9n4LujiDp/2ETi7+2iJEhrqWwdfT3+9gNw1NBri3QU7Xu+Rjmqp2
 DU2C0WdUTqMn4da+zGODpL+0rGmcuyh95TQS7U/iXAP/2RduDcMNM/JqTqt6dQdj/BPbyQMkX
 6/R0ZC8EsF8p3NQAg4x8QjeLZJIEVL3sywaqnAv4wkb9mhzHNFUqr3AnR8Yue1sXbStRncQf2
 4Rbwmecvy6rJvrb6TC6KMrl6vHgeOEgk2f1wMfxmrS1/9YdcOL+NBKXc97SoFWoKNYE6ODXl6
 hCGNVHY7/zaQ+u1i7GCVkmxqRD95KKLaVICQIBYMMtPLZtzcZcAgGco8v4t3MggSTb6sCi8KD
 W1LcO4IYAt/kjCMbEJeBPCWCi7DHr27cwK/PM6B6vQE/saqLdKH2mjL471mye9JCCCOGWa3Tr
 A6NsjJ84k26h/JMoy7ff6Nj8eA9JcN2+d2IBwcW17pW6p1cbWnKDLdCJAHWW+mArhyeaWd57h
 5O4HkULiwTvKweVQRnRLFe/6CBc0PiAUPey0Oswtex77s92T/wA+Vkeaq36Wx6a0iSz8auXBp
 6Qwm3CepZP/otbeeeVcfG31KRDAwvWWNpQqMvZihnftuL2dQewz3/JEhRGxKpmBVlxcMq2R0B
 MaA56ApMjuTSoO4GG1ze0kcLAG4zaAbl/iax8x1oHp0QhmQjR59p0GrqlfeP0VvAgZ89MR6qN
 A0YVgUIc5dg+5w357V4quov1ZI2xVlm667PipgbLhwelDGdhNtfq9dqm5wiQ2peq1kLB7SOwu
 sfnCEs+KIpWuJ4RnZ6DU7J/o95wNvIQT/3XiYT7EwJ0zaHB0SrjeNRTLAlBN0etJpwD7JEDFx
 Q/cenznnI+X22DNZKNfbGAWyxVMaTqsztHNpLch5FQ+XgKa3vw2U3TQx0hN2jMsFExJ54sa07
 QzepgCHsN7IheuvF85RP/6NPFl1n0izKmcnYLVNZTCIgEULxrecnwrlhCy4YLv9NffWxbWwc4
 bl+aELZTjLFSOL5ZmRnu22thcQ+Aljx1JUg4xXKm+gU9MI/Zzvh7s5LAi2d5EOuEgdvx2ny63
 qC7szHgbiSa09WGhUkkPf2WEES2pJ8cudzmT9b9VH3wb2lyrvkKFy7k6q3+bRzWgiXSLfnJS3
 vQ63namXGhWCqZy1BL9qsxCcrEBMEr9KdobO87yYMbrU8DDSwB9IPnTobAtzBUgPX2RknMrAU
 fpxR1DVkEghSPku1fxaAis5BDR4O7gZiR8+cu6rBIadT7i+/CTc4nh1wH1CG8e+/WBmZ4M//L
 L1H6jbPtOW9b4V7WipX2aOMDCu9yN1kw4diS4Z4Ae0yP1SvyF+t+p2mTJjECFfcCUxi6+10pA
 LYeyyAuyjyoSEw7+1Pv14tT+9w7v9Liw20iNVXV4zZZzuPHu/Pli82i8vxRTuzIyvOu3qQ+pq
 pT1Nb0giO5n4VRE3EcqBQSc42ArASpLzs/wccscXaVGYIuyCLS8GqAFaXa6cdMqwTL5Y5o/+k
 bZsbw+4CB4FqbJD6SbTsRw+8Te6VSfb6JpWJ3sY7/GEo0Tgl6poEjv47gACfKDXJ4BD7OiMLI
 DXlRE/t6LweX7XOonLoLKyGt8cXTgMZpxVXneppe9V8EDY3yVpK68oclVHWq6cTXY3G4k0oXI
 3d3Xh4zva5KBY6Fd7fZ77LiHVw+5y7RHb8XZalF/eS/+zh9d5r8MmjCb6yFqePPBWTeeT/1rM
 NKECJ4API++/BzOlScga+IChjYn8yuQY/v0zi+1vjk+K57GQyk5T4Jn0DkDhSB2iBLi+UwFfv
 x88VVhEHaILiJzILDOvSpGGopOLe3hC5uCZkJpk62/GVmjdbzzOm6/CmsWzqfxzQ/hzFh5NQO
 B+59Q9N2r6IYSX6dRRNDlAQZ37ugf9uW24GGhEBiItI5ctD0hekt7D+1M9hLXch5w1Cfc9EF4
 xfbbQHfa6ft4mKUtwdD6E8yimQPvicDGC84bUxXZvVSVnMYq5WD7RIJ1/fSVY8Vrbr6c8/9Bb
 rsAlqhYaxJCBVFEMJxW7hFl2dAtCA+x4fTN2d2eMvShTHb2OnCkHnJh0AU1qny/fpTg9I9QG3
 /pvVaOOUOY/nKW0Liu4DXY2f9ZPdlzCqJ1L6+5eoSfxzYo39I+vsdXoZUh1jtBO7CfoAT/fjQ
 ZBOPkjmT36DAteJ7hqtSCYdiOhf20Si9VXMGNJ3yoG0F5W/gMXf+jq7RwWKB6c4MdUF6IbM1d
 ihscA00nSZkG+8xM1EnbftYNpHw1vDt+0W+Jo04zIX94+Cu3FvqbNwyos98Ozrq6PX5+RR2Q9
 45aw+41NGwVnDy4SNYm1h7MZaBUOwLmuPeGmpGBFXI117G+0I8LTGFu/sZG5D693DPLAnYxbA
 mN0fWfC+jy2Hm0foHEKS7Dbn3RkrRD2Jr4dqRS
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1767021991; x=1767626791; i=j.neuschaefer@gmx.net;
 bh=GUnAQw91otrfl9fTBrDPwuo7AupqVTm8kHTx8gKQuNU=;
 h=X-UI-Sender-Class:From:Subject:Date:Message-Id:MIME-Version:
 Content-Type:Content-Transfer-Encoding:To:Cc:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=EE991hkVneDTEgupBcybOvE/pcipmTGSxr3X1oglvfdjA8wOA+8hT/LcjQhMLVPk
 2PoxVRNti+n6LWjHccjpgneCD2txvYKNAKjVBDg6Gh/1dkRhX6jYZJNjd2eJC8wtf
 jTsOkDs6F1whMmsPj7iZMnLsxXs81btrBzvz86HJTv97aj2QjmsqKF/Dn6UA/S+1C
 bZssmWhSMv/un1oLz38in2w/iVyASbNBkCuzVYTweNC1la8SjMQm3CW85ukTe/Ib/
 j12rVd53TcygQ0cpBWmkJxgQTFmnLJ7+c9QfF8fwQhBbNF5QPWVbkHJLSkxl1AwA8
 Bvt7NheXkFNSMAl+Jw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=EE991hkV
Subject: [Buildroot] [PATCH v2 0/2] Update package/rpi-rgb-led-matrix
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
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: Grzegorz Blach <grzegorz@blach.pl>,
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBicmluZ3MgdGhlIHJwaS1yZ2ItbGVkLW1hdHJpeCBhbmQgcHl0aG9uLXJnYm1hdHJpeCBw
YWNrYWdlcwp1cCB0byBkYXRlLiBPbmUgdGhpbmcgdGhhdCBzdGFuZHMgb3V0IGlzIHRoZSBhZGRp
dGlvbmFsIGRlcGVuZGVuY3kKb24gcHl0aG9uLXBpbGxvdydzIGxpYkltYWdpbmcgaGVhZGVycywg
d2hpY2ggcmVxdWlyZXM6CgoxLiB0aGUgcHl0aG9uLXBpbGxvdyBwYWNrYWdlIHRvIGluc3RhbGwg
dGhlIGhlYWRlcnMgc29tZXdoZXJlCjIuIHRoZSBweXRob24tcmdibWF0cml4IHBhY2thZ2UgdG8g
cGljayB0aGVtIHVwLgoKSSd2ZSBtYWRlIGFuIGF0dGVtcHQgYXQgdGhpcywgd2hpY2ggd29ya3Mg
YnV0IGRvZXNuJ3Qgc2VlbSBvcHRpbWFsLAplc3BlY2lhbGx5IHRoZSBmYWN0IHRoYXQgSSdtIGlu
c3RhbGxpbmcgdG8gJChTVEFHSU5HX0RJUikvdXNyL2luY2x1ZGUKcmF0aGVyIHRoYW4gLi4uL3B5
dGhvbiQoUFlUSE9OM19WRVJTSU9OX01BSk9SKS4gQ29tbWVudHMgYXJlIGFwcHJlY2lhdGVkLgoK
U2lnbmVkLW9mZi1ieTogSi4gTmV1c2Now6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5ldD4KLS0t
CkNoYW5nZXMgaW4gdjI6Ci0gSW1wcm92ZSBjb21taXQgbWVzc2FnZXMgdG8gaW5jbHVkZSBtb3Jl
IGluZm9ybWF0aW9uIGFib3V0IHRoZSByZWxhdGlvbgogIGJldHdlZW4gcHl0aG9uLXBpbGxvdyBh
bmQgcHl0aG9uLXJnYm1hdHJpeAotIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L3IvMjAyNTEyMjYtcmdibWF0cml4LWJ1bXAtdjEtMC02OWMyYWE2MmJlYWFAZ214Lm5ldAoKLS0t
CkouIE5ldXNjaMOkZmVyICgyKToKICAgICAgcGFja2FnZS9weXRob24tcGlsbG93OiBpbnN0YWxs
IGxpYkltYWdpbmcgaGVhZGVycwogICAgICBwYWNrYWdlL3JwaS1yZ2ItbGVkLW1hdHJpeDogdXBk
YXRlIHRvIGxhdGVzdCBnaXQgdmVyc2lvbiAoMjAyNS0xMi0yMikKCiBwYWNrYWdlL3B5dGhvbi1w
aWxsb3cvcHl0aG9uLXBpbGxvdy5tayAgICAgICAgICAgICB8IDYgKysrKysrCiBwYWNrYWdlL3B5
dGhvbi1yZ2JtYXRyaXgvQ29uZmlnLmluICAgICAgICAgICAgICAgICB8IDEgKwogcGFja2FnZS9w
eXRob24tcmdibWF0cml4L3B5dGhvbi1yZ2JtYXRyaXguaGFzaCAgICAgfCAyICstCiBwYWNrYWdl
L3B5dGhvbi1yZ2JtYXRyaXgvcHl0aG9uLXJnYm1hdHJpeC5tayAgICAgICB8IDQgKystLQogcGFj
a2FnZS9ycGktcmdiLWxlZC1tYXRyaXgvcnBpLXJnYi1sZWQtbWF0cml4Lmhhc2ggfCAyICstCiBw
YWNrYWdlL3JwaS1yZ2ItbGVkLW1hdHJpeC9ycGktcmdiLWxlZC1tYXRyaXgubWsgICB8IDIgKy0K
IDYgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKLS0tCmJh
c2UtY29tbWl0OiBiZmNhMDZiMzUwZmEzYzBhNDhhZjM4Zjg5Y2NmYzA0YzcwYzNmOTQ2CmNoYW5n
ZS1pZDogMjAyNTEyMjYtcmdibWF0cml4LWJ1bXAtZjFlNWVjNDI0ZmQyCgpCZXN0IHJlZ2FyZHMs
Ci0tIApKLiBOZXVzY2jDpGZlciA8ai5uZXVzY2hhZWZlckBnbXgubmV0PgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
