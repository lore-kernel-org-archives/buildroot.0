From: Bernhard Fischer <rep.nop@aon.at>
Date: Wed, 13 Dec 2006 11:17:00 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package: avahi dmalloc
	libdaemon mpatrol netplug
In-Reply-To: <20061213092320.GA31488@codepoet.org>
References: <20061213090459.6532948561@busybox.net>
	<20061213092320.GA31488@codepoet.org>
Message-ID: <20061213101700.GA13288@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Dec 13, 2006 at 02:23:20AM -0700, Erik Andersen wrote:
>On Wed Dec 13, 2006 at 01:04:59AM -0800, aldot at uclibc.org wrote:
>> Author: aldot
>> Date: 2006-12-13 01:04:58 -0800 (Wed, 13 Dec 2006)
>> New Revision: 16878
>>
>> Log:
>> - andersee, please use ZCAT / BZCAT as configured by the user.
>> (see buildroot/Config.in config BR2_ZCAT and BR2_BZCAT that are
>> available as ZCAT and BZCAT). Thanks..
>
>sorry about that -- I forgot that change.

np.

btw.. from the looks, i'll need to build the initial binutils with
sysroot support to be able to build a libgmp to be used for the DIR2
gcc (for 4.2 fortran that i want to play with) and 4.3. Mind if i
make this change or should this be done differently?

PS: There is a usability-bug, from a user's perspective with current
binutils (from HJ) in that --with-build-sysroot is not translated to
e.g. ld's --with-sysroot, so even if we specify --with-build-sysroot, ld
is getting built without sysroot support. I'll bypass this (in
buildroot) if the change above is ok ith everyone.
