From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 17 Nov 2019 17:17:38 +0100
Subject: [Buildroot] Custom application on iso image
In-Reply-To: <1573461695009-0.post@n4.nabble.com>
References: <1573461695009-0.post@n4.nabble.com>
Message-ID: <51ba6e51-dd02-a6a9-8ea2-8f8c269fd7fc@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Anushka,

On 11/11/2019 09:41, a wrote:
> I have an exilir application, what procedure should I follow so that it's
> build directory is reflected in resulting iso image?

 Nobody answered this question, but that's probably because it's not clear what
you're asking.

 Assuming that you're building the iso image with buildroot, you just have to
make sure that the application ends up in TARGET_DIR (i.e. output/target), then
it will be included in the image. You can do this either by making a package for
your application [1] or with a filesystem overlay [2] or by
(downloading/building and) copying it in a post-build script [2 as well].

 Regards,
 Arnout

[1] https://buildroot.org/downloads/manual/manual.html#adding-packages
[2] https://buildroot.org/downloads/manual/manual.html#rootfs-custom

> 
> 
> 
> --
> Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
