From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 4 Feb 2019 19:27:44 +0100
Subject: [Buildroot] [PATCH] store debug information in
 $HOST_DIR/lib/debug
In-Reply-To: <20190204191954.533a4216@windsurf>
References: <20190123131539.24699-1-Gerhard@Heift.Name>
 <20190204175809.7b710934@windsurf>
 <CAAXf6LW961NpVPtOUbmoi4oJeqmtqYWPA8V7FwQP6ztAXdJAKg@mail.gmail.com>
 <20190204191954.533a4216@windsurf>
Message-ID: <20190204182744.GF17819@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2019-02-04 19:19 +0100, Thomas Petazzoni spake thusly:
> On Mon, 4 Feb 2019 19:05:26 +0100
> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> wrote:
> 
> > The difference that this patch brings is that now also binaries can be
> > debugged based from the target directory, i.e. you don't need to find
> > the binary in output/build/foo-version/somewhere/.
> > 
> > Today, the staging directory only contains packages that explicitly
> > set FOO_INSTALL_STAGING = YES, which is typically only done for
> > libraries.
> 
> Yes, but:
> 
> 1) Typically the binary being debugged has to be passed explicitly as
>    gdb argument, it's not automatically "inferred" by gdb. So having it
>    in output/build/foo-<version>/somewhere/ or elsewhere doesn't make a
>    huge difference.
> 
> 2) If for convenience reasons we want to make all binaries with
>    debugging symbols easily available, then the long term solution we
>    have been discussing for a while is to install all packages to
>    STAGING_DIR. So basically I'm more for extending STAGING_DIR to
>    contain binaries rather than to create a partial copy of STAGING_DIR
>    in HOST_DIR/lib/debug.

I side with Thomas P. on that one.

We've had this discussion a few times already, and the conslusion was to
try and install everything in staging.

Then, target can be created at the end, by copying staging/ to target/
and do the target-finalize step on that copy.

Or so that is the main idea, and it can be refined to account for subtle
details, such as the on-going per-package directory and top-level
parallel build...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
