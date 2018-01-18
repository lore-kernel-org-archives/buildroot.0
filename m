From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Jan 2018 17:22:16 +0100
Subject: [Buildroot] [PATCH 1/1] package/sdl2: Fix Raspberry Pi support
 in package SDL2
In-Reply-To: <20180118154441.GB26856@momiji>
References: <20180116175054.GB28324@enterprise.starfleet>
 <20180118081528.16612-1-g@maral.me>
 <20180118160514.0684a720@windsurf.lan>
 <20180118154441.GB26856@momiji>
Message-ID: <20180118172216.31d59b4c@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 18 Jan 2018 15:44:41 +0000, Adrian Perez de Castro wrote:

> Historically in WebKitGTK+ we have had our share of issues with environment
> variables, mainly due to ?setenv()? not being thread-safe: the only case in
> which it does really work is at the very beginning of program execution,
> before any threads or secondary processes are started. Otherwise it's easy
> to shoot oneself on the foot and end up with threads/processes that ?see?
> different values for the same environment variable.
> 
> Provided that the patch is adding to ?LD_LIBRARY_PATH?, maybe one option could
> be using ?patchelf? to add the path to the DT_RUNPATH entry in the ELF header
> of ?libSDL2.so? in a post-build (or post-install?) hook. Or, if possible,
> arrange to pass the needed linker flags to get the path added there.
> 
> Or, even better, add ?/opt/vc/lib? in DT_RUNPATH when the RPi VideoCore
> libraries are installed into ?/opt/vc? ? somehow that sounds more correct
> in my head. WDYT?

Yes, I agree it would be much better to add a -Wl,-rpath,/opt/vc/lib to
the LDFLAGS if the libraries are in /opt/vc/lib.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
