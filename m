From: Santhosh Ramani <srcoolz@gmail.com>
Date: Sat, 31 Jan 2015 19:33:19 -0600
Subject: [Buildroot] Fwd: Qt4 Application - Touch detection
In-Reply-To: <CALo-6+iLAX-9K0F+BV3E3dQPVU9k=siWXjFPEYY9snTufVA-9A@mail.gmail.com>
References: <CADKZYYLgvvnaur+Rc0J0UVshsQesEWZ2Feenb3WHA0gQztaKKA@mail.gmail.com>
 <20150115181324.48fc51e9@tux.kirchner>
 <CADKZYYKDoizsdEo28Ynwb=ndhJXmHW3Zoqx=aSpP-1BMnDYujw@mail.gmail.com>
 <CADKZYYK12mXBKQq=R2k7aAky-2i1FcfAyyaXqLdsnd5cpoQdXg@mail.gmail.com>
 <20150115200634.598a27a3@tux.kirchner>
 <CADKZYYL-uKCvyEU9w7eAWi-yZv4bky5dTEz+RpUNAJQchjw2-Q@mail.gmail.com>
 <20150115212231.08000b68@tux.kirchner>
 <CADKZYYJArGCAPBOkzTcKvc-BgiUieZpx0Qjw-0zDycwJVPAX5A@mail.gmail.com>
 <CALo-6+jTAcUEOWeES1rCUdSHS1NbccG6L+oEBB3VTJYMEu6coQ@mail.gmail.com>
 <CADKZYYLrKJZGErU7_1K1LG9r6eL4SL5R665NAXastQqFn8Xhwg@mail.gmail.com>
 <8110c0cb2d1abaa590e539411c24b775.squirrel@3p.am-soft.de>
 <CADKZYYL5giF=q-gojpoT_5JmseqLPFMPzHtnNFbTH4wfAUrFFA@mail.gmail.com>
 <CALo-6+iLAX-9K0F+BV3E3dQPVU9k=siWXjFPEYY9snTufVA-9A@mail.gmail.com>
Message-ID: <CADKZYYLo7Zp+GOtY641ZbKErRcweuu-QbmG8mEAkNcgYu8x6pA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Charles,

We actually got it to work fine. Here is what we had to do to make it work:

1. Standard settings in buildroot, nothing fancy, nothing out of the
ordinary. Using Qt 4 rather than Qt 5 - tslib and usb mouse input enabled.
2. Build Qt - the same version as what buildroot downloads.
3. Build Tslib - the same version as what buildroot downloads.
4. Build the application against the libraries from the build Qt and Tslib.

Once these are done, the application works fine. So I guess it was more to
do with making sure the application is built with the same Qt version and
Tslib version as what is downloaded and installed by buildroot.

Thanks a lot guys for taking the time and replying to my questions. Thank
you for your patience.
Regards

Santhosh



On 16 January 2015 at 12:10, Charles Krinke <charles.krinke@gmail.com>
wrote:

> Hang on a minute, Santhosh. You just said something that clicked. I
> "always" use Qt applications built only on buildroot for running on a
> buildroot generated filesystem with the Qt libraries. I cannot imagine
> cross-library stuff working properly, regardless of what the Qt folks say.
>
> The Qt developers I support grumbled and wanted to use windows and linux
> PC Qt, but I set them up with the tools in buildroot that were used to
> compile the libraries to ensure things worked properly.
>
> On Fri, Jan 16, 2015 at 9:26 AM, Santhosh Ramani <srcoolz@gmail.com>
> wrote:
>
>> Hello Bjorn,
>>
>> Thank you for the detailed explanation of the environmental variables -
>> it was really helpful. I've made sure that my startup scripts export all
>> the necessary variables. Additionally I have also added it to my profile.d
>> so that in case I kill the app and restart it, it can have access to those
>> variables. I hope this approach is okay?
>>
>> My program is launched as root and I have only 1 user. I also looked at
>> permissions for the /etc/pointercal - it seems fine to me. It has read
>> permissions for all levels and rw for root. My colleague is gonna build the
>> application using Qt built from buildroot and I'll post the results here
>> once we run the application on our board.
>>
>> Thanks once again for your time and patience.
>> Regards
>>
>> Santhosh
>>
>>
>>
>> On 15 January 2015 at 23:53, <bjoern@am-soft.de> wrote:
>>
>>> >>
>>> >> On the invocation of the qt program, perhaps this argument might help
>>> >> -plugin Tslib:/dev/input/event0
>>> >
>>> >
>>> > Hello Charles,
>>> >
>>> > Thanks for the suggestion, I tried it but there is still no difference.
>>> > Additionally I added a mouse pointer to be visible in my application
>>> and I
>>> > can see that the touchevent is picked up, just that it's completely off
>>> > even if I calibrate it every time at power up.
>>> >
>>>
>>> Just a thought: Does your program (or better, the user who starts it)
>>> sufficent rights to access the calibration file?
>>> Do the Qt libraries load additional external libs at runtime? Or try to
>>> do so and fail (for example: tslib components)? Maybe they fall back in
>>> this case to a "wrong" input method?
>>>
>>> > Regards
>>> >
>>> > Santhosh
>>> >
>>>
>>>
>>>
>>
>>
>> --
>> Greater the Difficulty....Sweeter is the Victory
>>
>
>
>
> --
> Charles Krinke
>
>


-- 
Greater the Difficulty....Sweeter is the Victory
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150131/0811fba6/attachment.html>
