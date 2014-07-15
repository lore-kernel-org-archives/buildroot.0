From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 15 Jul 2014 10:44:01 -0300
Subject: [Buildroot] [PATCH 2/3] infra: add gettextize run in AUTORECONF
In-Reply-To: <20140714212346.5ef7bfad@free-electrons.com>
References: <1405186024-8170-1-git-send-email-gustavo@zacarias.com.ar>	<1405186024-8170-2-git-send-email-gustavo@zacarias.com.ar>	<20140714130104.480ab4cf@free-electrons.com>	<53C405A3.3080301@mind.be>
 <20140714212346.5ef7bfad@free-electrons.com>
Message-ID: <53C53021.5080305@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/14/2014 04:23 PM, Thomas Petazzoni wrote:

> Actually, I am not worried about the duration of the gettextize step
> itself, but worried about the fact that host-gettext now gets
> unconditionally added to all packages that have <pkg>_AUTORECONF = YES,
> while this gettextize is probably not needed for the majority of them.
> So we pull-in a fairly heavy dependency (host-gettext) for no reason
> for such packages.

At least libffi doesn't like getting gettextized, probably some stray
gettext bits in it's build stuff without really using it.
So i'm leaning towards PKG_GETTEXTIZE, or at least trying to detect if
it's required (a find for gettext.m4 in the package source should suffice).
Regards.
