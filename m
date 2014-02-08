From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 08 Feb 2014 22:59:35 +0100
Subject: [Buildroot] [PATCH v3 1/1] fs/ubi: add option to use custom
	ubinize config file
In-Reply-To: <CAAXf6LXL2kpsdZfWvGNudwMhgB3-y9ep1iX_QUc6AotB_EMVdw@mail.gmail.com>
 (Thomas De Schampheleire's message of "Fri, 7 Feb 2014 11:33:03
 +0100")
References: <1390971240-1436-1-git-send-email-danomimanchego123@gmail.com>
 <CAAXf6LXL2kpsdZfWvGNudwMhgB3-y9ep1iX_QUc6AotB_EMVdw@mail.gmail.com>
Message-ID: <87ha894660.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

Hi,

 > On Wed, Jan 29, 2014 at 5:54 AM, Danomi Manchego
 > <danomimanchego123@gmail.com> wrote:
 >> By default, the UBI FS target creates a ubinize configuration
 >> file on-the-fly, for a single volume.  Add an option to specify
 >> a custom config file.
 >> 
 >> E.g., one might want to deploy a system with a volume for the
 >> built ubifs image, a volume for a future upgrade image, and a
 >> volume for user data.
 >> 
 >> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
 >> 
 >> ---
 >> 
 >> v2 -> v3:
 >> Change "cp" to "$(INSTALL) -m 0644", in case $(UBINIZE_CONFIG_FILE_PATH)
 >> is read-only; this is in keeping with the recently committed patch
 >> series that address issues with read-only buildroot trees.

 > Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

 > Note that this patch would also fix bug #5780
 > (https://bugs.busybox.net/show_bug.cgi?id=5780).
 > If there are no blocking comments, I would propose to still merge it in 2014.02.

Ok - Committed, thanks.

-- 
Bye, Peter Korsgaard
