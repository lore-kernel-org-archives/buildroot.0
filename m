Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1204AC25B76
	for <buildroot@archiver.kernel.org>; Sat,  1 Jun 2024 09:45:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D180F605C3;
	Sat,  1 Jun 2024 09:45:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n-FoZzpsABeh; Sat,  1 Jun 2024 09:45:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4728605D1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4728605D1;
	Sat,  1 Jun 2024 09:45:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 175721BF841
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 09:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 113FD605DC
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 09:45:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mRmA5tKrlr2h for <buildroot@lists.busybox.net>;
 Sat,  1 Jun 2024 09:45:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6A26D605C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A26D605C3
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6A26D605C3
 for <buildroot@buildroot.org>; Sat,  1 Jun 2024 09:45:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id CF49C19F593;
 Sat,  1 Jun 2024 11:45:17 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:34170])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 01 Jun 2024 11:45:17 +0200
MIME-Version: 1.0
Date: Sat, 01 Jun 2024 11:45:17 +0200
From: Julien Olivain <ju.o@free.fr>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
In-Reply-To: <ZlouaKs-LeeUbKc-@landeda>
References: <20240531195107.125727-1-ju.o@free.fr> <ZlouaKs-LeeUbKc-@landeda>
User-Agent: Webmail Free/1.6.5
Message-ID: <1cf5dea409e7ca396f91d014e7836fba@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717235120;
 bh=wn3H+Tkdx8ueQNfiZRvawsb1om6uIO/Ax1dAez57a34=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uFT7cLQG+5Rgygy52bQDr3nlLZQkgTd5w3j8WdaHnkybeTpFgIjWXRr4F4WolPlun
 F/ORIbI10U6F6jWLVEuNY3FwVXR0OqF2Zfv9Y+S72uZZveXhD89sZOdcVeYt/JRs9W
 QhRo3kBuTSdki5c7X15qvW+FEtHKpYwFTt/uhg8Xw8szrK7ZsR13VYnnFP3oh0jPBp
 T+Kdy0Xd7A1CT1HFN64S2Ww1JSegStTU9Wh3z8412boXSYEJW65hBmhRKuTSYrghto
 vSsQRo5QgM22UMsJ0nsrsi5SPjHoFanjTHWxj93It1kpm89xlT9WAEJOXaJn9raZPI
 SHPYg8hPuSqxw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uFT7cLQG
Subject: Re: [Buildroot] [PATCH next 1/1] utils/docker-run: check for podman
 before docker
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On 31/05/2024 22:09, Yann E. MORIN wrote:
> Julien, All,
> 
> On 2024-05-31 21:51 +0200, Julien Olivain spake thusly:
>> Commit 9a629f5 "utils/docker-run: allow running with Podman" added an
>> option on system providing the podman command. This case is mainly
>> for Fedora systems.
>> 
>> Fedora repositories has a podman-docker package, that provide the
>> docker command for compatibility. See [1].
>> 
>> When this package is installed on a Fedora system, both the docker and
>> podman commands are available. Since the docker command is checked
>> before podman, the --userns option is not passed in that case. This
>> brings "permission denied" errors.
>> 
>> This commit inverses the command check order, to check for podman
>> before docker. This makes sure this mechanisms will work when both
>> commands.
> 
> When I applied the patch, my reasoning was that we wanted to keep
> checking for docker first, to keep the current behaviour for those that
> have docker-the-real-thing installed along with podman, to avoid any
> surprise. So I think we should keep using docker if it is installed,
> even if podman is installed too.
> 
> So...
> 
>> Note that the same behavior of the --userns=keepid option can be
>> achieved by setting the environment variable "PODMAN_USERNS=keep-id".
>> See podman-run man page [2].
> 
> Why can't we export PODMAN_USERNS=keep-id, and keep the ordering, like
> so (elidded for brevity):
> 
>     if command -v docker >/dev/null; then
>         DOCKER="docker"
>     elif command -v podman >/dev/null; then
>         DOCKER="podman"
>     endif
>     exec PODMAN_USERNS=keep-id ${DOCKER} run blablabla
> 
> That way, we keep to using docker first; if that is a real docker, it
> would just not act on PODMAN_USERNS, but if it is podman-as-docker, 
> then
> it would honor it. If docker is not installed but podman is, then it
> would also honor it.
> 
> Thoughts?

Good point. I'll propose a v2 patch that will:
- keep the original order (docker first)
- set the userns with the environment variable globally,
   rather than by command line argument.

This way, it will work in all cases (no podman, Fedora with
podman-docker, Fedora without podman-docker), while preserving
the original behavior.

For clarity, I think I'll do an "export PODMAN_USERNS=keep-id" to
add a comment before it, rather than an "exec PODMAN_USERNS=keepid
${DOCKER} run ...".

> Regards,
> Yann E. MORIN.
> 
>> [1] https://packages.fedoraproject.org/pkgs/podman/podman-docker/
>> [2] https://docs.podman.io/en/latest/markdown/podman-run.1.html
>> 
>> Signed-off-by: Julien Olivain <ju.o@free.fr>
>> ---
>>  utils/docker-run | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>> 
>> diff --git a/utils/docker-run b/utils/docker-run
>> index 3dcabe2718b..51390945119 100755
>> --- a/utils/docker-run
>> +++ b/utils/docker-run
>> @@ -29,11 +29,11 @@ declare -a mountpoints=(
>>      "$(pwd)"
>>  )
>> 
>> -if command -v docker >/dev/null; then
>> -    DOCKER="docker"
>> -elif command -v podman >/dev/null; then
>> +if command -v podman >/dev/null; then
>>      DOCKER="podman"
>>      docker_opts+=( --userns=keep-id )
>> +elif command -v docker >/dev/null; then
>> +    DOCKER="docker"
>>  else
>>      echo "ERROR: Neither docker nor podman available!" >&2
>>      exit 1
>> --
>> 2.45.1
>> 
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' 
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___        
>        |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There 
> is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   
> conspiracy.  |
> '------------------------------^-------^------------------^--------------------'

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
