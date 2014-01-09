From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jan 2014 07:29:38 +0800
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-01-08
In-Reply-To: <20140109191427.GB3713@free.fr>
References: <20140109073009.A1897100CCB@stock.ovh.net>
 <20140109191427.GB3713@free.fr>
Message-ID: <20140110072938.27628d13@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu, 9 Jan 2014 20:14:27 +0100, Yann E. MORIN wrote:

> What happens is that ola runs the host-python to check if it can
> 'import' the google.protobuf module.
> 
> Of course, this fails since google.protobuf is installed in target/ and
> not in host/ (and we do not explicitly install a host-variant).

Correct. But what is odd is that this test was *not* failing before the
migration to the Python infrastructure. I've started investigating
this, but haven't found the reason why before the Python infra it was
building OK, and not after the Python infra.

> There is a very simple trick^Whack we can use to fix this issue, either:
>   - remove the test entirely, since we enforce the dependency from the
>     Config.in an ola.mk, and thus we know google.protobuf will be
>     present

The problem of this solution is that the patch you've done cannot be
upstreamed, and therefore we would have to keep AUTORECONF = YES
forever on this package. Maybe we can make the configure.ac test
conditional on whether we're cross-compiling and push the patch
upstream?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
