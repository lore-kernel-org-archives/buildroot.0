From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Wed, 30 Oct 2013 10:34:36 -0500
Subject: [Buildroot] [PATCHv2 0/5] Add apache thrift
In-Reply-To: <52711A1C.3090006@zacarias.com.ar>
References: <1383092916-4293-1-git-send-email-gustavo@zacarias.com.ar>
 <OFFDA9CD4F.D79FA1A1-ON86257C14.0003E215-86257C14.0004BF76@rockwellcollins.com>
 <52711A1C.3090006@zacarias.com.ar>
Message-ID: <OF846496E2.197638BA-ON86257C14.00532388-86257C14.00558FBD@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo,

Gustavo Zacarias <gustavo@zacarias.com.ar> wrote on 10/30/2013 09:39:24 
AM:

> On 10/29/2013 09:51 PM, rjbarnet at rockwellcollins.com wrote:

> FOO_DEPENDENCIES = thrift
> You'll need the runtime libs which implement all the networking stack
> besides the host tool to compile.
> A thrift definition file assembles into target source code with the tool
> with the chosen language. This could ostensibly be done outside
> buildroot, but very few distributions ship the thrift tool.
> Coarsely speaking it would fit in a build process like bison or flex.

Ok, thanks for the insight and yes of course I forgot about the target 
version.
 
> > define FOO_BUILD_CMDS
> >         # This assumes that the package's Makefile uses THRIFT for the
> > compiler
> >         $(TARGET_MAKE_ENV) $(MAKE) THRIFT=$(HOST_DIR)/usr/bin/thrift 
-C
> > $(@D)
> > endif
> 
> Not really, for a package/project with a proper Makefile you'd just
> point THRIFT=$(HOST_DIR)/usr/bin/thrift to it and be handled internally
> as part of the overall build process.
> 
> > Granted there is more each of the packages but this covers the thrift
> > specific parts. Please correct me if I have made incorrect assumptions
> > with how you envisioned utilizing THRIFT.
> 
> We can always define $(THRIFT) to make it handy for developers like it's
> done for QT_QMAKE for example - but being generally used with specific
> parameters (target language mostly) it would just point to the binary
> since it's pretty much self-contained.

Thank for you clarifying this for me. I will try to get around to testing 
out your patches here by the end of the week.

Thanks,
-Ryan 
