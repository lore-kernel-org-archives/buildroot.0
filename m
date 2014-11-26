From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 26 Nov 2014 20:57:34 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-11-22
In-Reply-To: <CAHXCMM+odCUZoAWVJPuCOvf8ic1BMTZabBZDerwy9PqPs-mJUA@mail.gmail.com>
References: <20141123073011.CCE601014E6@stock.ovh.net>
 <CAHXCMM+JcRY090g3jcYGOzahveW2gYzKu_=QaDGmP2JTBXcRMQ@mail.gmail.com>
 <20141123182619.23fbfdba@free-electrons.com>
 <CAHXCMMKM4PHGDAD0SMZuXSX-ksB+j6tR_r1JPhoi7HNVGatuzA@mail.gmail.com>
 <1417033136.5064.8.camel@abrodkin-8560l.internal.synopsys.com>
 <CAHXCMM+odCUZoAWVJPuCOvf8ic1BMTZabBZDerwy9PqPs-mJUA@mail.gmail.com>
Message-ID: <1417035454.5064.12.camel@abrodkin-8560l.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel,

On Wed, 2014-11-26 at 21:48 +0100, Samuel Martin wrote:

> Well, after ringing nginx people, I got this answer [1] (wondering
> about deprecating rtsig module).
> 
> So, I'll cook a patch disabling rtsig module, at least for arc architecture.

Well I'd prefer to have less arch-specific stuff in Buildroot so it's
easier to maintain then.

And probably better solution is to implement proper check in nginx
itself instead of relying on user's preference or educated guess.

For example in "radvd" I'm going to do it with simple inclusion of:
--->---
AC_CHECK_FUNCS(sysctl)
--->---
in "configure.ac".

-Alexey
