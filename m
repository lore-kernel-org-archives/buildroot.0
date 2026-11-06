Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBDA606A32E
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gElO/QvR
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E487881756;
	Fri,  6 Nov 2026 21:26:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Go17uUbDQZyu; Fri,  6 Nov 2026 21:26:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 03FAB81753
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794000381;
	b=UkNyHbC92htocLAhG7ED8emFxSn0XHV+ys1iR6idqnBJkCtAiswAEoZDfAixuQB0EhEs
	 Am5u+aPdu3RC/ukjUmpghFhLC/mgi4N3Zyg70AudgHx/VUaeKTtxCPz9YicDiKjuoBRuZ
	 iyltHPESQWolv1MXL4lAOzKrcP2nQlkPLdmzF9aFjDJl2oY4pG61thmAQ8qn1m8wzJGEg
	 SEzLTzlPqnIU5D7wy6FHEoYVx3WClGX/5GhlLYYVfM5Z/eT8NCCzVGIC+fJZCZqTgBT78
	 QT01cSP0NGL0iUDDIeUSg2xqiUDdXEQsAQYPFtGW6wpw+qLxdGf6PFOkEy3vgXPqp9g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794000381;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=F+CLBfkdkpNi/W3c5mplp9y9KDgtbSPdZ6rZoForVRQ=;
	b=FgS6ZV70gTY/c6vpGVCGZ0oNBUQtKTiPi+jOIRXbwEe+QcYHyznlMVpxxzLqZHj9Lla6
	 AFYyk6idXKrjeVC1T7Hztb3WCIhVbv5oOrNvhotiSLCDwaaVjxKTR2fTM4JxA4jbzNvX7
	 91nDk5cIG/6iC4rBIsi4bnz86gxWYb+rX1sv22pDQlAq3RFZ8uA6l57hNc0TlZBV1riF7
	 1rPyZ4BG2+FCR57fozm77DNIRdUe7CDD86RHR2gXzHO14HulN9NazgK/EyeFrGilaLp3R
	 BpfpMdIKXx45iom4maXsymzYD0UeXKoMXpI96DXmHK+7GJDFNU1WmoK51Du4FguCLdg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794000381;
	bh=F+CLBfkdkpNi/W3c5mplp9y9KDgtbSPdZ6rZoForVRQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gElO/QvR2qZ+CMChNsjw5cOBPI+IFqDiWowJXJ/6lYUFM3RKVz6jROmRXfzabKEHh
	 q4UA/apIQN7CCyj5GGJyTlCv/j4A4tWPhAlI+u9Uz8bIzSZa/8TKgJ6EdifTlFnhU4
	 brBb2/5Kbv084hK6OdyKAfShecA4vqjiUkgt4t0Uua8t0LKVk2zwUe3511EAVIJHjY
	 8q3+LaiMdThJTiKGsf81C/3GIgZ5Q1KVdoibbdmq62s0gPT+I3bY6LeGTzkH50Tkvh
	 ek/Ftgi3hE3XdszljsIpCzI1Wqhho9yXpy9zVVTn+2qyVMEsopkxYMqFjFGVylZxlH
	 Ci8xWb+DwJqtQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03FAB81753;
	Fri,  6 Nov 2026 21:26:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7773D31F
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:26:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A7CB4069A
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:26:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0xGCnaAykwi0 for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:26:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A7CA340699
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A7CA340699
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:26:18 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 63B9AB0051B;
 Fri,  6 Nov 2026 22:26:13 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 06 Nov 2026 22:26:13 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 06 Nov 2026 22:26:13 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Davide Viti <zinosat@gmail.com>, =?UTF-8?Q?F?=
 =?UTF-8?Q?l=C3=A1vio_Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
In-Reply-To: <20261106191536.2120153-18-james.hilliard1@gmail.com>
References: <20261106191536.2120153-18-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <21d670b1549361ce4ff3b3195c67e8bc@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-paho-mqtt: bump to version
 2.2.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi James,

Thanks for the patch.

On 06/11/2026 20:14, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-paho-mqtt/python-paho-mqtt.hash | 2 +-
>  package/python-paho-mqtt/python-paho-mqtt.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
[...]
> diff --git a/package/python-paho-mqtt/python-paho-mqtt.mk 
> b/package/python-paho-mqtt/python-paho-mqtt.mk
> index 5e1d2fe32d..8857517ea2 100644
> --- a/package/python-paho-mqtt/python-paho-mqtt.mk
> +++ b/package/python-paho-mqtt/python-paho-mqtt.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_PAHO_MQTT_VERSION = 2.1.0
> +PYTHON_PAHO_MQTT_VERSION = 2.2.0

With this new version, running the runtime test with:

utils/docker-run support/testing/run-tests \
     -k -d dl -o output_folder \
     tests.package.test_python_paho_mqtt

fails with error:

AssertionError: 'Client is not connected. Socket: None). L[44 
chars]CTED' != 'Hello, World!'
- Client is not connected. Socket: None). Last known Connection State: 
MQTT_CS_DISCONNECTED
+ Hello, World!

Could you have a look, please?

>  PYTHON_PAHO_MQTT_SITE = $(call 
> github,eclipse,paho.mqtt.python,v$(PYTHON_PAHO_MQTT_VERSION))
>  # LICENSE.txt, EDLv1.0 is a BSD-3-Clause license
>  PYTHON_PAHO_MQTT_LICENSE = EPL-2.0 or BSD-3-Clause
> --
> 2.53.0

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
