From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 23 Jan 2018 22:15:11 -0600
Subject: [Buildroot] [PATCH v2] hung build: convert to monitor thread
In-Reply-To: <20180102195608.10806-1-matthew.weber@rockwellcollins.com>
References: <20180102195608.10806-1-matthew.weber@rockwellcollins.com>
Message-ID: <CANQCQpa7FUMYXT7Zu3WefgZYj9OJhy3V==ifHYBqNP5sGaA2Cw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Tue, Jan 2, 2018 at 1:56 PM, Matt Weber
<matthew.weber@rockwellcollins.com> wrote:
>
> Check the build-time.log and monitor for modifications to
> determine if the build has hung for at most 60mins
> before killing the build and reporting a timeout.
>
> This allows infinite sized builds as we get to a lower
> number of autobr fails.  Less failures means we start
> to see false timeout failures when we hit the boundary
> of the old MAX_DURATION ~8hrs.
>
[snip]
> -MAX_DURATION = 60 * 60 * 8
> +HUNG_BUILD_TIMEOUT = 60 # mins

It looks like there is a race condition with the mimic and webkit
builds where they go over an hour on some slower builders.  I've
bumped up my local builders to 120mins for further testing.

Matt
