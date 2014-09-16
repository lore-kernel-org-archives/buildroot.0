From: Oded Hanson <OHanson@xsightsys.com>
Date: Tue, 16 Sep 2014 16:24:00 +0000
Subject: [Buildroot] Missing Buildroot x86_64 CC Archiver tool in
 eclipse integration
In-Reply-To: <20140916175503.7fdd3a7d@free-electrons.com>
References: <8cbab74434594ef7ab6e81bc2eb88441@DBXPR07MB142.eurprd07.prod.outlook.com>
 <20140916175503.7fdd3a7d@free-electrons.com>
Message-ID: <56a77dc5115b45f194ca8744a6962fac@DBXPR07MB142.eurprd07.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas

I am not using autotools or a Makefile based project. I am creating a simple project based on the eclipse project wizards:

1. File -> New -> C++ Project
2.  Static Library -> Empty Project -> Choose Buildroot x86_64 toolchain
3. Finish

Once the project is created, I go to Project properties -> C/C++ Build -> Settings -> Build Artifacts. I see there that there is only a shared object and executable option. No static library.

When I go to the toolchain editor, I can see the list of tools (compiler, linker, etc.) but I don't see the archiver tool.. thus.. obviously that?s why we cannot build the static library.

I will maybe try to uninstall everything and reinstall and see if it helps...

Oded



-----Original Message-----
From: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com] 
Sent: Tuesday, September 16, 2014 10:55 PM
To: Oded Hanson
Cc: buildroot at busybox.net; M?lanie Bats
Subject: Re: [Buildroot] Missing Buildroot x86_64 CC Archiver tool in eclipse integration

Dear Oded Hanson,

On Fri, 5 Sep 2014 18:55:00 +0000, Oded Hanson wrote:

> I am trying to build a static library in eclipse using the buildroot toolchain and the buildroot eclipse plugin.
> 
> I have successfully created shared objects and executables but now 
> when I am trying to create a static library, I see that the eclipse 
> plugin doesn't identify the archiver tool, all though the 
> x86_64-buildroot-linux-gnu-ar tool was generated in my buildroot 
> output directory.

Could you give a few more details about how you're building your static library? Are you using an autotools based project, a Makefile based project, or a "managed build" project (where Eclipse takes care of the build system) ? M?lanie has tested a "managed build" project for a static library, and apparently, it worked fine. So maybe you're using your own Makefile or autotools based build system?

Thanks!

Thomas
--
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering http://free-electrons.com
