From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 15 Sep 2013 21:47:59 +0200
Subject: [Buildroot] [PATCHv2] Makefile: make $(BUILD_DIR)/.root rule
	idempotent
In-Reply-To: <1379273325-5933-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 15 Sep 2013 21:28:45 +0200")
References: <1379273325-5933-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <877gehlvdc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The $(BUILD_DIR)/.root rule is executed as part of the 'dirs'
 Thomas> target. The 'dirs' target is re-executed at every execution of 'make
 Thomas> external-deps', and make external-deps explicitly tells make to ignore
 Thomas> targets that have already been made (through the -B option). This
 Thomas> means that the $(BUILD_DIR)/.root rule has to be idempotant, which was
 Thomas> not the case this the introduction of the lib32/lib64 symbolic link.

 Thomas> Running 'make external-deps' three times in a row was sufficient to
 Thomas> trigger an error due to symbolic links being incorrectly created. This
 Thomas> patch fixes that.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas> This should probably be taken for 2013.08.1 as a fix of 'make
 Thomas> external-deps'.

 Thomas> Changes since v1:

 Thomas>  * Posted separately from the toolchain source patch set
 Thomas>  * Use ln -snf instead of if tests.

Committed, thanks.

-- 
Bye, Peter Korsgaard
