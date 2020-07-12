From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jul 2020 21:32:56 +0200
Subject: [Buildroot] [PATCH v2 1/9] support/script/pkg-stat: Handle
 exception when version comparison fails
In-Reply-To: <20200710112245.1044073-12-gregory.clement@bootlin.com>
References: <20200710112245.1044073-1-gregory.clement@bootlin.com>
 <20200710112245.1044073-12-gregory.clement@bootlin.com>
Message-ID: <20200712213256.25a68573@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Jul 2020 13:22:37 +0200
Gregory CLEMENT <gregory.clement@bootlin.com> wrote:

> With python 3, when a package has a version number x-y-z instead of
> x.y.z, then the version returned by LooseVersion can't be compared
> which raises an exception.
> 
> This patch handles this exception by adding a new return value when
> the comparison can't be done. As a third value has been introduce, the
> booelan are no more used.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Typos in the commit title:

	support/scripts/pkg-stats

also, we generally don't use a capital letter to start the short
description.

> +                    try:
> +                        affected = pkg_version <= cve_affected_version
> +                        break
> +                    except:

This kind of "catch all exceptions" is not recommended in Python, and
flake8 is not happy about it, so I changed it to:

			except TypeError:

I fixed up this issue, the commit log issue, and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
