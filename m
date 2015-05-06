From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 May 2015 23:42:34 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <1430945922.2395.16.camel@synopsys.com>
References: <20150506063017.6B6A61015C1@stock.ovh.net>
 <20150506094236.114894a2@free-electrons.com>
 <1430945922.2395.16.camel@synopsys.com>
Message-ID: <20150506234234.189dd169@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Wed, 6 May 2015 20:58:43 +0000, Alexey Brodkin wrote:

> That failure looks pretty expected to me.

[...]

> So I'm not sure how to solve it properly.
> I would say that building of shared object should not happen if
> BR2_STATIC_LIBS=y, and probably we need to patch Python build system to
> troubleshoot that problem.
> 
> I'm also wondering if something similar happens for other arches?

You're absolutely correct.

However, python has been marked as "depends on !BR2_STATIC_LIBS"
recently, in commit 5b4d18dd1cc33c4cfd62a20704f4c48d2097c9c1. So this
means that something is selecting Python without taking care of this
dependency.

Peter, it seems like when you did this commit, you didn't take into
account the places where BR2_PACKAGE_PYTHON is selected. Did you?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
