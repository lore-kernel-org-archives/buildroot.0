From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Oct 2014 15:16:07 +0200
Subject: [Buildroot] [PATCH 1/1 v2] qlibc : new package
In-Reply-To: <4B4FC3D4F21B42FDABEB519462D291DD@JohanW7>
References: <4B4FC3D4F21B42FDABEB519462D291DD@JohanW7>
Message-ID: <20141012151607.67c2cb73@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sagaert Johan,

On Thu, 1 May 2014 16:43:11 +0200, Sagaert Johan wrote:
> qlibc Features:
> 	General Containers.
> 	===================
>  	List - Doubly Linked List.
> 	List Table - KEY/VALUE paired table implemented on linked-list.
>  	Hash Table - Hash based KEY/VALUE paired table.
>  	Static Hash Table - Static(array/mmapped/shared) memory
> 		based KEY/VALUE paired table.
>  	Vector - implements a growable array of elements.
> 	Queue - FIFO(First In First Out) implementation.
> 	Stack - LIFO(Last In First Out) implementation.
> 
> 	General utilities.
> 	==================
> 	String
> 	I/O
> 	File
> 	IPC(Semaphore, Shared-memory)
> 	En/decoders
> 	Hashes
> 	System
> 	Time
> 	and more...
> 	
> 	Extensions.
> 	===========
> 	INI-style Configuration File Parser.
> 	Apache-style Configuration File Parser.
> 	Rotating File Logger.
> 	HTTP client.
> 	Database(MySQL) interface.
> 	
> qlibc is well documented and maintained.
> 
> Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>

I've just submitted an improved version of your patch (keeping your
authorship, of course), fixing a good number of problems along the way:

    [Thomas:
     - add dependency on threads, wchar and dynamic librayr
     - add dependency on libiconv when locale support is not enabled
     - replace patch hacking includedir by a patch that lets the Makefile
       obey to $(DESTDIR)
     - remove optional OpenSSL and MySQL support which simply cannot work
       due to the usage of AC_CHECK_FILE() in configure.ac, this required
       an additional patch to fix the bogus AC_ARG_WITH() calls.
     - move from 'Miscellaneous' to 'Libraries' -> 'Other'.
     - fixup the licensing information.]

Notice that I've removed the optional OpenSSL and MySQL features,
because the configure.ac logic to detect those libraries is badly
broken and I'm personally not sufficiently interested with qlibc to fix
those issues myself. If you're interested, feel free to investigate and
send follow-up patches.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
