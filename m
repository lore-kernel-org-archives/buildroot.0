From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Mar 2017 14:23:31 +0100
Subject: [Buildroot] [PATCH v4 2/3] Add LINUX_DIR to EXTRA_ENV for use
 in post-build scripts
In-Reply-To: <b7ac0faf-3b85-2439-1386-e181257c2d29@mind.be>
References: <1489664602-32596-1-git-send-email-abhimanyu.vishwakarma@imgtec.com>
 <1489664602-32596-2-git-send-email-abhimanyu.vishwakarma@imgtec.com>
 <b7ac0faf-3b85-2439-1386-e181257c2d29@mind.be>
Message-ID: <20170318142331.061e2cda@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 17 Mar 2017 23:39:46 +0100, Arnout Vandecappelle wrote:
> On 16-03-17 12:43, Abhimanyu V wrote:
> > From: Abhimanyu Vishwakarma <Abhimanyu.Vishwakarma@imgtec.com>
> > 
> > To build fitImage in post-build scripts, we need compressed
> > kernel binary which is intermediate target, hence doesnt get
> > copied to output/images folder.
> > 
> > Signed-off-by: Abhimanyu Vishwakarma <Abhimanyu.Vishwakarma@imgtec.com>
> > Reviewed-by: Rahul Bedarkar <Rahul.Bedarkar@imgtec.com>  
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

I am not sure about this one. Why would we pass in the environment
specifically LINUX_DIR, and not the <pkg>_DIR of the other ~2000
packages we have in Buildroot ?

What about instead using BR2_LINUX_KERNEL_VMLINUX_BIN, to get
vmlinux.bin copied to output/images, and then compress it in the
post-build script ?

Or alternatively, if there is a vmlinux.bin.gz target, add support for
it in our linux package?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
