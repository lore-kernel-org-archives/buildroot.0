From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 Oct 2016 18:52:43 +0200
Subject: [Buildroot] [PATCH 00/51] TLP/PPS: intro, package cleanup.
In-Reply-To: <d8e3ec4c46175ca4d852efcfdea65c19@free-electrons.com>
References: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <6e24662f-d0fd-461e-0059-6f2e23273480@mind.be>
 <d8e3ec4c46175ca4d852efcfdea65c19@free-electrons.com>
Message-ID: <c6791be8-032d-f800-0d2d-3b9597d05415@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17-10-16 18:02, Gustavo Zacarias wrote:
[snip]
> And then there's PPL (Per-Package Logging) since looking at the output when
> building TLP makes debugging very hard, so having a per-package
> configure/build/install/etc log will make life easier (with a decent playback
> when things go bad).

 Would be great, but isn't that super-complicated or wouldn't it require major
surgery to the infrastructure? You'd need to somehow amend the _CMDS to redirect
their output, or run every package in a separate sub-make, or something like that...

[snip]
> I'm toying with the idea of a sandbox as well that will just restrict the view
> of the full staging area per-package to the dependencies it needs (LD_PRELOADed).
> This would alleviate the overhead in copying/linking all those files, but it's a
> bit more complex.

 Yeah, perhaps we should use bitbake instead of make :-P

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
