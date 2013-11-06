From: clshotwe at rockwellcollins.com <clshotwe@rockwellcollins.com>
Date: Wed, 6 Nov 2013 16:31:23 -0600
Subject: [Buildroot] [RFC] core: Download all package sources
In-Reply-To: <20131106231048.67cf2d52@skate>
References: <1383587286-18094-1-git-send-email-clshotwe@rockwellcollins.com>	<87eh6tkxuk.fsf@dell.be.48ers.dk>
 <20131106231048.67cf2d52@skate>
Message-ID: <OFB958AF8A.71CC6ECD-ON86257C1B.007ADE85-86257C1B.007B965F@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter and Thomas,

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on 11/06/2013 
04:10:48 PM:

> I'd really like allyespackageconfig to be the solution, because I don't
> really like the idea of dumping all make variables, grepping in there,
> and using that to download everything.
> 
> However, the big problem with allyespackageconfig is that it doesn't
> download everything. As soon as you have a "choice" in Config.in (be it
> for the package version, whether you want full X.org or KDrive X.org,
> or Busybox init vs. sysvinit vs. systemd), then your
> allyespackageconfig configuration is only going to contain the packages
> that correspond to *one* possible choice selection. That leaves a large
> number of packages that will not be downloaded.
> 
> Same thing for architecture dependent packages: grub depends on i386 or
> x86-64, but ti-gfx depends on arm.

That is exactly the problem I was running into. As for the grep concern, 
I have not found another way to implement it. I needed to have a full list
of all of the packages but I was not able to find said variable. I spent 
some time digging through the Kconfig stuff to see if there way a way to
get around all of the dependencies but I could not find an easy way. 

The only changes I would like to make would be to display more
information if packages fail to download or can't be downloaded because
of missing information.

Thanks,
Clayton

Clayton Shotwell
Software Engineer
clshotwe at rockwellcollins.com
www.rockwellcollins.com 
