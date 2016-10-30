From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Oct 2016 18:37:34 +0100
Subject: [Buildroot] [PATCH v2 05/23]
 toolchain-external-blackfin-uclinux: new package
In-Reply-To: <20161030164752.GA18077@free.fr>
References: <1477742948-11490-1-git-send-email-romain.naour@gmail.com>
 <1477742948-11490-6-git-send-email-romain.naour@gmail.com>
 <20161030164752.GA18077@free.fr>
Message-ID: <20161030183734.26f568d4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 30 Oct 2016 17:47:52 +0100, Yann E. MORIN wrote:

> I think you could very well:
> 
>  1- introduce an empty infra that does nothing at all, except it does
>     exist;
> 
>  2- introduce the virtual package. It would not kick any dependency
>     until much later, but it would exist.

The virtual package should be named "toolchain-external", which clashes
with the existing "toolchain-external" package that you remove in step
(5). So you can't do your step (2) before doing your step (5), unless
of course you name the packages differently.

And all in all it doesn't change anything: it creates packages that are
not used/referenced by anything, until your step (5). Which is exactly
what's already happening.

So it's really a matter of taste of what is the less ugly option, but
all options will introduce code that is orphaned until the final commit
that switches everything over. With this in mind, going for one option
or another really doesn't make much difference. And knowing how painful
it is to keep this series up-to-date, I'm personally happy with the
current way things are introduced.

>  3- add the per pre-built toolchain packages liek you did
> 
>  4- implement the new infra
> 
>  5- turn toolchain/toolchain-external/toolchain-external.mk from a
>     generic package to a virtual package

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
