From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 21 Aug 2013 05:27:17 +0200
Subject: [Buildroot] [PATCH] infra: display current task as title of the
 term window
In-Reply-To: <5213EE6F.7040006@mind.be>
References: <1375822004-22591-1-git-send-email-francois.perrad@gadz.org>
 <CAAXf6LWCBh-W3nHRLtoXVy8PfbS3NpOQ7sMwicp6W+kv-OeAkg@mail.gmail.com>
 <5209C5D1.7040904@mind.be>
 <CAAXf6LWkHdg1XB77GPjVFY6k97E95AxG7ZHK3cmr6dGEM=xAfg@mail.gmail.com>
 <52124585.1050303@mind.be>
 <CAAXf6LWzouV+VGEHJric3M3yt5zGmtg=iVmsUeKN5yk4JDE1Vw@mail.gmail.com>
 <5213EE6F.7040006@mind.be>
Message-ID: <CAAXf6LUQ4zx4vjrB9KuvO8Zwgt11PPy6gPQBQNpT71v9kRj=NA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Op 21-aug.-2013 00:32 schreef "Arnout Vandecappelle" <arnout@mind.be> het
volgende:
>
> On 19/08/13 20:49, Thomas De Schampheleire wrote:
> [snip]
>
>>  >> However, while testing again, I noticed an annoyance: if the build
>>  >> process stops prematurely, for example because the build fails or the
>>  >> user interrupts it, the last tab title remains. I would much prefer
>>  >> that we can cleanly restore this no matter how buildroot/make stops.
>>  >
>>  >
>>  >  Won't that be the case regardless of whether the build fails or
succeeds?
>>
>> Currently it is indeed, but that could easily be fixed by adding an extra
>> such print at the end.
>
>
>  A print of what? An empty string? Then your window won't have a title
anymore... There is no way to save the previous window title, so I really
think that if PS1 doesn't set the window title, then buildroot shouldn't
either.

Other programs, like gentoo portage, are able to restore the window title
correctly. I don't know how, but it is possible.

That said, although I like the idea of easily seeing which package is
currently building, I also think it should either be perfect or not be at
all.

As an alternative, is it possible to count the number of make targets /
packages remaining, and show that in the MESSAGEs? Then you only have to
scroll up to the last message to get an idea...

Best regards,
Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130821/514d36d8/attachment.html>
