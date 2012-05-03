From: Dimitry Golubovsky <golubovsky@gmail.com>
Date: Thu, 3 May 2012 09:27:05 -0400
Subject: [Buildroot]  read-edid package - clarifications
Message-ID: <CADiAo4J4T_bcDzospg7e9Hr_HvUJ8qGBegrda6BsUFrnzttx8A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Thomas Petazzoni wrote:

> On Ubuntu, parse-edid is in usr/bin, get-edid is in usr/sbin. See
> http://packages.ubuntu.com/quantal/i386/read-edid/filelist

There is another package in my queue for submission which is v86d, and
this program is about to be used at about the same stage of boot as
get-edid. Ubuntu has it in /sbin per
http://packages.ubuntu.com/quantal/i386/v86d/filelist

> I don't feel strongly about this, if you prefer to keep them in bin/, it's
> fine. On embedded systems, /usr is most likely on the same partition
> as /, so it doesn't make much difference.

OK, perhaps I'll place all three (get-edid, parse-edid, v86d) in /sbin.

Baruch Siach wrote:

> read-edid seems to work perfectly on my x86_64 laptop. So keeping BR2_x86_64
> should be safe.

OK, if you tried what I submitted then I'll add x86_64 (I just do not
have a hardware to test it such way).

> As for PowerPC, I guess the low level code is selected at build time according
> to the target platform. I haven't looked at the code, though.

Well, this one uses real-mode BIOS call to VBE ROM via lrmi
(http://lrmi.sf.net - not sure if it supports powerpc). There is
another version of monitor info dump program in existence which uses
i2c which may work on something other than PC. Not the one I am
submitting.

Thanks.

-- 
Dimitry Golubovsky

Anywhere on the Web
