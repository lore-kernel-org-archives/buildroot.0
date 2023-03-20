Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44916C6FD1D
	for <buildroot@archiver.kernel.org>; Mon, 20 Mar 2023 08:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD26E60BF8;
	Mon, 20 Mar 2023 08:42:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD26E60BF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q_vW8FPf4K6l; Mon, 20 Mar 2023 08:42:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EABA60BE6;
	Mon, 20 Mar 2023 08:42:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EABA60BE6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 524E51BF35B
 for <buildroot@lists.busybox.net>; Mon, 20 Mar 2023 08:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2DD0D40139
 for <buildroot@lists.busybox.net>; Mon, 20 Mar 2023 08:42:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DD0D40139
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2n_Sz51mA4J5 for <buildroot@lists.busybox.net>;
 Mon, 20 Mar 2023 08:42:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CA70400F8
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0CA70400F8
 for <buildroot@buildroot.org>; Mon, 20 Mar 2023 08:42:54 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BA3E0100020;
 Mon, 20 Mar 2023 08:42:47 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1peB6M-007ZXf-Jk; Mon, 20 Mar 2023 09:42:46 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Peter Seiderer <ps.report@gmx.net>
References: <20230317193326.17298-1-ps.report@gmx.net>
Date: Mon, 20 Mar 2023 09:42:46 +0100
In-Reply-To: <20230317193326.17298-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Fri, 17 Mar 2023 20:33:26 +0100")
Message-ID: <87a607x189.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1] package/qt6base: network module needs
 libopenssl PSK feature
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Fixes:
 >   - http://autobuild.buildroot.net/results/fdf2b2eb252a24e81bddad1c81c4fdfb03dc0afe

 >   .../build/qt6base-6.4.2/src/plugins/tls/openssl/qdtls_openssl.cpp: In member function 'bool dtlsopenssl::DtlsState::initCtxAndConnection(QDtlsBasePrivate*)':
 >   .../build/qt6base-6.4.2/src/plugins/tls/openssl/qdtls_openssl.cpp:669:9: error: 'q_SSL_set_psk_server_callback' was not declared in this scope; did you mean 'q_SSL_set_psk_use_session_callback'?
 >     669 |         q_SSL_set_psk_server_callback(newConnection.data(), dtlscallbacks::q_PSK_server_callback);
 >         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 >         |         q_SSL_set_psk_use_session_callback
 >   .../build/qt6base-6.4.2/src/plugins/tls/openssl/qdtls_openssl.cpp:671:9:
 > error: 'q_SSL_set_psk_client_callback' was not declared in this scope;
 > did you mean 'q_SSL_set_info_callback'?
 >     671 |         q_SSL_set_psk_client_callback(newConnection.data(), dtlscallbacks::q_PSK_client_callback);
 >         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 >         |         q_SSL_set_info_callback

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed to 2023.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
