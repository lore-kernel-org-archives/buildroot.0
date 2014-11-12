From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Nov 2014 22:27:52 +0100
Subject: [Buildroot] Buildroot and kernel modules
In-Reply-To: <CAEk40fw3Kgtgq=mKdR3ib40tLtD5x4SF0sT0QJrrwKVCO_+BZA@mail.gmail.com>
References: <CAEk40fxcdS-gS9Q8LM-W8pKUP3=PUSkbL9Crq63kvcpG5LBf=Q@mail.gmail.com>
 <20141112110354.1a6bcc98@free-electrons.com>
 <A2A6A18A7161D44FBCA90D5B3AF90A2E5A5C3C97@AMEHLEX02.ehl.pri>
 <20141112133418.728a5f52@free-electrons.com>
 <CAEk40fw3Kgtgq=mKdR3ib40tLtD5x4SF0sT0QJrrwKVCO_+BZA@mail.gmail.com>
Message-ID: <20141112222752.228404f0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sid Bharij,

On Wed, 12 Nov 2014 12:25:45 -0600, Sid Bharij wrote:

> So I have the driver source file and makefile for it.
> Where does this part go into ? Does it go into the Config.in file or some
> top level makefile or the same makefile needed for compiling the driver
> code?

You seem to misunderstand what Buildroot is. Buildroot is a build
system, its aim is to build the various components of your embedded
Linux system. It is not meant to carry the source code of those
individual components.

So your driver source file and makefile for it has to be its own
project, stored somewhere (most likely under version control), and
Buildroot will download it from where it's located and build it.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
