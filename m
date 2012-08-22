From: Simon Dawson <spdawson@gmail.com>
Date: Wed, 22 Aug 2012 09:26:06 +0100
Subject: [Buildroot] [PATCH] gpsd: fix Python-related build failure
In-Reply-To: <5034933C.8040005@free-electrons.com>
References: <1345548715-16593-1-git-send-email-spdawson@gmail.com>
 <5034933C.8040005@free-electrons.com>
Message-ID: <CAHt8ZCPRsyLfCKQfOfa5LQ3qeX22_3UgLJAXH0YfeGSb1sQ8-A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maxime; thanks for the comments.

On 22 August 2012 09:07, Maxime Ripard <maxime.ripard@free-electrons.com> wrote:
> I'm not very fond of that approach. I guess one of the purpose of these
> bindings are precisely to provide a python API, and you break it here
> since instead of including gps.foo, you will need to include gps.bar.foo
> (if I remember my Python correctly).

Yes, agreed; it does break the Python bindings for gpsd. This might
not be such an issue, however, as these bindings are disabled in the
Buildroot gpsd package configuration at present.

> I guess the real problem that we have to address here is why scons uses
> the interpreter from the distribution and not the buildroot-generated one.
>
> I guess, we could just make scons depends on host-python and force the
> $(SCONS) variable as "$(HOST_DIR)/usr/bin/python
> $(HOST_DIR)/usr/bin/scons ?"

This sounds to me like a good idea. I had tried to avoid the
host-python dependency, which was in fact present in an earlier
incarnation of the gpsd version bump patch. But it looks like it might
be the cleanest way of resolving the present issue.

Simon.
