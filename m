Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A5C7C433FE
	for <buildroot@archiver.kernel.org>; Thu, 29 Sep 2022 13:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 017D241B41;
	Thu, 29 Sep 2022 13:55:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 017D241B41
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6fGb3SEK9iBn; Thu, 29 Sep 2022 13:55:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8B3E40872;
	Thu, 29 Sep 2022 13:55:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8B3E40872
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 395DB1BF2B4
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 13:54:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1504B81CDC
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 13:54:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1504B81CDC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qo3qEYQWvfVx for <buildroot@lists.busybox.net>;
 Thu, 29 Sep 2022 13:54:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F15A181A8E
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F15A181A8E
 for <buildroot@buildroot.org>; Thu, 29 Sep 2022 13:54:55 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1EEEC240008;
 Thu, 29 Sep 2022 13:54:53 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1odu05-009aPk-9P; Thu, 29 Sep 2022 15:54:53 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <20220918134912.03172851A2@busybox.osuosl.org>
Date: Thu, 29 Sep 2022 15:54:53 +0200
In-Reply-To: <20220918134912.03172851A2@busybox.osuosl.org> (Arnout
 Vandecappelle's message of "Sun, 18 Sep 2022 15:36:36 +0200")
Message-ID: <87mtai8evm.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] utils/genrandconfig: disable
 libopenssl without atomics
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=af494d92d3d065a8939f0567bfbf312d177048f2
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > libopenssl needs atomic or the build will fail (e.g. on sparcv8 without
 > libatomic):

 > ${LDCMD:-/nvmedata/autobuild/instance-7/output-1/host/bin/sparc-buildroot-linux-uclibc-gcc}  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O0 -g2  -g2  -L.   \
 > 	-o apps/openssl apps/asn1pars.o apps/ca.o apps/ciphers.o apps/cms.o apps/crl.o apps/crl2p7.o apps/dgst.o apps/dhparam.o apps/dsa.o apps/dsaparam.o apps/ec.o apps/ecparam.o apps/enc.o apps/engine.o apps/errstr.o apps/gendsa.o apps/genpkey.o apps/genrsa.o apps/nseq.o apps/ocsp.o apps/openssl.o apps/passwd.o apps/pkcs12.o apps/pkcs7.o apps/pkcs8.o apps/pkey.o apps/pkeyparam.o apps/pkeyutl.o apps/prime.o apps/rand.o apps/rehash.o apps/req.o apps/rsa.o apps/rsautl.o apps/s_client.o apps/s_server.o apps/s_time.o apps/sess_id.o apps/smime.o apps/speed.o apps/spkac.o apps/srp.o apps/storeutl.o apps/ts.o apps/verify.o apps/version.o apps/x509.o \
 > 	 apps/libapps.a -lssl -lcrypto -ldl
 > /nvmedata/autobuild/instance-7/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: ./libssl.so: undefined reference to `__atomic_fetch_sub_4'

 > It should be noted that openssl3 has added OPENSSL_DEV_NO_ATOMICS but
 > "this is intended for internal development only, to check the
 > refcounting is properly coded.  It should never become a configuration
 > option, hence the name of the macro.":
 > https://github.com/openssl/openssl/commit/503d4745a115b82db01c1fb22baaddb153d27cdb

 > Atomics are not available in Buildroot if:
 >  - architecture is 32 bit and something other than ARM or xtensa, and
 >  - GCC < 4.8 or no threads or FLAT.

 > The nothreads case can theoretically happen in many different
 > situations, but in practice nobody disables threads. So the only
 > interesting case is the FLAT case. Since ARM and RISC-V 64 both have
 > atomics intrinsics, that leaves just m68k NOMMU as FLAT. So this is
 > truly a corner case.

 > The proper solution would be to patch GCC to also provide libatomic in
 > those cases.
 > - For nothreads, atomics are in fact not needed, so libatomic can simply
 >   be implemented as stubs.
 > - For FLAT, it's probably just a matter of having a match to uclinux in
 >   libatomic/configure.tgt.

 > Again, though, this happens only in such niche cases that it's not worth
 > working on it.

 > Fixes:
 >  - http://autobuild.buildroot.org/results/bce526d538f43a541fdfbc0c9b4a7cecebbbc539

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > Signed-off-by: Arnout Vandecappelle <arnout@mind.be>

Committed to 2022.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
