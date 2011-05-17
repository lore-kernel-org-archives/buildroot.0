From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 May 2011 10:55:09 +0200
Subject: [Buildroot] [git commit] Allow several device tables and split
 in two parts our device table
In-Reply-To: <87mxilhg3z.fsf@macbook.be.48ers.dk>
References: <20110510215121.DFA53826FF@busybox.osuosl.org>
	<20110517090426.0bd12953@surf> <87mxilhg3z.fsf@macbook.be.48ers.dk>
Message-ID: <20110517105509.5521276b@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 17 May 2011 10:43:28 +0200
Peter Korsgaard <jacmet@uclibc.org> wrote:

>  Thomas> But I don't know what we can do against this. Should we instead add an
>  Thomas> option to makedevs to instruct makedevs to skip entries in /dev ? This
>  Thomas> option could then be used for all dynamic /dev cases, and would work
>  Thomas> even if the device table contains entries for /dev ? Or should we keep
>  Thomas> it as it is ?
> 
> Alternatively we can split it up and provide an option for the base
> device table (which will default to target/generic/device_table.txt) and
> add an option for static device nodes (which defaults to
> target/generic/device_table_dev.txt) and only make that option visible
> if static dev is used.
> 
> The makefile can then concatenate those options and use them like it is
> done today.

Seems like a good idea. The first option shouldn't be named "device
table", but instead "permission table", and the file device_table.txt
could be renamed as well to permission_table.txt.

We should also preserve the fact that those two options can be lists,
so that one can keep the original permission table, and add some more
entries by specifying a second table.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
