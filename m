From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 21 Nov 2016 21:53:51 +0100
Subject: [Buildroot] [PATCH 4/4] qextserialport: fix static build
In-Reply-To: <20161121214125.2bb92b98@free-electrons.com>
References: <20161120221329.5827-1-arnout@mind.be>
 <20161120221329.5827-4-arnout@mind.be>
 <20161121214125.2bb92b98@free-electrons.com>
Message-ID: <9e55426c-e90e-6b11-752c-adba35813e23@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21-11-16 21:41, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun, 20 Nov 2016 23:13:29 +0100, Arnout Vandecappelle
> (Essensium/Mind) wrote:
>> By default, qextserialport will attempt to build a shared library.
>> qesp_static has to be set in CONFIG to build static. Note that
>> static+shared is not supported, in that case we just build shared.
>>
>> The install target commands also have to be gated in that case,
>> because the *.so files don't exist. For completeness we both set
>> QEXTSERIALPORT_INSTALL_STAGING to NO and don't define
>> QEXTSERIALPORT_INSTALL_TARGET_CMDS for static builds, although one
>> of them would be sufficient.
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/c9233ad71fd60d0e6a85731a8bd4e598bd84947a
>>
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> It's a bit annoying that this comes late in the series. Some of the
> rework in the previous patches are not technically needed to get this
> build fix, and with the way your patch series is organized, we have to
> merge more-or-less unrelated cleanups in master to get the build fix.

 Well, I considered patches 1 and 2 to be safe enough to be used even for
master. Just to give you the choice, I'll respin without patches 1 and 2 (but
without marking this series as superseded).

 Regards,
 Arnout

> 
> Patches 1/4 to 3/4 don't look too complicated, so maybe I'll merge.
> I'll just wait and see if people agree or not.
> 
> Best regards,
> 
> Thomas
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
