From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Nov 2016 22:27:04 +0100
Subject: [Buildroot] [PATCH 1/5] package/pseudo: enforce the host bitness
In-Reply-To: <a2d0f2c0a262a2a40e8ccc1f3c0d89fdb834af39.1478643505.git.yann.morin.1998@free.fr>
References: <cover.1478643505.git.yann.morin.1998@free.fr>
 <a2d0f2c0a262a2a40e8ccc1f3c0d89fdb834af39.1478643505.git.yann.morin.1998@free.fr>
Message-ID: <20161109222704.1c71c152@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  8 Nov 2016 23:18:31 +0100, Yann E. MORIN wrote:
> pseudo can detect the host bitness, but is not sure about it: it checks
> what type of file /bin/sh is, using file(1).
> 
> However, in some conditions, /bin/sh can be of a different bitness than
> the rest of the system (weird, but not impossible), which causes build
> issues.
> 
> Just enforce the bitness, so that pseudo needs not (wrongly) guess it.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> Cc: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>
> Cc: Erico Nunes <nunes.erico@gmail.com>
> Cc: Julien BOIBESSOT <julien.boibessot@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> 
> ---
> Changes v1 -> v2:
>   - directly extract bitness for $(HOSTARCH)  (Arnout)
> ---
>  package/pseudo/pseudo.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
