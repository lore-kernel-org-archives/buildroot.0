From: Stuart Longland <stuartl@longlandclan.id.au>
Date: Sun, 28 Jan 2018 14:45:41 +1000
Subject: [Buildroot] Compiling gcc for the target?
In-Reply-To: <20180128033001.gf7u5ix6twj7dghu@tarshish>
References: <45535c2a-31b5-8063-d749-926f7c2f023f@longlandclan.id.au>
 <20180128033001.gf7u5ix6twj7dghu@tarshish>
Message-ID: <08307c18-be19-dbe5-cefe-428d01f5db80@longlandclan.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/01/18 13:30, Baruch Siach wrote:
> Hi Stuart,
> 
> On Sun, Jan 28, 2018 at 12:35:57PM +1000, Stuart Longland wrote:
>> I'm trying to bootstrap a musl system and am running into a road-block
>> with regards to getting a C compiler running on the target.  My target
>> is ARMv5 (specifically, ARM926EJ-S).
>>
>> The aim will be to use a QEMU VM to "natively" compile packages, as
>> there's lots of packages that just don't cross-compile.
> 
> Which packages are these?

Off the top of my head, I know a lot of Python modules fail to
cross-compile.  "Don't use Python" isn't a valid answer.

In short though, I actually need a root FS with a compiler so that I can
build software within that environment.  It's a requirement of Gentoo's
release engineering tool, catalyst.

Basically, I've managed to cross *everything else* I need, except gcc.
gcc needs gcc to bulid gcc.  Specifically, gcc needs g++? which is even
worse.

> There used to be support for target toolchain, but this support has been 
> removed long ago. See the FAQ at
> 
>   https://buildroot.org/downloads/manual/manual.html#faq-no-compiler-on-target

Thats, unfortunate.  I can understand its an atypical use case for
buildroot and sadly, building gcc seems to be far more difficult than it
ought to be.
-- 
Stuart Longland (aka Redhatter, VK4MSL)

I haven't lost my mind...
  ...it's backed up on a tape somewhere.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180128/f8929a45/attachment.asc>
