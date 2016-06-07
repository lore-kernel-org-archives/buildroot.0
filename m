From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jun 2016 14:26:56 +0200
Subject: [Buildroot] [PATCH] package/middleclass: new package
In-Reply-To: <6ae25da6-14b9-4c4c-deb2-f840e46bc125@grinn-global.com>
References: <20160606130409.19533-1-m.niestroj@grinn-global.com>
 <20160607132500.6a82f641@free-electrons.com>
 <6ae25da6-14b9-4c4c-deb2-f840e46bc125@grinn-global.com>
Message-ID: <20160607142656.21d23d98@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 7 Jun 2016 13:57:20 +0200, Marcin Niestroj wrote:

> > if BR2_PACKAGE_HAS_LUAINTERPRETER && !BR2_STATIC_LIBS  
> 
> Thanks for pointing it. I used some other package as reference, so I 
> missed that.

Other packages might be wrong, do not hesitate to send patches to fix
them if you find such issues.

> > Could you use the luarocks package infrastructure instead? The
> > middleclass package is available in luarocks, and it greatly simplifies
> > the Lua packages. See the luaexpat package for an example. The
> > Buildroot manual also has extensive documentation about the luarocks
> > package infrastructure.  
> 
> I tried to use luarocks for that package. However I encountered two
> issues with that approach:

OK. Fran?ois Perrad, who wrote the luarocks package infrastructure, is
in Cc of the discussion. Hopefully he can participate to the discussion
and give some feedback.

> 1) middleclass is not consistent with it's version. In most places it
> is 4.0.0. However in rockspec [1] it defines it's version as 4.0-0. I
> guess it should be 4.0.0-0 instead. This inconsistency needs some
> tweaks in Buildroot package makefile.

Hm, I'm not sure here, Fran?ois can comment I guess.

> 
> 2) When middleclass is installed with luarocks on my host, it downloads
> *.rockspec directly instead of *.src.rock. I think that Buildroot is
> not supporting that case, but please correct me if I am wrong. It was 
> not straightforward to make it work for me.

Hum, Buildroot does download the .src.rock, since the luarocks package
infrastructure defines:

$(2)_SOURCE             ?= $(1)-$$($(3)_VERSION).src.rock

> Above issues made me unable to add support for middleclass using
> luarocks in a reasonable time. It was much simpler with current
> approach.

Right, but not the most appropriate approach. If the package is on
luarocks.org, it should work with our infrastructure. Let's see what
Fran?ois can say about this.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
