From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Dec 2018 08:50:28 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-12-16
In-Reply-To: <e74aed1a-dec1-7774-2739-7d7c7f2ed999@mind.be>
References: <20181217070031.7A1922072F@mail.bootlin.com>
 <875zvs4lwp.fsf@dell.be.48ers.dk>
 <20181217090810.18bfe9d0@windsurf>
 <871s6g4l29.fsf@dell.be.48ers.dk>
 <e74aed1a-dec1-7774-2739-7d7c7f2ed999@mind.be>
Message-ID: <20181218085028.14f371be@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 18 Dec 2018 00:43:07 +0100, Arnout Vandecappelle wrote:

> >  >> /bin/sh: /home/naourr/work/instance-0/output/host/bin/aarch64-linux-gnu-cc: No such file or directory
> >  >> 
> >  >> swupdate uses $CROSS-cc and not $CROSS-gcc, which not all external
> >  >> toolchain have. I think it makes sense to add a cc -> gcc symlink for
> >  >> external toolchains we download if not present. We cannot really do it
> >  >> for pre-installed external toolchains as we might not have write access
> >  >> to them.  
> 
>  So the symlink is then not a good solution IMO.

Yeah, I also find that the symlink approach is not good if it leaves on
the side the pre-installed external toolchains.

> > echo 'int main(void) { return 0; }' > test.c
> > make test
> > cc     test.c   -o test
> > 
> > So I think it makes sense to add the symlink for compatibility.  
> 
>  I disagree. We should always override CC, so the default 'cc' should never be used.
> 
>  The problem here is that we forget to pass TARGET_CONFIGURE_OPTS in the
> environment of swupdate.

Agreed :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
