From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Mon, 19 Jan 2015 21:09:47 +0100
Subject: [Buildroot] [PATCH 1/6] lua: add 5.3.x serie
In-Reply-To: <20150116222556.7a9c92ab@free-electrons.com>
References: <1421442595-27575-1-git-send-email-francois.perrad@gadz.org>
 <20150116222556.7a9c92ab@free-electrons.com>
Message-ID: <CAB0FRsvckFfnAhBssx81FoSEKwpjxkvcLxUfGS7+ofpU=09RsA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2015-01-16 22:25 GMT+01:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Dear Francois Perrad,
>
> On Fri, 16 Jan 2015 22:09:50 +0100, Francois Perrad wrote:
>
>> +ifeq ($(BR2_PACKAGE_LUA_5_3),y)
>> +LUA_VERSION = 5.3.0
>> +else
>>  ifeq ($(BR2_PACKAGE_LUA_5_2),y)
>>  LUA_VERSION = 5.2.3
>>  else
>>  LUA_VERSION = 5.1.5
>>  endif
>
> Can we get rid of Lua 5.1 ? If not, at what point do you think it will
> be possible ?
>

My feeling is :
- Lua 5.1 will stay
- if everything goes well for Lua 5.3 (ie. modules/extensions
updated), Lua 5.2 could be marked as deprecated in 6 months and
removed in 1 year.

The gap for compatibility between 5.2 and 5.3 is really small.
Lua 5.3 comes with a real improvement for embedded target : a 32 bits
variant for number (see patch 3/6).

Fran?ois

> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
