From: Sergio Monteiro Basto <sergio@sergiomb.no-ip.org>
Date: Wed, 24 Nov 2010 18:56:06 +0000
Subject: [Buildroot] [PATCH v2] zlib: fix shared lib logic for
 static-only targets
In-Reply-To: <87k4k268yo.fsf@macbook.be.48ers.dk>
References: <1290220539-11242-1-git-send-email-vapier@gentoo.org>
	<1290224711-21643-1-git-send-email-vapier@gentoo.org>
	<87k4k268yo.fsf@macbook.be.48ers.dk>
Message-ID: <1290624967.12564.5.camel@segulix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2010-11-24 at 16:24 +0100, Peter Korsgaard wrote:
> >>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:
> 
>  Mike> FLAT targets only support static libraries.  The zlib code atm though
>  Mike> assumes a libz.so is always created.  So have the targets check to see
>  Mike> if libz.so exists before trying to work with it.
> 
>  Mike> While we're here, also punt the package-local stripping.
> 
> Thanks, but I prefer to simply use zlib's own 'make install' instead,
> instead of repeating these steps 3 times. I've committed a change to do
> so in git.

hum there is a bug here in git ...

cd /home/sergio/hardware/moviecube/buildroot/output/build/zlib-1.2.5
/usr/bin/make -j1
-C /home/sergio/hardware/moviecube/buildroot/output/build/zlib-1.2.5
DESTDIR=/home/sergio/hardware/moviecube/buildroot/output/target install
make: Entering directory
`/home/sergio/hardware/moviecube/buildroot/output/build/zlib-1.2.5'
cp
libz.a /home/sergio/hardware/moviecube/buildroot/output/target/home/sergio/hardware/moviecube/buildroot/output/staging/usr/lib 

cp libz.a to output/staging/ instead output/target ? 
no worst , /home/sergio/hardware/moviecube/buildroot/output/target/
more /home/sergio/hardware/moviecube/buildroot/output/staging/usr/lib 

Best regards, 
-- 
S?rgio M. B.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/x-pkcs7-signature
Size: 3309 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101124/2eb49216/attachment.bin>
