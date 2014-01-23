From: Przemyslaw Wrzos <przemyslaw.wrzos@calyptech.com>
Date: Fri, 24 Jan 2014 10:53:19 +1100
Subject: [Buildroot] [PATCH] python: fix to ensure libpython is stripped
In-Reply-To: <CAAXf6LV1vHUAEDGdCmMZ0nC-XX3x9QSZOWnAZbNS=rG=0bGnFA@mail.gmail.com>
References: <1390448438-13114-1-git-send-email-przemyslaw.wrzos@calyptech.com>
 <CAAXf6LV1vHUAEDGdCmMZ0nC-XX3x9QSZOWnAZbNS=rG=0bGnFA@mail.gmail.com>
Message-ID: <002801cf1896$4acddc40$e06994c0$@calyptech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Fri, 24 Jan 2014 at 01:06:08, Thomas De Schampheleire wrote:

> On Thu, Jan 23, 2014 at 4:40 AM, Przemyslaw Wrzos
> <przemyslaw.wrzos@calyptech.com> wrote:
>> The python and python3 builds mark libpython as read-only which
>> prevents it from being stripped out correctly for the target.
>> 
>> Signed-off-by: Przemyslaw Wrzos <przemyslaw.wrzos@calyptech.com>
>> ---
>
> Acked-by: Thomas De Schampheleire
> <thomas.de_schampheleire@alcatel-lucent.com> Tested-by: Thomas De
> Schampheleire <thomas.de_schampheleire@alcatel-lucent.com> (tested with
> python2 only)
> 
> Note: the library will remain writable, but this doesn't look like a
> big problem to me...
> 
> By the way: nice find! Saves about 4MB on Python 2!

Yep, that's the only caveat without stuffing some horrible hack into
buildroot elsewhere to get around it. I couldn't think of a downside
though, and I've been running this on my embedded systems for a year now
without issue.

Cheers,
Przemyslaw Wrzos
