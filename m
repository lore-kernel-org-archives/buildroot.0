From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 28 Mar 2014 17:50:46 +0100
Subject: [Buildroot] [PATCH 1/1] system: add ability to pass additional
 users tables.
In-Reply-To: <20140328111056.GA28624@pc-eric>
References: <1395937176-7585-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1395937176-7585-2-git-send-email-eric.le.bihan.dev@free.fr>
 <20140327181915.GA4458@free.fr> <20140328111056.GA28624@pc-eric>
Message-ID: <20140328165046.GA3303@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eric, All,

On 2014-03-28 12:10 +0100, Eric Le Bihan spake thusly:
> On Thu, Mar 27, 2014 at 07:19:15PM +0100, Yann E. MORIN wrote:
> > Eric, All,
> >
> [...]
> >
> > There is a discrepancy bewteen the description commit log and this help
> > text, and the actual behaviour. The commit log and help text both
> > explain this can be a space-separated list of files, but in the code you
> > just treat it as if it were a unique file:
> >
> >     ifneq ($$(ROOTFS_USERS_TABLE),)
> >         cat $$(ROOTFS_USERS_TABLE) > $(USERS_TABLE)
> >     endif
> >
> > I think you should do something like:
> >
> >     $(foreach f,$$(ROOTFS_USERS_TABLE),cat $$(f) >>$(USERS_TABLE)$(sep))
> In fact I use the same trick as for ROOTFS_DEVICE_TABLES: whether
> ROOTFS_USERS_TABLE is 'foo' or 'foo bar quux', the invocation of `cat` is
> valid, as `cat` takes a list of filenames as arguments. So no need to loop
> on a list.

Oh, right. OK, then.

> But it is true that I should use the plural form ROOTFS_USERS_TABLES.

Yes, please.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
