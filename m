From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 Jun 2015 12:45:39 +0200
Subject: [Buildroot] [PATCH v5 3/3] kyua: new package
In-Reply-To: <557B6890.30006@mind.be>
References: <1434063093-14906-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
 <1434063093-14906-4-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
 <20150612220205.5d0aa08b@free-electrons.com>
 <557B6890.30006@mind.be>
Message-ID: <20150613124539.5f4f37a3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Sat, 13 Jun 2015 01:17:36 +0200, Arnout Vandecappelle wrote:

> > 1/ Some installed stuff is probably unneeded:
> > 
> > ./usr/share/kyua/store
> > ./usr/share/kyua/store/schema_v3.sql
> > ./usr/share/kyua/store/migrate_v2_v3.sql
> > ./usr/share/kyua/store/migrate_v1_v2.sql
> 
>  I think these are needed to be able to create the report database. Ah, but the
> migrate scripts may indeed be redundant.
> 
> > ./usr/share/kyua/misc
> > ./usr/share/kyua/misc/report.css
> > ./usr/share/kyua/misc/test_result.html
> > ./usr/share/kyua/misc/index.html
> > ./usr/share/kyua/misc/context.html
> 
>  I believe these are needed to be able to generate html reports.

Ok.

> > 2/ The CFLAGS/LDFLAGS handling seems to go crazy with zillions of
> > duplicates of the same flags. At build time, one can see:
> 
>  Yeah, but that's an upstream problem, no? They include LUTOK_CFLAGS several
> times. Correcting that would be a feature patch.

Absolutely, and that's why I applied the patch anyway. My comment was
mainly a suggestion to report the problem upstream, so that it
hopefully gets fixed in a later version. For now, it is not a big
problem.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
