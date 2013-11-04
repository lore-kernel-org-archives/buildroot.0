From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 4 Nov 2013 13:03:41 +0100
Subject: [Buildroot] [PATCH v2 3/6] systemd: bump to v206.
In-Reply-To: <20131104114524.GA30293@pc-eric>
References: <1379679847-16141-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1379679847-16141-4-git-send-email-eric.le.bihan.dev@free.fr>
 <20131102193139.2af593b9@skate> <20131104114524.GA30293@pc-eric>
Message-ID: <CAAXf6LUOmmpi32WPRrkrWmFrgYO=knp5MiJNgBy04vnmjnv4aQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, Nov 4, 2013 at 12:45 PM, Eric Le Bihan
<eric.le.bihan.dev@free.fr> wrote:
> On Sat, Nov 02, 2013 at 07:31:39PM +0100, Thomas Petazzoni wrote:
>
[..]
>
>> > +comment 'systemd needs toolchain w/ stack smashing protection'
>> > +   depends on !BR2_TOOLCHAIN_HAS_SSP
>>
>> Wow, that's probably the first package that has this requirement. What
>> happens when the toolchain doesn't have SSP support?
>
> Without SSP, systemd does not build. It is compiled using lots of error
> checking flags (see OUR_CFLAGS in configure.ac), which sounds sensible when
> building a program meant to run as PID 1. This requirement made me report the
> issue "uClibc fails to build with stack smash protection" back in September,
> which was caused by the change in GCC build procedure (two steps instead of
> three).
>

Note that the comments should be '...needs a toolchain...' (with 'a')

I wonder what to do here though. We have deliberately chosen the
toolchain keywords to be short so that the entire line can fit within
a 80-char terminal. 'Stack smashing protection' is pretty long in that
respect.
Not sure if there will be other packages that depend on this option,
but what about we name it just 'SSP' (which also is how it's named in
the toolchain menu). We should probably also update the manual with
this new 'toolchain option' that can have a comment.

Best regards,
Thomas
