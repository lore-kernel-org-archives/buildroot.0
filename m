From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 10 Oct 2014 08:45:57 +0200
Subject: [Buildroot] [PATCH] nginx: Depends on MMU
In-Reply-To: <1412917803-2523-1-git-send-email-yuvaraj.patil@wipro.com>
 (Yuvaraj Patil's message of "Fri, 10 Oct 2014 10:40:03 +0530")
References: <1412917803-2523-1-git-send-email-yuvaraj.patil@wipro.com>
Message-ID: <87y4so8lsq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yuvaraj" == Yuvaraj Patil <yuvaraj.patil@wipro.com> writes:

 > This package needs MMU. Hence added dependency on BR2_USE_MMU
 > Fixes:
 > http://autobuild.buildroot.net/results/224/2240f11fc52e07ff64913844078e2616842a63dc//

 > Signed-off-by: Yuvaraj Patil <yuvaraj.patil@wipro.com>
 > ---
 >  package/nginx/Config.in |    1 +
 >  1 file changed, 1 insertion(+)

 > diff --git a/package/nginx/Config.in b/package/nginx/Config.in
 > index da9fd01..b4a1e94 100644
 > --- a/package/nginx/Config.in
 > +++ b/package/nginx/Config.in
 > @@ -1,5 +1,6 @@
 >  comment "nginx needs a toolchain w/ largefile"
 >  	depends on !BR2_LARGEFILE
 > +	depends on BR2_USE_MMU # fork()
 
 >  menuconfig BR2_PACKAGE_NGINX
 >  	bool "nginx"

The real (BR2_PACKAGE_NGINX) option should also have this dependency,
not just the comment.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
