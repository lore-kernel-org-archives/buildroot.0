From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Dec 2013 00:05:40 +0100
Subject: [Buildroot] [RFC] pkg-python infrastructure
In-Reply-To: <OFCFB88498.0047424B-ON86257C0F.0057371F-86257C0F.0057386F@rockwellcollins.com>
References: <OFCFB88498.0047424B-ON86257C0F.0057371F-86257C0F.0057386F@rockwellcollins.com>
Message-ID: <20131205000540.5291300a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

On Fri, 25 Oct 2013 10:52:54 -0500, Ryan Barnett wrote:

> A while back (about a week ago) - Gustavoz Zacarias, Thomas Petazzoni, and 
> myself - were having a conversation on the IRC about creating a new 
> package type for handling the builds of python packages. If I recall 
> correctly, this is what we discussed. I would like to just have some 
> record on how we want to handle building python packages.
> 
> Thomas P and Gustavoz - please correct/expand on any points that I may be 
> missing.

Following this discussion, I've started working on this. The current
status of the work is available at:

 http://git.free-electrons.com/users/thomas-petazzoni/buildroot/log/?h=python-pkg

The most important commit is:

 http://git.free-electrons.com/users/thomas-petazzoni/buildroot/commit/?h=python-pkg&id=5880956ce258b15887049ca5850007395cfd1857

It works quite well with distutils, there are a some issues with
setuptools packages: I'll probably need to distinguish them. There are
also a few more Python packages that have not been converted.

I've limited myself to support Python 2.x for the moment: the idea is
that once all Python packages have been converted to the
infrastructure, it will be easier to extend it to also cover Python 3.x.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
