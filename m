From: Nathaniel Roach <nroach44@gmail.com>
Date: Sun, 19 Oct 2014 17:59:20 +0800
Subject: [Buildroot] [PATCH 1/1] bandwidthd: Version bump to handle
 indirect deps properly
In-Reply-To: <20141019094144.GL4072@free.fr>
References: <1413708943-13566-1-git-send-email-nroach44@gmail.com>
 <20141019094144.GL4072@free.fr>
Message-ID: <54438B78.1070805@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/10/14 17:41, Yann E. MORIN wrote:
> Nathaniel, All,
> 
> On 2014-10-19 16:55 +0800, Nathaniel Roach spake thusly:
>> Thanks to Romain Naor, Baruch Siach and Thomas Petazzoni, I've
> 
> Romain Naour, I believe... ;-)

Damn it...

> 
>> solved the build issues in certain cases for bandwidthd.
>>
>> The issue was that libpcap and libpng would depend on other libraries
>> and upon testing for pcap/libpng the tests would fail due to not
>> being able to find the other libraries.
>>
>> Bandwidthd's configure script now uses pkg-config for libpng
>> and pcap-config for libpcap. pcap-config's path is specified
>> in configure's arguments.
>>
>> Some other tweaks have been made including the layout and flow
>> of configure.ac is a bit more logical, and the handling of postgres
>> and sqlite has been tweaked. Finally, the test for X.Org has been
>> removed.
>>
>> Fixes: http://autobuild.buildroot.org/results/eb4/eb48acec37a7fd1714b267b105816bf0053d40e9/build-end.log
>> Signed-off-by: Nathaniel Roach <nroach44@gmail.com>
> 
> Usually, when some people helped with the patch, it is customary (but
> not mandatory) to add them in Cc: lines below the SoB line. ;-)
> 
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Regards,
> Yann E. MORIN.
> 

I'll send a fixed one through shortly.
