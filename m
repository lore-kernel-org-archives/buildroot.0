From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 10:15:09 +0200
Subject: [Buildroot] [PATCH] lttng-babeltrace: fix build with standalone
 gettext
In-Reply-To: <1458418350-13924-1-git-send-email-jcmvbkbc@gmail.com>
References: <1458418350-13924-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20160701101509.548ba955@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Max,

On Sat, 19 Mar 2016 23:12:30 +0300, Max Filippov wrote:
> lttng-babeltrace can't detect that uuid_generate is provided by -luuid
> because the configure test fails with the following message:
>   libuuid.a(libuuid_la-randutils.o): In function `random_get_bytes':
>   randutils.c:(.text+0x204): undefined reference to `libintl_gettext'
> 
> Add LIBS=-lintl to configure options in case we're building with
> standalone gettext.
> Fixes:
>   http://autobuild.buildroot.net/results/1ab89c6e8d704bc28c9ff8b5ffda3f60e57a25b4/
> 
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>

According to Samuel, this is already fixed by commit
ef18eedce6f8daef20de1531efffb7d429f40b9d, so I've marked your patch as
Superseded. Let me know if you still see the problem even with
ef18eedce6f8daef20de1531efffb7d429f40b9d included.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
