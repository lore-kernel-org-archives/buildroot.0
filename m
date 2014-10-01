From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Oct 2014 16:36:23 +0200
Subject: [Buildroot] buildroot-2011.05-sdk5.1.2 python2.7.1
In-Reply-To: <CALD51P_2sBRveQaY6xM6ZP8RLt6Q51hNdXSH7zyWjtPaWHHopw@mail.gmail.com>
References: <CALD51P_2sBRveQaY6xM6ZP8RLt6Q51hNdXSH7zyWjtPaWHHopw@mail.gmail.com>
Message-ID: <20141001163623.1e548550@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Lijun QIN,

On Wed, 1 Oct 2014 07:21:37 -0500, Lijun QIN wrote:

> Buildroot-2011.05:

You should definitely upgrade: we generally don't support a 3+ years old
Buildroot version since most likely the bug you will report have
already been fixed.

> Python build finished, but the necessary bits to build these modules were
> not found:
> 
> _bsddb             _sqlite3           _tkinter
> 
> bsddb185           dbm                gdbm
> 
> linuxaudiodev      ossaudiodev        sunaudiodev
> 
> To find the necessary bits, look in setup.py in detect_modules() for the
> module's name.
> 
> Any body could kindly offer any advice ?

Yes: it's normal. Some modules (such as sunaudiodev) can probably not
even build on Linux systems. Some other modules, such as _bsddb, 
_sqlite3 or _tkinter require additional external libraries to be built.
Most likely they have not been built.

Which module amongst those mentioned above are you interested in
getting built?

I don't remember what was the state of the Python support in Buildroot
2011.05, but we've done a *lot* of Python improvements over the last
few releases, so I would suggest you to first update your Buildroot
version, and then let us know if you still have any issue.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
