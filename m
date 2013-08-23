From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Aug 2013 13:14:41 +0200
Subject: [Buildroot] [PATCH v2 2/3] package: fix generic extract target
 for top-level parallel make
In-Reply-To: <CAHkwnC9tn=zA=WWxneiZeGCCxQ=b_Dfk-o_PBaf_AGBHeJWewg@mail.gmail.com>
References: <1374138746-23279-1-git-send-email-fabio.porcedda@gmail.com>
 <1374138746-23279-3-git-send-email-fabio.porcedda@gmail.com>
 <521513E3.8080401@mind.be> <20130823093642.3ff0e2bb@skate>
 <CAHkwnC9tn=zA=WWxneiZeGCCxQ=b_Dfk-o_PBaf_AGBHeJWewg@mail.gmail.com>
Message-ID: <20130823131441.313e63fa@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Fri, 23 Aug 2013 10:00:33 +0200, Fabio Porcedda wrote:

> > When I did some experiments on top-level parallel build some years ago,
> > it is also one of the problem I had seen. Today, if you decide to
> > rebuild "libfoo", it rebuilds libfoo only and that's it. If libfoo is
> > used by something else, it's your responsibility to rebuild this
> > something else. Of course, this is all possible because the chain of
> > dependencies uses virtual targets and not stamp files.
> 
> For this problem there is a simple solution, to use a
> "order-only-prerequisites", because
> a target is not rebuild if is older than a "order-only-prerequisites".
> 
> http://www.gnu.org/software/make/manual/html_node/Prerequisite-Types.html#Prerequisite-Types

Ah, yes, indeed!

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
