From: Eric Malkowski <eric@bvwireless.net>
Date: Wed, 11 Feb 2009 16:03:30 -0500
Subject: [Buildroot] make menuconfig, load alt config file, exit,
	no "save" prompt anymore
Message-ID: <49933D22.5040104@bvwireless.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

One other thing I noticed since getting back into this --
I the past, I could create a buildroot config and save it for future use.
When doing a complete build later from scratch, I would typically do:

make menuconfig
-> Choose option to "load alternate config file"
Choose to exit and be asked "Save changes to config?", I would say yes 
and then kick off make to build everything

I've found w/ the latest buildroot, I don't get prompted to save my 
config when "loading from alternate config file".
I don't know if this is a bug -- so I now do this as an alternative:

cp local/<project>/project.config .config   # or from wherever I'm 
keeping master buildroot config file
make oldconfig
make

It's no big deal, but for some reason my old method doesn't work anymore.

-Eric
