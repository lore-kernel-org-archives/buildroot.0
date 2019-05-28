From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 28 May 2019 20:32:41 +0200
Subject: [Buildroot] Npm install fails if package ships precompiled
 binaries
In-Reply-To: <CAO-fR8QiuXBh=Vmh95B98UpkDrjLfTXnkPJ7rL1bJvXdVnQ-Fw@mail.gmail.com>
References: <442f0048-d81d-8172-3efa-44cb80b34ac0@mind.be>
 <CAH7nf8mdxiq2962Lch1xrkhpHms1nhoL+jXQNo22rYu6JPhttQ@mail.gmail.com>
 <CAH7nf8=GgAb1Hnorb0QRQZ6Y5ByWEV=B7b12yxcDyFcSyJHpXw@mail.gmail.com>
 <5977f0cb-c6b0-f93c-40e7-d8920a527883@mind.be>
 <CAO-fR8QiuXBh=Vmh95B98UpkDrjLfTXnkPJ7rL1bJvXdVnQ-Fw@mail.gmail.com>
Message-ID: <4ddd3d3e-032d-3eb0-8427-dcbe01642e1f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28/05/2019 10:44, Valerio Crini wrote:
> Hi Arnout,
> I've prepared the patch on behalf of Stefano.
> Do you prefer I send the patch generated
> with??https://buildroot.org/downloads/manual/manual.html#submitting-patches?
> with?/git send-email/?or attached to this?email?

 Please follow the manual and use git send-email.

 Note that if Stefano is the author, then he should be specified as the author
(you can do that after the fact by using `git commit --amend --author=...`). He
should also add his Signed-off-by. This is a short way for to assert that he is
entitled to contribute the patch under buildroot's GPL license. See
http://elinux.org/Developer_Certificate_Of_Origin for more details. For the same
reason, you should also add your Signed-off-by.

 If you really are the author, then your Signed-off-by is sufficient.

 Regards,
 Arnout


> 
> Il giorno dom 26 mag 2019 alle ore 15:09 Arnout Vandecappelle <arnout@mind.be
> <mailto:arnout@mind.be>> ha scritto:
> 
> 
> 
>     On 15/05/2019 15:07, Stefano Guandalini wrote:
>     > I'm building for ARM 64 on an x86_64 but I think the issue comes because
>     the npm
>     > package is shipped with binaries for "all" arch.
> 
>     ?Okay, so we should exclude /usr/lib/node_modules from the architecture check
>     then. This means we wouldn't capture the cases where the npm module really
>     doesn't supply binaries for the correct architecture. But I guess if you're
>     using npm, you're lost anyway :-P.
> 
>     ?Stefano, care to prepare a patch that adds this exception to the IGNORES list
>     in support/scripts/check-bin-arch (with the appropriate comment).
> 
>     ?Regards,
>     ?Arnout
> 
