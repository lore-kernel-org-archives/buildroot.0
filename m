From: Poole, Donald R. <drpoole@swri.org>
Date: Thu, 9 Feb 2012 19:56:56 +0000
Subject: [Buildroot] Buildroot RFS Login Question
In-Reply-To: <87vcng3to7.fsf@macbook.be.48ers.dk>
Message-ID: <CB597E68.2F40%donald.poole@swri.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2/9/12 9:36 AM, "Peter Korsgaard" <jacmet@uclibc.org> wrote:


>>>>>> "Donald" == Poole, Donald R <drpoole@swri.org> writes:
>
>Hi,
>
> Donald> Hmm, interestingly I do have that in my .config.  Why would it
> Donald> have failed to execute the Setuid in this case?
>
>Sorry, no idea. Do you see it in the fakeroot invocation to create the
>tarball? Are the permissions in the tarball correct?
>
>E.G.:
>tar tvf output/images/rootfs.tar | grep '^-.*busybox'
>-rwsr-xr-x root/root    420472 2012-02-09 09:29 ./bin/busybox
>
>-- 
>Bye, Peter Korsgaard

This is the my tarball creation output:

	>>>   Generating root filesystem image rootfs.tar
	rm -f 
/opt/embedded-systems/armv7/buildroot-2011.11/output/build/_fakeroot.fs
	touch 
/opt/embedded-systems/armv7/buildroot-2011.11/output/build/.fakeroot.00000
	cat /opt/embedded-systems/armv7/buildroot-2011.11/output/build/.fakeroot*
> /opt/embedded-systems/armv7/buildroot-2011.11/output/build/_fakeroot.fs
	echo "chown -R 0:0
/opt/embedded-systems/armv7/buildroot-2011.11/output/target" >>
/opt/embedded-systems/armv7/buildroot-2011.11/output/build/_fakeroot.fs
	cat target/generic/device_table.txt  >
/opt/embedded-systems/armv7/buildroot-2011.11/output/build/_device_table.tx
t
	echo 
"/opt/embedded-systems/armv7/buildroot-2011.11/output/host/usr/bin/makedevs
 -d 
/opt/embedded-systems/armv7/buildroot-2011.11/output/build/_device_table.tx
t /opt/embedded-systems/armv7/buildroot-2011.11/output/target" >>
/opt/embedded-systems/armv7/buildroot-2011.11/output/build/_fakeroot.fs
	echo " tar -c""f 
/opt/embedded-systems/armv7/buildroot-2011.11/output/images/rootfs.tar -C
/opt/embedded-systems/armv7/buildroot-2011.11/output/target ." >>
/opt/embedded-systems/armv7/buildroot-2011.11/output/build/_fakeroot.fs
	chmod a+x 
/opt/embedded-systems/armv7/buildroot-2011.11/output/build/_fakeroot.fs
	/opt/embedded-systems/armv7/buildroot-2011.11/output/host/usr/bin/fakeroot
 -- /opt/embedded-systems/armv7/buildroot-2011.11/output/build/_fakeroot.fs
	rootdir=/opt/embedded-systems/armv7/buildroot-2011.11/output/target
	table='/opt/embedded-systems/armv7/buildroot-2011.11/output/build/_device_
table.txt'
	bzip2 -9 -c 
/opt/embedded-systems/armv7/buildroot-2011.11/output/images/rootfs.tar >
/opt/embedded-systems/armv7/buildroot-2011.11/output/images/rootfs.tar.bz2

So, I see it in the fakroot invocation and when I issue the command you
gave to check the permissions of the busybox binary, it get this output:

	-rwsr-xr-x root/root    621852 2012-02-09 13:43 ./bin/busybox

So, it appears that it's being set correctly too.

Donald R. Poole, Jr.
Research Engineer
Voice: 210.522.3131 | Fax: 210.522.4931
Tactical Networks & Communications (tacticalnetworks.swri.org)
Southwest Research Institute (SwRI)
