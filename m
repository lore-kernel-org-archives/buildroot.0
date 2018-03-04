From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 Mar 2018 21:29:11 +0100
Subject: [Buildroot] [PATCH 1/3] package/skeleton-init-systemd: work
 around for /var/lib not populating
In-Reply-To: <20180304212433.781aaee7@windsurf.home>
References: <cover.1520183159.git.yann.morin.1998@free.fr>
 <eecb0195cfda07450e00e2162febe5626bf079c0.1520183159.git.yann.morin.1998@free.fr>
 <20180304212433.781aaee7@windsurf.home>
Message-ID: <20180304202911.GA9484@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-03-04 21:24 +0100, Thomas Petazzoni spake thusly:
> Note: the patches have already been applied, and my comments were not
> meant to prevent them from being applied.

Thaks for applying! :-)

> On Sun,  4 Mar 2018 18:06:15 +0100, Yann E. MORIN wrote:
> > It does cause some warnings from systemd:
> > systemd[1]: Starting Create Volatile Files and Directories...
> > systemd-tmpfiles[148]: [/etc/tmpfiles.d/var-factory.conf:7] Duplicate line for path "/var/lib/systemd", ignoring.
> > systemd-tmpfiles[148]: [/etc/tmpfiles.d/var-factory.conf:8] Duplicate line for path "/var/lib/systemd/coredump", ignoring.
> > 
> > But they can be ignored.
> 
> But annoying. Lots of people are going to wonder what's happening, and
> find them bogus.

Yes, I have a few isdeas on how to fix them...

But later.

> > IMHO, I think a better solution would be for systemd-tmpfiles to gain a
> > "merge tree" operation that is like "C" but doesn't abort if the
> 
> What is "C" ? What is needed for this "better solution" ?

    $ man tmpfiles.d
    [--SNIP--]
        C
           Recursively copy a file or directory, if the destination
           files or directories do not exist yet. Note that this command
           will not descend into subdirectories if the destination
           directory already exists. Instead, the entire copy operation
           is skipped.  If the argument is omitted, files from the source
           directory /usr/share/factory/ with the same name are copied.
           Does not follow symlinks.
    [--SNIP--]

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
