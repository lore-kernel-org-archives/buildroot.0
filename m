From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 13 Apr 2017 16:20:41 -0500
Subject: [Buildroot] [PATCH 2/3] python3: ncurses condition for
	libselinux enabled
In-Reply-To: <20170413222710.419f6cd1@free-electrons.com>
References: <1492056974-1773-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1492056974-1773-2-git-send-email-matthew.weber@rockwellcollins.com>
 <20170413222710.419f6cd1@free-electrons.com>
Message-ID: <CANQCQpb4ySf=NtgNbWShus4YUrJDFqhqTgB0b_oc++Ov3xrmsw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Thu, Apr 13, 2017 at 3:27 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Wed, 12 Apr 2017 23:16:13 -0500, Matt Weber wrote:
>> When libselinux is enabled, a circular dependency is
>> created.  Disable ncurses python support when libselinux
>> is enabled so that the circular busybox, ncurses,
>> python, libselinux chain is broken.
>>
>> Resolves
>> http://autobuild.buildroot.net/results/db1/db1e6f3054092fc5576ccab8e04a3b9d74ca9a8c/
>>
>> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
>
> I am not sure this is the right approach to fix this issue. It feels
> really weird to no longer be able to use ncurses support in Python(3)
> when SELinux is enabled.
>
> I believe the real issue is that Busybox really doesn't care at all
> about the Python bindings for libselinux. So perhaps we should split
> the Python bindings build/installation from libselinux into a separate
> package. I think we had a similar split for another package.
>
> It would however require some investigation to figure out if it's
> possible to build just the Python bindings, using an already built and
> installed libselinux.

I'll take a look.

-Matt
