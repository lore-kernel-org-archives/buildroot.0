From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Nov 2015 14:29:58 +0100
Subject: [Buildroot] BR2_EXTERNAL - Broken in 2015.08.01????
In-Reply-To: <CAN34foz=B-ig5Ci4kE=UKk6p2qws2Pp-qzaQGgCoXpXco6SAuw@mail.gmail.com>
References: <CAN34foz=B-ig5Ci4kE=UKk6p2qws2Pp-qzaQGgCoXpXco6SAuw@mail.gmail.com>
Message-ID: <20151105142958.60a38821@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Stephen Beckwith,

On Thu, 5 Nov 2015 08:16:33 -0500, Stephen Beckwith wrote:
> I'm having an issue getting code to build using a BR2_EXTERNAL setup with
> the 2015.08.01 release of Buildroot.
> The Config.in file structure works just fine, the options specified show up
> in menuconfig and are selectable.  Defined CONFIG items (MUST they be
> BR2_XXXX names?) are listed at the bottom of the top level .config (using
> an "out of tree" build setup. . . )
> However, when I try to build the extra code, nothing happens.  This code is
> just simple "hello world" programs in a custom directory structure, using
> the generic-package setup.
> My initial attempt did produce some make errors, so I know build-root was
> parsing through the make files, but fixes to remove the warnings results in
> NO makes being run to compile and add the code to the build.
> I've reviewed the Slides & Lab Notes posted on-line from this years
> training session and reviewed the manual.  I have NO idea what's missing
> here.
> And yes, I have a .br-external file in the out of tree build directory
> (board as has been recommended - is this a MUST for Buildroot?) that is
> pointing to the external tree.
> I would GREATLY appreciate access to the magic decoder ring that will allow
> me to build this extra code as part of my embedded linux system.

Can you post:

 - The output of "tree" in your external tree

 - The contents of the top-level Config.in and external.mk of your
   external tree.

 - The contents of the Config.in and <package>.mk files of the package
   in your external tree that you are trying to build

Then we can probably point you to the issues that are causing the
problems.

Other than that:

 - Using a directory called board/ is not mandatory at all. You can
   name it whatever you want. The only things in the external tree that
   Buildroot enforces is the external.mk makefile, the top-level
   Config.in, and the configs/ subdirectory if you want to store
   defconfigs in your external tree.

 - There can be as many subdirectories you want in your external tree,
   as long as your external.mk (or the makefiles it includes) account
   for it.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
