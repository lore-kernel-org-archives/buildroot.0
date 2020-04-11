From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Apr 2020 16:19:03 +0200
Subject: [Buildroot] [PATCH 7/8] core/show-info: report the ordered list
 of build steps
In-Reply-To: <CAB4xu_1Bv4gsebOQrUfKM_ChD6q7-e15YTGPqwj4PBx3hzkrOA@mail.gmail.com>
References: <cover.1586592741.git.yann.morin.1998@free.fr>
 <93a3545d1fe7b47cdfb32edc7db3fd54600fecd9.1586592741.git.yann.morin.1998@free.fr>
 <20200411103950.4a21b23e@windsurf.home>
 <CAB4xu_1Bv4gsebOQrUfKM_ChD6q7-e15YTGPqwj4PBx3hzkrOA@mail.gmail.com>
Message-ID: <20200411161903.7b007feb@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 11 Apr 2020 09:41:47 -0400
Philippe Proulx <eeppeliteloop@gmail.com> wrote:

> Replying for patch 6/8 and this one.
> 
> Is the `show-info` target considered a public API?

Somewhat yes: the goal of show-info is that people can craft their own
tooling on top of it. Breaking the show-info output would break such
tools.

> If so, without a
> version, it means it can never break. So let me suggest another layout
> which breaks `show-info` (name it `show-info-2` if you will).
> 
> Output example (using YAML only for clarity here):

[...]

This could certainly work, and reduces a bit the duplication of
information.

However, I still don't understand why your tool is not capable of
having this knowledge about the stamp files. This is something that
rarely changes. I think we haven't changed the stamp files since... 5
years? More? If your tool is in the Buildroot tree itself, it can
simply be updated if there is ever a change in the sequencing of steps.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
