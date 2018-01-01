From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Jan 2018 23:05:21 +0100
Subject: [Buildroot] [PATCHv2] package/meson: fix malformed
 cross-compilation.conf.in
In-Reply-To: <20171230095635.18123-1-yann.morin.1998@free.fr>
References: <20171230095635.18123-1-yann.morin.1998@free.fr>
Message-ID: <20180101230521.2c5da61c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 30 Dec 2017 10:56:35 +0100, Yann E. MORIN wrote:
> Currently, meson will set the c_link_args and the cpp_link_args to the
> value of TARGET_LDFLAGS, even when it's not defined.
> 
> This creates a malformed array ["",] which will break any package
> building using meson/ninja.
> 
> We fix that by using an empty replacement when the corresponding values
> are empty.
> 
> Reported-by: Adam Duskett <Adamduskett@outlook.com>
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
> [yann.morin.1998 at free.fr: alternate implementation, suggested by Thomas]
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/meson/meson.mk | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
