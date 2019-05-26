From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 26 May 2019 15:09:06 +0200
Subject: [Buildroot] Npm install fails if package ships precompiled
 binaries
In-Reply-To: <CAH7nf8=GgAb1Hnorb0QRQZ6Y5ByWEV=B7b12yxcDyFcSyJHpXw@mail.gmail.com>
References: <442f0048-d81d-8172-3efa-44cb80b34ac0@mind.be>
 <CAH7nf8mdxiq2962Lch1xrkhpHms1nhoL+jXQNo22rYu6JPhttQ@mail.gmail.com>
 <CAH7nf8=GgAb1Hnorb0QRQZ6Y5ByWEV=B7b12yxcDyFcSyJHpXw@mail.gmail.com>
Message-ID: <5977f0cb-c6b0-f93c-40e7-d8920a527883@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15/05/2019 15:07, Stefano Guandalini wrote:
> I'm building for ARM 64 on an x86_64 but I think the issue comes because the npm
> package is shipped with binaries for "all" arch.

 Okay, so we should exclude /usr/lib/node_modules from the architecture check
then. This means we wouldn't capture the cases where the npm module really
doesn't supply binaries for the correct architecture. But I guess if you're
using npm, you're lost anyway :-P.

 Stefano, care to prepare a patch that adds this exception to the IGNORES list
in support/scripts/check-bin-arch (with the appropriate comment).

 Regards,
 Arnout
