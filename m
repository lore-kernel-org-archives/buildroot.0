From: Sam Voss <sam.voss@rockwellcollins.com>
Date: Thu, 3 Oct 2019 14:06:08 -0500
Subject: [Buildroot] [PATCH 1/6] package/cargo: convert to virtual
 package
In-Reply-To: <CAK714xL1VY=Tg4jRQh6y4zOg=aPtSWN48C2ow_Q3o8UJ1fx6pg@mail.gmail.com>
References: <20190929171656.30187-1-eric.le.bihan.dev@free.fr>
 <20190929171656.30187-2-eric.le.bihan.dev@free.fr>
 <CAK714xL1VY=Tg4jRQh6y4zOg=aPtSWN48C2ow_Q3o8UJ1fx6pg@mail.gmail.com>
Message-ID: <CAH=K+6mN3w4-Q0i2z2UokMVTW=Nzu5oa77rKjpPA+sibub+urg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 1, 2019 at 6:33 PM Sam Voss <sam.voss@gmail.com> wrote:
>
> Eric, All,
>
> On Sun, Sep 29, 2019 at 12:17 PM Eric Le Bihan
> <eric.le.bihan.dev@free.fr> wrote:
> >
> > Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
>
> Tested-by: Sam Voss <sam.voss@gmail.com>

My original tests this had no issues, but I noticed today this
patchset causes Cargo to not select rustc in any way. This causes no
providers to be selected, and propagate out a build failure. My legacy
defconfig I based on already had RUSTC selected.

? make host-cargo
make[1]: *** No rule to make target 'host-', needed by
'/accts/smvoss/project/rust/build/host-cargo/.stamp_configured'.
Stop.
make: *** [_all] Error 2
Makefile:23: recipe for target '_all' failed

This happened when only BR2_PACKAGE_HOST_CARGO is selected, leaving no
providers as each of them require either RUSTC or RUSTC_BIN.

-- 

Sam Voss | Sr. Software Engineer | Commercial Avionics
COLLINS AEROSPACE
400 Collins Road NE, Cedar Rapids, Iowa 52498, USA
Tel: +1 319 263 4039
sam.voss at collins.com | collinsaerospace.com



CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.
