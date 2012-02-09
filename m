From: Poole, Donald R. <drpoole@swri.org>
Date: Thu, 9 Feb 2012 15:16:53 +0000
Subject: [Buildroot] Buildroot RFS Login Question
In-Reply-To: <8762fg4em2.fsf@macbook.be.48ers.dk>
Message-ID: <CB593EC4.2F2F%donald.poole@swri.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2/9/12 2:04 AM, "Peter Korsgaard" <jacmet@uclibc.org> wrote:


>>>>>> "Donald" == Poole, Donald R <drpoole@swri.org> writes:
>
>Hi,
>
> >> If you extract the tarball to your nfsroot as root, yes (or use one of
> >> the other filesystem outputs). You are not trying to use output/target
> >> directly, are you?
>
> Donald> No, I am not. After I create an ext3 filesystem on my SD card
> Donald> (sudo mkfs.ext3 /dev/sdc1 in my case) and mount the newly
> Donald> create filesystem (sudo mount /dev/sdc1 /path/to/mount/point)
> Donald> is do a "sudo tar -xvf rootfs.tar -C /path/to/mount/point".
> Donald> So, when that is all said and done, my filesystem is indeed
> Donald> owned by root, but the setuid bit for /bin/busybox was not set.
>
>Setuid is handled by the device table. Do you have
>
>BR2_ROOTFS_DEVICE_TABLE="target/generic/device_table.txt"
>
>In your Buildroot .config?
>
>-- 
>Bye, Peter Korsgaard

Hmm, interestingly I do have that in my .config.  Why would it have failed
to execute the Setuid in this case?

Donald R. Poole, Jr.
Research Engineer
Voice: 210.522.3131 | Fax: 210.522.4931
Tactical Networks & Communications (tacticalnetworks.swri.org)
Southwest Research Institute (SwRI)
