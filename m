From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Oct 2014 22:01:08 +0100
Subject: [Buildroot] [PATCH] tcpdump: use libpcap shared library
In-Reply-To: <67c0a327947d1f710687a04d56a3a047984f3988.1414585221.git.baruch@tkos.co.il>
References: <67c0a327947d1f710687a04d56a3a047984f3988.1414585221.git.baruch@tkos.co.il>
Message-ID: <20141030220108.2258b647@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Wed, 29 Oct 2014 14:20:21 +0200, Baruch Siach wrote:
> Currently the tcpdump configure script finds libpcap.a in
> output/build/libpcap-[version]. This check is hard coded in aclocal.m4. Add a
> patch to optionally ignore local libpcap so that the system shared library
> version is found instead. This reduces the tcpdump binary size in a few 100KB.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...libpcap-when-configured-with-with-system-.patch | 78 ++++++++++++++++++++++
>  package/tcpdump/tcpdump.mk                         |  7 +-
>  2 files changed, 83 insertions(+), 2 deletions(-)
>  create mode 100644 package/tcpdump/0001-Use-system-libpcap-when-configured-with-with-system-.patch

Applied, thanks.

However, the tcpdump library has an invalid rpath:

 0x0000000f (RPATH)                      Library rpath: [/home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib]

This rpath comes from the fact that pcap-config returns a -Wl,-rpath
option that it should not. If you have some time to look into that, it
would be good (especially if it's done in a way acceptable upstream!).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
