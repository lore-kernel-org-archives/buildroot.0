From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Aug 2013 11:53:10 +0200
Subject: [Buildroot] [PATCH 12/12] orbit: New package
In-Reply-To: <1369054604-26139-12-git-send-email-shmuelzon@gmail.com>
References: <1369054604-26139-1-git-send-email-shmuelzon@gmail.com>
 <1369054604-26139-12-git-send-email-shmuelzon@gmail.com>
Message-ID: <20130813115310.2522cd9f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Assaf Inbal,

On Mon, 20 May 2013 15:56:44 +0300, Assaf Inbal wrote:
> An MVC web framework for Lua
> 
> Signed-off-by: Assaf Inbal <shmuelzon@gmail.com>

I've applied your patch to the next branch, thanks!

I've done a few changes:

 * Instead of doing the installation manually, I added a patch to fix
   the Makefile so that the Buildroot .mk file can simply use "make
   install"

 * Remove the wsapi build-time dependency, since there is apparently no
   build-time dependency for orbit (it's just some Lua code that gets
   copied to the target)

 * Remove the 'rings' run-time dependency since I couldn't find an
   indication that it was needed for Orbit.

Also, I've noticed that Orbit appears to use Xavante, though you
haven't selected it. I wasn't sure on this one, so I left as it was,
but it'd be good to check this.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
