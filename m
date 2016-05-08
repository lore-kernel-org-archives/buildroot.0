From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 8 May 2016 09:51:32 -0300
Subject: [Buildroot] [PATCH 09/34] reproducibility/libglib2: allow
 removing codegen
In-Reply-To: <20160507152801.1eab6310@free-electrons.com>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 <1462002570-14706-9-git-send-email-gilles.chanteperdrix@xenomai.org>
 <20160507152801.1eab6310@free-electrons.com>
Message-ID: <572F3654.6000301@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/05/16 10:28, Thomas Petazzoni wrote:

> Which has the annoying side effect of increasing even more the set of
> mandatory dependencies to build libglib :-/
>
> So I wonder if the dependency on host-python should be made conditional
> on BR2_REPRODUCIBLE.

Hi.
Generally, there's no use case of having gdbus-codegen in the target 
since it's used at build time.

> Since then, Gustavo has already modified the libglib2 package to
> remove the /usr/share/glib-2.0/codegen directory. However,
> gdbus-codegen is not removed.
>
> See commit 1f1f16e9e5367048faa1cf17237e0c0d422e98d6.

Exactly, gdbus-codegen is a leftover that i missed, it can be safely 
removed.
Regards.
