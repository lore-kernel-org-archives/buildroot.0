Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 219B2CD4841
	for <buildroot@archiver.kernel.org>; Wed, 12 Nov 2025 20:29:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2272240BA1;
	Wed, 12 Nov 2025 20:29:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V69QCyDNW0NG; Wed, 12 Nov 2025 20:28:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E93B740B82
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E93B740B82;
	Wed, 12 Nov 2025 20:28:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CB26F1C3
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 20:28:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC09660E7D
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 20:28:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HoB_QGwUsLQ5 for <buildroot@buildroot.org>;
 Wed, 12 Nov 2025 20:28:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4C63760E4A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C63760E4A
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4C63760E4A
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 20:28:55 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 713664626; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 12 Nov 2025 20:28:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1vJHSU-0006py-1z;
 Wed, 12 Nov 2025 21:28:50 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Alexander Shirokov <shirokovalexs@gmail.com>
Cc: buildroot@buildroot.org
References: <20251107151112.1105070-1-shirokovalexs@gmail.com>
Date: Wed, 12 Nov 2025 21:28:50 +0100
In-Reply-To: <20251107151112.1105070-1-shirokovalexs@gmail.com> (Alexander
 Shirokov's message of "Fri, 7 Nov 2025 16:10:28 +0100")
Message-ID: <87y0obq9kt.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=NvyYRUgsa6HtRMLylZiyqngrGg6plCKKqibMgephuCpsTdEPsCcf2KwIzxqcUjRvIUpZwze1YLcNl2R7Tzf7xoWSEAb6kEXy2fsf/ER+/xN7b8cWcgSY3kNACSNL/bZSLu8wz81wDSArbK+prlbi1Q9O8Vtcgoo2IQzk0AIBVQi4Vb1FKFsuVODS6S04qa4Vrmotm4fx1quQdf7mTzf0RurE045kUdIENDMQhyR5ra+Dat+DGRfsmF7quDN+pyNvdLO/iNT5OFCK4BVQ2forxZlxO752/3yh67dXW35TbdX2VF4pARxCC+sZcx2rCtXTns0DGM4rz2Xk1tSYDLusEQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=YKsoLAUA95ZFdUOSpAFK8W1emB0vkfxat2s6rWrfc6w=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=NvyYRUgs
Subject: Re: [Buildroot] [v1, 1/1] package/broot:new package
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

>>>>> "Alexander" == Alexander Shirokov <shirokovalexs@gmail.com> writes:

 > This commit adds `broot` a fast and powerful file manager written
 > in Rust and licensed under MIT license. It supports filters, regular
 > expressions, and real-time "show-as-you-type" search for quick and easy
 > navigation, even in complex directory structures.

 > Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
 > ---
 >  DEVELOPERS               |  1 +
 >  package/Config.in        |  1 +
 >  package/broot/Config.in  | 11 +++++++++++
 >  package/broot/broot.hash |  3 +++
 >  package/broot/broot.mk   | 12 ++++++++++++
 >  5 files changed, 28 insertions(+)
 >  create mode 100644 package/broot/Config.in
 >  create mode 100644 package/broot/broot.hash
 >  create mode 100644 package/broot/broot.mk

 > diff --git a/DEVELOPERS b/DEVELOPERS
 > index b14c6e3875..dbd3b1517c 100644
 > --- a/DEVELOPERS
 > +++ b/DEVELOPERS
 > @@ -87,6 +87,7 @@ N:	Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
 >  F:	package/cpp-httplib/
 
 >  N:	Alexander Shirokov <shirokovalexs@gmail.com>
 > +F:	package/broot/
 >  F:	package/nnn/
 
 >  N:	Alessandro Partesotti <a.partesotti@gmail.com>
 > diff --git a/package/Config.in b/package/Config.in
 > index 930f368058..1152748d8e 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -2950,6 +2950,7 @@ endmenu
 
 >  menu "Text editors and viewers"
 >  	source "package/bat/Config.in"
 > +	source "package/broot/Config.in"
 >  	source "package/bvi/Config.in"
 >  	source "package/ed/Config.in"
 >  	source "package/joe/Config.in"
 > diff --git a/package/broot/Config.in b/package/broot/Config.in
 > new file mode 100644
 > index 0000000000..bffdf7aaad
 > --- /dev/null
 > +++ b/package/broot/Config.in
 > @@ -0,0 +1,11 @@
 > +config BR2_PACKAGE_BROOT
 > +	bool "broot"
 > +	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 > +	depends on BR2_PACKAGE_HOST_RUSTC

It makes more sense to select rustc instead of depending on it, similar
to E.G. kmon.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
