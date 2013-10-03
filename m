From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Thu, 3 Oct 2013 09:42:55 -0400
Subject: [Buildroot] Some legal-info observations/problems
In-Reply-To: <OFA9E6CB32.66C4A13C-ON86257BF9.0049F1F8-86257BF9.004A5509@rockwellcollins.com>
References: <CAAXf6LXHXo2vY8ns61fxoLzD0n2yzLASZqFk75xzYQwgDHp15Q@mail.gmail.com>
 <OF28FCBE52.CC9DE764-ON86257BF8.00513AFD-86257BF8.006773C0@rockwellcollins.com>
 <CAAXf6LXj9m1Vo8W5SJGGBHCyiRj=gUP=574Xjcqvn1jhnZZwgg@mail.gmail.com>
 <OFA9E6CB32.66C4A13C-ON86257BF9.0049F1F8-86257BF9.004A5509@rockwellcollins.com>
Message-ID: <CANxTyt5STqs0sVnG0q1PVWm+5OLi=8QbrFLHfGHJr4po4vhKgw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ryan,

On Thu, Oct 3, 2013 at 9:31 AM, Ryan Barnett
<rjbarnet@rockwellcollins.com> wrote:
>> While I don't need the URL for my process, I currently also don't need
>> the name of the tarball in manifest.csv (and I leave out this last
>> column anyway). So, I'm not opposed to adding this extra column, but
>> there may be some caveats: with the OVERRIDE_SRCDIR mechanism it is
>> possible for a project to completely change the sources of an existing
>> package in buildroot. Strictly speaking this could mean that there is
>> no relation whatsoever between the URL specified in the .mk file and
>> the actual sources used. This is probably very exotic, though, and
>> maybe it doesn't really matter for your process.
>
> You bring up an interesting point that I never thought of. However, in
> the application of OVERRIDE_SRCDIR, I would think that it mainly intended
> for company's application but I could be wrong.

FWIW, several of our projects regularly use permanent OVERRIDE_SRCDIR
settings to compile exploded copies of uboot and xloader checked into
our source control system, rather than maintain patches against some
off-upstream vendor tarball; it's just easier than educating the folks
in remote offices about patching.
