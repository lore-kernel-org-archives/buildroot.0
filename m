From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 28 Oct 2013 10:04:36 +0100
Subject: [Buildroot] [PATCH] nano: needs wchar
In-Reply-To: <1382915899-9041-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Sun, 27 Oct 2013 20:18:19 -0300")
References: <1382915899-9041-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87a9htu5p7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/317/3177b7d6168eec0620e4a1ade9166c9c84929e6e/

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  package/nano/Config.in | 1 +
 >  1 file changed, 1 insertion(+)

 > diff --git a/package/nano/Config.in b/package/nano/Config.in
 > index 9546fe7..80a3304 100644
 > --- a/package/nano/Config.in
 > +++ b/package/nano/Config.in
 > @@ -1,5 +1,6 @@
 >  config BR2_PACKAGE_NANO
 >  	bool "nano"
 > +	depends on BR2_USE_WCHAR
 >  	# full version uses fork()
 >  	select BR2_PACKAGE_NANO_TINY if !BR2_USE_MMU
 >  	select BR2_PACKAGE_NCURSES

You forgot the comment when not available. Committed with that fixed,
thanks.

-- 
Bye, Peter Korsgaard
