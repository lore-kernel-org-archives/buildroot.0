Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C74BFCC068
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:51:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2283660DE3;
	Fri,  6 Mar 2026 19:51:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6kXkxelJE8jQ; Fri,  6 Mar 2026 19:51:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B366613C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826685;
	bh=tmEkRnacUZk3q/L1xYFm6z8A2VWrji05pcTQtCDZaO8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jk0kosPNtsmA83g30bAe9dAKEAa7IMDmN3iXh7t5TvMEAbLzkh6lCnV/GQbgFFObD
	 Vfus2qHyrubmAmf5rixo3J0fDSmvvrDUag4v89trW26cU5EYEA0Lcv8ZoGGm7xpMLu
	 sQ2qPWzb2IQWhl3CUyTINW8tlxzb5gAU+z1vAjwEf+55pZq4nf9Qiw1/tZwwxBlGU2
	 +lLHu3Wnw8Wh5i5YNhf3RxxCP+4M1i9o9bqEO3IRJw1ltxUM6mQyuqlbmvx9IO/03M
	 ECMs6c5+BFhNLWVsFD5YMmSkDWG+/YxDeSfGLPCMf6G8JU6srC61t70Su04NSk/Xa3
	 oM6MezgcMqHSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B366613C5;
	Fri,  6 Mar 2026 19:51:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1187D223
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B42BA613EF
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:50:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XkoudqPFj7Rk for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:50:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0223E613E9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0223E613E9
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:50:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1737A80090; Fri,  6 Mar 2026 19:50:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 14:13:18 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 4b06ddf1c41bad6ef7da35cdd352d3cfea47fb4f
X-Git-Newrev: 2ed5ee38069f01b24092a04de129ca326b37789b
X-Patchwork-Hint: ignore
Message-Id: <20260306195051.1737A80090@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x]
 support/testing/run-tests: unbreak on Debian testing/unstable
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2ed5ee38069f01b24092a04de129ca326b37789b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Commit 3d2141bcee("support/testing/run-tests: specify multiprocessing
method") added a call to multiprocessing.set_start_method('fork') as a
workaround for python 3.14, which changed the default start method to
forkserver - Which is incompatible with the nose2 setup.

multiprocessing.set_start_method() is only supposed to be called a maximum
of 1 time per process and throws a RuntimeError if called more than that
(even with the same arguments):

>>> import multiprocessing
>>> multiprocessing.set_start_method('fork')
>>> multiprocessing.set_start_method('fork')
Traceback (most recent call last):
  File "<python-input-2>", line 1, in <module>
    multiprocessing.set_start_method('fork')
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^
  File "/usr/lib/python3.13/multiprocessing/context.py", line 247, in set_start_method
    raise RuntimeError('context has already been set')

Debian included a similar patch in python3-nose2 0.51.1-2 (currently in
testing/unstable) which adds its own call to set_start_method():

https://salsa.debian.org/python-team/packages/nose2/-/blob/debian/0.15.1-2/debian/patches/0004-plugins-mp-set-context-to-fork-for-Python-3.14-mp-AP.patch?ref_type=tags

Which comes from:
https://github.com/nose-devs/nose2/pull/644

As discussed in the upstream PR, this is not a correct fix is wrong and
breaks various use cases.  An issue has been opened to get this fixed in the
Debian packaging at:

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1129350

But until that is done, rework the patch to:

- Only override set_start_method() if needed to limit impact
- Monkey patch set_start_method() so additional calls are ignored

To unbreak run-test on affected Debian systems and add some documentation to
make it clear why this is done.

[Peter: use allow_none / force optional arguments as pointed out by Julien]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 311e5cdc5151536ffc7280604e28de5f0fe245b5)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/run-tests | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/support/testing/run-tests b/support/testing/run-tests
index 1c4d2b4a85..2c7ce87c96 100755
--- a/support/testing/run-tests
+++ b/support/testing/run-tests
@@ -142,5 +142,15 @@ def main():
 
 
 if __name__ == "__main__":
-    multiprocessing.set_start_method("fork")
+    # python 3.14 changed default start method from fork to
+    # fork-server, which is not compatible with the nose2 setup
+    if multiprocessing.get_start_method(allow_none=True) != "fork":
+        multiprocessing.set_start_method("fork", force=True)
+        # set_start_method throws a RuntimeError if called more than
+        # once.
+        # Debian python3-nose2 0.15.1-2 includes a patch adding
+        # another set_start_method() call, so monkey patch it out to
+        # get rid of this
+        multiprocessing.set_start_method = lambda *args: None
+
     sys.exit(main())
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
