From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 7 Mar 2018 23:35:43 +0100
Subject: [Buildroot] [PATCH next v2 2/5] support/scripts/pkg-stats-new:
 add -n and -p options
In-Reply-To: <5a90f003e116f_4611fdab2450876@ultri3.mail>
References: <20180221221342.15683-3-thomas.petazzoni@bootlin.com>
 <5a90f003e116f_4611fdab2450876@ultri3.mail>
Message-ID: <20180307233543.7e89512e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 24 Feb 2018 01:54:27 -0300, Ricardo Martincoski wrote:
> Hello,
> 
> On Wed, Feb 21, 2018 at 07:13 PM, Thomas Petazzoni wrote:
> 
> > This commit adds the following options to the pkg-stats-new script:
> > 
> >  -n, to specify a number of packages to parse instead of all packages
> > 
> >  -p, to specify a list of packages (comma-separated) to parse instead
> >      of all packages
> > 
> > These options are basically only useful when debugging/developping  
> 
> typo:                                                    developing

Fixed.

> 
> > this script, but they are very useful, because the script is rather
> > slow to run completely with all 2000+ packages, especially once
> > upstream versions will be fetched from release-monitoring.org.
> > 
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>  
> 
> With the typo fixed and regardless your decision about the help below:
> Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

Thanks!

> > +    parser.add_argument('-n', dest='npackages', type=int, action='store',
> > +                        help='Number of packages')
> > +    parser.add_argument('-p', dest='packages', action='store',
> > +                        help='List of packages')  
> 
> Should the help also mention the option expects a comma-separated list?

Absolutely, fixed in v3!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
