From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Apr 2017 21:43:25 +0200
Subject: [Buildroot] [PATCH] arp-scan: fix static link when libnl is
 selected
In-Reply-To: <20170408141736.18554-1-arnout@mind.be>
References: <20170408141736.18554-1-arnout@mind.be>
Message-ID: <20170408214325.76a365f9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 8 Apr 2017 16:17:36 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> When libnl is selected, libpcap links with it. Since libpcap doesn't
> provide a .pc file and arp-scan doesn't use its libpcap-config script,
> we must provide the additional options explicilty.
> 
> Fixes
> http://autobuild.buildroot.net/results/c605c8cc36348f199a36e2652851b8d02ee222c0
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/arp-scan/arp-scan.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
