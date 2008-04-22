From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 22 Apr 2008 09:12:37 +0200
Subject: [Buildroot] Improper device nodes created
	inside	project_build_arm/uclibc/root/dev/
In-Reply-To: <16819059.post@talk.nabble.com> (Hebbar's message of "Mon\,
	21 Apr 2008 17\:12\:30 -0700 \(PDT\)")
References: <16803332.post@talk.nabble.com>
	<20080421140757.GC21702@cloud.net.au> <16819059.post@talk.nabble.com>
Message-ID: <87d4oiqs62.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hebbar" == Hebbar  <gururajakr@sanyo.co.in> writes:

 Hebbar> Hi,

 Hebbar>     I use the root directory as it is for nfs boot. i put
 Hebbar> this directory inside /etc/exports and mount it on my board
 Hebbar> at boot time. when i do this linux kernel and busybox
 Hebbar> complains about missing /dev/console, /dev/ttyAMA0.

Ahh, this is not how you should do it. Instead select the option to
create a tarball of the system and unpack it (with root permissions)
in your nfsroot.

-- 
Bye, Peter Korsgaard
