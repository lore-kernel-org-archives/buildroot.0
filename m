From: Ulf Samuelsson <ulf@atmel.com>
Date: Sat, 7 Jul 2007 16:10:16 +0200
Subject: [Buildroot] <package>_VER vs <package>_VERSION
Message-ID: <004201c7c0a2$9420c900$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some packages use <package>_VER  and some use  <package>_VERSION
and some does not use this at all and hardcodes the version.

Suggest we clean this up so we use a single template.

Suggest we do it using the following template, allowing user to override.

ifeq    ($(<package>_VERSION),)
<package>_VERSION:=X.Y.Z
endif

Best Regards
Ulf Samuelsson
