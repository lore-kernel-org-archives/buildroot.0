From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 15:09:46 +0100
Subject: [Buildroot] [PATCH 1/5] support/testing: core testing
 infrastructure
In-Reply-To: <58b7796915aa8_1c373ff168005f0c91983@ultri3.mail>
References: <1486467363-19881-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <58b7796915aa8_1c373ff168005f0c91983@ultri3.mail>
Message-ID: <20170305150946.56cab1cd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 01 Mar 2017 22:46:17 -0300, Ricardo Martincoski wrote:

> Support for arch="i386" from test_iso9660 is missing here:
>         else:
>             qemu_arch = arch

Re-added this. I guess it had been lost during one of the cleanup
sessions. I've retested one of the iso9660 test cases, and it now
passes correctly.

> Maybe we can do for now as scanpypi does:
> #!/usr/bin/python2

Fixed.

> > +import string  
> 
> Not used.

Ditto.

> > +    if not os.path.exists(args.output):
> > +        print "The selected output directory does not exist"
> > +        return 1
> > +
> > +    BRTest.outputdir = args.output  
> 
> Maybe changing this line to:
>     BRTest.outputdir = os.path.abspath(args.output)
> would fix the use of relative path with some testcases.

Indeed, this fixes the problem you mentioned.

All of this will be in v2. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
