From: Heiko Zuerker <heiko@zuerker.org>
Date: Mon, 27 Dec 2010 14:53:58 -0600
Subject: [Buildroot] [PATCH] netperf: add Gentoo patch to fix buffer
 overflow compiler warnings
In-Reply-To: <87vd2flzaz.fsf@macbook.be.48ers.dk>
References: <855e95b6e3f2b8aba90318035d9951ac9d1a5cb3.1293384653.git.smiley73@users.sourceforge.net>
	<87vd2flzaz.fsf@macbook.be.48ers.dk>
Message-ID: <20101227145358.27936rq72gzp6d4w@www.home.zuerker.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Quoting Peter Korsgaard <jacmet@uclibc.org>:

>>>>>> "heiko" == heiko  <heiko@zuerker.org> writes:
>
>  heiko> From: Heiko Zuerker <smiley73@users.sourceforge.net>
>  heiko> Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
>  heiko> ---
>  heiko>  package/netperf/netperf-2.4.5-netserver.patch |   51  
> +++++++++++++++++++++++++
>
> So this just fixes a build warning, and otherwise doesn't affect the
> resulting binaries?

I "borrowed" this patch from Gentoo and my C skills are very basic.  
But from what I understand it just ge'st rid of the warnings but  
doesn't change the functionality.
I do use a hardened toolchain for my compile and they won't compile  
the code without the modification.

>  heiko> ++++ b/src/netserver.c
>  heiko> +@@ -142,7 +142,7 @@
>  heiko> +
>  heiko> + #ifndef DEBUG_LOG_FILE
>  heiko> + #ifndef WIN32
>  heiko> +-#define DEBUG_LOG_FILE "/tmp/netperf.debug"
>  heiko> ++#define DEBUG_LOG_FILE "/var/log/netperf.debug"
>
> What's the reason for this change?

I left this in the patch on purpose, since log files belong into  
/var/log and not /tmp.


-- 

Regards
   Heiko Zuerker
   http://www.devil-linux.org


----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.
