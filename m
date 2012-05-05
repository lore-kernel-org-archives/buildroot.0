From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Sat, 5 May 2012 09:17:38 +0200
Subject: [Buildroot] [PATCH v2] ccache: allow dynamic selection of cache
	directory
In-Reply-To: <4FA44012.8040008@mind.be>
References: <962414f85797a188de79.1333738037@beantl019720>
 <4FA44012.8040008@mind.be>
Message-ID: <CAAXf6LVUywLA3pOb40xijPsuWW68aj0WaTXMR-DwD7=5n58jcA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Op 4 mei 2012 22:46 schreef "Arnout Vandecappelle" <arnout@mind.be> het
volgende:
>
> On 04/06/12 20:47, Thomas De Schampheleire wrote:
>>
>> -define HOST_CCACHE_FIX_CCACHE_DIR
>> -       sed -i 's,getenv("CCACHE_DIR"),"$(CCACHE_CACHE_DIR)",'
$(@D)/ccache.c
>> -       sed -i 's,getenv("CCACHE_COMPILERCHECK"),"none",' $(@D)/ccache.c
>
>
>
>  On second review, a better implementation would be to replace the first
> sed by
>
> sed -i 's,getenv("CCACHE_DIR"),getenv("BUILDROOT_CACHE_DIR"),'
$(@D)/ccache.c
>
>
>  Then you no longer need the wrapper script at all.

Well, it boils down to the choice between patching the source or using a
wrapper. I can see benefits for either way.
Additional input from other developers is welcome here...

Best regards,
Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120505/57505982/attachment.html>
