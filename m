From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 7 Aug 2020 22:56:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/apache: security bump version
 to 2.4.46
In-Reply-To: <20200807192657.GJ2186@scaer>
References: <20200807171100.220432-1-bernd.kuhls@t-online.de>
 <20200807192657.GJ2186@scaer>
Message-ID: <20200807225632.41b7c8d0@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann, *,

On Fri, 7 Aug 2020 21:26:57 +0200, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Bernd, All,
>
> On 2020-08-07 19:11 +0200, Bernd Kuhls spake thusly:
> > Changelog: http://archive.apache.org/dist/httpd/CHANGES_2.4.46
> >
> > Release notes: https://downloads.apache.org/httpd/Announcement2.4.html
> >
> > Fixes CVE-2020-9490, CVE-2020-11984 & CVE-2020-11993:
> > https://httpd.apache.org/security/vulnerabilities_24.html
> >
> > Added all hashes provided by upstream.
>
> md5 and sha1 are broken nowadays, so adding them is not interesting at
> all, when there are better hashes available, which is the case here.

If this handling is the new rule, then it is time to update the docs
stating 'If upstream provides more than one type of hash (e.g. sha1 and sha512),
then it is best to add all those hashes in the .hash file.'?

Regards,
Peter

>
> So I've dropped md5 and sha1, and used a single comment to refer to both
> upstream locations.
>
> Applied to master, thanks.
>
> > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> > ---
> >  package/apache/apache.hash | 10 ++++++++--
> >  package/apache/apache.mk   |  2 +-
> >  2 files changed, 9 insertions(+), 3 deletions(-)
> >
> > diff --git a/package/apache/apache.hash b/package/apache/apache.hash
> > index 7b0e4ad8e7..4fe457d701 100644
> > --- a/package/apache/apache.hash
> > +++ b/package/apache/apache.hash
> > @@ -1,4 +1,10 @@
> > -# From http://archive.apache.org/dist/httpd/httpd-2.4.43.tar.bz2.sha256
> > -sha256  a497652ab3fc81318cdc2a203090a999150d86461acff97c1065dc910fe10f43  httpd-2.4.43.tar.bz2
> > +# From http://archive.apache.org/dist/httpd/httpd-2.4.46.tar.bz2.md5
> > +md5  7d661ea5e736dac5e2761d9f49fe8361  httpd-2.4.46.tar.bz2
> > +# From http://archive.apache.org/dist/httpd/httpd-2.4.46.tar.bz2.sha1
> > +sha1  1b7cd10ff3a2a07a576d77e34f0204d95fa4aceb  httpd-2.4.46.tar.bz2
> > +# From http://archive.apache.org/dist/httpd/httpd-2.4.46.tar.bz2.sha256
> > +sha256  740eddf6e1c641992b22359cabc66e6325868c3c5e2e3f98faf349b61ecf41ea  httpd-2.4.46.tar.bz2
> > +# From http://archive.apache.org/dist/httpd/httpd-2.4.46.tar.bz2.sha512
> > +sha512  5936784bb662e9d8a4f7fe38b70c043b468114d931cd10ea831bfe74461ea5856b64f88f42c567ab791fc8907640a99884ba4b6a600f86d661781812735b6f13  httpd-2.4.46.tar.bz2
> >  # Locally computed
> >  sha256  47b8c2b6c3309282a99d4a3001575c790fead690cc14734628c4667d2bbffc43  LICENSE
> > diff --git a/package/apache/apache.mk b/package/apache/apache.mk
> > index 068f36e325..203d637fbb 100644
> > --- a/package/apache/apache.mk
> > +++ b/package/apache/apache.mk
> > @@ -4,7 +4,7 @@
> >  #
> >  ################################################################################
> >
> > -APACHE_VERSION = 2.4.43
> > +APACHE_VERSION = 2.4.46
> >  APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
> >  APACHE_SITE = http://archive.apache.org/dist/httpd
> >  APACHE_LICENSE = Apache-2.0
> > --
> > 2.27.0
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
