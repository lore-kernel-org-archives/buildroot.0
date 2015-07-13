From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon, 13 Jul 2015 13:27:03 +0200
Subject: [Buildroot] [git commit] nfs-utils: Bump version
In-Reply-To: <20150713111001.GQ2451@tarshish>
References: <20150713105646.ABAB581942@busybox.osuosl.org>
 <20150713111001.GQ2451@tarshish>
Message-ID: <CAGduivz3S1aR2Uv+gNLJTnH-4D0tvaSVew=vZvmVgsZLqDyDhg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On Mon, Jul 13, 2015 at 1:10 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Thomas,
>
> On Mon, Jul 13, 2015 at 12:54:42PM +0200, Thomas Petazzoni wrote:
>> [Thomas: add patch to fix rpc.statd foreground/daemon mode backported
>> from upstream, and fix the S60nfs init script to not use the -F option
>> of rpc.statd.]
>
> [snip]
>
>> diff --git a/package/nfs-utils/S60nfs b/package/nfs-utils/S60nfs
>> index 91410ee..5e2a2c9 100755
>> --- a/package/nfs-utils/S60nfs
>> +++ b/package/nfs-utils/S60nfs
>> @@ -21,7 +21,6 @@ start() {
>>
>>       echo -n "Starting NFS services: "
>>       /usr/sbin/exportfs -r
>> -     rpc.statd
>
> rpc.statd invocation removed entirely. Is this intended?
Yes because it was called two times and would make the second call
crash with the new version. I don't know why it was called two times
with the previous version of nfs_utils though.
>
>>       echo "done"
>>
>>       echo -n "Starting NFS daemon: "
>
> baruch
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
