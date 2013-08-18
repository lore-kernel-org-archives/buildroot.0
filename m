From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Sun, 18 Aug 2013 10:21:14 +0200
Subject: [Buildroot] [PATCH] infra: display current task as title of the
 term window
In-Reply-To: <5209C5D1.7040904@mind.be>
References: <1375822004-22591-1-git-send-email-francois.perrad@gadz.org>
 <CAAXf6LWCBh-W3nHRLtoXVy8PfbS3NpOQ7sMwicp6W+kv-OeAkg@mail.gmail.com>
 <5209C5D1.7040904@mind.be>
Message-ID: <CAAXf6LWkHdg1XB77GPjVFY6k97E95AxG7ZHK3cmr6dGEM=xAfg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Aug 13, 2013 at 7:36 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 07/08/13 08:44, Thomas De Schampheleire wrote:
>>

>> I know that Gentoo has this feature for its portage package
>> installation/compilation tool. When you run 'emerge', the titles are
>> constantly updated with the package that is being handled, also in
>> Konsole. You may be able to find out what the 'right way' is based on
>> their sources.
>
>
>  Are you sure this works for you with emerge? I RTFM'ed it and according to
> the konsole manual, you have to add '%w' to the tab title string to get the
> string set by the shell. Perhaps Gentoo simply sets the default tab title
> string to something including %w.
>


It does work for emerge, but it seems you are right: the default tab
title in Gentoo is set to %w (I didn't set it explicitly). I tried
Francois' patch on a non-gentoo system before (didn't work for
Konsole) but after explicitly setting %w in the tab title it also
works there. So that issue is cleared out.

However, while testing again, I noticed an annoyance: if the build
process stops prematurely, for example because the build fails or the
user interrupts it, the last tab title remains. I would much prefer
that we can cleanly restore this no matter how buildroot/make stops.

Best regards,
Thomas
