From: Jens Maus <mail@jens-maus.de>
Date: Fri, 9 Feb 2018 20:35:07 +0100
Subject: [Buildroot] aarch64 + armhf multiarch support?
In-Reply-To: <CAGt4E5uxjDVhkxrneDbP4ip_fVT11DhduKsiiXLbENKnSB9huw@mail.gmail.com>
References: <8EB2320D-F586-45FA-A9F4-F49D7FD5DD5D@jens-maus.de>
 <trinity-566065ed-72d1-4d19-9ae3-ab3368c01d3a-1518087937117@3c-app-mailcom-bs16>
 <E10BD61C-1C84-4039-A741-331FC3C8B961@jens-maus.de>
 <trinity-ad8db11c-f541-454e-8440-6c47520cc02f-1518089812434@3c-app-mailcom-bs15>
 <8A656331-7273-4C87-9E60-F62570C60828@jens-maus.de>
 <trinity-b580d83a-4026-4b4f-991c-2bd4db9d4f2f-1518091664400@3c-app-mailcom-bs13>
 <58733ED8-7525-4945-8665-6309CD838F3B@jens-maus.de>
 <trinity-508f433b-7a26-4c85-b97a-466528c8249f-1518179364228@3c-app-mailcom-bs05>
 <D8068D8E-77EA-42AA-A4FC-5A35BA5ABDBD@jens-maus.de>
 <CAGt4E5uxjDVhkxrneDbP4ip_fVT11DhduKsiiXLbENKnSB9huw@mail.gmail.com>
Message-ID: <2FCF28DB-9039-45DD-9C48-A806BF0E63BE@jens-maus.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> Am 09.02.2018 um 19:01 schrieb Markus Mayer <markus.mayer@broadcom.com>:
> 
>> On 9 February 2018 at 05:02, Jens Maus <mail@jens-maus.de> wrote:
>> Hi Dagg,
>> 
>>>> Am 09.02.2018 um 13:29 schrieb daggs <daggs@gmx.com>:
>>>> 
>>>> Apart from that, are there really no possibilities to build a multiarch (aarch64+armhf) buildroot environment that allows to run 64bit and 32bit binaries at the same time? Or am I missing something?
>>> 
>>> sorry it didn't helped you, I wonder, can you compile the 32 bit bins yourself? if so why not compile the bins you need statically, place it on a nfs server, mount it on the c2 boards and run the bins? will that work for you?
>> 
>> No, I can?t compile the 32bit bins myself as they are closed source. The point is really that it would be great if buildroot could be setup to support 64bit compilation (aarch64) with multiarch support so that 32bit libraries (libc, etc.) are automatically in place that 32bit binaries (armhf) will run out-of-the-box. Does anyone know how much effort it would take to add such multiarch support into buildroot and where to start implementing it in a nice and proper way?
> 
> I had to solve this issue recently, since we just recently switched to
> buildroot in our division. The reason we needed to be able to run
> aarch32 binaries on aarch64 builds was the same as yours: 32-bit
> binaries that can't be re-compiled and that need to be available on
> 64-bit builds.
> 
> The good news is that it works now. The bad news that it likely can't
> be incorporated upstream unmodified.
> 
> The result can be seen here. Unfortunately, this doesn't break out my
> changes specifically, which makes it not all that helpful.
> 
> https://github.com/Broadcom/stblinux-4.9/tree/master/buildroot
> 
> I'll see if I can publish a tree where my changes haven't been all
> squashed together.

Indeed. It really would be helpful if you could at least point your finger at the changes as I am really curious how you actually solved that problem an implemented multiarch support. Best would be, of course, a diff file with your changes against upstream buildroot.

Regards,
Jens
