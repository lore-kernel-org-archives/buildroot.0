From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Aug 2016 22:21:48 +0200
Subject: [Buildroot] [PATCH] wireshark: fix static build with
 libpcap+libusb
In-Reply-To: <0e28bc4a3824cba288c9930f98653f60f1d0e093.1471791997.git.baruch@tkos.co.il>
References: <0e28bc4a3824cba288c9930f98653f60f1d0e093.1471791997.git.baruch@tkos.co.il>
Message-ID: <20160821222148.200a5705@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 21 Aug 2016 18:06:38 +0300, Baruch Siach wrote:
> The wireshark autoconf acinclude.m4 source calls AC_PATH_TOOL() to find
> pcap-config only when --with-pcap is missing. Otherwise it just trusts the
> PCAP_CONFIG environment variable. Since we use --with-pcap, seeding
> ac_cv_path_PCAP_CONFIG gives nothing. Set PCAP_CONFIG instead to let the
> configure script discover the dependencies of libpcap. This fixes static build
> when libpcap links with libusb.
> 
> Fixes:
> http://autobuild.buildroot.net/results/ef5/ef50939b89373aad04275cbdeeff4c0e2807c0d5/
> http://autobuild.buildroot.net/results/ffc/ffc921135c16c7017cd7a23c5e0c445757509abc/
> http://autobuild.buildroot.net/results/2d8/2d8cd47cc664dff0f76a230b36c37291f3087e35/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/wireshark/wireshark.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
