From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jul 2015 09:22:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/libtool: disable makeinfo
In-Reply-To: <559AF52D.5090106@mind.be>
References: <e64f1903478b53f185f3bf114f86c46948a31311.1435886073.git.sam.bobroff@au1.ibm.com>
 <20150704124513.77ae2841@free-electrons.com>
 <559AF52D.5090106@mind.be>
Message-ID: <20150707092214.30d13879@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Mon, 6 Jul 2015 23:37:49 +0200, Arnout Vandecappelle wrote:

>  BTW, Thomas, any idea why the autobuilders didn't catch this? Do the chroots
> have texinfo installed?

My chroot does not have texinfo installed:

test at build:~$ dpkg -l | grep texinfo
test at build:~$ which makeinfo
test at build:~$ 

This makeinfo thing is very mysterious to me. Sometimes it complains
it's missing, sometimes not. I've never been able to really understand
what happens.

I am wondering if some packages don't bundle the pre-generated
documentation in their tarball, but sometimes have the pre-generated
files with an older date than the source files, which causes the
documentation to be generated once again. But that's really just a
guess.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
