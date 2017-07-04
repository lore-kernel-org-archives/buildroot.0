From: Wolfgang Grandegger <wg@grandegger.com>
Date: Tue, 4 Jul 2017 12:16:18 +0200
Subject: [Buildroot] libasan.so missing
In-Reply-To: <87podh5gi7.fsf@dell.be.48ers.dk>
References: <05992a34-6e01-9d75-926f-ab5a2e0e10a1@grandegger.com>
 <877ezp780a.fsf@dell.be.48ers.dk>
 <3af3ceda-f9fb-ff4c-c203-2248fade16d2@grandegger.com>
 <87podh5gi7.fsf@dell.be.48ers.dk>
Message-ID: <ed1251ca-9f4a-6f7c-3b51-7cc399299574@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Am 03.07.2017 um 23:59 schrieb Peter Korsgaard:
>>>>>> "Wolfgang" == Wolfgang Grandegger <wg@grandegger.com> writes:
> 
>   > Hello Peter,
>   > Am 03.07.2017 um 19:19 schrieb Peter Korsgaard:
>   >>>>>>> "Wolfgang" == Wolfgang Grandegger <wg@grandegger.com> writes:
>   >>
>   >> > Hello,
>   >> > I'm using the x86_64 buildroot toolchain with gcc 5.4. I wonder why
>   >> > the address sanitizer library "libasan.so*" is not available in the
>   >> > rootfs of the target. Is it intentional? And what is the best way to
>   >> > get it added to the rootfs?
>   >>
>   >> Is this with uClibc-ng, musl or Glibc?
> 
>   > It's with Glibc. I think the libsanitizer libs are built but not moved
>   > to the target.
> 
> Correct. I've sent a patch fixing this for the internal and external
> toolchain. Could you give it a try?
> 
> https://patchwork.ozlabs.org/patch/783661/
> https://patchwork.ozlabs.org/patch/783660/

$ find . -name 'libasan*'
./target/lib/libasan.so
./target/lib/libasan_preinit.o
./target/lib/libasan.so.2
./target/lib/libasan.so.2.0.0

It works. The libsanitizer adds some extra space and runtime overhead, I 
assume. Therefore, on Ubuntu, the libraries are not installed by 
default. They can be added by installing the "libasan0" package. For 
buildroot, would it make sense to make this option configurable as well?

(libasan.*) Extra toolchain libraries to be copied to target

Wolfgang.
