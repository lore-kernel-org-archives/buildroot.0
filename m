From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Mar 2015 19:47:53 +0100
Subject: [Buildroot] [PATCH v3 3/8] postgresql: enable bfin compile
In-Reply-To: <1426017584-6096-3-git-send-email-ps.report@gmx.net>
References: <1426017584-6096-1-git-send-email-ps.report@gmx.net>
 <1426017584-6096-3-git-send-email-ps.report@gmx.net>
Message-ID: <20150315194753.4ba5c156@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Tue, 10 Mar 2015 20:59:39 +0100, Peter Seiderer wrote:

> +# unsupported platform, overwrite manually
> +ifeq ($(BR2_bfin),y)
> +POSTGRESQL_CONF_OPTS += --with-template=linux
> +endif

Do we really need to make this conditional? I believe
--with-template=linux is fine in all cases since Buildroot only targets
Linux.

So what about having --with-template=linux unconditionally in
POSTGRESQL_CONF_OPTS instead?

If that's OK for you, I can adjust this when applying.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
