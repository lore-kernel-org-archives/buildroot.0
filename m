From: Christian Stewart <christian@paral.in>
Date: Thu, 01 Mar 2018 12:58:03 -0500
Subject: [Buildroot] [PATCH v2 2/9] dumb-init: new package
In-Reply-To: <20180301100227.3fb09c06@windsurf.lan>
References: <20180301072012.25884-1-christian@paral.in>
 <20180301072012.25884-3-christian@paral.in>
 <20180301100227.3fb09c06@windsurf.lan>
Message-ID: <871sh3r844.fsf@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:
>> +sha256	74486997321bd939cad2ee6af030f481d39751bc9aa0ece84ed55f864e309a3f	v1.2.0.tar.gz
>
> Argh, what an annoying name for the tarball :-/

You're absolutely right, and I don't know how I didn't see that before.
Why is the github infra in DUMB_INIT_SITE producing that tarball name?
>
> Could you add an entry with the hash of the license file ?

Sure. I didn't realize that was a thing.

> This should be:
>
> DUMB_INIT_CFLAGS = $(TARGET_CFLAGS) -static
>
> with a comment above it that explains why we are forcing -static.

Will do.

> However, using -static has a problem: what happens when you're doing a
> BR2_SHARED_LIBS=y configuration, i.e when there is only support for
> shared libraries, and not static libraries ? And BR2_SHARED_LIBS=y is
> our default.

This is the build that I use (SHARED_LIBS=y) and it works. It's
necessary to static link because the binary will be run inside a
container without access to the host system's binaries.

Best,
Christian
