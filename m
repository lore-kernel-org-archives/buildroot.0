From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Jan 2013 11:33:09 +0100
Subject: [Buildroot] rebuilding a project on older commits
In-Reply-To: <5104EF52.3010608@googlemail.com>
References: <51041908.1030803@googlemail.com> <20130127093035.5537b93f@skate>
 <5104EF52.3010608@googlemail.com>
Message-ID: <20130127113309.4623b949@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Carsten Schoenert,

On Sun, 27 Jan 2013 10:11:46 +0100, Carsten Schoenert wrote:

> Yes, this is the solution. Right now I build the toolchain with ct-ng
> inside buildroot.
> Is it possible to move this existing toolchain outside buildroot or
> should I rebuild from scratch?

You should build it once with Crosstool-NG outside of Buildroot,
install it somewhere, and tell Buildroot to use it as an external
toolchain.

> For the first two points I can answer with yes, but your tip with the
> /lib folder is the right one. This folder is empty, and this also in
> the output/target directory so it must be empty in the rootfs.tar too.
> 
> So the libraries in the /lib folder are missing there must be
> something wrong with the config of the ct-ng? Any suggestions where I
> have to look to?

That sounds really odd. Maybe we have a bug in the ct-ng backend, and
it doesn't copy the libraries? I would have to do a test build, but I'm
on the battery in the train for now, so I can't do heavy builds for now.

If someone could do a quick test build of a minimal system that uses
the ct-ng backend, and verify that $(O)/target/lib contains the right
libraries, that would be nice.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
