From: Joel Carlson <JoelsonCarl@gmail.com>
Date: Fri, 21 Dec 2018 17:13:21 -0700
Subject: [Buildroot] [PATCH 0/2] core/sdk: fix relative symlinks in
 generated tarball (branch yem/sdk)
In-Reply-To: <df37a271-7012-b8d2-fc4d-edfa66a0e163@andin.de>
References: <cover.1544206190.git.yann.morin.1998@free.fr>
 <df37a271-7012-b8d2-fc4d-edfa66a0e163@andin.de>
Message-ID: <CA+1k=2ZqHeLif6866SYX+hqRwatGiL1e-hZz-zdFuy_Ysfy+8g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andreas,

On Fri, Dec 21, 2018 at 2:46 AM Andreas Naumann <dev@andin.de> wrote:

<snip>

> However, the check for symlinks pointing out of host/ showed to two
> issues originating in install steps of iptables and eudev. Both create
> links that point to system pathes.
>
> I have locally made POST_STAGING_HOOKS to fix that but that's probably a
> non acceptable hack.

Would be hard to tell without seeing the actual change. ;-)
That being said, this is probably something that would need to be
fixed in iptables and eudev (patches submitted upstream), and then
those patches added to buildroot to fix the issue.

So far I've submitted a patch to iptables here:
http://patchwork.ozlabs.org/patch/1017739/

And a patch to buildroot to pull in a version of that here:
https://patchwork.ozlabs.org/patch/1017740/

I've also submitted a pull request for eudev (and while typing this
email it was already merged):
https://github.com/gentoo/eudev/pull/165

I'll submit a patch for eudev in buildroot to pull in that change once
I see feedback on the iptables one. For it to work for me I needed to
set AUTORECONF=YES on eudev, but I don't really understand
autotools/automake stuff very well and I don't know if that is the
right way to be doing things.
-Joel
