From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 12 Sep 2014 23:19:06 +0200
Subject: [Buildroot] [PATCH 03/12] xapp_xinit: depends on MMU
In-Reply-To: <1410537011-29662-4-git-send-email-jezz@sysmic.org>
 (=?utf-8?B?IkrDqXLDtG1l?=
 Pouiller"'s message of "Fri, 12 Sep 2014 17:50:02 +0200")
References: <1410537011-29662-1-git-send-email-jezz@sysmic.org>
 <1410537011-29662-4-git-send-email-jezz@sysmic.org>
Message-ID: <87ioksbkqd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?r?me" == J?r?me Pouiller <jezz@sysmic.org> writes:

 > Fixes http://sysmic.org/~jezz/results/8b5af679:
 > xinit.o: In function `_main':
 > xinit.c:(.text+0x65e): undefined reference to `_fork'
 > xinit.c:(.text+0x7d4): undefined reference to `_fork'
 > collect2: ld returned 1 exit status

 > Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
 > ---
 >  package/x11r7/xapp_xinit/Config.in | 3 ++-
 >  1 file changed, 2 insertions(+), 1 deletion(-)

 > diff --git a/package/x11r7/xapp_xinit/Config.in b/package/x11r7/xapp_xinit/Config.in
 > index aede5d9..6537d89 100644
 > --- a/package/x11r7/xapp_xinit/Config.in
 > +++ b/package/x11r7/xapp_xinit/Config.in
 > @@ -1,8 +1,9 @@
 >  config BR2_PACKAGE_XAPP_XINIT
 >  	bool "xinit"
 > +	depends on BR2_USE_MMU # fork()
 >  	# Runtime dependency: can't start an X server unless there is one
 >  	depends on BR2_PACKAGE_XSERVER_XORG_SERVER
 > -	# Runtime dependency; mcookie is also in util-linux
 > +	#Runtime dependency; mcookie is also in util-linux

I'm not sure why you want to change this. Committed without this line,
thanks.

-- 
Bye, Peter Korsgaard
