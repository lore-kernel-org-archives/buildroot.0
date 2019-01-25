From: Christian Stewart <christian@paral.in>
Date: Thu, 24 Jan 2019 18:16:24 -0800
Subject: [Buildroot] [PATCH 1/1] pkg-golang: add strip, asmflags,
 gcflags support
In-Reply-To: <20190124090856.4sab2733vepeera6@bifrost>
References: <20190124081834.17534-1-christian@paral.in>
 <20190124090856.4sab2733vepeera6@bifrost>
Message-ID: <87o985jxc7.fsf@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Anisse,

Anisse Astier <anisse@astier.eu> writes:
> I see that you added trimpath here, which is useful for removing the
> build path from the binaries, (and having reproducible builds), but it
> isn't mentionned in the commit message.

Yes, I had originally intended for this to be a separate commit, but the
functionality works as intended and I am happy to keep it as part of
this commmit.

> As a sidenote, it seems that this option is broken when building a
> package with go modules:
> https://github.com/golang/go/issues/28008

There will never be a Buildroot core package with Go modules in use nor
enabled, as this would imply a separate network resource fetching
mechanism from the core Buildroot tarball download + hash cycle.

Even so, the option would then not break the build, but would merely
fail to trim the paths in the output binary.

Best,
Christian
