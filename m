From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Oct 2011 09:04:28 +0200
Subject: [Buildroot] Question: := vs = in package *.mk files
In-Reply-To: <ADE657CA350FB648AAC2C43247A983F001F39DCFE6DB@AUSP01VMBX24.collaborationhost.net>
References: <ADE657CA350FB648AAC2C43247A983F001F39DCFE6DB@AUSP01VMBX24.collaborationhost.net>
Message-ID: <20111005090428.34c8f565@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 4 Oct 2011 19:55:48 -0500,
H Hartley Sweeten <hartleys@visionengravers.com> a ?crit :

> The Buildroot documentation shows using '=' when setting variables
> in the package *.mk file.  Some of the existing packages use ':='
> instead.  What's the difference?  Should the existing packages be
> updated?

The difference is explained in the make documentation:


"""

   The first flavor of variable is a "recursively expanded" variable.
Variables of this sort are defined by lines using `=' (*note Setting
Variables: Setting.) or by the `define' directive (*note Defining
Variables Verbatim: Defining.).  The value you specify is installed
verbatim; if it contains references to other variables, these
references are expanded whenever this variable is substituted (in the
course of expanding some other string).

[...]

"Simply expanded variables" are defined by lines using `:=' (*note
Setting Variables: Setting.).  The value of a simply expanded variable
is scanned once and for all, expanding any references to other
variables and functions, when the variable is defined.  The actual
value of the simply expanded variable is the result of expanding the
text that you write.  It does not contain any references to other
variables; it contains their values _as of the time this variable was
defined_. 

"""

See http://www.gnu.org/software/make/manual/make.html#Flavors

In package definition, Peter has said that he preferred the usage of
'=' except when it would create a noticeable performance problem. So
for all package definitions such as _SITE, _VERSION, _SOURCE,
_AUTORECONF, _INSTALL_STAGING, etc. the '=' sign is the one to choose.

Of course, a lot of packages do not comply with this rule, but this
will be fixed progressively over time as we update packages.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
