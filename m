From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Mar 2015 17:47:14 +0100
Subject: [Buildroot] [PATCH v3 1/1] tovid: new package
In-Reply-To: <5509A386.1030107@ou.edu>
References: <1426691741-3961-1-git-send-email-skenton@ou.edu>
 <20150318164628.3a84b974@free-electrons.com>
 <5509A386.1030107@ou.edu>
Message-ID: <20150318174714.2e552220@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steve Kenton,

On Wed, 18 Mar 2015 11:10:46 -0500, Steve Kenton wrote:

> > Why is this patch needed? Does the documentation build requires
> > additional dependencies?
> Yes, with an SVN checkout it is required to get txt2tags to build the man page
> "To build the manpage, you will need txt2tags:
>     http://txt2tags.sourceforge.net"

Ok, please indicate this in the patch description then.

> >> +	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # procps_ng
> > 
> > Can you comment on why specifically procps_ng is needed?
> pgrep and IIRC pkill
> "todisc:assert_dep pgrep "You need the pgrep program to use todisc"

Ok. Then please indicate this as well in a comment above the "select
BR2_PACKAGE_PROCPS_NG" line.

> > Amongst those dependencies, it would be great to denote which ones are
> > actual build dependencies, and which ones are only runtime dependencies.
> I think python is the only build dependency - the rest are runtime
> assuming we kill the man page

Ok, then please say so in a comment in the Config.in file.

Essentially, anything that isn't obvious generally needs a comment
somewhere :-)

> >> +TOVID_SITE = http://tovid.googlecode.com/svn/trunk/tovid
> > 
> > Google Code is closing. Is there a better location for this project? Or
> > is the project planning to move to some other place in the near future ?
> Did not know that, will investigate.

Well, I think it's fine for now, the source URL can always be changed
later when the project moves elsewhere. There have been some changes
recently (today, yesterday, etc.) so the project seems to be maintained.

BTW, I don't remember if I asked: why would you want to run something
such as tovid on an embedded system? What's the final use case?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
