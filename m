From: Pascal Huerst <pascal.huerst@gmail.com>
Date: Wed, 25 Jun 2014 15:16:12 +0200
Subject: [Buildroot] [PATCH V5 0/2] google-breakpad: new package
Message-ID: <1403702174-23850-1-git-send-email-pascal.huerst@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changes v4 -> v5 (All suggested by Yann E. MORIN)
	Fixed some typo
	Reorganized patch structure
	  which parts belong to 'new package' and which parts belong to
	  'intergration into Makefile and Config.in'
	Changed and Rewrote gen-symy.sh - script
	  Passing $(EXTRA_ENV)
	  Adapted a proposed solution from Yann E. MORIN, which
	  uses ls instead of find commands
	Made better descriptions for users in:
	  Config.in
	  package/google-breakpad/Config.in

Changes v3 -> v4
	Fixed minor issue in google-breakpad_gen-syms.sh
	  Had to remove -print from find command

Changes v2 -> v3 (All suggested by thomas.petazzoni at free-electrons.com)
        Removed dependency of BR2_ENABLE_DEBUG, but added comment,
          that this flag might have to be set in order to use breakpad
          properly.
        Removed "find -name ..." for libs and binaries by generic patterns,
          such as "*.so" and so forth. This will never work properly. Instead
          I added a list to insert libs and binaries, that will be symbol-
          dumped and prepared for breakpad (see Config.in patch v3 2/2)
        Changed storage path for dumps from: $(TARGET_DIR).. to
          $(STAGING_DIR)/usr/share/google-breakpad-symbols/
        Removed most logic from Makefile. Added script instead, which is
          called by Makefile
        Added dependency for compatible targets: ARM, i386, MIPS...
        Set fixed version for checkout (instead of head)
        Fixed typos, and some minor mistakes

Changes v1 -> v2 (All suggested by maxime.hadjinlian at gmail.com)
        Added dependency from BR2_ENABLE_DEBUG
        Removed symbolstore.py -> Its all done in Makefile now
        Removed new Target -> It in target-finalize before stripping now
        Added LICENSE and LICENSE_FILE to *.mk

Pascal Huerst (2):
  google-breakpad: new package
  google-breakpad: integration into Makefile and Config.in

 Config.in                                  | 14 ++++++++++++++
 Makefile                                   |  5 +++++
 package/Config.in                          |  1 +
 package/google-breakpad/Config.in          | 22 ++++++++++++++++++++++
 package/google-breakpad/gen-syms.sh        | 25 +++++++++++++++++++++++++
 package/google-breakpad/google-breakpad.mk | 17 +++++++++++++++++
 6 files changed, 84 insertions(+)
 create mode 100644 package/google-breakpad/Config.in
 create mode 100755 package/google-breakpad/gen-syms.sh
 create mode 100644 package/google-breakpad/google-breakpad.mk

-- 
1.9.3
