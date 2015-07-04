From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Jul 2015 15:33:03 +0200
Subject: [Buildroot] [PATCH] core/pkg-generic: sanitise
 FOO_OVERRIDE_SRCDIR
In-Reply-To: <1435494449-12837-1-git-send-email-yann.morin.1998@free.fr>
References: <1435494449-12837-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150704153303.36e35ef2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 28 Jun 2015 14:27:29 +0200, Yann E. MORIN wrote:
> In case FOO_OVERRIDE_SRCDIR has trailing spaces, like so:
>     FOO_OVERRIDE_SRCDIR = /path/to/sources\x20
> 
> we would end up with a rsync command like so:
>     rsync -au /path/to/sources / /path/to/build/foo
> 
> which would effectively rsync the whole vfs, eventually filling the
> whole disk... :-(
> 
> So, just qstrip the variable before use.
> 
> Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/pkg-generic.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
