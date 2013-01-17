From: Willy Lambert <lambert.willy@gmail.com>
Date: Thu, 17 Jan 2013 14:05:46 +0100
Subject: [Buildroot] Udev generates too many tty dev nodes
In-Reply-To: <20130117135505.56db811a@skate>
References: <CAKvQZ_2FEFO7BNqkzXTCeH5+scxg6ZhuW+Ruy99Q8xxivjhx_w@mail.gmail.com>
 <20130117135505.56db811a@skate>
Message-ID: <CAKvQZ_085YC_LpJhD5Oxq6KOg9mnRY1O6KSRw75+++6+Fh_+SA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/1/17 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Dear Willy Lambert,
>
> On Thu, 17 Jan 2013 01:48:41 +0100, Willy Lambert wrote:
>
>> I'm trying to put my /dev folder into order, and I recently switched
>> from static config to udev. All device are correctly set up exept tty*
>> that are umerously present (something like 64 nodes).
>>
>> _ Does anyone know if it is normal that so many files are generated ?
>> (or said differently should I wonder about my buildroot outputs)
>> _ Is there any mean to change that ?
>> _ Is this only and udev problem or is it linked to buildroot
>> integration ?
>
> Is it really an issue? I mean, device nodes really don't consume that
> much memory or anything, so, who cares?
>

I do ^^. The bad argument is that I hate having mess on my device,
especially when typing "ls /dev". The good one is that if something
behave strangly I like to tackle the root cause. It's not an
industrial projet, it's a personnal one on which I can take the time I
want to look at everything I like :D. And in this case I do *not* have
a need for 64 ttys and I did *not* (at least consciently) ask for
having them. So somehting, somewhere is doing thing on my back, and I
want to know what.

udev is supposed to show only what's available or in use. It's sure
that some of those devices are not meeting this criterias.

But I agree, it's all but an issue.

> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
