From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Sat, 27 Nov 2010 18:13:40 +0100
Subject: [Buildroot] Report from the Buildroot Developer Day,
	29th October 2010
In-Reply-To: <201011270023.28293.yann.morin.1998@anciens.enib.fr>
References: <20101123221417.0d6867c6@surf>
	<AANLkTi=A4sufp9mSKrBzHtPE87WsLPw4k6+jti6hM0He@mail.gmail.com>
	<20101126144510.5e6504fd@surf>
	<201011270023.28293.yann.morin.1998@anciens.enib.fr>
Message-ID: <AANLkTimaqOdDxTnaYeSd+skFa0t8qacPQs2Jx1RTO=8a@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Sat, Nov 27, 2010 at 12:23 AM, Yann E. MORIN
<yann.morin.1998@anciens.enib.fr> wrote:
> Thomas & Thomas, All,
>
> On Friday 26 November 2010 14:45:10 Thomas Petazzoni wrote:
>> On Fri, 26 Nov 2010 13:16:45 +0100
>> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> wrote:
>> > What about allowing components to be located in a separate location,
>> > outside of buildroot?
> [--SNIP--]
>> The topic was shortly raised this morning on the IRC channel, but no
>> clear solution was found yet. Input, feedback and ideas on the matter
>> are definitely appreciated.

First of all, I agree that this should be a generic feature for any
package, rather than for the kernel (or a limited list of packages)
only.

>
> I did not follow the IRC log, but here's my suggestion...
>
> Add a config knob where the user can enter the path to a directory.
> That directory is expected to contain packages in sub-directories,
> the way we currently have in package/ in Buildroot. Then, for each
> package that is present there, we use it instead of our own version.

Such a configuration option has the advantage of not needing to add a
new configuration option for each individual package.
A similar idea seems to be presented on IRC
http://ibot.rikers.org/%23uclibc/20101126.html.gz

Whatever way the external path is specified, it is still unclear to me
how we'll be able to tell whether the external source has changed
since the last 'make'. Ideally, there would be some form of automatic
detection.

One way is to just let the package make handle it (let make detect
whether a target is up to date), but this has the disadvantage of
having to call the package make unconditionally, which adds to build
time.

Another solution is to force users to indicate which external sources
have changed. Either by touching a special file, or by explicitly
calling a rebuild-target. Of course, this is error-prone and not so
user-friendly.

Are there other options?

Best regards,
Thomas
