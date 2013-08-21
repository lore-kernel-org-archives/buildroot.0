From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Wed, 21 Aug 2013 09:39:42 -0400
Subject: [Buildroot] [PATCH] openssh: fix tab/spacing in init script
In-Reply-To: <CAAXf6LUO9M-Nghy8ZVMS7L0y2J+=3G6kw1eJKnMUhWOt9wGg4Q@mail.gmail.com>
References: <1377047460-1937-1-git-send-email-danomimanchego123@gmail.com>
 <CAAXf6LUO9M-Nghy8ZVMS7L0y2J+=3G6kw1eJKnMUhWOt9wGg4Q@mail.gmail.com>
Message-ID: <CANxTyt5Q_NG1mzdq4vZJq7dYMjmbbRoAViJ-qi4qhy4LgjYZ0g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Aug 20, 2013 at 11:39 PM, Thomas De Schampheleire <
patrickdepinguin@gmail.com> wrote:

> I haven't checked if there are such problems, but have you considered
> checking all init scripts for the same type of problems and fixing them in
> this same patch?
>

Thomas,

I looked through the other init scripts.  There's some variation, mostly in:

* Tabs vs spacing.
* Where spaces are used instead of tabs, sometimes two spaces are used per
level, other times four.
* Indentation of start/stop under the case "$1"  /  esac clause.
    * Some of the start/stop begin in the first column, aligned with 'case'.
    * Some of them have two spaces, followed by actions offset with a tabs.
    * Some of them have two spaces, followed by actions offset with a
sapces.
    * Some are offset with tab, followed by actions offset with two tabs.

So I took the approach of leaving that part alone, and just fixing the
lines that were offset by a mix of spaces and tabs, since that seemed
clearly bad.

I'd be willing to go through all of them and make them uniform, if
recommended guidelines can be stated with regards to the above variations.
 Tabs are tempting only because it's a single character in text files that
go in the target - otherwise, I'm normally in the tabs-are-evil camp, since
thing which start out with tabs tend get modified with spaces over time,
and because editor rendering of tab width can vary.  So I'd be willing to
go either way.

Danomi -
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130821/374eb0f9/attachment.html>
