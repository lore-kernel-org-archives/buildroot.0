From: Andreas Ziegler <br015@umbiko.net>
Date: Thu, 14 Jan 2021 06:08:35 +0000
Subject: [Buildroot] Buildroot ARM with Altera FPGA de10-standard
In-Reply-To: <mailman.9.1610539203.245130.buildroot@busybox.net>
References: <mailman.9.1610539203.245130.buildroot@busybox.net>
Message-ID: <c6f6425d6673f9ae60641de8a595af8d@umbiko.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Mauricio,

> Date: Wed, 13 Jan 2021 10:47:53 +0000
> Message-ID: <80f01170-5252-b7d6-0095-5c72d958f086@litinow.com>

> Unfortunately, in step 7.1 - "Configuring Buildroot" my terminal hangs
> out for too much time.

> Please, how long should this step take to finish? Should it be more 
> than
> 5 days?

Buildroot compiles a few files to display the ncurses menu. With a fresh 
installation it should be finished in a few seconds.

> Is there some way to enable log messages or building progress messages?

Buildroot outputs compiler warnings on stderr and makefile output on 
stdout, so you should see something, _unless_ your terminal somehow 
redirects output. You might check if 'make -v' produces output.

If you need additional output, invoke Buildroot with 'V=1' after the 
make command. [1]

   $ make V=1 -C buildroot nconfig

Are you really using Buildroot version 2017? In that case you should 
switch to a newer version [2]. You do not need architecture or toolchain 
related commands when invoking Buildroot, this information is entered 
later under 'Target Options' and 'Toolchain' as outlined in the Terasic 
document.

Good luck,
Andreas

[1] https://buildroot.org/downloads/manual/manual.html#make-tips
[2] https://buildroot.org/download.html
