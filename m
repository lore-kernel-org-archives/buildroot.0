From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Sep 2016 09:03:11 +0200
Subject: [Buildroot] [PATCH v3 1/4] support/scripts/get-developers: add
	new script
In-Reply-To: <1473713695-2611-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 12 Sep 2016 22:54:52 +0200")
References: <1473713695-2611-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1473713695-2611-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87eg4dzqds.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > This script, and its companion library, is more-or-less Buildroot's
 > equivalent to the kernel get_maintainer.pl script: it allows to get the
 > list of developers to whom a set of patches should be sent to.

 > To do so, it first relies on a text file, named DEVELOPERS, at the root
 > of the Buildroot source tree (added in a followup commit) to list the
 > developers and the files they are interested in. The DEVELOPERS file's
 > format is simple:

 > N:     Firstname Lastname <email>
 > F:     path/to/file
 > F:     path/to/another/file

 > This allows to associate developers with the files they are looking
 > after, be they related to a package, a defconfig, a filesystem image, a
 > package infrastructure, the documentation, or anything else.

 > When a directory is given, the tool assumes that the developer handles
 > all files and subdirectories in this directory. For example
 > "package/qt5/" can be used for the developers looking after all the Qt5
 > packages.

 > Conventional shell patterns can be used, so "package/python-*" can be
 > used for the developers who want to look after all packages matching
 > "python-*".

 > A few files are recognized specially:

 >  - .mk files are parsed, and if they contain $(eval
 >    $(<something>-package)), the developer is assumed to be looking after
 >    the corresponding package. This way, autobuilder failures for this
 >    package can be reported directly to this developer.

 >  - arch/Config.in.<arch> files are recognized as "the developer is
 >    looking after the <arch> architecture". In this case, get-developer
 >    parses the arch/Config.in.<arch> to get the list of possible BR2_ARCH
 >    values. This way, autobuilder failures for this package can be
 >    reported directly to this developer.

 >  - pkg/pkg-<infra>.mk are recognized as "the developer is looking after
 >    the <infra> package infrastructure. In this case, any patch that adds
 >    or touches a .mk file that uses this infrastructure will be sent to
 >    this developer.

Committed, thanks. Care to send a followup patch fixing the issues
Arnout pointed out?

-- 
Bye, Peter Korsgaard
