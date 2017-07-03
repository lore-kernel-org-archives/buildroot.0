From: Wolfgang Grandegger <wg@grandegger.com>
Date: Mon, 3 Jul 2017 19:47:20 +0200
Subject: [Buildroot] libasan.so missing
In-Reply-To: <877ezp780a.fsf@dell.be.48ers.dk>
References: <05992a34-6e01-9d75-926f-ab5a2e0e10a1@grandegger.com>
 <877ezp780a.fsf@dell.be.48ers.dk>
Message-ID: <3af3ceda-f9fb-ff4c-c203-2248fade16d2@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

Am 03.07.2017 um 19:19 schrieb Peter Korsgaard:
>>>>>> "Wolfgang" == Wolfgang Grandegger <wg@grandegger.com> writes:
> 
>   > Hello,
>   > I'm using the x86_64 buildroot toolchain with gcc 5.4. I wonder why
>   > the address sanitizer library "libasan.so*" is not available in the
>   > rootfs of the target. Is it intentional? And what is the best way to
>   > get it added to the rootfs?
> 
> Is this with uClibc-ng, musl or Glibc?

It's with Glibc. I think the libsanitizer libs are built but not moved 
to the target.

> We have the following in package/gcc/gcc.mk:
> 
> # libsanitizer requires wordexp, not in default uClibc config. Also
> # doesn't build properly with musl.
> ifeq ($(BR2_TOOLCHAIN_BUILDROOT_UCLIBC)$(BR2_TOOLCHAIN_BUILDROOT_MUSL),y)
> HOST_GCC_COMMON_CONF_OPTS += --disable-libsanitizer
> endif
> 
> We recently enabled wordexp support in uClibc-ng, so this can most likely
> we enabled there. I'll do a test build now.

Wolfgang.
