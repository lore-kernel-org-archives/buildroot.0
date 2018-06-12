From: Trent Piepho <tpiepho@impinj.com>
Date: Tue, 12 Jun 2018 17:11:29 +0000
Subject: [Buildroot] [PATCH] core/sdk: generate the SDK tarball ourselves
In-Reply-To: <20180612115751.1a11c372@windsurf>
References: <20180609210607.13259-1-yann.morin.1998@free.fr>
 <e4bbb78b-8301-e576-7e65-f83d55e0da7b@mind.be>
 <1528737656.28705.131.camel@impinj.com> <20180611210125.108ff027@windsurf>
 <1528755055.28705.139.camel@impinj.com> <20180612115751.1a11c372@windsurf>
Message-ID: <1528823488.28705.143.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2018-06-12 at 11:57 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 11 Jun 2018 22:10:55 +0000, Trent Piepho wrote:
> 
> > Some ideas to avoid this:
> > 1. Make tarball generation a new target instead of "sdk".
> > 2. Make tarball generation the "sdk" target but add another target that
> > does what "sdk" used to do.
> 
> For both (1) and (2), the proposal of Yann is to have "make sdk" do
> what it does today + some new thing.
> 
> So there is nothing that prevents to continue using "make sdk" as
> you're using it today, and ignore the new tarball that is generated.
> I.e, the change Yann is proposing is backward compatible: "make sdk" is
> still doing what it used to do

But it will be much slower now, as creating and compressing gigabyte
tarballs takes a while.  If there were a prep-sdk target, then I could
use that.

> > 3. Allow the tarball path prefix to be specified in some way, so that
> > it is easier to inject into an automated process that uses the SDK. 
> > E.g., it can be defined as a constant in the defconfig, or passed from
> > a higher level to both buildroot when the SDK is made and to whatever
> > uses the SDK.
> 
> That is another option indeed. Perhaps that makes sense, yes.

I'd find it better, as I have jobs that make different types of SDK.  I
could give them different prefixes, but not have the prefix change from
commit to commit.
