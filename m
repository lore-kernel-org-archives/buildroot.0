From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 07 Dec 2012 09:09:00 -0300
Subject: [Buildroot] buildroot-2012.11  openssh: Bad trap error
In-Reply-To: <50C1C261.2040106@shf.de>
References: <50C06C77.7020509@shf.de> <50C0B224.2020007@zacarias.com.ar>
 <50C1C261.2040106@shf.de>
Message-ID: <50C1DC5C.8050404@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/07/2012 07:18 AM, Jan Schunke wrote:
> Hi,
> 
> I updated all packages back to the newer version and followed your
> suggestion:
> 
>> You could also try disabling the powerpc optimizations in
>> package/openssl/openssl.mk, just remove the block from ifeq
>> ($(ARCH),powerpc) to the first endif (3 lines).
> 
> and everything is ok, too. Can we just check if $ARCH is powerpc AND
> BR2_SOFT_FLOAT is set to yes in package/openssl/openssl.mk?
> 
> Regards
> Jan

Hi again.
Patch just sent.
I couldn't track it down to being an FP issue since openssl doesn't seem
to be using any FP opcode, so i guess it's some missing opcode from the
4xx cores that it's using.
It wouldn't matter if the toolchain is soft or hard float either since
openssl uses inline assembly without checking for it.
The patch excludes powerpc assembly optimizations for al 4xx cores to
err on the safe side.
Thanks for the report and testing.
Regards.
