Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EFA5FF5134
	for <buildroot@archiver.kernel.org>; Tue,  7 Apr 2026 19:00:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 278044021D;
	Tue,  7 Apr 2026 19:00:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4bSK_yTzLOew; Tue,  7 Apr 2026 19:00:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49B1840224
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775588400;
	bh=6u782Jhnoff1tltJD32ijufXn0dg3OWJiVERvNlijK8=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=BXdSowOCvLJPpv0CQv2Wrt4GqGPnSxzXBibC+JjMJxzDinz9COGHIlNjLdamMjtkB
	 9lQafjbLCSPXOtJPytTvtNaed7q1XPH773HEBvnucoIHWPfBVqttX/GeTQ37n/CUwk
	 silnvKW91QfNlBZW9TMOuJOeuBbmz0aMHT9VBtDrLNleJpnN+6mtghNds5qsXJMYVM
	 aI7rylgoK1aJqAzkwBGY8pfluMdrxmsl81dNhMv2fseFltan/07fzQpG0mus4fHSfX
	 EKxigmGc+wZM5RtBUwr9bzFKI3CUjt87NJBKuXhwFcbxVjWzE5Mz/QKq6kt49LFbdL
	 5cHetfOT1lgYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49B1840224;
	Tue,  7 Apr 2026 19:00:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9318C237
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 18:59:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7913760DE9
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 18:59:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zB2biufjXlc6 for <buildroot@buildroot.org>;
 Tue,  7 Apr 2026 18:59:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 619C060D9B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 619C060D9B
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 619C060D9B
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 18:59:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 410F5B97BCDA; Tue,  7 Apr 2026 20:59:56 +0200 (CEST)
Message-ID: <0a191350-d411-4247-934c-a17ddbaa3562@rnout.be>
Date: Tue, 7 Apr 2026 20:59:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Flaviu Nistor <flaviu.nistor@gmail.com>, buildroot@buildroot.org
References: <20260327064354.5892-1-flaviu.nistor@gmail.com>
 <20260327064354.5892-2-flaviu.nistor@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260327064354.5892-2-flaviu.nistor@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1775588396; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=H2yy72365XnSq8XLBiUJQQwYlhl5kxSM9/gcxUFr/hw=;
 b=O/pt/XoC7ctAy3GZ/j8fMNrDyhtfam0ZtNTCewn+BeSKJra17WkM0JOE0wHqXFRTLaF082
 fKkHMY2iOorycvNEe/o/OhGQ57fXMy61CP6F3r0YrIyxabp8iRo76PXbRgvZKPgJ6tsU3O
 BYEFEw863voLCaIc6tpShUL5H0u8U2XL6Uv8evPNv2Ufy3IdscIPReaORrz1CVWa73CmLM
 qqObWw4khpMauyfsbHSrSGy0CYpnXsc1rys/RYlFgZBOG94fWXdBhAH711AsL2HoC7IO8R
 5vDmBBZUENgXTrMOF+Kq8yNCeohzerdwOIvk+ChPchNcmrBXAVIrr18FEuA9BQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=O/pt/XoC
Subject: Re: [Buildroot] [PATCH 1/1] utils/scanpypi: workaround for pypi
 project names
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



On 27/03/2026 07:43, Flaviu Nistor wrote:
> Add a dictionary for buildroot packages that have a different
> name compared to the pypi project name (e.g. smmap2 -> smmap).
> Since it is not intended to change the buildroot package name,
> this is a workaround in order to use the scanpypi utility for
> this packages and still get correct generated files. Current
> packages added in the dictionary by this commit are smmap2 and
> gitdb2.

  Would it be an option, instead of having this mapping table, to parse the name 
out of the .mk file if it exists? So if you do scanpypi smmap2, it will check if 
package/python-smmap2/python-smmap2.mk exists, and if yes read the _SOURCE to 
find the upstream name.

  Regards,
  Arnout

> 
> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
> ---
>   utils/scanpypi | 18 +++++++++++++++---
>   1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/utils/scanpypi b/utils/scanpypi
> index 61879e39d4..09899bfe0e 100755
> --- a/utils/scanpypi
> +++ b/utils/scanpypi
> @@ -189,6 +189,14 @@ class BuildrootPackage():
>       create_config_in
>   
>       """
> +
> +    # Dictionary of python package names to their actual PyPI project names
> +    # Used when a package's buildroot name differs from its PyPI name
> +    PYPI_NAME_MAPPINGS = {
> +        'smmap2': 'smmap',
> +        'gitdb2': 'gitdb',
> +    }
> +
>       setup_args = {}
>   
>       def __init__(self, real_name, pkg_folder):
> @@ -216,8 +224,12 @@ class BuildrootPackage():
>           """
>           Fetch a package's metadata from the python package index
>           """
> +
> +        # Check if there's a PyPI name in the dictionary for this package
> +        pypi_name = self.PYPI_NAME_MAPPINGS.get(self.real_name, self.real_name)
> +
>           self.metadata_url = 'https://pypi.org/pypi/{pkg}/json'.format(
> -            pkg=self.real_name)
> +            pkg=pypi_name)
>           try:
>               pkg_json = urllib.request.urlopen(self.metadata_url).read().decode()
>           except urllib.error.HTTPError as error:
> @@ -225,13 +237,13 @@ class BuildrootPackage():
>               print('ERROR: Could not find package {pkg}.\n'
>                     'Check syntax inside the python package index:\n'
>                     'https://pypi.python.org/pypi/ '
> -                  .format(pkg=self.real_name))
> +                  .format(pkg=pypi_name))
>               raise
>           except urllib.error.URLError:
>               print('ERROR: Could not find package {pkg}.\n'
>                     'Check syntax inside the python package index:\n'
>                     'https://pypi.python.org/pypi/ '
> -                  .format(pkg=self.real_name))
> +                  .format(pkg=pypi_name))
>               raise
>           self.metadata = json.loads(pkg_json)
>           self.version = self.metadata['info']['version']

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
