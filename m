From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Oct 2018 16:00:07 +0200
Subject: [Buildroot] [PATCH 2/2] package/cups-filters: Add patch to fix
 build when using poppler 0.69.0
In-Reply-To: <20181005133019.1061-2-olivier.schonken@gmail.com>
References: <20181005133019.1061-1-olivier.schonken@gmail.com>
 <20181005133019.1061-2-olivier.schonken@gmail.com>
Message-ID: <20181006160007.26b20069@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  5 Oct 2018 15:30:19 +0200, Olivier Schonken wrote:
> This patch lets cups-filters only use gMemReport and memCheck functions
> if poppler version less than 0.69.0
> 
> The poppler project removed the memCheck and gMemReport functions in
> commits c362ab1b97f20c5b73b3bad8d52015f679178748 - Remove DEBUG_MEM
> from Object since this uses RAII now and hence cannot leak.
> (The existing tracking also is not thread-safe and hence unreliable.)
> 
> and
> 
> f89446f6917a869b0f1a80fcc8ce81a7213dade4 - Remove generic heap debugging
> from gmem since external tools and compiler instrumentation achieve the
> same effect.
> 
> A pull-request for the patch has also been created upstream at
> https://github.com/OpenPrinting/cups-filters/pull/66
> 
> Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
> ---
>  ...ed-memCheck-and-gMemReport-functions.patch | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 package/cups-filters/0002-Poppler-removed-memCheck-and-gMemReport-functions.patch

Applied to master, thanks. Thanks a lot for having submitted the patch
upstream, it has already been merged, which is nice!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
