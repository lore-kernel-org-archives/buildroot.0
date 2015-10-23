From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Fri, 23 Oct 2015 14:06:10 +0200
Subject: [Buildroot] [PATCH 1/2] Makefile: use root-relative -f path for
	/sbin/ldconfig
In-Reply-To: <20151023102645.0b8f3729@free-electrons.com>
References: <1445502151-25735-1-git-send-email-bjorn.forsman@gmail.com>
 <562952C7.30708@mind.be>
 <CAEYzJUEvAp4sfaykkY8dKi8_9G1YGLZ-3U=dgHj9HR3EHsUKXQ@mail.gmail.com>
 <20151023102645.0b8f3729@free-electrons.com>
Message-ID: <CAEYzJUFo9DrnHHJjfCXaDr+8fS1v+98Ti3fHD1oEkkrJPLQudg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 23 October 2015 at 10:26, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Bj?rn Forsman,
>
> On Fri, 23 Oct 2015 09:12:02 +0200, Bj?rn Forsman wrote:
>
>> If you want to completely remove use of (host) /sbin/ldconfig, that's fine too.
>>
>> Just tell me what to do :-)
>
> We need to completely remove the ldconfig stuff, since it simply cannot
> work. However, there is at least one package (mysql) that installs
> libraries in a non-standard location (/usr/lib/mysql) and relies on
> ld.so.conf for the dynamic linker to find them. I believe we need to
> fix MySQL so that it installs its libraries in /usr/lib, and then get
> rid of all the ldconfig/ld.so.conf stuff.
>
> Or, alternatively, see how to get it working with an init script which
> runs ldconfig at boot time. But then you have to look at how uClibc and
> musl handle this, and implement a solution that works for all three C
> libraries.

Sounds like a bigger task than I planned... :-/  (I'm afraid to break things.)

Would it be possible to merge "[PATCH 2/2] Makefile: add -C flag for
/sbin/ldconfig" as a stop-gap fix for my build problem then?

- Bj?rn
