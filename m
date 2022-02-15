Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2DBBC433EF
	for <buildroot@archiver.kernel.org>; Tue, 15 Feb 2022 00:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27BBE4036E;
	Tue, 15 Feb 2022 00:45:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E2kMlT6r2pR9; Tue, 15 Feb 2022 00:45:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBB3640420;
	Tue, 15 Feb 2022 00:45:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6FC551BF995
 for <buildroot@lists.busybox.net>; Tue, 15 Feb 2022 00:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E3DD4150F
 for <buildroot@lists.busybox.net>; Tue, 15 Feb 2022 00:45:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GWIeQ2u0PK-w for <buildroot@lists.busybox.net>;
 Tue, 15 Feb 2022 00:45:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpweb147.aruba.it (smtpweb147.aruba.it [62.149.158.147])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF13C414E6
 for <buildroot@buildroot.org>; Tue, 15 Feb 2022 00:45:23 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Jly5n8ElRXmFAJly5n8S48; Tue, 15 Feb 2022 01:45:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644885922; bh=UTbqn3Xwv7PbkYj51saM1kzSkdtitnmM5XrJh6M4K2Q=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=EOgz85Gm1VgiqEH3VP+C1qf6mMvbW0SD0Ff/YMDI/gNO+oYPpQ/oQZEVVYAkQr1zk
 56NAoZQg0ncJHwiI3Dln49RhLQEMH/ZBFQLoQ5C3MB5TE+EqqRzgOi9Jq6FGa7e3g1
 l9Qeg2zn4jqjs5fxn10o2EahNLpy4n+NmpbN5r8285UuReRXcWI4iSvUtNQsc/9c5S
 eAEDougKmONCR9I2s7/yUy00a0PmgkscA2KbPun+s7B/8sFZyA6M/ku4YYSSCIeOMm
 xqW6w+u9g4UYClogKkPOxDu2FmjhlaQgIPv2joNq/aJ43kau/jG9tMO1YiPTE/46G4
 ABBdjuLKBKitg==
Message-ID: <14f61987-4c17-533d-97d3-d04dd5ea1949@benettiengineering.com>
Date: Tue, 15 Feb 2022 01:45:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <20220214203909.251924-1-yann.morin.1998@free.fr>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220214203909.251924-1-yann.morin.1998@free.fr>
X-CMAE-Envelope: MS4wfJUY97IITTBgVEl9HUukLWoRo7EyjAbzxdmMtjTgE3k6F6ijXlGRD+0MXpMt64riT1sOSXy/1TXCTRGve2ESNFZ2b57mZ7bARjKj4l6/S66iAWU+nuUu
 UCWkwehCmVOPPxsO2VgGCrdAUMk+aQxMsJdPgrhw/BYvCRcFli/pPhJqTO9SuUx9Y6U+h0Bwc8XNgZszdPB6sB4QHfCEXFcdsfog90721p3L7E7iNFIYSJ2k
 6RqKyPPYCykiUJ4+suju/3hCzqM46/HFx/BFQPh3EltgHccZTDxirV3suGSBvJFG
Subject: Re: [Buildroot] [PATCH] utils/docker-run: improve user experience
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann, Luca, All,

On 14/02/22 21:39, Yann E. MORIN wrote:
> Currently, the docker-run script starts a container based on the
> reference image, in which the user has UID:GID set to 1000:1000,
> which may or may not be the same as local user uses, which may
> prevent the commands in the container from creating files, which
> foils the plan of using the container to run a build...
> 
> Additionally, the paths in the container differ from the paths
> the user expects, as the current Buildroot tree is mounted over
> the in-container user home directory. This is a bit confusing...
> 
> Finally, the container is left hanging around after the command
> finishes, and thus there are as many lingering containers as the
> user runs docker-run. This is not very nice...
> 
> We fix all of that (yeah, should be different patches, but meh):
> 
>    - we use --mount instead of -v, which allows us to bind-mount
>      the Buildroot tree at the same place in the container, as
>      Docker will create the destination if it does not exist, while
>      -v seems to expect it to exist [0].
> 
>    - as a consequence, we can also set the working directory as the
>      Buildroot top-directory;
> 
>    - use --user to force the same UID:GID in the container as the
>      local user, so that files created in the container belong to
>      the local user, and so that files from the local user are
>      accessible from the container;
> 
>    - use --rm do remove the container once it terminates; starting

typo s/do/to

>      a new container is very quick anyway, so it is as good as
>      re-using a previous container.
> 
> [0] the documentation is not clear about that. It clearly states
> that the host directory (i.e. the origin, the source) is created
> if missing, but it says nothing of the destination:
>      https://docs.docker.com/engine/reference/commandline/run/#mount-volume--v---read-only
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>   utils/docker-run | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/utils/docker-run b/utils/docker-run
> index 2bca8d8e3a..bdbc979264 100755
> --- a/utils/docker-run
> +++ b/utils/docker-run
> @@ -7,4 +7,8 @@ IMAGE=$(grep ^image: "${MAIN_DIR}/.gitlab-ci.yml" | \
>           sed -e 's,^image: ,,g' | sed -e 's,\$CI_REGISTRY,registry.gitlab.com,g')
>   
>   set -x
> -exec docker run -v "${MAIN_DIR}:/home/br-user" -it "${IMAGE}" "$@"
> +exec docker run -it --rm \
> +    --user $(id -u):$(id -g) \
> +    --mount "type=bind,src=${MAIN_DIR},dst=${MAIN_DIR}" \
> +    --workdir "${MAIN_DIR}" \
> +    "${IMAGE}" "${@}"

I've tested without UID:GID != 1000, but it works perfectly, so:
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
