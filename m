From: Daniel Serpell <daniel.serpell@gmail.com>
Date: Fri, 16 Feb 2018 21:43:36 -0300
Subject: [Buildroot] [PATCH] Sets LD_LIBRARY_PATH inside
 toolchain-wrapper.
In-Reply-To: <CANepG=MckvkieMHtLfR2fsrH1yJzvjUwDiritOk-YvP5-ghE8g@mail.gmail.com>
References: <20180216221845.13337-1-daniel.serpell@gmail.com>
 <20180216234619.3b1815a6@windsurf.lan>
 <CANepG=MckvkieMHtLfR2fsrH1yJzvjUwDiritOk-YvP5-ghE8g@mail.gmail.com>
Message-ID: <CANepG=PL=4t10iC=GUi2F5BkEUH27XyCpMAFfk2g3hDQwESgcw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, Feb 16, 2018 at 7:46 PM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Hello,
>
> On Fri, 16 Feb 2018 19:18:45 -0300, Daniel Serpell wrote:
>> Setting the host library path in the toolchain wrapper allows moving the
>> host toolchain folder to a new path, as some of the tools depends on
>> buildroot provided libraries.
>>
>> Signed-off-by: Daniel Serpell <daniel.serpell@gmail.com>
>
> This is not needed. If you want to move around the host toolchain
> folder, run "make sdk", which prepares the host toolchain to be a
> relocatable SDK.
>
> See slide 280 of
> https://bootlin.com/doc/training/buildroot/buildroot-slides.pdf for
> more details.

Yes, I missed that.

I see that you are using patchelf to make RPATH relative inside host binaries,
is there any reason to not run that always, or at least in the "make toolchain"
target?

>
> And yes, we should mention this in the Buildroot manual. Patches
> welcome :-)
>

I'm not very good at writing documentation, perhaps the attached patch
is enough.

Regards,

    Daniel.

PD: Sorry, I first emailed this off-list on error.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: Adds-documentation-to-the-make-sdk-rule.patch
Type: text/x-patch
Size: 1729 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180216/24479338/attachment.bin>
