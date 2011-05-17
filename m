From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 17 May 2011 10:43:28 +0200
Subject: [Buildroot] [git commit] Allow several device tables and split
	in two parts our device table
In-Reply-To: <20110517090426.0bd12953@surf> (Thomas Petazzoni's message of
	"Tue, 17 May 2011 09:04:26 +0200")
References: <20110510215121.DFA53826FF@busybox.osuosl.org>
	<20110517090426.0bd12953@surf>
Message-ID: <87mxilhg3z.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> I know it's my stuff, but this doesn't work that well. Once you
 Thomas> have choosen one particular solution, if you switch to another,
 Thomas> then the list of default device table isn't updated
 Thomas> accordingly. Of course, we want to preserve the user choice for
 Thomas> the list of device tables, but I'm quite sure we'll have some
 Thomas> support requests from people doing :

 Thomas>  * A build based on a dynamic /dev
 Thomas>  * Change configuration to static /dev
 Thomas>  * Build
 Thomas>  * See that nothing works, because /dev is empty

Yes, I know - It's the same kind of issues we have with busybox/uclibc
configuration file if you change version.

 Thomas> But I don't know what we can do against this. Should we instead add an
 Thomas> option to makedevs to instruct makedevs to skip entries in /dev ? This
 Thomas> option could then be used for all dynamic /dev cases, and would work
 Thomas> even if the device table contains entries for /dev ? Or should we keep
 Thomas> it as it is ?

Alternatively we can split it up and provide an option for the base
device table (which will default to target/generic/device_table.txt) and
add an option for static device nodes (which defaults to
target/generic/device_table_dev.txt) and only make that option visible
if static dev is used.

The makefile can then concatenate those options and use them like it is
done today.

-- 
Bye, Peter Korsgaard
