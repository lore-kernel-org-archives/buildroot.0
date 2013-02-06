From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Feb 2013 12:41:48 +0100
Subject: [Buildroot] [PATCH] boost: bump version to 1.53.0
In-Reply-To: <CAP+5e18W7+M-bmRNJLaXhj2XdMAhnVgQgyvVUHMNk-3FOp-DGw@mail.gmail.com>
References: <1360143004-29603-1-git-send-email-victor.hiairrassary.ml@gmail.com>
 <1360143004-29603-2-git-send-email-victor.hiairrassary.ml@gmail.com>
 <20130206103244.68ca56b4@skate>
 <CAP+5e18W7+M-bmRNJLaXhj2XdMAhnVgQgyvVUHMNk-3FOp-DGw@mail.gmail.com>
Message-ID: <20130206124148.473db2e1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Victor Hiairrassary,

Would it be possible to use an e-mail client that complies with the
open-source community standards, by sending e-mails as plain text? The
plain text version of your e-mail makes no discussion between what you
said and what I said, which is very confusing.

On Wed, 6 Feb 2013 12:15:43 +0100, Victor Hiairrassary wrote:

>  Maybe there was a reason why "context" was unconditionally excluded
> from the build, before your patch. Did you check why?
> 
>  context was excluded because compilation is impossible with boost
> 1.52.0 and uClibc, there is a problem with uintptr_t and intptr_t.
> But this is fixed in latest version, 1.53.0.

Ok. This should be mentioned in the commit log, then.

> Also, it would be good to have a comment here that explains why python
> and atomic are unconditionally excluded for the build.
> 
>  atomic is a new boost library since boost 1.53.0. It is excluded because
> it can not compile with uClibc (uintptr_t missing too), but this is now
> fixed in
> trunk version, see ticket https://svn.boost.org/trac/boost/ticket/7979

Ok. This should be mentioned in a comment above the line that disables
the atomic module, so that we know in the future why it is disabled.

> In this patch, atomic is simply excluded. So either we wait for boost 1.54.0
> releasing orI can add the patch to fix atomic compilation in buildroot and
> add boost-atomic in menuconfig?

No, it's perfectly fine to have the atomic thing disabled for now,
since it wasn't available in Buildroot until now. I just want a comment
explaining why it's disabled.

> I do not nothing about pyhton exclusion, sorry.

Ok. But since you're not changing this, it's not necessarily your
responsibility to justify this, so we can leave this part as is.

Could you resubmit a new version of the patch, with more details in the
commit log, and a comment before the line disabling the atomic module?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
