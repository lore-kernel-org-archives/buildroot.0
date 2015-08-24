From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 24 Aug 2015 22:07:48 +0200
Subject: [Buildroot] [PATCH] package/wf111: remove package
In-Reply-To: <20150823205857.1625a64f@free-electrons.com>
References: <1440202387-7291-1-git-send-email-yann.morin.1998@free.fr>
 <20150823163653.3989f210@free-electrons.com> <20150823153737.GD3729@free.fr>
 <20150823205857.1625a64f@free-electrons.com>
Message-ID: <55DB7994.8080509@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 I'm not going to comment on all the points made here, but my stance is: lthough
I also hate what the wf111 package does, I don't think it's bad enough to remove
it from buildroot. It doesn't hurt the rest of buildroot at all, and it is a
useful package for some users. I'd rather get rid of sparc than getting rid of
this package.


On 08/23/2015 08:58 PM, Thomas Petazzoni wrote:
[snip]
> They cannot change their mind. I even met a Bluegiga representative at
> a trade show a few months ago, and discussed with him the matter. The
> problem is that their hardware include a chip from a third-party
> manufacturer that does not allow redistributing the code without
> agreeing with some stupid licensing conditions. So there's nothing
> Bluegiga can do (except using a different vendor for their future
> products, but that will not solve the problem for wf111).

 I registered (under a false name and with a dummy e-mail address) and
downloaded the driver, and there is no license text available in it. I also did
not have to agree to any license conditions in order to register or download
anything. So either this representative is wrong about "does not allow
redistributing without licensing conditions", or the website designer botched
it. Probably the latter. Bottom line is: unless you have a separate agreement
with Bluegiga, you are not allowed to use this software for any purpose. I don't
understand how legal departments can let something like this pass but on the
other hand get all excited about some piece of GPLv3 in your product...

 The source code says "Refer to LICENSE.txt included with this source code for
details on the license terms.", but LICENSE.txt is missing. An earlier version
of the tarball has a LICENSE.txt with a MIT-like license or GPLv2. But anyway,
that obviously only applies to the sources, not to the userspace binaries that
are included and much less to the firmware blobs. So we probably can't host a
copy on sources.buildroot.org.


[snip]
>> That package is the *only* one we have in BR (unless I missed any) for
>> which this is not the case.

 Thomas DS is trying to push support for the Cavium toolchains...

[snip]
>> The day we use a testing framework (like your nice pending proposal), we
>> will start to see failures because of that package. And blacklisting it
>> in the autobuilders' code would not be the right answer.

 Actually, for any package that requires some kind of string option to be set
(e.g. most boot loaders), we'll always need exceptions in the autobuilders.

>>
>> So, I completely disagree with these non-removal arguments you made.
> 
> I agree that the non-testability of the package is annoying, but I
> don't really see how to overcome this problem. 

 Put the tarball somewhere in each autobuild instance and feed its path into the
config.

 Regards,
 Arnout


> Keep this package in
> private tree, and have every user of wf111 struggle with their
> sub-optimal build system? Not ideal either.
> 
> So I agree it's not ideal, but I'm not sure the removal of the package
> will actually make the situation better.
> 
> Best regards,
> 
> Thomas
> 

Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
