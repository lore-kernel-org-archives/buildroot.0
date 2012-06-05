From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 05 Jun 2012 23:17:52 +0200
Subject: [Buildroot] [PATCH 1/1] libcgi: fix cflags
In-Reply-To: <1338736512-21375-1-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Sun, 3 Jun 2012 17:15:12 +0200")
References: <1338736512-21375-1-git-send-email-s.martin49@gmail.com>
Message-ID: <87aa0hpif3.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 Samuel> Fixes http://autobuild.buildroot.org/results/4000a12a9b237bd12618eb22ea793a913fc73b4f
 Samuel> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 Samuel> ---
 Samuel>  package/libcgi/libcgi.patch |    2 +-
 Samuel>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, could you please add a git-style header with description and
your signed-off-by to this patch (and perhaps a more descriptive file
name)?

 Samuel> diff --git a/package/libcgi/libcgi.patch b/package/libcgi/libcgi.patch
 Samuel> index 716d83c..12a7b10 100644
 Samuel> --- a/package/libcgi/libcgi.patch
 Samuel> +++ b/package/libcgi/libcgi.patch
 Samuel> @@ -27,7 +27,7 @@
 Samuel>   exec_prefix = @exec_prefix@
  
 Samuel>  -SHAREDOPT = -shared
 Samuel> -+SHAREDOPT = -shared -fPIC,-Wl,-soname,libcgi.so.0
 Samuel> ++SHAREDOPT = -shared -fPIC -Wl,-soname,libcgi.so.0
 Samuel>   LIBDIR = $(prefix)/lib
 Samuel>  -INCDIR = $(prefix)/include
 Samuel>  +INCDIR = $(prefix)/include/libcgi/
 Samuel> -- 
 Samuel> 1.7.10.3

 Samuel> _______________________________________________
 Samuel> buildroot mailing list
 Samuel> buildroot at busybox.net
 Samuel> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
