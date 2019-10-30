From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Oct 2019 13:43:34 +0100
Subject: [Buildroot] [PATCH 2/2 v2] packages/sox: unconditionaly disable
 custom SSP detection
In-Reply-To: <0311678e7e917354544483e815ce7112d9fe830c.1572010936.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Fri, 25 Oct 2019 15:42:42 +0200")
References: <cover.1572010936.git.yann.morin.1998@free.fr>
 <0311678e7e917354544483e815ce7112d9fe830c.1572010936.git.yann.morin.1998@free.fr>
Message-ID: <87tv7qz9mx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: Yann Droneaud <ydroneaud@opteya.com>
 > sox implements a custom mechanism to detect whether the toolchain has
 > SSP suport or not. In doing so, it explicitly tries to see if libssp.so
 > is present, in which case it unconditionally links with it, even though
 > the compiler, if left by itself, would have used the SSP support
 > provided by the C library.

 > However, with Buildroot, the SSP options arfe handled in our gcc
 > wrapper, so packages should just not bother with that.

 > It turns out that, when sox is configured with --disable-stack-protector,
 > it does not disable it, but really does nothing, which is good for us.

 > Currently, SSP is conditionally disabled in sox, under various
 > conditions: that the toolchain does not have SSP, or that it is one of
 > the know SSP-challenged (i.e. broken) toolchains. Those conditions dates
 > back tpo before our wrapper started handling that.

 > Remove all those conditions, unconditionally disable SSP in sox, and let
 > our gcc wrapper handle the SSP options.

 > Signed-off-by: Yann Droneaud <ydroneaud@opteya.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

 > ---
 > Changes v1 -> v2:
 >   - reword commit log  (Yann)
 >   - remove all conditions  (Yann)

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
