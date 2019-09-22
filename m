From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 22 Sep 2019 15:05:32 +0200
Subject: [Buildroot] [PATCH v6 09/25] package/kodi: bump to version
 18.4-Leia
In-Reply-To: <840k5gx5v3.ln2@ID-313208.user.individual.net>
References: <20190921192826.10143-1-bernd.kuhls@t-online.de>
 <20190921192826.10143-10-bernd.kuhls@t-online.de>
 <c40f0485-9441-c34f-ea65-c7f256f3f8ef@mind.be>
 <840k5gx5v3.ln2@ID-313208.user.individual.net>
Message-ID: <dfcba59d-8c55-008e-d69a-07345a97c1a6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 22/09/2019 12:48, Bernd Kuhls wrote:
> Hi Arnout,
> 
> Am 21.09.19 um 23:03 schrieb Arnout Vandecappelle:> 
>>
>> On 21/09/2019 21:28, Bernd Kuhls wrote:
[snip]
>>  Kodi and texturepacker are bumped in a single patch, but all the rest 
>> is bumped
>> separately. What is the reasoning behind that? I mean, do the old 
>> plugins still
>> work with the new kodi?
> No, addons depend on the kodi version. I split the patches for easier 
> review but they need to be committed together.

 That's what I thought indeed, so my question is: why not split texturepacker as
well? I'm not saying you have to split it off, I just wonder if there was any
reason to do it like this.

 Oooh, now I see, kodi-texturepacker is in fact kodi itself, just the host part
of it...

> 
>>> --- /dev/null
>>> +++ b/package/kodi-texturepacker/0002-fix-texture-packer-cmake-source-
> dir.patch
>>> @@ -0,0 +1,14 @@
>>> +Downloaded from
>>> +https://github.com/LibreELEC/LibreELEC.tv/blob/master/packages/
>>> mediacenter/kodi/patches/kodi-100.25-hack-fix-texture-packer-cmake-source-
>>> dir.patch
>>
>>  A slightly better commit message would help. Like, why is this needed?
> 
> My knowledge about the cmake internals is limited, sorry, therefore I am 
> unable to describe my the patch is needed, the upstream PR also does not 
> give any information: https://github.com/LibreELEC/LibreELEC.tv/pull/1186

 Well, at least you could say what happens without the patch... But I think I
get it: this is needed because we're building a part of kodi separately instead
of as part of the full build. I would be more than happy with something to that
effect :-)

 Regards,
 Arnout

[snip]
