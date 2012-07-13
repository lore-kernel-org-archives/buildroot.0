From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Fri, 13 Jul 2012 10:36:53 +0200
Subject: [Buildroot] [PATCH 2/2] luajit: fix dependencies of Lua modules
In-Reply-To: <CAB0FRsuwMKK5LFnhLLY4SVrW5BGyMw4FLwG=17JJ7ExYOF5tkQ@mail.gmail.com>
References: <CAB0FRssu7PT0PFZm32zwsiMRi3ZtFH0V5Pt=BQykiqwrhUQWzw@mail.gmail.com>
 <20120601182029.5496758d@skate>
 <CAB0FRsuwMKK5LFnhLLY4SVrW5BGyMw4FLwG=17JJ7ExYOF5tkQ@mail.gmail.com>
Message-ID: <CAB0FRsuowMWqTeNU-UKCwWthf2nAYQWBsxW_W3vwu-5Nojk31w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/6/1 Fran?ois Perrad <francois.perrad@gadz.org>:
> 2012/6/1 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
>> Le Fri, 1 Jun 2012 11:58:27 +0200,
>> Fran?ois Perrad <francois.perrad@gadz.org> a ?crit :
>>
>>> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>>
>> I am not a Lua guy, so maybe I'm missing something obvious, but you
>> could expand the justification for this patch, and include this
>> justification in the commit log?
>>
>
> luajit is another Lua 5.1 interpreter, API- and ABI-compatible to the
> standard one (lua package).
> A Lua module (luasocket for example) depends on lua OR luajit (only
> one is deployed on the target).
> The dependency against BR2_PACKAGE_LUA_SHARED_LIBRARY must be removed,
> because it's an internal of lua package.
>
>

As side effect, this patch solves the building issue of lua in
autobuild.builroot.net.

Fran?ois

> Fran?ois
>
>> Thanks!
>>
>> Thomas
>> --
>> Thomas Petazzoni, Free Electrons
>> Kernel, drivers, real-time and embedded Linux
>> development, consulting, training and support.
>> http://free-electrons.com
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
