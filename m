Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA4E1CCD185
	for <buildroot@archiver.kernel.org>; Wed, 15 Oct 2025 07:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B55C83FBE;
	Wed, 15 Oct 2025 07:00:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7h_PnCK1PlxJ; Wed, 15 Oct 2025 07:00:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E859B82B49
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E859B82B49;
	Wed, 15 Oct 2025 07:00:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9925E1BA
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 07:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8AD3C41452
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 07:00:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wOf2kyRJzipt for <buildroot@buildroot.org>;
 Wed, 15 Oct 2025 07:00:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BA96541421
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA96541421
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BA96541421
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 07:00:26 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -193043167; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 15 Oct 2025 07:00:23 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1v8vUk-003YSj-13;
 Wed, 15 Oct 2025 09:00:22 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
References: <20251014185113.3583315-1-bernd@kuhls.net>
 <20251014185113.3583315-14-bernd@kuhls.net>
Date: Wed, 15 Oct 2025 09:00:22 +0200
In-Reply-To: <20251014185113.3583315-14-bernd@kuhls.net> (Bernd Kuhls's
 message of "Tue, 14 Oct 2025 20:51:13 +0200")
Message-ID: <87jz0wtzsp.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=J35SJv0+wyXtf09uedC629Ppp+iVyJMwIxiBMJHetfnAJugP0vA9355lBu9kMwZF/JG7j21HUXa1mpDNsf9+wp4NsWPOa9ZhDOGYkm9e/iy7uzEDyqpSymF72z1VMd7OoaOVhM+AS104fi5xUFbMwdv87px4EL6RN0bGSlw3WwNB36v5gDJkH/15xP3GEhlJtitZE2DUQIiYKHu5qKrVHIJT2tjJNwMT0g1g3LeGo2kh5oX3Ec4iQ2EDszg0HRSQgpG7Z4OOPMn+/bKhyUjj73u+jbZVrSUgjUr0wlCu69yhmX2I/oDBjDr8QOZbta7LxljbTZ0baPA3RzMVUZ3Nhg==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=foqJ1j46EClSsY4gxg3C9kIu7geW2YDBpied+QQZgVg=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=J35SJv0+
Subject: Re: [Buildroot] [PATCH 14/14] package/python-pycryptodomex: bump
 version to 3.23.0
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 James Hilliard <james.hilliard1@gmail.com>,
 Vinicius Tinti <viniciustinti@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

> ---
 >  package/python-pycryptodomex/python-pycryptodomex.hash | 4 ++--
 >  package/python-pycryptodomex/python-pycryptodomex.mk   | 4 ++--
 >  2 files changed, 4 insertions(+), 4 deletions(-)

 > diff --git a/package/python-pycryptodomex/python-pycryptodomex.hash b/package/python-pycryptodomex/python-pycryptodomex.hash
 > index 357d9e8c2b..af67a1639a 100644
 > --- a/package/python-pycryptodomex/python-pycryptodomex.hash
 > +++ b/package/python-pycryptodomex/python-pycryptodomex.hash
 > @@ -1,6 +1,6 @@
 >  # md5, sha256 from https://pypi.org/pypi/pycryptodomex/json
 > -md5  1f75ba3b07402102857b5ed496f48718  pycryptodomex-3.21.0.tar.gz
 > -sha256  222d0bd05381dd25c32dd6065c071ebf084212ab79bab4599ba9e6a3e0009e6c  pycryptodomex-3.21.0.tar.gz
 > +md5  c54ba32585587dd47087a8cf8032d72b  pycryptodomex-3.23.0.tar.gz
 > +sha256  71909758f010c82bc99b0abf4ea12012c98962fbf0583c2164f8b84533c2e4da  pycryptodomex-3.23.0.tar.gz
 >  # Locally computed sha256 checksums
 >  sha256  4e04660d77c1c64e89d79537919fb8240fa21484a7e3db29f358b2c7f84ea073  LICENSE.rst
 >  sha256  8e563c767164faa0831a333b57d23d4311cf566eb1b15d93250f4606be4eb549  Doc/LEGAL/COPYRIGHT.pycrypto
 > diff --git a/package/python-pycryptodomex/python-pycryptodomex.mk b/package/python-pycryptodomex/python-pycryptodomex.mk
 > index 96a55050e6..9b367227c8 100644
 > --- a/package/python-pycryptodomex/python-pycryptodomex.mk
 > +++ b/package/python-pycryptodomex/python-pycryptodomex.mk
 > @@ -4,9 +4,9 @@
 >  #
 >  ################################################################################
 
 > -PYTHON_PYCRYPTODOMEX_VERSION = 3.21.0
 > +PYTHON_PYCRYPTODOMEX_VERSION = 3.23.0
 >  PYTHON_PYCRYPTODOMEX_SOURCE = pycryptodomex-$(PYTHON_PYCRYPTODOMEX_VERSION).tar.gz
 > -PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/11/dc/e66551683ade663b5f07d7b3bc46434bf703491dbd22ee12d1f979ca828f
 > +PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/c9/85/e24bf90972a30b0fcd16c73009add1d7d7cd9140c2498a68252028899e41
 >  PYTHON_PYCRYPTODOMEX_SETUP_TYPE = setuptools
 >  PYTHON_PYCRYPTODOMEX_LICENSE = \
 >  	BSD-2-Clause, \
 > -- 

 > 2.47.3


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
