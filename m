From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Oct 2017 10:12:49 +0100
Subject: [Buildroot] [RFC 2/2] linux: Add support for specifying a
 custom directory
In-Reply-To: <20171029072649.GA2899@scaer>
References: <1509242782-14524-1-git-send-email-f.fainelli@gmail.com>
 <1509242782-14524-3-git-send-email-f.fainelli@gmail.com>
 <20171029072649.GA2899@scaer>
Message-ID: <20171029101249.19a91e32@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 29 Oct 2017 08:26:49 +0100, Yann E. MORIN wrote:

> On 2017-10-28 19:06 -0700, Florian Fainelli spake thusly:
> > Add the ability to specify a path to a custom directory where kernel sources
> > may be contained. This is useful when doing kernel development in an existing
> > git tree.  
> 
> This case is covered by the override-sourcedir mechanism.
> 
> Create a file (by default, local.mk) in your config directory (the one
> with the Buildroot .config file), and edit this file with:
> 
>     LINUX_OVERRIDE_SRCDIR = /path/to/your/linux
> 
> and Buildroot will use that as a rsync source, instead of downloading
> the kernel sources.
> 
> See also e782cd5b1bc (Revert "Added local directory as source of kernel
> code") for more in-depth explanations. ;-)

Fully agreed with Yann here: there is no point in adding a
Linux-specific solution for this use case, as we already have a much
more general solution that works for all packages, including the
'linux' package.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
