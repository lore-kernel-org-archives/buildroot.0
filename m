From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Dec 2014 21:55:39 +0100
Subject: [Buildroot] [PATCH] package/zlib: allow shared-only builds
In-Reply-To: <1418766418-8947-1-git-send-email-yann.morin.1998@free.fr>
References: <1418766418-8947-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20141220215539.6cc90d8d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 16 Dec 2014 22:46:58 +0100, Yann E. MORIN wrote:
> Currently, we can build a static-only zlib, but not a shared-only one.
> 
> This is because zlib's build-system is a custom ./configure (not using
> autotools), and does not allow building/installing only the shared
> library.
> 
> Simply remove the .a as a post-staging install hook. We don't care
> removing it from target, since it is not used at link time to build
> other packages, and it is anyway removed later before assembling the
> filesystem images anyway.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/zlib/zlib.mk | 13 +++++++++++++
>  1 file changed, 13 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
