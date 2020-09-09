From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 09 Sep 2020 12:49:01 +0200
Subject: [Buildroot] [PATCH master] package/linux-headers: the latest
 headers are 5.8
In-Reply-To: <20200909102539.838996-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Wed, 9 Sep 2020 12:25:38 +0200")
References: <20200909102539.838996-1-thomas.petazzoni@bootlin.com>
Message-ID: <87blif5ioy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > In commit c2009e9f757fe759c74406f1025967b7b8e77f0a
 > ("package/linux-headers: license files hashes only valid for latest
 > version"), we introduced BR2_KERNEL_HEADERS_LATEST, which should only
 > be set for the most recent kernel headers versions.

 > Indeed, the COPYING file of Linux has changed before/after Linux 5.6,
 > causing its hash file to be different. Since linux-headers uses
 > linux/linux.hash as the hash file, and this hash file contains the
 > COPYING hash of Linux >= 5.6, we cannot use that hash for Linux
 > versions older than 5.6.

 > When newer versions of the headers than 5.4 were added, this
 > BR2_KERNEL_HEADERS_LATEST was not moved as it should have been. We fix
 > this, which fixes a legal-info failure happening when Linux kernel
 > headers 5.4 are used:

 >>>> linux-headers 5.4.63 Patching
 >>>> linux-headers 5.4.63 Collecting legal info
 > ERROR: COPYING has wrong sha256 hash:
 > ERROR: expected: fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0
 > ERROR: got     : ee5808b032a67f587d3541099d46de34f5bec8cd5976114ba07f1299ee6001ff
 > ERROR: Incomplete download, or man-in-the-middle (MITM) attack

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
