From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 9 Dec 2020 09:11:17 +0100
Subject: [Buildroot] [PATCH 1/1] package/sysklogd: bump to version 2.1.2
In-Reply-To: <CANabuZeh=hZ6sUdq-2NOnt7AnS70bmb=ZQkxemFKuHc3-AtiyA@mail.gmail.com>
References: <20200812160843.24064-1-andreas.hilse@googlemail.com>
 <20201205222153.75769040@windsurf.home>
 <CANabuZeh=hZ6sUdq-2NOnt7AnS70bmb=ZQkxemFKuHc3-AtiyA@mail.gmail.com>
Message-ID: <20201209091117.39ab9a0a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 8 Dec 2020 21:41:27 +0100
Andreas Hilse <andreas.hilse@googlemail.com> wrote:

> Hello Thomas,
> 
> > I think the commit log should mention that the license has changed,
> > with a link to https://github.com/troglobit/sysklogd/releases/tag/v2.1.  
> Will do when I find out how to update the patch (have to read doc again).

git commit --amend

will allow you to update the commit log of the top-most commit.

Otherwise, I suggest you to document yourself about "git interactive
rebase", this is really the key functionality to understand to be able
to prepare patch series with Git.

> > syslog.c:448:27: error: ?O_CLOEXEC? undeclared (first use in this  
> function)
> >    O_WRONLY | O_NONBLOCK | O_CLOEXEC, 0)) >= 0) {  
> This is fixable by CFLAGS="-D_GNU_SOURCE" e.g. in MAKE_OPTS.
> I contacted the sysklogd maintainer through github. Waiting on a response.

Then the particular file using O_CLOEXEC should probably #define
_GNU_SOURCE before including any header file.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
