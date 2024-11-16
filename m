Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 815B8D68BD2
	for <buildroot@archiver.kernel.org>; Sat, 16 Nov 2024 10:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 332B561178;
	Sat, 16 Nov 2024 10:01:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s_YDM9RD69ZJ; Sat, 16 Nov 2024 10:01:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CFB361181
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CFB361181;
	Sat, 16 Nov 2024 10:01:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 24973B14
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 10:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04B3E40690
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 10:01:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o7irFvcT4ywn for <buildroot@buildroot.org>;
 Sat, 16 Nov 2024 10:01:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8C98B40577
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C98B40577
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8C98B40577
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 10:01:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 0636613F88E;
 Sat, 16 Nov 2024 11:01:25 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:46224])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 16 Nov 2024 11:01:25 +0100
MIME-Version: 1.0
Date: Sat, 16 Nov 2024 11:01:25 +0100
From: Julien Olivain <ju.o@free.fr>
To: Vincent Jardin <vjardin@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <3p3msfetc3jylca2ftxqaeyczkzu45zvlt3honpq5hhdljfs2n@hbwlt7bigm5q>
References: <20241115220215.1057916-1-ju.o@free.fr>
 <3p3msfetc3jylca2ftxqaeyczkzu45zvlt3honpq5hhdljfs2n@hbwlt7bigm5q>
User-Agent: Webmail Free/1.6.9
Message-ID: <f664641b915e34277781cd3e11d01e39@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731751287;
 bh=PXdUPYabuWA31+IH9ipHKaIwWvXp/IhC+eWgtUq7VxM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ghbvx5hVFKrboATCAQwebn0lN+RzaY+rYMzz3g0Sq7YmFi1qKn5Qx5hpkq6XfLv8B
 6DcmAz+A0tyNdTJnPgfbIUEi1GfKFMynM+RIW7GeJNZoZ+zakQ8WgUzekHPomllceZ
 UPGoyQx/ppAv0snRotROIRtqGcPchVhXigROE7fM3yLNGQH4PcfweqruvhbAn1dBL9
 5nj9Y4ZWzkRM/cbVF060TI6+3QOK3g6siVxqu/rx1lRAGX2iPPqF/1mIC9FcDTr3zD
 vVkiWl8gRjdrGWEW9Rg8zZoeomDd60dk2AlqaIy9PHHXGP3rJPr0Fc7uKGCmM3BE1F
 UZliCgY8pH0XA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ghbvx5hV
Subject: Re: [Buildroot] [PATCH next 1/1] Config.in: switch GNU mirrors URL
 to https
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Vincent,

Thanks for starting reviewing patches!

On 16/11/2024 00:18, Vincent Jardin wrote:
> On Fri, Nov 15, 2024 at 11:02:15PM UTC, Julien Olivain wrote:
>> As explained on [1], the primary GNU mirrors URL is https.
>> This commit updates BR2_GNU_MIRROR to switch to it.
>> 
>> [1] https://www.gnu.org/prep/ftp.html
>> 
>> Signed-off-by: Julien Olivain <ju.o@free.fr>
> 
> OK

If you want your review to be counted in the "A/F/R/T" column in 
Patchwork
https://patchwork.ozlabs.org/project/buildroot/list/

You should preferably use the following marker:

Reviewed-by: Vincent Jardin <vjardin@free.fr>

See also:
https://buildroot.org/downloads/manual/manual.html#_reviewing_and_testing_patches

It will be automatically managed by Patchwork and will simplify the
maintainer's tasks.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
