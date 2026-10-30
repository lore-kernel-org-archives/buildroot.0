Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96634606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 20:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=I5gM68F0
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95AB28114E;
	Fri, 30 Oct 2026 20:50:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IWvOr9v3CV5k; Fri, 30 Oct 2026 20:50:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4FA6681187
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793393454;
	b=hZ+qUDLe8ebxFEzxEOsKPPCKlAylwVXasXP6k+7A/fpHV+iPbb3RMzuWW5MbtOXYuQ/f
	 TdRNxS5m4VnbQcrQvrTubPXFLMbkFF34mq9vR2Cm7HaGs2ompojACPLsEkv0PnS9I4FAG
	 6Vi6yqCuYqLeueTJ8D3uB51CnHCaHHEyuxC8rrKxOmT+nfcR2c/S1mB4fL6lmSc+cxq38
	 PLQ5wiNOrgWHxE162fF/UH2nGd/yaU3q1g9SnyQ/XrZHvRqEsrNhHeGjvZVdeJyq7gP21
	 bKDxEY3IjqOmNVHe4hVUETolJ9RpT0j3eSHFtZu2/xbmOrC9Onp4zleMWnAMmJQ3G3g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793393454;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=SU9TizPvMAXXtZlqGO0OLOsxqe7xof6x9Kksn3hgpVQ=;
	b=BaQKq8d1WRugVn/ydQxr21bs1BOss3W/1paHDQZJe7m+PGn0/8s8KFibjjJoKzQOpmdA
	 gNvTv9G9F3DYl/bQULL89QWypUAY/sDgEILU16RTGv0uN1gpo5r4rVm3To5+kEtWW42XC
	 qdIXUnYt2cGkvugoRU4ury6xBNFwlA3NvHUdGHfYxWpHv5lFQhWVGMfKN91Zv1embF9An
	 28po0uAQnF56UOv+5YrKyDK7H66Zd1AA+aoRp6ElNHLYOj8d5JdujTyUR+VogO1Xuvj0J
	 5XEnblcYOAnj+kU67iHlGyh3ql+SD6ESwXIjq6Slftxo/f+3kLzDjeZp9wK9T51+4NQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793393454;
	bh=SU9TizPvMAXXtZlqGO0OLOsxqe7xof6x9Kksn3hgpVQ=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=I5gM68F0td/w9y1C63f9A/2ip4+ah3cQCWW8fLM7NoZhILQQUbK9KFaIOv+5XgNZU
	 U7a9+48ljg3mzXaiq+Hccc4dOadGKvDaQ3OPHI+YfoLW2g2SOjEfP6ZfvOMgL+K9jm
	 Lu2P1eTvJyAHmqqYe0CmbKtuDCAC91QfAsWrPYTDEz2VfLKhILiTkKvulfBd/sbQ+J
	 okeiaqTikdMckNfUwysZd8DSvV37y98FtO42+XVG0qKdAhEsItCHMO0z4r4xDpPtbC
	 ZkgmPhSq8tw5ZQvcHA0RRSsc5rc1u2MqGi7xO+PdakVGa+yV6SG+icUkxlT8aJicaC
	 c274bJB38kObQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FA6681187;
	Fri, 30 Oct 2026 20:50:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 01BCE4BC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 20:50:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB7B781163
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 20:50:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oe59UaEjQ7Ik for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 20:50:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3C1678114E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793393451;
 b=RhExOAGlccZcJgnXHMu4AUiOGE072j4ab0zJ8DnScnljHrjgPDZ+/+cs5MFmPq/WlO8g
 19VAKKTLp/S50OQuQtUWeh1cuQoaXjZRRmSpO3bg0c/wLhQ14OefBJfQHM9x1UhNgT58/
 8Ip7cSutHM7rHwzDY6rUoATi4am6JHjYsJGtqeI1V9COZmJzq3/K3rXt1P24bTgde0wyg
 R5GcXQZEJuLSSYUK7DOWWBPp8O321iIsMzernresbUO+Y+CUqTwVHyyDpGJaFJ/TbqGqk
 LHzNyiEZ+3XT4SxGrOKnfjkFaykvN11oZioxOPq2rZwZaLH6ocdDB4hztG3tAGPzXkA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793393451;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=1wq2BvoDgjfeTEj8C9Ya8khGHlOzBYLr22NrKSv5sgQ=;
 b=PbwwJE2t2UjG4Ob6pIwKm2fS6PBqWB5ddNQY+LpBtgIsRVKrCryG03XHCC9WQf905k7f
 CY/F2iMN4acOYDvac2zrjxPMTG2FfWk1VkVBbaJH0gpf9W1n75k+v1kzhf52XIMJa673K
 CelWYjxnVhpevK0lCpO7A5KnXNyDeYjirO2S7BIW6oF4No0HQZV2BbJdsRzB3z3ZE/mk4
 G2uPruShA8Xi9AVUHCapuhHhWB8NXsqHXAkUTrNtTnFjjbOvUSMpn9x4dzk7KRzRL4bNt
 IxFldiHcfPAcgO3cEu6VbldyWovrR9w2hGATEYivWnNsflZzlo/FGhjmgPVhXiHxPXg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b="GmN/VcO9"; 
 arc=none smtp.remote-ip=212.227.17.20
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3C1678114E
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 20:50:50 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MLQxX-1x5dYY1xxL-00TVPf; Fri, 30
 Oct 2026 21:50:41 +0100
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Fri, 30 Oct 2026 21:50:31 +0100
Message-ID: <20261030205033.839644-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:a8OYn57hTnoipwlB9EVZkG7nB1Y3canhS+73WIyP9sTRW84mgzy
 irVsIsRzAZgK+pN52hmx6l+d2DFX3B3lRNM8gqGudq21OrS3AXpfesLKX0uaQCdgKijIlRw
 XFe+RiknhWFvVVm2qxO85QFhXjDniM6o8ot4UMLIAfhEjF6zSnldKNmuJk/N6aQFGdjAM4z
 jTRrL8rkoiirkAfjabeVg==
UI-OutboundReport: notjunk:1;M01:P0:CBzeuLlzsR8=;TQR8PO6mT+FUObvW36kyXbgWqee
 vHcJfq40yGhhpKFNJDhfQ6zwO95MkszL5NKu/qlLy9y8+sfdm278qD1625V2fc4jchH0V24b/
 2JjvlAmpmIrCmtMFPPjL65NfbcZAnkW6XZltXfkVdpYktbDOBxd9DAbPX7iTbGljLQyDBcB4y
 1eoUmrbgF2jolUTO9eNx2S2Wf4hIAvg2054Q6OhBVBACY07BSnk7afngpwVPCTX6jGiaOjo4g
 KQvXSLKamCHRxq4rxQUwNrDZaiKL3pDcKVZ4ManPpW4lWTTda4x/oNYL5py5A7ERlAoXfA9G+
 2BjKG4dEkZCLH7XW0y4IQEggVNLnzrZ8GlvvaHHOdiwyqgj/Ciu89bE/VJ0XqMS4VyZENXKlJ
 CbsPQAwQrQAaIOt92EC6tHulNNsgcK0qlInt45ME9zbe0NizrDhrDOqANTYJw92w+aF56q5gi
 0QEMQjGtp4Aglm4JMmxfR3r0voqGEbO35mNiS0p1C/5WAjJVB80+peioHFw7oDKEmcqbRwLtz
 LuOa3HOC5S8R+dGGanj8RpSU9i/yhRx0xWIhi8X4qg0ZxyVnZDwYMAyz6AD09fcwC7RmaM3Au
 ydaSzWGMP2hQMwzEf40Ju9EN7nzLBLf+8yiHRD33c6yIjliX0ZeqFEPHt7wnBoyICoY1QUoP3
 XbFTKrk67dUgz3QFm0xknb+fwqdHjaqz1IsO94if9OYC5sbyeo9Cf7uoyI0E53CBxCOiufi13
 fP+nhYLP+/ib7cWLoQoCEuP5BtHCfbR7+5+h3jWzXoarBbCVhE2ZrxjewAMe4g0hTcCGHeveK
 TQPQ+0kuMfcQuFbGDeI08B4RQ8YQgFVsbVy5kCvf4oZADgwQ9yLBG6+9vmmf9gWLrNj2/u216
 Fmnyjg/3HEuEPISym9zCozPb2cZwfk46pV+KyVA8h1oKcu8QAZ9b38c6w+JryL+DE2U0A6zpz
 QMi3x3O80ORLPc2szftOOLDF3m9uqn+ZgwRSBQLTFs74qki4BlRUvaKSkHBNAHEIz8CWlcGE8
 WRKL0Hb9+jIZGCgkYuTB2hiG3gps4jcKMVJP2quyTk2AspiDV3oDx8FtkgOipvmhhpyL2dizc
 1I5/OhaJroAtDysZIsa26WURYUEGj+5SJnzeww+agIds9fXrJHdQHaBd8HnhOG+e8hST9PLoG
 oJywYh3pwjDODnmD9AEuc3tNOWSfeiR40aypHUVp8BdB51ytzJ6qIxT93n/C6C+wuxGIgCuE0
 7NDGv0ZesHDkhIMtd10Wn6RR67W53a3GvOPJVGSoaGrUDWSv+seUDSlp3cRQJvzXAuPvBqNze
 i1DffOMG8qxiWAEtdTLjYV8QS6nt4RHZnZa0GoJkioo9U0xg9eDliy0tuejxj0h+UcwmFTtQX
 1oSxsigIQdCARi7xGSAxZbTHLkZ8931DjcyqEjaMc+YZlbxmIVTcinm32zRVdAdOwVB5XSM6Z
 fp5KJ18r+PhHJWAqzoyqUxmBrrGuaa5k8X2VxgZCuOhuCTYtv51b0Jr9nlsopeo5Iyo3X7ze6
 j7wo6RLXF3J+cUi3nYDFKeo/WQXunLDSk1/sf5np66oV52HTUWtLG+MPLM1MzeeNop/p5Je+e
 dgvfr+rDREZ3LHvVDGrtH3GPdR1MB4hudnNWE8IclbTMDjOw5ic0AfSvgRf1bvEQqQS+xTh9L
 ltvGZwTwhOp0aeZTW/TbCq95zysajo8EY/BsDNnrP1GB1juCHuadGQ/U9sMV9owGW+OgDNHWr
 ALHlI3/AbIpiHsh1go8w6hLov/FJ+Sb+YFsguOOTT/n8N0WSaok/v/HvpEUqB8fmQmxQqocCO
 vDY9rmi3rMvKoGlm/34gaH5zGFToZtsdRJxBP5WmFbKfWDYzkqO6wyS1/eFP9Z4eQe7T/OsFj
 uEtmeliBVIN3lOWbcuEW6Ga7UduXcdPfOtw4zjz964IKfoqsB8Az85LQbigg/Iw1KRA4+5+fW
 fxQWa4pzEcoEF1G5JflBBSKPWscV/umWjARn8EquooWvjtpItjZPNlNyof3rseYcrKb+tSiMM
 c5dmFOra2uMd0gm70sRmmKmDOs0vErydOoqLA/zlShJSle4Hc4tnENsJN/VKoWo2viVxFjzG/
 MeW4V/ZFKgscV/PNH3tz8SGSsJYA/brH9B8UYTZ2jDId7082m4Ux/23MJ9OglYcujMeQuxi8V
 69542kIyjvFkSmE94XAwjNJ0NHbOBS/e6eb8u7gieLO+/5LPNBZgYPnUkVbXPJeYvsWJSLwcA
 sO/fO6pz0nLSLDtKiN2WmGaf41l6lEr45RDfRc+zwzGbtp8fWdWXowEM9Ltnj0Mhyq8QJgdKM
 VBNpkxSsDkAF3Xn4dqszUJJPc84lC0zZZD03YSVC3pk41PfZUVwcrX5CZbFjU64TszgGGSBZX
 WwlDpKqZUhSuto8Pn1QZ8/wPIZGlCoN/qMY8u8/WdpyBkmb0fCM9Q6XJXQL4OXybn8oGjY1tz
 zsA0OHmDv4RVQn2TX+tHBjWBz6nFomNu1lTqSEbZ3cIFLdLJS5G3+jFx3WWh2/v3GoEplgNgv
 AWt819XejpZ6cAU/QCK/4XkVwwXMqIt5zJxE1hPIyBI0U8pgQlVuV9f/PVRk6iigkW6LByQw1
 5zQLiFxgAfxv7dVQ8KZ6nq4otLJdtW3IL50KL4TiHjGsmKLDL815pIe9PVXEIPA8JUleqTVD/
 E6xpABg4Pih9628vNgrov/oS7IRzrLiQ8c+guWV2iZ3IncRTcMjORTyd0HkvFDVsI0jn+qOCO
 Lrf8D061x2iLB/t9+sGjYTqVCh4ZB+b+DFdvn0xzZOBTq9rjU5a2Oys0hf3ZCVsECB++bIBpL
 Q6/QYyo0voDwmNxQjwGpUPm30cVtH5z8Dzcx/XDvvP6w2hH2G56+yD8N/774zBw7/UL6KFiwk
 UhmJyymu7yR8s8nmsC5KqQIx+LEAnhvWYY9cBnRP/71Uu0mJ/GM+QsrkE5FEd1T4EYGNC42hf
 quWf3FQYrBkcwOoStuyOHm0r6ZVaBqZJ1LtjtWrMvjqjGXMMM5SFkpT8YE8Cu4ymwRX06IlmO
 OlPy6PLPw5I4+oQnC1OEBXX+XlJZ3sn0upMNeSuD3hLU/+pJ5hxyQoXAarhyZhKsepjOoxXty
 r4BLbKCr7z4X7SI/iVUz0JX/M0iUaWUXX422ZLsgbRKSy/piQVVIDeKXv2YZ153cZM6QVuE7+
 QtTqL4tCV0M3DM0oXO6K7eV+zeunBsBlxtCzSKTS5ZZZeTCAooObdcs/lYXR3bzIuD2J3MWOb
 WLihJqqvZygtQidbMwtNuANeqEIWOKVOU9/0zGro5seW1Tnt+yuSVIpoY8sLS6iP1O7I7Kn9I
 7JrL1vx8uGQ0O1gaj3C9Kx/wQ51q16PsqAASvuBNKTFLAP90+y4m7xz7U7sW6Umihype/2wXR
 +nyVQGjqejAo13dITsHVJIUrQx/KZkQFwqVVutqugUP0IjL8cjJoagR9DD8Gcz/EkFGXcFlTz
 QpBnao8DRsrEqYw/A9YEXEnID49SOBhg5I3lRZMKm4byww1saqdYgdjmYfJNdeHBebBIpFazF
 Lb5SfhtcwQ64GhAPqpENvFUzcbAQxLvHsTf4V4hWZXrqpaXGujj43iEtlR6S+EISrLzOzlLns
 bOrqWAvhGbckTZNwUosmAKzrakAYfGYkZxn4gyUDp6qA+oaYu9lCawJSpL7yGTVn6Jw38fe64
 dspDt3h9O4Rko/kWZJ+Eilt5+VCe0JiFhOM55UC7r8wQvj7Yi2U3BvZKYOmT4ApnLJdaRK0sz
 qBrQ768d1FhXW2hfDt4XSsYAm6zbFjNet1siANepiW1/eqMJbkimJNHvQPj+7K8TsUKuCwWyF
 SUHWVQ3L/M9NNA4MbeMSF1wK+zZZB9muyEbJqhmP8izAGqVtkGeHbNeja82zMu+uNQ1TX06K7
 DHvJZqiikKFzcIGXFjzzik/dGPs/vJdcyssqQVImXtzHIQ2hO8tEcXFgNFuHtIC8OOLHeg+ok
 RfJ4xSmXxy27KFyXIgla8Evjs9FiRtj5x6azXk6WL2t9pGfwXODiHMT6R6oPrsJr9o2GTVNvM
 M/j1IgLAcqQyAgKxyzGYOyG6cTYDTsuzqKURk+qNNmk/qwDxB/hWhlq3iw5nDVc9tYHmz4BKJ
 UQ6mcynmJix8rdCF/7znT+SJ1D5VHEHP9sc02fTpHQiYQ4fCfxNp3V5j2BM24bjhRb8ilkNB9
 fIBQya6w0NF+kDfn+QBSVuJJw2rtCvNKqiAx29nNF+ZyqVg2qRxGw+e2jNeNwG7gcrCSkjV79
 HZRA9G3YAuueVv/2iV1kLrcrqVSRAg0+AW8NHphcGKLL5ynDUYni7JGHKen8xBiRNKKyl6bM3
 TkQcFBIzEf2sqcLF86Rvl0O7al3JgIp1RgSCStRhvk0ct8lF7EHIoLX2A3UGC5OT4VNkOmsiS
 RUjXKeCnhNTptu2g2FhHgy1qUh1quDBwwXXTYiNytWVjdu3SaeTSWIlmC6JdyOOlePrllxLwh
 9mku8zQ/YOv9AT0b+2+O8LrUtQUrUfIAmeJseGna6patwBTmiZHDQUpv/O9bkpmW0SqZQJ4hW
 NSnKuqzgrlZ5SamJOVLdEVLrXdCzr/lCGG9VXFuU9nTeQkmnrYXVu1gDPQGj1NbaNHoGbNy0w
 pxVK1fm/UZ41t80HyNehhb8J4HiUGqdWzPqdiawQPeCAEYFYoXl2B9fj6OtAEjmMZgvOaBhjU
 9wQYuHEqFuGoMnVFTOlR4KoKozYBpMMyJga+c/pOAw7ap6aODfu85jT9fHNKD68H2EQLQNPZO
 dQzoBCPHN/P+7pGGUHrtHamFzmyfeMht9jlUqgppF3+Q3/ED6nvtkOmIuVPqqy/SbodoQDF9a
 RSO3gFXmT1AYetZqU+/ldAJqVMkq5azsnrJR3p21ueON5NmsvPYpaR1n4eNjvMsJPdfjvWTB+
 UEWcijZt5jgRe6whAmscoduWPI1c99vBcAGtR6WtCDdOvAaAkrzuLCFXJupIhF0eyJJb4RDKU
 pM21oYWK7A7ATLc8iDxJFof/uP/HLiAttKL9fiYn8ePcf4mxPV1bgi4V9n3OlY+qheuS/6jpa
 IV5iiiEx455CvS9SQInekZflL0+Z8dqB5y5I41JNK8iIrIMUhzodzpZcJaqhMsa3doIPyXnXC
 Jq31HdE5zar38PvRlcgZJVpyJtguK/r8t8VFZIyz95FiP6BfY2C1fTDe9aoftkRAoDImyijiS
 aY/VZRvA/ER5lu9VfM9UZNGGs9zmhkEtjW1wC/0YowV5UPekB2ZLtVv2gkWD95AK/uTH844Kd
 Vu83Bz80k9VN0BUPQdVnPMCH5gzDmxdpUt1LduAPARGKnHgK9WVEc4rCJ2/BI72JTZxVzkabE
 8cyMuJbIs4OlZOhV3kF9Yovhn6VgJ1x6LXo87ttcR6ZunrK4RaigEhdDreUyK8d8HwMWzdNhf
 tb2sMTIqTM0Nplnznz72iO+VCMPnm/GtZrjOyF+JKW5M0vv7qwlVnGRf/uycNZZdNPbIGwDdS
 8qi949bqjqtq2vGSquUG7vIYItkJamskM7L2rObroS9RWz2OOGb2nuGKx43Z5JynksOQBb4iB
 TEI2Tjmb08fp5eSNuL8ATj7oc3ZoTh0Q5imbmSXf9ZFHhfFlQIXv4NwYdNpECSvANzw9FYLXm
 D01JZpXMLjGJEhegyiWvB8PXcjv+eBXs9U5aR9znJX11JbJMXY5AcD0THq+h/vvRQk7jOnV19
 iF4Z/z21IJxeC/vD5va+ImVhZnbc4DkQvn+cBe8o1b0VQac44WPsEIRzEm7NOkMAOl+wu96Pz
 VVk35dyUh4bXGzMRm2Jw8JzqSj5YqCy8W7w55Z5hio8NE0N1TJm0ty7ioUmxw7vEmWvLSmTI7
 uJiMSzkCLe54C+vq+A+8xQ9M6sL9me8+BfjMn9U+w6eq3bvz9j7frN5y3KlN+SL+G9gnT75Gc
 bzqeJm7SrHrDtpJcLT8OeNeBfNL/xid9lJIZuKx2RDiViFJZEkPRNQhH0HDqTTZL65etWpI6X
 mL3PZP0MFp0q0lCEv4F20ElbJa/OjL8gKHoJnAe1xW0S6uATNVnxUACbYkkQ9AevBTeofSFpb
 lIO9Vvfvq98xXyXvxSYqXBKK5jDUVNXprfNJZYjb0ZNd1Oj923SO0QtvsL3E5xddBlc1GBH2N
 h8UtI6jutv/Si+uHPOovMroT85JjzKOliOyOQmjBF6bN0PStPeFUaoD2VFaDMtA0RwTlu5c7q
 QnK2imy1+1EZxYwhw+psJwC9t8ygzZKpLHAbdpNSmEt3e/voM6cssp0yNMe0ixZMvFtdj2yHJ
 v2rK0yaLCH7ihsQybLVc71eM+EZP38tOigSbzQOueU6U9FBfC5IPp562QghYRPLuaJFFEWvnE
 2KgWeuVl8y68lU0OPaA9t88BvpeLlPIEkNuVx9qxEPr7jZPHPNWoicGganFUy/bARY9DEa5H0
 QezMwIFMr0a0W6IBeFM1JKehHjMiz2rhrhc6JnDWEPFapQuHC7OsW1/ouC1MVcjCf2oxGtAdw
 dhibfpkOgTz0Zzbyq2+gi1X1PB/CkjF1e5c38bBpZjBHOeYHCOU39TAIaqu79pruLmskdVIDf
 QAFNFSyIYzLlWvC2Pvv8WiTiB7YZxaP/eabdAUnwW/KWfj6jk3Z0CvLc96K5LHT0JPfOLfv7b
 hYMJANgiPj3SRWTIpNQwBQp0VPpmfNYOihLt2slIcsujIVs/Sd7xoy5FbROxP/aelc3Zx3d/J
 qpZo9FZpnp4fr2ss1a3qGV6AMKGEiJOFdruKibNOU6T6umzuFp3eOkxY8hVFzTtq3F2JuPhML
 1Tk0F0UiAv42TcC/OtyvdfHnqHE+1jolT2/6OAAUYRBj5puYnv6IpZn/yphei0zhv/vYBIF7h
 Qgno3KuAFsymeyM6LYyiRo6HZJBo4sBQWghAmYmKJQ1NvPo5Y68VXONwtwo4mRP/PbJ5HVWVX
 jUOQIMnbgiArfYXz/esLH/0MLvrFjYnrs1etyy8+7IcNwgOGdl2LghtXvwn/NrYkuIIEK
Subject: [Buildroot] [PATCH v3 1/3] package/systemd/systemd-libudev: new
 bootstrap subpackage
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

Some packages that may be in the dependency chain of systemd
(depending on configuration) depend on libudev, at least for optional
features. An example is lvm2: It needs libudev to synchronize with
udev events, and to allow using udev's built-in "blkid"
implementation, instead of calling "blkid -o udev", which Busybox's
blkid does not support.

However, lvm2 is a dependency of cryptsetup (because it provides
libdevmapper), and cryptsetup is a dependency of systemd if enabled,
creating a loop if the virtual libudev package is provided by the main
systemd package.

Create a bootstrap package for systemd-libudev, which installs only
libudev, its development header, and pkgconf file to staging, so
packages that need libudev can be built before systemd. The libudev
installed to the target is still provided by the main systemd package.

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
NOTE: This series is based on the "Update systemd to current stable" series:
https://patchwork.buildroot.org/project/buildroot/list/?series=1658
That is, it assumes systemd v262 for options and dependencies.

Changes v2 -> v3:
* rebase on "Update systemd to current stable" series
* mention udev synchronization in commit message

Changes v1 -> v2:
* set SYSTEMD_LIBUDEV_DL_SUBDIR = systemd to avoid duplicate downloads

 package/systemd/Config.in                     |   7 +-
 package/systemd/systemd-libudev/Config.in     |  19 ++
 .../systemd-libudev/systemd-libudev.hash      |   1 +
 .../systemd-libudev/systemd-libudev.mk        | 197 ++++++++++++++++++
 package/systemd/systemd.mk                    |  11 +-
 5 files changed, 228 insertions(+), 7 deletions(-)
 create mode 100644 package/systemd/systemd-libudev/Config.in
 create mode 120000 package/systemd/systemd-libudev/systemd-libudev.hash
 create mode 100644 package/systemd/systemd-libudev/systemd-libudev.mk

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 7f3958aed8..781802c9fa 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -26,8 +26,8 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	depends on BR2_HOST_GCC_AT_LEAST_8 # host-systemd
 	select BR2_ROOTFS_MERGED_USR
 	select BR2_ROOTFS_MERGED_BIN
-	select BR2_PACKAGE_HAS_LIBUDEV
 	select BR2_PACKAGE_HAS_UDEV
+	select BR2_PACKAGE_SYSTEMD_LIBUDEV # bootstrap subpackage
 	select BR2_PACKAGE_DBUS if !BR2_PACKAGE_DBUS_BROKER # runtime
 	select BR2_PACKAGE_LIBXCRYPT
 	select BR2_PACKAGE_UTIL_LINUX
@@ -107,9 +107,6 @@ menuconfig BR2_PACKAGE_SYSTEMD
 
 if BR2_PACKAGE_SYSTEMD
 
-config BR2_PACKAGE_PROVIDES_LIBUDEV
-	default "systemd"
-
 config BR2_PACKAGE_PROVIDES_UDEV
 	default "systemd"
 
@@ -635,3 +632,5 @@ config BR2_PACKAGE_SYSTEMD_VMSPAWN
 	  https://www.freedesktop.org/software/systemd/man/systemd-vmspawn.html
 
 endif
+
+source "package/systemd/systemd-libudev/Config.in"
diff --git a/package/systemd/systemd-libudev/Config.in b/package/systemd/systemd-libudev/Config.in
new file mode 100644
index 0000000000..6fcd1ab46a
--- /dev/null
+++ b/package/systemd/systemd-libudev/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_SYSTEMD_LIBUDEV
+	bool
+	depends on BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_TOOLCHAIN_HAS_SSP
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8
+	select BR2_PACKAGE_HAS_LIBUDEV
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
+
+if BR2_PACKAGE_SYSTEMD_LIBUDEV
+
+config BR2_PACKAGE_PROVIDES_LIBUDEV
+	default "systemd-libudev"
+
+endif
diff --git a/package/systemd/systemd-libudev/systemd-libudev.hash b/package/systemd/systemd-libudev/systemd-libudev.hash
new file mode 120000
index 0000000000..c5f620b916
--- /dev/null
+++ b/package/systemd/systemd-libudev/systemd-libudev.hash
@@ -0,0 +1 @@
+../systemd.hash
\ No newline at end of file
diff --git a/package/systemd/systemd-libudev/systemd-libudev.mk b/package/systemd/systemd-libudev/systemd-libudev.mk
new file mode 100644
index 0000000000..ee41d977c8
--- /dev/null
+++ b/package/systemd/systemd-libudev/systemd-libudev.mk
@@ -0,0 +1,197 @@
+################################################################################
+#
+# systemd-libudev
+#
+################################################################################
+
+# Some packages that may be in the dependency tree of systemd
+# (e.g. lvm2, via cryptsetup) need libudev to build. This package
+# installs libudev only to STAGING_DIR to break the dependency loop.
+SYSTEMD_LIBUDEV_VERSION = $(SYSTEMD_VERSION)
+SYSTEMD_LIBUDEV_SOURCE = $(SYSTEMD_SOURCE)
+SYSTEMD_LIBUDEV_SITE = $(SYSTEMD_SITE)
+SYSTEMD_LIBUDEV_DL_SUBDIR = systemd
+SYSTEMD_LIBUDEV_LICENSE = $(SYSTEMD_LICENSE)
+SYSTEMD_LIBUDEV_LICENSE_FILES = $(SYSTEMD_LICENSE_FILES)
+SYSTEMD_LIBUDEV_INSTALL_STAGING = YES
+SYSTEMD_LIBUDEV_INSTALL_TARGET = NO
+SYSTEMD_LIBUDEV_DEPENDENCIES = \
+	$(BR2_COREUTILS_HOST_DEPENDENCY) \
+	host-gperf \
+	host-python-jinja2 \
+	util-linux-libs \
+	$(TARGET_NLS_DEPENDENCIES)
+SYSTEMD_LIBUDEV_PROVIDES = libudev
+SYSTEMD_LIBUDEV_CFLAGS = $(SYSTEMD_CFLAGS)
+
+# Disable everything that can be disabled, we only need libudev.
+SYSTEMD_LIBUDEV_CONF_OPTS = \
+	-Dacl=disabled \
+	-Dadm-group=false \
+	-Danalyze=false \
+	-Dapparmor=disabled \
+	-Daudit=disabled \
+	-Dbacklight=false \
+	-Dbinfmt=false \
+	-Dblkid=enabled \
+	-Dbootloader=disabled \
+	-Dbpf-framework=disabled \
+	-Dbuild-static=false \
+	-Dbzip2=disabled \
+	-Dcompat-sysv-interfaces=false \
+	-Dcoredump=false \
+	-Dcreate-log-dirs=false \
+	-Ddbus-interfaces-dir=no \
+	-Ddbus=disabled \
+	-Ddefault-compression='auto' \
+	-Ddefault-dns-over-tls=no \
+	-Ddefault-dnssec=no \
+	-Ddefault-locale='C.UTF-8' \
+	-Ddefault-user-shell=/bin/sh \
+	-Ddlopen-tests=false \
+	-Ddns-over-tls=false \
+	-Defi=false \
+	-Delfutils=disabled \
+	-Denvironment-d=false \
+	-Dfallback-default-target=graphical.target \
+	-Dfdisk=disabled \
+	-Dfirst-boot-full-preset=false \
+	-Dfirstboot=false \
+	-Dfuzz-tests=false \
+	-Dgcrypt=disabled \
+	-Dglib=disabled \
+	-Dgnutls=disabled \
+	-Dgshadow=false \
+	-Dhibernate=false \
+	-Dhomed=disabled \
+	-Dhostname-wordlist=false \
+	-Dhostnamed=false \
+	-Dhtml=disabled \
+	-Dhwdb=false \
+	-Didn=false \
+	-Dima=false \
+	-Dimds=disabled \
+	-Dimportd=disabled \
+	-Dinitrd=false \
+	-Dinstall-tests=false \
+	-Dipe=false \
+	-Dkernel-install=false \
+	-Dkexec-path=/usr/sbin/kexec \
+	-Dkmod-path=/usr/bin/kmod \
+	-Dldconfig=false \
+	-Dlibarchive=disabled \
+	-Dlibc=glibc \
+	-Dlibcrypt=disabled \
+	-Dlibcryptsetup-plugins=disabled \
+	-Dlibcryptsetup=disabled \
+	-Dlibcurl=disabled \
+	-Dlibfido2=disabled \
+	-Dlibidn2=disabled \
+	-Dlibmount=enabled \
+	-Dloadkeys-path=/usr/bin/loadkeys \
+	-Dlocaled=false \
+	-Dlog-message-verification=disabled \
+	-Dlogind=false \
+	-Dlz4=disabled \
+	-Dmachined=false \
+	-Dman=disabled \
+	-Dmicrohttpd=disabled \
+	-Dmode=release \
+	-Dmount-path=/usr/bin/mount \
+	-Dmountfsd=false \
+	-Dnetworkd=false \
+	-Dnologin-path=/bin/false \
+	-Dnspawn=disabled \
+	-Dnsresourced=false \
+	-Dnss-myhostname=false \
+	-Dnss-mymachines=disabled \
+	-Dnss-resolve=disabled \
+	-Dnss-systemd=false \
+	-Doomd=false \
+	-Dopenssl=disabled \
+	-Dp11kit=disabled \
+	-Dpam=disabled \
+	-Dpasswdqc=disabled \
+	-Dpcre2=disabled \
+	-Dpolkit=disabled \
+	-Dportabled=false \
+	-Dpstore=false \
+	-Dpwquality=disabled \
+	-Dqrencode=disabled \
+	-Dquotacheck=false \
+	-Drandomseed=false \
+	-Dremote=disabled \
+	-Drepart=disabled \
+	-Dresolve=false \
+	-Drfkill=false \
+	-Dseccomp=disabled \
+	-Dselinux=disabled \
+	-Dsetfont-path=/usr/bin/setfont \
+	-Dsmack=false \
+	-Dsplit-bin=true \
+	-Dstandalone-binaries= \
+	-Dstoragetm=false \
+	-Dsulogin-path=/usr/sbin/sulogin \
+	-Dsysext=false \
+	-Dsysinstall=false \
+	-Dsystem-gid-max=999 \
+	-Dsystem-uid-max=999 \
+	-Dsystemd-multicall-binary=false \
+	-Dsysupdate=disabled \
+	-Dsysupdated=disabled \
+	-Dsysusers=false \
+	-Dtests=false \
+	-Dtimedated=false \
+	-Dtimesyncd=false \
+	-Dtmpfiles=false \
+	-Dtpm2=disabled \
+	-Dtpm=false \
+	-Dukify=disabled \
+	-Dumount-path=/usr/bin/umount \
+	-Durlify=false \
+	-Duserdb=false \
+	-Dutmp=false \
+	-Dvar-log-mode=0755 \
+	-Dvconsole=false \
+	-Dvcs-tag=false \
+	-Dvmlinux-h=disabled \
+	-Dvmspawn=disabled \
+	-Dwheel-group=false \
+	-Dxdg-autostart=false \
+	-Dxenctrl=disabled \
+	-Dxkbcommon=disabled \
+	-Dxz=disabled \
+	-Dzlib=disabled \
+	-Dzstd=disabled
+
+ifneq ($(SYSTEMD_FALLBACK_HOSTNAME),)
+SYSTEMD_LIBUDEV_CONF_OPTS += -Dfallback-hostname=$(SYSTEMD_FALLBACK_HOSTNAME)
+endif
+
+ifeq ($(BR2_PACKAGE_ACL),y)
+SYSTEMD_LIBUDEV_DEPENDENCIES += acl
+SYSTEMD_LIBUDEV_CONF_OPTS += -Dacl=enabled
+else
+SYSTEMD_LIBUDEV_CONF_OPTS += -Dacl=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_KMOD),y)
+SYSTEMD_LIBUDEV_DEPENDENCIES += kmod
+SYSTEMD_LIBUDEV_CONF_OPTS += -Dkmod=enabled
+else
+SYSTEMD_LIBUDEV_CONF_OPTS += -Dkmod=disabled
+endif
+
+# Build only libudev, libudev.pc is not part of the pre-defined
+# target.
+SYSTEMD_LIBUDEV_NINJA_OPTS = libudev src/libudev/libudev.pc
+
+define SYSTEMD_LIBUDEV_INSTALL_STAGING_CMDS
+	$(HOST_MAKE_ENV) DESTDIR=$(STAGING_DIR) $(HOST_DIR)/bin/meson install -C $(@D)/buildroot-build --no-rebuild --tags libudev
+	$(INSTALL) -m 0644 -D $(@D)/src/libudev/libudev.h \
+		$(STAGING_DIR)/usr/include/libudev.h
+	$(INSTALL) -m 0644 -D $(@D)/buildroot-build/src/libudev/libudev.pc \
+		$(STAGING_DIR)/usr/lib/pkgconfig/libudev.pc
+endef
+
+$(eval $(meson-package))
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index a1ce0b6f26..d7f3097bf7 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -10,8 +10,10 @@
 # - If yes, propagate the dependencies to BR2_INIT_SYSTEMD
 # - If the required kernel options have changed, update the Config.in
 #   help text and the list of KCONFIG_ENABLE_OPT.
-# - Check if there are new meson_options. Make sure all options are set
-#   explicitly (usually to default value).
+# - Check if there are new meson_options. Make sure all options are
+#   set explicitly (usually to default value). Same in
+#   package/systemd/systemd-libudev, except options not needed for
+#   libudev should be disabled.
 # - If there are new services:
 #   - create new options for them (if they really are optional);
 #   - create a new _USER if necessary;
@@ -57,11 +59,12 @@ SYSTEMD_DEPENDENCIES = \
 	kmod \
 	libxcrypt \
 	util-linux-libs \
+	systemd-libudev \
 	$(TARGET_NLS_DEPENDENCIES)
 
 SYSTEMD_SELINUX_MODULES = systemd udev xdg
 
-SYSTEMD_PROVIDES = libudev udev
+SYSTEMD_PROVIDES = udev
 
 SYSTEMD_CONF_OPTS = \
 	-Dagetty-path=/usr/bin/agetty \
@@ -1066,3 +1069,5 @@ HOST_SYSTEMD_POST_INSTALL_HOOKS += HOST_SYSTEMD_FIX_RPATH
 
 $(eval $(meson-package))
 $(eval $(host-meson-package))
+
+include package/systemd/systemd-libudev/systemd-libudev.mk
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
