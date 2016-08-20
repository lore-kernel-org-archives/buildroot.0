From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 20 Aug 2016 13:31:58 -0700
Subject: [Buildroot] fixdep not found
In-Reply-To: <CAK7rcp-qDKDR-qGPVBoUfpwCj22Qs4dmjvFg_=uaZok_kHC-nQ@mail.gmail.com>
References: <CAK7rcp-qDKDR-qGPVBoUfpwCj22Qs4dmjvFg_=uaZok_kHC-nQ@mail.gmail.com>
Message-ID: <9DBD7782-3142-403E-9161-874B233FBAF0@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> On Aug 20, 2016, at 9:24 AM, Kenneth Adam Miller <kennethadammiller@gmail.com> wrote:
> 
> Hello all,
> 
> 
> I'm trying to build a linux, version 3.14.51 with the buildroot
> toolchain, gcc version 5.x and uclibc-ng. I also have Kernel headers
> set to same as kernel being built an customer kernel header series set
> to 3.14.x
> 
> 
> I'm getting an issue during >>> linux-headers 3.14.51 Configuring
> where it executes a make ... headers_install, and then goes to execute
> scripts/basic/fixdep, but cannot find it. I can see that fixdep must
> be compiled from fixdep.c, which I can find within the particular
> build directory. But it's not already compiled when buildroot
> generates code that would depend on it.
> 
> How do I resolve this?

it could be a race condition, so may be you can divide the build into two steps
first does make tools and then make headers


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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160820/561e6d75/attachment.asc>
