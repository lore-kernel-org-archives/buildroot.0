Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 358D9C433F5
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 21:49:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4BC661139
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 21:49:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C4BC661139
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9782280B29;
	Wed,  3 Nov 2021 21:49:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MWC2h9txTqPs; Wed,  3 Nov 2021 21:49:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05D3480B23;
	Wed,  3 Nov 2021 21:49:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 62CA51BF38A
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 21:49:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5259580B23
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 21:49:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z0bG7HAOQ7Y8 for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 21:49:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3F6F680B1F
 for <buildroot@busybox.net>; Wed,  3 Nov 2021 21:49:39 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 1530FE0005;
 Wed,  3 Nov 2021 21:49:37 +0000 (UTC)
Date: Wed, 3 Nov 2021 22:49:36 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Michael Vetter <jubalh@iodoru.org>
Message-ID: <20211103224936.2ad9c3f2@windsurf>
In-Reply-To: <20211101150325.6415-1-jubalh@iodoru.org>
References: <20211101150325.6415-1-jubalh@iodoru.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/jasper: bump version to 2.0.33
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

On Mon,  1 Nov 2021 16:03:25 +0100
Michael Vetter <jubalh@iodoru.org> wrote:

> Changes:
>   * Fix a JP2/JPC decoder bug.
>   * Fix a build issue impacting some platforms.
> 
> Signed-off-by: Michael Vetter <jubalh@iodoru.org>
> ---
>  package/jasper/jasper.hash | 2 +-
>  package/jasper/jasper.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/jasper/jasper.hash b/package/jasper/jasper.hash
> index 67653a8e88..49d18dc34f 100644
> --- a/package/jasper/jasper.hash
> +++ b/package/jasper/jasper.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  6b4e5f682be0ab1a5acb0eeb6bf41d6ce17a658bb8e2dbda95de40100939cc88  jasper-2.0.28.tar.gz
> +sha256  28d28290cc2eaf70c8756d391ed8bcc8ab809a895b9a67ea6e89da23a611801a  jasper-2.0.28.tar.gz

Thanks for the patch, but are you sure this can work ? I'm pretty sure
with this patch, the package doesn't build :/

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
