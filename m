From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 06 Mar 2015 10:13:09 -0300
Subject: [Buildroot] [PATCH 2/2] samba4: bump to version 4.2.0
In-Reply-To: <20150306123518.7a76d66c@free-electrons.com>
References: <1425588249-20942-1-git-send-email-gustavo@zacarias.com.ar>	<1425588249-20942-2-git-send-email-gustavo@zacarias.com.ar>	<20150305232946.3620697e@free-electrons.com>	<54F8F0AC.8030707@zacarias.com.ar>	<20150306094008.7baf8c91@free-electrons.com>	<54F96D83.4010304@zacarias.com.ar>	<20150306102632.20dff6f7@free-electrons.com>	<54F974C3.2020509@zacarias.com.ar>	<20150306104010.76c71f6b@free-electrons.com>	<54F98235.7030509@zacarias.com.ar>
 <20150306123518.7a76d66c@free-electrons.com>
Message-ID: <54F9A7E5.10900@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/06/2015 08:35 AM, Thomas Petazzoni wrote:

>> Sorry to nitpick here, but if we weren't changing little bits of style
>> all the time then we'd have more time for really cool stuff, and that
>> bothers me.
> 
> I agree that quite a number of changes are style changes. However, my
> feeling is that such changes are 1/ trivial to review and apply when
> cleanly separated from functional changes, and therefore don't consume
> much time, and 2/ make the code base more homogeneous which is nice for
> new comers.

Style changes should ideally be done all at once, once said change is
documented or agreed upon.
It shouldn't be considered any different than the *_CONF_OPT ->
*_CONF_OPTS rename.
If we just wait for a waterfall effect in updating packages you'll just
have mixed styles around the tree which will just confuse users and
waste peoples time in mails and respins.

> There is some inertia, but this inertia is mainly due to the lack of
> review and testing of the patches from other core developers. Yann is
> doing a lot of this, Vicente is also doing some work in this area,
> Romain has recently joined.
> 
> But for example, you almost never ever give a Reviewed-by or a
> Tested-by tag on a patch submitted by another developer. Whenever there
> is a patch touching a package you typically take care of (Samba, Squid,
> etc.) submitted by another developer, I have to ping you to get your
> feedback/input on the patch.

This shouldn't be of any surprise, i'm just (not) doing what i said i
wouldn't back at the end of the qemu-system thread.
Also i'm not territorial, sometimes people add up features to packages
that i usually maintain and evidently they're features i normally don't
care/use about otherwise i would have done so myself, so i don't have
any strong opinion or interest on them.
Example: squidguard, i already have a package from a long time ago, but
i never submitted it since it's quality is dubious, let alone a release
hasn't been forthcoming for years (you gotta use the latest with several
security patches or some beta).

> So if you feel there is inertia on a given topic, just help the topic
> make progress by reviewing the patches, saying you tested the series,
> etc. When a core developer like you gives his positive feedback on a
> given patch, for me (and I believe for Peter as well) it's a very
> strong sign that the patch is good to apply. I never build test your
> patches because I fully trust you. You can use this trust to help other
> patches go in.

...

> Contributors don't matter?
> 
> Do you realize that since a few months, I've basically stopped doing
> any development of Buildroot on the topics I'm interested in, and
> switched to spending all my available time to review, test and merge
> the patches submitted by all the contributors? I'm spending all my
> evenings and week-ends shrinking the patchwork backlog so that
> patches sent by contributors get merged at some point.

This is the kind of inertia i'm refering to.
Something needs to change or eventually you'll wear out/wane out of
interest.
Without wanting to "rub it" and being pretty one-sided the qemu-system
package/idea went nowhere, a lot of time passed.
I still stand on my original argument for it being split.
I don't care what does or doesn't happen with that any more, i'm
bringing it up as an example of my lack of interest of doing anything
big regarding out-of-the-box experience.
Post build scripts are all great, but some things should really be
easier for the users.
Making the initscripts configurable for example is one of them, but
every time i want to start writing the proposal and samples i feel
"Bleh, Peter or Thomas won't take it" and just leave it be.
And it _really_ needs to happen, right now samba4 AD DC support isn't
complete since the initscript isn't adequate for that.
You've got scenarios where you start smbd, nmbd and winbindd, more usual
without winbindd, but for AD-DC you need to start samba, and it's hard
to predict based on smb.conf with dubious grepping.
It's also not very feasible to "try" both approaches since some delays
must be thrown in for the samba master process to really kick in before
checking things are running.

>> And, for me personally, it just makes me
> 
> Seems like there's a missing part here :-)

Morning rush.
It just makes me question if i should continue working with BR.

> I definitely want you part of the Buildroot core developers. You're
> doing an invaluable work taking care of many complex packages, doing a
> lot of very useful work looking at security issues and making the
> corresponding package updates.

We'll see how much people like my security "updates" once i send the
cups deprecation series - it really needs to happen, nobody stepped up
and it's pretty bad. I don't have an exact count of how many
remotely-exploitable CVEs affect it, but it's probably safe to say a dozen.
Maybe it'll entice someone to step up, but it really can't go on like this.
Even though we don't guarantee that packages are free of bugs/security
holes in them when we do know we should get something done about them,
either fix them or kill them.

> I think we should really meet once in person one day so you can feel how
> much I value the contributions done by all developers, and especially
> yours.

That'd be hard to achieve i'm afraid, we've got a phrase here which
literally translates to "we're in the ass of the world".
All of the relevant places (OSS/technology-wise) are no less than a 10
hour flight from here. It's just the way it is.

> Back on the Samba 4.2, my point is really only: "hey this patch is OK,
> I would just like it to be split a bit differently". I don't really
> understand why such a stupid/silly request generates such a huge amount
> of discussion.

Well, it shouldn't have, i didn't think you'd go all "by the book" on
that silly detail and it caught me by surprise.

> I'm not sure what I should understand? That because you are a long-term
> contributor, you have the right to do patches that don't comply with
> the quality rules we request all other contributors to comply with?
> 
> Sorry, but that doesn't work for me.
> 
> Do you remember that I already yelled at Peter because he wasn't
> posting to the list his patches before committing them ? So clearly,
> this is nothing personal with you, you see ?

For me core developer = Peter and you since you're the ones with commit
access to the tree, the rest are varying degrees of contributors.
And you mixed and matched contributor with core developer here and above
where it suited you best, don't be nasty ;)
I know it's probably not personal, but writing frankly, we're both
wasting time on a technicality that changes nothing, is it worth the
(virtual) saliva?
Regards.
