From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Mar 2017 09:10:06 +0200
Subject: [Buildroot] [PATCH] core/br2-external: properly report
	unexpected errors
In-Reply-To: <20170326234415.2192a445@free-electrons.com> (Thomas Petazzoni's
 message of "Sun, 26 Mar 2017 23:44:15 +0200")
References: <1485600092-963-1-git-send-email-yann.morin.1998@free.fr>
 <20170326234415.2192a445@free-electrons.com>
Message-ID: <87tw69x6pd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Sat, 28 Jan 2017 11:41:32 +0100, Yann E. MORIN wrote:
 >> Unextected error in the br2-external script are properly caught, but
 >> they are not reported properly, and we end up in either of two
 >> situations:
 >> 
 >> - the .br2-external.mk file is not generated, in which case make will
 >> try to find a rule to generate it (because the 'include' directive
 >> tries to generate missing files);
 >> 
 >> - the .br-external.mk file is generated but does not contain the error
 >> variable, and thus the build might not get interrupted.
 >> 
 >> We fix that by using a trap on the pseudo ERR signal, to emit the error
 >> variable on unexpected errors.
 >> 
 >> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 >> ---
 >> support/scripts/br2-external | 3 +++
 >> 1 file changed, 3 insertions(+)

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
