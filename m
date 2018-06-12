From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 12 Jun 2018 19:59:34 +0200
Subject: [Buildroot] [PATCH 1/1] mosquitto: bump to version 1.5
In-Reply-To: <87r2ldaxee.fsf@dell.be.48ers.dk>
References: <20180610134244.5369-1-fontaine.fabrice@gmail.com>
 <87r2ldaxee.fsf@dell.be.48ers.dk>
Message-ID: <CAPi7W82Lz4-TPxS24=M7fpGBLEAJ5jWmbHpSrNeVWEmAfCqi4A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter,

2018-06-11 22:19 GMT+02:00 Peter Korsgaard <peter@korsgaard.com>:

> >>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
>
>  > Remove patch (already in version)
>  > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> How much have you tested this?

I have tested it and it seems to work, mosquitto was starting, basic
publish / subscribe was ok.


> I haven't followed the discussion on
> mosquitto-dev in a lot of details, but apparently there is an unresolved
> crash issue:
>
> https://github.com/eclipse/mosquitto/issues/505

This issue is indeed still present in v1.5.
The following steps leads to a crash on the broker:

   - connect
   - subscribe to topic/a
   - subscribe to topic/b
   - unsubscribe from topic/a
   - disconnect

PR #531 fixes the issue but was not merged perhaps because there is a
conflict in src/database.c that was not fixed. I will send a v2 of my patch
to fix this issue.

>
>
> And a compilation issue caused by a variable name change:
>
> https://github.com/eclipse/mosquitto/pull/810

I didn't encounter this issue because WITH_WRAP is always set to OFF in our
builds.

>
>
> --
> Bye, Peter Korsgaard
>
Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180612/f69902c4/attachment.html>
