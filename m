From: Alexander Egorenkov <egorenar@linux.ibm.com>
Date: Sun, 13 Sep 2020 13:32:24 +0200
Subject: [Buildroot] [PATCH 3/3] package/s390-tools: new package
In-Reply-To: <20200912224347.GJ10548@scaer>
References: <20200910174143.311039-1-egorenar@linux.ibm.com>
 <20200910174143.311039-4-egorenar@linux.ibm.com>
 <20200912224347.GJ10548@scaer>
Message-ID: <87lfhd7vzr.fsf@oc8242746057.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@free.fr> writes:


>
> In this case, this package is really architecture-specific, so it will
> never be available on other archtectures (or sub-architectures).
>
> As such, BR2_PACKAGE_S390_TOOLS_ARCH_SUPPORTS is superfluous here,
> and...
>

Done.

>
> ... here you should directly depend on BR2_s390x, and...
>

Done.

>
> ... here as well.
>

Done.

>
> I see that s390-tools is supposed to work on a uclibc toolchain, but
> your previous patch only enabled glibc for the internal toolchain.
>
> However, I don;t see much support for s390x in uClibc-ng.
>
> Quid?
>

Fixed.

> It is custimary to do that with a single assignment:
>
>     S390_TOOLS_MAKE_OPTS = \
>         ARCH=$(BR2_ARCH) \
>         CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE" \
>         LINK="$(TARGET_CC)" \
>         LINKXX="$(TARGET_CXX)"
>
> Any reason for forcing verbosity (V=1)?
>

Fixed.

>
> We want explicitly enabling of options as well (applicable to the other
> options as well, of course):
>
>     ifeq ($(BR2_PACKAGE_LIBCURL),y)
>     S390_TOOLS_DEPENDENCIES += libcurl
>     S390_TOOLS_MAKE_OPTS += HAVE_CURL=1
>     else
>     S390_TOOLS_MAKE_OPTS += HAVE_CURL=0
>     endif
>
> If that does not work, please explain it in the commit log:
>
>     Options (e.g. HAVE_CURL=0) can only be disabled, and can't be
>     explicitly enabled.
>

Fixed.


Thank you for your review
Regards
Alexander Egorenkov
