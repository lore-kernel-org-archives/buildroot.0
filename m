From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Apr 2017 16:21:14 +0200
Subject: [Buildroot] [PATCH v2 0/9] A checkpackage script that verifies
 a package coding style
In-Reply-To: <20170219221724.27298-1-ricardo.martincoski@gmail.com>
References: <20161231032110.11573-1-ricardo.martincoski@gmail.com>
 <20170219221724.27298-1-ricardo.martincoski@gmail.com>
Message-ID: <20170408162114.6e6c8899@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 19 Feb 2017 19:17:15 -0300, Ricardo Martincoski wrote:

> Ricardo Martincoski (9):
>   support/scripts/check-package: example
>   support/scripts/check-package: new script
>   check-package: check whitespace and empty lines
>   check-package: check *.hash files
>   check-package: check *.patch files
>   check-package: check *.mk files
>   docs/manual: size of tab in package description
>   check-package: check Config.* files
>   check-package: check *.mk for typo in variable

Since there was no feedback to your patch series since 1.5 months, I've
applied all of it, except PATCH 1/9. I'm not sure we want to have the
bad examples/test cases inside the Buildroot tree.

However, there are two things that bothered me a little bit:

 - The number of files added in support/scripts/. Should we have
   support/scripts/check-package as a script, and the rest in a
   subdirectory?

 - Between every function/method/class, you put two empty lines. The
   Buildroot coding style is generally to have only one empty line.

I haven't reviewed the details of the Python script for this version, I
briefly looked at it on the v1. There are possibly some improvements to
be made, but they can be done as followup patches. The tool is already
very useful as it is today, so I don't want to keep it longer out of
the tree.

Thanks a lot for this very useful contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
