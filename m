From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 11 Aug 2016 22:01:49 -0700
Subject: [Buildroot] RFC: package level compile time hardening
In-Reply-To: <CANQCQpZi9FpuNe4HRTyHghpBhaRRbWw2ojgJ1P2HVxeiJ+zgUA@mail.gmail.com>
References: <CANQCQpZi9FpuNe4HRTyHghpBhaRRbWw2ojgJ1P2HVxeiJ+zgUA@mail.gmail.com>
Message-ID: <854894E2-B153-4FD9-8E2D-3FC0EE9920A5@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> On Aug 11, 2016, at 8:50 PM, Matthew Weber <matthew.weber@rockwellcollins.com> wrote:
> 
> Any suggestions on an approach to manage changes made to buildroot
> packages to harden the build time cflags/ldflags of a specific
> package, where by adding the additional flags, the build now requires
> specific toolchain versions and may impact ability to have a package
> compile across as many arch as it currently does.  We currently
> maintain this sort of change as a rebased patch on top of master.
> Thoughts for other options?

the hardening could be maintained as a global top level kconfig
option. which should be then used at package level to make per
package decisions. It should be possible to select hardening in
general, in world case it will do nothing. In best case every package
will be compiled with PIC/PIE and other cool stuff.

> 
> We're trying to do something similar to Ubuntu's hardening efforts and
> so far have started with toolchain configuration and compile/link time
> settings to enable key security features.
> https://wiki.ubuntu.com/HardenedUbuntu
> 
> --
> Matthew L Weber / Pr Software Engineer
> Airborne Information Systems / Security Systems and Software / Secure Platforms
> MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
> www.rockwellcollins.com
> 
> Note: Any Export License Required Information and License Restricted
> Third Party Intellectual Property (TPIP) content must be encrypted and
> sent to matthew.weber at corp.rockwellcollins.com.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 204 bytes
Desc: Message signed with OpenPGP using GPGMail
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160811/f3c521e7/attachment.asc>
