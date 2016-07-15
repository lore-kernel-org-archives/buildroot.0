From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 14:32:16 +0200
Subject: [Buildroot] [PATCHv2] package/libgpg-error: fix no-thread build
In-Reply-To: <1468506638-24170-1-git-send-email-yann.morin.1998@free.fr>
References: <1468506638-24170-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160715143216.0a418488@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 14 Jul 2016 16:30:38 +0200, Yann E. MORIN wrote:
> Including the pthreads header was not properly guarded; fix that.
> 
> Disable building tests, as they are not really needed for Buildroot.
> 
> Note that autoreconfiguring is very noisy and spits out a lot of git
> errors as their configure.ac expects, and even *requires* to be run from
> a git clone. Although reported as fatal errors, it's just git whining.
> We can ignore them.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/049/0495d60556139de8f3f6df420d9a226ee8a432a0/
>     http://autobuild.buildroot.org/results/0d1/0d12423877b4aac2a18fac651063de98774b5108/
>     [...]

In the mean time, your patches have been merged upstream (thanks for
doing this work!), upstream has done a new release, and Vicente has
sent patches to bump libgpg-error. So I've merged Vicente patches.

Therefore, I think the no thread problem is gone. The only thing that
remains to be done is disabling the tests. Could you send a patch that
does just this?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
