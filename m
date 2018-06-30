From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 30 Jun 2018 18:41:49 +0200
Subject: [Buildroot] [PATCH] Revert "gnutls: drop wchar dependency"
In-Reply-To: <869c1f0ff206cd064a7a6e100e7d8f5073454360.1530269044.git.baruch@tkos.co.il>
References: <869c1f0ff206cd064a7a6e100e7d8f5073454360.1530269044.git.baruch@tkos.co.il>
Message-ID: <20180630184149.6867758b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 29 Jun 2018 13:44:04 +0300, Baruch Siach wrote:
> This reverts commit 694cdb9273433e8a1278e2e3bb2a7fe2004aa813.
> 
> Just like commit 68c3f5257d94 (Revert "gnutls: make it non-wchar
> friendly") before. It turns out that gnulib expects some other library
> to provide a wctomb() implementation. So when the C library does not
> provide one it is left as undefined symbol in libgnutls.so.
> 
> Add a comment to reduce the chance of repeating the same mistake again.
> 
> Fixes:
> http://autobuild.buildroot.net/results/86f/86f08276fcb0cc557ab3cc5f57229b2c0c6ac2d7/
> http://autobuild.buildroot.net/results/7c4/7c4bcb839f0ad5bc0496b4115ff391a3b312581a/
> http://autobuild.buildroot.net/results/1c3/1c353f542c49bbe5520266c0ebb6a58589032453/
> 
> Reported-by: Matt Weber <matthew.weber@rockwellcollins.com>
> Cc: Matt Weber <matthew.weber@rockwellcollins.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> v2: Add a Config.in comment (Thomas P)
> ---
>  package/gnutls/Config.in        | 7 +++++--
>  package/libmicrohttpd/Config.in | 5 +++--
>  package/libsoup/Config.in       | 2 +-
>  package/taskd/Config.in         | 2 +-
>  package/vpnc/Config.in          | 5 +++--
>  5 files changed, 13 insertions(+), 8 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
