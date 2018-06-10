From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Jun 2018 15:57:27 +0200
Subject: [Buildroot] [PATCH 4/5] support/testing: fix python syntax
In-Reply-To: <2ae621feecea77223421234eaef0de7032c841d1.1528016895.git.yann.morin.1998@free.fr>
References: <cover.1528016895.git.yann.morin.1998@free.fr>
 <2ae621feecea77223421234eaef0de7032c841d1.1528016895.git.yann.morin.1998@free.fr>
Message-ID: <20180610155727.4de7c16f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  3 Jun 2018 11:08:21 +0200, Yann E. MORIN wrote:
> Fix three issues with code style in our test infra:
>   - 'print' is now a function,
>   - exceptions need to be caught-assigned with the 'as' keyword,
>   - old-style "%s"%() formatting is deprecated.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> 
> ---
> Changes v1 -> v2:
>   - this was previously caught because of a spurious switch to
>     python3-flake8, as noticed by Ricardo. We're now back to using
>     python-flake8, so the rationale has changed. Still, we do want
>     to fix those because it makes sense anyway.
> ---
>  support/testing/infra/__init__.py |  6 +++---
>  support/testing/infra/basetest.py |  4 ++--
>  support/testing/run-tests         | 26 +++++++++++++-------------
>  3 files changed, 18 insertions(+), 18 deletions(-)

I've dropped the changes that added indices to format strings (since
they would only be needed for Python 2.6 compatibility, and I'm not
sure that it's a worthwhile goal to be able to run the test suite on
Python 2.6 machines). And then I've applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
