From: l m <lmmmcc@gmail.com>
Date: Wed, 17 Dec 2008 15:50:52 +0800
Subject: [Buildroot] hotplug lsof index libssp
In-Reply-To: <20081217064519.GA23637@cloud.net.au>
References: <6c8937b20812162140u6138e517n87fe31e24e82b7ba@mail.gmail.com>
	<20081217064519.GA23637@cloud.net.au>
Message-ID: <6c8937b20812162350r1d6aea89jc784100c7151b274@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2008/12/17 Hamish Moffatt <hamish@cloud.net.au>

> On Wed, Dec 17, 2008 at 01:40:41PM +0800, l m wrote:
> > Dear All,
> >
> > I've met some problems with recent buildroot versions.
> >
> > 1. hotplug: r24435
> > "cat package/hotplug/diethotplug-0.5.tar | tar -C
> > /opt/buildroot/build_i686   -xf -
> > tar: Skipping to next header
> > tar: Error exit delayed from previous errors
> > make: *** [/opt/buildroot/build_i686/diethotplug-0.5] Error 2"
> >
> > I've compared diethotplug-0.5.tar in different buildroot svn versions. In
> > r24435 the file size is 40951 Bytes, in another working version, it's
> 40960
> > Bytes. Is it this diethotplug-0.5.tar in r24435 corrupted?
>
> Yes it is. Thanks, I fixed it in r24436.
>
> > 2. lsof
> > The default lsof site ftp://lsof.itap.purdue.edu is not valid now. I use
>
> ? It looks ok to me.

ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/lsof_4.81.tar.bz2 Can you
download this link? This is the wget result.

" wget ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/lsof_4.81.tar.bz2
--2008-12-17 15:48:46--
ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/lsof_4.81.tar.bz2
           => `lsof_4.81.tar.bz2'
Resolving lsof.itap.purdue.edu... 128.210.7.20
Connecting to lsof.itap.purdue.edu|128.210.7.20|:21... connected.
Logging in as anonymous ...
Error in server greeting.
Retrying."

 Different browsers returned different results.
"530-The name server used by lsof.itap.purdue.edu cannot convert your
network."
 This is the error I met in Firefox. in IE, I can't log in using anonymous
account.

>
> > 3. index() function
> > Some packages still use index(), but default setting doesn't support it.
> Is
>
> Which packages?


I only tried tinylogin and syslogd.


>
>
>
> Hamish
> --
> Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
>
Regards.
LM
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20081217/37a65f8b/attachment.htm 
