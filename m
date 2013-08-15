From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Thu, 15 Aug 2013 23:51:19 +0200
Subject: [Buildroot] [PATCH] lua: remove shared library feature
In-Reply-To: <20130815190702.3df811a5@skate>
References: <1352033124-2514-1-git-send-email-arnout@mind.be>
 <20130814003652.39c4d945@skate>
 <CAB0FRss5gTuePkganj6UfXg0ssqQADc_rAya90znq-=6zVfDwg@mail.gmail.com>
 <20130815190702.3df811a5@skate>
Message-ID: <CAB0FRstPnTTJcvsPRg4=xgMs8qvMCXafg4wvng8pTFc3VCbD-w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/8/15 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Dear Fran?ois Perrad,
>
> On Thu, 15 Aug 2013 18:56:48 +0200, Fran?ois Perrad wrote:
>> 2013/8/14 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
>> > Fran?ois, Gustavo,
>> >
>> > Can you look at the below patch and tell me what you think?
>> >
>>
>> Seems obsolete (BR2_PACKAGE_LUA_SHARED_LIBRARY was removed).
>
> The option was removed because we now always build a shared library.
> But the idea of the patch we're discussing was to remove the
> possibility of building a shared library for Lua since this isn't
> supported upstream, and we try to avoid having "feature" patches in
> Buildroot.
>
> For the moment, we still have
> package/lua/lua-02-shared-libs-for-lua.patch and
> package/lua/lua-03-shared-libs-for-luac.patch to support building a
> shared library for Lua.
>

Initially, these two patches were merged, and I did the split (see
http://git.buildroot.net/buildroot/commit/package/lua?h=next&id=2c7e9c50e9bef1c494ef90411a466ad320846b96).

I did this because in my point of view :
- lua-03-shared-libs-for-luac.patch is too invasive and not really
useful because the static version of luac is enough.
- lua-02-shared-libs-for-lua.patch is mandatory for using native
extensions, like LuaFileSystem, LuaSocket, ...

Francois

Note : lua-03-shared-libs-for-luac.patch could be removed without any
other change.

> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
