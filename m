From: Anders Darander <anders.darander@gmail.com>
Date: Mon, 9 Jun 2014 08:12:13 +0200
Subject: [Buildroot] new TI kernel version for beaglebone black
In-Reply-To: <CAM5ihG9-XoZYABR5QgKGqPju6bDMfGrfjfMEoLj37JMo1Nw_Mw@mail.gmail.com>
References: <5388F5A2.1080008@ethertek.ca> <538AE6B7.8030202@gmx.net>
 <CAM5ihG9-XoZYABR5QgKGqPju6bDMfGrfjfMEoLj37JMo1Nw_Mw@mail.gmail.com>
Message-ID: <CAE4k238OSM3mjeRv0+ahtxGUeWcHY5dfDx2F6ULKUPbj329emw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2 June 2014 14:39, Jer?nimo Lopes <lopesjeronimo@gmail.com> wrote:
> I'm also working on a beaglebone black project using buildroot to build all.
> Recently I need to change some pin modes, and every googling about it, leads
> to capemanager, witch is provided by 'beagleboard kernel'
> (https://github.com/beagleboard/kernel). Also every one saying something
> about compile a kernel to beaglebone points to this kernel (the 3.8
> version).

> So I've decided to change things on my project to build this kernel outside
> buildroot. But I'm not sure about this, witch is the recommended kernel to
> use with beaglebone black?

I'd be inclined to agree with the previous response that you got.

Try the latest (currently 3.15) from mainline. If you need support for something
that doesn't work there, I'd check the TI tree.

If you want to use / need the capemgr (to more easily support multiple capes,
especially if you like to switch between a number of capes), then the
3.8 version
from https://github.com/beagleboard/kernel is likely your best bet.

There's no need to go to https://github.com/beagleboard/kernel just because of
pinmuxing. For that, just make sure that you customize your DTS to add your
specific configuration.

Cheers,
Anders

-- 
Anders Darander
EPO guidelines 1978: "If the contribution to the known art resides
solely in a computer program then the subject matter is not
patentable in whatever manner it may be presented in the claims."
