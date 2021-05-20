From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 May 2021 11:38:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/environment-setup: Fix
 incorrect order of the `sed` expressions
In-Reply-To: <20210516141949.1271867-1-mgliga@bitdefender.com> (Mircea GLIGA's
 message of "Sun, 16 May 2021 17:19:49 +0300")
References: <20210516141949.1271867-1-mgliga@bitdefender.com>
Message-ID: <874kexagnu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mircea" == Mircea GLIGA <mgliga@bitdefender.com> writes:

 > Order of the `sed` expressions is important; when this was commited
 > to master, the order of the expressions from the original patch [1] was
 > changed, rendering the second expression to noop.

 > This made all the environment variables from the script to contain
 > absolute paths: long absolute paths makes verbose builds difficult
 > to read/follow.
 > We can take advantage of the fact that the PATH is updated and we
 > don't have to use absolute paths.

 > Fixed by reordering the `sed` expresions:
 > * first update the path of the binaries: e.g. 's%$(HOST_DIR)/bin/%%g'
 > * only then update remaining paths: e.g. 's%$(HOST_DIR)%\$$SDK_PATH%g'

 > [1] https://patchwork.ozlabs.org/project/buildroot/patch/20201027140140.47982-1-matthew.weber at rockwellcollins.com/

 > Signed-off-by: Mircea GLIGA <mgliga@bitdefender.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
