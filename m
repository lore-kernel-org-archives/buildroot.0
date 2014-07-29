From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 29 Jul 2014 18:29:29 -0300
Subject: [Buildroot] [PATCH 4/4] perl-gdgraph: new package
In-Reply-To: <20140719223515.GL3593@free.fr>
References: <1405691019-10397-1-git-send-email-francois.perrad@gadz.org>
 <1405691019-10397-4-git-send-email-francois.perrad@gadz.org>
 <20140719191051.358726f9@free-electrons.com>
 <CAB0FRssX48i-XJ6GuZFObfWZQwTGXEOyQhWFgtsswn9RoEuVqA@mail.gmail.com>
 <20140719223515.GL3593@free.fr>
Message-ID: <53D81239.2070001@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/19/2014 07:35 PM, Yann E. MORIN wrote:

Hi All.
Reviving this...

> Does that mean we should have our own host-perl, then?
> 
> It would guarantee that we have a known situation, where we control the
> version of perl and we can reproduce builds across machines with
> different versions of perl and a known list of installed modules and
> their versions.
> 
> It would also allow tweaking the search paths to no longer include the
> host system includes and libraries search paths (although it won't
> protect us from badly written packages, such as perl-net-ssleay.)
> 
> But we can ensure that dependencies on other perl modules won't
> accidentally find host system perl's modules.
> 
> This might be a big endeavour, but even if we only build our own
> host-perl, that's still a big improvement, and needs only little changes
> to our current perl infra, i.e. just calling our own perl.
> 
> We can later enhance the situation by gradually tweaking our host-perl.
> 
> What do you guys think of this?

Well according to my failur(es) on gentoo:

>>> perl-gd 2.53 Building
cd /home/gustavoz/b/perl/output/build/perl-gd-2.53/ && if [ -f Build.PL
] ; then perl Build  build; else /usr/bin/make -j1
PERL_INC=/home/gustavoz/b/perl/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/perl5/5.18.2/arm-linux/CORE
 pure_all; fi
make[1]: Entering directory
`/home/gustavoz/b/perl/output/build/perl-gd-2.53'
/usr/bin/perl5.18.2 GD/Image.pm.PLS GD/Image.pm
Extracting Image.pm (with variable substitutions)
cp GD/Image.pm blib/lib/GD/Image.pm
cp GD/Simple.pm blib/lib/GD/Simple.pm
cp GD.pm blib/lib/GD.pm
AutoSplitting blib/lib/GD.pm (blib/lib/auto/GD)
cp GD/Group.pm blib/lib/GD/Group.pm
cp GD/Polygon.pm blib/lib/GD/Polygon.pm
cp GD/Polyline.pm blib/lib/GD/Polyline.pm
cp qd.pl blib/lib/qd.pl
/usr/bin/perl5.18.2 /usr/lib64/perl5/5.18.2/ExtUtils/xsubpp  -typemap
/usr/lib64/perl5/5.18.2/ExtUtils/typemap -typemap typemap  GD.xs >
GD.xsc && mv GD.xsc GD.c
make[1]: *** No rule to make target
`/home/gustavoz/b/perl/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/perl5/5.18.2/arm-linux/CORE/patchlevel-gentoo.h',
needed by `GD.o'.  Stop.
make[1]: Leaving directory `/home/gustavoz/b/perl/output/build/perl-gd-2.53'
make: *** [/home/gustavoz/b/perl/output/build/perl-gd-2.53/.stamp_built]
Error 2

Stumbled upon this when looking at the perl-gd xpm failure.
And surprise, it fails for a bunch of other perl packages as well.
We may be able to work around that, but really it would be a volatile
hack. I'm all for saving build time but fishing in the ocean with lake
kit... please no.

+1 for host-perl.

Regards.
