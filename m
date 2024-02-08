Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A74C4828F
	for <buildroot@archiver.kernel.org>; Thu,  8 Feb 2024 14:29:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8EFD5400AB;
	Thu,  8 Feb 2024 14:29:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SbX4ZUh3V_IE; Thu,  8 Feb 2024 14:29:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C99A41DAF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C99A41DAF;
	Thu,  8 Feb 2024 14:29:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CB40F1BF369
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 14:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B8FE66FBA1
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 14:29:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PI1KX6y2-VTN for <buildroot@lists.busybox.net>;
 Thu,  8 Feb 2024 14:29:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 28D6C6151C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28D6C6151C
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 28D6C6151C
 for <buildroot@buildroot.org>; Thu,  8 Feb 2024 14:29:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 92BFCE000C;
 Thu,  8 Feb 2024 14:29:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rY5P6-0032nw-2r;
 Thu, 08 Feb 2024 15:29:28 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
References: <20240208130838.196406-1-buildroot@bubu1.eu>
Date: Thu, 08 Feb 2024 15:29:28 +0100
In-Reply-To: <20240208130838.196406-1-buildroot@bubu1.eu> (Marcus Hoffmann via
 buildroot's message of "Thu, 8 Feb 2024 14:08:37 +0100")
Message-ID: <878r3vyqpj.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/python-django: security bump to
 5.0.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>, Asaf Kahlon <asafka7@gmail.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Marcus" == Marcus Hoffmann via buildroot <buildroot@buildroot.org> writes:

 > Minor 5.0 bugfix release [1] fixing one "moderate" severity CVE.
 > Fixes: CVE-2024-24680

 > [1] https://docs.djangoproject.com/en/5.0/releases/5.0.2/#django-5-0-2-release-notes

 > Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Committed, thanks.

> ---
 >  package/python-django/python-django.hash | 4 ++--
 >  package/python-django/python-django.mk   | 4 ++--
 >  2 files changed, 4 insertions(+), 4 deletions(-)

 > diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
 > index 39fd9afdae..20b66a4106 100644
 > --- a/package/python-django/python-django.hash
 > +++ b/package/python-django/python-django.hash
 > @@ -1,5 +1,5 @@
 >  # md5, sha256 from https://pypi.org/pypi/django/json
 > -md5  5ff3c69d7e6b4f5ed378ec5713af8df7  Django-5.0.1.tar.gz
 > -sha256  8c8659665bc6e3a44fefe1ab0a291e5a3fb3979f9a8230be29de975e57e8f854  Django-5.0.1.tar.gz
 > +md5  5d0df847e1b751a4a5d2bde1563c75fc  Django-5.0.2.tar.gz
 > +sha256  b5bb1d11b2518a5f91372a282f24662f58f66749666b0a286ab057029f728080  Django-5.0.2.tar.gz
 >  # Locally computed sha256 checksums
 >  sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
 > diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
 > index ed4f4bcdf1..231de0b833 100644
 > --- a/package/python-django/python-django.mk
 > +++ b/package/python-django/python-django.mk
 > @@ -4,10 +4,10 @@
 >  #
 >  ################################################################################
 
 > -PYTHON_DJANGO_VERSION = 5.0.1
 > +PYTHON_DJANGO_VERSION = 5.0.2
 >  PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 >  # The official Django site has an unpractical URL
 > -PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/53/82/c8e8ed137da1c72fa110e3be9ab0f26bcfcf6f3d2994601d164dfac86269
 > +PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/50/98/499a2d11eb0b22fdd55ce5895e0f5ce6d7d4957a785f237a89317cb478fa
 >  PYTHON_DJANGO_LICENSE = BSD-3-Clause
 >  PYTHON_DJANGO_LICENSE_FILES = LICENSE
 >  PYTHON_DJANGO_CPE_ID_VENDOR = djangoproject
 > -- 

 > 2.34.1

 > _______________________________________________
 > buildroot mailing list
 > buildroot@buildroot.org
 > https://lists.buildroot.org/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
