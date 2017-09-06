From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Sep 2017 21:57:12 +0200
Subject: [Buildroot] Add package Prosody
In-Reply-To: <20170906125410.ebi4ip7phfjramhu@sapphire.tkos.co.il>
References: <20170906124735.GA31394@debian>
 <20170906125410.ebi4ip7phfjramhu@sapphire.tkos.co.il>
Message-ID: <20170906215712.51cefb0e@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 6 Sep 2017 15:54:10 +0300, Baruch Siach wrote:

> On Wed, Sep 06, 2017 at 10:47:35PM +1000, Dushara Jayasinghe wrote:
> > Ok... take 2  
> 
> Not needed. Your first attempt was seen on the list.
> 
> http://lists.busybox.net/pipermail/buildroot/2017-September/201770.html
> 
> > This is my first post the BR mailing list so please treat it
> > as a request for comments.
> > 
> > I've created a BR package for Prosody, which I've tested on a
> > raspberry pi and was able to successfully register with an IM
> > client.
> > 
> > Thank you.  
> 
> Please send patches inline, not as attachments. Using 'git send-email' for 
> that should make it easier for you.

Let me rephrase what Baruch wanted to say here:

Thanks a lot for your contribution! It's great to see new people
using Buildroot and contributing to it.

However, in order to ease the review process, we like to receive
patches inline and not as attachments. Indeed, this allows us to simply
hit "reply" and comment on each part of the patch. This is a very
typical review process used in the open-source community. In order to
send patches inline, we recommend you to use "git send-email" as e-mail
clients very often rewrap text and therefore make patches unusable.

From a quick look to your package, here are a few comments:

 * Adding an entry to the DEVELOPERS would be needed, so that you get
   notified when there are build problems with your package.

 * Adding a prosody.hash file is also mandatory, so that Buildroot can
   check the integrity of the downloaded tarball.

 * Do you really need Lua 5.1 specifically? Other versions of Lua, or
   LuaJIT are not suitable ?

 * We don't have any BR2_PACKAGE_LIBID option in Buildroot, so this
   looks like a bug in your package.

 * You select lots of Lua packages in Config.in, but you do not depend
   on them in prosody.mk. You do not even depend on lua in prosody.mk,
   which means you have no guarantee that all those packages will be
   built before Prosody. You should clarify if those packages are build
   dependencies or runtime dependencies.

 * The license information should be more specific than MIT/X11. Is it
   MIT *or* X11, or a combination of both MIT code and X11 code ? If
   so, which part is under which license ?

 * Why do you install prosody to staging ? It doesn't seems like
   Prosody is a library. If that's correct, then installing to staging
   is not very useful.

Could you look into those comments, and send an updated version of your
contribution, using git send-email ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
