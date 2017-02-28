From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Feb 2017 16:37:01 +0100
Subject: [Buildroot] Analysis of build results for 2017-02-26: librsvg
	failure
In-Reply-To: <87innujrrr.fsf@dell.be.48ers.dk>
References: <20170227072848.7BD45207F5@mail.free-electrons.com>
 <20170227142854.34d3fb86@free-electrons.com>
 <20170228000123.66658172@free-electrons.com>
 <87r32ik7vl.fsf@dell.be.48ers.dk>
 <20170228100542.2536f1d0@free-electrons.com>
 <87innujrrr.fsf@dell.be.48ers.dk>
Message-ID: <20170228163701.345645b1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 28 Feb 2017 15:48:08 +0100, Peter Korsgaard wrote:

>  > Which looks correct to me, when running a host binary on the host machine.  
> 
> Yes, but the part where it loads a library from the target-librsvg
> doesn't:
> 
> stat("/home/thomas/projets/buildroot/output/build/librsvg-2.40.16/gdk-pixbuf-loader", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
> stat("/home/thomas/projets/buildroot/output/build/librsvg-2.40.16/gdk-pixbuf-loader/./libpixbufloader-svg.la", {st_mode=S_IFREG|0644, st_size=3987, ...}) = 0
> open("/home/thomas/projets/buildroot/output/build/librsvg-2.40.16/gdk-pixbuf-loader/./libpixbufloader-svg.la", O_RDONLY) = 3
> read(3, "# libpixbufloader-svg.la - a lib"..., 4000) = 3987
> futex(0x7fb04bc20488, FUTEX_WAKE_PRIVATE, 2147483647) = 0
> read(3, "", 4000)                       = 0
> close(3)                                = 0
> futex(0x7fb04b3480a8, FUTEX_WAKE_PRIVATE, 2147483647) = 0
> open("/home/thomas/projets/buildroot/output/build/librsvg-2.40.16/gdk-pixbuf-loader/./.libs/libpixbufloader-svg.so", O_RDONLY|O_CLOEXEC) = 3

Wow, indeed!

But how does this fit with my findings with gdb, which were pointing at
a faulty instruction in the host libpixman?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
