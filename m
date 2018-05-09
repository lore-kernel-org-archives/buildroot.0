From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 9 May 2018 11:48:51 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-04-25
In-Reply-To: <CANQCQpaTbUMwcPu0TU5Q0FQ2Df5B+8kBW2SwXF4mX1Kinc1WsA@mail.gmail.com>
References: <20180426060013.EAB262079F@mail.bootlin.com>
 <18cd8156-03bc-05cf-5343-dec77dbf01a9@gmail.com>
 <CANQCQpaTbUMwcPu0TU5Q0FQ2Df5B+8kBW2SwXF4mX1Kinc1WsA@mail.gmail.com>
Message-ID: <da6a90ba-6feb-41a9-f643-957e28fe8b5d@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matt,

Le 08/05/2018 ? 15:23, Matthew Weber a ?crit?:
> Romain,
> 
> On Sun, Apr 29, 2018 at 5:15 PM, Romain Naour <romain.naour@gmail.com> wrote:
>>
>> Hi All,
>>
>> git bisect helped to find a patch [1] fixing an infinite loop in RTL DSE
> 
> I've got another microblaze bug I'm working on identifying between
> GCC6.4 and 7.3.  Any general tips on bisecting GCC?  (What seems to be
> working is the following.... I went into buildroot and rewrote the GCC
> initial/final/toplevel mk to use a local site method and removed all
> source/version stuff.  Then built (for now) ignoring the buildroot
> patches against released versions.

I'm not hacking in the Buildroot's gcc package, I'm using local.mk with the
following two lines where /home/naourr/git/gcc is the absolute path to gcc sources:

HOST_GCC_INITIAL_OVERRIDE_SRCDIR = /home/naourr/git/gcc
HOST_GCC_FINAL_OVERRIDE_SRCDIR = /home/naourr/git/gcc

The git bisect is started from /home/naourr/git/gcc and you have to rebuild you
system for each try.

It's a long process (my git bisect took ~10 try.
) because you have to build a toolchain and build the package (and it's
dependencies) that trigger the issue.

Best regards,
Romain


> 
> Matt
> 
