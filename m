From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 29 Oct 2011 08:36:28 -0300
Subject: [Buildroot] Some topics for the Buildroot Developer Day
In-Reply-To: <20111029082024.61d9042b@skate>
References: <20111024173815.2277c6dd@skate> <4EA801B8.7000502@visionsystems.de>
 <4ff558d1b2a462f239c4c83ef48b6680@zacarias.com.ar>
 <20111029082024.61d9042b@skate>
Message-ID: <e48eef8f7989f62c161e1e1cda1da1e4@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29.10.2011 03:20, Thomas Petazzoni wrote:

> Le Wed, 26 Oct 2011 10:05:55 -0300,
> Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :
>
>> My $.02 is that we could just do it as a package with a huge option
>> list for each firmware file(s) required for different 
>> drivers/devices.
>> I'd go for a smaller subset to begin with since there are firmware
>> files for SAN controllers and other big iron stuff that probably
>> are't the target for buildroot.
>
> Or you put a single "string" option in which the user can pass a
> space-separated list of firmware to install.
>
> Thomas

That may be an extra option for yet undefined/new options, but i 
wouldn't go for that exclusively.
Some firmware consists of several files in a separate subdirectory.
For example zd1211rw firmware is in /lib/firmware/zd1211 and consists 
of the following files: zd1211_ub, zd1211_uphr, zd1211_ur, zd1211b_ub, 
zd1211_uphr and zd1211_ur.
It would be a stretch for the user to know every single piece of it 
which would make the option somewhat irrelevant at that point (he could 
just copy the files himself if he knows all of them).
Regards.
