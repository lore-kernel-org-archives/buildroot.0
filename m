From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 14 May 2018 22:43:41 +0200
Subject: [Buildroot] [PATCH 1/1] woff2: fix build on m68k
In-Reply-To: <20180514051956.GE2510@waldemar-brodkorb.de>
References: <20180510101101.22094-1-fontaine.fabrice@gmail.com>
 <20180513220802.0c4958e9@windsurf.home>
 <20180514051956.GE2510@waldemar-brodkorb.de>
Message-ID: <CAPi7W80adUhUSgNDEbpUUHZ1OWE=Nr29YEJ199MrgCB7bLBmLQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all,

2018-05-14 7:19 GMT+02:00 Waldemar Brodkorb <wbx@openadk.org>:

> Hi,
> Thomas Petazzoni wrote,
>
> > Hello,
> >
> > +Waldemar in Cc, since he reported this issue to gcc.
> >
> > On Thu, 10 May 2018 12:11:01 +0200, Fabrice Fontaine wrote:
> > > Same issue on woff2 than in some other packages such as lcdapi: see
> > > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=79509
> > >
> > > Fixes:
> > >  - http://autobuild.buildroot.net/results/6c97a08e6ca2e914d54fb
> b525b3f0bb90023ef07
> > >
> > > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > > ---
> > >  package/woff2/woff2.mk | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> >
> > I've applied to master, but as Yann pointed out, it starts to be a
> > problem affecting a number of packages.
> >
> > The bug report you point out at
> > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=79509 has been closed,
> > because they say the issue is on binutils side. Has the issue been
> > reported to binutils ? Could you try to make this issue move forward ?
>
> I recently added the binutils report for this bug on my TODO list,
> but if Fabrice have fun to do it, I have'nt started with it, yet.
> For binutils/gcc bugs you need to be responsive if you ignite a
> fire, otherwise an issue might take 4-6 years to be resolved.  This
> is only valid for so popular architectures like m68k or bfin and
> hackers not able to provide a patch ;)

I can let you report the bug as you're the one who found the issue as well
as the workaround. I'm not used to report bugs to the binutils folks.
As a side note, the issue was also raised by log4cplus:
*http://autobuild.buildroot.net/results/035/035cc60c0fd44a5a44de64bfadfe3788ef3c6576/build-end.log
<http://autobuild.buildroot.net/results/035/035cc60c0fd44a5a44de64bfadfe3788ef3c6576/build-end.log>*.
However, after applying the patch that removed compilation on toolchains
with the gcc bug 64735, the issue was "hidden".

>


> best regards
>  Waldemar
>
Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180514/c63f08d3/attachment.html>
