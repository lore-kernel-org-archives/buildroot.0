From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Oct 2020 23:07:07 +0200
Subject: [Buildroot] Separate Host and Target patches
In-Reply-To: <CADjezmY7Zy6kUVa-dULzzLTdph_tQC26VXNKMDpWdO9jYAUWPg@mail.gmail.com>
References: <CADjezmY7Zy6kUVa-dULzzLTdph_tQC26VXNKMDpWdO9jYAUWPg@mail.gmail.com>
Message-ID: <20201008230707.04748fa5@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Matt,

On Thu, 8 Oct 2020 16:51:27 -0400
mattwood2000 at gmail.com wrote:

> is it possible to separate host and target patches?  For example, lets say
> I have a package foo that has a dependency of host-foo.  But, I need to
> apply different patches against the package Makefile for the host and
> target builds.
> 
> I didn't really see this usecase in the docs or in other package examples.

No, there should be no reason to have different patches for the host
and target variant of a package. Indeed, ideally, packages should not
have patches: such patches should be submitted to the upstream project.
And the upstream project will not have a variant of itself "for the
host" and another "for the target".

This clearly illustrates that having different sets of patches for the
host and target variant doesn't make sense. Instead, the patches you
have should be correct, potentially acceptable by the upstream project
and work regardless of whether the package is being built for the host
or for the target.

Does this help?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
