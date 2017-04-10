From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Apr 2017 10:45:30 +0200
Subject: [Buildroot] [PATCH/autobuild 2/8] autobuild-run: add '-d,
 --debug' option
In-Reply-To: <20170410102229.05f6fe68@free-electrons.com>
References: <20170409205128.11560-1-arnout@mind.be>
 <20170409205128.11560-2-arnout@mind.be>
 <20170410102229.05f6fe68@free-electrons.com>
Message-ID: <3e09ffd4-2e9c-67cb-1aeb-9b8f007fd9bd@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10-04-17 10:22, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun, 9 Apr 2017 22:51:22 +0200, Arnout Vandecappelle
> (Essensium/Mind) wrote:
> 
>> -    kwargs['log'] = open(os.path.join(idir, "instance.log"), "a+")
>> +    if kwargs['debug']:
>> +        kwargs['log'] = sys.stdout
>> +    else:
>> +        kwargs['log'] = open(os.path.join(idir, "instance.log"), "a+")
>>      log_write(kwargs['log'], "INFO: instance started")
> 
> How does this works when you have several instances running in
> parallel?
> 
> Everything gets mixed up on stdout?

 Indeed. I assume if you're debugging, you're not going to run several instances
in parallel.

 Anyway, if you don't want this feature, just drop it. It's something I used
while debugging the script and I thought could be useful for others as well.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
