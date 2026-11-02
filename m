Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD13606A324
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 13:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Ambx5I6Q
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B991E60600;
	Mon,  2 Nov 2026 13:44:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JodctNLFBihy; Mon,  2 Nov 2026 13:44:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D683D60658
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793627088;
	b=pGRnPfNJb4n42dhh3EgprhyLtvqIVbdHW3/UXV3yIjeDRPkmD4GGs6ToaRJEDvGyPMLg
	 9ASKDvnpcMBtOn8/NG2iw3/MNizld1+dKiTgX+wGEEEgFfmLiViBTaieZdGHKQaT3Pkw2
	 r2e1rRT/Woomg1TCaZkhD5TzCJdiNoe+VX1aRzYtVv8FWf3EI9VxX1IV/lLBLKPWSULPP
	 MpTLu6ktgWrPW4yA8bWVY7QnrHJGSSbh2JTSE8bvPL2O8GrNfQ3am+ThFBhiyNiGXX1z1
	 n7dFLKD/+v2MmZPEmNn/KknEQgIeqH9CFBuirMkHnIb5+gJ0jzr4dq13dK3YbJkpn9A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793627088;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Date:To:Cc:Message-ID:In-Reply-To:
	 References:X-Mailer:MIME-Version:X-Provags-ID:UI-OutboundReport:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=YnKZCPSqAqebUO8zaTTL6Kdq/HPfr6oCb0d1OnqB+h0=;
	b=ZpxDTznX7QGWUD5ZargnsGxw1xpZxB74JwEBbedpfTnoEk1ryoai9l1vwFuMKDr1FEQ9
	 lFVxkHheSbq7cjoCQfPBXnuZ9q5cz9/YnEdFNq+sA0iX6zjkISxY4Ie/mQX2UVZGWLS1/
	 6LSnBENEuPT9AUahcXcwZSsFWSJsxBzLkPAN6o0B27Ta4y/OAAk1HM7dVbgSMkNT2S6DB
	 pT4MIzoPpBklPaZqIXSPhHtcNhcOE1T4P5hINcwssbxdEw0oNT7JmXGmoSsbgZzYGnekm
	 jI2Xydz0zTb9rDi2MPBoFqICDGmizh3wui9REZiepRiJsbnZUyUPu0p1fNPhY9VuFTg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793627087;
	bh=YnKZCPSqAqebUO8zaTTL6Kdq/HPfr6oCb0d1OnqB+h0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ambx5I6QQ16pvxc+ziA4bVrelRBzXWPtgPioR/ZTLp0RiZ0JN8OcabAxIncUeS6dQ
	 sf3ONyTPSFeHIrw+TXsJEcijopBjizwqzyZrzjiCWsRw9rXqMcj+I6sS6NyujHevuQ
	 MEBqwtmCzcutoYIvkhYXlAY8TbsDeUgD6bsegXv8ueeSyp1xK03H4VUS15l9DzhTQ2
	 dbFUNqQEprOF6YtKLOTdg1HR+6+GFSWreat4GARhcjp3jHE8i8JP5hEt2ExZE1km/u
	 i6dTfR8HVbrfKYeBSd/6s9o/LfSxJ1okIoyBdbIBEOZ403HpTVL9dtKlOOemcO8+Yt
	 W7M487PqnQb7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D683D60658;
	Mon,  2 Nov 2026 13:44:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9CD64435
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 13:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 828954006F
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 13:44:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rcm_3ZvmgSqb for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 13:44:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 303E840050
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793627085;
 b=hwWAMcUketKIUAJZ9v7LzUK9r23dH1atSb682hjfttw8lOwUhAYXhmv2ywu17ZIzrQfD
 ege/juGlk/Rwj/vkVFfBtcsdBUFEwv7q71hDAzXSd9JKg2BJXSJq3WHGuK+CWta5Vcgc6
 3Zk7fGkSpbQIDP3ageti+uln3MK4yNxcSI7/nmHAJ/vseA9k/EaIStVzXdUwcCNMHzv/q
 QQlGJpX+WnfiJrHy47Wh20hErV26/FdlQOY8TkG8kVgWlK92oPSPMXoeeHWjjYDLJ6Lkl
 +UGEhOGT0sqoGhFJPKbS1SzuTKtR0if84uwVkWGW9v9M1PJJuNDqyXTnIhUZDpcek1Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793627085;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Date:From:To:
 Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
 UI-OutboundReport;
 bh=08vgsihrKf4HSSOeaBkzdb+N9v/OV6ZwHAxEIyHyxnM=;
 b=H8TR29kjlkVdSepCsVh4Pfid46l4ckdmqZ2NjR4evDOM4SU1Uufr5xn/4KcfKzORLTj1
 nRXEQ8+FwXUoWnOGdcbB6nRCLymxT0wcS1Q4AaSTQHEjS/wgOwtfxdJTJkoUgwCymQAoc
 5aIpoK9k6m11+dztvsX+9YkJIJaKP7VmD9FWXYS9OXTPW0kl6SuADucayc3xn+Udx4MTE
 f2D5oreVPyOVUmwdDpFAd1Fb4IHfZyB1gmY7wJqZJm0AvMnJqeZgjTfrP+GxVl9kOuJe8
 mVoLDUo5m83sUA3RtHO4XXTmj6346VvzU4EJVVMliC9oLcB9RTIShrnIpdCpU5o7K6Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmx.net;
 dkim=pass header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=FvX23VFv; 
 arc=none smtp.remote-ip=212.227.17.22
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 303E840050
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 13:44:44 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mirng-1wu1hm0CQO-00prEX; Mon, 02
 Nov 2026 14:44:42 +0100
Date: Mon, 2 Nov 2026 14:44:41 +0100
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Julien Olivain <ju.o@free.fr>
Message-ID: <20261102144441.33ea2f82@pc-1>
In-Reply-To: <aufAny9Sf6-bnoa-@windsurf>
References: <20261030151950.1475253-1-ps.report@gmx.net>
 <aufAny9Sf6-bnoa-@windsurf>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.53; x86_64-suse-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:GHqUsOREyOCnKol4aLYS0KCGUYsSjEeSp58U6Nkd819/pSrVLUL
 ciTnFrW3Mm0EES5Dgv3/xKz8FftUaTjdPbsO0c+6evrde0NZyXEEDF52YCfi37gVomO2VvR
 1kE4M/d5reaoc5s4CZ+hD7vicDkqRUqHLo6dz3QCJWe+xVMBdAyxtC/q1L7l5ZDzxco+9qi
 dVDpiJudKTM8MKmNMOUbw==
UI-OutboundReport: notjunk:1;M01:P0:SLP26mZxxec=;u0nhh8zI/kx2RYFRDYLhiGAxHfx
 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
 8/Z2frPM5rhFlJsVaTys4RYW
Subject: Re: [Buildroot] [PATCH v3] package/libressl: bump version to 4.4.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Thomas,

On Sun, 1 Nov 2026 23:44:43 +0100, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Fri, Oct 30, 2026 at 04:19:50PM +0100, Peter Seiderer via buildroot wrote:
> 
> > +# Avoid linking problem: "undefined reference to `__stack_chk_fail_local'"
> > +ifeq ($(BR2_TOOLCHAIN_HAS_SSP),y)
> > +LIBRESSL_CONF_OPTS += -DENABLE_HARDENING=ON
> > +else
> > +LIBRESSL_CONF_OPTS += -DENABLE_HARDENING=OFF
> > +endif  
> 
> This should most likely be an unconditional
> -DENABLE_HARDENING=OFF. Indeed, we have a global BR2_SSP_NONE /
> BR2_SSP_REGULAR / BR2_SSP_STRONG / BR2_SSP_ALL that decides whether we
> want SSP or not.

Same for all other packages?

package/aircrack-ng/aircrack-ng.mk:ifeq ($(BR2_TOOLCHAIN_HAS_SSP),y)
package/botan/botan.mk:ifeq ($(BR2_TOOLCHAIN_HAS_SSP),y)
package/btop/btop.mk:ifneq ($(BR2_TOOLCHAIN_HAS_SSP),y)
package/linux-tools/linux-tool-rtla.mk.in:ifeq ($(BR2_TOOLCHAIN_HAS_SSP),)
package/linux-tools/linux-tool-tmon.mk.in:ifeq ($(BR2_TOOLCHAIN_HAS_SSP),)
package/monit/monit.mk: ax_cv_check_cflags___fstack_protector_all=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no) \
package/mosh/mosh.mk:ifeq ($(BR2_TOOLCHAIN_HAS_SSP),)
package/ntp/ntp.mk:ifeq ($(BR2_TOOLCHAIN_HAS_SSP),y)
package/powerpc-utils/powerpc-utils.mk: ax_cv_check_cflags___fstack_protector_all=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
package/psmisc/psmisc.mk:ifeq ($(BR2_TOOLCHAIN_HAS_SSP),)
package/radvd/radvd.mk:ifeq ($(BR2_TOOLCHAIN_HAS_SSP),y)
package/ruby/ruby.mk:ifeq ($(BR2_TOOLCHAIN_HAS_SSP),)
package/stunnel/stunnel.mk:     ax_cv_check_cflags___fstack_protector_strong=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no) \
package/vlc/vlc.mk:     ax_cv_check_cflags___fstack_protector_strong=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)

Regards,
Peter

> 
> Thanks!
> 
> Thomas

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
