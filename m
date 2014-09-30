From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 30 Sep 2014 11:41:26 +0200
Subject: [Buildroot] Reducing buildroot compile times by reusing
	toolchain?
In-Reply-To: <A2A6A18A7161D44FBCA90D5B3AF90A2E5A484C07@AMEHLEX02.ehl.pri>
References: <A2A6A18A7161D44FBCA90D5B3AF90A2E5A484C07@AMEHLEX02.ehl.pri>
Message-ID: <CAAXf6LUZ1V=DrB_4XvLOZ3eieZGkEdZayWYfTZisgckdPNeY0Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Hiram,

On Tue, Sep 30, 2014 at 10:02 AM, Paassen, Hiram van
<Hiram.van.Paassen@mastervolt.com> wrote:
> Hi,
>
> We are using buildroot to build two images for the same target platform. We noticed that most of the build time is in building the host tools. I'd like to reduce our build time and noticed the option to use an external toolchain.  However that comes with a lot of options which I did not have the time yet to explore. However that led me to some feature requests for buildroot:
>
> Would it be possible to add an option to the external toolchain menu to use a buildroot toolchain as external toolchain? This is probably possible right now but then I have to know exactly what to fill in. I imagine that buildroot would be able to infer all those options from another buildroot installation/out-of-tree-build.
> I can imagine that such an option would simplify the reuse of the toolchain for our other build.

On top of Thomas Petazzoni's answer, I would like to add that using a
Buildroot toolchain as external toolchain is not hard at all.
Basically you have to create a tarball from the output/host/usr
directory, then specify that tarball as external toolchain and set
some options.
It seems this info is not yet in our manual, but we should add that.

Best regards,
Thomas
