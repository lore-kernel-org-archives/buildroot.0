From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Aug 2019 14:47:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/autofs: fix mount,
 umount and fsck program paths
In-Reply-To: <20190816090913.16141-1-fontaine.fabrice@gmail.com>
References: <20190816090913.16141-1-fontaine.fabrice@gmail.com>
Message-ID: <20190817144757.73c49bb3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Fri, 16 Aug 2019 11:09:13 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - https://bugs.buildroot.org/show_bug.cgi?id=11876
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/autofs/autofs.mk | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)

Applied to master, thanks. However, autofs now has the path to those
programs, but they may not necessarily be installed on the target.
autofs has no dependency on Busybox, or any other package that would
provide mount, umount, mount.nfs, fsck.*, etc. Perhaps this is
something that should be investigated? Does autofs need those tools in
all situations?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
