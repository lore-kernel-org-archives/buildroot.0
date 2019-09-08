From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 08 Sep 2019 18:11:56 -0300
Subject: [Buildroot] [PATCH/next 1/1] package/systemd: drop
 host-intltool dependency
References: <CADvTj4o82PCwgaZ_-O7Kf8cbWHD4SMyjVmQV6wvL8+-iM5inGw@mail.gmail.com>
Message-ID: <5d756e9c26996_61ff3fdbe418cedc6789e@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I tested both solutions (host-gettext and the patch from PR). See below.
I tested based on the commit before the gperf bump to avoid an unrelated issue.

On Sun, Sep 08, 2019 at 11:24 AM, James Hilliard wrote:

> On Sun, Sep 8, 2019 at 6:52 AM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
>>
>> On Sun, 8 Sep 2019 09:58:54 +0200
>> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>>
>> > > Can you investigate this?
>> > I think it should be fixed by adding host-gettext to
>> > SYSTEMD_DEPENDENCIES. Could you check if it fixes the build failure?
>> > I'll then send a patch.

Sure.
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/290291133
See below.

>>
>> So systemd would need host-gettext even when NLS is disabled ?
> Think so unless you do something like this:
> https://github.com/systemd/systemd/pull/11294/files#diff-b29c598ec532831e56a6d4ae6d557e0fR4

https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/290291013

Both solutions fix the build failure.
Notice I tested only this specific scenario.


Regards,
Ricardo
