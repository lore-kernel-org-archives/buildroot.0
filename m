From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sun, 22 Nov 2015 13:27:13 -0200
Subject: [Buildroot] [PATCH v2] gpsd: add work-around and re-enable for
	microblaze
In-Reply-To: <20151122135732.3fc6bb45@free-electrons.com>
References: <1448195040-8082-1-git-send-email-sergio.prado@e-labworks.com>
 <20151122135732.3fc6bb45@free-electrons.com>
Message-ID: <CANu7NGsAzD7fTSZPr0rRRCaOSR6N9NCpy7mTWzJ9c7436W6LPg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

I have tested with GCC 5.2.0. The bug persists and was reported in the gcc
bug tracker:

https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485

Actually, in GCC 5.X I had to also disable another optimization flag
(-fschedule-insns). I'm finishing the tests of this change with both GCC
4.9 and GCC 5.2 to send you a new patch to fix it.

Regards,

Sergio Prado
Embedded Labworks
Office: +55 11 2628-3461
Mobile: +55 11 97123-3420

2015-11-22 10:57 GMT-02:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Dear Sergio Prado,
>
> On Sun, 22 Nov 2015 10:24:00 -0200, Sergio Prado wrote:
> > Fix (works around) bug #6872
> > https://bugs.busybox.net/show_bug.cgi?id=6872
> >
> > The gpsd package was disabled due to an internal compiler error for
> > the microblaze architecture in the following commit:
> >
> http://git.buildroot.net/buildroot/commit/?id=d517415bcda380336f4a27bf248cef4d81791c9e
> >
> > The problem is due to an specific GCC optimization flag
> > (-fexpensive-optimizations), so disabling it we can work around this
> > problem and compile gpsd for the microblaze architecture.
> >
> > Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> > Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> > ---
> > Changes v1 -> v2:
> >   - added a comment explaining why we are disabling the optimization
> flag.
> > ---
> >  package/gpsd/Config.in        | 3 ---
> >  package/gpsd/gpsd.mk          | 8 +++++++-
> >  package/sconeserver/Config.in | 2 --
> >  3 files changed, 7 insertions(+), 6 deletions(-)
>
> Applied to master, thanks. Could you test with gcc 5.x, and if the
> problem still exists, report a bug to the gcc bug tracker ? While your
> workaround is OK, it is not good for gcc to fail this way when building
> gpsd.
>
> Thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151122/91d0cc95/attachment.html>
