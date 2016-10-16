From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Oct 2016 16:02:24 +0200
Subject: [Buildroot] [PATCH v7 3/3] util-linux: rework utilities menu
 for finer control
In-Reply-To: <1468113369-16118-5-git-send-email-casantos@datacom.ind.br>
References: <20160708205217.GB3757@free.fr>
 <1468113369-16118-1-git-send-email-casantos@datacom.ind.br>
 <1468113369-16118-5-git-send-email-casantos@datacom.ind.br>
Message-ID: <20161016160224.18b1f027@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  9 Jul 2016 22:16:09 -0300, Carlos Santos wrote:
> When even a single extra util-linux utility is enabled, the
> default build and install will install many more programs,
> including many that overlap with those offered by busybox.
> 
> Fix by reworking the install-utilies menu to take advantage
> of the new --disable-all-programs config option.  This option
> make it possible to disable the basic set of apps, and then
> enable only the desired apps.
> 
> Original patch by Danomi Manchego, visible at
> http://patchwork.ozlabs.org/patch/494866/
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> ---
>  Config.in.legacy                 | 16 ++++++++++++
>  package/util-linux/Config.in     | 53 +++++++++++++++++++++++++++++++---------
>  package/util-linux/util-linux.mk | 15 ++++++------
>  3 files changed, 66 insertions(+), 18 deletions(-)

We've applied your patch, but after doing some fairly significant
change. Namely, we have removed the choice...endchoice entirely. It is
indeed not necessary at all: simply make the per-tool options visible
even if the "basic set" option is disabled. It allows the same
flexibility, with less options, no legacy, etc.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
