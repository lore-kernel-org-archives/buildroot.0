Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A2BC433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 13:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1279283E3B;
	Sat, 12 Feb 2022 13:51:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RXXHiBofMocC; Sat, 12 Feb 2022 13:51:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B00783E12;
	Sat, 12 Feb 2022 13:51:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 779091BF283
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 13:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 65AA861B82
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 13:51:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MiMxVAthxaRj for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 13:51:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7346360A75
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 13:51:50 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 10FBD60002;
 Sat, 12 Feb 2022 13:51:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nIsoL-0005ww-C9; Sat, 12 Feb 2022 14:51:37 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20220212104349.6015-1-peter@korsgaard.com>
Date: Sat, 12 Feb 2022 14:51:37 +0100
In-Reply-To: <20220212104349.6015-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 12 Feb 2022 11:43:48 +0100")
Message-ID: <87y22gmbva.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/python-*: drop python3 dependency
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
Cc: Uladzimir Bely <wiselord1983@gmail.com>,
 Louis Aussedat <aussedat.louis@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Sven Haardiek <sven.haardiek@iotec-gmbh.de>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mauro Condarelli <mc5686@mclink.it>, Joseph Kogut <joseph.kogut@gmail.com>,
 Matt Weber <matthew.weber@collins.com>,
 Geoffrey Ragot <geoffreyragot@gmail.com>,
 Philippe Proulx <eeppeliteloop@gmail.com>,
 =?utf-8?Q?Rapha=C3=ABl_M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Grzegorz Blach <grzegorz@blach.pl>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Titouan Christophe <titouanchristophe@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Peter Seiderer <ps.report@gmx.net>, Oli Vogt <oli.vogt.pub01@gmail.com>,
 Bernd Kuhls <bernd.kuhls@t-online.de>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 =?utf-8?Q?Jos=C3=A9?= Pekkarinen <jose.pekkarinen@unikie.com>,
 Manuel =?utf-8?Q?V=C3=B6gele?= <develop@manuel-voegele.de>,
 Steve Calfee <stevecalfee@gmail.com>, Lionel Flandrin <lionel@svkt.org>,
 Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Asaf Kahlon <asafka7@gmail.com>, "Wojciech M. Zabolotny" <wzab01@gmail.com>,
 Joris Offouga <offougajoris@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, John Faith <jfaith@impinj.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > All the python packages are inside an if BR2_PACKAGE_PYTHON3, so with the
 > removal of python2 support, the explicit python3 dependency is redundant.
 > Remove it.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
