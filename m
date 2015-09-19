From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Sep 2015 14:18:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/luaposix: add patch to fix musl
 compatibility
In-Reply-To: <1442272959-3181-1-git-send-email-joerg.krause@embedded.rocks>
References: <1442272959-3181-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20150919141846.4ff8917a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?rg,

On Tue, 15 Sep 2015 01:22:39 +0200, J?rg Krause wrote:
> Backport patch from upstream to fix musl build error:
> 
> ```
> In file included from ext/posix/posix.c:25:0:
> ext/posix/sched.c: In function 'Psched_setscheduler':
> ext/posix/sched.c:74:9: error: variable 'sched_param' has initializer but incomplete type
>   struct sched_param sched_param = {0};
> ```
> 
> Fixed upstream by commit 11cc8a2973569ec7fb1e7c2466dca0282944b124.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Since the patch touches the configure.ac script, you should have added
<pkg>_AUTORECONF = YES in the .mk file. Otherwise, the build fails.

I've done this change, and applied your patch.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
