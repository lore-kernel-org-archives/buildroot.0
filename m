Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A9ECC5B543
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 18:27:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0F5040BD8;
	Wed,  4 Jun 2025 18:27:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mdLnMcMLNnoP; Wed,  4 Jun 2025 18:27:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 069DD40833
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 069DD40833;
	Wed,  4 Jun 2025 18:27:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E8BF1A6
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:27:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7529260E51
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:27:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VvnQeexhfT08 for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 18:27:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CB6EC60C06
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB6EC60C06
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CB6EC60C06
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:27:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1C9C11C0198; Wed,  4 Jun 2025 20:27:03 +0200 (CEST)
Message-ID: <a0ecd58e-3a0a-46ad-ae16-c11cc61940cf@rnout.be>
Date: Wed, 4 Jun 2025 20:27:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org
References: <20250522094822.58859-1-buildroot@bubu1.eu>
 <20250522094822.58859-2-buildroot@bubu1.eu>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250522094822.58859-2-buildroot@bubu1.eu>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749061623; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=bfCqBOScsDee+CArrqYXSlPj0GcTifJP4wriqJHvyzQ=;
 b=HbHo3cndkSA7cfBRkaqF4TVvn5VwdiPW6Pb750zS4nEDYRY7asrc2jHf+rnZf79Xje98Dd
 SgmRwjAnmmuejzkibRWxUt6CV+DwdxYYjD8GLdQwODfMKdpvUccqFnfm936anLGw6TXPGs
 uz19pXbYjI3mJpyWnh4yJS6WxJCcoV1dMEboSTM6JEwnMs836sgcBzxMEdkDBgHuao3MQq
 XJH5wOPao0JvdBkIWPvGjzsUMmBku6BDvcPdw/jMpqKNSXYb8dob6TjNG+xwVKmGtVjTQC
 /FuOuhNqIKB1xafrrCVTWZPVKmxlax9OaZbN/0omWP8nirdUtB1haxDuNpsG3w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=HbHo3cnd
Subject: Re: [Buildroot] [PATCH 2/2] DEVELOPERS: add Marcus Hoffmann for
 python-django
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/05/2025 11:48, Marcus Hoffmann via buildroot wrote:
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   DEVELOPERS | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 78bb555530..d471b9ab6f 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2278,6 +2278,7 @@ N:	Marcus Hoffmann <bubu@bubu1.eu>
>   F:	package/nethogs/
>   F:	package/pico-sdk/
>   F:	package/picotool/
> +F:	package/python-django/
>   F:	package/python-immutabledict/
>   F:	package/python-jc/
>   F:	package/python-pydantic/
> @@ -2287,12 +2288,14 @@ F:	package/python-ruamel-yaml-clib/
>   F:	package/python-typing-inspection/
>   F:	package/python-tzlocal/
>   F:	package/python-waitress/
> +F:	support/testing/tests/package/test_python_django.py
>   F:	support/testing/tests/package/test_python_fastapi.py
>   F:	support/testing/tests/package/test_python_pydantic.py
>   F:	support/testing/tests/package/test_python_pydantic_settings.py
>   F:	support/testing/tests/package/test_python_ruamel_yaml.py
>   F:	support/testing/tests/package/test_python_tzlocal.py
>   F:	support/testing/tests/package/test_python_waitress.py
> +F:	support/testing/tests/package/sample_python_django.py
>   F:	support/testing/tests/package/sample_python_fastapi.py
>   F:	support/testing/tests/package/sample_python_pydantic.py
>   F:	support/testing/tests/package/sample_python_pydantic_settings.py

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
