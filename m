From: Jenkins, Lee (ISS Houston) <Lee.Jenkins@hp.com>
Date: Wed, 19 Feb 2014 00:38:16 +0000
Subject: [Buildroot] adding nodejs to buildroot
Message-ID: <2DD0B9C711CDFC45A3A266C78966CE7F4531F64B@G9W0750.americas.hpqcorp.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I tried to add package nodejs to an old BuildRoot : 2011.05

Here's how I added the package:
1. I downloaded the nodejs package (Config.in, nodejs.mk, and nodejs...patch) from the latest buildroot into the buildroot/package/nodejs directory.
2. I added an entry for nodejs in buildroot/packages/Config.in under "Interpreter languages and scripting"
3. I ran "make menuconfig", selected the nodejs package (yes, it appeared in the right spot) and saved the configuration

But something is out of place because the make fails:

buildroot$ make nodejs
make: *** No rule to make target `nodejs'. Stop.

Similarly, if I just run "make" the make succeeds but the nodejs package is not built.

The buildroot/.config file has an entry BR2_PACKAGE_NODEJS=y, but clearly there's something else missing.

It's been about a year since I added a package to buildroot, so I'm wondering if I missed a step? Or is there some incompatibility between this package and my old buildroot?

Lee Jenkins
HP Server Storage
