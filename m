Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E8DC3ABC3
	for <buildroot@archiver.kernel.org>; Tue, 13 May 2025 17:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BAC082131;
	Tue, 13 May 2025 17:01:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zh2n6bA6l2t9; Tue, 13 May 2025 17:01:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62A0A820D4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62A0A820D4;
	Tue, 13 May 2025 17:01:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D6E7153
 for <buildroot@buildroot.org>; Tue, 13 May 2025 17:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7C1741222
 for <buildroot@buildroot.org>; Tue, 13 May 2025 17:01:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D5aTcbpR5efu for <buildroot@buildroot.org>;
 Tue, 13 May 2025 17:01:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 79B5A40589
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79B5A40589
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 79B5A40589
 for <buildroot@buildroot.org>; Tue, 13 May 2025 17:01:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8345643231;
 Tue, 13 May 2025 17:01:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uEt0P-0039aJ-1d;
 Tue, 13 May 2025 19:01:25 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Cc: Marcus Hoffmann <buildroot@bubu1.eu>,  James Hilliard
 <james.hilliard1@gmail.com>,  Oli Vogt <oli.vogt.pub01@gmail.com>
References: <20250512191216.234165-1-buildroot@bubu1.eu>
Date: Tue, 13 May 2025 19:01:25 +0200
In-Reply-To: <20250512191216.234165-1-buildroot@bubu1.eu> (Marcus Hoffmann via
 buildroot's message of "Mon, 12 May 2025 21:12:15 +0200")
Message-ID: <87msbgtpga.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdegieeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufhfffgjkfgfgggtsehttddttddtredtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepjeejffdtudegtdfggefgffekhffghfdvgeegudeggfffleevtdfftefhueehueeinecuffhomhgrihhnpegujhgrnhhgohhprhhojhgvtghtrdgtohhmpdhgihhthhhusgdrtghomhdpphihphhirdhorhhgpdhphihthhhonhhhohhsthgvugdrohhrghdpsghuihhlughrohhothdrohhrghenucfkphepkeelrdegjedrvdduledrvdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepkeelrdegjedrvdduledrvdehpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepsghuihhlughrohhothessghusghuuddrvghupdhrtghpthhtohepjhgrmhgvshdrhhhilhhlihgrrhguu
 desghhmrghilhdrtghomhdprhgtphhtthhopeholhhirdhvohhgthdrphhusgdtudesghhmrghilhdrtghomh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/python-django: security bump to
 5.2.1
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

>>>>> "Marcus" == Marcus Hoffmann via buildroot <buildroot@buildroot.org> writes:

 > Fixes CVE-2025-32873 [1].
 > Django 5.2.1. also updates setuptools[2], so we can remove the --skip-dependency-check
 > flag and need to update the package archive capitalization accordingly.

 > [1] https://www.djangoproject.com/weblog/2025/may/07/security-releases/
 > [2] https://github.com/django/django/commit/3ae049b26b995c650c41ef918d5f60beed52b4ba

 > Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

For a security fix we would prefer to instead bump to 5.1.9 for easy
backporting to the 2025.02.x branch. If needed, a later patch can then
bump to the 5.2.x series.

Care to send such patch(es)?

> ---
 >  package/python-django/python-django.hash | 4 ++--
 >  package/python-django/python-django.mk   | 7 +++----
 >  2 files changed, 5 insertions(+), 6 deletions(-)

 > diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
 > index 1e197004d0..836307f6b8 100644
 > --- a/package/python-django/python-django.hash
 > +++ b/package/python-django/python-django.hash
 > @@ -1,5 +1,5 @@
 >  # md5, sha256 from https://pypi.org/pypi/django/json
 > -md5  80247a8b48cdac55e5ad3fb682ab71a3  Django-5.1.8.tar.gz
 > -sha256  42e92a1dd2810072bcc40a39a212b693f94406d0ba0749e68eb642f31dc770b4  Django-5.1.8.tar.gz
 > +md5  317174c6e0593c40e58ec1bd428b1091  django-5.2.1.tar.gz
 > +sha256  57fe1f1b59462caed092c80b3dd324fd92161b620d59a9ba9181c34746c97284  django-5.2.1.tar.gz
 >  # Locally computed sha256 checksums
 >  sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
 > diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
 > index b64d8e4cd1..62c8a00313 100644
 > --- a/package/python-django/python-django.mk
 > +++ b/package/python-django/python-django.mk
 > @@ -4,15 +4,14 @@
 >  #
 >  ################################################################################
 
 > -PYTHON_DJANGO_VERSION = 5.1.8
 > -PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 > +PYTHON_DJANGO_VERSION = 5.2.1
 > +PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
 >  # The official Django site has an unpractical URL
 > -PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/00/40/45adc1b93435d1b418654a734b68351bb6ce0a0e5e37b2f0e9aeb1a2e233
 > +PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/ac/10/0d546258772b8f31398e67c85e52c66ebc2b13a647193c3eef8ee433f1a8
 >  PYTHON_DJANGO_LICENSE = BSD-3-Clause
 >  PYTHON_DJANGO_LICENSE_FILES = LICENSE
 >  PYTHON_DJANGO_CPE_ID_VENDOR = djangoproject
 >  PYTHON_DJANGO_CPE_ID_PRODUCT = django
 >  PYTHON_DJANGO_SETUP_TYPE = setuptools
 > -PYTHON_DJANGO_BUILD_OPTS = --skip-dependency-check
 
 >  $(eval $(python-package))
 > -- 

 > 2.43.0

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
