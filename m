From: Steve Calfee <stevecalfee@gmail.com>
Date: Thu, 31 Mar 2011 10:13:46 -0700
Subject: [Buildroot] Buildroot in use
In-Reply-To: <4D8FCF30.1090209@gmail.com>
References: <1D6034426110564DA0DEA9EE9793B3835815AE17BF@NBE-MBX01.americas.swk.pri>	<20110315180743.5e34890b@surf>	<1D6034426110564DA0DEA9EE9793B3835815AE19D2@NBE-MBX01.americas.swk.pri>	<20110315192211.3c59f861@surf>	<1D6034426110564DA0DEA9EE9793B3835815AE1A1F@NBE-MBX01.americas.swk.pri>	<20110315210538.1973f87f@surf>	<779935.72384.qm@web161802.mail.bf1.yahoo.com>
	<1301253551.2716.46.camel@galileo.graphics-muse.org>
	<4D8FCF30.1090209@gmail.com>
Message-ID: <4D94B64A.4000207@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas and Peter,

I would like to know if you will accept a patch to implement the following.

On 03/27/11 16:58, Steve Calfee wrote:
> 
> I would like to ask Peter and Thomas what they think of changing the way 
> board support packages are handled. I think that buildroot also needs to 
> support more complete BSP packages which have common desires (booting 
> for USB or booting from NFS) available as options. But this is not great 
> for buildroot because it adds more downloads in a default git pull, it 
> adds bit-rotting code for BSPs, and puts a bigger burden on the core 
> buildroot maintainers.
> 
> What I propose is that BSPs be added just like any other package. A few 
> changes to the buildroot config would allow linking in the new_defconfig 
> for selected packages. The current buildroot config supports selecting 
> toolchain, kernel, u-boot, busybox etc, configs, locations of patches 
> for each, location of external placement of each, etc. As well as handy 
> skeleton updates or additions.  It would be nice if there was a way to 
> add some BSP configuration options - I think the config.in was removed 
> when the bsps were moved from target/device/* to board/manu/*.
> 
> Handling BSPs as packages would enable someone like me to have a github 
> git tree for a bsp, or put in the buildroot download a tar file which 
> can be selected, etc just like any other package. This way when a 
> developer pulls a new version of buildroot he is not also pulling in 
> lots of uninteresting (and possibly quite large) BSPs. But he can select 
> one that is very close to what he wants to use and get a more functional 
> initial package.
> 
> Since a complete set of configurations would be part of the package, bit 
> rot could be slowed. The package would select the latest version of each 
> major component that it was tested and built against. In the future if 
> someone wants to use an unsupported package, he may be able to build it 
> with old configurations and have a stable platform to bring the BSP up 
> to date.
> 
Regards, Steve
