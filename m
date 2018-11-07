From: Christian Stewart <christian@paral.in>
Date: Wed, 7 Nov 2018 14:27:11 -0800
Subject: [Buildroot] [PATCH 1/2] go: specify GOARM when compiling target
 binaries
In-Reply-To: <20181107201259.28717-1-christian@paral.in>
References: <20181107201259.28717-1-christian@paral.in>
Message-ID: <CA+h8R2ova2X3vO0xaexhyQJ06213C=2vUiOJ=GHio9ACA7VrYg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Wed, Nov 7, 2018 at 12:13 PM Christian Stewart <christian@paral.in> wrote:
> Currently, GOARM is not specified correctly when compiling target binaries. This
> results in incompatibility / illegal instruction issues on some ARM devices.

Withdrawing this patch, while investigating a SIGILL with Cgo,
possibly related to using thumb2 instructions on arm (when Go only
supports standard arm instructions).

See https://github.com/golang/go/issues/28642

Thanks,
Christian Stewart
