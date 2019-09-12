From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Thu, 12 Sep 2019 10:58:34 +0100
Subject: [Buildroot] Chromium v7 test
In-Reply-To: <CAD0+TpC_h=jfXgNrS9z820zQ0gU3nAXp_eFQ8KsYL=XqC4D0Hg@mail.gmail.com>
References: <CAD0+TpAh1V=ztZfNAGzF34DAW=6f-JSzkJ0SvhwNWqu3vw_5HQ@mail.gmail.com>
 <ab26bc45-d159-f10b-bfbd-9ad676d7d75d@codethink.co.uk>
 <CAMWSM7iW0FxukQi3kV7njD_bgFXVyQoWSwHC8Nnz_r0iQOZb4g@mail.gmail.com>
 <d86c4082-efed-c7e8-e081-d6ff81583ec3@codethink.co.uk>
 <CAD0+TpC_h=jfXgNrS9z820zQ0gU3nAXp_eFQ8KsYL=XqC4D0Hg@mail.gmail.com>
Message-ID: <1d91b9a9-392c-0bd9-3a3d-536ab17f24ad@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fame,

On 11/09/2019 17:57, Fame Castle wrote:
> Hi Thomas,
> it's great to see your interest in this. If I can help you in any
> way, please let me know. I'm still interested in this as a long term
> goal, while I'm working on different projects now. I would however
> appreciate any progress with this.

No problem, we'll keep you updated.

> I think the following is interesting:
> I am using CEF with Python (called cefpython). I install it using the
> Python Package Manager pip and then on my host machine I got a folder
> with cef browser binaries somewhere. I just took those binaries and the
> Python bindings and copied them into my Buildroot-OS. Then, I was
> actually able to get my Python CEF application working. It went
> fluently! So at its core, this should be really possible. However, this
> doesn't feel like a nice implementation. And, some other window
> management libraries which theirself take CEF and enable you to control
> the application window, failed with Segmentation faults. I'm confident
> this may be due to the usage of my host's binaries. But I think it's
> interesting that it worked. So we should find our way and make
> successfull Chromium builds.

Our client also has a work-around too, but maintaining this out-of-tree is a
pain.

Additionally we want to handle cross-compiling. Without trying it, Joseph's
method (using Configs) looks sensible, but I wonder if there's a tighter way to
integrate this with buildroot toolchain arch?

Tom
