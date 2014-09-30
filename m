From: Paassen, Hiram van <Hiram.van.Paassen@mastervolt.com>
Date: Tue, 30 Sep 2014 15:10:37 +0000
Subject: [Buildroot] Reducing buildroot compile times by reusing
 toolchain?
In-Reply-To: <CAAXf6LUZ1V=DrB_4XvLOZ3eieZGkEdZayWYfTZisgckdPNeY0Q@mail.gmail.com>
References: <A2A6A18A7161D44FBCA90D5B3AF90A2E5A484C07@AMEHLEX02.ehl.pri>
 <CAAXf6LUZ1V=DrB_4XvLOZ3eieZGkEdZayWYfTZisgckdPNeY0Q@mail.gmail.com>
Message-ID: <A2A6A18A7161D44FBCA90D5B3AF90A2E5A484CC3@AMEHLEX02.ehl.pri>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On di, 2014-09-30 at 11:41 +0200, Thomas De Schampheleire wrote:
> Hi Hiram,
>
> On Tue, Sep 30, 2014 at 10:02 AM, Paassen, Hiram van
> <Hiram.van.Paassen@mastervolt.com> wrote:
> > Hi,
> >
> > We are using buildroot to build two images for the same target platform. We noticed that most of the build time is in building the host tools. I'd like to reduce our build time and noticed the option to use an external toolchain.  However that comes with a lot of options which I did not have the time yet to explore. However that led me to some feature requests for buildroot:
> >
> > Would it be possible to add an option to the external toolchain menu to use a buildroot toolchain as external toolchain? This is probably possible right now but then I have to know exactly what to fill in. I imagine that buildroot would be able to infer all those options from another buildroot installation/out-of-tree-build.
> > I can imagine that such an option would simplify the reuse of the toolchain for our other build.
>
> On top of Thomas Petazzoni's answer, I would like to add that using a
> Buildroot toolchain as external toolchain is not hard at all.
> Basically you have to create a tarball from the output/host/usr
> directory, then specify that tarball as external toolchain and set
> some options.
> It seems this info is not yet in our manual, but we should add that.
>
> Best regards,
> Thomas
Yes this seems a sensible idea. To bad that it takes some manual work to
do while just using the default toolchain does not except checking out
our project and buildroot and doing:

make BR2_EXTERNAL=... ..._defconfig; make

Of course I can maintain a tarball on a server but that is one thing
more that can get out of sync.

For now I think this is the preferred path. May be a good thing to
document in the manual. Especially that typically, using buildroot means
using this method to prevent long build times.

Best regards,

Hiram


________________________________

Power Products, LLC Email Notice

This message is intended only for the use of the Addressee and may contain information that is PRIVILEGED and/or CONFIDENTIAL.
This email is intended only for the personal and confidential use of the recipient(s) named above. If the reader of this email is not an intended recipient, you have received this email in error and any review, dissemination, distribution or copying is strictly prohibited.
If you have received this email in error, please notify the sender immediately by return mail and permanently delete the copy you received.

Thank you.
