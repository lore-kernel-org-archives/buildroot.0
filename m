From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Oct 2013 17:23:07 +0200
Subject: [Buildroot] Some legal-info observations/problems
In-Reply-To: <CAAXf6LXHXo2vY8ns61fxoLzD0n2yzLASZqFk75xzYQwgDHp15Q@mail.gmail.com>
References: <CAAXf6LXHXo2vY8ns61fxoLzD0n2yzLASZqFk75xzYQwgDHp15Q@mail.gmail.com>
Message-ID: <20131002172307.0d6f02ea@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

(Skipping items 2 and 3, since they have been solved apparently.)

On Wed, 2 Oct 2013 16:06:13 +0200, Thomas De Schampheleire wrote:

> 1. there is no longer a provision to 'hide' proprietary packages from
> the manifest, and not get warnings on them. Previously you could mark
> a package as license: PROPRIETARY, but this has been removed. I still
> think that a similar feature is useful.

<pkg>_REDISTRIBUTE = NO

is what you're looking for, no?

> 4. Suppose that a package has no license files and explicitly declares
> this with FOO_LICENSE_FILES =
> In this case, you will still get a warning: "cannot save license
> (FOO_LICENSE_FILES not defined)", but in fact it is simply empty.
> I think it would be better to distinghuish the situation 'empty' and
> 'not defined'.

Agreed. However, in make, doing FOOBAR = or not defining FOOBAR leads
to the same thing: FOOBAR is an empty variable. So we have to decide on
an explicit magic value to use when no license files are available (and
ensure this magic value is never going to be used for the name of a
license file).

FOO_LICENSE_FILES = N/A
FOO_LICENSE_FILES = not-available
FOO_LICENSE_FILES = none
FOO_LICENSE_FILES = NONE

> 5. the manifest also lists all host packages, like automake, autoconf,
> ... while these are not distributed on target. Strictly speaking you
> do not have to list these in the customer documentation of a product,
> in my interpretation. I find it confusing that both target and host
> packages are mixed like that.
> Of course, it's probably difficult to change this, because some
> packages can be built for host _and_ target, and the legal-info
> infrastructure does not know which of these was used for a particular
> project.

I think we discussed that the legal-info for target and host packages
should be separated: either the CSV should mention whether it's used
for the target or the host (or both), or there should be two separate
CSV files.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
