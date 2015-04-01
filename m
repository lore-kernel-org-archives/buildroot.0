From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Apr 2015 16:44:28 +0200
Subject: [Buildroot] [PATCH 1/1] jamvm: add depends on toolchain
 w/threads
In-Reply-To: <CAMQcK5Lsur2cCryZ=fTGeeWRQzwCtaErkP-Of9auJ+-s6cHkEQ@mail.gmail.com>
References: <1427385280-63133-1-git-send-email-matthew.weber@rockwellcollins.com>
 <CAMQcK5KRF47ZyTyzfj1e+xcDO0V_J8oUUXEgUiqF3zR6VYv7Qw@mail.gmail.com>
 <CANQCQpaJObqR6poUyh5FMm58vPFGyruJm=JBWBbQtPgsP8pf1g@mail.gmail.com>
 <CAMQcK5Lsur2cCryZ=fTGeeWRQzwCtaErkP-Of9auJ+-s6cHkEQ@mail.gmail.com>
Message-ID: <20150401164428.7fcc4854@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ryan Barnett,

On Wed, 1 Apr 2015 09:28:12 -0500, Ryan Barnett wrote:

> > While running an autobuilder internally.  It's a arm uclibc build
> > failure looking for pthreads.
> 
> I am curious about the Buildroot autobuilders then if they don't have
> javac available on them to build.
> 
> Thomas - are there autobuilders that have javac installed on them?

The autobuild-run script detects whether javac is available or not. If
it's not available, it makes sure to not attempt a build that has the
Buildroot packages that require javac to be installed.

On the Free Electrons build server, javac is not installed. On gcc75,
javac is installed.

See
http://git.buildroot.net/buildroot-test/tree/scripts/autobuild-run#n196
and
http://git.buildroot.net/buildroot-test/tree/scripts/autobuild-run#n339.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
