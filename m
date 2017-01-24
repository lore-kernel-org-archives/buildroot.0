From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jan 2017 23:14:18 +1300
Subject: [Buildroot] [PATCH 1/2] vala: fix package suffix
In-Reply-To: <20170112133831.12223-1-Vincent.Riera@imgtec.com>
References: <20170112133831.12223-1-Vincent.Riera@imgtec.com>
Message-ID: <20170124231418.3d5f2985@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 12 Jan 2017 13:38:30 +0000, Vicente Olivert Riera wrote:
> vala executable has a suffix and we reffer to it in our vala wrapper,
> but we assume that suffix is always the same as the major version. This
> can be wrong, so better to obtain the suffix number from the config.h
> file.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Nope, that is not needed I believe.

Like all Gnome projects, 0.35 is not a stable vala version, so there's
no reason to package it. And I guess that also explains why vala 0.35
still uses 0.34 as the package suffix.

So, by not package a development version, we also don't need this "fix
package suffix" patch.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
