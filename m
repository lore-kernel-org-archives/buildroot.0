From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 22:06:22 +0200
Subject: [Buildroot] [PATCH] pacakge/dieharder: fix autoreconf
In-Reply-To: <20170401190909.27403-1-yann.morin.1998@free.fr>
References: <20170401190909.27403-1-yann.morin.1998@free.fr>
Message-ID: <20170401220622.02152a5c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  1 Apr 2017 21:09:09 +0200, Yann E. MORIN wrote:
> When dieharder was committed, Thomas reoved the hook to cleanup the m4
> files, on the reason that autoreconf would rereate the broken symlinks
> (and because the hook was too complex).
> 
> It turns out the hook was needed: autoreconf does not recreate the files
> (at least not in some autobuilders nor on my machine).
> 
> Reinstate a simpler hook.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/a92/a92e9a74b0966f8f0bc4080f918d5ddf4c1ec0ce/
>     http://autobuild.buildroot.org/results/a4f/a4f6647f69ad89ff1ffe5f1331281fb7a57ade4e/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Julien Viard de Galbert <julien@vdg.name>
> ---
>  package/dieharder/dieharder.mk | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)

Applied to master after fixing a few typoes, and adjusting the commit
log/comments with the fact that it was indeed working for me because I
had libtool installed. So the problem is not just the fact that the
symlinks are not overwritten by autoreconf, but that they are not
overwritten if they are broken symbolic links in the first place.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
