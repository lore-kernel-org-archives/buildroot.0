From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Oct 2016 22:34:26 +0200
Subject: [Buildroot] [PATCH 1/3] runc: bump version to v1.0.0-rc2
In-Reply-To: <CA+h8R2pw90+-9eESPYc3E0oRbGKZg0R3Np90zxN9DmbJ43nbpQ@mail.gmail.com>
 (Christian Stewart's message of "Wed, 19 Oct 2016 16:24:48 -0400")
References: <1476852805-11450-1-git-send-email-christian@paral.in>
 <877f94g4lm.fsf@dell.be.48ers.dk>
 <CA+h8R2pw90+-9eESPYc3E0oRbGKZg0R3Np90zxN9DmbJ43nbpQ@mail.gmail.com>
Message-ID: <87funscc31.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:

 > Peter,
 > On Wed, Oct 19, 2016 at 3:50 AM, Peter Korsgaard <peter@korsgaard.com> wrote:
 >> Great, I was just looking at updating our docker packages yesterday.

 > Cool, glad to hear I got the series in on time :)

Heh ;)

 >> I see that our docker setup doesn't work out
 >> of the box (E.G. docker needs a number of kernel options like cgroups
 >> and netfilter, runtime dependencies like iptables and there is no init
 >> script starting up dockerd / ensuring /var/lib/docker exists, ..).
 >> 
 >> Is that something you could work on?

 > This is the core of this project: http://github.com/paralin/SkiffOS -
 > it's a lightweight configuration manager and merge tool for Buildroot
 > which supports a number of different embedded devices and Docker on
 > default.

Ok.

 > In Buildroot there already is a systemd init script. There's no Sysv
 > one as there doesn't exist one at all for Docker right now.

 > Andrew Webster was working on a sysv init script:
 > https://github.com/paralin/buildroot/commit/e642647545513b9d0f8bbeeec4a3342098fb0e87

That more-or-less seems suitable for upstream buildroot. We may want to
handle the mounts through /etc/fstab instead though.

It doesn't seem to ensure /var/lib/docker is available, so that could be
added as well.

 > Other than that I don't know what else could be put in Buildroot itself.

It would be good if the linux package was changed to enable all the
kernel options needed by docker, similar like what we do for systemd,
smack, ..

Docker afaik also has a number of runtime dependencies on E.G. iptables
and iproute2, so it would be good if the docker-engine package would
select those.

-- 
Venlig hilsen,
Peter Korsgaard 
