From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Tue, 14 Jul 2015 13:11:19 +0200
Subject: [Buildroot] [PATCH 3/4] skeleton: New package
In-Reply-To: <20150714034611.GV2451@tarshish>
References: <1436821211-4446-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1436821211-4446-3-git-send-email-maxime.hadjinlian@gmail.com>
 <20150714034611.GV2451@tarshish>
Message-ID: <CAGduivyCPk3o6+oGxgTtJG5tj-1kogAnjV072N992zEz8s4KJw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On Tue, Jul 14, 2015 at 5:46 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Maxime,
>
> On Mon, Jul 13, 2015 at 11:00:10PM +0200, Maxime Hadjinlian wrote:
>> The generic, autotools and cmake infra are modified to filter skeleton
>> and host-skeleton. Also, in the pkg-generic we add skeleton as a
>> dependency to every package.
>
> [snip]
>
>> diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
>> new file mode 100644
>> index 0000000..be3347e
>> --- /dev/null
>> +++ b/package/skeleton/skeleton.mk
>> @@ -0,0 +1,100 @@
>> +################################################################################
>> +#
>> +# skeleton
>> +#
>> +################################################################################
>
> [snip]
>
>> +$(eval $(generic-package))
>
> There is no host-generic-package here. What would host-skeleton be used for
> anyway?
>
We need to filter host-skeleton because the infra derive the
host-dependencies from the depencies of the packages and preprend
'host-'  to its name
> baruch
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
