Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84349C433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 15:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2320B4086A;
	Sun, 20 Feb 2022 15:40:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VvVAuBV5sS20; Sun, 20 Feb 2022 15:40:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 732364067C;
	Sun, 20 Feb 2022 15:40:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 237B21BF303
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 15:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E7F3813B4
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 15:40:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F1AfYq82FsYH for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 15:40:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
 [89.40.174.40])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F130F813AA
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 15:40:12 +0000 (UTC)
Received: from [77.244.183.192] (port=62572 helo=[192.168.178.41])
 by hostingweb31.netsons.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <luca@lucaceresoli.net>)
 id 1nLoJm-000CPS-Ne; Sun, 20 Feb 2022 16:40:10 +0100
Message-ID: <2003d2f6-6938-83b3-fd21-966fecf7e37b@lucaceresoli.net>
Date: Sun, 20 Feb 2022 16:40:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20220219212211.1304441-1-giulio.benetti@benettiengineering.com>
From: Luca Ceresoli <luca@lucaceresoli.net>
In-Reply-To: <20220219212211.1304441-1-giulio.benetti@benettiengineering.com>
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - buildroot.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id:
 luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: [Buildroot] [PATCH v2] manual: board support: add instructions
 to test defconfig in the official docker
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio,


On 19/02/22 22:22, Giulio Benetti wrote:
> Sometimes new boards have not been tested with official docker so let's add
> instructions to do it with utils/docker-run.
> 
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> V1->V2:
> * use the available utils/docker-run
> * improve explanation as suggested by Luca Ceresoli
> ---
>  docs/manual/adding-board-support.txt | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/docs/manual/adding-board-support.txt b/docs/manual/adding-board-support.txt
> index 33ed709535..074bab7a00 100644
> --- a/docs/manual/adding-board-support.txt
> +++ b/docs/manual/adding-board-support.txt
> @@ -46,3 +46,11 @@ create a directory +board/<manufacturer>+ and a subdirectory
>  +board/<manufacturer>/<boardname>+. You can then store your patches
>  and configurations in these directories, and reference them from the main
>  Buildroot configuration. Refer to xref:customize[] for more details.
> +
> +Before submitting patches for new boards it is recommended to test it by
> +building it using latest gitlab-CI docker container. To do this use
> +utils/docker-run script and inside it hint:

Not sure the verb 'hint' is the correct one. I would expect "type" or
"issue these commands" or similar.

> +--------------------
> + $ make +<boardname>_defconfig+
> + $ make
> +--------------------

With that fixed:
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
