From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 20 Mar 2019 03:05:13 -0600
Subject: [Buildroot] [RFC] openssh: add option to allow login as root
In-Reply-To: <87imwdexcs.fsf@dell.be.48ers.dk>
References: <20190319114156.10696-1-esben.haabendal@gmail.com>
 <87mulqebah.fsf@dell.be.48ers.dk>
 <f11c03b3-7edd-5c55-7287-61684f2c9a64@mind.be>
 <87imwdexcs.fsf@dell.be.48ers.dk>
Message-ID: <CADvTj4q9+uWVE-Yooj7gwVygHca0Y8KiKoHUBtRruf2jzyi8mQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 20, 2019 at 2:58 AM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
>
> Hi,
>
>  >> We discussed it tonight on IRC and didn't really get to a good compromise.
>  >>
>  >> On one hand, we prefer to stick with upstream defaults (especially when
>  >> security is involved)
>
>  >  This patch doesn't change the defaults.
>
> No, but the discussion on IRC included talking about if there should be
> an option or if we should unconditionally allow/disallow root logins.
>
>  >> We prefer to not add configuration options for these kind of
>  >> detailed policy decisions,
>
>  >  *That* is the crux of the matter. We normally only have configurability of
>  > compile-time options, and assume that anything else is handled in post-build
>  > scripts. The (only?) exception to that principle is the system menu.
>
>  >  So *maybe* something global in the system menu could work, and then dropbear
>  > and openssh and whatnot would do whatever is needed to permit/disallow root
>  > login for that particular package. But I'm not exactly ecstatic about that option.
>
> Me neither.
>
>
>  >> as openssh has a LOT of other configuration
>  >> options
>
>  >  True, but permitting root login is clearly one that is a lot more
>  > important/relevant than all the others. Currently, the typical user will naively
>  > enable openssh, then try to ssh into the device, and fail...
>
> Correct. It will also fail for dropbear as the root user by default does
> not have a password set.
>
>
>  >> So all in all, this kind of policy tweaks are better done in a post
>  >> build script.
>
>  >  In the few projects where I've seen openssh used, it was always with a custom
>  > config file. Otherwise, there's not much reason to use openssh instead of
>  > dropbear I guess.
>
> Indeed. I always use dropbear as well.
One reason for using openssh instead of dropbear without a custom
config would be
for sftp support.
>
> --
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
