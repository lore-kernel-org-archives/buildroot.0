From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 28 Dec 2017 17:28:49 -0600
Subject: [Buildroot] [PATCH 1/1 v2] gcc: Add support for
 --enable-default-pie configure option.
In-Reply-To: <CANQCQpZ40Q3T2gOPqu8_vGHCTAup_fxgW3ubfYjewfgo7DwW0A@mail.gmail.com>
References: <20171228214333.8340-1-stefan.froberg@petroprogram.com>
 <20171228230743.1e6c59ab@windsurf>
 <CANQCQpZ40Q3T2gOPqu8_vGHCTAup_fxgW3ubfYjewfgo7DwW0A@mail.gmail.com>
Message-ID: <CANQCQpaRU59QsTQGmRKiTjFsvpVq6K2BGfWsTeO6JpcPie4Sgw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stefan,

On Dec 28, 2017 4:08 PM, "Thomas Petazzoni" <
thomas.petazzoni@free-electrons.com> wrote:

Hello,

On Thu, 28 Dec 2017 23:43:33 +0200, Stefan Fr?berg wrote:
> By default, buildroot produces insecure binaries.
>
> GCC 6.x added build time configuration option "--enable-default-pie".
> With that enabled, GCC will produce PIE
> (Position-independent executables) binaries.
>
> PIE is a requirement for ASLR (Address space layout randomization)
> that will make exploits like return-to-libc attack impossible.
>
> If you want to have a modern, secure system then enable this option.
>
> To override this default behaviour, you can use -no-pie
> with your CFLAGS/CXXFLAGS.
>
> https://gcc.gnu.org/onlinedocs/gcc-6.2.0/gcc/Link-Options.html

As I said in my previous review, I think we want a solution that also
applies to external toolchains, by passing -pie in the compiler wrapper.

Please see "[PATCH 2/2] security hardening: add RELFO,  FORTIFY
options" in the mailing list archives,
https://patchwork.ozlabs.org/patch/830085/, it was also adding -pie
support, but in a more generic way. Could you use this instead ?


I've got a v3 in the works for that one, I can incorporate this into it if
you'd like and send out the set this weekend (currently no computer)

Matt
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171228/eda3b18f/attachment.html>
