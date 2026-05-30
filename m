Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D98A0CD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 22:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA25E42FA4;
	Sat, 30 May 2026 22:00:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q53J8eZlTtnZ; Sat, 30 May 2026 22:00:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1A3242FAE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780178454;
	bh=XurW7hymD7VurfzxMd98acUzpac1qtJxwZXf3Hu8cMA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pijhrsNe/QlRALr4YI/XCW/pe0LI/FhTxASO6+6WW8MeDoAZucQFZmlO9gow4y4eJ
	 Dd6EXVuyaD+gdftNakyLPmESMs7WJtF/FumIRvf7KjXzxPGfcbkpXnCfViNVro/cc9
	 OY8JdsgZoY7SamxXYMYS1g2l1dDoh9/omW458PDpLBr6JtWsHd80nqYltvuIdB9KoD
	 hXEt44Gi8mxT5VyoOWt/LO0f9qqqdCc8coQXTkb2jHVmvdOl7bvhcAxzS9vkH0w4p4
	 rjODceTxAy68XOBU0o9c69OL4TxYKP0/ODbG6fYlnDqWiAlEAuxBHFIUdbJq7xD4hM
	 yhk3KRNneC8WQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1A3242FAE;
	Sat, 30 May 2026 22:00:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C5AFF4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 22:00:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8200A61B58
 for <buildroot@buildroot.org>; Sat, 30 May 2026 22:00:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5bcxBrsVkGBN for <buildroot@buildroot.org>;
 Sat, 30 May 2026 22:00:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7982A61B4B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7982A61B4B
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7982A61B4B
 for <buildroot@buildroot.org>; Sat, 30 May 2026 22:00:52 +0000 (UTC)
Received: from [192.168.1.80] (82-65-127-30.subs.proxad.net [82.65.127.30])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 12FDC2C83044;
 Sun, 31 May 2026 00:00:50 +0200 (CEST)
Message-ID: <be29a7bb-f97e-49a2-96ca-8a4983c155af@bubu1.eu>
Date: Sun, 31 May 2026 00:00:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alexandre Ondet <frcomdev@gmail.com>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260428172000.2671-1-frcomdev@gmail.com>
Content-Language: en-US
In-Reply-To: <20260428172000.2671-1-frcomdev@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1780178450; bh=lQ94yJcLPhYGP3xphI+ZxhsW4JqlN8HcQMtr+wsUqM0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=FJlihi1zxsYPvTzPzIkCj8mAEDwzE8WoahjukWNJnfML5g2/zWZEJKfSnDh0hIa2w
 wy33jrlFMdcp26Jw2pe5DoDAI/t4H6Q+joSR4hF3iL/SvMruGcu/HQd7xkjXDxrpt8
 e4uUI5a3tLHBRnY4FdyocXSvl57mPvgrRlw5iyBbx4Os/cmSYGErs+FCFxks7fbq0N
 8w7L9VY9efFKvZKU338Td4VlnJ2QxZG0QZMCDzpnIH/Jbcr0ASMXhcDZQ7O6tloHe7
 j5K5V3h1UOoEbKd+zkBZQLPROjoOtQJ5y5QxY10Yn6W2Iz/+9tum9UO+useTHHZrLy
 rq0lxQtlYLX0w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=FJlihi1z
Subject: Re: [Buildroot] [PATCH 06/13] package/python-nmcli: new package
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Alexandre,

some comments below.

On 4/28/26 19:20, Alexandre Ondet wrote:
> Signed-off-by: Alexandre Ondet <frcomdev@gmail.com>
> ---
>   package/Config.in                      |  1 +
>   package/python-nmcli/Config.in         |  6 ++++++
>   package/python-nmcli/python-nmcli.hash |  3 +++
>   package/python-nmcli/python-nmcli.mk   | 14 ++++++++++++++
>   4 files changed, 24 insertions(+)
>   create mode 100644 package/python-nmcli/Config.in
>   create mode 100644 package/python-nmcli/python-nmcli.hash
>   create mode 100644 package/python-nmcli/python-nmcli.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 754bdee9f4..83c9e0809c 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1261,6 +1261,7 @@ menu "External python modules"
>   	source "package/python-netifaces/Config.in"
>   	source "package/python-networkmanager/Config.in"
>   	source "package/python-networkx/Config.in"
> +	source "package/python-nmcli/Config.in"
>   	source "package/python-numpy/Config.in"
>   	source "package/python-oauthlib/Config.in"
>   	source "package/python-opcua-asyncio/Config.in"
> diff --git a/package/python-nmcli/Config.in b/package/python-nmcli/Config.in
> new file mode 100644
> index 0000000000..acdb6a1423
> --- /dev/null
> +++ b/package/python-nmcli/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_PYTHON_NMCLI
> +	bool "python-nmcli"

This should depend on BR2_PACKAGE_NETWORK_MANAGER, as it probably 
doesn't make any sense to have this package without also having 
network-manager on your device?

And then you can select BR2_PACKAGE_NETWORK_MANAGER_CLI to ensure the 
nmcli part also gets enabled automatically when you enable python-nmcli.

> +	help
> +	  Python wrapper for nmcli (NetworkManager).
> +
> +	  https://github.com/ushiboy/nmcli
> \ No newline at end of file
> diff --git a/package/python-nmcli/python-nmcli.hash b/package/python-nmcli/python-nmcli.hash
> new file mode 100644
> index 0000000000..d11842e3e8
> --- /dev/null
> +++ b/package/python-nmcli/python-nmcli.hash
> @@ -0,0 +1,3 @@
> +# From https://pypi.org/pypi/nmcli/1.7.0/json
> +sha256  4fb17b6c33d276a264a27b7109fa1d70987570536fa8852b51830f9f7732f982  nmcli-1.7.0.tar.gz
> +sha256  9dbbc4debacc85f5f5f074614cd9cadd61da09eaa19f98f6bbb5463c34133820  LICENSE.txt
> \ No newline at end of file
> diff --git a/package/python-nmcli/python-nmcli.mk b/package/python-nmcli/python-nmcli.mk
> new file mode 100644
> index 0000000000..449131974d
> --- /dev/null
> +++ b/package/python-nmcli/python-nmcli.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-nmcli
> +#
> +################################################################################
> +
> +PYTHON_NMCLI_VERSION = 1.7.0
> +PYTHON_NMCLI_SOURCE = nmcli-$(PYTHON_NMCLI_VERSION).tar.gz
> +PYTHON_NMCLI_SITE = https://files.pythonhosted.org/packages/source/n/nmcli
> +PYTHON_NMCLI_SETUP_TYPE = setuptools
> +PYTHON_NMCLI_LICENSE = MIT
> +PYTHON_NMCLI_LICENSE_FILES = LICENSE.txt
> +
> +$(eval $(python-package))
> \ No newline at end of file

Please make sure your files all have a newline at the end.

A general note for these type of packages with runtime dependencies 
(which applies to python packages in general but also for this 
specifically for the network-manager dependency): it would be really 
good to add a runtime test together with the package [1]. It helps to 
test the package when reviewing and ensures it doesn't silently break 
with some network-manager update.

I've marked this as changes requested in patchwork.


Best,
Marcus

[1] 
https://nightly.buildroot.org/manual.html#_using_the_runtime_tests_framework
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
