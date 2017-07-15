From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Jul 2017 12:44:32 +0200
Subject: [Buildroot] [PATCH] azure-iot-sdk-c: Bump to version 2017-06-30
In-Reply-To: <20170715120954.68067f9b@windsurf>
References: <1499277201-14030-1-git-send-email-nerv@dawncrow.de>
 <20170715120954.68067f9b@windsurf>
Message-ID: <20170715124432.1573e49b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 15 Jul 2017 12:09:54 +0200, Thomas Petazzoni wrote:

> This package is causing a large number of timeouts, apparently due to
> the fetch of submodules failing. It only happens on my autobuilder
> instance it seems:
> 
>   http://autobuild.buildroot.net/?reason=azure-iot-sdk-c-2017-06-30
> 
> Is there something that can be done about this?

So, the issue is that I am (intentionally) using a very old Linux
distribution for this autobuilder instance, and the distro is so old
that OpenSSL+ca-certificates are no longer compatible with the
requirements of https:// on github.com. But instead of failing with an
error, it just remains stuck forever.

An "openssl s_client -connect" test clearly reveals that it's never
going to connect to github.com from my old distro.

So, I'm wondering what to do. Should I give up testing Buildroot on
Debian Squeeze, and move to Debian Wheezy instead?

I could perhaps backport openssl+ca-certificates, but what's the point
of testing such an old distro, if random packages have anyway to be
upgraded for Buildroot to work correctly?

Arnout, Yann, Peter, what do you think?

I've also Cc'ed Thomas DS, who is known to use Buildroot on really old
Linux distros. Thomas: what are the oldest distro you're still running
Buildroot on? If it's some RHEL distro, what is the closest Debian
version? Do you get openssl/ca-certificates updates on this RHEL, which
allows such machines to continue to connect over HTTPS to modern web
sites?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
