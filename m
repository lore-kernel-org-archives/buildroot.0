Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC24CA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 16:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E11A660634;
	Sun, 11 Oct 2026 16:21:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rI_TNg4L86Oo; Sun, 11 Oct 2026 16:21:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1055C6061E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791735682;
	b=ssrILIsIailt7p1nPJofncYeALrHETU7ZiYVKqgWuDG40I3wjSd25xbmKG/CKmqMQJh9
	 VeDvC5zNLhQiYRurl/fzObJe4so/q39IL5nw6SK8a2/AHME8woKUR+GWbjrQGSF8BVOev
	 +zYYrAhHTxUbMGZS/1s6UMFly7fDOX2sQr99CGpvuajR8VRU7mqbQ4wQfXzD7cm4irSXK
	 DsSK3HsOyOO3mG7wnBql2/fGeQVO189s8cpF5Em1dKPNmA9gqPMvlUTrK6MooPAFWg7rU
	 R4qnlCbt0AkIGB3DHHYnRtmCHB5zW3SzpXV8lXKWrTa1Z1lFt3pxWYkvxCjlJR+VEXA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791735682;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=hWZ9ZPI9vLp7N+bjhYblKhKeukEVBouxnoOHjmHdy0U=;
	b=pJ2u1KjxE5QI3WAisgGUMY8fbqGBk/juluQk6mc4wX+qbhGanOvtpw7D8Qsrk/Z1hrhS
	 8OiDPz5vr8wDoYmsN9Xc2rNtJmHvZiCt0xC23KvRsL4m+gWeKnj4g6xBFwZ4BP3j7mHfz
	 kI0rDsEDArIpnt3Yz0WEoPXCTE4vwXrL58uoiZuiLEm/Unik4CiZqVzacmkprPPw5DAuF
	 xz5lLP/rm/2qsIYBOgCQdsY1E6ma455D3P43PokFEGFFFMd+wPD7PINLFSFh/GiQOdYK9
	 qUdhCU4kM2Rt//q++M6w0KAae9/dVTC4uT0OEF/s2wbHx81SPeGXzON1epF9TjXVcIA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791735682;
	bh=hWZ9ZPI9vLp7N+bjhYblKhKeukEVBouxnoOHjmHdy0U=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rD1mf7beB13cTkEezCr6U73d6vBlq4AP7T4i7/XnH9GxpgsmXPGD038WB5P7bty/K
	 UgLty0AAS+jSANEiLLkMs1t5rJWpObwQdwJ7wfpGoh7lW/t7b2BecdQ5i33RSAaskO
	 J768PrxPnLcWn3J64JdXS8ugtr/1Nezb6DBGIkgO1l7D5fGLt/o+zYMd9RXe1F3ak4
	 QVcWn+WjquGu2UUd+fOG7DleoB94CEyWZ0aQpHf36+org4Gym1LCuQ55QTNEs8Rwgm
	 9GCSGGuLv9w6Io7Nkt9nkQ0exclNrrdYVufiSXEBDayzth8cwB6FugcdTO5qdy4xcE
	 rKKnOn0ZDRd4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1055C6061E;
	Sun, 11 Oct 2026 16:21:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F2AF1D5E
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 16:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4F1C40604
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 16:21:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FLTYrng2a9E3 for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 16:21:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org AFED440602
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791735680;
 b=PxtPxo5cvP/H9HQhzzBdq/ZnhV4Br/kP8ft6QBnEEYbfp8+IFu6E1B2Q9S8+1SsDPYfQ
 J2gBTXia3MsM+4G+66bUp2HP5nGT+CVAokgj/46EYTE7DvX/nQ2/q6JaIhWQ0rQZx9WPk
 IzeiWQRi4rsVdoGIPjyyeetthC/eU9GsVk/NAvQDh196WgvCx5twTPMu9ucOl9Hkzwje3
 qVFg2djwf6zYeMr1RgqIgdmg0d7IocDiAMfpEevFC+f5+pBzLvu8B79SwUlkA3nu9TE4g
 qPbfxGJzahRrz1LraiI3595MnYAgl9zvcMlFDgROEKa4HYBR1b5e4aFqWN3pSMAqUPA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791735680;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=bn1VgEHU+hTIL89otT0S/iKn24R1UFLPM+cBW91FZoE=;
 b=WTE6Fpq7mPLy5rMRQSSo2uDzzrJvwyOOFDveEAl5aNrnr+4FVwywWqeumgupsezpd3eq
 XJWAbw+9QF1av+C7B7KvwBNMc1uYSyqitXVnroQY3GJrD6P2L2fLLsFZTI4T0uIBrEt8J
 6jvrZYlCs0wu/yC2cGEGkRtNDlz7zHBkr/Ht5b1FSRjq0/HpK/5SFZV1vrmuJHZaxLs7U
 EQpX5qT4nV5fWK8xeruxPdWZzqRm0zkTeazJGCmsJ/zUCuWsR1GDZK/XyxPsK9XKy/Uom
 nfjHdF9DwIbd2WmkpYR9zoA9JHpL0Q1XTrdvcLEQJfCHILLHhYv1PxLqKTM6LoiC9og==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail2 header.b=Cah79pY0; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=Cah79pY0
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AFED440602
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 16:21:18 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=Cah79pY0FW5iXYVmipjkLOUrjFnJ4CbQsD3IXteucHntdIkLPA7M9dGG39CTTLMrs2X4zVTMNzuPIuiyy4l2yAYVEbvl20dcF5BVDS+wNnyxXBC43ilSwQF6wNrukAZUNimxUJ8+cI1h9IDoHZs3S4BXs1g8YhB9JG6n58qxMn4/a7r0B9KwJiJfdIF4Z1terfgRvKCNJR4IQUcCXJ6vXn5J0NznC/H8yOUoXmEDaHwe8xX26RbX5ZpYqIAFW2P9HiFLOkd8/7wekNkLMr1VbXgdBUqKvc9+s5m5p/4u3V5/XNTER3n0QniJmjeyE5XM/ixXAaeBT6qVMyjHVc49Wg==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=c3LJvcG3owEg43UQ9kdTTD412/3u4zV19oZDjSkkO0A=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -2024341396; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 11 Oct 2026 16:21:16 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xFwIV-00000009Iny-1XSB;
 Sun, 11 Oct 2026 18:21:15 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Titouan Christophe via buildroot <buildroot@buildroot.org>
Cc: Titouan Christophe <titouan.christophe@mind.be>
In-Reply-To: <20261011102131.1144118-1-titouan.christophe@mind.be> (Titouan
 Christophe via buildroot's message of "Sun, 11 Oct 2026 12:21:31
 +0200")
References: <20261011102131.1144118-1-titouan.christophe@mind.be>
Date: Sun, 11 Oct 2026 18:21:15 +0200
Message-ID: <878q44yzr8.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/ifenslave: remove package
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

>>>>> "Titouan" == Titouan Christophe via buildroot <buildroot@buildroot.org> writes:

 > ifenslave has not received any recent update, has no Buildroot DEVELOPER
 > and its upstream NEWS [1] states the following:

 >   This version of the ifenslave package no longer provides /sbin/ifenslave. The
 >   /sbin/ip command from the iproute2 package supports creating bonding masters
 >   and enslaving other interfaces to it.

 > Its feature is available either in iproute or in Busybox, so we can
 > simply remove it from Buildroot.

 > [1] https://salsa.debian.org/debian/ifenslave/-/blob/main/debian/NEWS

 > Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
