From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Wed, 05 Oct 2016 10:54:28 +0200
Subject: [Buildroot] [PATCH 1/2] check-host-rpath: support symlinks in
	rpath
In-Reply-To: <8fb2b678-db51-9ba7-c07d-d7956c9708db@mind.be>
References: <1475230194-18524-1-git-send-email-jezz@sysmic.org>
 <1475230194-18524-2-git-send-email-jezz@sysmic.org>
 <8fb2b678-db51-9ba7-c07d-d7956c9708db@mind.be>
Message-ID: <2359483.ncWTPxTSyx@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Tuesday 04 October 2016 23:33:34 Arnout Vandecappelle wrote:
> On 30-09-16 12:09, J?r?me Pouiller wrote:
> > If compilation path contains symlinks, rpath may sometime contains
> > symlinks and sometime canonicalized path.
> > 
> > A pratical example:
> >   $ ln -s /opt/buildroot /opt/buildroot-symblink
> >   $ cd /opt/buildroot-symlink
> >   $ make O=out
> >   $ make -C out package-rebuild
> > 
> > This last command produce an error since already installed host
> > binaries contains /opt/buildroot/out/host/usr/lib as rpath while
> > check-host-rpath expect /opt/buildroot-symlink/out/host/usr/lib
> > 
> > This patch canonicalize all paths used in check-host-rpath in order
> > to avoid problem
> 
>  Wouldn't this also be fixed by
> http://patchwork.ozlabs.org/patch/613854/ ? With that patch (series)
> applied, there shouldn't be any symlinks anymore once the real make
> starts.

I didn't saw Samuel's patch. I will test it soon. I think it supersede 
mine.

BR,

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
