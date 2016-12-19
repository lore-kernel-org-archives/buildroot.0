From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Dec 2016 23:31:23 +0100
Subject: [Buildroot] 2016.11.1 bugfix release
Message-ID: <877f6va6v8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

We are now a few weeks after the 2016.11 release, and it is getting time
to look at what fixes makes sense to add in a 2016.11.1 bugfix release.

As discussed during the recent developer days
(http://elinux.org/Buildroot:DeveloperDaysELCE2016#Security_issues), we
also want to handle security issues better, so I've done a search for
commits since 2016.11 matching:

- ' #[0-9]' (E.G. referencing a bugzilla entry)
- 'security'
- 'CVE'

git log --format=oneline --abbrev-commit  -i --grep ' #[0-9]' --grep security --grep cve 2016.11..
c489cba libupnp: add upstream security fix for CVE-2016-8863
9d1dab1 libupnp: add upstream security fix for CVE-2016-6255
80e0583 samba4: security bump to version 4.4.8
ae58da7 openssh: security bump to version 7.4p1
d9ef4c1 squid: security bump to version 3.5.23
cd4af31 xorg-server: add dependency on dri2proto when systemd is built
35e5e7d docker-engine: security bump to 1.12.3
326a955 wireshark: bump to version 2.2.3
660b330 gdk-pixbuf: security bump to version 2.36.1
e244d79 dovecot: bump version to 2.2.27 (security)
f4b9e87 links: security bump to version 2.14
2483170 php: security bump to version 7.0.14
f7a07f4 vim: be more careful when removing the documentation
7fe6b5d nodejs: security bump 0.10.x series to 0.10.48

And cherry picked those. I've also added related / important fixes,
E.G.:

c4a7d95e docker-engine: needs pkg-config
3bc5d55e package/dovecot: needs OpenSSL

I also added the nodejs 6.x security bump even though it didn't mention
anything about security / CVEs, so I've extended the commit message:

5f899d7f package/nodejs: bump version to 6.9.1

I've pushed all of these to the 2016.11.x branch and done some basic
tests.

Is there anything else that should be cherry picked? What about
linux-headers? Any important autobuilder fixes? Anything that I
shouldn't have included?

-- 
Bye, Peter Korsgaard
