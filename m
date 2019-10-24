From: Stephan Henningsen <stephan@asklandd.dk>
Date: Thu, 24 Oct 2019 23:26:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/sudo: removed template config,
 added convenient 'sudo' group config options.
In-Reply-To: <20191024101727.7af5db84@windsurf>
References: <20191023211439.7754-1-stephan+buildroot@asklandd.dk>
 <e97fd4a9-2d28-1d36-1ad3-9ae3c4486fd8@mind.be>
 <20191024101727.7af5db84@windsurf>
Message-ID: <CAH0Z9QLCKhx0-hjFUDd3xhj_281dqd8Lo93+AuXGhUit4uwikw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 24, 2019 at 10:17 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
>
> > > +config BR2_PACKAGE_SUDO_GROUP_RULE
>
> I think we don't need any new option at all:
>
>  (1) Just create the sudo group unconditionally

I don't know about that. It wouldn't have any effect unless addition
configuration was done, and so it would just be yet another unused
system group filling up.  That's why I agree that the two options
should be combined.


>
>  (2) Leave the customization of the /etc/sudoers file to the user,
>      through an overlay/post-build script. We cannot add zillions of
>      options to customize all aspects of each package configuration.

I think it's fair to say that the option I've added is a pretty
standard usage of sudo. It's how it works in Ubuntu and Debian. So I
consider it a very important option of this package that would
definitely add a very common sudo use case and therefore something
useful to Buildroot.

-- 
Yours,
Stephan
