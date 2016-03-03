From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Mar 2016 09:15:33 +0100
Subject: [Buildroot] [PATCH 1/4] Add package go-bootstrap
In-Reply-To: <1456967467.13916.108.camel@infradead.org>
References: <cover.1456946494.git.geoff@infradead.org>
 <a316e4d5ff70594e8f4cccbb819ebf6d9a32e958.1456946494.git.geoff@infradead.org>
 <20160302234349.7448884e@free-electrons.com>
 <1456967467.13916.108.camel@infradead.org>
Message-ID: <20160303091533.740c7898@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 02 Mar 2016 17:11:07 -0800, Geoff Levand wrote:

> > Will Go 1.4.x always be capable of building newer Go compilers ?
> 
> Yes, at least that is the current situation.  FYI, the go bootstrap
> plan is documented here:
> 
>   https://docs.google.com/document/d/1OaatvGhEAq7VseQ9kkavxKNAfepWy2yhPUBs96FGV28

OK, thanks for the pointer.

> > Is it normal to copy source code to HOST_DIR ?
> 
> There is a known issue which requires the source tree to be installed:
> 
>   https://golang.org/issue/2775
> 
> I'll add a comment to the .mk file.

Yes good idea.

> > > +> > 	> > cp -a $(@D)/pkg $(GO_BOOTSTRAP_FINAL)/
> > > +> > 	> > chmod -R +x $(GO_BOOTSTRAP_FINAL)/pkg/tool
> > 
> > Why aren't those tools already installed +x by the build process ?
> 
> This is not needed I'll remove the line here and in go.mk.

Great, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
