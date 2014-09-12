From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Sep 2014 11:50:03 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <39A54937CC95F24AA2F794E2D2B66B1356D2009A@de02wembxa.internal.synopsys.com>
References: <20140912063012.AF99B100DEE@stock.ovh.net>
 <20140912101105.1e932cb8@free-electrons.com>
 <39A54937CC95F24AA2F794E2D2B66B1356D2009A@de02wembxa.internal.synopsys.com>
Message-ID: <20140912115003.23dbfff3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Anton Kolesov,

On Fri, 12 Sep 2014 09:45:26 +0000, Anton Kolesov wrote:

> This issue has been reported to our compiler engineers half a year ago. That
> seems to be a bug in the type definitions in ARC GCC, because GCC expects
> arguments of type "signed size_t", yet it doesn't even allows to declare a
> variable of this type. I've just sent a reminder about this issue to the team.

Ok.

> As a workaround we can submit patch that will add -Wno-error=format to this
> package. Is it ok?

That would be OK, but a better fix would be to change the package to
remove -Werror entirely, or at least make it conditional (in which case
the patch could be proposed upstream).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
