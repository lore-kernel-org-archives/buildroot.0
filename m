From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 9 Nov 2011 08:28:16 +0100
Subject: [Buildroot] buildroot build fails for buildroot 2011.08
In-Reply-To: <20111108214722.49f660d0da0b2739d35378f29283c9ab.d84f2addad.wbe@email10.secureserver.net>
References: <20111108214722.49f660d0da0b2739d35378f29283c9ab.d84f2addad.wbe@email10.secureserver.net>
Message-ID: <CAAXf6LV1L+E57=ewnZJ6YuTiCRK+JoZ8YHkDyx5qfPuxfOtsrg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, Nov 9, 2011 at 5:47 AM,  <santhosh@msys-tech.com> wrote:
> hi,
> i am trying to build kernel image for m68k in buildroot 20.11.08? using
> external toolchain . I am facing following error message.
> ??????? Target:m68k?? changes made in target directory in Config.arch.in
> ??????? toolchain type: freescale coldfire -4.4 and given path of the
> toolchain in buildroot
> Checking external toolchain settings
> Incorrect selection of the C library

This means that you didn't properly set the C library in the buildroot
configuration. For example, your external toolchain uses glibc, but
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC is set, or vice-versa.
This setting is in Toolchain -> External toolchain C library.

Best regards,
Thomas
