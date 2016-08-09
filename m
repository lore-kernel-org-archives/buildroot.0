From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Aug 2016 22:52:10 +0200
Subject: [Buildroot] [PATCH 1/1] libical: Create option to use builtin
 tzdata
In-Reply-To: <20160809194813.GD5779@free.fr>
References: <1470751327-64254-1-git-send-email-marc@khouri.ca>
 <20160809155550.GF845@tarshish> <20160809194813.GD5779@free.fr>
Message-ID: <20160809225210.7b9811c7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 9 Aug 2016 21:48:13 +0200, Yann E. MORIN wrote:

> > Why not detect this automatically? Something like (untested):
> > 
> > ifeq ($(BR2_PACKAGE_TZDATA),)
> > LIBICAL_CONF_OPTS += -DUSE_BUILTIN_TZDATA=true
> > endif  
> 
> I am not too fond of using bundle stuff when we already have the
> required support for it. So, if libical needs TZ info, forcibly enable
> it (or depend on it).

Agreed.

> The only gotcha is that we don;t install TZ for musl. However, from the
> look of it, it should be ready to support tzdata, so our current
> limitation is probably just incorrect. I'm trying to confirm that.

Yann has submitted a patch that adds TZ support for musl, and I already
merged it. So all what needs to be done is to "select
BR2_TARGET_TZ_INFO" in libical. Marc, could you submit such a patch?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
