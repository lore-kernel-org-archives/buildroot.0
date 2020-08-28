From: Christian Stewart <christian@paral.in>
Date: Fri, 28 Aug 2020 11:30:01 -0700
Subject: [Buildroot] [PATCH v4 1/7] package/go: implement go modules
 integration
In-Reply-To: <20200813213220.260112-1-christian@paral.in>
References: <20200813213220.260112-1-christian@paral.in>
Message-ID: <CA+h8R2p-jVEHy=An0eRwDe7rt3Lt0KCaWp__uyPCwTNVi2Emew@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Thu, Aug 13, 2020 at 2:32 PM Christian Stewart <christian@paral.in> wrote:
>
> Go has deprecated the GOPATH mechanism in favor of a new approach - Modules -
> which specifies the root import path (and dependencies) in a "go.mod" file.
>
> This commit moves Buildroot to use the new go.mod approach. Both host and target
> Go packages compile correctly with small tweaks adjusting the build target
> specifier.


I'm looking to merge the Go modules change in advance of upgrading to
Go 1.14 or Go 1.15.

Patchseries available here (same as v4 in the mailing list):

https://patch-diff.githubusercontent.com/raw/paralin/buildroot/pull/8.patch

As of now I haven't had anyone else - even the Go developers in
Buildroot - test/review this.

Adam (mender), Francois (docker-engine), Angelo (go.mk) - it would be
very helpful if you could give this series a spin, particularly with
the host packages you're using.

Best regards,
Christian Stewart
