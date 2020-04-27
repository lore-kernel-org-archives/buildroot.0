From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Mon, 27 Apr 2020 22:38:33 +0200
Subject: [Buildroot] [PATCH] package/cegui: disable ogre support
In-Reply-To: <20200427221945.5528d702@windsurf.home>
References: <20200427200909.6753-1-b.bilas@grinn-global.com>
 <20200427221945.5528d702@windsurf.home>
Message-ID: <37c0f608-c22e-37e5-8a82-b6c0d21e88bb@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On 27.04.2020 22:19, Thomas Petazzoni wrote:
> On Mon, 27 Apr 2020 22:09:09 +0200
> Bartosz Bilas <b.bilas@grinn-global.com> wrote:
>
>> Buildroot's ogre version isn't compatible with current (v0-8-7) cegui
>> therefore disable support for that. It will be restored when upstream will
>> switch to the new version.
>>
>> Fixes:
>>    - http://autobuild.buildroot.net/results/8ee717ac4d596fc0af274037841ac4ed6862ddaa/
>>
>> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
>> ---
>>   package/cegui/cegui.mk | 10 ++--------
>>   1 file changed, 2 insertions(+), 8 deletions(-)
> Applied, thanks.
>
> To be honest, I think it was a mistake to support all those optional
> features without testing them. Xerces, then minizip, now ogre. I would
> have very much preferred to disable all these features unconditionally,
> and then people who need them can add the necessary conditions.
Some of them are fixed on the master branch, some of them came up due to 
conflict with package version ( such as buildroot's minizip which is 
actually a fork of original zlib). I've checked some of them but that's 
tricky to verify every possibility as it's being done by autobuilders 
but I try to fix that as fast as possible ;) We can disable all of them 
or check autobuilders results and fix it. I've asked the maintainers 
about new release which will fix some of the issues so I hope it will be 
done soon.
>
> BTW, are you using cegui in some projects ?
I'm not but I was. Now I'm trying to keep this package to be built fine 
under buildroot.
>
> Thomas
