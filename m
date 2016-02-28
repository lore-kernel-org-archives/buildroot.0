From: Lucas Zampar <lucas.zampar@gmail.com>
Date: Sun, 28 Feb 2016 17:33:08 -0300
Subject: [Buildroot] [PATCH v3] ShellInABox: new package
In-Reply-To: <CAMt=8UJvLdPCTm1aNgbd_szbbRhmpb005GNE9VOs-jfHLwN9tQ@mail.gmail.com>
References: <1454771503-116304-1-git-send-email-lucas.zampar@gmail.com>
 <20160221223503.68a72fe1@free-electrons.com>
 <56CC8CF1.1040806@mclink.it>
 <CAMt=8UJvLdPCTm1aNgbd_szbbRhmpb005GNE9VOs-jfHLwN9tQ@mail.gmail.com>
Message-ID: <CAMt=8UKtsMxQcE1c7UCGd+cC5RxdRrMnayqCX-qOtn+TLVqUJQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello guys,

The work is almost done. I have a question:
When I`m compiling the package I get:

libtool: link:
/work/buildroot/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc
-g -std=gnu99 -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -Os -static -o shellinaboxd
shellinabox/shellinaboxd.o shellinabox/externalfile.o
shellinabox/launcher.o shellinabox/privileges.o shellinabox/service.o
shellinabox/session.o shellinabox/usercss.o  ./.libs/liblogging.a
./.libs/libhttp.a -lz -ldl -lutil

/work/buildroot/output/host/usr/lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.9.3/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
cannot find -lz
collect2: error: ld returned 1 exit status


To solve the problem with libz, I created the patch shellinabox
-2.19-remove-static-library.patch:
..
+#shellinaboxd_LDFLAGS = -static
..

Is it the best way to solve this? I checked and libz is compiled and
available at my buildroot environment.

BR,


Lucas

2016-02-23 15:31 GMT-03:00 Lucas Zampar <lucas.zampar@gmail.com>:

> Hello guys! I'm working a lot and I hope modify all pending changes on
> weekend.
> I think that on Moday I send the new patch.
>
>
> BR,
>
> Lucas
>
> 2016-02-23 13:46 GMT-03:00 Mauro Condarelli <mc5686@mclink.it>:
>
>> Hi,
>> comments below.
>>
>> Il 21/02/2016 22:35, Thomas Petazzoni ha scritto:
>>
>>> Dear Lucas Zampar Bernardi,
>>>
>>> On Sat,  6 Feb 2016 13:11:43 -0200, Lucas Zampar Bernardi wrote:
>>>
>>>> This patch add new package ShellInABox that is a program that implements
>>>> an in-browser command line shell. It works on any JavaScript and CSS
>>>> enabled web browser.
>>>>
>>>> Installing it on your Linux board you can get the access to the command
>>>> prompt directly from web without any needs to install terminal software
>>>> on your PC.
>>>>
>>>> Signed-off-by: Lucas Zampar Bernardi <lucas.zampar@gmail.com>
>>>> ---
>>>>
>>> Following the feedback from Arnout Vandecappelle on your patch on
>>> February, 10th, which requested a number of changes, I've marked your
>>> patch as "Changes Requested" in our patch tracking system.
>>>
>>> Could you take into account the comments from Arnout, and send an
>>> updated version? Now that your v3 is marked as "Changes Requested" in
>>> our patch tracking system, we will forget about your patch, so the only
>>> way to make progress is to post an updated version :-)
>>>
>> I am also interested in this package (I already started porting, but
>> stopped since I saw someone was already doing i)t.
>> If Lucas somehow lost interest I can take over the mods (to be done
>> together with zerotier porting).
>> Let me know what is the best practice here.
>>
>> Thanks.
>>
>> Thanks for your contribution!
>>>
>>> Thomas
>>>
>> Regards
>> Mauro
>>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160228/920c563e/attachment.html>
