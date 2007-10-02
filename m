From: Kuten Ivan <ivan.kuten@promwad.com>
Date: Tue, 02 Oct 2007 09:26:59 -0100
Subject: [Buildroot] x11r7 build error
In-Reply-To: <200710011740.03055.rafael@riseup.net>
References: <200710011537.03174.rafael@riseup.net>	<47016354.9000203@promwad.com>
	<200710011740.03055.rafael@riseup.net>
Message-ID: <47021CF3.20409@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

rafael2k wrote:
> Hi all,
> 
> Em Seg 01 Out 2007, Ivan Kuten escreveu:
>> rafael2k ?????:
>>> I'm triyng to compile x11r7 in a i386 host to a i386 target.
>>>
>>> the following error appears to me:
>>> /home/rafael2k/programs/gnuden/buildroot/build_i386/staging_dir/usr/bin/.
>>> ./lib/gcc/i386-linux-uclibc/4.2.1/../../../../i386-linux-uclibc/bin/ld:
>>> cannot find /lib/libc.so.0
>>> collect2: ld returned 1 exit status
>>> libtool: install: error: relink `libxcb-xvmc.la' with the above command
>>> before installing it
>> This is what I get for arm arch: when relinking it looks in wrong location
>> /usr/lib for libc library, however I do not get error because linker
>> recognizes incompatible format and skips library:
> 
> is this re-linking step really necessary?
> i really don't have experience w/ the xorg compilation.
> anyone has any advice to me?
> 

You have to repair by hands. Go to libxcb dir and remove wrong
-L/usr/lib -L/lib occurrences in Makefiles.

BR,
Ivan
--------------------------------
> Embedded Linux engineer,
> Promwad Company: http://www.promwad.com/
> Homepage : http://www.ivankuten.com/
> --------------------------------
