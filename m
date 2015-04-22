From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Apr 2015 23:11:43 +0200
Subject: [Buildroot] [RFC v2 0/5] common service startup files
In-Reply-To: <cover.1428263859.git.alex.suykov@gmail.com>
References: <cover.1428263859.git.alex.suykov@gmail.com>
Message-ID: <20150422231143.2b2921e2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alex Suykov,

On Mon, 6 Apr 2015 01:01:19 +0300, Alex Suykov wrote:
> This series is intended to simplify and clean up installation routine
> for daemon-like applications, merging sysv and systemd startup files
> and moving much of the common code out of per-package .mk files.
> 
> Currently buildroot requires pre-crafted sysv and/or systemd startup
> files to be supplied for each package that needs its daemon-like
> processes started at system boot. In many cases, this is redundant.
> 
> Only a small part of the startup scripts is package-specific.
> A single command, the one that starts the process in foreground mode,
> is typically enough to generate usable sysv and systemd startup files.
> 
> Separating package-specific data and removing the rest from package
> directories allows changing common code without the need to patch
> several dozen packages, ensures more or less even support for sysv
> and systemd, and potentially simplifies introduction of alternative
> system startup schemes. 
> 
> The first patch in the series contains the common code, and the rest
> show how it affects individual packages. I'm only posting a few
> interesting ones with comments; the full set (~50 patches) is available
> here: https://github.com/arsv/br/ branch run-1.

Thanks for this proposal. However, as you have seen, the general
feedback was not very positive. We don't really like having a
specialized language being created for Buildroot, so the overall
approach doesn't really match the "spirit" of how things are done in
Buildroot.

I've marked the corresponding patches as rejected in our patch tracking
system.

Thanks for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
