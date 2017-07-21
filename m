From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri, 21 Jul 2017 08:50:07 +0200
Subject: [Buildroot] Using linux-zigbee ?
In-Reply-To: <20170721035311.lj4g7b4fugewmr55@tarshish>
References: <20170720225710.076f8086@windsurf>
 <20170721035311.lj4g7b4fugewmr55@tarshish>
Message-ID: <CAGduivzefXp69019cM38B=1uOYcKOU+GDh36UcbG7YDZrAPvVA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Fri, Jul 21, 2017 at 5:53 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Thomas,
>
> On Thu, Jul 20, 2017 at 10:57:10PM +0200, Thomas Petazzoni wrote:
>> Back in 2014, you added the linux-zigbee package in Buildroot. However,
>> this project is no longer maintained, and the replacement project is
>> wpan-tools, for which we already have a Buildroot package.
>>
>> linux-zigbee has seen no updates since 2014
>> (https://sourceforge.net/p/linux-zigbee/linux-zigbee/ci/38f42dbfce9e13629263db3bd3b81f14c69bb733/log/?path=).
>> The fork at https://github.com/linux-wpan/lowpan-tools, which only
>> contains two additional commits, also from 2014, clearly mentions that
>> this is deprecated.
>>
>> In addition, linux-zigbee now fails to build with gcc 7.x:
>> http://autobuild.buildroot.net/results/29c/29c72bc38042305310576be945c721b2fad95894/build-end.log.
>
> The fix[1] for that (remove -Werror) is quite easy, you don't even need to
> patch the code.
>
>> Do you still use linux-zigbee ? Or could we remove it from Buildroot in
>> favor of wpan-tools ?
>
> Buildroot carries packages that are deprecated/abandoned for much longer than
> that (e.g. wireless_tools). The command line interface difference between
> linux-zigbee and wpan-tools is a good enough reason to keep linux-zigbee, IMO.
Agreed, but shouldn't we set some kind of policy where we can remove
such kind of package which are not maintained upstream ? It's not the
role of buildroot to maintain such package, we are not Debian.
And if you really need a package in your build that is not maintained
anymore, it's not hard to keep it around in an overlay.
>
>> Are there other people using linux-zigbee and not wpan-tools ?
I am still using it for current versions, but they are using older
buildroot versions and won't be updated.
The plan is to move to wpan-tools anyway. So for my account, you can
remove it, I don't need it in the tree any longer.
>
> I use neither.
>
> [1] http://patchwork.ozlabs.org/patch/791782/
>
> baruch
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
