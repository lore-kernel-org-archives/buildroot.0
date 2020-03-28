From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 28 Mar 2020 08:37:45 +0100
Subject: [Buildroot] [PATCH 1/3] Makefile: don't hang the build if there
 are no file lists
In-Reply-To: <20200318155814.567-1-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Wed, 18 Mar 2020 16:58:11 +0100")
References: <20200318155814.567-1-patrickdepinguin@gmail.com>
Message-ID: <87zhc1c4l2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > In very limited configurations, it is possible to have a case where no
 > .files-list-staging.txt files are created. In this case:

 > 	cat $(sort $(wildcard $(BUILD_DIR)/*/.files-list-staging.txt)) > \
 > 		$(BUILD_DIR)/packages-file-list-staging.txt

 > becomes:

 > 	cat > \
 > 		$(BUILD_DIR)/packages-file-list-staging.txt

 > which of course makes the build hang.. forever.

 > So we fix this by checking the list is not empty. To keep the code
 > readable, we introduce an intermediate variable to store the list of
 > these files.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
