Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 568F6C433EF
	for <buildroot@archiver.kernel.org>; Tue, 22 Mar 2022 09:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B106740ABA;
	Tue, 22 Mar 2022 09:40:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yuRkRclbAVVe; Tue, 22 Mar 2022 09:40:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 615F0403B7;
	Tue, 22 Mar 2022 09:40:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 89AB11BF2AB
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 09:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7920D842A2
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 09:40:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9RYZ1Hvc0f4y for <buildroot@lists.busybox.net>;
 Tue, 22 Mar 2022 09:40:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 36F3184265
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 09:40:44 +0000 (UTC)
Received: (Authenticated sender: kamel.bouhara@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 512DC1C0012;
 Tue, 22 Mar 2022 09:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647942043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2AsZ2QOyexKR+OOPtIqEpGHfN45VySDiK15hJe1vjHk=;
 b=OhmY9lkolUoG30lMUYBnEraih77HqOTtgQhejQuR7xlreOuFUztPZsYCg0ok1/nFOyBaG0
 pK+Bxqtphre1vkvgNMTpwuYSWT7Zafnc/S8/idTyNsrvquNS5tTh4KMQOeqyNDRRgBpbMk
 0W7UNL5TF2WED3pkdY7foEKSAXHTDyD4L4JJUUp/4plu3XYRYUfsLixBO5ZJnGjypxzpSQ
 Hu5nWJ3XAz3NIpA7og6X2w3emCxwgz269LdwNMfz13V5EUDJ8GsFuGA3ry0FkD5mCpvncM
 M73aj4kBM7h0C0k8jkLOrta15oDvziMUnQLo1a/mKs9xClZmw7CIL3sgJgVqjg==
Date: Tue, 22 Mar 2022 10:40:41 +0100
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <YjmZmc/7IotTSGHe@kb-xps>
References: <20220310095602.2435745-1-kamel.bouhara@bootlin.com>
 <20220310095602.2435745-4-kamel.bouhara@bootlin.com>
 <990140a5-a769-2f7b-5786-c08557db4b6b@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <990140a5-a769-2f7b-5786-c08557db4b6b@mind.be>
Subject: Re: [Buildroot] [PATCH v2 3/4] package/libodb-boost: add host
 variant
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
From: Kamel Bouhara via buildroot <buildroot@buildroot.org>
Reply-To: Kamel Bouhara <kamel.bouhara@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Mar 21, 2022 at 10:01:40PM +0100, Arnout Vandecappelle wrote:
>
>
> On 10/03/2022 10:56, Kamel Bouhara via buildroot wrote:
> > Add host variant of libodb-boost required by the ODB compiler.
> > The libodb-boost headers are needed at compile time, and
> > therefore installed in $(HOST_DIR).
> >
> > Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
> > ---
> >   package/libodb-boost/libodb-boost.mk | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/package/libodb-boost/libodb-boost.mk b/package/libodb-boost/libodb-boost.mk
> > index bac5f1e78f..39c9f91030 100644
> > --- a/package/libodb-boost/libodb-boost.mk
> > +++ b/package/libodb-boost/libodb-boost.mk
> > @@ -12,6 +12,8 @@ LIBODB_BOOST_INSTALL_STAGING = YES
> >   LIBODB_BOOST_LICENSE = GPL-2.0
> >   LIBODB_BOOST_LICENSE_FILES = LICENSE
> >   LIBODB_BOOST_DEPENDENCIES = boost libodb
> > +HOST_LIBODB_BOOST_DEPENDENCIES = hoost-boost host-libodb
> >   LIBODB_BOOST_CONF_ENV = CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
>
>  I have not double-checked (since I don't know for which GCC version exactly
> this -std=c++11 is needed), but I expect that if -std=c++11 is needed for
> target build, it's also going to be needed for host build. So I added
> HOST_LIBODB_BOOST_CONF_ENV.
>

It seems required seems GCC 11: http://lists.busybox.net/pipermail/buildroot/2021-August/618575.html

Thanks,
Kamel

>
>  Series applied to master with that fixed, thanks.
>
>  Regards,
>  Arnout
>
>
> >   $(eval $(autotools-package))
> > +$(eval $(host-autotools-package))
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

--
Kamel Bouhara, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
