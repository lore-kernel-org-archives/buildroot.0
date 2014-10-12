From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Oct 2014 21:34:17 +0200
Subject: [Buildroot] [PATCH 3/8] package/tvheadend: Convert to
 autotools-package
In-Reply-To: <1413137610-21887-3-git-send-email-bernd.kuhls@t-online.de>
References: <1413137610-21887-1-git-send-email-bernd.kuhls@t-online.de>
 <1413137610-21887-3-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141012213417.0ecdc736@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 12 Oct 2014 20:13:25 +0200, Bernd Kuhls wrote:
> tvheadend does not use autoconf but its configure script behaves as such.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/tvheadend/tvheadend.mk |   27 ++++++---------------------
>  1 file changed, 6 insertions(+), 21 deletions(-)

I generally dislike this approach. The fact that a non-autoconf
configure script currently behaves sufficiently closely to an autoconf
configure script is just pure happenstance, and any change to the
pkg-autotools infrastructure may break this fragile assumption.

So in general, I prefer non-autoconf packages to be handled with
generic-package.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
