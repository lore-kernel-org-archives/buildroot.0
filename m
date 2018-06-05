From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Jun 2018 07:51:52 +0200
Subject: [Buildroot] [PATCH 4/5] support/testing: fix python syntax
In-Reply-To: <5b15f2a8ada6e_5c1a3f8e3808bab469742@ultri5.mail>
References: <2ae621feecea77223421234eaef0de7032c841d1.1528016895.git.yann.morin.1998@free.fr>
 <5b15f2a8ada6e_5c1a3f8e3808bab469742@ultri5.mail>
Message-ID: <20180605075152.1c1ea069@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 04 Jun 2018 23:17:12 -0300, Ricardo Martincoski wrote:

> This patch also do:
>   - add indices in format string
> 
> We currently do that only for check-uniq-files.
> Everywhere else we use '{}' instead of '{0}' when possible, as this is not
> really needed for Python 3 when we use each arguments once in the same order
> they are passed to format().
> 
> BUT... looking at "62fa5e17cb support/scripts/check-uniq-files: add indices in
> format string" maybe it would be good to adopt a simplistic policy of always
> using indices in format string, as it seems to be compatible to Python >= 2.6
> and then we don't need to think about whether the script will be used during
> the build (and therefore need to support old distros) or not when reviewing.
> 
> Thoughts?

I am not sure it is useful (and realistic) to have all our Python
scripts compatible with Python 2.6. This puts a pretty hard constraint
which might be annoying down the road. So Python scripts involved in
the build itself should definitely be compatible with Python 2.6, but
all the utility Python scripts around that are not essential for the
build, I don't think we should enforce this constraint.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
