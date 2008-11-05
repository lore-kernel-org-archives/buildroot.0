From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Wed, 5 Nov 2008 13:50:09 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
In-Reply-To: <20081105103943.7725b98b@hcegtvedt>
References: <20081030140206.411543C2BE@busybox.net>
	<20081104201732.54f83c0c@surf> <20081105103943.7725b98b@hcegtvedt>
Message-ID: <20081105135009.71a6dccd@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 5 Nov 2008 10:39:43 +0100
Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com> wrote:

> On Tue, 4 Nov 2008 20:17:32 +0100
> Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> > Le Thu, 30 Oct 2008 07:02:06 -0700 (PDT),
> > egtvedt at uclibc.org a ?crit :

<snipp>

> > > +	rm -rf
> > > $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION_PROBED)
> > 
> > And this one (which evaluates LINUX26_VERSION_PROVED) breaks with:
> > 
> > Makefile:1561: *** kernelrelease not valid - run 'make prepare' to
> > update it.  Stop.
> > 
> 
> Hmmm, weird, the Makefile should not install the modules before after
> the kernel is prepared.
> 

Indeed it does, linux26-modules is added to TARGETS before the
makefiles in target are added. Which results in your error. Wonder why
this hit you and not me, I did a test run from scratch.

Anyway, solution is easy, the modules must depend on
$(LINUX26_DIR)/.depend_done instead of $(LINUX26_DIR)/.configured.
depend_done should really be a .prepare_done IMHO.

Doing a test build now.

<snipp>

-- 
Best regards,
Hans-Christian Egtvedt
