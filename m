From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri,  4 Jul 2014 17:56:23 +0200
Subject: [Buildroot] [PATCH 0/3] Make exim more configurable
Message-ID: <1404489386-7523-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this small patch series makes the exim mail transfer agent more configurable
at build time.

Exim does not use a framework such as the autotools or CMake for its
build-time configuration. Instead it requires to provide a Makefile
(./Local/Makefile) with variables set appropriately. This Makefile is then
included by the main Makefile.

These patches allow to use a custom configuration Makefile provided by the
user and to tweak (in the Buildroot config) the user that will run the exim
processes.

Luca

Luca Ceresoli (3):
  exim: allow using a custom configuration file
  exim: make EXIM_USER configurable
  exim: generate the user with automatic uid

 package/exim/Config.in | 34 ++++++++++++++++++++++++++++++++++
 package/exim/exim.mk   | 28 ++++++++++++++++++++++++++--
 2 files changed, 60 insertions(+), 2 deletions(-)

-- 
1.9.1
