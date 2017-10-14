From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 13 Oct 2017 20:01:19 -0500
Subject: [Buildroot] [PATCH] uboot-tools: bugfix libfdt python build
In-Reply-To: <20171013161128.37827061@windsurf.lan>
References: <20171013023556.25825-1-matthew.weber@rockwellcollins.com>
 <20171013161128.37827061@windsurf.lan>
Message-ID: <CANQCQpZhRskjjpSbOiUEEM0qEimpkC+R7NA1B1iV-G+HO1+=iQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Fri, Oct 13, 2017 at 9:11 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
> Hello,
>
> On Thu, 12 Oct 2017 21:35:56 -0500, Matt Weber wrote:
>
> > +ifeq ($(BR2_PACKAGE_PYTHON3),y)
> > +HOST_UBOOT_TOOLS_DEPENDENCIES += host-python3
> > +else
> > +HOST_UBOOT_TOOLS_DEPENDENCIES += host-python
> > +endif
>
> Gaah, adding host-python as a mandatory dependency of host-uboot-tools
> is a big change. Any way around that ?
>

I looked at the uboot python issue a bit more and I'll send something
upstream.  I'm thinking the best option would be to define an optional
SWIG variable providing an absolute path to the tool and include an
update to the SWIG detection logic using it.

Then Buildroot could support an option to enable the libftd in the
menu and let that select python.  This option would be applicable to
host and/or target, as I noticed target uboot-tools was also failing
just not as often.

So the python intepretor path is still valid, but if the plan above
sounds good,  I'll rework and remove the unconditional dependency.

-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
