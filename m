From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 20 Apr 2015 10:38:11 +0200
Subject: [Buildroot] [PATCH] live555: fix library installation
In-Reply-To: <20150419134235.18c914b0@free-electrons.com>
References: <1429195850-4884-1-git-send-email-luca@lucaceresoli.net>
 <20150419134235.18c914b0@free-electrons.com>
Message-ID: <5534BAF3.1080305@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

Thomas Petazzoni wrote:
> Dear Luca Ceresoli,
>
> On Thu, 16 Apr 2015 16:50:50 +0200, Luca Ceresoli wrote:
>> The manual target installation commands optionally copies 3 executables
>> that demonstrate the library usage, but do not the library itself.
>>
>> This results in the following errors at runtime:
>>
>>    # openRTSP
>>    openRTSP: can't load library 'libliveMedia.so.38'
>>    # live555MediaServer
>>    live555MediaServer: can't load library 'libliveMedia.so.38'
>>    # MPEG2TransportStreamIndexer
>>    MPEG2TransportStreamIndexer: can't load library 'libliveMedia.so.38'
>>    #
>
> I understand the issue, but I'm not entirely happy with the solution.
> There are some options BR2_PACKAGE_LIVE555_OPENRTSP,
> BR2_PACKAGE_LIVE555_MEDIASERVER, etc. to control which tools to
> install. But with your new patch, regardless of the value of those
> options, a lot of other programs (tests and others) are installed.
> Which make the existing per-program options a bit weird/useless.
>
> I would personally advocate for a simple removal of the per-program
> options, just install everything, and leave it to post-build scripts to
> clean up what's needed.

Wow, this means removing dozens of lines of code... great!

At first I just wanted to keep a sort of "backward compatibility", at
least at the configure level. But I really prefer to simplify the
package by installing everything.

I'm sending an update v2 patch.

BTW, there should be a simple way to skip installation of all
executables, by tweaking the live555 makefiles. But I don't think it
would be very nice to conditionally apply a patch based on config
options. Do you agree?

-- 
Luca
