From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 02 Jul 2014 21:09:31 +0200
Subject: [Buildroot] [PATCH 1/1] systemd: bump to version 214
In-Reply-To: <20140702180841.GB755@rmm-p1267483>
References: <1404070537-14255-1-git-send-email-eric.le.bihan.dev@free.fr>
 <53B398FE.9030200@mind.be> <20140702180841.GB755@rmm-p1267483>
Message-ID: <53B458EB.8000601@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/07/14 20:08, Eric Le Bihan wrote:
> Hi!
> On Wed, Jul 02, 2014 at 07:30:38AM +0200, Arnout Vandecappelle wrote:
>> > On 29/06/14 21:35, Eric Le Bihan wrote:
>>> > > This patch bumps systemd to version 214.
>>> > >
>>> > > Changes:
>>> > >
>>> > > - add new users: systemd-bus-proxy, systemd-network and systemd-resolve.
>>> > > - remove gtk-doc patch, as it is no longer needed.
>>> > > - force kmod path when configuring.
>>> > > - remove attr build dependency.
>>> > >
>>> > > Besides:
>>> > >
>>> > > - /var/lock no longer needs to be a symlink to /run, as systemd, via
>>> > >   tmpfiles.d, will automatically create a symlink to /run/lock at
>>> > >   runtime.
>>> > > - when using systemd-networkd, /etc/resolv.conf should now be a symlink
>>> > >   to /run/systemd/resolve/resolv.conf.
>> >
>> >  So, maybe the systemd package should make sure that this is the case? In a
>> > post-install hook for instance?
> I usually perform these steps in a post-build script. There was a recent
> discussion [1] about adding systemd/sysv specific target skeletons. If adding
> a post installation hook that rework /var and /run is OK, this can solve this
> problem.

 For resolv.conf, it is easy to create that symlink in the
POST_INSTALL_TARGET_HOOKS, so I would do it. A user can still override it in the
fs-overlay if needed.


 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
