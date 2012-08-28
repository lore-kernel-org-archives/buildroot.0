From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 28 Aug 2012 19:34:02 +0200
Subject: [Buildroot] [PATCH 05/20] libtirpc: new package
In-Reply-To: <201208121743.03068.yann.morin.1998@free.fr>
References: <cover.1344706801.git.thomas.petazzoni@free-electrons.com>
 <43fd6bbd813c17a10caad354c09b94bd42558170.1344706801.git.thomas.petazzoni@free-electrons.com>
 <201208121743.03068.yann.morin.1998@free.fr>
Message-ID: <503D010A.6030907@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/12/12 17:43, Yann E. MORIN wrote:
>> >  +diff --git a/src/rpc_generic.c b/src/rpc_generic.c
>> >  +index 509fb36..2eb91ad 100644
>> >  +--- a/src/rpc_generic.c
>> >  ++++ b/src/rpc_generic.c
>> >  +@@ -535,7 +535,9 @@ __rpc_nconf2fd_flags(const struct netconfig *nconf, int flags)
>> >  + 	    si.si_af == AF_INET6) {
>                          ^^^^^^^^
>> >  + 		int val = 1;
>> >  +
>> >  ++#ifdef INET6
>> >  + 		setsockopt(fd, SOL_IPV6, IPV6_V6ONLY,&val, sizeof(val));
>> >  ++#endif
> Is it evenpossible to have AF_INET6 defined if INET6 is not?

  Yes it is.

> If so, is it sensible to do the actual test if it would do nothing because
> INET6 is not available?
>
> I would simply return fd in this case (but that makes for a bigger patch).

  Actually, it may make more sense to return -EINVAL (or -1 and set errno, or
whatever the convention is).  But I don't have enough context to verify that.

  Regards,
  Arnout

  BTW, Yann, it would be nice if you'd snip away some of the quoting, to save us
all a bit of scrolling.  Not everybody has automatic collapsing of quoted text...

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
