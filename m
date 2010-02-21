From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2010 20:58:39 +0100
Subject: [Buildroot] [PATCH 36/38] webkit: make sure that people don't
 try to build with uClibc
In-Reply-To: <87a5b0801002211010k3c846965t835414641992044b@mail.gmail.com>
References: <cover.1266774432.git.thomas.petazzoni@free-electrons.com>
	<1c517be59aac9a3569bd10769125d5f7229e0111.1266774432.git.thomas.petazzoni@free-electrons.com>
	<87a5b0801002211010k3c846965t835414641992044b@mail.gmail.com>
Message-ID: <20100221205839.414c7b55@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Will,

On Sun, 21 Feb 2010 18:10:11 +0000
Will Newton <will.newton@gmail.com> wrote:

> This isn't strictly true - the newer version of LinuxThreads and NPTL
> for uClibc both implement this function.
> 
> I build and run WebKit with uClibc so I would rather this change did
> not go in.

Right. I missed the fact that pthread_getattr_np() is implemented in
linuxthreads but not in old-linuxthreads.

Peter, please drop this patch for now.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
