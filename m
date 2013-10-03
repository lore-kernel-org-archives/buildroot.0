From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Thu, 3 Oct 2013 08:31:53 -0500
Subject: [Buildroot] Some legal-info observations/problems
In-Reply-To: <CAAXf6LXj9m1Vo8W5SJGGBHCyiRj=gUP=574Xjcqvn1jhnZZwgg@mail.gmail.com>
References: <CAAXf6LXHXo2vY8ns61fxoLzD0n2yzLASZqFk75xzYQwgDHp15Q@mail.gmail.com>	<OF28FCBE52.CC9DE764-ON86257BF8.00513AFD-86257BF8.006773C0@rockwellcollins.com>
 <CAAXf6LXj9m1Vo8W5SJGGBHCyiRj=gUP=574Xjcqvn1jhnZZwgg@mail.gmail.com>
Message-ID: <OFA9E6CB32.66C4A13C-ON86257BF9.0049F1F8-86257BF9.004A5509@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote on 
10/03/2013 03:34:30 AM:

> Hi Ryan,
> 
> On Wed, Oct 2, 2013 at 8:49 PM, Ryan Barnett
> <rjbarnet@rockwellcollins.com> wrote:
> > Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote on
> > 10/02/2013 09:06:13 AM:
> >
> > [...]
> >
> >
> >> 5. the manifest also lists all host packages, like automake, 
autoconf,
> >> ... while these are not distributed on target. Strictly speaking you
> >> do not have to list these in the customer documentation of a product,
> >> in my interpretation. I find it confusing that both target and host
> >> packages are mixed like that.
> >> Of course, it's probably difficult to change this, because some
> >> packages can be built for host _and_ target, and the legal-info
> >> infrastructure does not know which of these was used for a particular
> >> project.
> >
> > One other thing that I would like to add about the legal-info that I
> > would like to see added is the manifest.csv file contain the
> > URL from which the source packages originated from. Is this something
> > that people be interested in seeing added? As part of our release
> > process, we need to show where the original source file came from 
(URL).
> >
> 
> While I don't need the URL for my process, I currently also don't need
> the name of the tarball in manifest.csv (and I leave out this last
> column anyway). So, I'm not opposed to adding this extra column, but
> there may be some caveats: with the OVERRIDE_SRCDIR mechanism it is
> possible for a project to completely change the sources of an existing
> package in buildroot. Strictly speaking this could mean that there is
> no relation whatsoever between the URL specified in the .mk file and
> the actual sources used. This is probably very exotic, though, and
> maybe it doesn't really matter for your process.

You bring up an interesting point that I never thought of. However, in
the application of OVERRIDE_SRCDIR, I would think that it mainly intended
for company's application but I could be wrong. 

I will go ahead an propose a patch in the next couple weeks that 
implements this feature and takes the OVERRIDE_SRDIR mechanism into 
consideration.

> Best regards,
> Thomas

Thanks,
-Ryan

------------------------------------------------------------------------------------------
Ryan J Barnett / Software Engineer / Platform SW
MS 137-157, 855 35th St NE, Cedar Rapids, IA, 52498-3161, US
rjbarnet at rockwellcollins.com
www.rockwellcollins.com
