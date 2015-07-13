From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 01:24:43 +0200
Subject: [Buildroot] [PATCHv2] package/dropbear: fix generating keys on
 RO file systems
In-Reply-To: <1436827441-29183-1-git-send-email-yann.morin.1998@free.fr>
References: <1436827441-29183-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150714012443.07a63706@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 14 Jul 2015 00:44:01 +0200, Yann E. MORIN wrote:
> dropbear generates its keys at the first connection, and wants to save
> them in /etc/dropbear (not configurable).
> 
> Currently, our /etc/dropbear is a directory.
> 
> When the filesystem is read-only, dropbear can't save its keys, so
> refuses all connections.
> 
> Fix that with:
> 
>   - at build time, create /etc/dropbear as a symlink to
>     /var/run/dropbear
> 
>   - at runtime, if the filesystem is RW (we can rm /etc/dropbear),
>     we replace the symlink with an actual directory; otherwise,
>     when the filesystem is RO (we can't rm /etc/dropbear), we create
>     /var/run/dropbear so the symlink points to an existing directory
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> 
> ---
> Changes v1 -> v2:
>   - fix indentation  (Arnout)
>   - also change the systemd unit file  (Maxime)
>   - fix logic  (Maxime)
>   - fix subject
> ---
>  package/dropbear/S50dropbear      | 14 ++++++++++++++
>  package/dropbear/dropbear.mk      |  2 +-
>  package/dropbear/dropbear.service | 13 +++++++++++++
>  3 files changed, 28 insertions(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
