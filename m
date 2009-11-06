From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 06 Nov 2009 19:57:12 +0100
Subject: [Buildroot] How to figure out what a package is?
In-Reply-To: <hd1mof$7qt$1@ger.gmane.org> (Grant Edwards's message of "Fri\,
	6 Nov 2009 17\:35\:12 +0000 \(UTC\)")
References: <hd1mof$7qt$1@ger.gmane.org>
Message-ID: <87zl6zv5vb.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Grant" == Grant Edwards <grant.b.edwards@gmail.com> writes:

Hi,

 Grant> This sounds a bit stupid, but where do you find a description
 Grant> of what a given package is?

Normally the help text should say so.

 Grant> I've got a list of packages supported by buildroot.

 Grant> How do I know what, for example, the package named "lite" is?

By reading the help text of the package in 'make menuconfig'
(and optionally visiting the URL):

config BR2_PACKAGE_LITE
	bool "LiTE (toolbox engine)"
	depends on BR2_PACKAGE_DIRECTFB
	help
	   LiTE stands for LiTE is a Toolbox Engine. 
	   Its role is to facilitate the functions of DirectFB so that a
	   toolbox could be written on top of DirectFB with less effort.
	   As such LiTE has abstractions for the underlying graphics and
	   event systems.

	   See http://www.directfb.org/wiki/index.php/LiTE:Architecture

Is there anything in the above that isn't clear to you?

-- 
Bye, Peter Korsgaard
