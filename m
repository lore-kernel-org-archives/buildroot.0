From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 18 Jan 2017 22:31:51 +0100
Subject: [Buildroot] [PATCH] package/libcap: fix build with gperf >= 3.1
In-Reply-To: <20170118160150.t7e4xs7u3bscpjqd@collins.gmr.ssr.upm.es>
References: <20170117221723.10235-1-romain.naour@gmail.com>
 <20170118112249.uyk3bhcdzlt6ggcu@collins.gmr.ssr.upm.es>
 <20170118160150.t7e4xs7u3bscpjqd@collins.gmr.ssr.upm.es>
Message-ID: <31db6b87-7aba-9335-0be9-5b99a9c4c6a1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alvaro,

Le 18/01/2017 ? 17:01, Alvaro G. M. a ?crit :
> On Wed, Jan 18, 2017 at 12:22:49PM +0100, Alvaro G. M. wrote:
>> On Tue, Jan 17, 2017 at 11:17:23PM +0100, Romain Naour wrote:
>>> I haven't checked how many packages are affected by this breakage...
>>
>> rgrep host-gperf packages/ helps getting this useful list:
>> systemd webkitgtk libsvgtiny libcap x11r7/xcb-util eudev qt5 kodi
> 
> I grepped badly, the real list is, after removing false positive xcb-util:
> 
>  systemd webkitgtk libsvgtiny libcap eudev qt5webkit kodi
> 
> Tested and needs patch: libcap, libsvgtiny, eudev, systemd
> To be tested: webkitgtk, qt5webkit, kodi
> 
> * systemd requires a patch, too, changing basically the same thing as those
>   before. This is longer because it uses gperf several times, but I've got
>   it ready if needed. I think I'll be sending only a patch or patch series
>   with all needed changes.
> 
> I don't know how to test the remaining bits: webkitgtk, qt5webkit, kodi
> 
> They all require libgtk3, but I can't select it:
> *** libgtk3 needs an OpenGL or an OpenGL-EGL/wayland backend ***
> 
> What other things do I need to enable libgtk3?

Thanks for your investigation!

libgtk3 needs an OpenGL provider, you can use Mesa3d as OpenGL provider on x86
with a Gallium driver.

But since we need to fix several package like eudev and systemd, I would suggest
to report this issue to gperf maintainer and see what he say.

Best regards,
Romain

> 
> Thanks!
> 
> 
