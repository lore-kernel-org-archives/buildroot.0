From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Tue, 30 Apr 2013 00:00:27 +0200
Subject: [Buildroot] [PATCH 1/2] rpi-firmware: Fixup config.txt
In-Reply-To: <20130429224859.484e28f9@skate>
References: <1358087034-2706-1-git-send-email-maxime.hadjinlian@gmail.com>
 <20130429224859.484e28f9@skate>
Message-ID: <CAGduivyNLKwRuKgrk6DfpL193D-60P6RxboLFBECNPWWJs55Sw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Mon, Apr 29, 2013 at 10:48 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Maxime Hadjinlian,
>
> On Sun, 13 Jan 2013 15:23:53 +0100, Maxime Hadjinlian wrote:
>> The default name of the kernel binary for the RaspberryPi is kernel.img, it's a
>> only a zImage kernel renamed.
>> Since Buildroot will build a zImage, the default config uses that should use it
>> instead of forcing the user to rename a file.
>>
>> Also, remove the cmdline argument rootfstype, as ext4 is a builtin driver,
>> there is no need to specify it on the cmdline.
>
> I don't think this justification is correct. If ext4 is a module, then
> rootfstype=ext4 doesn't make it work better. Specifying rootfstype=
> tells the kernel what is the root filesystem, so that it doesn't have
> to test the different available filesystem drivers.
>
> I'm ok with the change, but I think the commit log is not correct.
>
You're right, the commit log is not accurate. I will rewrite it and
resend the patch.
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
