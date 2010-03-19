From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Fri, 19 Mar 2010 13:16:55 +0100
Subject: [Buildroot] [Bug 1213] Move .config into output directory
In-Reply-To: <20100319084432.4301F776BB@busybox.osuosl.org>
References: <bug-1213-163@https.bugs.busybox.net/>
	<20100319084432.4301F776BB@busybox.osuosl.org>
Message-ID: <5f2b61003190516t2d816b10tfe9a99ea09687844@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have no bugzilla account so I hope it's OK to reply to a bugzilla
comment on the mailing list.

On 19 March 2010 09:44,  <bugzilla@busybox.net> wrote:
> --- Comment #2 from Peter Korsgaard <jacmet@uclibc.org> ?2010-03-19 08:44:30 UTC ---
> (In reply to comment #0)
>
>> The patch modifies config and the top level Makefile so that all files reside
>> in the output folder. Feedback welcome. Could go further and tidy some things
>> up as well but have not done so. In particular we generate .auto.deps but never
>> seem to use it. Also have not updated
>> package/config/kconfig-to-buildroot2.patch as the previous patch was old and
>> the instructions on how to generate it were incorrect.
>
> Thanks, it looks very interesting. I have given it a quick try and see two
> things I would like to change:
>
> ?- The .config location has moved to output/.config if you don't use O=. I
> would prefer to keep it like it is for non-O= builds (easy to do by adding
> something like CONFIG_DIR that is either set to $(TOPDIR) or $(O) depending on
> if O is passed.

I like this change. That is, having .config and *all* output in the ouptut
directory. I have a suggestion: how about letting the .config file in top dir
set $(O)? If there is no .config in top dir (or it does not set $(O))
fall back to O=output. And always put the *real* config file into $(O)/.config.

By using top dir .config for $(O) one does not have to set O on the command
line or in the environment. Which I think is nice.

When I think about it, maybe the top dir config file I had in mind (the one
that only sets O) should not be hidden. I think the current .config is hidden
only because one should use menuconfig to edit it, and not do it by hand. But
if we change the meaning of top dir config file, we may want to rename it.

> I'll have a closer look at fixing this next week, unless someone beats me to
> it.

Great!

Best regards,
Bj?rn Forsman
