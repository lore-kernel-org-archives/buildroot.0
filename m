From: D. Olsson <hi@senzilla.io>
Date: Fri, 31 Jul 2020 11:44:19 +0000
Subject: [Buildroot] [PATCH v2 3/6] configs/aarch64_efi_defconfig: build
 the EDK2 firmware from source
In-Reply-To: <CAK4VdL04sb1yG0wATrkikbgQSrjMzSEWCicED=6MZD+iTAxFBQ@mail.gmail.com>
References: <20200726100541.7710-4-hi@senzilla.io>
 <CAK4VdL04sb1yG0wATrkikbgQSrjMzSEWCicED=6MZD+iTAxFBQ@mail.gmail.com>
Message-ID: <sTFt9JNAwOGgGjUzX6gOp4WrHYrPaayuplmGBQToA2owFMXynOUXb4GqhJPqDxqWNApuvSO7y4qAyWE6DTIaf1Q-ehADSMkPyi4VZfeKY0E=@senzilla.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Erico,

On Monday, 27 July 2020 17:30, Erico Nunes <nunes.erico@gmail.com> wrote:

> > +         -bios output/images/QEMU_EFI.fd \
> >           -drive file=output/images/disk.img,if=none,format=raw,id=hd0 \
> >
> >
>
> Should we change this to point to the QEMU_VARS file too as was done
> in patch 4 for board/pc/readme.txt ?

Yes, that makes sense. I will also switch from using -bios to use the
-pflash interface instead as this is considered better practice when
building the firmware like this (in fact, locally I've been testing with
pflash the whole time).


Cheers!

D. Olsson
PGP: 8204A8CD
