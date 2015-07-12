From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 12 Jul 2015 16:39:47 +0200
Subject: [Buildroot] [RFC v4 02/16] packages: for staging stuff use
 backtick instead of the shell function
In-Reply-To: <1435520570-20332-3-git-send-email-fabio.porcedda@gmail.com>
References: <1435520570-20332-1-git-send-email-fabio.porcedda@gmail.com>
 <1435520570-20332-3-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <55A27C33.50206@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/28/15 21:42, Fabio Porcedda wrote:
> When the shell function execute the command before the per-package
> staging directory is created, use the backtick that is executed after
> the per-package staging directory is created.
> 
> This commit prevents build failures when the per-package staging feature
> is added.

 At first, I was pretty opposed to this change because I like make more than
shell :-)

 However, it also fixes another issue: make printvars prints a lot of errors in
addition to the real thing, because it evaluates all those $(shell ...)
variables while the programs they call or not defined yet.

 But for that, a lot more needs to be changed. So I've taken this over and
posted a patch series [1] that removes all the $(shell ...) calls.


 Regards,
 Arnout

[1] http://patchwork.ozlabs.org/patch/494127/

> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
