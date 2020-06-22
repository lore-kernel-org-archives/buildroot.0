From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Mon, 22 Jun 2020 16:55:33 -0400
Subject: [Buildroot] [RFC v9 01/10] cpe-info: new make target
In-Reply-To: <CANQCQpY_PiScvzaCuebc2Fg5fE5_J3h6HxFikEmHGdQu+-oeUQ@mail.gmail.com>
References: <20200616170341.45098-1-matthew.weber@rockwellcollins.com>
 <20200621084540.GZ2351@scaer>
 <CANQCQpY_PiScvzaCuebc2Fg5fE5_J3h6HxFikEmHGdQu+-oeUQ@mail.gmail.com>
Message-ID: <CA+-urNQEV32gr+wF0BzMZjpZp7Pnn=7oJxVLadY2YVgT3EGsJQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matt,

> > On 2020-06-16 12:03 -0500, Matt Weber spake thusly:
> > > Similar to make legal-info, produce a csv delimited file containing
> > > all selected packages CPE identification.
> > >
> > > By default, support the pkg infra defining a set of CPE_ID_* defaults
> > > using the package name for the vendor and name as most CPE IDs seem
> > > to align with that assumption. Plus initially, use the pkg version as
> > > the CPE ID's version field.

Sorry for the late comments. I only now saw your CPE patches. This is
really valuable work. One of my projects is being updated to provide
CycloneDX files (XML or JSON). At a high level, CycloneDX combines
information from legal-info, show-info, and cpe-info into one JSON or
XML-formatted file. https://cyclonedx.org/ has more information.

I am not an expert on this, so let me share comments that I received
when forwarding your patches to the people working on CycloneDX
integration:

> Having buildroot output to CycloneDX directly would be ideal. CycloneDX is being adopted by tool makers already so this is in alignment to what others are doing.
>
> CPE, SWID, and PURL are different formats in which software can be identified. CPE is deprecated by the NVD but will likely still be around for another few years. SWID contains a tagId which is used for identity, and the format provides elementary SBOM capabilities as well. PURL also performs identity but also includes location information so that packages can be resolved, which plays into provenance a bit.
>
> All three are valuable. Only CPE and SWID are supported by the NVD. However, every member in the OSS Coalition has, or will be adopting  PURL - so basically the entire development ecosystem is about to support it in a major way. Some SCA vendors already support it.
>
> Because all three can be used for identity, all three are valuable in the ?known vulnerability? use case as described here: https://cyclonedx.org/use-cases/#known-vulnerabilities

I am very thankful that you've started this work. Certainly having
accurate CPEs is a step in the right direction, IMHO.

Thanks,
Frank
