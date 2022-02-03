Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFE1C433EF
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 23:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA88860E41;
	Thu,  3 Feb 2022 23:43:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h9UMv8rLiDlZ; Thu,  3 Feb 2022 23:43:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D7A660B47;
	Thu,  3 Feb 2022 23:43:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 13DE41BF2F3
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 23:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 023D6840AB
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 23:43:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WGAYS8uILqIS for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 23:43:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5DF3840AA
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 23:43:05 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id FlklnP3xb0FuyFlkmnQoQj; Fri, 04 Feb 2022 00:43:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643931784; bh=6n9CT2xQSP7roF9ZeDPBLLdA6UO8ojCz1kI+sowUZ9s=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=NgN2bD8/ambjS3NUZff8AmXasKvas8xFj1rg8Hy7/t9OnivHFACiacvCewtu7Q655
 ktPIF3P83rN7KK9o6BP0s186iEbbns3sm/06Tlx2OFGMN0HhJB1RmbcWTcda4l27UT
 16o5h9oKUeRw9f5nAqdPJ/0aeFk5HJyX2faYujpY1NRsKFtIMbkH8Pg6zo5TvRpfaO
 OIND/x/1BorD92Xnj+G+T7adAecq1cNEcA3WKZHWn04UyDHbuJoNTdEwsKM06hDOsl
 kCHoKzdQ6qOe53FNoAnBw6mcARBnW+d0OXBZLUsHbmM3FR/QL4kslJKosdDtDqhFFl
 FmCVmO3l8e59A==
Message-ID: <34acab3f-35d5-8130-34a6-dc528eda09b5@benettiengineering.com>
Date: Fri, 4 Feb 2022 00:43:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220203223615.729285-1-fontaine.fabrice@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220203223615.729285-1-fontaine.fabrice@gmail.com>
X-CMAE-Envelope: MS4wfFbdSZcy6/i5dByYqsqaSa0g0f7MJUHSmPUV5PRZSdnLVJQOVIAp+qOQHYuacgIL8n338suQUM2y61sgvA2eoABOkW4a6fEATn3tFmKAXNIsFAU4oSM2
 ef6amdy/+79b/oe+rGPeoH2Qcm3gr8fe4oPKSCPomr7VzwWv4GZwjMOA2xvwSyROoy1lRaSa3JBw/PnjEEnmaX9sDfd3EzSWIMhTL4D3ddS4jty/9fms6Ht/
 t73GSqIlucmKX3vDsokfyYGVHgOnSTEBqU57NUwijkGcoLf54X4e39jX1GBUQG7m
Subject: Re: [Buildroot] [PATCH 1/1] package/trace-cmd: use snapshot tarball
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Pierre Floury <pierre.floury@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fabrice,

On 03/02/22 23:36, Fabrice Fontaine wrote:
> Use snapshot tarball so TRACE_CMD_VERSION will match what is returned by
> https://release-monitoring.org
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Thank you!

Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> ---
>   package/trace-cmd/trace-cmd.hash | 2 +-
>   package/trace-cmd/trace-cmd.mk   | 7 ++++---
>   2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/package/trace-cmd/trace-cmd.hash b/package/trace-cmd/trace-cmd.hash
> index 1f34a0da60..00cecc7828 100644
> --- a/package/trace-cmd/trace-cmd.hash
> +++ b/package/trace-cmd/trace-cmd.hash
> @@ -1,5 +1,5 @@
>   # Locally computed
> -sha256  9401a43bda4837dfde5e64e0dbe5d3918bf50eb86b4d23fa89713b0f2defcbc1  trace-cmd-trace-cmd-v2.9.6-br1.tar.gz
> +sha256  45924a763376a700221f64b4034f87263e4038ec88b120a0abfb5743d051d068  trace-cmd-v2.9.6.tar.gz
>   sha256  b1d04b850c1c7471b0f0896f6c6f0fcfc9f07e2dd183a5f5826af269fe9e88fb  COPYING
>   sha256  70f297763149e72306919c924e164f83041d5e512868d4c8c1826c171b3e49f9  COPYING.LIB
>   sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/GPL-2.0
> diff --git a/package/trace-cmd/trace-cmd.mk b/package/trace-cmd/trace-cmd.mk
> index a592b1f027..d9ed417f20 100644
> --- a/package/trace-cmd/trace-cmd.mk
> +++ b/package/trace-cmd/trace-cmd.mk
> @@ -4,9 +4,10 @@
>   #
>   ################################################################################
>   
> -TRACE_CMD_VERSION = trace-cmd-v2.9.6
> -TRACE_CMD_SITE = https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git
> -TRACE_CMD_SITE_METHOD = git
> +TRACE_CMD_VERSION = 2.9.6
> +TRACE_CMD_SOURCE = trace-cmd-v$(TRACE_CMD_VERSION).tar.gz
> +TRACE_CMD_SITE = \
> +	https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git/snapshot
>   TRACE_CMD_LICENSE = GPL-2.0, LGPL-2.1
>   TRACE_CMD_LICENSE_FILES = COPYING COPYING.LIB LICENSES/GPL-2.0 LICENSES/LGPL-2.1
>   

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
