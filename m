From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 15 May 2012 20:13:14 +0200
Subject: [Buildroot] [PATCH v2] ccache: allow dynamic selection of cache
	directory
In-Reply-To: <CAAXf6LVUywLA3pOb40xijPsuWW68aj0WaTXMR-DwD7=5n58jcA@mail.gmail.com>
References: <962414f85797a188de79.1333738037@beantl019720>
 <4FA44012.8040008@mind.be>
 <CAAXf6LVUywLA3pOb40xijPsuWW68aj0WaTXMR-DwD7=5n58jcA@mail.gmail.com>
Message-ID: <CAAXf6LU5RxSJ-vbiag0qn0Z8Z-ugTLfcEir30348OdGVH7G1CQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, May 5, 2012 at 9:17 AM, Thomas De Schampheleire
<patrickdepinguin+buildroot@gmail.com> wrote:
>
> Op 4 mei 2012 22:46 schreef "Arnout Vandecappelle" <arnout@mind.be> het
> volgende:
>
>
>>
>> On 04/06/12 20:47, Thomas De Schampheleire wrote:
>>>
>>> -define HOST_CCACHE_FIX_CCACHE_DIR
>>> - ? ? ? sed -i 's,getenv("CCACHE_DIR"),"$(CCACHE_CACHE_DIR)",'
>>> $(@D)/ccache.c
>>> - ? ? ? sed -i 's,getenv("CCACHE_COMPILERCHECK"),"none",' $(@D)/ccache.c
>>
>>
>>
>> ?On second review, a better implementation would be to replace the first
>> sed by
>>
>> sed -i 's,getenv("CCACHE_DIR"),getenv("BUILDROOT_CACHE_DIR"),'
>> $(@D)/ccache.c
>>
>>
>> ?Then you no longer need the wrapper script at all.
>
> Well, it boils down to the choice between patching the source or using a
> wrapper. I can see benefits for either way.
> Additional input from other developers is welcome here...

Any feedback on this from other developers?

Thanks,
Thomas
