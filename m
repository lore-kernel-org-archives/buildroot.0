From: Romain Naour <romain.naour@smile.fr>
Date: Sat, 30 Sep 2017 10:11:38 +0200
Subject: [Buildroot] build failure netsniff-ng-0.6.3
In-Reply-To: <15ed0b6bdb0-c09-38edf@webjas-vad019.srv.aolmail.net>
References: <15ed0b6bdb0-c09-38edf@webjas-vad019.srv.aolmail.net>
Message-ID: <f46ffca2-da09-7e70-5387-7aa220d65a69@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ross,

Le 30/09/2017 ? 04:56, grunpferd at netscape.net a ?crit?:
> The following compile errors occurred during building?netsniff-ng-0.6.3.
> 
> This used to work successfully previously. Using an internal toolchain ggc6 / glibc.
> 
> Changed to latest linux-4.13.4 kernel.?
> 
> The following compile errors get reported:
> 
> Building mausezahn:
> ?CC ???str.c
> ?CC ???die.c
> ?CC ???dev.c
> ?CC ???sock.c
> ?CC ???link.c
> ?CC ???sysctl.c
> ?CC ???xmalloc.c
> ?CC ???staging/layer1.c
> ?CC ???staging/layer2.c
> ?CC ???staging/layer3.c
> ?CC ???staging/layer4.c
> ?CC ???staging/hextools.c
> ?CC ???staging/tools.c
> staging/tools.c: In function ?get_ip6_range_count?:
> staging/tools.c:485:10: error: ?UINT64_MAX? undeclared (first use in this function)
> ??return UINT64_MAX;
> ?????????^~~~~~~~~~
> staging/tools.c:485:10: note: each undeclared identifier is reported only once
> for each function it appears in
> Makefile:184: recipe for target 'mausezahn/staging/tools.o' failed
> make[1]: *** [mausezahn/staging/tools.o] Error 1
> 
> 
> It looks that UINT64_MAX is not declared.
> 
> This was working fine recently. Using latest buildroot git master along with
> latest linux-4.13.4.

Missing stdint.h header in staging/tools.c ?
Adding it fixes the issue.

Best regards,
Romain

> 
> Regards,
> 
> Ross
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
