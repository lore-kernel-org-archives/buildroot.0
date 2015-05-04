From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Mon, 04 May 2015 12:28:33 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20150503105009.2b42c375@free-electrons.com>
References: <20150502063016.3950D100FB0@stock.ovh.net>
 <20150503105009.2b42c375@free-electrons.com>
Message-ID: <1430735313.2799.15.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On So, 2015-05-03 at 10:50 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> >         sh4a |                   boost-1.58.0 | NOK | http://autobu
> > ild.buildroot.net/results/ccd5c83963032ba49b1627b1dff39e34a9486943/
> >       mipsel |                   boost-1.58.0 | NOK | http://autobu
> > ild.buildroot.net/results/66c3a868816dfe4bd4d0ffafec6988fd87a2c058/
> 
> Fixed by reverting to 1.57.

Fixed by http://patchwork.ozlabs.org/patch/467255/?

> 
> >          arm |                 libtirpc-0.2.4 | NOK | http://autobu
> > ild.buildroot.net/results/c64cb1874e6287da1942533d85d26b12192c73df/
> >          arm |                 libtirpc-0.2.4 | NOK | http://autobu
> > ild.buildroot.net/results/9f08353e94eadb914332aa80fc90c4315bfef7c2/
> 
> libtirpc fails to build on musl.

> I started working on this topic, but it's not that simple...

Me, too. Yeah, removing sys/cdefs.h, replacing __BEGIN_DECLS,
__END_DECLS, and __THROW, replacing sys/queue.h, and some things
more...

Best regards
J?rg Krause
