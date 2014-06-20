From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Jun 2014 12:11:54 +0200
Subject: [Buildroot] [PATCH] Makefile: document make <package>-dirclean
In-Reply-To: <CAAXf6LXBfosgS1dBZtx8ZMp_bEsxeyALNSOnMAEt7aS-nXpVMg@mail.gmail.com>
References: <20140619182648.GB3534@free.fr>
 <409511316.213968.1403203738913.JavaMail.root@mail>
 <20140619201047.GC3534@free.fr>
 <CAAXf6LXBfosgS1dBZtx8ZMp_bEsxeyALNSOnMAEt7aS-nXpVMg@mail.gmail.com>
Message-ID: <20140620121154.39a88ecb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Fri, 20 Jun 2014 11:40:10 +0200, Thomas De Schampheleire wrote:

> According to me, foo-dirclean is much more useful to the typical user
> than foo-rebuild or foo-reconfigure.

I agree.

> The latter two actions are
> typically used for OVERRIDE_SRCDIR only, right? While -dirclean can be
> used for any kind of (mis)action you performed.

Well, I also use -rebuild and -reconfigure when I directly hack into
output/build/<pkg>-<version>/ to do a quick test.

> So while I agree that some make targets should be listed to make sure
> the unsuspecting user is aware that they exist, dirclean would
> definitely be a part of this list, while rebuild/reconfigure need not
> necessarily IMO.

True.

> Maybe we should create a list of all the possible targets (here in
> this thread I mean) and then decide case-by-case if it's necessary to
> list them in 'make help' or not?

Another possible solution would be to have a <pkg>-help target that
lists all targets that are possible on a package, and then the main
"make help" only references that.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
