From: Dmitry Golubovsky <golubovsky@gmail.com>
Date: Thu, 9 Aug 2012 10:29:16 -0400
Subject: [Buildroot] [pull request] Pull request for branch
	for-2012.08/systemd
In-Reply-To: <20120809114526.742e2e38@skate>
References: <CADiAo4LsWUje0=p0QvJqgK_tAiT1XtsSs9J9qFmHswSYvzSSew@mail.gmail.com>
 <20120809114526.742e2e38@skate>
Message-ID: <CADiAo4+0r_BtGn+f0SMVHDp7m2GHO+2-5-4ush27OkqAAf8QnA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Thu, Aug 9, 2012 at 5:45 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello Dmitry,
>
> This repository is unfortunately a bit unusable: it isn't a fork from
> the original Buildroot repository. Why did you create a new repository
> that contains just the source code of a package? You should instead
> clone the original Buildroot repository, create a branch, and push it
> on Gitorious.

Well  I'm afraid I did not explain it clearer: this is my overlay
project which does approximately what someone suggested earlier on the
list to support local packages, yet without disturbing sources of
buildroot itself. This is where I keep patches being created. I do
have a clone of buildroot of course where I test final integration,
but it is only on my computer ;)

What I wanted the readers to see are patches in myroot/systemd-pam,
not anything else - just to illustrate how much the code structure in
v18x departed from v4x.

>
> Also, your work on PAM+systemd should not be a new systemd-pam package:
> it should be integrated (probably with configuration options) into the
> existing systemd package.

This is just a temporary name since I had to overlay it over the
untouched buildroot w/o conflict with existing systemd. Surely once I
get to submitting actual patches to buildroot it will be properly
named.


>> Now I see that Buildroot gets udev from different source. Could these
>> be just two mutually exclusive config options: either to build udev
>> with systemd, or udev standalone (and disable building of systemd)?
>
> Now that udev is part of the systemd sources, do they publish new
> udev-only release tarballs? I guess not. If I'm correct, then we should
> simply remove the 'udev' package, and implement a mechanism to allow
> the systemd package to install only udev, or udev+systemd.

Yes, I see that the repo at kernel.org/hotplug stopped at v182. Quoting this:

http://cgit.freedesktop.org/systemd/systemd/tree/NEWS

CHANGES WITH 183:
        * Note that we skipped 139 releases here in order to set the
          new version to something that is greater than both udev's
          and systemd's most recent version number.

        * udev: all udev sources are merged into the systemd source tree now.
          All future udev development will happen in the systemd tree. It
          is still fully supported to use the udev daemon and tools without
          systemd running, like in initramfs or other init systems. Building
          udev though, will require the *build* of the systemd tree, but
          udev can be properly *run* without systemd.

which means that it might be an option in buildroot, roughly speaking;

[X] install udev
[X] install systemd (only available if install udev is checked)

I'll take a look how this can be done once I get back to systemd
patches (currently working on linux-pam patches).

Thanks.

-- 
Dmitry Golubovsky

Anywhere on the Web
