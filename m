From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Jul 2017 09:44:43 +0200
Subject: [Buildroot] [PATCH 1/1] capnproto: new package
In-Reply-To: <A9C99900-5E84-4FF4-9980-DBB39ED471AA@sonologic.nl>
References: <201707061544.v66FiZQQ020306@mx1.sonologic.net>
 <20170706211612.5c4bf11c@windsurf.lan>
 <A9C99900-5E84-4FF4-9980-DBB39ED471AA@sonologic.nl>
Message-ID: <20170707094443.3de6a9e0@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 07 Jul 2017 08:58:08 +0200, Koen Martens wrote:

> >Since upstream uses Git, we prefer to have a Git-formatted patch, i.e
> >generated with "git format-patch -N". It should also have a proper
> >commit title, i.e a single line at the beginning that summarizes the
> >commit, separated from the rest of the commit log by one empty line.  
> 
> Sure, except the published tarball is from a subdirectory of the
> upstream git repo. So creating a git patch with format-patch results
> in a patch that needs 'patch -p2' to apply in buildroot. I understand
> this is impossible. What do you prefer i do? Manually modify the
> patch to remove the subdir that should be stripped?

Gah, OK. Then perhaps a quick comment in the patch description would be
nice, like:

[Patch cannot be generated with git format-patch, as the upstream Git
repository directory layout doesn't match the tarball directory layout]

> >> +CAPNPROTO_DEPENDENCIES = host-capnproto  
> >
> >Could you give some details as to why the host capnproto is necessary
> >to build the target capnproto ?  
> 
> Capnproto provides a compiler to compile capnproto message
> definitions to c++ code. The library uses capnproto messages itself,
> and thus needs the capnproto compiler to compile. This obviously must
> be the host capnproto compiler, because the target compiler will not
> run on the compiling host.
> 
> Is that sufficient detail, or do you want this in the package files
> somewhere? If so, where?

A quick comment above the dependency would be nice, like:

# Needs the capnproto compiler on the host to generate C++ code from
# message definitions

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
