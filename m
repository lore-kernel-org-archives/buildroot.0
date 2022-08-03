Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E63C19F2B
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 21:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A7E460A9E;
	Wed,  3 Aug 2022 21:46:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A7E460A9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 789IfdxCyY9R; Wed,  3 Aug 2022 21:46:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E8E6607F9;
	Wed,  3 Aug 2022 21:46:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E8E6607F9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 167921BF325
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 21:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DCA64607F9
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 21:46:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCA64607F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ScCl7mMBtyqr for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 21:46:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DE536079D
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8DE536079D
 for <buildroot@buildroot.org>; Wed,  3 Aug 2022 21:46:45 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DB54420002;
 Wed,  3 Aug 2022 21:46:42 +0000 (UTC)
Date: Wed, 3 Aug 2022 23:46:41 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220803234641.346d9c9c@windsurf>
In-Reply-To: <20220313171355.271345-2-james.hilliard1@gmail.com>
References: <20220313171355.271345-1-james.hilliard1@gmail.com>
 <20220313171355.271345-2-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659563203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sgUcday8j0i1Sr0fvw6O2aG506DaSVtISeKoCDrplKQ=;
 b=Qwf9IP1BtF6n4gWC+VdzQlPETp/MmpkyzR3p5WYKkf83gnoIt7oRVM2PTfMdnUeHYfFqND
 HampK8+U26Kjrs8cFhhBDAC6+l28e1twEtqHpPgj0E+7ORsf56GTJ4nKishyVrryzRjTdh
 uWzTFx+8OL/j2nRixx/I/qq3TW5MoH+2Mc2cCVt2CEH3d+doHmis7KCEswG0Gb/58/LE8+
 J2NBiIvcunWYEjepobIlc5J5pR6WodOmQlAhkmIuIQ7D4UaZJoRPQSr1Ss0RCUpnGtBsA+
 UUXb4iAkZqZ4DLt058dUt7gnvkWZH2fbomieCo+jpPBhPLyf401rzG2iJlKlpw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Qwf9IP1B
Subject: Re: [Buildroot] [PATCH v2 2/2] utils/scanpypi: add flit package
 support
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 13 Mar 2022 11:13:55 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> +def toml_load(f):
> +    with open(f, 'rb') as fh:
> +        ex = None
> +
> +        # Try regular tomli first
> +        try:
> +            from tomli import load
> +            return load(fh)
> +        except ImportError as e:
> +            ex = e
> +
> +        # Try pip's vendored tomli
> +        try:
> +            from pip._vendor.tomli import load
> +            try:
> +                return load(fh)
> +            except TypeError:
> +                # Fallback to handle older version
> +                try:
> +                    fh.seek(0)
> +                    w = io.TextIOWrapper(fh, encoding="utf8", newline="")
> +                    return load(w)
> +                finally:
> +                    w.detach()
> +        except ImportError as e:
> +            pass
> +
> +        # Try regular toml last
> +        try:
> +            from toml import load
> +            fh.seek(0)
> +            w = io.TextIOWrapper(fh, encoding="utf8", newline="")
> +            try:
> +                return load(w)
> +            finally:
> +                w.detach()
> +        except ImportError:
> +            pass
> +
> +        print('This package needs tomli')
> +        raise ex

I'm confused by how "ex" gets used here. It's initially none, and it's
set to the ImportError exception if the tomli module couldn't be used.

>      def get_requirements(self, pkg_folder):
>          """
>          Retrieve dependencies from the metadata found in the setup.py script of
> @@ -694,9 +767,12 @@ def main():
>              except ImportError as err:
>                  if 'buildutils' in str(err):
>                      print('This package needs buildutils')
> +                    continue
>                  else:
> -                    raise
> -                continue
> +                    try:
> +                        package.load_pyproject()
> +                    except Exception as e:
> +                        raise

I really don't like the construction here. We're doing this:

	try:
		... do an attempt with traditional setup.py ...
	expect ImportError as err:
		...
		try:
			... do an attempt with pyproject.toml ...
		expect Exception as e:
			...

So, if get a third and then a fourth method of Python module packaging,
we will end up with:

	try:
		... do an attempt with traditional setup.py ...
	expect ImportError as err:
		...
		try:
			... do an attempt with pyproject.toml ...
		expect Exception as e:
			...
			try:
				... do an attempt with another method
			except:
				try:
					... do an attempt with another method
				except:

Clearly ugly. Can we have a better construct? I would know how to do
that in C, but I'm not very good at Python-ic constructs.
				
Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
