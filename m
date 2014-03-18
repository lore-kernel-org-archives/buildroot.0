From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Tue, 18 Mar 2014 12:35:37 -0400
Subject: [Buildroot] iconv_open, gconv advice
Message-ID: <CA+-urNS-Ee+SsdsSLCC=1vOHPnCE1POQQNdm66KU+vw46rM+eA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When running mtools on the target, I found out that I get an
iconv_open error with the x86 external toolchain. I suspect that other
toolchains have this problem due to the usr/lib/gconv directory not
being copied to the target for toolchains that have it. My hesitation
with copying over the gconv directory is that it is quite large for
how little use I'll get out of it.

Another fix to this problem is simply adding the following line to mtools.mk:

MTOOLS_CONF_OPT = ac_cv_header_iconv_h='no'

For my setup, I actually like this since my use of mtools shouldn't
have to deal with any filename characters that require codepage
handling.

Any thoughts from people on this list?

Thanks,
Frank
