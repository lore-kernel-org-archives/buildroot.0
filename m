From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 15 Aug 2014 11:23:50 +0200
Subject: [Buildroot] [git commit branch/next] erlang: bump to version 17.1
Message-ID: <20140815092504.0B7E19C769@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7abc724b78519895b95b43175b45eb7d244716ea
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Erlang/OTP 17.1 is a service release on the 17 track with mostly bug
fixes, but it does contain a number of new features and characteristics
improvements as well.

Some highlights of the release are:
  - crypto: Add aes_cfb8 cypher to crypto:block_encrypt and block_decrypt.
  - diameter: Add result code counters for CEA, DWA, and DPA.
  - erts: The following built in functions in the erlang and binary modules
    now bump an appropriate amount of reductions and yield when out of
    reductions:
    binary_to_list/1, binary_to_list/3, bitstring_to_list/1,
    list_to_binary/1,
    iolist_to_binary/1, list_to_bitstring/1, binary:list_to_bin/1
  - hipe: Handle Maps instructions get_map_elements, put_map_assoc,
    put_map_exact in the HiPE native code compiler.
  - mnesia: The time for inserting locks for a transaction with large
    number of locks is reduced significantly.
  - ssh: Option max_sessions added to ssh:daemon/{2,3}.
  - stdlib: Add maps:get/3 to maps module. The function will return the
    supplied default value if the key does not exist in the map.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/erlang/erlang.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index 1278682..5474952 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_VERSION = 17.0
+ERLANG_VERSION = 17.1
 ERLANG_SITE = http://www.erlang.org/download
 ERLANG_SOURCE = otp_src_$(ERLANG_VERSION).tar.gz
 ERLANG_DEPENDENCIES = host-erlang
