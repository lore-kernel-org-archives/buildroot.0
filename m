From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Sep 2011 13:39:56 +0200
Subject: [Buildroot] [PATCH 2 of 5] toolchain-external: allow
 downloading a custom toolchain
In-Reply-To: <CAAXf6LX6M11OQSFbPH-hfsPPGdFgX-bq09SDhrdkVM9RhtrLkQ@mail.gmail.com>
References: <patchbomb.1316588130@localhost6.localdomain6>
 <d181fc061658f56665ec.1316588132@localhost6.localdomain6>
 <20110921095843.453ca812@skate>
 <CAAXf6LX5Fxme9tHcKVmk92Z2E4cptuGCQ7wyGUZO3PbZQeoZXw@mail.gmail.com>
 <CAAXf6LX6M11OQSFbPH-hfsPPGdFgX-bq09SDhrdkVM9RhtrLkQ@mail.gmail.com>
Message-ID: <20110921133956.74a14f13@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 21 Sep 2011 10:23:39 +0200,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> By the way, the reason that I made the SITE / SOURCE distinction is
> that this is how the CodeSourcery toolchains are handled. If we are to
> merge SITE and SOURCE into one, I think we should do it for the
> CodeSourcery toolchains as well...

For the CodeSourcery toolchain, the SITE/SOURCE distinction is only
inside the .mk file, i.e it is not visible to the user. My comment was
strictly about what we present to the user in terms of configuration
options, and for this, I'd like to see a single "URL" option rather
than separate SITE/SOURCE.

Now, whether we should have separate SITE/SOURCE or a single URL for
the hardcoded CodeSourcery toolchains, I don't really care. Maybe
having a single URL is simpler, and the URL just gets split in
site/source when calling the download helper.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
