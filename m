From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 May 2015 15:32:16 +0200
Subject: [Buildroot] [PATCH 4/6] postgresql: mark as not available for
 static linking
In-Reply-To: <87mw14br9l.fsf@dell.be.48ers.dk>
References: <1431714233-24324-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1431714233-24324-4-git-send-email-thomas.petazzoni@free-electrons.com>
 <87mw14br9l.fsf@dell.be.48ers.dk>
Message-ID: <20150516153216.1eab6cf4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Sat, 16 May 2015 15:12:22 +0200, Peter Korsgaard wrote:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
>  > postgresql currently does not build in BR2_STATIC_LIBS=y
>  > configurations, and since there is little interest in using such a big
>  > piece of software in statically linked configuration, this commit
>  > makes postgresql depends on !BR2_STATIC_LIBS.
> 
>  > Fixes:
> 
>  >   http://autobuild.buildroot.net/results/f9ed96d22e91cdba9ad92c4d4ea52e422bf1f1c9/
> 
>  > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> What about the reverse dependencies?
> 
> git grep 'select BR2_PACKAGE_POSTGRESQL'
> package/bandwidthd/Config.in:   select BR2_PACKAGE_POSTGRESQL
> package/collectd/Config.in:     select BR2_PACKAGE_POSTGRESQL
> package/php/Config.ext: select BR2_PACKAGE_POSTGRESQL
> package/qt/Config.sql.in:       select BR2_PACKAGE_POSTGRESQL
> package/qt5/qt5base/Config.in:  select BR2_PACKAGE_POSTGRESQL

Gah, shit indeed. For some reason I assumed postgresql is an
application, not a library, so it should not have reverse dependencies.
I'll fix that up and resend.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
