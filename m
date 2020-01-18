From: Carlos Santos <unixmania@gmail.com>
Date: Sat, 18 Jan 2020 11:12:31 -0300
Subject: [Buildroot] [PATCH v3 next] package/tar: bump target version to
 1.32 (host is kept at 1.29)
In-Reply-To: <20200118123934.GV22540@scaer>
References: <20191119121831.2329-1-unixmania@gmail.com>
 <20200118123934.GV22540@scaer>
Message-ID: <CAJ4jsae+9emfBSo1x9CHsNszj62fMx6Su-Jixp_OsbJbYL4ucw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jan 18, 2020 at 9:39 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Luc, Carlos, All,
>
> On 2019-11-19 09:18 -0300, unixmania at gmail.com spake thusly:
> > From: Luc Creti <luc.creti@atos.net>
> >
> > The host tar is used to create the archives in the VCS download backends
> > (git, cvs, svn, hg...) and tar 1.30 and forward have changed the way
> > they generate the archives.
> >
> > So, all the archives that have been generated before 1.30 was released
> > are not bit-for-bit reproducible (even though the extracted content
> > would be), so the hashes we have for those archives would not match.
> >
> > Hence host-tar must be kept at version 1.29.
> >
> > For the target variant, this is less important, so bump it to the latest
> > version.
> >
> > Fixes: https://bugs.busybox.net/show_bug.cgi?id=12256
> >
> > Signed-off-by: Luc Creti <luc.creti@atos.net>
> > Signed-off-by: Carlos Santos <unixmania@gmail.com>
>
> Thanks for the reiterated attempts at bumping tar. I've now applied this
> version of the patch, which has the great advantage of not patching tar.
>
> Applied to master, with all the host-related commentsd and variables
> moved down to gether. Thanks.

Can't we at least get rid of the cpio thing, as done in v5?

-- 
Carlos Santos <unixmania@gmail.com>
