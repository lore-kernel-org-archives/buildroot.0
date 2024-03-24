Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C021C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 17:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B18D40568;
	Sun, 24 Mar 2024 17:11:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Png1tw1kOtda; Sun, 24 Mar 2024 17:11:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBACC40B88
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BBACC40B88;
	Sun, 24 Mar 2024 17:11:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1149D1BF40A
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 17:11:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E1AB4056A
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 17:11:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dDR13RL78hAQ for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 17:11:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 229CF405FC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 229CF405FC
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 17:11:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1B8D583C52; Sun, 24 Mar 2024 17:11:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 17:56:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 958085d5f6a90c46f812c64bbe4ac2963f83bca1
X-Git-Newrev: bc76d786a40548333be5cb9c0833e458498c06dd
X-Patchwork-Hint: ignore
Message-Id: <20240324171117.1B8D583C52@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add bitcoin runtime test
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bc76d786a40548333be5cb9c0833e458498c06dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 DEVELOPERS                                    |   1 +
 support/testing/tests/package/test_bitcoin.py | 184 ++++++++++++++++++++++++++
 2 files changed, 185 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c045a8cd7c..cb2132e67a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1771,6 +1771,7 @@ F:	support/testing/tests/package/test_acpica.py
 F:	support/testing/tests/package/test_acpica/
 F:	support/testing/tests/package/test_apache.py
 F:	support/testing/tests/package/test_bc.py
+F:	support/testing/tests/package/test_bitcoin.py
 F:	support/testing/tests/package/test_brotli.py
 F:	support/testing/tests/package/test_bzip2.py
 F:	support/testing/tests/package/test_compressor_base.py
diff --git a/support/testing/tests/package/test_bitcoin.py b/support/testing/tests/package/test_bitcoin.py
new file mode 100644
index 0000000000..93aa9383ab
--- /dev/null
+++ b/support/testing/tests/package/test_bitcoin.py
@@ -0,0 +1,184 @@
+import os
+import time
+
+import infra.basetest
+
+
+class TestBitcoin(infra.basetest.BRTest):
+    # infra.basetest.BASIC_TOOLCHAIN_CONFIG cannot be used as it does
+    # not include BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
+    # needed by bitcoin. This config also uses an ext4 rootfs as
+    # bitcoind needs some free disk space to start (so we avoid having
+    # a larger initrd in RAM).
+    config = \
+        """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.81"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_PACKAGE_BITCOIN=y
+        BR2_PACKAGE_BITCOIN_WALLET=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_4=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    # Command prefix for the bitcoin command line interface.
+    cli_cmd = "bitcoin-cli -regtest"
+
+    def create_btc_wallet(self, wallet_name):
+        """Create an empty wallet."""
+        cmd = f"{self.cli_cmd} -named createwallet wallet_name={wallet_name}"
+        self.assertRunOk(cmd)
+
+    def gen_btc_address(self, wallet_name):
+        """Generate an address in a wallet."""
+        cmd = f"{self.cli_cmd} -rpcwallet={wallet_name} getnewaddress"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        return out[0]
+
+    def init_wallet(self, wallet_name):
+        """Create a wallet and generate an address in it."""
+        self.create_btc_wallet(wallet_name)
+        return self.gen_btc_address(wallet_name)
+
+    def get_wallet_balance(self, wallet):
+        """Return the (confirmed) balance of a wallet."""
+        cmd = f"{self.cli_cmd} -rpcwallet={wallet} getbalance"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        return float(out[0])
+
+    def get_wallet_unconfirmed_balance(self, wallet):
+        """Return the unconfirmed balance of a wallet."""
+        cmd = f"{self.cli_cmd} -rpcwallet={wallet} getunconfirmedbalance"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        return float(out[0])
+
+    def get_block_count(self):
+        """Returns the height of the most-work fully-validated chain."""
+        cmd = f"{self.cli_cmd} getblockcount"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        return int(out[0])
+
+    def test_run(self):
+        drive = os.path.join(self.builddir, "images", "rootfs.ext4")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["root=/dev/vda console=ttyAMA0"],
+                           options=["-M", "virt",
+                                    "-cpu", "cortex-a53",
+                                    "-m", "256M",
+                                    "-drive", f"file={drive},if=virtio,format=raw"])
+        self.emulator.login()
+
+        # Values for the test.
+        wallet1 = "AliceWallet"
+        wallet2 = "BobWallet"
+        btc_test_amount = 10
+        btc_fee = 0.00001
+        req_blk_count = 101
+
+        # Check the binary can execute.
+        self.assertRunOk("bitcoind --version")
+
+        # This cleanup is useful when run-test -k is used. It makes
+        # this test idempotent. Since the drive storage is preserved
+        # between reboots, this cleanup will make sure the test always
+        # starts from a clean state.
+        cmd = "rm -rf ~/.bitcoin"
+        self.assertRunOk(cmd)
+
+        # The bitcoin daemon is not started. A client ping is expected
+        # to fail.
+        ping_cmd = f"{self.cli_cmd} ping"
+        _, ret = self.emulator.run(ping_cmd)
+        self.assertNotEqual(ret, 0)
+
+        # Start the daemon.
+        cmd = f"bitcoind -regtest -daemonwait -fallbackfee={btc_fee:f}"
+        self.assertRunOk(cmd)
+
+        time.sleep(2 * self.timeout_multiplier)
+
+        # Now the daemon is started, the ping is expected to succeed.
+        self.assertRunOk(ping_cmd)
+
+        # We create two wallets and addresses.
+        btc_addr1 = self.init_wallet(wallet1)
+        btc_addr2 = self.init_wallet(wallet2)
+
+        # Since the regression test block chain is at its genesis
+        # block, we expect a height of zero.
+        cur_blk_cnt = self.get_block_count()
+        self.assertEqual(cur_blk_cnt, 0)
+
+        # We also expect our wallets to be empty.
+        for wallet in [wallet1, wallet2]:
+            balance = self.get_wallet_balance(wallet)
+            self.assertAlmostEqual(balance, 0.0)
+
+        # We request the generation of several blocks for address
+        # #1. We should receive the 50 BTC reward at this address.
+        cmd = self.cli_cmd
+        cmd += f" generatetoaddress {req_blk_count} {btc_addr1}"
+        self.assertRunOk(cmd)
+
+        # We should now see the previously created blocks.
+        cur_blk_cnt = self.get_block_count()
+        self.assertEqual(cur_blk_cnt, req_blk_count)
+
+        # We should also see the 50 BTC reward in the wallet #1.
+        balance = self.get_wallet_balance(wallet1)
+        self.assertAlmostEqual(balance, 50.0)
+
+        # The wallet #2 should still be empty.
+        balance = self.get_wallet_balance(wallet2)
+        self.assertAlmostEqual(balance, 0.0)
+
+        # We send an amount from wallet #1 to #2.
+        cmd = f"{self.cli_cmd} -rpcwallet={wallet1}"
+        cmd += f" sendtoaddress {btc_addr2} {btc_test_amount}"
+        self.assertRunOk(cmd)
+
+        # The wallet #1 balance is expected to be subtracted by the
+        # spent amount and the transaction fees.
+        expected_balance = 50 - btc_test_amount - btc_fee
+        balance = self.get_wallet_balance(wallet1)
+        self.assertAlmostEqual(balance, expected_balance, places=4)
+
+        # The transaction is sent, but not confirmed yet. So we should
+        # still see a (confirmed) balance of zero.
+        balance = self.get_wallet_balance(wallet2)
+        self.assertAlmostEqual(balance, 0.0)
+
+        # We should see the transferred amount in the unconfirmed
+        # balance.
+        balance = self.get_wallet_unconfirmed_balance(wallet2)
+        self.assertAlmostEqual(balance, btc_test_amount)
+
+        # We generate 1 block to address #2. This action will confirm
+        # the previous transaction (but this will not give the 50 BTC
+        # reward).
+        cmd = f"{self.cli_cmd} generatetoaddress 1 {btc_addr2}"
+        self.assertRunOk(cmd)
+
+        # We should see one more block.
+        cur_blk_cnt = self.get_block_count()
+        self.assertEqual(cur_blk_cnt, req_blk_count + 1)
+
+        # We should now see the amount in the confirmed balance.
+        balance = self.get_wallet_balance(wallet2)
+        self.assertAlmostEqual(balance, btc_test_amount)
+
+        # The unconfirmed balance should now be zero.
+        balance = self.get_wallet_unconfirmed_balance(wallet2)
+        self.assertAlmostEqual(balance, 0.0)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
