From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sun, 6 Sep 2015 10:07:43 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-09-04
In-Reply-To: <55EAF102.6030807@imgtec.com>
References: <20150905063017.01FAA10139B@stock.ovh.net>
 <55EAF102.6030807@imgtec.com>
Message-ID: <CAB0FRstfKF27=owEevMMOGZrsy1WoVzXBaLtPkkm5oqAcp4k4A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2015-09-05 15:41 GMT+02:00 Vicente Olivert Riera <Vincent.Riera@imgtec.com>:
> Dear Thomas Petazzoni, Francois Perrad, all,
>
>
> On 05/09/15 07:30, Thomas Petazzoni wrote:
>>
>> Build statistics for 2015-09-04
>
>
>>        mipsel |          perl-html-parser-3.71 | NOK |
>> http://autobuild.buildroot.net/results/128671dfa23d843698a63220c2fac1f44e1d5845/
>
>
> does it make sense building perl modules statically? They are intended to be
> loaded by the dynamic loader, so..., should we disable all perl modules for
> static builds? Francois?
>

You're right.
Perl modules which are native/C extension, must be disabled for static builds.
This job is done by support/scripts/scancpan.
I just found a weakness in this script.
I'll cook a patch.

Fran?ois

>>      mips64el | xdriver_xf86-video-r128-6.1... | NOK |
>> http://autobuild.buildroot.net/results/34fbb7434d94b32de82f7094facbe57abef2573f/
>
>
> This looks weird...
>
> r128_dri.c:61:26: fatal error: GL/glxtokens.h: No such file or directory
>
> ... because that file should be provided by xproto_glproto which is already
> installed according to the build-time.log. I'll investigate it.
>
> Regards,
>
> Vincent.
