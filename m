From: Romain Izard <romain.izard.pro@gmail.com>
Date: Fri, 26 Feb 2016 09:26:21 +0100
Subject: [Buildroot] [PATCH v1 1/1] coreutils: allow selection of
 installed programs
In-Reply-To: <56CF80BB.7070907@mind.be>
References: <1454498088-20233-1-git-send-email-romain.izard.pro@gmail.com>
 <877fhxaf7l.fsf@dell.be.48ers.dk>
 <CAGkQfmNkVYVb9jP8LgyhfotmQ6rbgR3yNwQN=6Qgb57s6AVA+Q@mail.gmail.com>
 <56CE1E61.7000008@zacarias.com.ar> <20160224214832.GA3449@free.fr>
 <87r3g1zs67.fsf@dell.be.48ers.dk> <20160224221930.GB3449@free.fr>
 <CAGkQfmPYv0oSwO-wuQWDvzt+kC9i=1wcymz6dV7jjP=i9dN7CA@mail.gmail.com>
 <56CF80BB.7070907@mind.be>
Message-ID: <CAGkQfmOArao2udqzGZDWA+o_UqKgWhb5=O6rf2ij4EHO1s5Eeg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2016-02-25 23:31 GMT+01:00 Arnout Vandecappelle <arnout@mind.be>:
> On 02/25/16 11:54, Romain Izard wrote:
>>
>> The issue is that the single binary mode is much more space-efficient
>> than the classical mode. For my subset of 52 executables, it takes
>> 704
>
>  You really need half of the coreutils programs because they have some
>  feature that is not supported by busybox? Or are you trying to
>  eliminate busybox entirely?
>
No busybox, that's the target. This is not necessarily a great idea, but
it works. I agree that without this constraint, it could be possible to
build only a few programs in coreutils.

That use case works better with my patch, but the string option can also
work as you do not need to handle very long strings if you take two or
three executables.

>  If you know which extra features you need, perhaps you can just port
>  them to busybox? Upstream is really receptive to adding (sensible)
>  features, as long as they are hidden behind a config option.
>
>  Note: unlike the others, and don't have a problem with this huge
>  menu. But since all the other core maintainers have voiced objections
>  against it, I doubt it will go in.
>
It would be a good surprise for me if it went in.

Best regards,
-- 
Romain Izard
