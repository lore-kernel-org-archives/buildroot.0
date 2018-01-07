From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jan 2018 15:53:36 +0100
Subject: [Buildroot] [PATCH 1/1] daq: libdnet is optional not mandatory
In-Reply-To: <20180107143030.15589-1-fontaine.fabrice@gmail.com>
References: <20180107143030.15589-1-fontaine.fabrice@gmail.com>
Message-ID: <20180107155336.14ff4ab0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  7 Jan 2018 15:30:30 +0100, Fabrice Fontaine wrote:
> libdnet is an optional dependency, it is only needed if nfq or ipq
> module are enabled.
> 
> So, if libdnet and libnetfilter_queue are available, enable nfq module
> and add a dependency to both packages otherwise disable nfq module.
> 
> Moreover, always disable ipq module as libipq is deprecated, it isn't
> enable in iptables. Even if it was enabled, libipq.h can't be included
> as it makes a reference to linux/netfilter_ipv4/ip_queue.h which is not
> available anymore
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/daq/Config.in |  1 -
>  package/daq/daq.mk    | 11 ++++++++++-
>  2 files changed, 10 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
