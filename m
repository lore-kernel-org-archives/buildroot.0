From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 26 Mar 2009 18:02:51 +0100
Subject: [Buildroot] Bug in package/mtd/mtd-utils/mtd.mk
In-Reply-To: <20090326173347.148ab3da@surf> (Thomas Petazzoni's message of
	"Thu\, 26 Mar 2009 17\:33\:47 +0100")
References: <20090326173347.148ab3da@surf>
Message-ID: <87prg4gqtg.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The following bit of package/mtd/mtd-utils/mtd.mk doesn't work, since
 Thomas> DOWNLOAD is waiting for two arguments.

 Thomas> $(DL_DIR)/$(MTD_SOURCE):
 Thomas>         $(call DOWNLOAD,"$(MTD_URL)")

 Thomas> In my case, the $(DL_DIR)/$(MTD_SOURCE) is just doing nothing, and the
 Thomas> $(MTD_HOST_DIR)/.unpacked then fails while trying to extract the
 Thomas> downloaded archive.

Ahh, one more fallout from the WGET -> DOWNLOAD conversion. Will fix
shortly.

-- 
Bye, Peter Korsgaard
