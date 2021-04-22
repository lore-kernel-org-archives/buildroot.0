From: Sam Voss <sam.voss@collins.com>
Date: Thu, 22 Apr 2021 16:00:10 -0500
Subject: [Buildroot] [PATCH] linux: allow firmware to be included in
 kernel
In-Reply-To: <20210422225524.78b04dc8@windsurf>
References: <20210422202452.41704-1-sam.voss@rockwellcollins.com>
 <20210422225524.78b04dc8@windsurf>
Message-ID: <CAH=K+6=OwMc6Han9d51VfSR6GMkxsBkyzo_VKDLMmKwT9uTo=w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Thomas,

On Thu, Apr 22, 2021 at 3:55 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Sam,
>
> On Thu, 22 Apr 2021 15:24:52 -0500
> Sam Voss <sam.voss@rockwellcollins.com> wrote:
>
> > Add functionality to use the kernel's built-in options to allow binary
> > blobs to be included with the kernel. This is equivalent to the blobs
> > existing in /lib/firmware, however are available earlier in the boot
> > process. This may be useful in situations where a device probes before
> > the rootfs is fully available (such as a squashfs not being loaded
> > before a usb device probing).
> >
> > Signed-off-by: Sam Voss <sam.voss@rockwellcollins.com>
>
> Including firmware in the kernel itself has some serious licensing
> implications: it only works for firmware files that have a license that
> is compatible with the GPL. If their license is not GPL-compatible,
> then you cannot redistribute your kernel image.
>
> Here is the help text of the corresponding option in the Linux kernel:
>
>           WARNING: If you include additional firmware files into your binary
>           kernel image that are not available under the terms of the GPL,
>           then it may be a violation of the GPL to distribute the resulting
>           image since it combines both GPL and non-GPL work. You should
>           consult a lawyer of your own before distributing such an image.
>
> I am not a lawyer, but I think the wording is a bit unfortunate: I
> think if the firmware is under a license that is compatible with the
> GPL, it is fine. But if it has a non GPL-compatible license, it's a
> no-go.

I completely agree with everything you said here - I had investigated
(based on the kernels warning text) my use case, but had not
considered wanting to propagate that warning out into the buildroot
option as well

>
> So I would be OK to include this, but with the appropriate warning in
> the Buildroot options.

I'll add that warning and send a v2 here momentarily.

Thanks for the quick review,

-- 

Sam Voss | Sr. Software Engineer | Commercial Avionics
COLLINS AEROSPACE
400 Collins Road NE, Cedar Rapids, Iowa 52498, USA
Tel: +1 319 263 4039
sam.voss at collins.com | collinsaerospace.com

CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.
