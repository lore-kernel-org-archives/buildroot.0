From: Alexander Dahl <post@lespocky.de>
Date: Fri, 19 Jun 2020 00:15:59 +0200
Subject: [Buildroot] [PATCH] package/fastd: bump to v19
In-Reply-To: <20200618224002.4da2ed12@windsurf.home>
References: <20200611192504.4058-1-post@lespocky.de>
 <20200618224002.4da2ed12@windsurf.home>
Message-ID: <20200618221558.bjtrlxvwco7cpg6p@falbala.internal.home.lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Thu, Jun 18, 2020 at 10:40:02PM +0200, Thomas Petazzoni wrote:
> On Thu, 11 Jun 2020 21:25:04 +0200
> Alexander Dahl <post@lespocky.de> wrote:
> 
> > Maintenance release, most important is OpenSSL 1.1+ support. See full
> > release notes for details:
> > 
> > https://fastd.readthedocs.io/en/stable/releases/v19.html
> > 
> > Two patches went upstream.  The last remaining patch was not touched,
> > LTO might not work as expected, but upstream dropped CMake in favour of
> > the meson build system after v19, so it seemed not worth the effort.
> > 
> > Signed-off-by: Alexander Dahl <post@lespocky.de>
> > ---
> >  ...akeList-do-not-overwrite-module-path.patch |  56 -------
> >  ...emove-aes128-ctr-NaCl-implementation.patch | 137 ------------------
> >  package/fastd/fastd.hash                      |   4 +-
> >  package/fastd/fastd.mk                        |   4 +-
> >  4 files changed, 3 insertions(+), 198 deletions(-)
> >  delete mode 100644 package/fastd/0002-CMakeList-do-not-overwrite-module-path.patch
> >  delete mode 100644 package/fastd/0003-cipher-remove-aes128-ctr-NaCl-implementation.patch
> 
> You had forgotten to update the hash of the license file (and explain
> why it needs to be updated). I fixed that and applied. Thanks!

I did not really forget it, but there was no error or warning on
mismatch on my side. Maybe I did not let the whole BSP build finish,
but just called some intermediate state before that was checked. Will
check next time. Thanks for fixing it.

Greets
Alex

-- 
/"\ ASCII RIBBON | ?With the first link, the chain is forged. The first
\ / CAMPAIGN     | speech censured, the first thought forbidden, the
 X  AGAINST      | first freedom denied, chains us all irrevocably.?
/ \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200619/d272f1d2/attachment.asc>
