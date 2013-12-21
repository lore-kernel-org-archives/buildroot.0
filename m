From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Dec 2013 19:01:42 +0100
Subject: [Buildroot] How to create the package from software using
 "bootstrap" to configure?
In-Reply-To: <CAMduVEdFGug0_xhipRUJqnhMCELZ72Q6vcZLhWVAQzDdbBDuyA@mail.gmail.com>
References: <CAMduVEcRz63T4e5Fa_4iDm-H9e9RuOWkDMNTXAHe6VtZsLXhtg@mail.gmail.com>
 <20131221144653.4af8deff@skate>
 <CAMduVEdFGug0_xhipRUJqnhMCELZ72Q6vcZLhWVAQzDdbBDuyA@mail.gmail.com>
Message-ID: <20131221190142.2b544e69@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Wojciech Zabolotny,

On Sat, 21 Dec 2013 18:54:57 +0100, Wojciech Zabolotny wrote:

> Thanks. I have created Config.in and avrdude.mk as attached, and they
> seem to work (however I want to test it better before I submit the
> patch proposal).

Looks pretty good. A few comments:

 * In the Config.in file, you need to inherit the dependencies of the
   libraries you're selecting. For example, libusb depends on thread
   support, so avrdude should depend on thread support. See
   http://buildroot.org/downloads/manual/manual.html#dependencies-target-toolchain-options
   for details.

 * In your .mk file, use the github helper function instead of a
   complete github URL.

 * The license is GPLv2+, not GPLv2.

 * You should add AVRDUDE_LICENSE_FILES = avrdude/COPYING

 * You should remove the AVRDUDE_INSTALL_TARGET line, since YES is
   the default value.

 * You should add a comment on top of the AUTORECONF line explaining
   why it is needed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
