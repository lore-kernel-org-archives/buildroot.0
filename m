From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 29 Aug 2018 07:10:38 +0300
Subject: [Buildroot] [PATCH] json-c: needs host-autoconf
In-Reply-To: <20180828213742.12bef8e7@windsurf.home>
References: <49134bd0971955402d38a456443d4fb8dba45957.1535468087.git.baruch@tkos.co.il>
 <20180828213557.069e855e@windsurf.home>
 <20180828213742.12bef8e7@windsurf.home>
Message-ID: <87ftyxyfr5.fsf@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thomas Petazzoni writes:
> On Tue, 28 Aug 2018 21:35:57 +0200, Thomas Petazzoni wrote:
>> Wait, wait, why is this needed? This is a standard autotools package,
>> it shouldn't need autoheader at build time.
>> 
>> Isn't it that there is a bogus timestamp or something like that forces
>> some files to be re-generated ?
>> 
>> This problem only appears on Joseph's machine:
>> http://autobuild.buildroot.net/?reason=json-glib%.
>> 
>> It doesn't happen on my autobuilder, even though it doesn't have
>> autoheader installed system-wide.
>
> Sorry, I messed up here: the package being fixed is json-c, not
> json-glib. So the build failure does occur on several autobuilders:
> http://autobuild.buildroot.net/?reason=json-c%.
>
> However, I would still like to see an explanation of why autoheader is
> needed in an autotools package. It should not be needed.

You are right. Updating the config.h.in timestamp is enough to avoid
autoheader. I sent an updated patch.

Thanks for noting.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
