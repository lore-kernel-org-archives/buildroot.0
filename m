Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D55CC433EF
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 17:53:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21AC460EDF
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 17:53:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 21AC460EDF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA81460630;
	Wed,  3 Nov 2021 17:53:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fe9jgrYbiwr7; Wed,  3 Nov 2021 17:53:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AE6F605BF;
	Wed,  3 Nov 2021 17:53:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 40EA71BF85D
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 17:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 303C580BB2
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 17:53:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U_ff0CVbYNoP for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 17:53:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 44AE880B66
 for <buildroot@busybox.net>; Wed,  3 Nov 2021 17:53:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 3D248200005;
 Wed,  3 Nov 2021 17:53:30 +0000 (UTC)
Date: Wed, 3 Nov 2021 18:53:29 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Michael Vetter <jubalh@iodoru.org>
Message-ID: <20211103185329.02dcf58e@windsurf>
In-Reply-To: <20211101151005.7313-1-jubalh@iodoru.org>
References: <20211101151005.7313-1-jubalh@iodoru.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libstrophe: bump to version
 0.11.0
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Michael,

On Mon,  1 Nov 2021 16:10:05 +0100
Michael Vetter <jubalh@iodoru.org> wrote:

> Changes:
>   * SASL EXTERNAL support (XEP-0178)
>   * Client certificate can be provided for TLS negotiation.
>     If the certificate contains a single xmppAddr and JID is not
>     provided with xmpp_conn_set_jid(), the xmppAddr is chosen as JID
>     element contains "from" attribute over TLS connections now
>     GnuTLS can be selected optionally with configure script
>   * Support for manual certificate verification
>   * New API:
>     - xmpp_conn_set_client_cert()
>     - xmpp_conn_cert_xmppaddr_num()
>     - xmpp_conn_cert_xmppaddr()
>     - xmpp_conn_set_cafile()
>     - xmpp_conn_set_capath()
>     - xmpp_conn_set_certfail_handler()
>     - xmpp_conn_get_peer_cert()
>     - xmpp_tlscert_get_ctx()
>     - xmpp_tlscert_get_conn()
>     - xmpp_tlscert_get_pem()
>     - xmpp_tlscert_get_dnsname()
>     - xmpp_tlscert_get_string()
>     - xmpp_tlscert_get_description()
>     - xmpp_tlscert_free()
> 
> Signed-off-by: Michael Vetter <jubalh@iodoru.org>
> ---
>  package/libstrophe/libstrophe.hash | 2 +-
>  package/libstrophe/libstrophe.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Sorry, I applied a more recent and different patch from Fabrice doing
the same version bump.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
