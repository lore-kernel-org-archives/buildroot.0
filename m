From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Dec 2014 08:02:56 +0100
Subject: [Buildroot] Buildroot autobuilders - Cleanup faulty tarballs
In-Reply-To: <20141215230340.GB4075@free.fr>
References: <20141215230340.GB4075@free.fr>
Message-ID: <20141216080256.09901ee4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 16 Dec 2014 00:03:40 +0100, Yann E. MORIN wrote:

> Could you please remove the tarballs from SF-hosted packages on each
> autobuilder instance you are running, please? You'll find that list
> below.

Done. Note that I did not simply remove the Sourceforge tarballs, but
simply completely removed the download directories of each autobuild
instance I was managing. This has two consequences:
 
 * A few invalid failures being reported, such as
   http://autobuild.buildroot.org/results/8da/8daafed00348b4498c7dfe2b34e060338b2f10eb/build-end.log.
   There should be no more than the number of instances I was taking of
   (4 on the Free Electrons build server, 4 on the gcc75 machine).

 * Probably a higher number of reports about failed downloads, since
   wiping out the download directory means that the next builds will
   re-download everything they need, which gives a higher probability
   of downloading tarballs that have disappeared, or trying to reach
   hosts that are down, etc.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
