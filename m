From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 06 Jun 2017 22:30:01 +0200
Subject: [Buildroot] [PATCH 1/1] Botan: Disable AltiVec if the CPU does
	not support it
In-Reply-To: <20170606214457.16bc49c4@free-electrons.com> (Thomas Petazzoni's
 message of "Tue, 6 Jun 2017 21:44:57 +0200")
References: <OF7D9B9E03.15B7CCDF-ONC1258137.004F93F6-C1258137.004F9406@rohde-schwarz.com>
 <20170606214457.16bc49c4@free-electrons.com>
Message-ID: <87tw3sc112.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Tue, 6 Jun 2017 16:29:11 +0200, Tobias.Blass at rohde-schwarz.com wrote:
 >> Botan compiles all PowerPC code with AltiVec support and only determines 
 >> at runtime
 >> whether the CPU even supports it. If the target CPU uses the older SPE 
 >> extensions, though,
 >> this is too late; since SPE and AltiVec are incompatible, gcc aborts the 
 >> compilation.
 >> This patch explicitly disables AltiVec support unless 
 >> BR2_POWERPC_CPU_HAS_ALTIVEC is defined
 >> 
 >> Signed-off-by: Tobias Blass <tobias.blass@rohde-schwarz.com>
 >> ---
 >> package/botan/botan.mk | 6 ++++++
 >> 1 file changed, 6 insertions(+)

 > Applied to master, thanks. Peter: since it apparently fixes a runtime
 > issue, I guess we could backport to LTS branch.

botan was bumped post-2017.05, but looking at the diff from 1.0.13 to
1.0.16, it looks like the older version has the same issue - So
committed to 2017.02.x and 2017.05.x, thanks.

-- 
Bye, Peter Korsgaard
