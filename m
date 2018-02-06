From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 6 Feb 2018 23:39:05 +0100
Subject: [Buildroot] [RFCv3 15/15] core: implement per-package SDK and
 target
In-Reply-To: <c73b59f2-50a3-ca86-6859-3ad101d6b1ee@mind.be>
References: <20171201205352.24287-1-thomas.petazzoni@free-electrons.com>
 <20171201205352.24287-16-thomas.petazzoni@free-electrons.com>
 <CANQCQpb780bRRaSkUnV2aTFg=1LjZ9f3tD-YYCOTN4au2F965A@mail.gmail.com>
 <c73b59f2-50a3-ca86-6859-3ad101d6b1ee@mind.be>
Message-ID: <CANQCQpYk0ZCn4bPtoApjf+F2QMGki1LDCfi651G1o4cwdwwTZw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Tue, Feb 6, 2018 at 11:00 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
> On 06-02-18 15:45, Matthew Weber wrote:
> [snip]
>>
>> Using this patchset without any -j.  I found a case with host-setools
>> where it uses the python-package framework to build and using
>> setuptools puts a default -I<abs
>> path>/per-package/host-python/host/include.  Previously this would
>> have pointed at the full sysroot so now there is a missing include.
>
>  There should also be a -I<abs path>/per-package/host-setools/host/include
> because that's in HOST_CFLAGS. Or does this get hardcoded by setuptools?
>
I haven't been able to verify where the host-python include is coming
from.  It looks like it might be getting pulled as a default based on
setuptools/python install location.

>  BTW, I guess the problem is that it fails to find libselinux or libsepol includes?

Correct here's the patch I'm using so far
https://patchwork.ozlabs.org/patch/870133/

Once I got past this issue, now setools when building for target has
linker issues but it looks like this packages includes are solved.

Matt
