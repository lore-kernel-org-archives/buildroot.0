From: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
Date: Thu, 22 Oct 2015 23:37:00 +0900
Subject: [Buildroot] [PATCH v1 1/1] gauche: new package
In-Reply-To: <5628F1FB.90905@mind.be>
References: <201510211335.t9LDZxji001496@ms-omx03.plus.so-net.ne.jp>
 <5628DE0A.1040000@imgtec.com> <5628F1FB.90905@mind.be>
Message-ID: <B265B0EE-1F06-4B25-9994-010E6E8C583D@ca2.so-net.ne.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you for your comment, Vincente, Arnott.

Yes, that?s for uclibc.

Anyway, I will post improved/fixed patch later day.

> 2015/10/22 23:26?Arnout Vandecappelle <arnout@mind.be> ?????
> 
> On 22-10-15 15:00, Vicente Olivert Riera wrote:
>> Dear Hiroshi Kawashima,
>> 
>> thanks for your contribution. Comments inlined; please keep reading.
>> 
>> On 10/21/2015 02:35 PM, Hiroshi Kawashima wrote:
> [snip]
>>> diff --git a/package/gauche/0001-fix-so-suffix.patch b/package/gauche/0001-fix-so-suffix.patch
>>> new file mode 100644
>>> index 0000000..18d0bd5
>>> --- /dev/null
>>> +++ b/package/gauche/0001-fix-so-suffix.patch
>>> @@ -0,0 +1,12 @@
>> 
>> The patch should contain a brief description about what it does or why
>> is needed, and also contain your SoB.
>> 
>>> +diff -ur a/configure b/configure
>>> +--- a/configure	2014-07-20 15:15:05.000000000 +0900
>>> ++++ b/configure	2015-10-20 21:52:32.791442291 +0900
>>> +@@ -6843,7 +6843,7 @@
>>> +     SHLIB_MAIN_LDFLAGS=""
>>> +     SHLIB_OK=ok
>>> +     ;;
>>> +-  *-linux-gnu*|*-*-gnu*|*freebsd*|*dragonfly*)
>>> ++  *-linux-*|*-*-gnu*|*freebsd*|*dragonfly*)
>>> +     SHLIB_SO_CFLAGS="-fPIC"
>>> +     SHLIB_SO_LDFLAGS="$rpath -shared -o"
>>> +     SHLIB_SO_SUFFIX="so"
>> 
>> I have built gauche with this patch, and without it, and I don't see any
>> difference. Are you sure this is necessary? If so, why?
> 
> I guess it's needed for uclibc/musl, they don't have the -gnu part.
> 
> 
> Regards,
> Arnout
> 
> [snip]
> 
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
