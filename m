From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 27 Mar 2008 16:43:22 +0100
Subject: [Buildroot] make clean problem and patch
In-Reply-To: <20080327125053.GE13379@mx.loc> (Bernhard Fischer's message of
	"Thu\, 27 Mar 2008 13\:50\:54 +0100")
References: <47EB6E57.4080101@logicway.de> <20080327125053.GE13379@mx.loc>
Message-ID: <873aqcrx45.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernhard" == Bernhard Fischer <rep.dot.nop@gmail.com> writes:

 Bernhard> On Thu, Mar 27, 2008 at 10:52:23AM +0100, Arndt Kritzner wrote:
 >> "make clean" fails after incomplete build attempts because of missing
 >> files or directories. The attached patch precedes the clean actions with
 >> a "-" to ignore these errors. With atstk1002_defconfig the packages
 >> avahi, dropbear, file, lzo, ncftp and strace caused this sort of aborts.
 >> The attached patch concerns these packages.

 Bernhard> Unfortunately your list was incomplete.
 Bernhard> Fixed in my tree, thanks for mentioning this!

Nice sed oneliner, but it doesn't handle the cases where the package
tests for the existance of the Makefile first.

I've checked in a more complete fix (including missing/wrong rm lines)
as r21516.

-- 
Bye, Peter Korsgaard
