From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 29 Jun 2020 14:07:38 +0200
Subject: [Buildroot] [PATCH=2020.02.x] package/redis: bump version to
 5.0.9
In-Reply-To: <CAAXf6LWhoLwig3i8FNjC3OQ65h27y50cbu5ROZkBHKnnXsjSUw@mail.gmail.com>
References: <20200621213921.11923-1-peter@korsgaard.com>
 <8cb0702e-2c5d-553b-5793-681ddc619130@railnova.eu>
 <CAAXf6LWhoLwig3i8FNjC3OQ65h27y50cbu5ROZkBHKnnXsjSUw@mail.gmail.com>
Message-ID: <20200629140738.7dd4749d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 29 Jun 2020 12:51:02 +0200
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

> Which reminds me of the fact that the package stats and associated CVE
> detection is currently only running on the master branch (that I know of).
> Which means that we are missing the CVE detection on the LTS branch.
> Does it take a lot of resources / Is it hard to do, enabling this on the
> LTS branch too (mostly the CVE part) ?

Running pkg-stats on other branches is really easy, I can make it
generate autobuild.buildroot/stats/2020.02.x.{html,json} for example.

However, what needs a bit more effort is to modify the e-mail
notification script to make use of that.

Note that my colleague Gr?gory is working on improving the CVE
infrastructure so that you can run a script on your specific Buildroot
version and configuration, and get the list of CVEs you are affected
by. I.e the same results as pkg-stats, but really tailored to your
Buildroot version/configuration. Hopefully Gr?gory will send the
patches soon.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
