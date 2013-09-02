From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Sep 2013 22:54:29 +0200
Subject: [Buildroot] [PATCH 1 of 9 v4] Config.in.legacy: update
 description for developers
In-Reply-To: <da9c19eca655653a9e82.1378152470@argentina>
References: <patchbomb.1378152469@argentina>
 <da9c19eca655653a9e82.1378152470@argentina>
Message-ID: <20130902225429.1f310dfd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Mon, 02 Sep 2013 22:07:50 +0200, Thomas De Schampheleire wrote:

> The existing comments in Config.in.legacy are not entirely in-line with
> current practice. The comments implies that BR2_LEGACY should not be set when
> the conversion from old-to-new symbol can be done automatically using the
> appropriate 'select' statements. However, none of the existing legacy options
> does it this way. Moreover, I think it's intentional that the user is notified
> of the change, so that the removal of the legacy options in later buildroot
> versions no longer poses a problem.

Does what we are doing today really makes sense? For example, option
BR2_PACKAGE_FOO_BAR is renamed to BR2_PACKAGE_FOO_BARBLEH.
BR2_PACKAGE_FOO_BAR is added to Config.in.legacy, with a message like
"Option bar for package foo has been renamed barbleh". So the user goes
into the sub-options of package "foo"... and discovers that barbleh is
already enabled. So he kind of wonders what sort of drug Buildroot
developers are taking, no?

When there is a direct 1:1 mapping between the old option and the new
option, is it really necessary to select BR2_LEGACY ?

Shouldn't be select BR2_LEGACY only when there is really a change in
behavior (like a package has been entirely removed, or a feature like
toolchain on target has been removed) ?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
