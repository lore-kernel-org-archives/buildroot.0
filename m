Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81633CC6B16
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 15:38:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BB1C60791;
	Tue, 13 Oct 2026 15:38:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L8ccIzOQCDhR; Tue, 13 Oct 2026 15:38:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4F6156077F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791905923;
	b=WYtkDMpC1bLWRL7OwFqBYME25cBd5DcfLrqLMGQ6qhkmAUujh69KV7ifjCtoZqHpWtfw
	 5El5HPiHmUVrwLNH0ZjqprwrRgVqpuso+nHIDWl9TxPtP3apBlm1hLRPQjhfFOvf2YWFy
	 NsznhSxxhdnLe+L2TF5XRdLT3qvsCkX+Tl0fGd2Tdo4TSOXQepWZpTGSZeo26Erwxj3eW
	 evw1nXeOCmdS/CNreWpg/1NScAC+Cgq519N0EdxeXhrZ7kJuOX5ytGJ83SQFuGIhHzUCs
	 zshrwS1R3zzptTogiX835cD4dbWO180Nth6Yn4dVb6CGFsqmsROWAypSApsHKhP68lg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791905923;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:In-Reply-To:References:User-Agent:Date:Message-ID:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=InL4zHvMPpU2RNIugOVw7lbLyIQ5uFlYzA0zxCMQirw=;
	b=W9ampWlScRW8816VdnpBqD1bZiGO89X9zVeKcRleaduuuDuzYeXEc/RaobEU8kXLJrKm
	 AX1y/TapsEVosnAV8bEEAebx0QAksiKo3+3UZb7YEYkhC+qEl5cCr2uP2H9ih5c87wkLD
	 v5InzXvM4PghYoQYbpRiu3Ybik72cF9W3SVVCZmFZEajWFjY2ih1qLJQQQO8wddFQtqoN
	 lJKgrFnWiKLdxi5Hfqxw1Mi27tN8lKK0pqxF3i9ARlxvXCUBkmWVwylxk7JbriYgLf2fY
	 DnbZzMw7ri2RCNanRpsqWnmpuCz1SCxgtmvz6YblEfauaxo8uAydlSC2taK3wAi8UAg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791905923;
	bh=InL4zHvMPpU2RNIugOVw7lbLyIQ5uFlYzA0zxCMQirw=;
	h=To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sGkccpBFMvFB/XmoCZJ3Q+Lfo8FzV9ATJW7SywxR2sw1BxaSGe9Nw0mZSda58czw1
	 BoMN9oxL2GDSAHqk2Ek7k6VRHPrCKIovO5tVszue4At8YtOQ9ALkj5XtbCFiU1BBqt
	 k9yCr08cweKgniCSA5SevKqqDrvWj8jtsgk3lzjd1YFAi6wzUkmb+vLR8lhSCAjhGT
	 6PxSb3ry0s78wkIGJfp/kGNYBOgYKcx+xSaLPjO82093R3fuhQybNZ1KEvXVFw23OI
	 eeHvHhMHKjRIVpFOM6p+lz1hx3jamI66Ljfct0asqnb9jmaTNxM7+wJaNbTu+cflRu
	 ay1VrhI5/rVDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F6156077F;
	Tue, 13 Oct 2026 15:38:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 10B5075
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 15:38:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0201A80A84
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 15:38:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FluA8NRlyOHJ for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 15:38:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 60BFD80A76
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791905920;
 b=WyXWcdkiyIRarO7N8rJGsd0XUTZQeaeuNJTz8aiuNIdeAgLubxD1wdcP+fRitY5HeEo8
 D47SSLX2ZmNOPP+F/OANp2V2PxTZ9Oma6+uWOzazj6ICQ6hyFhpEzOMFctPbSYZ1Tca8F
 ZRqxwZHxkDC7yQdoBmgDjCO0Z+nC7d+P5lRrS+B0Ez/Kl5fh9/cu1lc4yo6+0ShSsIN/F
 CWorS32YfW5btHRSGdmTVI6+8VoHN+lUkI298AGS8yeqxvYLIkIg2DaF2IZ4Z3GZbI18m
 evrYKMikRvhalT2JIOf+ZieJZbRj8+2Ara7T4sDfdoN/dHuNu21WudiwjvOdspuU28A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791905920;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:
 References:User-Agent:Date:Message-ID:MIME-Version:Content-Type;
 bh=aJFBLVMF3A+Y/y/yrzaA7U6scTdpWdZJAk7PWVZzTOs=;
 b=E15eQZ1Qe1CfSFxAo2QcKpz3SftFCt4N6JxrbDUkQ15Td5Utf8IfLYADKmkMgnnRFbJv
 76UTTniNlWEweiYZEYXIE+qgMzNn+kFzcxhd8qyz//krCAeg8bOKoIIagfh6R3GYpIGa6
 l+Yfnin2DsJNrNMAozJehffwnIQT/kXcC85PcsGh/PWtyTPSBDUDKhZjsAKM+bed690s6
 1U0IKaYhlnvZjXnUXHcuocTLPWFRuTHzH42SW9EJoL856F7WzhL4mpFOhMaR5hWc7VOb3
 Ghg0si3N/odwP0nGu53a8XtPbpjv8luoSVs6uNcsd6Srs+FydIUhJ7KC4zT/XyeJ+jg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=tkos.co.il;
 dkim=pass header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=iWeFFfqc; 
 arc=none smtp.remote-ip=84.110.109.230
Received-SPF: Permerror (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 60BFD80A76
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 15:38:39 +0000 (UTC)
Received: from localhost (unknown [10.0.8.4])
 by mail.tkos.co.il (Postfix) with ESMTP id 8EBAA44086D;
 Tue, 13 Oct 2026 18:37:24 +0300 (IDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Petazzoni via buildroot <buildroot@buildroot.org>,  James
 Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <as49WDTmMGZAxybw@windsurf> (Thomas Petazzoni's message of "Tue, 
 13 Oct 2026 16:17:23 +0200")
References: <20261003210833.735937-9-james.hilliard1@gmail.com>
 <asJ4XGMDm4jGCL4k@windsurf> <875wzh5tue.fsf@tarshish>
 <as49WDTmMGZAxybw@windsurf>
User-Agent: mu4e 1.14.2; emacs 30.2
Date: Tue, 13 Oct 2026 18:38:35 +0300
Message-ID: <87cxtd1uh0.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-librt: bump to version
 0.16.0
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Tue, Oct 13 2026, Thomas Petazzoni wrote:
> On Sun, Oct 04, 2026 at 07:11:21PM +0300, Baruch Siach wrote:
>> On Sun, Oct 04 2026, Thomas Petazzoni via buildroot wrote:
>> > On Sat, Oct 03, 2026 at 03:07:59PM -0600, James Hilliard wrote:
>> >> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>> >
>> > Applied to master, thanks!
>> 
>> Not in master as of commit b12c9294ff536 ("package/python-urwid: bump to
>> version 4.2.4").
>
> Indeed, sorry, I got interrupt, and pushed much later than sending the
> "applied to master" e-mail. But it is now in master as expected.

python-librt is still at 0.9.0 as of current master, now at commit
dfaacfcdf7ff3d ("package/perl-timedate: bump to version 2.35").

$ git show dfaacfcdf7ff3d:package/python-librt/python-librt.mk 
...
PYTHON_LIBRT_VERSION = 0.9.0

I'm aware that maintainers sometimes delay git push for some reason. To
avoid useless "not in <branch>" message in that case I usually wait for
another push from the same maintainer before sending notification of
missing commit.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
