From: FrAnKenStEiN MC <chfakht@gmail.com>
Date: Sat, 30 Jan 2016 21:42:28 +0000
Subject: [Buildroot] Error while Generating root filesystem image
	rootfs.ext2
In-Reply-To: <alpine.DEB.2.11.1601302011320.27555@tanhuma.tkos.co.il>
References: <CABi8WTz9OL9BKNMCcd87k74q2QGh4XmetxjPu+pZCjo5nF03hw@mail.gmail.com>
 <alpine.DEB.2.11.1601302011320.27555@tanhuma.tkos.co.il>
Message-ID: <CABi8WTwGkpz3s3q=W5EGrYTPLunhSTDj8XcB_VXKMYLBE+x4Tw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yes you're right :
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:
/usr/local/games
but why ? How can i remove the extra spaces ?

2016-01-30 18:18 GMT+00:00 Jonathan Ben Avraham <yba@tkos.co.il>:

> Dearest FrAnKenStEiN MC,
> It appears that your PATH environment variable might be misconfigured.
> More specifically, it appears that there are extra spaces between the last
> two elements of PATH, "/usr/games:   /usr/local/games":
>
> PATH="/media/larbi/eDisque/pfa/buildRoot/buildroot/output/host/bin:/media/larbi/eDisque/pfa/buildRoot/buildroot/output/host/sbin:/media/larbi/eDisque/pfa/buildRoot/buildroot/output/host/usr/bin:/media/larbi/eDisque/pfa/buildRoot/buildroot/output/host/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:
> /usr/local/games"
>
> Do
>
> echo $PATH
>
> from the command line to check if this is the case. If so, then the
> problem is in your /etc/profile or ~/.bashrc. YOu need to remove the extra
> spaces.
>
> Good luck,
>
>  - yba
>
>
> On Sat, 30 Jan 2016, FrAnKenStEiN MC wrote:
>
> Date: Sat, 30 Jan 2016 16:50:35 +0000
>> From: FrAnKenStEiN MC <chfakht@gmail.com>
>> To: buildroot at buildroot.org
>> Subject: [Buildroot] Error while Generating root filesystem image
>> rootfs.ext2
>>
>>
>> Hi , i'm getting some errors when trying to run make
>>
>> rm -f
>> /media/larbi/eDisque/pfa/buildRoot/buildroot/output/build/_fakeroot.fs
>> rm -f
>> /media/larbi/eDisque/pfa/buildRoot/buildroot/output/target/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM
>> rm -f
>> /media/larbi/eDisque/pfa/buildRoot/buildroot/output/build/_users_table.txt
>> echo "set -e" >>
>> /media/larbi/eDisque/pfa/buildRoot/buildroot/output/build/_fakeroot.fs
>> echo "chown -h -R 0:0
>> /media/larbi/eDisque/pfa/buildRoot/buildroot/output/target" >>
>> /media/larbi/eDisque/pfa/buildRoot/buildroot/output/build/_fakeroot.fs
>> cat system/device_table.txt >
>> /media/larbi/eDisque/pfa/buildRoot/buildroot/output/build/_device_table.txt
>> printf '        /bin/busybox                     f 4755 0  0 - - - - -\n
>> /dev/console c 622 0 0 5 1 - - -\n' >>
>> /media/larbi/eDisque/pfa/buildRoot/buildroot/output/build/_device_table.txt
>> echo
>> "/media/larbi/eDisque/pfa/buildRoot/buildroot/output/host/usr/bin/makedevs
>> -d
>> /media/larbi/eDisque/pfa/buildRoot/buildroot/output/build/_device_table.txt
>> /media/larbi/eDisque/pfa/buildRoot/buildroot/output/target" >>
>> /media/larbi/eDisque/pfa/buildRoot/buildroot/output/build/_fakeroot.fs
>> printf '' >>
>> /media/larbi/eDisque/pfa/buildRoot/buildroot/output/build/_users_table.txt
>>
>> PATH="/media/larbi/eDisque/pfa/buildRoot/buildroot/output/host/bin:/media/larbi/eDisque/pfa/buildRoot/buildroot/output/host/sbin:/media/larbi/eDisque/pfa/buildRoot/buildroot/output/host/
>> usr/bin:/media/larbi/eDisque/pfa/buildRoot/buildroot/output/host/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:
>> /usr/local/games"
>> /media/larbi/eDisque/pfa/buildRoot/buildroot/support/scripts/mkusers
>> /media/larbi/eDisque/pfa/buildRoot/buildroot/output/build/_users_table.txt
>> /media/larbi/eDisque/pfa/buildRoot/buildroot/output/target >>
>> /media/larbi/eDisque/pfa/buildRoot/buildroot/output/build/_fakeroot.fs
>> echo
>> " PATH="/media/larbi/eDisque/pfa/buildRoot/buildroot/output/host/bin:/media/larbi/eDisque/pfa/buildRoot/buildroot/output/host/sbin:/media/larbi/eDisque/pfa/buildRoot/buildroot/output/host/
>> usr/bin:/media/larbi/eDisque/pfa/buildRoot/buildroot/output/host/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:
>> /usr/local/games" mke2img -d
>> /media/larbi/eDisque/pfa/buildRoot/buildroot/output/target -G 4 -R 1 -o
>> /media/larbi/eDisque/pfa/buildRoot/buildroot/output/images/rootfs.ext2" >>
>> /media/larbi/eDisque/pfa/buildRoot/buildroot/output/build/_fakeroot.fs
>> chmod a+x
>> /media/larbi/eDisque/pfa/buildRoot/buildroot/output/build/_fakeroot.fs
>>
>> PATH="/media/larbi/eDisque/pfa/buildRoot/buildroot/output/host/bin:/media/larbi/eDisque/pfa/buildRoot/buildroot/output/host/sbin:/media/larbi/eDisque/pfa/buildRoot/buildroot/output/host/
>> usr/bin:/media/larbi/eDisque/pfa/buildRoot/buildroot/output/host/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:
>> /usr/local/games"
>> /media/larbi/eDisque/pfa/buildRoot/buildroot/output/host/usr/bin/fakeroot
>> -- /media/larbi/eDisque/pfa/buildRoot/buildroot/output/build/_fakeroot.fs
>> rootdir=/media/larbi/eDisque/pfa/buildRoot/buildroot/output/target
>>
>> table='/media/larbi/eDisque/pfa/buildRoot/buildroot/output/build/_device_table.txt'
>> /media/larbi/eDisque/pfa/buildRoot/buildroot/output/build/_fakeroot.fs:
>> line 4: /usr/local/games: Is a directory
>> make[1]: ***
>> [/media/larbi/eDisque/pfa/buildRoot/buildroot/output/images/rootfs.ext2]
>> Error 126
>> make: *** [_all] Error 2
>>
>> can someone help !!! thanks a lot
>>
>>
>>
> --
>  9590 8E58 D30D 1660 C349  673D B205 4FC4 B8F5 B7F9  ~. .~  Tk Open Systems
> =}-------- Jonathan Ben-Avraham ("yba") ----------ooO--U--Ooo------------{=
> mailto:yba at tkos.co.il tel:+972.52.486.3386 http://tkos.co.il
> skype:benavrhm
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160130/4cf9b32b/attachment.html>
