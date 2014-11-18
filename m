From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Nov 2014 22:50:29 +0100
Subject: [Buildroot] [PATCH 0/4] pkg-infra: differentiate remote and
 local tarball filenames (branch yem/download)
In-Reply-To: <20141118220357.74bc954c@free-electrons.com>
References: <cover.1416068004.git.yann.morin.1998@free.fr>	<20141116122210.6b3651e0@free-electrons.com>	<546BAE62.2020606@mind.be>
 <20141118220357.74bc954c@free-electrons.com>
Message-ID: <546BBF25.7020205@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/11/14 22:03, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
>
> On Tue, 18 Nov 2014 21:38:58 +0100, Arnout Vandecappelle wrote:
>
> >  I think there are two reasons for the split:
> >
> > 1. _SOURCE can be dropped if it is <pkg>-<version>.tar.gz - this would be
> > difficult if we only had _SITE.
>
> True. But on the other hand, the fact that we use
> <pkg>-<version>.tar.gz by default has always confused newcomers a bit,
> and with .tar.xz becoming more and more adopted, having .tar.gz as the
> default is less obvious than it used to be.
>
> > 2. _PATH and _EXTRA_DOWNLOAD don't need to specify the full URL.
>
> Well, yes, but that's specifically the issue I raised: since you don't
> specify the full URL, there's no way for the package to download
> patches or other stuff from other places than <pkg>_SITE.

 I completely agree, just pointing out the (historical) reasons why the split
exists.

 Regards,
 Arnout

>
> Thomas
>


-- 
Arnout Vandecappelle arnout at mind be
Senior Embedded Software Architect +32-16-286500
Essensium/Mind http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint: 7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
