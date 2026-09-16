Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8192BC88E77
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 06:51:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4B6D8087C;
	Wed, 16 Sep 2026 06:51:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nCCbYglj83Kg; Wed, 16 Sep 2026 06:51:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org EA98F80934
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789541496;
	b=Jt2DtpxIECCs0jkm8yVuJJyHrf8ynhNfbDWAmK83n56ybe4Non/inODAL0WJYzNkV3/X
	 D9TzxBHFFL7/zuQMr/VRFB/NLgN5bmaOt/N3yQfAOvZkbUiessbStl0SZvJIcBxQreaA6
	 2FkHFx5veGRXroYLveLXXBmRviMmgJbUWaUdQ3GqwEaDHG7/0NL3NIEuFJ2LTb4naLCS3
	 taOqwmo0//VVMQYokn5DoJSRbUt+5qwaCwYySpZC+ljrKDhl8uVnrtgXfhlW5HZPL+/Ja
	 /Fx7JjL0G7Iy/lk7oUyZ82lUbZugQFSdnuuJ0ppD1JlxNi+rl7SNR86J1+K7fRemfSQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789541496;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=sFw3g4M7jlusi8/BgHh8sQaIPe3N5s6itkHXe1Z9Alw=;
	b=TrvpdHOon0KwuOWXqRlhrkKSm2d/ZeJatWGA+o4bIZB73/eInYigfQfk8nmc0PiiWtMe
	 NbEVPVgTaDN7LS+wzSN/QP3sfaVbmbyMR/7U2hekQcWt3OzYU+acT+NTLgkroaQZSz0oX
	 ho/HOilJcXjM+tFRWmNZRG7WH6ZffXoq319UfKYyaMbEk6n8QgZjIUymDbk5rvWJUbtOq
	 +nfAM0AOv6v1uZPePpA5JhpxLGh1VadPl6UysNxUyWC9SIpuOm+3TOV1EXrxlydE9In1h
	 FPkVmNbSzgzaSNVE+9wpvcVxWxiHV+j/Aasb0xry5TztHOktr7ywS1I06TitYizpAyg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789541496;
	bh=sFw3g4M7jlusi8/BgHh8sQaIPe3N5s6itkHXe1Z9Alw=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nleoRYWpNbLLH32HAQnzjSNwVLP5l2FZBeokgNqTPwqqKyDlw7O+fsgOcEMG1cs9B
	 gTP88qfDD/6B3u/T4hJHGRnIlAqhQEjspM7D3+zZYA6IM3i681giBMPlehjOi35QPj
	 qWeMEu2TSKZ/6/Z3feAAKZvpoGR6WstEabCHSwChPQhEYjQMZ18h0yhmoEvfOZlcdd
	 fnbGXhTwrjkyL2ea8J5SlpD/FL6y052oswAEMAAsZOkjKpO1KVlJwKwsVAMie53bwv
	 29a/z7TAKdHmuNbtFhoABad2oimBMdHKvofzXIlNjbltFi5B6N0lomteMJnDgHKrN6
	 +NTCRfa3tqywg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA98F80934;
	Wed, 16 Sep 2026 06:51:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A0C63AF
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 06:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2FF74607C7
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 06:51:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NxXlvYtuzRlA for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 06:51:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 41414605E6
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789541493;
 b=M93MC8RHzg7uJjtZT5X59MuLcDKAkK6jgLXui95Stqa1QKNrLwiU/pScxkBTxIMQ67bk
 gn+zNuYoMjY0rpEgbGqL3Ha0d4u9nJiyYXN/0VFFW1grfOcowioGdzN5pacVvIEcU2ULZ
 96LvU8SJ9hURuLxFY5OGe2wUTaXyXfiuTWjdyhFA0x29PmQ/DLxuEj+9lAUT+zC+dqbm5
 yF+pFNsV4odAZW54JNdZ7btt5D4u5bBvmuGHxbFXI9QT/VyOA37/FpbXnOul8u1yq9oWD
 WPkTiADNO8Du+5a+JIVduM6lUZ9ADN5DybKZ6yuXRlkFu7GHzLj5fTMktVRPD5Q2CUQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789541493;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=2TtYiz7zcg5fjnrSI01aZkYTg0DkBU+B9qgeHqOvMcg=;
 b=P61wpMWXhZDkx0aTtEP3k7UZ5XOzCsZ8uK1IO0zk4wjcPX5xrYiNdxJlkKTrZav6iKtL
 gB7u0+FUtKIB/M0q7yEjlcckkDTSF1DIN8BhTD89q4VDYQIWqf6g9WNrPbw1JHjjrF4KX
 5/eJB9xqqWdMtHdF+WwA1Qp92ZvRPb5HoBC7X6Lk0K5g9EIPbWqjJ2W3KpC/l0T7XRmPm
 RKv+blEkRuwXu2A5nyH/67FdPUIKtQfTX6W01t6bSOW4IpHasA0W9cgVJGcK3bYCjvOAM
 7+pkZfpBDGQeJRgHmaAnYL2STEIpO8jcu5rUdM8aNSSQPwWUjpJx792fDItcY6ibKHg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=none header.from=korsgaard.com; 
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail1 header.b=uWP8wLE8; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=uWP8wLE8
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 41414605E6
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 06:51:32 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=uWP8wLE8F9joBJeZqQk3z7KmKiLtE1tcKX9E2HzKFsRljWGu83pyTeeeGMjbFZOlKNNQqNlSPhUZc/Q2goUH8NQ9RmMnQqY6ok4v1ZK9klxYHfmL+ym81VvEfxmHX81dQ61faGPsgTMvv/31ZkbqmZDlDjV74wDOYd9Figo8ehtrEN0MaAqc2wkCHdfLkTjhwGuhSBqc6Nnslqugj8NmN34eFuD78filsQBPYHmS2iCaJPLeg5loApvoTiy14UXKY2eiJ5MrknlHqAWp81H3q8BHedjXgXgfmfoPrKoorwl1cnzbTo6xpSneoEvFPoNE7xZYFnCL7d6p887phf45YA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=DYE7zcjxIQraYF5tU7utoOtCQk/YKNDtRac8bMKiFuc=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 860612170; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 16 Sep 2026 06:51:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1x6jUL-0000000Gfc5-2IJt;
 Wed, 16 Sep 2026 08:51:25 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Neal Frager <neal.frager@amd.com>
Cc: <buildroot@buildroot.org>,  <arnout@rnout.be>,
 <luca.ceresoli@bootlin.com>,  <thomas.petazzoni@bootlin.com>,
 <michal.simek@amd.com>,  <ju.o@free.fr>,  <brandon.maier@collins.com>,
 <romain.naour@smile.fr>,  <romain.naour@gmail.com>,
 <ibai.erkiaga-elorza@amd.com>,  <yann.morin@orange.com>,
 <alistair@alistair23.me>,  <brian.j.wood2@boeing.com>,
 <matthew.l.weber3@boeing.com>,  <stefano.stabellini@amd.com>,
 <micheal.saleab@amd.com>,  <stewart.hildebrand@amd.com>,
 <john.ernberg@actia.se>
In-Reply-To: <20260826064649.292291-1-neal.frager@amd.com> (Neal Frager's
 message of "Wed, 26 Aug 2026 07:46:46 +0100")
References: <20260826064649.292291-1-neal.frager@amd.com>
Date: Wed, 16 Sep 2026 08:51:25 +0200
Message-ID: <877bklofiq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v5 1/4] package/xen: fix build error when
 BR2_PACKAGE_XEN_TOOLS not enabled
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

>>>>> "Neal" == Neal Frager <neal.frager@amd.com> writes:

 > The 0002-Update-linker-flags.patch assumes that the qemu-xen files are included
 > in the xen source tree. However, if BR2_PACKAGE_XEN_TOOLS is not enabled, the
 > qemu-xen dependency will not be handled and the patch will fail to apply with
 > the following error.

 > Fixes: build error below
 > Applying 0002-Update-linker-flags.patch using patch:
 > patching file tools/Makefile
 > Hunk #1 succeeded at 36 (offset -1 lines).
 > Hunk #2 succeeded at 185 (offset -8 lines).
 > can't find file to patch at input line 76
 > Perhaps you used the wrong -p or --strip option?
 > The text leading up to this was:
 > --------------------------
 > |diff --git a/tools/qemu-xen/include/hw/xen/xen_native.h b/tools/qemu-xen/include/hw/xen/xen_native.h
 > |index 6bcc83ba..2590904e 100644
 > |--- a/tools/qemu-xen/include/hw/xen/xen_native.h
 > |+++ b/tools/qemu-xen/include/hw/xen/xen_native.h
 > --------------------------
 > No file to patch.  Skipping patch.
 > 1 out of 1 hunk ignored
 > make: *** [package/pkg-generic.mk:239: output/build/xen-4.21.1/.stamp_patched] Error 1

 > To avoid making BR2_PACKAGE_XEN_TOOLS a required option, fix the
 > 0002-Update-linker-flags.patch so that modifying source from the qemu-xen
 > package is no longer included.

 > Instead of patching qemu-xen, a better solution is undefining the
 > __XEN_INTERFACE_VERSION__ from the qemu-xen package.

 > To test:
 > BR2_aarch64=y
 > BR2_TOOLCHAIN_EXTERNAL=y
 > BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 > BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 > BR2_PACKAGE_XEN=y
 >  # BR2_PACKAGE_XEN_TOOLS is not set

 > Signed-off-by: Neal Frager <neal.frager@amd.com>

Committed, thanks - And sorry for the slow response!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
