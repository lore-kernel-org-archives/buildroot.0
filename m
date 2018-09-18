From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 18 Sep 2018 09:30:31 +0000
Subject: [Buildroot] [PATCH] libaio: Fix library creation for ARC with
 -Os
In-Reply-To: <20180918112657.7d1b9d28@windsurf>
References: <20180917204329.15787-1-abrodkin@synopsys.com>
 <20180918093604.0b421d5c@windsurf>
 <c9ec03f9f05e251fd8e7b99c0ffb06593db32b1c.camel@synopsys.com>
 <20180918111506.0648d78c@windsurf>
 <aae1bc5da723d9dd98ddd4dcc7868e4dacb4b6f8.camel@synopsys.com>
 <20180918112657.7d1b9d28@windsurf>
Message-ID: <99fcad6be0ba045a8d00274723ac511be2805aac.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cuper, Claus,

On Tue, 2018-09-18 at 11:26 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 18 Sep 2018 09:17:20 +0000, Alexey Brodkin wrote:
> 
> > > Thank you, I do understand that passing LDFLAGS=-lgcc will add -lgcc to
> > > the link command line :-)
> > > 
> > > The question is: why does libaio needs to be told explicitly to link
> > > against libgcc, and not any other package.
> > > 
> > > And I believe the reason is because -nostdlib -nostartfiles are used.
> > > Why is libaio using those flags? Is there a good reason ?  
> > 
> > I tried removing those 2 as the first thing but it made no difference
> > until I added "-lgcc" explicitly.
> 
> Then there is another toolchain bug, because linking against libgcc
> should be done automatically as soon as a libgcc feature gets used by
> the thing being compiled/linked.

What do you think about that?

-Alexey
