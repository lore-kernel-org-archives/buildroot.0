From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 12:12:12 +0200
Subject: [Buildroot] [PATCH] support/testing: test_python_django: use
 the timeout_multiplier value
In-Reply-To: <20200411145750.7655-1-romain.naour@gmail.com>
References: <20200411145750.7655-1-romain.naour@gmail.com>
Message-ID: <20200412121212.5f0cb78b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 11 Apr 2020 16:57:50 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> As reported by our gitlab runtime test [1] and on the mailing list [2],
> the test_python_django is failing only on gitlab due to slow (but free)
> gitlab runners.

The particular job you point to was running on gcc159, not on a free
Gitlab runner. All the CI done on the official Buildroot Gitlab account
is done on our own machines (gcc159, gcc160, Mind build server and
Bootlin build server), not on free Gitlab runners.

That being said, it makes complete sense to use the timeout_multiplier
here, so I've slightly tweaked your commit log and applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
