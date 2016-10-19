From: Christian Stewart <christian@paral.in>
Date: Wed, 19 Oct 2016 16:24:48 -0400
Subject: [Buildroot] [PATCH 1/3] runc: bump version to v1.0.0-rc2
In-Reply-To: <877f94g4lm.fsf@dell.be.48ers.dk>
References: <1476852805-11450-1-git-send-email-christian@paral.in>
 <877f94g4lm.fsf@dell.be.48ers.dk>
Message-ID: <CA+h8R2pw90+-9eESPYc3E0oRbGKZg0R3Np90zxN9DmbJ43nbpQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Wed, Oct 19, 2016 at 3:50 AM, Peter Korsgaard <peter@korsgaard.com> wrote:
> Great, I was just looking at updating our docker packages yesterday.

Cool, glad to hear I got the series in on time :)

> I see that our docker setup doesn't work out
> of the box (E.G. docker needs a number of kernel options like cgroups
> and netfilter, runtime dependencies like iptables and there is no init
> script starting up dockerd / ensuring /var/lib/docker exists, ..).
>
> Is that something you could work on?

This is the core of this project: http://github.com/paralin/SkiffOS -
it's a lightweight configuration manager and merge tool for Buildroot
which supports a number of different embedded devices and Docker on
default.

In Buildroot there already is a systemd init script. There's no Sysv
one as there doesn't exist one at all for Docker right now.

Andrew Webster was working on a sysv init script:
https://github.com/paralin/buildroot/commit/e642647545513b9d0f8bbeeec4a3342098fb0e87

Other than that I don't know what else could be put in Buildroot itself.

Best,
Christian Stewart
