From: Adam Baxter <voltagex@voltagex.org>
Date: Sat, 25 Jul 2015 10:51:57 -0700
Subject: [Buildroot] Unable to login as root to new buildroot system
In-Reply-To: <mouppb$le6$1@ger.gmane.org>
References: <CAChFQ9R=5anPgo9mboKxCkppsadQkSzC_WhpevWoarwgKVhLQg@mail.gmail.com>
 <mouppb$le6$1@ger.gmane.org>
Message-ID: <CAChFQ9QFbgRrd+cZfHor2yBht82Z6SrZirvoMF8OC4tcnQLztg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24 Jul 2015 6:46 pm, "Stanislav Vlasic" <svlasic@gmail.com> wrote:
>
> Hi,
>
>
> On 07/25/2015 02:25 AM, Adam Baxter wrote:
>>
>> I'm using the latest Git version of buildroot and the following config -
>> https://github.com/voltagex/serial-vm-buildroot
>>
>> It builds and boots with qemu just fine, but no matter what combination
>> of getty/no getty/shell/root password I use, I can't login. Even with a
>> blank root password I'm told that the password is incorrect, and I can't
>> work out how to make it boot straight to a root prompt.
>>
>> Can anyone help? The repo above should be able to be built with make
>> serial_defconfig, but if there's still hardcoded paths to a 'voltagex'
>> or 'ubuntu' user you'll have to let me know how to remove them.
>>
>> I've read
>> http://lists.busybox.net/pipermail/buildroot/2012-July/056177.html and
>> similar threads found by googling "buildroot root login"
>>
>> Regards,
>> Adam Baxter
>>
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
>
> Try edit system/skeleton/etc/passwd file (or overlay one if you're using
overlays) and replace 1st line:
>
> root:x:0:0:root:/root:/bin/sh
>
> with:
>
> root::0:0:root:/root:/bin/sh
>
> Never had that problem on Buildroot, but did on Ubuntu Core rootfs and
this method fixed it.
>

That worked, but I do wonder what the underlying problem is.

Thanks again,
Adam
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150725/010023e2/attachment.html>
