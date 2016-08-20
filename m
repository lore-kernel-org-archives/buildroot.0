From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 20 Aug 2016 13:55:23 -0700
Subject: [Buildroot] fixdep not found
In-Reply-To: <20160820223416.23798a74@free-electrons.com>
References: <CAK7rcp-qDKDR-qGPVBoUfpwCj22Qs4dmjvFg_=uaZok_kHC-nQ@mail.gmail.com>
 <9DBD7782-3142-403E-9161-874B233FBAF0@gmail.com>
 <20160820223416.23798a74@free-electrons.com>
Message-ID: <4CF9B59C-7DB4-4B90-BAFF-25655871DC54@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> On Aug 20, 2016, at 1:34 PM, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> 
> Hello,
> 
> On Sat, 20 Aug 2016 13:31:58 -0700, Khem Raj wrote:
> 
>>> I'm getting an issue during >>> linux-headers 3.14.51 Configuring
>>> where it executes a make ... headers_install, and then goes to execute
>>> scripts/basic/fixdep, but cannot find it. I can see that fixdep must
>>> be compiled from fixdep.c, which I can find within the particular
>>> build directory. But it's not already compiled when buildroot
>>> generates code that would depend on it.
>>> 
>>> How do I resolve this?
>> 
>> it could be a race condition, so may be you can divide the build into two steps
>> first does make tools and then make headers
> 
> Hu? How could the kernel build system has race conditions? We have
> gazillions of builds involving linux-headers running every day, and we
> never had a single race condition issue.

Right. Never said thats the issue, its one explanation to the issue
and area to explore. There could be local patches which could be a factor.

> 
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 204 bytes
Desc: Message signed with OpenPGP using GPGMail
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160820/b66d0ce5/attachment.asc>
