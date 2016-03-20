From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 21:48:47 +0100
Subject: [Buildroot] [PATCH 1/2 v2] jack2: allow to choose the mode to
 operate jackd
In-Reply-To: <d7d30dc9c5607b4a92327f9025734021c4ea00e3.1457719085.git.yann.morin.1998@free.fr>
References: <cover.1457719085.git.yann.morin.1998@free.fr>
 <d7d30dc9c5607b4a92327f9025734021c4ea00e3.1457719085.git.yann.morin.1998@free.fr>
Message-ID: <20160320214847.63dee4d4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 11 Mar 2016 19:00:34 +0100, Yann E. MORIN wrote:
> From: Antoine T?nart <antoine.tenart@free-electrons.com>
> 
> jack2 allows to use three modes:
> - A legacy jackd service alone.
> - A DBUS jackd service alone.
> - A mixture between the standalone jackd and the DBUS jackd.
> 
> This patch adds the possibility to choose between these three modes,
> while the legacy jackd was the only option before.
> 
> In addition, the jack_control tool is removed when the DBUS jackd is not
> available, as this tool is used to control it.
> 
> Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
> [yann.morin.1998 at free.fr:
>   - rebase
>   - only use two booleans, not a choice
>   - python is a runtime-only dependency
>   - use python3 if enabled, fallback to python
>   - simplify post-install condition
> ]
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> ---
> Changes v1 -> v2:
>   - rebased; see commit log  (Yann)
> ---
>  package/jack2/Config.in | 26 ++++++++++++++++++++++++++
>  package/jack2/jack2.mk  | 15 +++++++++++++++
>  2 files changed, 41 insertions(+)

Applied after fixing some typos. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
