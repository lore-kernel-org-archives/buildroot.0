Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89554C25B76
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 07:25:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 945EA60741;
	Mon,  3 Jun 2024 07:25:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CgnbsrgcfGWs; Mon,  3 Jun 2024 07:25:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FEDF60631
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FEDF60631;
	Mon,  3 Jun 2024 07:25:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 481561BF2EF
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 07:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 34BEC40154
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 07:25:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m2HxZLR2BYGs for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 07:25:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A35CF40010
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A35CF40010
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A35CF40010
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 07:25:05 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 7D94A440479;
 Mon,  3 Jun 2024 10:24:57 +0300 (IDT)
To: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20240603071726.532652-2-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 3 Jun 2024 09:17:05 +0200")
References: <20240603071726.532652-1-peter@korsgaard.com>
 <20240603071726.532652-2-peter@korsgaard.com>
User-Agent: mu4e 1.12.4; emacs 29.3
Date: Mon, 03 Jun 2024 10:25:02 +0300
Message-ID: <87h6eapjxt.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1717399497;
 bh=p0QUHbaEDm6cGssTr4A+76hRkNGY9JBRhshzdfEFY/g=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=YOip0q8aQZLMPCPPw4Yny/9VbbUTUl6vP2hk6J0DR5uTUZWuC9Z5KUTjhiEN2mGXw
 lo0yRH3UxG1qFLTlBeMewS25ie0upWnB7+X2pCxy2b/WhDBC0vLkHNLZCoFG2LvEYp
 1oYmeZ3DTOlfi68iW6//wmsSHb7vBbfgVzFVf3FrbBbOyifXUrOSop9sO/7fUpODUC
 1NwMKJrxam2XceRk3grjReLrE2J7ssD1zITAcE0l2NarQYal5HPSWQTQjkQnlUl/oU
 HWp0VDcYejgDZf/CwFWa0/ONr0eFUsMIYLb63MtU8JgziDMD+M9Ni+8qDnINckDwF+
 vSAmgGzk+WHeg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=YOip0q8a
Subject: Re: [Buildroot] [PATCH 02/23] package/ebtables/ebtables.hash: use
 http:// to match _SITE
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On Mon, Jun 03 2024, Peter Korsgaard wrote:
> For consistency.
>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/ebtables/ebtables.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/ebtables/ebtables.hash b/package/ebtables/ebtables.hash
> index 98106b0d60..06e2f9f345 100644
> --- a/package/ebtables/ebtables.hash
> +++ b/package/ebtables/ebtables.hash
> @@ -1,4 +1,4 @@
> -# ftp://ftp.netfilter.org/pub/ebtables/ebtables-2.0.11.tar.gz.sha256sum
> +# http://ftp.netfilter.org/pub/ebtables/ebtables-2.0.11.tar.gz.sha256sum

Maybe better

  https://netfilter.org/pub/ebtables/ebtables-2.0.11.tar.gz.sha256sum

Thanks,
baruch

>  sha256  b71f654784a726329f88b412ef7b96b4e5d786ed2bd28193ed7b4c0d677dfd2a  ebtables-2.0.11.tar.gz
>  # Locally computed
>  sha256  ebdb8ae564c952792017ec680e2edd30443642216eb9f8a3d8fa166c0cb628c1  COPYING

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
