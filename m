Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 576F3FF8864
	for <buildroot@archiver.kernel.org>; Wed, 29 Apr 2026 08:23:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01CCA41FD6;
	Wed, 29 Apr 2026 08:23:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5kz_-pURSM0O; Wed, 29 Apr 2026 08:23:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F41741FEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777451015;
	bh=8NpC3Dv1WLrwRhlqkhxvy5ehLMAEnpt4Ri+P6Te0kYI=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=gJW4nRJMlobOEDcU55/BmzyuxpoicrLiAFBwzj/uxzUgfHrupJ/IjRnvSdj8eyu/t
	 UNnUEOn8iwLivCPzvUiWwZ8YVh/6lazJFp1I4KePn4wsAKAHKBkmZ0+gmudiW6yfCd
	 uzYHYNnrtQxQN2Ua2jl7eVEDlPwMRUC0c9kkKud/1CYSvKCtQW1tdy3Vcvaei63WJp
	 8h8Ktj1SG5Cw7NB+Nn2F56PJeuXWHWQtxu745WL2WKESUaIsco8qV4jUlH3IVx+iQQ
	 5rGqMW3S+fkp/oovrX7ifnqdxifYLgCuNihofvQq63Q3jM5NW+jlXl5xMU5+cuqXF9
	 ZOz2UxpEHID0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F41741FEC;
	Wed, 29 Apr 2026 08:23:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 63A30231
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 08:23:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4062D6135B
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 08:23:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LgTl2xUSy0uM for <buildroot@buildroot.org>;
 Wed, 29 Apr 2026 08:23:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1C24361354
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C24361354
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1C24361354
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 08:23:32 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 8DF3E2C86F14;
 Wed, 29 Apr 2026 10:23:30 +0200 (CEST)
Message-ID: <f6471f1a-c9ff-4359-8c07-e43bf3bec12a@bubu1.eu>
Date: Wed, 29 Apr 2026 10:23:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 buildroot@buildroot.org
References: <20260418073313.37718-1-chakrabortyshubham66@gmail.com>
 <20260428204536.2085875-1-chakrabortyshubham66@gmail.com>
Content-Language: en-US
In-Reply-To: <20260428204536.2085875-1-chakrabortyshubham66@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1777451010; bh=tirTHJMKiftcrnuKEDxPDsYN3bmoZ7S1lu+GeYVmZs4=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=jOS4O0bXusIaJ7BW4XJUOaohylYYFljZH7BaLh1Mm2M2JNShG2n8nN9BLQRJoG0WJ
 tjIO7IDL/OJpITdglEcHoV6g1pLCHE7tc9QlCL9tMEqsShUV32aejd4V5ALlWVtkpl
 TZTV5kErWAKOVsPyn7e/WpKiHtENX943QFSLOna8c3Um+B1QEIacTP62iqJgBnT2o/
 wxE8UumbusoWHNoY0kH1PY2SyLQqpY1+eKjz0mjhkhsvo10+WSy6FS2EPjzmEjaMIv
 gUTCsMRET8bnGtOnh4Tm9VO0gRdlbzuWvN0eFPLfOGvv0BEiHKrhtTIw4byDKYjqRF
 G9uJ44sM28ReA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=jOS4O0bX
Subject: Re: [Buildroot] [PATCH v2] package/psmisc: bump to version 23.7
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

Hi Shubham,

On 4/28/26 22:45, Shubham Chakraborty wrote:
> - Fix --disable-statx build option
> - fuser: Add stat() fallback, ignore EACCES errors
> - pstree: Fix assumption about root PID
> - killall: Output formatting fixes
> - Update gettext to 0.21
> 
> https://gitlab.com/psmisc/psmisc/-/tags/v23.7

As you are bumping the package from 23.5 -> 23.7, you should also 
include the changelog of the 23.6 release [1] in the commit description.

> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> ---
>   package/psmisc/psmisc.hash | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/package/psmisc/psmisc.hash b/package/psmisc/psmisc.hash
> index 646c01b3c6..f16b95eee3 100644
> --- a/package/psmisc/psmisc.hash
> +++ b/package/psmisc/psmisc.hash
> @@ -1,3 +1,6 @@
>   # From https://sourceforge.net/projects/psmisc/files/psmisc/
> +md5  53eae841735189a896d614cba440eb10  psmisc-23.7.tar.xz
> +sha1  89046d35a8919def79200115c9cc78e91b98ad53  psmisc-23.7.tar.xz
> +# Locally computed:

This patch does not apply. I assume it is currently based on top of your 
v1, but that is not how you should send a v2 patch. Any new version 
should contain all the previous changes.

Also it's nice to include a changelog in the new revision for what 
changed in the new revision (below a --- mark, so it's visible in the 
email but doesn't get included in the commit that gets applied).

See section "22.5.5. Patch revision changelog" in the manual[2]

 > [...]

Could you send a v3 with these changes incorporated?

Best,
Marcus

[1] https://gitlab.com/psmisc/psmisc/-/tags/v23.6
[2] https://nightly.buildroot.org/manual.html#submitting-patches

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
