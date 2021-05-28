From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 28 May 2021 21:59:24 +0200
Subject: [Buildroot] Verifying linux 5.4.x hashes
In-Reply-To: <BN8PR11MB366618492FB8C57A78D7752BFF229@BN8PR11MB3666.namprd11.prod.outlook.com>
References: <BN8PR11MB366618492FB8C57A78D7752BFF229@BN8PR11MB3666.namprd11.prod.outlook.com>
Message-ID: <7e2d0cc4-892e-177e-0e9c-935dfbea0c46@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28/05/2021 19:15, Ian Merin via buildroot wrote:
> Hello, -- question about verifying linux kernel hashes.? I see in the linux.hash
> file there is an entry for the latest 5.4.x version, but I dont see any way to
> actually download and verify that 5.4.x version against the hash in linux.hash
> 
> ?
> 
> What would be the method to have buildroot download the ?latest? 5.4.x kernel
> and also verify its hash against linux.hash?

 There isn't such a method.

 The same hash file is used by both linux and linux-headers. linux-headers
(which is used by the toolchain) has a choice between the still-maintained
stable branches, while linux itself only has the "latest" choice. The idea is
that for the headers, the risk is extremely low when you update them within the
same stable series, while for the kernel itself, there is significant risk of
breakage when it's updated under the hood.

 But, to be honest, I think the value of that choice in linux-headers is pretty
limited. In all my projects, I use the exact same version as the kernel (either
with the "Same as kernel" option, or with a manually specified version when the
kernel is built seperately).


 Regards,
 Arnout
