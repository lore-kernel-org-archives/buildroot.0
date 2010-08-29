From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Aug 2010 11:58:12 +0200
Subject: [Buildroot] [git commit master 1/1] Config.in: mark
 BR2_CONFIG_CACHE as experimental and disable by default
In-Reply-To: <20100825153147.4915689016@busybox.osuosl.org>
References: <20100825153147.4915689016@busybox.osuosl.org>
Message-ID: <20100829115812.17ac0bb5@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 25 Aug 2010 17:30:38 +0200
Peter Korsgaard <jacmet@sunsite.dk> wrote:

> commit:
> http://git.buildroot.net/buildroot/commit/?id=b680672ad1b1c45e23cf89ddb217616274d68dee
> branch:
> http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> As it is known to break with certain package combinations.

Can we take some sort of official decision about this ? Supporting the
configuration cache thing is not just having an option or not, it's
also all the patches that we're adding to fix the issues found here and
there (libglib2, lzo, etc.).

If we decide to completely drop the configuration cache, then we can
remove these patches (and since they often patch the configure.{in,ac}
files, those patches involved adding <pkg>_AUTORECONF = YES to the
package).

However, if we intend to keep it in the hope to re-enable it
by default in the future, we have to keep these patches, and put some
effort in fixing all other issues that we face with the configuration
cache enabled.

Cheers,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
