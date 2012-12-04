From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Dec 2012 10:17:16 +0100
Subject: [Buildroot] [PATCH v2] xtensa: add config option to enable
 longcalls option
In-Reply-To: <50BDB610.7080304@zankel.net>
References: <50bc6a34.45e8440a.493d.4091@mx.google.com>
 <20121203140912.1e09f0ea@skate> <50BDB610.7080304@zankel.net>
Message-ID: <20121204101716.428c2f20@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Tue, 04 Dec 2012 00:36:32 -0800, czankel wrote:

> > Do we really want that as a configurable option? Isn't it possible
> > instead to always generate longcalls, or to fix this on a per-package
> > basis, when needed?
> The actual distance between call and destination is probably very 
> dependent on compiler versions and compile options, etc., so might be 
> hard to figure out what packages are affected. We might end up with a 
> lot of packages with special Xtensa  'treatments'. Probably better to 
> just have it always there.

Hum, right.

> It should actually be fine to always compile with the longcalls option, 
> but I didn't just want to change it without having the option to keep 
> the old behavior, hence the option.

I'd prefer to have it always enabled, I'd say. We try to not add
gazillions of very detailed architecture-specific options that are
hard to understand. Hardcore users will know how/where to remove this
option is they need, or they can even override it by passing a
-mno-longcalls option in BR2_TARGET_OPTIMIZATION.

What do you think?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
