From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Thu, 19 Mar 2015 21:30:03 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-03-18
In-Reply-To: <20150319132309.285f72de@free-electrons.com>
References: <20150319073018.35B45100D3A@stock.ovh.net>
 <550AA255.3060206@imgtec.com> <20150319103012.GC2415@tarshish>
 <550AB83E.5050400@imgtec.com>
 <20150319132309.285f72de@free-electrons.com>
Message-ID: <CAB0FRsv01yxJP+_Lt=k67RDHN1hGU6Qx_d3kvuw0HmQ2YT0YYA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2015-03-19 13:23 GMT+01:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Dear Vicente Olivert Riera,
>
> On Thu, 19 Mar 2015 12:51:26 +0100, Vicente Olivert Riera wrote:
>
>> Yes, I agree with that. Perhaps you could ask lua-periphery upstream and
>> tell them to not do that :P
>
> Well, you can create a c-periphery package, which lua-periphery depends
> on, and then pass the appropriate C_PERIPHERY / C_PERIPHERY_LIB values
> when building lua-periphery.
>
> Maybe Fran?ois could have a look into this?
>

I have a similar scheme with
http://git.buildroot.net/buildroot/tree/package/lua-csnappy :
- a C lib : https://github.com/zeevt/csnappy
- a Lua/C wrapper which refers it as a git submodule :
https://github.com/fperrad/lua-csnappy
But I produce a src.rock which contains all sources (including the C
lib and not an external reference) :
https://rocks.moonscript.org/manifests/fperrad/lua-csnappy-0.1.2-1.src.rock

Currently, the Luarocks ecosystem lacks of policies (and the tool
which enforces them) about the content of a src.rock.
But in my point of view, a src.rock must contain all source (linking
with installed libraries is fine too).

Second point, lua-periphery works only with an inner subdirectory
c-periphery, but can not handle a c-periphery lib in $(STAGING_DIR)
produced by a BR package c-periphery.

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
