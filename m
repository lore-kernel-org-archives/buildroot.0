From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Sat, 19 Sep 2020 14:08:41 -0700
Subject: [Buildroot] [PATCH] package/sentry-cli: new package
In-Reply-To: <20200919225009.321abe29@windsurf>
References: <20200915205738.2144347-1-joseph.kogut@gmail.com>
 <20200919225009.321abe29@windsurf>
Message-ID: <CAMWSM7hWs8Zb8doBWTUEegJBdp2R7yd3t0+V_0guALM4i--=zA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, Sep 19, 2020 at 1:50 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Tue, 15 Sep 2020 13:57:38 -0700
> Joseph Kogut <joseph.kogut@gmail.com> wrote:
>
> > Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
>
> I did some more testing, and after building zlib for the host, the
> build fails with:
>
> *** ERROR: package host-libzlib installs executables without proper RPATH:
> ***   /home/thomas/projets/buildroot/output/host/bin/sentry-cli
>
> Indeed, sentry-cli is linked with libz.so.1:
>
>  0x0000000000000001 (NEEDED)             Shared library: [libz.so.1]
>  0x0000000000000001 (NEEDED)             Shared library: [libc.so.6]
>  0x0000000000000001 (NEEDED)             Shared library: [ld-linux-x86-64.so.2]
>  0x0000000000000001 (NEEDED)             Shared library: [libdl.so.2]
>  0x0000000000000001 (NEEDED)             Shared library: [libpthread.so.0]
>  0x0000000000000001 (NEEDED)             Shared library: [libgcc_s.so.1]
>  0x0000000000000001 (NEEDED)             Shared library: [libm.so.6]
>
> I've seen that sentry-cli bundles OpenSSL (it seems), which is perhaps
> why it links against libz.so.1.
>
> However, this means that sentry-cli should depend on host-zlib and
> should have a RPATH to $(HOST_DIR)/lib.
>
> Could you have a look into this ? I've added in Cc some folks working
> on Cargo integration in Buildroot, to see if they can help.
>

Definitely, thanks for making those changes and testing. I'll look
into this and follow up with a patch.

Best,
Joseph
