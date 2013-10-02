From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 02 Oct 2013 18:31:35 +0200
Subject: [Buildroot] Some legal-info observations/problems
In-Reply-To: <CAAXf6LXHXo2vY8ns61fxoLzD0n2yzLASZqFk75xzYQwgDHp15Q@mail.gmail.com>
References: <CAAXf6LXHXo2vY8ns61fxoLzD0n2yzLASZqFk75xzYQwgDHp15Q@mail.gmail.com>
Message-ID: <524C4A67.9000000@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/02/13 16:06, Thomas De Schampheleire wrote:
> Hi,
>
> I am starting to use the legal-info infrastructure now, and this
> resulted in a number of observations/problems, which I'll list below.
>
> 1. there is no longer a provision to 'hide' proprietary packages from
> the manifest, and not get warnings on them. Previously you could mark
> a package as license: PROPRIETARY, but this has been removed. I still
> think that a similar feature is useful.

  I don't see why this is relevant. You probably anyway want to filter 
the license results to only contain the relevant licenses (i.e. the 
licenses that require you to mention the authors and the license in the 
documentation). And you can simply set the license to PROPRIETARY and 
grep it out of the csv file.


[snip]
> 4. Suppose that a package has no license files and explicitly declares
> this with FOO_LICENSE_FILES =
> In this case, you will still get a warning: "cannot save license
> (FOO_LICENSE_FILES not defined)", but in fact it is simply empty.
> I think it would be better to distinghuish the situation 'empty' and
> 'not defined'.

  This may indeed be relevant for private packages and for public domain 
packages.

> 5. the manifest also lists all host packages, like automake, autoconf,
> ... while these are not distributed on target. Strictly speaking you
> do not have to list these in the customer documentation of a product,
> in my interpretation. I find it confusing that both target and host
> packages are mixed like that.

  This was intentional, I think. The host packages may be part of "the 
scripts used to control compilation and installation of the executable" 
(esp. for automake and autoconf), so they may be necessary.

  It would be useful, though, if the manifest would contain a column to 
indicate if it is a host package or a target package.

> Of course, it's probably difficult to change this, because some
> packages can be built for host _and_ target, and the legal-info
> infrastructure does not know which of these was used for a particular
> project.

  Actually it's not, the host packages are added explicitly to 
TARGETS_LEGAL_INFO.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
