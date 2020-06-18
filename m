From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Jun 2020 23:18:13 +0200
Subject: [Buildroot] [git commit] package/python-colorzero: new package
In-Reply-To: <20200618222547.3fb85f94@gmx.net>
References: <20200618194318.944C282B7D@busybox.osuosl.org>
 <20200618222547.3fb85f94@gmx.net>
Message-ID: <20200618231813.285cdace@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 18 Jun 2020 22:25:47 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> > diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> > index c1f41fc9e8..4d76ca32f9 100755
> > --- a/support/scripts/pkg-stats
> > +++ b/support/scripts/pkg-stats
> > @@ -383,6 +383,8 @@ class CVE:
> >                      if not hasattr(cve_affected_version, "version"):
> >                          print("Cannot parse CVE affected version '%s'" % v["version_value"])
> >                          continue
> > +                    print(pkg_version)
> > +                    print(cve_affected_version)
> >                      return pkg_version <= cve_affected_version
> >                  else:
> >                      print("version_affected: %s" % v['version_affected'])  
> 
> Seems there leaked some unrelated code change in?

Crap, yes :-/ Thanks for noticing. "git commit -a" should not be
allowed on my machine, it seems.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
