From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Feb 2017 23:13:37 +0100
Subject: [Buildroot] [PATCH] package/python: apply unicode config to
 host build
In-Reply-To: <20170222031423.GA2574@csmart.io>
References: <20170222031423.GA2574@csmart.io>
Message-ID: <20170223231337.20304671@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Feb 2017 14:14:23 +1100, Chris Smart wrote:
> Currently the host build of Python 2 defaults to narrow unicode (UCS2),
> ignoring the BR2_PACKAGE_PYTHON_UCS4 configuration option which may be
> set to wide (UCS4).
> 
> This results in host and target Python packages which are incompatible
> in subtle ways.
> 
> For example, installing wheels into the target fails when they are made
> with the host python, citing incompatibility (as can be seen by the
> package tags which may be "cp27u-manylinux1" instead of
> "cp27mu-manylinux1").
> 
> Compiling the host Python 2 with the same UCS configuration as the
> target ensures that the packages are compatible (and the tags match).
> 
> This does not affect Python 3 as support for narrow unicode was
> deprecated in version 3.3, see https://www.python.org/dev/peps/pep-0393/
> 
> Thanks to Tony Breeds <tony@bakeyournoodle.com> for reporting this.
> 
> Signed-off-by: Chris Smart <mail@csmart.io>
> ---
>  package/python/python.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, after adding a comment in the code itself to explain
why we're doing this.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
