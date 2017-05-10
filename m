From: Christian Stewart <christian@paral.in>
Date: Wed, 10 May 2017 14:08:58 -0400
Subject: [Buildroot] [PATCH 2/2] docker-engine: bump to version
	17.05.0-ce
In-Reply-To: <CAPi7W81HP7E4Ce+_CRVJ9dhjodKWEVhL4v9xS=5bJ59eMf1WVg@mail.gmail.com>
References: <20170510040050.31744-1-christian@paral.in>
 <20170510040050.31744-2-christian@paral.in>
 <CAPi7W81HP7E4Ce+_CRVJ9dhjodKWEVhL4v9xS=5bJ59eMf1WVg@mail.gmail.com>
Message-ID: <CA+h8R2p=1Zd6vR_J=aW__T5dh9ct8X6CMpK72Ym2p7n3gutO1g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice, All,

On Wed, May 10, 2017 at 3:23 AM, Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
> Since April 18th (and so starting from this release), docker has been
> renamed "moby":

That's not actually true, it's still called Docker Community Edition,
which is why everyone's so confused. The CLI is called docker, the
system is Docker, everything is still Docker, the distribution is
docker-ce, the Go imports all point to docker/docker.

They are introducing "moby" as a name for a collection of components
that when assembled together form Docker. It's still appropriate to
call the package docker-engine, and as such I do not recommend we
rename it at this time. Moby will be a new CLI used in development to
assemble these components together, or so they say.

> If you agree, I would also suggest to rename docker-containerd to containerd
> as containerd has now its own repository and website (https://containerd.io)

Yes, we should do this. However, I recommend we take the following steps:

 - Apply this series now, and try to get it into the next buildroot
release as it's a bugfix and general release of Docker corresponding
with this Buildroot release (2017.05).
 - In next, rename docker-containerd to containerd, and have the
docker-engine package simlink /usr/bin/docker-containerd to
/usr/bin/containerd, as is done in my other patch series introducing
docker-init. I am happy to supply the series to do this change.

Thoughts?

Best,
Christian Stewart
