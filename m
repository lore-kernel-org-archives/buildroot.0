From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 2 Jan 2016 01:21:53 +0100
Subject: [Buildroot] [PATCH 14/84 RFC] package/jquery: include external
 plugins from jquery's Config.in
In-Reply-To: <20151231171714.GB3495@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
 <805bddfa16ccc143f1c0a871d7304af0f2b155c7.1451076704.git.yann.morin.1998@free.fr>
 <56846C8F.50308@mind.be> <20151231171714.GB3495@free.fr>
Message-ID: <56871821.7040204@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 31-12-15 18:17, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2015-12-31 00:45 +0100, Arnout Vandecappelle spake thusly:
>> On 25-12-15 22:24, Yann E. MORIN wrote:
>>> ... and make it a menuconfig instead of a 'config'+'menu'.
>>
>>  I don't agree with this change, because these are really separate packages, not
>> suboptions of the jquery package. Similar for python, where it is even more
>> obvious because as indicated by the symlink hack for python3.
> 
> That they are separate packages is irrelevant, to the _user_.
> 
> It makes sense for us, packagers and BR developpers, but it should not
> have an impact on the user experience.
> 
> What is relevant to the user, is that they are jquery stuff, and they
> don't even make sense without jquery. Whether they are "built-in" or
> "external" modules should not be of his concerns.
> 
> And, as you argue, if they should be treated like "nornmal" packages,
> why do we have them in a submenu?

 I've taken another look at the two versions, and basically what I had objection
with is the submenu itself (the existing one). However, removing the menu would
be even worse (overcrowding the menu above it.

 So I'll go back through the NACK'ed patch and re-review them.

 Regards,
 Arnout

> 
> Note also that what I propose here is what we already do for a few other
> packages:
>   - Kodi
>   - freescale-imx
>   - matchbox
>   - nvidia-tegra23
>   - to a lesser extent, Qt5
> 
> Please have a look *as a user* to the menuconfig before and after this
> series, and tell me you really prefer the previous layout. Yes, this new
> one means we need to source packages "modules" (perl, php, python...)
> from the package's own Config.in rather than from the /main/ Config.in,
> but I do believe it is better in three ways:
> 
>   - those "modules" are only meaningful in combination with the
>     corresponding package [0],
> 
>   - it removes the (relative) compjquerylexity of the dependency knowledge out
>     of the main package/Config.in [1] and move it to the best location
>     where it can be handled, i.e. the package itself,
> 
>   - the resulting menuconfig (UI) layout is more appealing to an end
>     user (IMHO).
> 
> [0] this implies the python/python3 symlink trick, yes.
> [1] I would also like to get rid of the if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>     from package/Config.in and move it to the packages themselves. Not
>     that we are not even consistent with that one either, like for
>     systemd or tovid.
> 
> So I will maintain this patch in the series, if at least to get more
> feedback from others.
> 
> Thanks for your opinion! ;-)
> 
> (This reply is valid for all you other NAKs about this topic. ;-) )
> 
> Regards,
> Yann E. MORIN.
> 
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
