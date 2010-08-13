From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Aug 2010 12:26:00 +0200
Subject: [Buildroot] Configuring host-lzo fails
In-Reply-To: <201007272333.09640.PeterHuewe@gmx.de>
References: <201007272333.09640.PeterHuewe@gmx.de>
Message-ID: <20100813122600.3d227eb3@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Tue, 27 Jul 2010 23:33:09 +0200
Peter H?we <PeterHuewe@gmx.de> wrote:

> TP > It sounds like the autoconf host-config.cache has been filled
> with an TP > empty value for --target.
>  
> TP > Can you show the contents
> TP > of /avr/buildroot/output/build/host-config.cache after the
> failure, and
> TP> can you post the *full* build log somewhere ?
> 
> I've gzipped the whole build log (from a fresh git clone) and
> uploaded it to http://www.hs-augsburg.de/~phuewe/typescript2.gz
> (498K, unzipped 8,8Mb)
> 
> The contens of the host-config.cache can be found at
> http://paste.pocoo.org/show/242433/

I finally took the time to track and fix this problem of host-lzo
configuration with the shared configuration cache.

The problem was due to the test in ./configure for the target system
name being incorrectly written. Newer versions of autoconf do not
generate such an incorrect code, so the solution was simply to
autoreconfigure the package. Unfortunately, it wasn't so simple, as the
package required several adaptations before being autoreconfigurable.

This is fixed in my for-2010.08 branch, the specific commit being
http://git.buildroot.net/~tpetazzoni/git/buildroot/commit/?h=for-2010.08&id=fee182d20d9b1876436c9673744ae6312a40e889.

If you have the time to test this branch and report whether it also
fixes the problem for you, it'd be nice.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
