From: Gabe Evans <gabe@hashrabbit.co>
Date: Tue, 3 Nov 2015 14:21:46 -0800
Subject: [Buildroot] [PATCH 1/2] package/dropbear: Respect user specific
	configurations
In-Reply-To: <20151103225311.22589f69@free-electrons.com>
References: <1446099102-5205-1-git-send-email-cyrilbur@gmail.com>
 <20151102224357.213f796c@free-electrons.com>
 <CAHsRNLgKPsm59euMCkS6XvHKxQQVzEyTeAfFHszEYuEw0rNjgg@mail.gmail.com>
 <20151103225311.22589f69@free-electrons.com>
Message-ID: <CAHsRNLgvVBBYiaab=Fgu=FDXZpMw9rqwcmVy=aSaXPaOi==L=w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Nov 3, 2015 at 1:53 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> So your report is definitely useful. But if I may suggest, it would be
> even more useful if you could review systemd related patches before
> they are applied.

This one slipped past me but I'd be more than happy to review patches
in the future.

>> An even better solution would be to move the dropbear.service symlink from
>> /etc/systemd/system/multi-user.target.wants/ to
>> /usr/lib/systemd/system/multi-user.target.wants/. That would allow users to
>> shadow the unit completely with their own customizations or override
>> individual options through the use of "drop-in" units. The manual explains
>> this in more detail:
>> http://www.freedesktop.org/software/systemd/man/systemd.unit.html#id-1.10.3
>
> *All* our packages are creating the symlink
> in /etc/systemd/system/multi-user.target.wants/, so changing that
> really needs to be discussed with the other people interested in
> systemd support in Buildroot. I believe we used to have some symlinks
> in /usr, some in /etc, and we settled on /etc with some
> ${justification}.

It might also be worth clarifying that other Linux distributions
follow the practice of reserving /etc/systemd for users and
/usr/lib/systemd for maintainers.

This is definitely a big change that should be discussed in more
detail. I'm still getting familiar with the mailing list so your help
in starting this conversation would be appreciated. :)

Thanks,
Gabe

-- 
Gabe Evans | Co-Founder & CTO
hashrabbit.co ? angel.co/hashrabbit ? github.com/gevans
