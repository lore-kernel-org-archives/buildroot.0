From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Jul 2021 22:48:06 +0200
Subject: [Buildroot] Question about pkg-config pc files
In-Reply-To: <CAJ6EmCd=eJUrY5Qa_SyJd5mVRq0bKtmuQTB-j1HF1bXXZpZn3g@mail.gmail.com>
References: <CAJ6EmCd=eJUrY5Qa_SyJd5mVRq0bKtmuQTB-j1HF1bXXZpZn3g@mail.gmail.com>
Message-ID: <20210720224806.09e5a5b2@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <20210720204806.uOwyZSsPWqt8a-W_S1GIbkc-5CyiS8bIJZ5hC74SRfI@z>

Hello Patricia,

On Tue, 20 Jul 2021 16:41:40 -0400
Patricia Holden <pholden@nklabs.com> wrote:

> I am adding a package that has dependencies on QT pkg-config pc files.  I
> see the pkg-config pc files in
> output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/share/pkgconfig/, but
> I don't see any pkg-config files installed to target.  the QQmlApplication
> code is trying to include multiple qt packages but they are not found.
> Running "pkg-config --list-all" results in none found at all.
> 
> How do I get pkg-config pc files installed to the target?

You don't: Buildroot doesn't support doing development on the target.
Why would you need .pc files on the target ? Is QQmlApplication using
pkg-config at run-time on the target ?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
