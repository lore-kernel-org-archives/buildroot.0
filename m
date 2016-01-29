From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Jan 2016 09:14:29 +0100
Subject: [Buildroot] [PATCH v2 2/3] graph-depends: add support for
 excluding host packages
In-Reply-To: <20160128224433.GG7523@free.fr>
References: <1453926735-29571-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1453926735-29571-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <20160128224433.GG7523@free.fr>
Message-ID: <20160129091429.1048415c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu, 28 Jan 2016 23:44:33 +0100, Yann E. MORIN wrote:

> > +    if pkg.startswith("host-") and "host" in stop_list:
> > +        return
> >      if max_depth == 0 or depth < max_depth:
> >          for d in dict_deps[pkg]:
> >              if dict_version.get(d) == "virtual" \
> >                 and "virtual" in exclude_list:
> >                  continue
> > +            if d.startswith("host-") and "host" in exclude_list:
> 
> Can we make that line look like the corresponding line for the virtual
> packages, two-and-three lines above?

In what way? Are you just talking about breaking the condition like
this:

	if d.startswith("host-") \
		and "host" in exclude_list:

or something else ?

Thanks for the review!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
