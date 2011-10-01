From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Oct 2011 13:19:40 +0200
Subject: [Buildroot] Question: Multiple versions of a package.
In-Reply-To: <ADE657CA350FB648AAC2C43247A983F001F39DC568EC@AUSP01VMBX24.collaborationhost.net>
References: <ADE657CA350FB648AAC2C43247A983F001F39DC568EC@AUSP01VMBX24.collaborationhost.net>
Message-ID: <20111001131940.08aa053b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Fri, 30 Sep 2011 16:21:02 -0500,
H Hartley Sweeten <hartleys@visionengravers.com> a ?crit :

> Can a package/*/*.mk file be setup to handle two different versions
> of a package or should two separate package/* directories be created?
> 
> I'm trying to add the ParaGUI package to buildroot.  This is a widget
> toolkit library that uses SDL.  It also needs libsigc++, which is
> available in packages/, but it's an incompatible version.
> 
> The version of libsigc++ in buildroot is 2.2.8.  ParaGUI needs
> libsigc++1.2 >= 1.2.5.  It appears that even though these libraries
> do the same thing they have very different API's.
> 
> A similar issue occurs with the new version of SDL.  It has not been
> offically released yet but SDL1.2 and SDL1.3 (2.0?) use completely
> different APIs.
> 
> What's that bast way to handle this situation?

There is basically two ways :

 1) A single libsigc++ package, with a suboption to select the version
    to be compiled. This solution does not allow two different versions
    of libsigc++ to be built. For different versions of a library
    having different ABIs, this solution is probably not appropriate.

 2) Separate libsigc++ packages, with different names, like libsigc1
    and libsigc2. This allows both versions to be built and installed
    in the target, in case different applications require different
    versions of the libsigc library.

I guess in your case, solution 2) is the only way. This is also what
traditional binary desktop distributions do.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
