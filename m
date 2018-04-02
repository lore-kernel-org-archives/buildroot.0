From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 2 Apr 2018 22:18:58 +0200
Subject: [Buildroot] [PATCH 3/3] libvirt: new package
In-Reply-To: <20180402171955.0d091a53@windsurf>
References: <20171127104131.27975-1-casantos@datacom.ind.br>
 <20171127104131.27975-4-casantos@datacom.ind.br>
 <20180402171955.0d091a53@windsurf>
Message-ID: <7a127622-4281-479a-edb6-a7062c0d09a4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02-04-18 17:19, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 27 Nov 2017 08:41:31 -0200, Carlos Santos wrote:
[snip]
>> diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
>> new file mode 100644
>> index 0000000000..8e64c85188
>> --- /dev/null
>> +++ b/package/libvirt/Config.in
>> @@ -0,0 +1,44 @@
>> +config BR2_PACKAGE_LIBVIRT
>> +	bool "libvirt"
>> +	depends on !BR2_PACKAGE_NETCAT
> 
> Why do we need this if you select nmap-ncat below ?

 Because libvirt calls the 'nc' executable with the ncat command line arguments,
so it needs the nc -> ncat symlink, which is not created when netcat is installed.

 However, this makes me think: wouldn't it be easier to patch libvirt to call
ncat instead of nc?


 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
