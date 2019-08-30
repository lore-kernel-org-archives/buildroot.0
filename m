From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Aug 2019 22:28:00 +0200
Subject: [Buildroot] [PATCH v2 5/7] package/prboom: avoid using
 hardcoded optimization flags
In-Reply-To: <20190803153136.727eb902@windsurf.home> (Thomas Petazzoni's
 message of "Sat, 3 Aug 2019 15:31:36 +0200")
References: <20190626125900.48230-1-giulio.benetti@micronovasrl.com>
 <20190626125900.48230-6-giulio.benetti@micronovasrl.com>
 <20190803153136.727eb902@windsurf.home>
Message-ID: <87d0gmiejz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Wed, 26 Jun 2019 14:58:58 +0200
 > Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

 >> Package prboom builds using -O2 flag ignoring Buildroot settings, this
 >> is due to the fact that -O2 is appended at the end of compiler flags.
 >> 
 >> Remove -O2 from 'configure.ac' file and set PRBOOM_AUTORECONF to YES,
 >> this way CFLAGS_OPTS will contain Buildroot TARGET_CFLAGS.
 >> 
 >> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>

 > Your proposed solution is not ideal, because it really only prevents
 > prboom from adding -O2, but not any other option. A better solution
 > would have been to make sure that CFLAGS passed as ./configure
 > environment or arguments appear *after* the CFLAGS defined by the
 > configure.ac, so they can all be overridden. But well, that is too much
 > effort for a completely unmaintained piece of software, so I applied
 > your patch as-is.

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
