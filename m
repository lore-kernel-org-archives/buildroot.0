From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Nov 2014 21:38:58 +0100
Subject: [Buildroot] [PATCH 0/4] pkg-infra: differentiate remote and
 local tarball filenames (branch yem/download)
In-Reply-To: <20141116122210.6b3651e0@free-electrons.com>
References: <cover.1416068004.git.yann.morin.1998@free.fr>
 <20141116122210.6b3651e0@free-electrons.com>
Message-ID: <546BAE62.2020606@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/11/14 12:22, Thomas Petazzoni wrote:
> Dear Yann E. MORIN,
>
> On Sat, 15 Nov 2014 17:19:24 +0100, Yann E. MORIN wrote:
>
> > This series introduces a new variable, FOO_UPSTREAM_SOURCE, so as to be
> > able to differentiate remote and local tarball filenames.
> >
> > This is needed when upstream tarballs are not named the way we expect them
> > to be. For example, the GitHub API only provides a request like:
> >     GET /repos/:owner/:repo/:archive_format/:ref
> >
> > So far, we're not using this API, and directly use a non-stable scheme
> > to retrieve the tarballs. That scheme has proven to break from time to
> > time, so we'll soon need to switch to the API, which is guaranteed to be
> > stable.
> >
> > So, we need to be able to differentiate the filename remote knows the
> > tarball by, and the local filename we want to save that tarball as.
> >
> > Changes to the GitHub helper will come in a later series, because it is
> > a bit more involved, and still needs some ironing out. Alternate forges
> > may also get added in the future, which would require such a feature.
>
> Not directly related, but somewhat related: I have always though that
> our split between <foo>_SITE and <foo>_SOURCE was a bit stupid. Why
> don't we simply give a full URL instead of splitting that between SITE
> and SOURCE ?
>
> The way we do things today also forces the things in <foo>_PATCH and
> <foo>_EXTRA_DOWNLOADS to be under the exact same <foo>_SITE, which
> prevents applying patches from other locations than the original
> package site.
>
> Shouldn't we simply get rid of <pkg>_SITE, and make <pkg>_SOURCE the
> full URL to the tarball / git repo?

 I think there are two reasons for the split:

1. _SOURCE can be dropped if it is <pkg>-<version>.tar.gz - this would be
difficult if we only had _SITE.

2. _PATH and _EXTRA_DOWNLOAD don't need to specify the full URL.


 In my opinion, these reasons are not strong enough to keep the split between
_SITE and _SOURCE.

 So, +1 from me to get rid of _SOURCE.


 Regards,
 Arnout

>
> Best regards,
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
