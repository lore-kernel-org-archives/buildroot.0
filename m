From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 20 Aug 2016 10:52:22 -0300
Subject: [Buildroot] Analysis of build results for 2016-08-18
In-Reply-To: <20160820000709.0ceef3cd@free-electrons.com>
References: <20160819063024.55AF4101904@stock.ovh.net>
 <20160820000709.0ceef3cd@free-electrons.com>
Message-ID: <e2a40693-21a2-a9ed-ad7a-5fcce81aa927@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/08/16 19:07, Thomas Petazzoni wrote:

>>      aarch64 |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/3efe300199759fb84ad8122abc36bbcdfa10e0cd/
>
> error: conflicting types for 'khronos_uint64_t'
>
> Gustavo?

Hi.
This only happens when odroid-mali is the GL provider, i suspect they 
messed up something in there.
 From a quick look they define the khronos_uint64_t typedef in several 
places with no checks whatsoever, and that probably shouldn't be.
I suspect more of odroid-mali flakyness than libepoxy since it works 
with other providers just fine, i'll try to dig more info about it.
Regards.
