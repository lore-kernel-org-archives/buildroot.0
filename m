From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Mar 2018 21:24:33 +0100
Subject: [Buildroot] [PATCH 1/3] package/skeleton-init-systemd: work
 around for /var/lib not populating
In-Reply-To: <eecb0195cfda07450e00e2162febe5626bf079c0.1520183159.git.yann.morin.1998@free.fr>
References: <cover.1520183159.git.yann.morin.1998@free.fr>
 <eecb0195cfda07450e00e2162febe5626bf079c0.1520183159.git.yann.morin.1998@free.fr>
Message-ID: <20180304212433.781aaee7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Note: the patches have already been applied, and my comments were not
meant to prevent them from being applied.

On Sun,  4 Mar 2018 18:06:15 +0100, Yann E. MORIN wrote:

> It does cause some warnings from systemd:
> systemd[1]: Starting Create Volatile Files and Directories...
> systemd-tmpfiles[148]: [/etc/tmpfiles.d/var-factory.conf:7] Duplicate line for path "/var/lib/systemd", ignoring.
> systemd-tmpfiles[148]: [/etc/tmpfiles.d/var-factory.conf:8] Duplicate line for path "/var/lib/systemd/coredump", ignoring.
> 
> But they can be ignored.

But annoying. Lots of people are going to wonder what's happening, and
find them bogus.

> 
> IMHO, I think a better solution would be for systemd-tmpfiles to gain a
> "merge tree" operation that is like "C" but doesn't abort if the

What is "C" ? What is needed for this "better solution" ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
