From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 Dec 2018 00:12:23 +0100
Subject: [Buildroot] [PATCH] squashfs: do not force gzip support if
 lz4/xz/zstd is selected
In-Reply-To: <20181207202432.76868c40@gmx.net> (Peter Seiderer's message of
 "Fri, 7 Dec 2018 20:24:32 +0100")
References: <20181207131356.14366-1-peter@korsgaard.com>
 <20181207202432.76868c40@gmx.net>
Message-ID: <87pnud53u0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Hello Peter,
 > On Fri,  7 Dec 2018 14:13:55 +0100, Peter Korsgaard <peter@korsgaard.com> wrote:

 >> The logic to ensure at least one compression backend is selected was not
 >> updated when lz4, xz and zstd were introduced -  Fix that.
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 >> ---
 >> package/squashfs/Config.in | 7 ++++++-
 >> 1 file changed, 6 insertions(+), 1 deletion(-)
 >> 
 >> diff --git a/package/squashfs/Config.in b/package/squashfs/Config.in
 >> index c16ebbf27f..fdd8833060 100644
 >> --- a/package/squashfs/Config.in
 >> +++ b/package/squashfs/Config.in
 >> @@ -2,7 +2,12 @@ config BR2_PACKAGE_SQUASHFS
 >> bool "squashfs"
 >> depends on BR2_TOOLCHAIN_HAS_THREADS
 >> depends on BR2_USE_MMU # fork()

 > Nitpick: maybe a short comment here is helpful (I missed the line while
 > adding zstd support)?

 >   # ensure at least on compression backend (defaults to gzip)

Committed after adding this comment, thanks.

-- 
Bye, Peter Korsgaard
