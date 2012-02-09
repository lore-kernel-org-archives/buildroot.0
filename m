From: Poole, Donald R. <drpoole@swri.org>
Date: Thu, 9 Feb 2012 06:49:24 +0000
Subject: [Buildroot] Buildroot RFS Login Question
In-Reply-To: <871uq44j0r.fsf@macbook.be.48ers.dk>
Message-ID: <CB58C6EF.2EFA%donald.poole@swri.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2/9/12 12:29 AM, "Peter Korsgaard" <jacmet@uclibc.org> wrote:

>>>>>> "Donald" == Poole, Donald R <drpoole@swri.org> writes:
>
>Hi,
>
> >> But in your original email you told us that you were getting that
> >> error. What changed?
>
> Donald> Ok, I found the problem. /bin/busybox wasn't setuid
> Donald> root. Changing the uid to root fixed the problem.  I thought
> Donald> buildroot did this automatically after installing to target?
>
>If you extract the tarball to your nfsroot as root, yes (or use one of
>the other filesystem outputs). You are not trying to use output/target
>directly, are you?
>
>-- 
>Bye, Peter Korsgaard

No, I am not. After I create an ext3 filesystem on my SD card (sudo
mkfs.ext3 /dev/sdc1 in my case) and mount the newly create filesystem
(sudo mount /dev/sdc1 /path/to/mount/point) is do a "sudo tar -xvf
rootfs.tar -C /path/to/mount/point".  So, when that is all said and done,
my filesystem is indeed owned by root, but the setuid bit for /bin/busybox
was not set.

Donald R. Poole, Jr.
Research Engineer
Voice: 210.522.3131 | Fax: 210.522.4931
Tactical Networks & Communications (tacticalnetworks.swri.org)
Southwest Research Institute (SwRI)
