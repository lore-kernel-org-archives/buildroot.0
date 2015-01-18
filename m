From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sun, 18 Jan 2015 20:57:31 +0100
Subject: [Buildroot] [PATCH 01/11 v4] package/python-lxml: new package
In-Reply-To: <20150118192634.GD16593@free.fr>
References: <cover.1421582718.git.yann.morin.1998@free.fr>
 <24d0ff88170493e141dd07c29c3bcf262a67692f.1421582718.git.yann.morin.1998@free.fr>
 <CAGm1_ksf4gvkx5A4PjxDax=ZQvewETuQL=O5=BmZ8h=UrNrKYg@mail.gmail.com>
 <20150118180310.GC16593@free.fr>
 <CAGm1_ksWvJcap__h4Xte0osgJo7TKotYxbWthj3=mmynKyVpOw@mail.gmail.com>
 <20150118192634.GD16593@free.fr>
Message-ID: <CAGm1_ks9ENNvk6afHy644TsUk8Z0bABwZknjF0qHS8U9wGzFDw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jan 18, 2015 at 8:26 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Yegor, All,
>
> On 2015-01-18 20:14 +0100, Yegor Yefremov spake thusly:
>> On Sun, Jan 18, 2015 at 7:03 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>> > Yegor, All,
>> >
>> > On 2015-01-18 18:27 +0100, Yegor Yefremov spake thusly:
>> >> On Sun, Jan 18, 2015 at 1:11 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>> >> > The lxml XML toolkit is a Pythonic binding for the C libraries libxml2
>> >> > and libxslt.
>> >> Trying to build lxml as normal package and get following error:
>> >
>> > You mean, as a target package?
>> >
>> > It can not work as-is, because I only declared the host variant.
>> > You'd have to add the target variant if you want the target package.
>>
>> I've created needed files like Config.in etc.
>
> OK, I guessed you did, but was trying the obvious... ;-)
>
> [--SNIP--]
>> >> compilation terminated.
>> >
>> > Well, I just tried, and it builds fine, even when I remove the libxml2
>> > development files from my host:
> [--SNIP--]
>> >
>> > I don't know what would break for the target package. Maybe it includes
>> > unsafe paths (-I and/or -L) ?
>>
>> Have you also installed libxslt-dev on your PC?
>
> No, I do not have libxslt development files installed on the host.
>
>> After I've done this,
>> I could cross-compile lxml, but it is not very "legal" approach :-)
>
> Smells like unclean include paths to me. I'll investigate further on the
> target-side package
>
> Adding the target variant can come in a later patch, no? And that should
> not impact the host variant from being comitted as-is, would it?

No, that should not impact your patch. I'll send mine as RFC on top of
yours. Thanks for your help.

Yegor
