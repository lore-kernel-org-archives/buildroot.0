From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 16:09:48 +0200
Subject: [Buildroot] [PATCH v2] package/kodi: fix path to binary
In-Reply-To: <20170423064708.10159-1-yann.morin.1998@free.fr>
References: <20170423064708.10159-1-yann.morin.1998@free.fr>
Message-ID: <20170429160948.1703b9dd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 23 Apr 2017 08:47:08 +0200, Yann E. MORIN wrote:
> Since XBMC was renamed to Kodi, upstream is progressively propagating
> the rename to directories and files, and in some cases kept a legacy
> symlink xbmc->kodi, like /usr/lib/xbmc pointing to /usr/lib/kodi.
> 
> In 62165ae (package/kodi: Fix path to binary in service), the path was
> changed to use the new canonical path, but the init script was left out.
> This was not seen previously, because of the legacy symlink.
> 
> But with the advent of Kodi 17 (Krypton), that legacy symlink is no
> more, and the init script no longer works.
> 
> Do for the init script what was done two years ago for the service file.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> Cc: Marcus Hoffmann <m.hoffmann@cartelsol.com>
> 
> ---
> Changes v1 -> v2:
>   - typoes  (Marcus)
> ---
>  package/kodi/S50kodi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
