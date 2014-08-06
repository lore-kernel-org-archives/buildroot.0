From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Aug 2014 23:01:06 +0200
Subject: [Buildroot] [PATCH v2 1/2] mongoose: bump to version 5.4
In-Reply-To: <1407271628-5996-1-git-send-email-zinosat@tiscali.it>
References: <1407271628-5996-1-git-send-email-zinosat@tiscali.it>
Message-ID: <20140806230106.1207c04e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Davide Viti,

On Tue,  5 Aug 2014 22:47:07 +0200, Davide Viti wrote:
> Avoid compilation of the server via the upstream Makefile which
> unconditionally uses -lssl
> 
> The -lssl flag is appended to MONGOOSE_CFLAGS whenever 
> BR2_PACKAGE_OPENSSL=y gets set.
> 
> 
> Signed-off-by: Davide Viti <zinosat@tiscali.it>
> ---
> Changes v1 -> v2:
>  - Expand commit log

Thanks, I've applied both patches. However, it would be good to work
with upstream to get those issues solved in a nicer way, by improving
upstream's Makefile and submitting your largefile related patch. Notice
that there are also other warnings when building mongoose:

/home/thomas/projets/buildroot/output/build/mongoose-5.4/mongoose.c:2495:0: warning: "R0" redefined [enabled by default]
In file included from /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/signal.h:375:0,
                 from /home/thomas/projets/buildroot/output/build/mongoose-5.4/mongoose.c:73:
/home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/sys/ucontext.h:44:0: note: this is the location of the previous definition
/home/thomas/projets/buildroot/output/build/mongoose-5.4/mongoose.c:2496:0: warning: "R1" redefined [enabled by default]
In file included from /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/signal.h:375:0,
                 from /home/thomas/projets/buildroot/output/build/mongoose-5.4/mongoose.c:73:
[... and more ...]

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
