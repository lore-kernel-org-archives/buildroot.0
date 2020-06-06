From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Jun 2020 22:42:27 +0200
Subject: [Buildroot] [PATCH 2/2] fs: clean the volatile /run and /tmp
 directories
In-Reply-To: <20200605224858.12870-2-nolange79@gmail.com>
References: <20200605224858.12870-1-nolange79@gmail.com>
 <20200605224858.12870-2-nolange79@gmail.com>
Message-ID: <20200606224227.60a26aeb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  6 Jun 2020 00:48:57 +0200
Norbert Lange <nolange79@gmail.com> wrote:

> Scripts in the fakeroot environment could call
> tools preparing the early environment, leaving
> traces in /run or /tmp.
> 
> mkusers might create home directories in /run for
> example.
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>

Looping Yann on this. I agree that we definitely want /tmp and /run to
be empty, as we are anyway going to mount a tmpfs over them, so
whatever they contains is not visible on the target system, but takes
up some space on the filesystem.

However, I'm not sure if removing all what they contain is the right
approach. Shouldn't we avoid creating things in /tmp and /run in the
first place ?

Yann, any feedback on this ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
