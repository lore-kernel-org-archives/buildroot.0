Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5029AD42B86
	for <buildroot@archiver.kernel.org>; Tue, 12 Nov 2024 14:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD995405A0;
	Tue, 12 Nov 2024 14:10:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JnC-Tcw_CD-x; Tue, 12 Nov 2024 14:10:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0046405A1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0046405A1;
	Tue, 12 Nov 2024 14:10:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A38C2D8F
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 14:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 916E5405A1
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 14:10:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9WRTpLECxFSg for <buildroot@buildroot.org>;
 Tue, 12 Nov 2024 14:10:29 +0000 (UTC)
X-Greylist: delayed 498 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 12 Nov 2024 14:10:28 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CD4F0405A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD4F0405A0
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=207.191.210.45;
 helo=darkness.snow.run; envelope-from=brandon@darkness.snow.run;
 receiver=<UNKNOWN> 
Received: from darkness.snow.run (207-191-210-45.dhcp.imoncommunications.net
 [207.191.210.45])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CD4F0405A0
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 14:10:28 +0000 (UTC)
Received: by darkness.snow.run (Postfix, from userid 1000)
 id 4E3C95FF5B0; Tue, 12 Nov 2024 08:02:09 -0600 (CST)
Date: Tue, 12 Nov 2024 08:02:09 -0600
Message-Id: <D5K97MPVS6P8.12VCXY5DPY570@gmail.com>
From: "Brandon Maier" <brandon.maier@gmail.com>
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
Cc: <buildroot@buildroot.org>, "Niklas Cassel" <cassel@kernel.org>
Mime-Version: 1.0
X-Mailer: aerc 0.18.2
References: <20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com>
 <20241109-genimage-partition-type-uuid-v1-5-9f23180c7195@gmail.com>
 <20241111220247.321caa3b@windsurf>
In-Reply-To: <20241111220247.321caa3b@windsurf>
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=gmail.com
Subject: Re: [Buildroot] [PATCH 05/17] board/pc: use partition-type-uuid
 "root-x86"
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Mon Nov 11, 2024 at 3:02 PM CST, Thomas Petazzoni wrote:
> On Sat, 09 Nov 2024 16:16:19 -0600
> Brandon Maier <brandon.maier@gmail.com> wrote:
>
> > Signed-off-by: Brandon Maier <brandon.maier@gmail.com>
> > ---
> >  board/pc/genimage-efi.cfg | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/board/pc/genimage-efi.cfg b/board/pc/genimage-efi.cfg
> > index c231e1b9b2626c5a788c85511b1f1e9d12759d33..7d3d69bd067c2c39f5188d82d2e1fd11088657e1 100644
> > --- a/board/pc/genimage-efi.cfg
> > +++ b/board/pc/genimage-efi.cfg
> > @@ -25,7 +25,7 @@ image disk.img {
> >  	}
> >  
> >  	partition root {
> > -		partition-type-uuid = 44479540-f297-41b2-9af7-d131d5f0458a
> > +		partition-type-uuid = root-x86
>
> I don't understand how this lines up with the policy you have updated
> in PATCH 01/17.

My intention for this series wasn't for the policy to be "prefer using
L" or "prefer using root-$ARCH". It was to be "prefer using shortcuts
over the full GUID", with the intent of having a second patch series
that would convert L to root-$ARCH.

Niklas also thought my changes to the docs meant "prefer using L", so I
am not communicating clearly, my apologies. I will try to make the
intent clearer in v2.

Thank you,
Brandon

>
> Thomas

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
