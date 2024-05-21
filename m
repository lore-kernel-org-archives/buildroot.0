Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA254C25B74
	for <buildroot@archiver.kernel.org>; Tue, 21 May 2024 20:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F2B1405E1;
	Tue, 21 May 2024 20:17:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id etO4UgXbNEmh; Tue, 21 May 2024 20:17:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43C88406CF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43C88406CF;
	Tue, 21 May 2024 20:17:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8026F1BF27C
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 20:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A4DC60A53
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 20:17:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id agueULtOIU4e for <buildroot@lists.busybox.net>;
 Tue, 21 May 2024 20:17:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7188E60A51
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7188E60A51
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7188E60A51
 for <buildroot@buildroot.org>; Tue, 21 May 2024 20:17:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D3FDA20003;
 Tue, 21 May 2024 20:17:06 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s9Vv0-009vyJ-0K;
 Tue, 21 May 2024 22:17:06 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240504093446.376426-1-fontaine.fabrice@gmail.com>
Date: Tue, 21 May 2024 22:17:06 +0200
In-Reply-To: <20240504093446.376426-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 4 May 2024 11:34:46 +0200")
Message-ID: <87h6eqncn1.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/proj: needs NPTL
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
Cc: Murat Demirten <mdemirten@yh.com.tr>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>, Maxim Kochetkov <fido_max@inbox.ru>,
 Dominik Michael Rauh <dmrauh@posteo.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > NPTL is mandatory since bump to version 9.3.0 in commit
 > 57aba033e6cc81b95d006227c45a15eb3fc77d07 and
 > https://github.com/OSGeo/PROJ/commit/ce080251225d16e11e139a5ebe07cf608fe022b2:

 > /home/buildroot/instance-0/output-1/build/proj-9.3.0/src/iso19111/factory.cpp:
 > In member function 'std::shared_ptr<osgeo::proj::io::SQLiteHandle>
 > osgeo::proj::io::SQLiteHandleCache::getHandle(const std::string&,
 > PJ_CONTEXT*)':
 > /home/buildroot/instance-0/output-1/build/proj-9.3.0/src/iso19111/factory.cpp:622:9:
 > error: 'pthread_atfork' was not declared in this scope; did you mean
 > 'pthread_attr_t'?
 >   622 |         pthread_atfork(nullptr, nullptr,
 >       |         ^~~~~~~~~~~~~~
 >       |         pthread_attr_t

 > Fixes: 57aba033e6cc81b95d006227c45a15eb3fc77d07
 >  - http://autobuild.buildroot.org/results/392664375c5bc5f047d39bff31534a226e8ea526

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
