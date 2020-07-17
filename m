From: Christian Stewart <christian@paral.in>
Date: Fri, 17 Jul 2020 14:59:41 -0700
Subject: [Buildroot] [PATCH v3 1/6] package/go: implement go modules
 integration
In-Reply-To: <CA+h8R2pfMBEJMQGbKda83jniXNwyAbTRYrr5ETf8Vnb7Sn23QQ@mail.gmail.com>
References: <20200301075223.1398715-1-christian@paral.in>
 <CA+h8R2pfMBEJMQGbKda83jniXNwyAbTRYrr5ETf8Vnb7Sn23QQ@mail.gmail.com>
Message-ID: <CA+h8R2pfDqCrgx0VdnQ=gZAjHxeJk2XqGeXmkvOO-5ggGhRUQw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Was there any particular blocker / issue with this transition to Go
modules which needs addressing?

It should be fairly straightforward: this initial pass of the series
will allow the Go compiler to automatically resolve the "vendor"
directories rather than needing to build a symlinked GOPATH directory.
Everything that worked before should continue to work now, otherwise.

As reported on the Go release docs:

Module support in the go command is now ready for production use, and
we encourage all users to migrate to Go modules for dependency
management. If you are unable to migrate due to a problem in the Go
toolchain, please ensure that the problem has an open issue filed.

Best,
Christian Stewart

On Sat, Jun 6, 2020 at 4:22 PM Christian Stewart <christian@paral.in> wrote:
>
> Hi all,
>
>
> On Sat, Feb 29, 2020 at 11:52 PM Christian Stewart <christian@paral.in> wrote:
> > This commit moves from the GOPATH mechanism to the new GO111MODULE approach for
> > Go based packages. Old Go packages compile with small tweaks.
> >
> > The Go module system replaces the GOPATH mechanism by allowing the Go tool to
> > work with packages correctly without a GOPATH tree.
>
> I have been using this series for everything, including my daily
> driver, since submitting this patch.
>
> It works fine and most importantly works with both the old vendor/
> approach as well as the new go.mod approach.
>
> In this version of the series the Go compiler is never asked to
> download anything. It merely replaces the old "gopath" hacks that were
> in place before. A future patch series on top of this one would add
> support for Go downloading packages as well, however, for now that is
> not part of this series. This is as minimal as possible.
>
> I recommend merging the series as is (in v3) as soon as possible.
>
> Best regards,
> Christian Stewart
