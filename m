From: Dan Lyke <danlyke@flutterby.com>
Date: Fri, 17 Apr 2009 07:19:48 -0700
Subject: [Buildroot] Properly setting up hotplug
In-Reply-To: <20090417004209.GA12990@cloud.net.au>
References: <20090414103327.2fd69516@danhplaptop>
	<87eivtx0c4.fsf@macbook.be.48ers.dk> <20090416091027.6c6153fe@surf>
	<87ocuwa390.fsf@macbook.be.48ers.dk>
	<20090417004209.GA12990@cloud.net.au>
Message-ID: <20090417071948.1592090e@danhplaptop>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 17 Apr 2009 10:42:09 +1000
Hamish Moffatt <hamish@cloud.net.au> wrote:
> Are the individual package -clean targets of any value? I never use
> them, you are just rebuilding from the same source so what's changed?

Although makefiles *should* pick all the dependencies, it's my
experience that they don't. Especially when it comes to changing config
options or random stuff down in the board configs.

The command line

pushd  project_build_arm/at91sam9261ek/linux-2.6.28/ ; make clean ; popd

is an alias on my system...

Dan
