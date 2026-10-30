Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839A5606A320
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=HlqkFP71
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5425F8195C;
	Fri, 30 Oct 2026 15:29:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xfmbYf0SEGeG; Fri, 30 Oct 2026 15:29:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 74DBD81959
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374163;
	b=L92VXSvw0sCYl5ioHCN9udQ6+RxBQHhgSziD/zPo9xp53azAuiCsGsEAGTlyjy+GSMsd
	 PlQFG80RzSJTc5O82q9wM5nUiEmlJiX7gUEsNquQlHxwYCiX5L/JXkYWA8bEXetpZbDFA
	 jZM3i8Ip69+xnU3pDeRMe07IeuZcIynYce0mNoLg0gUZXTLr28cbffsfrGOPZc3Lv2Ut8
	 X42qv/VMR0Hijs/hl37cEsROuICyV/HDCdErkF7fq7hFARCpvqqFhdx4EPPEN5pMSuL7f
	 N0DpQQ8QzlTpNE0qsgxVUofqA0zZaMrmGDVl882JIw7wQgV1jtXM8GZDCic7quxIrqw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374163;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=he6fBONj8+MHU5wf2g7CeJUjWO1JwPzPw5PAWpq2RiM=;
	b=oJ/a8KSWXEq8MD+DWJqAi9YwrzxQEIX0sqZolj4L/BUcVSnsjowzOVB0UpQNvLZWP1Ug
	 d8LlC5hw/kqBZbk14jpG26Z/N9D8dyb84hY4OP6O4WTy0BRYOxtiFCy/CZrvWQ429y95j
	 41F/+7NZKFZm/ekvqFqdTblT7VzYEolKHrAJz8oXV8ocMb+CHmEg+oLL3YzCiegb4STDR
	 jhvPcMsAoSLHTWPap2STlT1F0Jjrwfspjk/aIDLMZcACjCCKP3Tfpslb7YJSkMskFxtYa
	 /1luuK/V63Q8UmhDA/qdXj9MhSwEhOJwJKbghq2zGovX5iprDxl1+a0umvIFm6DEifA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374163;
	bh=he6fBONj8+MHU5wf2g7CeJUjWO1JwPzPw5PAWpq2RiM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HlqkFP71miaqMyc/RYb76nV6L+B1+F2rR1QdWrRnRjlOE5XBJSDKGN2OA7GFDFbGF
	 bhBsTJyXepITJW6Ol/7qWId4PtIxrWbdQim1xFH1L9LbIkYkJt34QyK6PZRWKJiK24
	 TDAWZRq//seMkQZNHUWZWT+6jndL3iGC1lRu3t/paFA/ehXjY1taXsMKQTOQDSft9K
	 QmhMxRHoBTQMFg86LFnMDaxyXpZ+qT02dWG022TYO8srdMOixzjJpNMCZsii/hhN5V
	 23XJlI8esaTe2M37VGla48Dl77JaDIXljJIi1XCEZKNHvWNeRX/u49BgKN1FWcirxO
	 h6FEn7zzBbk8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74DBD81959;
	Fri, 30 Oct 2026 15:29:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E533D38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5211340530
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VBfPYiknlcfi for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:28:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 29BD040211
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374115;
 b=lqjclTLF1rT8cNJNygjTQLQUg4ACz1UL5g42JdUcsy6ASfc3nLzcDPHagtSgkC9W2sy6
 hPjy8frsZz5afu4BYZ8UGqk7Tty9dpTlOrzxodiWPxS7vP2tYSKsUjK7uex9JdBofA6s/
 poyg5Bi0Pp4rtiQrntZZrOiIkXDEDX8qhF4OqZ5zhmer7/v9jht5IsuY1je3a1NPsVJcU
 UBqdrnPlpyRKeCnReHIatQPRCxmXF04YSWOjQ9NK2hyA70B+n6nm5l2tn9O6tg5bNM4cY
 cHjcWRNCCH1m/SbSM1GMXm2VFbYiH0yYGhZLkXScZOgLJDpa+7Uc2yfBMabzya1qRAA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374115;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=R7g9XiqZIJOf0F2y5pC9oitB9WMdCgqph+iYqNx7w58=;
 b=o3shB83Mg8RUL3h7nYMuKErycpC5B4VMy4YHK7CoFzqnSBbmCFEmjA+76xz24IGCILhU
 kOhmHeaOiVrjYeB8/OiZrm86gq8nTvpWLjLATi44rECeKVaYLsalWfuv9lpCHLQzGNhBn
 a2O5Cl7dQ45usLRRPcS9ZnjodVuwAcAX8dFVXxQiKs4C3kSkBHevQ/kyIesqw8+jmmHEn
 6kgxHLdXRzxTgycU3dxivWuR1FMofvwrBJBr1zDRD29GT++1jYhD+KbhJHk0x4A7seYuv
 zhh5PxwlT4tQPie7qPQjLmhzZ5cbV9N2V49Sg5yWj6OdN1lj42f9TTsTKGUIFHDQT0g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=VbCnmUVb; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::331"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 29BD040211
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:33 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4a35db1f202so8418875e9.3
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:28:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374111; x=1793978911;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=R7g9XiqZIJOf0F2y5pC9oitB9WMdCgqph+iYqNx7w58=;
 b=FCQPQ7h+opXPHKVTc3YxaXNK2RJppznKadqsHLs6QLUslYEHbDCur1+Hocl/RWvS2N
 D3Tziu2KW7lDQ0HwcFBUpAiYtAbZ+IMOK85we0hXmhJMpInHXaywKbzY6jbTMuZG3QLQ
 PAuhwfxg7qW2fm/jWozQEeWSTbSI1f/28JcJ3p63UYIjWNkxaOta2k2dyE+Z+ZW0j9Gh
 wLXCj2WTD8qvWXlBet5U1EIHKmF6ictpz7Kn5f0vw27GTOnNQoTe5A4WD+CDlUQwJwLc
 KOWxj1LQ8V3uWzgSgtyVgvLviHW71wNMb88k4bjpJ1dmw0rxAo0WqLIU0k8dt9LZIJjQ
 iH2g==
X-Gm-Message-State: AFq9FYJR5zgdiw9xpEFXxsDlA8c3MK9lG+MAr1lWGQzpt4QfPbTuyTFL
 zXe6F3+Ptl0i+UmlQOqrBVbBg7r1aS9vZ9iDQOc8dgjIv9MwkNx+/oP51++Ztoi5h1Kr4xfmIyP
 TrxxuX0E=
X-Gm-Gg: AYBFou32zbwJ20Iq6NlTBP/iNFpV1Zfs1fyfSCm639lhvWEkzVD78+X3r3Bnl86bEYP
 E/8wfvoX3Hwp3xZLeN7dkfZBsB6Wz7S2ClPKrnbbyKrKVOVPkLWJKAUN0BIBnxOEiZ/BgkN6qmk
 iuA7Ph0fzgoj734JZ1Pn8bKoXWRlmJMsKF/p6C/cI35Di7l5rcosVUWS1sPNEY0BwqWrYat9ChO
 B52XBX8vWw8NoEqsq7JiXf72KJoQW7+efqEzoxj4dWKmtS+koFVpVcWR4b5VeBgnMqISkMoPSfI
 YC2OHodnNXq+fvcynNe7GqL8bHSku2EeR9ND50yW3JkjvgoFrrdbfOFR6JG++4VY1Odt0C26D6V
 TRLoypmkSQvYaZ/q0WTWlny7JlWiln/l/WZMTWAYIsnH6/PAz1hyEzZzLIg7jUMoWQetEy1Ylzm
 DoPiQNTjmnDzs8cB/QFWtBd3Y6OPARoeUiSq3ommMlB0Tj26d0NDW3YyN+HISb3SfbbxqPdbCWp
 S3E0JbqnM2Xaqq3FrnsPtqtRjsEbdHPfJvy5viHtd9Ua+Qpp9KGfgrAvdZ4N/5NEGkkiOp9A1lq
 4P2r4t8XskbO3uHyMhXP9WJ8Q3MUc/W5eZBpFCkq+SHsINpCfSrApiKQryP8tVgmLEOuC/XdIH7
 1+8bhHVMLoWMpRxhGUQ==
X-Received: by 2002:a05:600c:198e:b0:4a0:2488:71cc with SMTP id
 5b1f17b1804b1-4ac1932a23fmr59028215e9.32.1793374111332; 
 Fri, 30 Oct 2026 08:28:31 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4abea72254csm36063035e9.1.2026.10.30.08.28.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:28:31 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:28:28 +0100
Message-ID: <20261030152830.1907364-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261022211716.1449715-1-bernd@kuhls.net>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pip: security bump
 version to 26.2.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> https://discuss.python.org/t/information-for-python-users-regarding-emudhra-emsign-ca-certificate-security-incident/109576/3
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/python-pip/python-pip.hash | 4 ++--
>  package/python-pip/python-pip.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-pip/python-pip.hash b/package/python-pip/python-pip.hash
> index 427cd14ddc..445953d08c 100644
> --- a/package/python-pip/python-pip.hash
> +++ b/package/python-pip/python-pip.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/pip/json
> -md5  f7e8dc36dcc6cdba3bf5c426ad076902  pip-26.2.1.tar.gz
> -sha256  f6ad667e89a1fe78046c8f13232b247200f5258d7828f3f7883d660878e0813f  pip-26.2.1.tar.gz
> +md5  399f3e6053dd52028d2b60384332cea9  pip-26.2.2.tar.gz
> +sha256  3a8e5c800492787f33a4114ef54444546c340df428974ebba17e0fd47e11af2f  pip-26.2.2.tar.gz
>  # Locally computed sha256 checksums
>  sha256  634300a669d49aeae65b12c6c48c924c51a4cdf3d1ff086dc3456dc8bcaa2104  LICENSE.txt
> diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
> index 74c789e097..a2efaf4918 100644
> --- a/package/python-pip/python-pip.mk
> +++ b/package/python-pip/python-pip.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_PIP_VERSION = 26.2.1
> +PYTHON_PIP_VERSION = 26.2.2
>  PYTHON_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
> -PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/ae/15/4500e320e6b101ec3b719ae85b697d9940b6cda672bc555bd6016fc60c6f
> +PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/fa/e8/0842d757e483e895e670f655084cfe8b8c72580c6769a76b30b2789a0608
>  PYTHON_PIP_SETUP_TYPE = flit
>  PYTHON_PIP_LICENSE = MIT
>  PYTHON_PIP_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
