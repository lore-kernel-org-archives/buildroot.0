Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 694C5D59F6F
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 20:19:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2155960AA1;
	Wed,  6 Nov 2024 20:19:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id boW2EECpIoFK; Wed,  6 Nov 2024 20:19:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B6CE60A81
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B6CE60A81;
	Wed,  6 Nov 2024 20:19:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 92BCB3B
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 20:19:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 73F85813D9
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 20:19:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id msLx4yrcuh-c for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 20:19:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E6ABA813D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6ABA813D8
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E6ABA813D8
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 20:18:59 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.112.161]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MRCOE-1tVp9J0xcq-00K07v; Wed, 06
 Nov 2024 21:18:57 +0100
Message-ID: <012ea8d0-873b-49e8-bf4f-6277a32b053b@gmx.de>
Date: Wed, 6 Nov 2024 21:18:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20241105164350.1380330-1-james.hilliard1@gmail.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20241105164350.1380330-1-james.hilliard1@gmail.com>
X-Provags-ID: V03:K1:/GYHL/pRXfcCAv+oj/B8wsUHmugZ147qeRKu9rAeHR0rdue167k
 IOy8b8aiPvtqDnZA4KBVwYQw/bJANsoJuKjE8sCnzliGg4JgWYH1KExJA/bz8ZeIEdLB3gq
 IVGJZ4BpDFMlgEXR57q4UA79rsPYHcgDUZh3eGo+i2KD9Cxx8brkRDBHlM9BM5Yh2XOo5i0
 HcBnVwwogttsAzwLPp1zg==
UI-OutboundReport: notjunk:1;M01:P0:SjxAhIwS1DY=;QS8cQagoyAfK7V0lC/bngFmg1Nn
 cRzz/9a0yYOwC1OgZ8zV1B94rUzATFOPXKRa5+bEDKb/0h9U1PLU51pYar2/EXxiCLZ6joAKp
 nSbCUSIiUR7ldnqV/3SksEzkvS6ark+JHB1EcnaTldewxHHFO0RlpYuOqewQS3g6gC+2Jk8eQ
 poha70Dt/8jE673dhlGuQozcJDghqgWZztZ6hDa+8g6bI6AJP2pLkb/DbmxOiMdNkRboA/Uqa
 xDKNe2FaS6QG03twemxkrDK1mPreOqvhcyt4/d2xC/9hZl9A1AHv2/ij0BB2s7eT2M7Lm3D0y
 ha9JZWETG03me3/EOK3VicAmhh3wOiU8DLktpTO+rMBYcZykjvPozJ6Az5UCgsuq+ImOCkWek
 CHHCb3BJBjBbZfaPTOQdKdx9Gi0yyYpwKXIHE8TAOKfF7HDTbUpW+7vH6jtMUx/+Coy8m7OpQ
 G3DMdee1sIJxEQ7XegmWTsRj5bAtRDLiyVtmHJny+zUfsv8zfeqT6qlYMCf2ZkPzvVLMDWxJB
 Vh8GavpjZSmNx5LIDDnqjwMMGE54dHrhBk52zS/qrebRSA9tHSrCokw+vRNrbUI+czfZB4pZn
 LjOZbrmo23eGrvVKGKrQlHQhSQOF8kKhYLp61kmv1Sb2RKyNlty3vU6tppN6bnRf/Bi946I2M
 f7GejD36GrWLuOEV/sBPyhPJfYx/bqErXsfVMoo9ELRxUXl3n4X8LZx2A80ml7kz6e8PJQK+d
 nASvk7grzSY8lLLmw9BVvuGu69/PksTUZXxSkE0eR036cQ9EKp351+UoeoN1E5gmbswAiMG0A
 IcIuEIyXHB/LeKDenViJJmsw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1730924337; x=1731529137; i=fiona.klute@gmx.de;
 bh=h4l78vcC9WWSZ+L4jLtGnhqksl/+fRHtBY+Yj/EGaEQ=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=gk2IbA6pMQle/xQwgYb8UGBBOaIp3Wrg0ZL0k4RdG8uj1bylvMC0/xa0/BzthLwa
 2Vl/yUCKzBH1IoZR9L/5NVvgTx3U4S7kRy6rghkdqAEAXutgRTkzHcYoXX5nXu0S6
 7evnlKXMltuA6UxjGq2EQ4bYblEC7sYyd8iQy55XIUqrhVPgUQLnXM3TWB2hAJhhl
 93XqztdExk8USl4vzXCxT3TbeT0q9EfR7/OqiHj0vhP/KdDayh5Bgx1SsicPWNsHy
 NoYxtUkD8n+nKlSgtckADHLAMhRRbQlmzQGitbGx9LjBQqv85+DV8zj6Py8U7SOkR
 LI8W/llHztDtUrBhVQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=gk2IbA6p
Subject: Re: [Buildroot] [PATCH 1/1]
 package/python-poetry-dynamic-versioning: use poetry setup type
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 05.11.24 um 17:43 schrieb James Hilliard:
> Use the new poetry setup type which automatically pulls in the
> host-python-poetry-core dependency.
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Tested-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Reviewed-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

Thank you!

> ---
>   .../python-poetry-dynamic-versioning.mk                       | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/python-poetry-dynamic-versioning/python-poetry-dynamic-versioning.mk b/package/python-poetry-dynamic-versioning/python-poetry-dynamic-versioning.mk
> index 31567380ef..e159e80324 100644
> --- a/package/python-poetry-dynamic-versioning/python-poetry-dynamic-versioning.mk
> +++ b/package/python-poetry-dynamic-versioning/python-poetry-dynamic-versioning.mk
> @@ -7,10 +7,10 @@
>   PYTHON_POETRY_DYNAMIC_VERSIONING_VERSION = 1.4.1
>   PYTHON_POETRY_DYNAMIC_VERSIONING_SOURCE = poetry_dynamic_versioning-$(PYTHON_POETRY_DYNAMIC_VERSIONING_VERSION).tar.gz
>   PYTHON_POETRY_DYNAMIC_VERSIONING_SITE = https://files.pythonhosted.org/packages/dd/70/1138211a6e5051d28596922ed39acf20b42819db5ae1f93e465b9a903c28
> -PYTHON_POETRY_DYNAMIC_VERSIONING_SETUP_TYPE = pep517
> +PYTHON_POETRY_DYNAMIC_VERSIONING_SETUP_TYPE = poetry
>   PYTHON_POETRY_DYNAMIC_VERSIONING_LICENSE = MIT
>   PYTHON_POETRY_DYNAMIC_VERSIONING_LICENSE_FILES = LICENSE
> -HOST_PYTHON_POETRY_DYNAMIC_VERSIONING_DEPENDENCIES = host-python-poetry-core \
> +HOST_PYTHON_POETRY_DYNAMIC_VERSIONING_DEPENDENCIES = \
>   	host-python-dunamai \
>   	host-python-jinja2 \
>   	host-python-tomlkit

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
