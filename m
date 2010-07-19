From: Mitch Davis <mjd+buildroot@afork.com>
Date: Mon, 19 Jul 2010 12:29:36 +1000
Subject: [Buildroot] Full config files for each board are yucky.
Message-ID: <AANLkTimWP0NejW9l0IQSazcaldVaJu0dySV8bGsqh3Wo@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 13, 2010 at 7:30 AM, Luca Ceresoli <luca@lucaceresoli.net> wrote:
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
> ?Config.in ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? | ? ?4 ++--
> ?configs/arm_toolchain_defconfig ? ? ? ? ? | ? ?2 +-
> ?configs/at91rm9200df_defconfig ? ? ? ? ? ?| ? ?2 +-
> ?configs/at91rm9200df_ext_bare_defconfig ? | ? ?2 +-
> ?configs/at91rm9200df_ext_defconfig ? ? ? ?| ? ?2 +-
> ?configs/at91sam9260dfc_defconfig ? ? ? ? ?| ? ?2 +-
> ?configs/at91sam9260dfc_ext_bare_defconfig | ? ?2 +-
> ?configs/at91sam9260dfc_ext_defconfig ? ? ?| ? ?2 +-
> ?configs/at91sam9261ek_defconfig ? ? ? ? ? | ? ?2 +-
> ?configs/at91sam9261ek_ext_bare_defconfig ?| ? ?2 +-
> ?configs/at91sam9261ek_ext_defconfig ? ? ? | ? ?2 +-
> ?configs/at91sam9263ek_defconfig ? ? ? ? ? | ? ?2 +-
> ?configs/at91sam9263ek_ext_bare_defconfig ?| ? ?2 +-
> ?configs/at91sam9263ek_ext_defconfig ? ? ? | ? ?2 +-
> ?configs/at91sam9g20dfc_defconfig ? ? ? ? ?| ? ?2 +-
> ?configs/at91sam9g20dfc_ext_bare_defconfig | ? ?2 +-
> ?configs/at91sam9g20dfc_ext_defconfig ? ? ?| ? ?2 +-
> ?configs/atngw100-base_defconfig ? ? ? ? ? | ? ?2 +-
> ?configs/atngw100_defconfig ? ? ? ? ? ? ? ?| ? ?2 +-
> ?configs/atstk1005_defconfig ? ? ? ? ? ? ? | ? ?2 +-
> ?configs/atstk100x_defconfig ? ? ? ? ? ? ? | ? ?2 +-
> ?configs/i386_defconfig ? ? ? ? ? ? ? ? ? ?| ? ?2 +-
> ?configs/i686_defconfig ? ? ? ? ? ? ? ? ? ?| ? ?2 +-
> ?configs/integrator926_defconfig ? ? ? ? ? | ? ?2 +-
> ?configs/integrator926_huge_defconfig ? ? ?| ? ?2 +-
> ?configs/kb9202_defconfig ? ? ? ? ? ? ? ? ?| ? ?2 +-
> ?configs/v100sc2_defconfig ? ? ? ? ? ? ? ? | ? ?2 +-
> ?27 files changed, 28 insertions(+), 28 deletions(-)

<rant>That *every* defconfig file needs to be changed indicates a
failing of the present system, where we have pre-canned config files
for every board, that need ongoing maintenance whenever something in
the Kconfig files change.</rant>

I have an alternative config system where every board inherits config
options from something else (ultimately the defaults in the config
system), then a board can turn on and off and set options which are
relevant to that board.  BR2_GIT would only need to be changed in one
place, if at all.  I'll clean it up and publish it, if anyone's
interested...

Mitch.
