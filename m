From: Charles Krinke <charles.krinke@gmail.com>
Date: Fri, 8 Jun 2012 15:14:06 -0700
Subject: [Buildroot] busybox 1.18.3 to 1.18.4
In-Reply-To: <4FD2113D.1090302@lucaceresoli.net>
References: <CALo-6+h1Yq_rM_1inqvMVr8X14q45zBmoy_Zeo937G5p2uxWww@mail.gmail.com>
 <4FD2113D.1090302@lucaceresoli.net>
Message-ID: <CALo-6+h=p7A3jfOaDWJpxQXirSDadwJMHA4CuD4tBuCsKZGJKQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you kindly, Luca, that appears to do the trick. The place I went
wrong was to not run xconfig or menuconfig after changing the .config,
but you straightened me out.

Charles

On 6/8/12, Luca Ceresoli <luca@lucaceresoli.net> wrote:
> Hi Charles,
>
> Charles Krinke wrote:
>> I am just finishing a project with buildroot-2011.03 and need to
>> change one thing before the end and that is the version of busybox
>> from 1.18.3 to 1.18.4.
>>
>> Make xconfig does not have a 1.18.4 option for this version and
>> editing .config doesnt work. That is, the next make changes the
>> busybox version back from 1.18.4 to 1.18.3.
>>
>> Can someone please tell me which other file would need to be changed
>> so that I can change the project from busybox 1.18.3 to 1.18.4.
>>
>
> In file package/busybox/Config.in there's a section looking like this:
>
> config BR2_BUSYBOX_VERSION
>          string
>          default "1.15.3"        if BR2_BUSYBOX_VERSION_1_15_X
>          default "1.16.2"        if BR2_BUSYBOX_VERSION_1_16_X
>          default "1.17.4"        if BR2_BUSYBOX_VERSION_1_17_X
>          default "1.18.3"        if BR2_BUSYBOX_VERSION_1_18_X
>
> You can change "1.18.3" to "1.18.4" (or, maybe better, "1.18.5", as it is a
> bugfix release).
>
> Then run make menuconfig again and exit saving for the .config to be
> updated.
>
> Luca
>
>


-- 
Charles Krinke
