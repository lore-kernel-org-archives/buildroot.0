From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Nov 2009 16:13:13 +0100
Subject: [Buildroot] jffs2 multiple partition
In-Reply-To: <87y6lt8i9z.fsf@macbook.be.48ers.dk>
References: <!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAAMvrUXVWIuRMkZRk0Phz6o0BAAAAAA==@cimeq.qc.ca>
	<20091125222504.5aa3b23d@surf>
	<!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAAE7bH9cGX9lJvelAwnTnzMABAAAAAA==@cimeq.qc.ca>
	<87y6lt8i9z.fsf@macbook.be.48ers.dk>
Message-ID: <20091126161313.57866352@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 26 Nov 2009 15:36:40 +0100,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> The question is how to generalize this and make is simple to
> use/understand. My initial feeling is that for something as
> specialized as this we should just make it easy to do outside BR
> (like we do with the tarball target), instead of add a lot of
> complexity to BR/Kconfig.

Same opinion here. The feature ? put /usr in one filesystem and the rest
in another filesystem ? is very, very specific. Unless we find a way to
make it more generally useful, I don't think this belongs to Buildroot.

We could imagine that the user can give a text file saying which
file/directory should go in which filesystem, so that parts could be
put into a read-only filesystem and other parts into a read/write
filesystem. But I'm not sure how this would work.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
