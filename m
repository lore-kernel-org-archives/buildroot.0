From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Fri, 24 Jan 2014 19:27:01 +0100
Subject: [Buildroot] python Gobject
In-Reply-To: <20140123170253.GB10856@pc-eric>
References: <CAAs3wMgAbEnReJ-XW_QnQ=kAU6G7cwzss7yUMytcmHMRYMsjnw@mail.gmail.com>
 <20140117113153.GB10730@pc-eric>
 <CAAs3wMh5xwOK_bEDVM1JMJvw6vYYL2frZYxTc_4ehyLK2sj++g@mail.gmail.com>
 <20140117154452.GC10730@pc-eric>
 <1390290077263-60414.post@n4.nabble.com>
 <20140121173657.GA11605@pc-eric>
 <1390420630566-60535.post@n4.nabble.com>
 <20140123134942.GA10856@pc-eric>
 <CAGzWX_Jgdzctc_=-9XBg4Bw__KtdNwF3MChWvG4mi6XVNFUEhQ@mail.gmail.com>
 <20140123170253.GB10856@pc-eric>
Message-ID: <20140124182659.GB30974@pc-eric>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jan 23, 2014 at 06:02:56PM +0100, Eric Le Bihan wrote:
> I dug into the mailing list and found this discussion, which seems to be
> related to this problem:
> http://lists.busybox.net/pipermail/buildroot/2011-August/045038.html.
I've also found this interesting presentation about Python and
cross-compilation: http://whatschrisdoing.com/blog/talks/PyConTalk2012.pdf.

The author points out that cross-compiling Python extensions like
python-gobject, that do not rely on distutils, is likely to fail, because they
rely on the _host_ python-config to get the path to Python headers. In our
case, we end up with headers for a 64-bit machine
(host/usr/bin/include/python2.7) instead of the ones for the 32-bit target
(target/usr/include/python2.7).

I'll patch the autotools files in the modules of the PyGtk stack to handle
this properly.

Best regards,
ELB
