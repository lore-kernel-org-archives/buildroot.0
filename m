From: James Peach <jorgar@gmail.com>
Date: Mon, 28 Oct 2019 21:33:43 +1100
Subject: [Buildroot] [PATCH 1/1] package/runc: add an option to build a
 non-static runc
In-Reply-To: <49B3B0E8-0B7D-4E55-9C19-4D48D6047BFE@gmail.com>
References: <20191023093431.2220-1-jorgar@gmail.com>
 <87pnikixjm.fsf@dell.be.48ers.dk>
 <49B3B0E8-0B7D-4E55-9C19-4D48D6047BFE@gmail.com>
Message-ID: <39CD8148-1BF7-450D-99BF-4A070B22CA2A@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



> On Oct 26, 2019, at 8:19 AM, James Peach <jorgar@gmail.com> wrote:
> 
> 
> 
>> On Oct 26, 2019, at 3:45 AM, Peter Korsgaard <peter@korsgaard.com> wrote:

[snip]

>> If yes, what is the advantage of linking runc statically?
> 
> I don?t know why this package was originally linking statically, which was why I kept the default. I didn?t want to break someone?s use case that I didn?t know about :)
> 
> Your question make we go check upstream, and the build tag was introduced to fix a build warning about a dependency on dlopen:
> 
> https://github.com/opencontainers/runc/commit/e9944d0f4cebd26f27fdb7407740c32a9194c386
> 
> However, I don?t think that upstream needs this any more so maybe I can remove the build tag from the systemd integration.

I experimented a bit more with this. IIUC the Go builder for runc doesn?t actually build a static binary and the systemd driver build no longer fails when you do force a static binary, so I submitted a PR to upstream to remove the `static_build` build tag.

I think that we can just drop this patch. I?m just filtering out the bad build tag before I run buildroot. If upstream take my PR, this will be fixed when buildroot updates runc.

J
