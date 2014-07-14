From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Jul 2014 21:23:46 +0200
Subject: [Buildroot] [PATCH 2/3] infra: add gettextize run in AUTORECONF
In-Reply-To: <53C405A3.3080301@mind.be>
References: <1405186024-8170-1-git-send-email-gustavo@zacarias.com.ar>
 <1405186024-8170-2-git-send-email-gustavo@zacarias.com.ar>
 <20140714130104.480ab4cf@free-electrons.com>
 <53C405A3.3080301@mind.be>
Message-ID: <20140714212346.5ef7bfad@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Mon, 14 Jul 2014 18:30:27 +0200, Arnout Vandecappelle wrote:

> > I believe I would actually prefer a separate GETTEXTIZE option, I'm a
> > little bit worried about the extra build time. What do others think?
> 
>  I agree with Gustavo that the extra 2 seconds of gettextize are anyway dwarfed
> by the 15 seconds for autoreconf (on my I/O-bound laptop). So I wouldn't bother
> with an extra option.

Actually, I am not worried about the duration of the gettextize step
itself, but worried about the fact that host-gettext now gets
unconditionally added to all packages that have <pkg>_AUTORECONF = YES,
while this gettextize is probably not needed for the majority of them.
So we pull-in a fairly heavy dependency (host-gettext) for no reason
for such packages.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
