From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 11 Oct 2018 08:35:05 -0500
Subject: [Buildroot] Analysis results for 2018-10-09
In-Reply-To: <20181011085017.7025cf45@windsurf>
References: <20181010060010.4E3C920736@mail.bootlin.com>
 <20181010174814.5ac114f1@windsurf>
 <CANQCQpbtrG=C9T9FuznXONdqF9OTq3oqmDdDWKX5PHUhJV_=hg@mail.gmail.com>
 <CAPi7W80_9pcSwfX53xDC8TzgmGLuJ+rwK_T0MyKCOaunMUQNJw@mail.gmail.com>
 <20181010211419.22632881@windsurf>
 <CANQCQpbvQX1JcX0823ZFhrhN=XoPb5opPNbGBRZDko1BzviDFw@mail.gmail.com>
 <20181011085017.7025cf45@windsurf>
Message-ID: <CANQCQpag_cM2wpvir-dc81JKe+--vHQRyaKKzyH3dtqsiLvfBw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Thu, Oct 11, 2018 at 1:50 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Wed, 10 Oct 2018 16:25:41 -0500, Matthew Weber wrote:
>
> > Adam, did you have something in the works for this one?  I seem to
> > remember some discussion on the one "whole" thread above related to
> > breaking the dependency.  I'd make the change but I don't have a valid
> > test case.
>
> Well, Arnout statement was that the build dependency is not necessary
> because python3 can dlopen() at runtime the libuuid.so library. Indeed
> the code in Python3 is here to do that, but as I explained in
> http://lists.busybox.net/pipermail/buildroot/2018-September/231060.html,
> it doesn't seem to work, at least in the Buildroot context.
>

I reached out to Adam, this dependency on uuid was added as part of
the python upgrade and not for a specific product need.  I'll see if I
can reproduce the python pkg build failure for its uuid support (Adam
mentioned this is why he added the buildroot dependency on util-linux)
.  Then depending on that, submit a patch to disable uuid support in
python and remove the dependency we currently have on the util linux
uuid lib.

Matt
