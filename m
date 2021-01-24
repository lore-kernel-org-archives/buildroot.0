From: Joachim Wiberg <troglobit@gmail.com>
Date: Mon, 25 Jan 2021 00:36:05 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/ssdp-responder: new package
In-Reply-To: <20210124223330.GL2325@scaer>
References: <20210124194908.1762833-1-troglobit@gmail.com>
 <20210124194908.1762833-2-troglobit@gmail.com> <20210124223330.GL2325@scaer>
Message-ID: <87im7lvrfe.fsf@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Yann,

On Sun, Jan 24, 2021 at 23:33, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> On 2021-01-24 20:49 +0100, Joachim Wiberg spake thusly:
>> Verified with check-package and test-pkg, no-mmu builds disabled.
> I've done a bit of research as to why noMMU builds were broken.
> Initially, you stated:
>> +	depends on BR2_USE_MMU # fork()
> However, ssdp-responder does not use fork().

It's hidden in daemon(3), sneaky.

> So I was a bit surprised, and spawned a test build, and indeed it fails,
> but for very obscur reasons. In that situation, a lot of functions, even
> very basic ones, like strdup(), do not get prototyped, and a lot of
> multicast-related structs, like struct ip_mreq, do not get defined.

Mmm, spent quite a bit of time myself trying to figure that one out.

> I tried to dig the root cause, but I lost too much hair, so I bailed out
> and comitted your patch as is, just with the fork() reference dropped.

Heh ;)

Yeah, seeing as I'm the maintainer of the upstream project, I suspect
I'll spend some time later trying to figure this one out.  Because it's
a quite useful little daemon to help locate your embedded device.  Some
replacement functions need to be implemented, of course, but nothing too
hairy.

> Applied to master, thanks.

Thank you! :-)


Best regards
 /Joachim
