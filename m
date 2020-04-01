From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 1 Apr 2020 18:37:35 +0200
Subject: [Buildroot] kmscube: cannot fetch from cgit.freedesktop.org
In-Reply-To: <CAOMZO5B2ox8cpL8rMGrqD=gDg7-PVyiV7T_ci_8zFfSFMSq-Og@mail.gmail.com>
References: <CAOMZO5B2ox8cpL8rMGrqD=gDg7-PVyiV7T_ci_8zFfSFMSq-Og@mail.gmail.com>
Message-ID: <9157c7b4-716b-dd9d-3ab7-5ff7ce411183@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01/04/2020 18:29, Fabio Estevam wrote:
> Hi,
> 
> I need to upgrade kmscube in Buildroot to the latest commit and this
> is how I did it:
[snip[
> -KMSCUBE_VERSION = 6cbd03ab94066dddbba7bedfde87c7c4319c18d5
> +KMSCUBE_VERSION = 4660a7dca6512b6e658759d00cff7d4ad2a2059d
>  KMSCUBE_SITE = https://cgit.freedesktop.org/mesa/kmscube/snapshot
[snip]
> https://cgit.freedesktop.org/mesa/kmscube/snapshot/kmscube-4660a7dca6512b6e658759d00cff7d4ad2a2059d.tar.gz
> Resolving cgit.freedesktop.org (cgit.freedesktop.org)... 131.252.210.161
> Connecting to cgit.freedesktop.org
> (cgit.freedesktop.org)|131.252.210.161|:443... connected.
> HTTP request sent, awaiting response... 400 Bad request
> 2020-04-01 13:26:04 ERROR 400: Bad request.

 Indeed, cgit doesn't have archive downloads, so this wouldn't work.

[snip]
> wget "https://gitlab.freedesktop.org/mesa/kmscube/repository/archive.tar.gz?ref=4660a7dca6512b6e658759d00cff7d4ad2a2059d"
> -O archive.tar.gz

 The proper way would be:

KMSCUBE_SITE =
https://gitlab.freedesktop.org/mesa/kmscube/-/archive/$(KMSCUBE_VERSION)


 Regards,
 Arnout


> It seems that the current kmscube version only builds in Buildroot
> because it is fetched from Buildroot's mirrror.
> 
> If I mirror the https://cgit.freedesktop.org/mesa/kmscube into my own
> github, then I can make Buildroot to fetch it and build it.
> 
> Any comments/ideas as to how to fix this?
> 
> Thanks,
> 
> Fabio Estevam
> 
