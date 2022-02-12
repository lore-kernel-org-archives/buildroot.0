Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6540C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 22:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 605AC60A87;
	Sat, 12 Feb 2022 22:56:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oTbRTX3K2sz3; Sat, 12 Feb 2022 22:56:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76EDA608A6;
	Sat, 12 Feb 2022 22:56:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E61641BF3AF
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 22:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D06044034A
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 22:56:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RPCzE-8lkrXE for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 22:56:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
 [89.40.174.40])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ADC2440343
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 22:56:29 +0000 (UTC)
Received: from [77.244.183.192] (port=63178 helo=[192.168.178.41])
 by hostingweb31.netsons.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <luca@lucaceresoli.net>)
 id 1nJ1Ja-0003kt-QP; Sat, 12 Feb 2022 23:56:26 +0100
Message-ID: <eff4604f-7630-d8d3-6ebb-dfbef57b8663@lucaceresoli.net>
Date: Sat, 12 Feb 2022 23:56:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20220203235438.610277-1-giulio.benetti@benettiengineering.com>
From: Luca Ceresoli <luca@lucaceresoli.net>
In-Reply-To: <20220203235438.610277-1-giulio.benetti@benettiengineering.com>
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
Subject: Re: [Buildroot] [PATCH] manual: board support: add instructions to
 test defconfig in the official docker
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

On 04/02/22 00:54, Giulio Benetti wrote:
> Often new boards have not been tested with official docker so let's add
> instructions to do it.

Thank you, I think this is a very useful addition to the documentation!
However I would suggest some changes for it to look more "professional".

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  docs/manual/adding-board-support.txt | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/docs/manual/adding-board-support.txt b/docs/manual/adding-board-support.txt
> index 33ed709535..f5fb3af371 100644
> --- a/docs/manual/adding-board-support.txt
> +++ b/docs/manual/adding-board-support.txt
> @@ -46,3 +46,25 @@ create a directory +board/<manufacturer>+ and a subdirectory
>  +board/<manufacturer>/<boardname>+. You can then store your patches
>  and configurations in these directories, and reference them from the main
>  Buildroot configuration. Refer to xref:customize[] for more details.
> +
> +Before submitting patches for new boards it would be better to test it

"it would be better" -> "it is recommended".

> +by building it using .gitlab-ci.yml specified docker. For example at the

I think this should be reworded in a simpler way: "by building it using
the docker specified in .gitlab-ci.yml".

BTW as I am a docker newbie: is it common to say "the docker"? Or would
"the docker container" be more correct? -- By comparison, I would never
say "using the virtualbox" but rather "using the virtualbox machine".

> +time of this writing the docker is:

Remove the ':' from this line, or you'll have multiple ':' per line,
which looks awkward.

> +$CI_REGISTRY/buildroot.org/buildroot/base:20220105.2314

Hm, this string is already old. There's no sane way to keep docs and
.yml in sync. I wonder whether we should have in the manual a command
line that always use the current string, such as:

DOCKER_IMAGE=$(cat .gitlab-ci.yml | \
               sed -n '/^image/s/^.*CI_REGISTRY/registry.gitlab.com/p')
docker pull $DOCKER_IMAGE
sudo docker run -it  $DOCKER_IMAGE

However I must admit this is not very readable in the docs... :( What
about adding a simple script (utils/run-docker?) that does the trick and
just mention that in the docs?

> +so:

Add an empty line here, so that the output separates from the next line.

> +Pull the docker:
> +--------------------
> + $ docker pull registry.gitlab.com/buildroot.org/buildroot/base:20220105.2314

Missing 'sudo'?

> +--------------------

Add an empty line here. This has no effect on the output but makes
source code more readable.

> +Run the docker:
> +--------------------
> + $ sudo docker run -it registry.gitlab.com/buildroot.org/buildroot/base:20220105.2314 /bin/bash
> +--------------------

As above, add an empty line here.

> +Inside the docker hint:
> +--------------------
> + $ git clone git://git.busybox.net/buildroot
> + $ cd buildroot
> + $ make +<boardname>_defconfig+
> + $ make
> +--------------------

As above, add an empty line here.

> +Wait until build finishes and eventually add host dependencies.

If I understand what you mean here, it should be "and add host
dependencies if needed" ("eventually" is not the english translation of
italian "eventualmente"). If my understanding is correct, I don't find
this sentence very useful: a docker newbie perhaps doesn't know how to
add a host dependency (and maybe not even how to understand that they
are missing one).

I would just remove this line, but if you think it is very important I'd
clarify it, maybe with some examples.

-- 
Luca
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
