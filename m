From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 Oct 2015 04:54:11 +0100
Subject: [Buildroot] [PATCH] syslog-ng: Link against librt
In-Reply-To: <1445817733-12772-1-git-send-email-judge.packham@gmail.com>
References: <1445817733-12772-1-git-send-email-judge.packham@gmail.com>
Message-ID: <20151026045411.654c6ba5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Chris Packham,

On Mon, 26 Oct 2015 13:02:13 +1300, Chris Packham wrote:

> +# rabbit-mq needs -lrt
> +SYSLOG_NG_CONF_ENV = LIBS=-lrt

While this works, I believe a better solution is to fix the
configure.ac. It already checks if nanosleep is in librt, and if so,
links against librt.

It should the same for those functions, if the rabbitmq support is
enabled.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
